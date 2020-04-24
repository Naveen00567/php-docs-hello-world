using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ProfileView : System.Web.UI.Page
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


        if (Session["Control"] != null)
        {
            string strControl = Session["Control"].ToString();

            if (strControl.Equals("Friend"))
            {
                //   btnRegister.Visible = false;
                Session["Control"] = null;
            }
            else
            {
                btnRegister.Visible = true;
            }


        }
        if (Session["ProfileID"] != null)
        {
            string strProfileID;

            strProfileID = Session["ProfileID"].ToString();
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
        else
        {

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
        string strPhoto;
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

                strQuery = "select UserName,Gender,DOB,EMailID,MobileNumber,Address,PublicKey,PrivateKey,Photo from tblRegistration where UserID='" + strProfileID + "'";
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
                    strPhoto = Data[8].ToString();

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

                    imgUser.ImageUrl = strPhoto;

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


    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string strQuery, strUserID, strFriendsID, strStatus;
        int intResult;
        DataSet dsFriend;
        try
        {
            strUserID = Session["UserID"].ToString();
            strFriendsID = Session["ProfileID"].ToString();
            strStatus = "Request";

            if (strUserID.Equals(strFriendsID))
            {
                lblMessage.Text = "Self Profile can't be ad as a friend!";
            }
            else
            {
                strQuery = "select UserID,FriendsID from tblFriendsList ";
                strQuery = strQuery + "where (( UserID= '" + strUserID + "') and (FriendsID= '" + strFriendsID + "')) ";
                dsFriend = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

                intResult = dsFriend.Tables[0].Rows.Count;

                if (intResult > 0)
                {
                    lblMessage.Text = "This Profile already avaialble in your friends List";
                }
                else
                {
                    strQuery = "insert into tblFriendsList values(";
                    strQuery = strQuery + "'" + strUserID + "',";
                    strQuery = strQuery + "'" + strFriendsID + "',";
                    strQuery = strQuery + "'" + strStatus + "')";

                    intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery);

                    if (intResult > 0)
                    {
                        Session["Message"] = "Friend details added successfully";
                        Response.Redirect("FriendsView.aspx", false);
                    }
                    else
                    {
                        lblMessage.Text = "Please try again later";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();

        }

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Server.Transfer("searchfriends.aspx");
    }
}