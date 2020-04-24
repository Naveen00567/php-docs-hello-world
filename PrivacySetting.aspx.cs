using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PrivacySetting : System.Web.UI.Page
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



    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {

        String strQuery;
        string strUserID, strDOB_Privacy, strEMailID_Privacy;
        String strMobileNumber_Privacy, strAddress_Privacy;
        string strDOB = "", strEmailID = "", strMobileNumber = "", strAddress = "";
        string strPrivateKey = "", strPublicKey = "";


        int intResult;
        strUserID = Session["UserID"].ToString();

        DataSet dsUser, dsPrivacy;

        Object[] Datas;




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

                strQuery = "select DOB,EmailID,MobileNumber,Address,PublicKey,PrivateKey from tblRegistration where UserID='" + strUserID + "'";

                dsUser = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

                intResult = dsUser.Tables[0].Rows.Count;


                if (intResult > 0)
                {
                    Datas = dsUser.Tables[0].Rows[0].ItemArray;
                    strDOB = Datas[0].ToString();
                    strEmailID = Datas[1].ToString();
                    strMobileNumber = Datas[2].ToString();
                    strAddress = Datas[3].ToString();
                    strPublicKey = Datas[5].ToString();
                    strPrivateKey = Datas[4].ToString();


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
                        strDOB = strDOB;

                    }

                    if (strEMailID_Privacy.Equals("Private Shareable"))
                    {

                        strEmailID = Decrypt.DecryptString(strEmailID, 1024, strPublicKey);

                    }
                    else if (strEMailID_Privacy.Equals("Private Not Shareable"))
                    {
                        strEmailID = Decrypt.DecryptString(strEmailID, 1024, strPublicKey);
                        strEmailID = Decrypt.DecryptString(strEmailID, 1024, strPublicKey);

                    }
                    else if (strEMailID_Privacy.Equals("Public"))
                    {
                        strEmailID = strEmailID;

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
                        strMobileNumber = strMobileNumber;

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
                        strAddress = strAddress;

                    }

                }

            }
            else
            {
                lblMessage.Text = "There is no privacy settings available for this user";
            }



            strDOB_Privacy = ddlDOB.SelectedItem.Text;
            strEMailID_Privacy = ddlEmailID.SelectedItem.Text;
            strMobileNumber_Privacy = ddlMobileNumber.SelectedItem.Text;
            strAddress_Privacy = ddlAddress.SelectedItem.Text;


            strQuery = "update tblPrivacy set ";
            strQuery = strQuery + "DOB_Privacy='" + strDOB_Privacy + "',";
            strQuery = strQuery + "EMailID_Privacy='" + strEMailID_Privacy + "',";
            strQuery = strQuery + "MobileNumber_Privacy='" + strMobileNumber_Privacy + "',";
            strQuery = strQuery + "Address_Privacy='" + strAddress_Privacy + "'";
            strQuery = strQuery + " Where UserID ='" + strUserID + "'";

            intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);




            if (intResult > 0)
            {

                if (strDOB_Privacy.Equals("Private Shareable"))
                {

                    strDOB = Encrypt.EncryptString(strDOB, 1024, strPrivateKey);

                }
                else if (strDOB_Privacy.Equals("Private Not Shareable"))
                {
                    strDOB = Encrypt.EncryptString(strDOB, 1024, strPrivateKey);
                    strDOB = Encrypt.EncryptString(strDOB, 1024, strPrivateKey);

                }
                else if (strDOB_Privacy.Equals("Public"))
                {
                    strDOB = strDOB;

                }




                if (strEMailID_Privacy.Equals("Private Shareable"))
                {


                    strEmailID = Encrypt.EncryptString(strEmailID, 1024, strPrivateKey);

                }
                else if (strEMailID_Privacy.Equals("Private Not Shareable"))
                {
                    strEmailID = Encrypt.EncryptString(strEmailID, 1024, strPrivateKey);
                    strEmailID = Encrypt.EncryptString(strEmailID, 1024, strPrivateKey);

                }
                else if (strEMailID_Privacy.Equals("Public"))
                {
                    strEmailID = strEmailID;

                }


                if (strMobileNumber_Privacy.Equals("Private Shareable"))
                {

                    strMobileNumber = Encrypt.EncryptString(strMobileNumber, 1024, strPrivateKey);

                }
                else if (strMobileNumber_Privacy.Equals("Private Not Shareable"))
                {
                    strMobileNumber = Encrypt.EncryptString(strMobileNumber, 1024, strPrivateKey);
                    strMobileNumber = Encrypt.EncryptString(strMobileNumber, 1024, strPrivateKey);

                }
                else if (strMobileNumber_Privacy.Equals("Public"))
                {
                    strMobileNumber = strMobileNumber;

                }


                if (strAddress_Privacy.Equals("Private Shareable"))
                {

                    strAddress = Encrypt.EncryptString(strAddress, 1024, strPrivateKey);

                }
                else if (strAddress_Privacy.Equals("Private Not Shareable"))
                {
                    strAddress = Encrypt.EncryptString(strAddress, 1024, strPrivateKey);
                    strAddress = Encrypt.EncryptString(strAddress, 1024, strPrivateKey);

                }
                else if (strAddress_Privacy.Equals("Public"))
                {
                    strAddress = strAddress;

                }


                strQuery = "update tblRegistration set ";
                strQuery = strQuery + "DOB ='" + strDOB + "',";
                strQuery = strQuery + "EmailID ='" + strEmailID + "',";
                strQuery = strQuery + "MobileNumber ='" + strMobileNumber + "',";
                strQuery = strQuery + "Address ='" + strAddress + "' ";
                strQuery = strQuery + "Where UserID='" + strUserID + "'";


                intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);


                if (intResult > 0)
                {
                    lblMessage.Text = "Success";
                }
                else
                {
                    lblMessage.Text = "Fail";
                }

            }
            else
            {
                lblMessage.Text = "There is no data availabe for the user";

            }



            if (intResult > 0)
            {
                lblMessage.Text = "Success";
            }
            else
            {

                lblMessage.Text = "Fail";
            }

        }
        catch (Exception ex)
        {

            lblMessage.Text = ex.ToString();


        }



    }
}