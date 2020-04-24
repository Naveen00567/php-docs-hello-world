using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public partial class Profiles : System.Web.UI.Page
{
    string strCon;
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


        loadProfile();


    }


    protected void loadProfile()
    {

        string strQuery;
        int intResult;
        DataSet dsProfile, dsPrivacy;
        Object[] Data;
        Object[] Datas;
        string strUserName, strGender, strDOB, strEMailID, strMobileNumber, strAddress, strPublicKey, strPrivateKey;
        string strDOB_Privacy, strEMailID_Privacy, strMobileNumber_Privacy, strAddress_Privacy;
        string strUserID = string.Empty;
        try
        {
            strUserID = Session["UserID"].ToString();
        }
        catch
        {
            Response.Redirect("~/login.aspx");
        }

        try
        {
            strQuery = "select DOB_Privacy,EmailID_Privacy,MobileNumber_Privacy,Address_Privacy from tblPrivacy where UserID='" + strUserID + "'";

            dsPrivacy = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

            intResult = dsPrivacy.Tables[0].Rows.Count;


            if (intResult > 0)
            {
                Datas = dsPrivacy.Tables[0].Rows[0].ItemArray;

                strDOB_Privacy = Datas[0].ToString();
                strEMailID_Privacy = Datas[1].ToString();
                strMobileNumber_Privacy = Datas[2].ToString();
                strAddress_Privacy = Datas[3].ToString();




                strQuery = "select UserName,Gender,DOB,EMailID,MobileNumber,Address,PublicKey,PrivateKey,Photo from tblRegistration where UserID='" + strUserID + "'";
                dsProfile = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

                intResult = dsProfile.Tables[0].Rows.Count;

                if (intResult > 0)
                {
                    Data = dsProfile.Tables[0].Rows[0].ItemArray;
                    strUserName = Data[0].ToString();
                    strGender = Data[1].ToString();
                    strDOB = Data[2].ToString();
                    strEMailID = Data[3].ToString();
                    strMobileNumber = Data[4].ToString();
                    strAddress = Data[5].ToString();
                    strPrivateKey = Data[6].ToString();
                    strPublicKey = Data[7].ToString();
                    string photoPath = Data[8].ToString();

                    imgPhoto.ImageUrl = "~/" + photoPath;

                    //txtUserName.Text = strUserName;
                    //if (strGender.Equals("Male"))
                    //{
                    //    rbtnMale.Checked = true;
                    //}
                    //else
                    //{
                    //    rbtnFemale.Checked = true;
                    //}


                    if (strDOB_Privacy.Equals("Private Shareable"))
                    {
                        strDOB = Decrypt.DecryptString(strDOB, 1024, strPublicKey);

                    }
                    else if (strDOB_Privacy.Equals("Private Not Shareable"))
                    {
                        strDOB = Decrypt.DecryptString(strDOB, 1024, strPublicKey);
                        strDOB = Decrypt.DecryptString(strDOB, 1024, strPublicKey);


                    }
                    else if (strDOB_Privacy.Equals("Public"))
                    {
                        //strDOB = strDOB;

                    }




                    if (strEMailID_Privacy.Equals("Private Shareable"))
                    {

                        strEMailID = Decrypt.DecryptString(strEMailID, 1024, strPublicKey);




                    }
                    else if (strEMailID_Privacy.Equals("Private Not Shareable"))
                    {
                        strEMailID = Decrypt.DecryptString(strEMailID, 1024, strPublicKey);
                        strEMailID = Decrypt.DecryptString(strEMailID, 1024, strPublicKey);

                    }
                    else if (strEMailID_Privacy.Equals("Public"))
                    {
                        //strEMailID = strEMailID;

                    }


                    if (strMobileNumber_Privacy.Equals("Private Shareable"))
                    {


                        strMobileNumber = Decrypt.DecryptString(strMobileNumber, 1024, strPublicKey);



                    }
                    else if (strMobileNumber_Privacy.Equals("Private Not Shareable"))
                    {
                        strMobileNumber = Decrypt.DecryptString(strMobileNumber, 1024, strPublicKey);
                        strMobileNumber = Decrypt.DecryptString(strMobileNumber, 1024, strPublicKey);

                    }
                    else if (strMobileNumber_Privacy.Equals("Public"))
                    {
                        //strMobileNumber = strMobileNumber;

                    }


                    if (strAddress_Privacy.Equals("Private Shareable"))
                    {
                        strAddress = Decrypt.DecryptString(strAddress, 1024, strPublicKey);

                    }
                    else if (strAddress_Privacy.Equals("Private Not Shareable"))
                    {
                        strAddress = Decrypt.DecryptString(strAddress, 1024, strPublicKey);
                        strAddress = Decrypt.DecryptString(strAddress, 1024, strPublicKey);

                    }
                    else if (strAddress_Privacy.Equals("Public"))
                    {
                        //strAddress = strAddress;

                    }




                    //txtDOB.Text = strDOB;
                    //txtEmailID.Text = strEMailID;
                    //txtMobileNumber.Text = strMobileNumber;
                    //txtAddress.Text = strAddress;



                }
                else
                {

                    lblMessage.Text = "There is no profile data available";
                }
            }
            else
            {
                lblMessage.Text = "There is no profile data available";

            }


        }
        catch (Exception ex)
        {


        }

    }

    protected void btnChangeImg_Click(object sender, EventArgs e)
    {

        try
        {
            string strFileNameOnServer = System.IO.Path.GetFileName(fyPhoto.PostedFile.FileName);
            string strBaseLocation = Server.MapPath("~/photos/");
            if (fyPhoto.PostedFile != null)
            {
                fyPhoto.PostedFile.SaveAs(strBaseLocation + strFileNameOnServer);
            }

            string strQuery = "UPDATE  tblRegistration SET Photo=@Photo WHERE UserId=@UserID";

            Hashtable htReigstration = new Hashtable();
            SqlParameter Param;

            SqlConnection connection = new SqlConnection(strCon);

            connection.Open();
            SqlCommand cmd = new SqlCommand(strQuery, connection);
            Param = new SqlParameter();
            Param.ParameterName = "@Photo";
            Param.DbType = DbType.String;
            Param.SqlDbType = SqlDbType.VarChar;
            Param.Direction = ParameterDirection.Input;
            Param.Value = "photos/" + fyPhoto.PostedFile.FileName;
            string filePath = "~/photos/" + fyPhoto.PostedFile.FileName;
            htReigstration.Add(1, Param);

            Param = new SqlParameter();
            Param.ParameterName = "@UserID";
            Param.DbType = DbType.String;
            Param.SqlDbType = SqlDbType.VarChar;
            Param.Direction = ParameterDirection.Input;
            Param.Value = Session["UserId"].ToString();
            htReigstration.Add(2, Param);

            btnChangeImg.Text = "Change Image" + " (Updating...)";

            int Result = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery, htReigstration);

            if (Result > 0)
            {
                btnChangeImg.Text = "Change Image" + " (Updated)";
                imgPhoto.ImageUrl = filePath;
            }
            else
            {
                btnChangeImg.Text = "Change Image" + " (Not Updated)";
            }
        }
        catch
        {
            btnChangeImg.Text = "Change Image" + " (Not Updated)";
        }

    }

}