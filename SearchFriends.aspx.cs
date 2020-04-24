using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SearchFriends : System.Web.UI.Page
{
    String strCon;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
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



        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {


    }

    protected void btnName_Click(object sender, EventArgs e)
    {
        string strQuery, strName;
        int intResult;
        DataSet dsFriends;
        Object[] Datas;

        lblMessage.Text = "";

        try
        {
            //  strName=txtName.Text;
            //  strQuery= "select UserId,UserName,EmailId,MobileNumber from tblRegistration where UserName  like '%" +strName + "%'" ;

            //dsFriends=clsDB.fnAdapterFill(strCon,CommandType.Text,strQuery);

            //   intResult = dsFriends.Tables[0].Rows.Count;

            //    if(intResult>0)
            //    {
            //    gvFriends.DataSource=dsFriends;
            //        gvFriends.DataBind();
            //    }



        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }
    }

    protected void btnEmail_Click(object sender, EventArgs e)
    {
        string strQuery, strEmailID;
        int intResult;
        DataSet deFriends;
        Object[] Datas;

        try
        {



        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }
    }

    protected void btnSchool_Click(object sender, EventArgs e)
    {
        string strQuery, strSchool;
        int intResult;
        DataSet deFriends;
        Object[] Datas;

        try
        {



        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }

    }

    protected void btnEmployeer_Click(object sender, EventArgs e)
    {
        string strQuery, strEmployeer;
        int intResult;
        DataSet deFriends;
        Object[] Datas;

        try
        {



        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }
    }

    protected void gvFriends_SelectedIndexChanged(object sender, EventArgs e)
    {

        string ss = "Hellow";
    }

    protected void gvFriends_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        String strUserID;

        strUserID = gvFriends.DataKeys[e.NewSelectedIndex].Values[0].ToString();

        Session["ProfileID"] = strUserID;

        Response.Redirect("ProfileView.aspx", false);
    }
}