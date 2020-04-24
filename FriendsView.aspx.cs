using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FriendsView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            lblName.Text = Session["UserName"].ToString();

        }
        else
        {

            Response.Redirect("login.aspx", false);
        }

        Session["Control"] = "Friend";
        Session["Status"] = "Confirmed";

        if (Session["Message"] != null)
        {
            lblMessage.Text = Session["Message"].ToString();

            Session["Message"] = null;
        }
    }

    protected void gvFriends_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

        try
        {
            String strUserID;

            strUserID = gvFriends.DataKeys[e.NewSelectedIndex].Values[0].ToString();

            Session["ProfileID"] = strUserID;
            Session["Status"] = "Confirmed";

            Response.Redirect("ProfileView.aspx", false);
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