using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MessageCompose : System.Web.UI.Page
{
    String strCon;
    static string strMessageID;

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
        if (Session["To"] != null && Session["From"] != null && Session["Subject"] != null && Session["Message"] != null)
        {

            txtTo.Value = Session["To"].ToString();
            txtSubject.Text = Session["Subject"].ToString();
            txtMessage.Text = Session["Message"].ToString();

            Session["To"] = null;
            Session["Subject"] = null;
            Session["Message"] = null;
        }

        generateNewID();
    }

    protected void generateNewID()
    {
        try
        {

            // to generate BusID

            string strQuery;
            string strCurrentID;
            DataSet dsMessageID;
            int intCount;
            object[] Datas;
            strQuery = "select Message_id from  tblMessageID order by SNo desc";
            dsMessageID = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);
            intCount = dsMessageID.Tables[0].Rows.Count;
            if (intCount > 0)
            {

                Datas = dsMessageID.Tables[0].Rows[0].ItemArray;
                strCurrentID = Datas[0].ToString();
                strMessageID = clsDB.getNextId(strCurrentID);
            }
            else
            {
                strMessageID = "MSG10001";

            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;


        }
    }


    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            String strMessage_Id, strFrom_UserID, strTo_UserID, strSubject;
            String strMessage, strStatus, strReceived_Date, strUrl;
            String strQuery1, strQuery2, strQuery3;

            int intResult1, intResult2, intResult3;


            strMessage_Id = strMessageID;


            strTo_UserID = txtTo.Value;
            strSubject = txtSubject.Text;
            strMessage = txtMessage.Text;

            strFrom_UserID = Session["UserID"].ToString();

            strStatus = "Not Read";
            strReceived_Date = System.DateTime.Today.ToShortDateString();
            
            if ((string)Session["attach"] == null)
                Session["attach"] = "none";
            
            strUrl = "MessageView.aspx?MessageID=" + strMessageID + "&attach=" + Session["attach"].ToString();

            strQuery1 = "insert into tblMessageInbox values(";
            strQuery1 = strQuery1 + "'" + strMessageID + "',";
            strQuery1 = strQuery1 + "'" + strFrom_UserID + "',";
            strQuery1 = strQuery1 + "'" + strTo_UserID + "',";
            strQuery1 = strQuery1 + "'" + strSubject + "',";
            strQuery1 = strQuery1 + "'" + strMessage + "',";
            strQuery1 = strQuery1 + "'" + strStatus + "',";
            strQuery1 = strQuery1 + "'" + strReceived_Date + "',";
            strQuery1 = strQuery1 + "'" + strUrl + "')";


            intResult1 = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery1);

            strUrl = "MessageViewSent.aspx?MessageID=" + strMessageID + "&attach=" + Session["attach"].ToString();

            strQuery2 = "insert into tblMessageSentItem values(";
            strQuery2 = strQuery2 + "'" + strMessageID + "',";
            strQuery2 = strQuery2 + "'" + strFrom_UserID + "',";
            strQuery2 = strQuery2 + "'" + strTo_UserID + "',";
            strQuery2 = strQuery2 + "'" + strSubject + "',";
            strQuery2 = strQuery2 + "'" + strMessage + "',";
            strQuery2 = strQuery2 + "'" + strReceived_Date + "',";
            strQuery2 = strQuery2 + "'" + strUrl + "')";

            intResult2 = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery2);

            strQuery3 = "insert into tblMessageID values(";
            strQuery3 = strQuery3 + "'" + strMessage_Id + "')";

            intResult3 = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery3);

            if (intResult1 > 0 && intResult2 > 0 && intResult3 > 0)
            {
                // lblMessage.Text = "success";
                Session["Message"] = "Message Sent...";
                Response.Redirect("MessageSentItems.aspx", false);
            }
            else
            {
                lblMessage.Text = "Please try again later";
            }

        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;

        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblAttach.Text = Server.MapPath("~/inbox/" + Session["UserID"].ToString() + "/" + FileUpload1.FileName);
        FileUpload1.SaveAs(Server.MapPath("~/inbox/" + Session["UserID"].ToString() + "/" + FileUpload1.FileName));
        Session["attach"] = Session["UserID"].ToString() + "/" + FileUpload1.FileName;
        lblAttach.Text = "File attached to mail and ready to be sent.";
    }
}