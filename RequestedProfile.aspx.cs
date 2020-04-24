using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class RequestedProfile : System.Web.UI.Page
{
    string strCon;
    protected void Page_Load(object sender, EventArgs e)
    {
        strCon = System.Configuration.ConfigurationManager.ConnectionStrings["strcon"].ToString();


        try
        {

            if (Session["UserID"] != null)
            {
                lblName.Text = Session["UserName"].ToString();

            }
            else
            {

                Response.Redirect("login.aspx", false);
            }


            if (Session["FriendID"] != null)
            {
                string strProfileID;

                strProfileID = Session["FriendID"].ToString();
                loadProfile(strProfileID);

                int intResult1, intResult2;

                intResult1 = gvEmployement.Rows.Count;
                intResult2 = gvSchool.Rows.Count;

                if (intResult1 < 1)
                {
                    lblHeader0.Visible = false;
                }

                if (intResult1 < 1)
                {
                    lblHeader1.Visible = false;
                }


            }
        }
        catch (Exception x)
        {
            lblMessage.Text = x.Message.ToString();
        }

    }




    protected void btnRegister_Click(object sender, EventArgs e)
    {

        try
        {


            string strQuery, strStatus, strUserID, strFriendID;

            int intResult;

            strUserID = Session["FriendID"].ToString();
            strFriendID = Session["UserID"].ToString();


            strStatus = "Confirmed";


            strQuery = "update tblFriendsList set";
            strQuery = strQuery + " Status='" + strStatus + "'";
            strQuery = strQuery + " where UserID='" + strUserID + "' and ";
            strQuery = strQuery + " FriendsID='" + strFriendID + "'";

            intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

            if (intResult > 0)
            {
                lblMessage.Text = "success";
            }

            else
            {

                lblMessage.Text = "Please try again later";

            }


        }
        catch (Exception x)
        {
            lblMessage.Text = x.Message.ToString();
        }

    }


    protected void loadProfile(string strProfileID)
    {

        string strQuery;
        int intResult;
        DataSet dsProfile, dsPrivacy;
        Object[] Data;
        Object[] Datas;
        string strUserName, strGender, strDOB, strEMailID, strMobileNumber, strAddress, strPublicKey, strPrivateKey;
        string strDOB_Privacy, strEMailID_Privacy, strMobileNumber_Privacy, strAddress_Privacy;
        string strUserID = "";

        bool boolValid;





        try
        {
            strQuery = "select DOB_Privacy,EmailID_Privacy,MobileNumber_Privacy,Address_Privacy from tblPrivacy where UserID='" + strProfileID + "'";

            dsPrivacy = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

            intResult = dsPrivacy.Tables[0].Rows.Count;


            if (intResult > 0)
            {
                Datas = dsPrivacy.Tables[0].Rows[0].ItemArray;

                strDOB_Privacy = Datas[0].ToString();
                strEMailID_Privacy = Datas[1].ToString();
                strMobileNumber_Privacy = Datas[2].ToString();
                strAddress_Privacy = Datas[3].ToString();




                strQuery = "select UserName,Gender,DOB,EMailID,MobileNumber,Address,PublicKey,PrivateKey from tblRegistration where UserID='" + strProfileID + "'";
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


                    txtUserName.Text = strUserName;
                    if (strGender.Equals("Male"))
                    {
                        txtGender.Text = "Male";
                    }
                    else
                    {
                        txtGender.Text = "FeMale";
                    }


                    DataSet dsFriends;


                    strQuery = "select * from tblFriendsList where UserID='" + strUserID + "' and FriendsID='" + strProfileID + "'";

                    dsFriends = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

                    intResult = dsFriends.Tables[0].Rows.Count;

                    if (intResult > 0)
                    {
                        boolValid = true;
                    }
                    else
                    {

                        boolValid = false;

                    }




                    if (strEMailID_Privacy.Equals("Private Shareable"))
                    {

                        if (boolValid)
                        {
                            strEMailID = Decrypt.DecryptString(strEMailID, 1024, strPublicKey);
                        }
                        else
                        {
                            strEMailID = "Not visible to you";
                        }


                    }
                    else if (strEMailID_Privacy.Equals("Private Not Shareable"))
                    {
                        // strEMailID = Decrypt.DecryptString(strEMailID, 1024, strPublicKey);
                        //strEMailID = Decrypt.DecryptString(strEMailID, 1024, strPublicKey);
                        strEMailID = "Not visible to you";

                    }
                    else if (strEMailID_Privacy.Equals("Public"))
                    {
                        strEMailID = strEMailID;

                    }


                    if (strMobileNumber_Privacy.Equals("Private Shareable"))
                    {

                        if (boolValid)
                        {
                            strMobileNumber = Decrypt.DecryptString(strMobileNumber, 1024, strPublicKey);
                        }
                        else
                        { strMobileNumber = "Not visible to you"; }


                    }
                    else if (strMobileNumber_Privacy.Equals("Private Not Shareable"))
                    {
                        // strMobileNumber = Decrypt.DecryptString(strMobileNumber, 1024, strPublicKey);
                        //strMobileNumber = Decrypt.DecryptString(strMobileNumber, 1024, strPublicKey);

                        strMobileNumber = "Not visible to you";


                    }
                    else if (strMobileNumber_Privacy.Equals("Public"))
                    {
                        strMobileNumber = strMobileNumber;



                    }


                    if (strAddress_Privacy.Equals("Private Shareable"))
                    {
                        if (boolValid)
                        {
                            strAddress = Decrypt.DecryptString(strAddress, 1024, strPublicKey);
                        }
                        else
                        {
                            strAddress = "Not visible to you";
                        }
                    }
                    else if (strAddress_Privacy.Equals("Private Not Shareable"))
                    {
                        //strAddress = Decrypt.DecryptString(strAddress, 1024, strPublicKey);
                        //strAddress = Decrypt.DecryptString(strAddress, 1024, strPublicKey);


                        strAddress = "Not visible to you";

                    }
                    else if (strAddress_Privacy.Equals("Public"))
                    {
                        strAddress = strAddress;

                    }




                    txtDOB.Text = strDOB;
                    txtEmailID.Text = strEMailID;
                    txtMobileNumber.Text = strMobileNumber;
                    txtAddress.Text = strAddress;



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
            lblMessage.Text = ex.Message.ToString();

        }

    }

}