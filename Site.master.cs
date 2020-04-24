using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["UserID"] != null)
            {
                lnkLogin.Text = "Logout";
            }
        }
    }
    protected void lnkLogin_Click(object sender, EventArgs e)
    {
        if (lnkLogin.Text == "Login")
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}
