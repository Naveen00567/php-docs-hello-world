using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FriendsRequest : System.Web.UI.Page
{
    string strCon;
    protected void Page_Load(object sender, EventArgs e)
    {
        strCon = System.Configuration.ConfigurationManager.ConnectionStrings["strcon"].ToString();

        Session["Status"] = "Request";
        if (Session["UserID"] != null)
        {
            lblName.Text = Session["UserName"].ToString();
        }
        else
        {
            Response.Redirect("login.aspx", false);
        }
    }

    protected void gvFriends_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        try
        {
            String strUserID;
            strUserID = gvFriends.DataKeys[e.NewSelectedIndex].Values[0].ToString();
            Session["FriendID"] = strUserID;
            Response.Redirect("RequestedProfile.aspx", false);
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }
    }

    protected void gvFriends_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}