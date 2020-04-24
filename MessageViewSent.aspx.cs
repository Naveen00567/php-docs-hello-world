using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;

public partial class MessageViewSent : System.Web.UI.Page
{
    String strCon;
    String strMessageID;
    String strAttach;

    protected void Page_Load(object sender, EventArgs e)
    {
        strCon = System.Configuration.ConfigurationManager.ConnectionStrings["strcon"].ToString();

        strMessageID = Request.QueryString.Get("MessageID");
        strAttach = Request.QueryString.Get("attach");

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
            loadMessage();
        }

    }
    public void loadMessage()
    {
        try
        {
            string strQuery, strFrom_UserID, strTo_UserID, strSubject, strMessage, strStatus, strSent_Date, strUrl;
            DataSet dsMessage;
            int intResult;
            object[] Datas;
            strQuery = "select * from tblMessageSentItem where Message_Id='" + strMessageID + "'";
            dsMessage = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);
            intResult = dsMessage.Tables[0].Rows.Count;
            if (intResult > 0)
            {
                Datas = dsMessage.Tables[0].Rows[0].ItemArray;

                strFrom_UserID = Datas[1].ToString();
                strTo_UserID = Datas[2].ToString();
                strSubject = Datas[3].ToString();
                strMessage = Datas[4].ToString();

                strSent_Date = Datas[5].ToString();
                strUrl = Datas[6].ToString();

                lblFromUserID.Text = strFrom_UserID;
                lblToUserID.Text = strTo_UserID;
                lblSubject.Text = strSubject;

                Char[] strSplit = { '~' };
                String[] strMsgSig;

                strMsgSig = strMessage.Split(strSplit);

                txtMessage.Text = strMsgSig[0];
                lblDate.Text = strSent_Date;

                string[] fileName;
                if (strAttach != "none")
                {
                    fileName = strAttach.Split('/');
                    lbDownload.Text = fileName[1].ToString();
                }
                else
                {
                    lbDownload.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }

    protected void btnReplay_Click(object sender, EventArgs e)
    {
        try
        {
            Session["To"] = lblToUserID.Text;
            Session["From"] = lblFromUserID.Text;
            Session["Subject"] = "Re:" + lblSubject.Text;
            Session["Message"] = "\n\n\n\n\n\n\n\n\n Wrote...." + txtMessage.Text;
            Response.Redirect("MessageCompose.aspx", false);

        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
    }

    protected void btnForward_Click(object sender, EventArgs e)
    {

    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }

    protected void btnAddToAddressBook_Click(object sender, EventArgs e)
    {

    }
    protected void lbDownload_Click(object sender, EventArgs e)
    {
        try
        {
            string path = Server.MapPath("~/inbox/" + strAttach);
            WebClient req = new WebClient();
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();
            response.ClearContent();
            response.ClearHeaders();
            response.Buffer = true;
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + path + "\"");
            byte[] data = req.DownloadData(path);
            response.BinaryWrite(data);
            response.End();
        }
        catch(Exception ex)
        {
        }
    }
}