using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class NewsFeed : System.Web.UI.Page
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
        loadNews();
    }

    protected void loadNews()
    {
        DataSet dsNews;
        string strQuery=string.Empty; 
        string strUserID=string.Empty;
        DataSet dsFriends;
        int intResult;
        Object[] Datas;

        try
        {
            strUserID = Session["UserID"].ToString();
        }
        catch
        {
            Response.Redirect("~/login.aspx");
        }
        string strCondition;

        strCondition = "where UserID='";
        strQuery = "select FriendsID from tblFriendsList where userID='" + strUserID + "'";
        dsFriends = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);
        intResult = dsFriends.Tables[0].Rows.Count;

        if (intResult > 0)
        {
            for (int intI = 0; intI < intResult; intI++)
            {
                Datas = dsFriends.Tables[0].Rows[intI].ItemArray;
                strCondition = strCondition + Datas[0].ToString() + "' OR UserID='";
            }
        }
        strCondition = strCondition + strUserID + "'";
        strQuery = "select UserName,News,ShareImage from tblNewsFeed " + strCondition + " order by SNo desc";
        dsNews = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

        gvNewsFeed.DataSource = dsNews;
        gvNewsFeed.DataBind();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        String strQuery, strUserID, strUserName, strNews, strRemarks;
        int intResult;

        try
        {
            strUserID = Session["UserID"].ToString();
            strUserName = Session["UserName"].ToString();
            strNews = txtNews.Text;
            strRemarks = "Remarks";
            int rating = 0;

            strQuery = "insert into tblNewsFeed values(";
            strQuery = strQuery + "'" + strUserID + "',";
            strQuery = strQuery + "'" + strUserName + "',";
            strQuery = strQuery + "'" + strNews + "',";
            strQuery = strQuery + "'" + strRemarks + "',";
            strQuery = strQuery + "'" + imgFeed.ImageUrl + "',";
            strQuery = strQuery+ "" + rating +")";

            intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

            if (intResult > 0)
            {
                loadNews();
            }
            else
            {
                lblMessage.Text = "Please try again later !";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }

    }
    protected void btn_Click(object sender, EventArgs e)
    {
        FileUpload1.SaveAs(Server.MapPath("~/upload/" + FileUpload1.FileName));
        imgFeed.ImageUrl = "~/upload/" + FileUpload1.FileName;
    }
}