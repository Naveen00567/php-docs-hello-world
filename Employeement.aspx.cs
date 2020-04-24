using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Employeement : System.Web.UI.Page
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



        loadEmployment();
    }

    protected void loadEmployment()
    {

        try
        {
            DataSet dsEmployeement;
            string strQuery, strUserID;

            strUserID = Session["UserID"].ToString();

            strQuery = "select Employement from tblEmployement where UserID='" + strUserID + "'  order by SNo desc";

            dsEmployeement = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

            gvEmployeer.DataSource = dsEmployeement;
            gvEmployeer.DataBind();
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


            String strQuery, strUserID, strEmployement;

            int intResult;



            strUserID = Session["UserID"].ToString();
            strEmployement = txtEmployement.Text;


            strQuery = "insert into tblEmployement values(";
            strQuery = strQuery + "'" + strUserID + "',";
            strQuery = strQuery + "'" + strEmployement + "')";


            intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

            if (intResult > 0)
            {

                lblMessage.Text = "Employment details added successfully";
                loadEmployment();

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
}