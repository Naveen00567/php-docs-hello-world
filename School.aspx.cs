using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class School : System.Web.UI.Page
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


        loadSchool();
    }

    protected void loadSchool()
    {

        try
        {
            DataSet dsSchool;
            string strQuery, strUserID;
            strUserID = Session["UserID"].ToString();

            strQuery = "select School from tblSchool where UserID='" + strUserID + "' order by SNo desc";

            dsSchool = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

            gvSchool.DataSource = dsSchool;
            gvSchool.DataBind();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {


        try
        {


            String strQuery, strUserID, strSchool;

            int intResult;



            strUserID = Session["UserID"].ToString();
            strSchool = txtSchool.Text;


            strQuery = "insert into tblSchool values(";
            strQuery = strQuery + "'" + strUserID + "',";
            strQuery = strQuery + "'" + strSchool + "')";


            intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

            if (intResult > 0)
            {

                lblMessage.Text = "Educational details added successfully";
                loadSchool();



            }
            else
            {
                lblMessage.Text = "Please try again later!";

            }






        }
        catch (Exception ex)
        {

            lblMessage.Text = ex.Message.ToString();



        }



    }
    protected void txtSchool_TextChanged(object sender, EventArgs e)
    {

    }
}