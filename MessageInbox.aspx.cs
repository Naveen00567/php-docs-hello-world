using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MessageInbox : System.Web.UI.Page
{
    String strCon;

    protected void Page_Load(object sender, EventArgs e)
    {
        strCon = System.Configuration.ConfigurationManager.ConnectionStrings["strcon"].ToString();
        if (Session["UserID"] != null)
        {
            lblName.Text = Session["UserName"].ToString();

        }
        else
        {

            Response.Redirect("login.aspx", false);
        }

        if (!IsPostBack)
        {
            loadMessageInbox();
        }

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            fnDelete(sender, e);
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;

        }

    }
    public void fnDelete(object sender, EventArgs e)
    {

        try
        {
            String strMessage_ID = "";
            foreach (DataGridItem ob in DgMessageInbox.Items)
            {
                if (ob.ItemType != ListItemType.Header && ob.ItemType != ListItemType.Footer && ob.ItemType != ListItemType.Pager)
                {
                    bool ChkSelected1;
                    CheckBox chkBox;
                    chkBox = (CheckBox)(ob.Cells[0].FindControl("cbSelected"));
                    ChkSelected1 = chkBox.Checked;


                    if (ChkSelected1 == true)
                    {
                        strMessage_ID = strMessage_ID + DgMessageInbox.DataKeys[ob.ItemIndex].ToString() + ",";
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
                    strQuery = "delete from tblMessageInbox where Message_Id='" + strMessageID + "'";

                    intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

                }
                if (intResult > 0)
                {
                    Session["Message"] = "Message Deleted Succssfully!";
                    Response.Redirect("MessageInbox.aspx", false);

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


    protected void loadMessageInbox()
    {
        try
        {

            string strQuery, strUserID = "";
            DataSet dsMessageInbox;

            int intCount;



            strUserID = Session["UserID"].ToString();



            //strRouteID = ddlRouteID.SelectedItem.Text;
            strQuery = "select * from tblMessageInbox where To_UserID='" + strUserID + "' order by Message_Id desc";
            dsMessageInbox = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);
            intCount = dsMessageInbox.Tables[0].Rows.Count;
            DgMessageInbox.DataSource = dsMessageInbox;
            DgMessageInbox.DataBind();



        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;


        }

    }


    protected void DgMessageInbox_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void btnMarkAsUnRead_Click(object sender, EventArgs e)
    {
        try
        {
            String strMessage_ID = "";
            foreach (DataGridItem ob in DgMessageInbox.Items)
            {
                if (ob.ItemType != ListItemType.Header && ob.ItemType != ListItemType.Footer && ob.ItemType != ListItemType.Pager)
                {
                    bool ChkSelected1;
                    CheckBox chkBox;
                    chkBox = (CheckBox)(ob.Cells[0].FindControl("cbSelected"));
                    ChkSelected1 = chkBox.Checked;


                    if (ChkSelected1 == true)
                    {
                        strMessage_ID = strMessage_ID + DgMessageInbox.DataKeys[ob.ItemIndex].ToString() + ",";
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
                    strQuery = "update tblMessageInbox set status='Not Read' where Message_Id='" + strMessageID + "'";

                    intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

                }
                if (intResult > 0)
                {
                    //Session["Message"] = "Message Deleted Succssfully!";
                    Response.Redirect("MessageInbox.aspx", false);

                }
                else
                {
                    lblMessage.Text = "Unable to proceed. Please try again later!";


                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;


            }

        }
        catch { }
    }
}