using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    String strCon;

    protected void Page_Load(object sender, EventArgs e)
    {
        strCon = System.Configuration.ConfigurationManager.ConnectionStrings["strcon"].ToString();

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string strUserID, strPassword;
            string strQuery1;
            DataSet dsUserID;
            strUserID = txtUserID.Text;
            strPassword = txtPassword.Text;

            if (strUserID.Equals("") || strPassword.Equals(""))
            {
                lblMessage.Text = "Please enter all details.";
                return;
            }

            if (strUserID == "admin" && strPassword == "pass")
            {
                Response.Redirect("adminpage.aspx");
            }
            else
            {
                strQuery1 = "select UserID,UserName from tblRegistration where ";
                strQuery1 = strQuery1 + "UserID='" + strUserID + "'";
                strQuery1 = strQuery1 + "and Password='" + strPassword + "'";


                dsUserID = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery1);

                if (dsUserID.Tables[0].Rows.Count <= 0)
                {

                    lblMessage.Text = "Wrong UserID or Password!";
                }
                else
                {
                    //strUserName = dsUserID.Tables[0].Rows[0]["UserName"].ToString() ; 
                    Session["UserID"] = dsUserID.Tables[0].Rows[0]["UserID"].ToString();
                    Session["UserName"] = dsUserID.Tables[0].Rows[0]["UserName"].ToString();

                    //Response.Redirect("MessageCompose.aspx", false);

                    Response.Redirect("Biometric.aspx", false);

                }




            }



        }
        catch (Exception ex)
        {
            string ss = ex.Message.ToString();
            string sss = ss;
        }

    }

    protected void btnSubmit1_Click(object sender, EventArgs e)
    {
        try
        {

            Response.Redirect("SignUp.aspx", false);
        }
        catch (Exception ex)
        {
            string ss = ex.Message.ToString();
            string sss = ss;
        }


    }
}
