using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MessageSentItems : System.Web.UI.Page
{
    String strCon;

    protected void Page_Load(object sender, EventArgs e)
    {
        strCon = System.Configuration.ConfigurationManager.ConnectionStrings["strcon"].ToString();

        if (!IsPostBack)
        {

            if (Session["UserID"] != null)
            {
                lblName.Text = Session["UserName"].ToString();

            }
            else
            {

                Response.Redirect("login.aspx", false);
            }

            if (Session["Message"] != null)
            {
                lblMessage.Text = Session["Message"].ToString();
                Session["Message"] = null;

            }


            loadMessageSentItem();
        }

    }

    public void fnDeleteMessage(object sender, EventArgs e)
    {
        try
        {
            String strMessage_ID = "";
            foreach (DataGridItem ob in dgMessageSentItem.Items)
            {
                if (ob.ItemType != ListItemType.Header && ob.ItemType != ListItemType.Footer && ob.ItemType != ListItemType.Pager)
                {
                    bool ChkSelected1;
                    CheckBox chkBox;
                    chkBox = (CheckBox)(ob.Cells[0].FindControl("cbSelected"));
                    ChkSelected1 = chkBox.Checked;


                    if (ChkSelected1 == true)
                    {
                        strMessage_ID = strMessage_ID + dgMessageSentItem.DataKeys[ob.ItemIndex].ToString() + ",";
                    }
                }

            }
            bool boolContains;
            char[] ch = { ',' };
            String[] strIDS = { "" };

            boolContains = strMessage_ID.Contains(",");

            if (boolContains)
            {
                strMessage_ID = strMessage_ID.Substring(0, strMessage_ID.Length - 1);
                strIDS = strMessage_ID.Split(ch);


            }


            try
            {
                int intI, intL;
                intL = strIDS.Length;
                String strMessageID;
                String strQuery;

                int intResult = 0;

                for (intI = 0; intI < intL; intI++)
                {


                    strMessageID = strIDS[intI];
                    strQuery = "delete from tblMessageSentItem where Message_Id='" + strMessageID + "'";

                    intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

                }
                if (intResult > 0)
                {
                    Session["Message"] = "Message Deleted Succssfully!";
                    Response.Redirect("MessageSentItems.aspx", false);

                }
                else
                {
                    lblMessage.Text = "Please try again later!";


                }

            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;


            }

        }

        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;


        }


    }

    protected void loadMessageSentItem()
    {
        try
        {

            string strQuery, strUserID = "";
            DataSet dsMessageInbox;

            int intCount;

            //    if (Session["UserID"] != null)
            //  {
            //  strUserID = Session["UserID"].ToString();

            strUserID = Session["UserID"].ToString();

            //}

            //strRouteID = ddlRouteID.SelectedItem.Text;
            strQuery = "select * from tblMessageSentItem where From_UserID='" + strUserID + "' order by Message_Id desc";
            dsMessageInbox = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);
            intCount = dsMessageInbox.Tables[0].Rows.Count;
            dgMessageSentItem.DataSource = dsMessageInbox;
            dgMessageSentItem.DataBind();



        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;


        }

    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {

    }

    protected void dgMessageSentItem_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}