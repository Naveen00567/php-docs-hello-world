using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Security.Cryptography;
using System.Net;
using System.Net.Mail;

public partial class SignUp : System.Web.UI.Page
{
    String strCon;
    string gMailAccount = "acharyabhagya715@gmail.com";
    string password = "bubblybubbly";
    string to;
    string subject = "Registration Details";
    string message;

    protected void Page_Load(object sender, EventArgs e)
    {
        strCon = System.Configuration.ConfigurationManager.ConnectionStrings["strcon"].ToString();

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        try
        {
            string strUserID, strPassword, strUserName, strGender, strDOB;
            string strEmailID, strMobileNumber, strAddress, strPublicKey, strPrivateKey;
            byte[] byteFingerPrintImage;
            string strQuery;
            int intResult;

            DataSet dsUser;

            strUserID = txtUserID.Text;

            strQuery = "select * from tblRegistration where UserID='" + strUserID + "'";

            dsUser = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);

            intResult = dsUser.Tables[0].Rows.Count;

            if (intResult <= 0)
            {
                strPassword = txtPassword.Text;
                strUserName = txtUserName.Text;

                if (rbtnMale.Checked == true)
                {
                    strGender = "Male";
                }
                else
                {
                    strGender = "Female";
                }

                strDOB = txtDOB.Text;
                strEmailID = txtEmailID.Text;
                strMobileNumber = txtMobileNumber.Text;
                strAddress = txtAddress.Text;

                RSACryptoServiceProvider RSA = new RSACryptoServiceProvider();

                strPublicKey = RSA.ToXmlString(false);
                strPrivateKey = RSA.ToXmlString(true);


                int intLength1 = fFingerPrintImage.PostedFile.ContentLength;

                byteFingerPrintImage = new byte[intLength1];

                fFingerPrintImage.PostedFile.InputStream.Read(byteFingerPrintImage, 0, intLength1);
                try
                {
                    string strFileNameOnServer = System.IO.Path.GetFileName(fyPhoto.PostedFile.FileName);
                    string strBaseLocation = Server.MapPath("~/photos/");
                    if (fyPhoto.PostedFile != null)
                    {
                        fyPhoto.PostedFile.SaveAs(strBaseLocation + strFileNameOnServer);
                    }
                }
                catch
                {
                }
                strQuery = "insert into tblRegistration(";
                strQuery = strQuery + "UserID,Password,UserName,Gender,DOB,EmailID,";
                strQuery = strQuery + "MobileNumber,Address,FingerPrintImage,PublicKey,PrivateKey,Photo) values(";
                strQuery = strQuery + "@UserID,@Password,@UserName,@Gender,@DOB,@EmailID,@MobileNumber,";
                strQuery = strQuery + "@Address,@FingerPrintImage,@PublicKey,@PrivateKey,";
                strQuery = strQuery + "@Photo)";

                Hashtable htReigstration = new Hashtable();
                SqlParameter Param;


                SqlConnection connection = new
                    SqlConnection(strCon);

                connection.Open();
                SqlCommand cmd = new SqlCommand(strQuery, connection);


                Param = new SqlParameter();
                Param.ParameterName = "@UserID";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strUserID;
                //cmd.Parameters.Add(Param);
                htReigstration.Add(1, Param);


                Param = new SqlParameter();
                Param.ParameterName = "@Password";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strPassword;
                htReigstration.Add(2, Param);
                //cmd.Parameters.Add(Param);


                Param = new SqlParameter();
                Param.ParameterName = "@UserName";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strUserName;
                htReigstration.Add(3, Param);
                //cmd.Parameters.Add(Param);
                Param = new SqlParameter();
                Param.ParameterName = "@Gender";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strGender;
                htReigstration.Add(4, Param);
                //cmd.Parameters.Add(Param);

                Param = new SqlParameter();
                Param.ParameterName = "@DOB";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strDOB;
                htReigstration.Add(5, Param);
                //cmd.Parameters.Add(Param);

                Param = new SqlParameter();
                Param.ParameterName = "@EmailID";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strEmailID;
                htReigstration.Add(6, Param);
                //cmd.Parameters.Add(Param);

                Param = new SqlParameter();
                Param.ParameterName = "@MobileNumber";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strMobileNumber;
                htReigstration.Add(7, Param);
                //cmd.Parameters.Add(Param);
                Param = new SqlParameter();
                Param.ParameterName = "@Address";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strAddress;
                htReigstration.Add(8, Param);
                //cmd.Parameters.Add(Param);

                Param = new SqlParameter();
                Param.ParameterName = "@FingerPrintImage";
                Param.DbType = DbType.Byte;
                Param.SqlDbType = SqlDbType.Image;
                Param.Direction = ParameterDirection.Input;
                Param.Value = byteFingerPrintImage;
                htReigstration.Add(9, Param);
                //cmd.Parameters.Add(Param);

                Param = new SqlParameter();
                Param.ParameterName = "@PublicKey";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strPublicKey;
                htReigstration.Add(10, Param);
                //cmd.Parameters.Add(Param);

                Param = new SqlParameter();
                Param.ParameterName = "@PrivateKey";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = strPrivateKey;
                htReigstration.Add(11, Param);
                //cmd.Parameters.Add(Param);


                Param = new SqlParameter();
                Param.ParameterName = "@Photo";
                Param.DbType = DbType.String;
                Param.SqlDbType = SqlDbType.VarChar;
                Param.Direction = ParameterDirection.Input;
                Param.Value = "photos/" + fyPhoto.PostedFile.FileName;
                htReigstration.Add(12, Param);
                //cmd.Parameters.Add(Param);

                intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery, htReigstration);

                String strPrivacy = "Public";
                strQuery = "insert into tblPrivacy values(";
                strQuery = strQuery + "'" + strUserID + "',";
                strQuery = strQuery + "'" + strPrivacy + "',";
                strQuery = strQuery + "'" + strPrivacy + "',";
                strQuery = strQuery + "'" + strPrivacy + "',";
                strQuery = strQuery + "'" + strPrivacy + "')";

                intResult = clsDB.fnExecuteNonQuery(strCon, CommandType.Text, strQuery, htReigstration);

                if (intResult > 0)
                {

                    string strFolder = strUserID;
                    string FolderPath = clsDB.getRootDirectory();
                    string outputfile = FolderPath + "inbox/" + strFolder;

                    string concat = "Registration Details:";

                    NetworkCredential loginInfo = new NetworkCredential(gMailAccount, password);
                    MailMessage msg = new MailMessage();
                    msg.From = new MailAddress(gMailAccount);
                    msg.To.Add(new MailAddress(txtEmailID.Text));
                    msg.Subject = "Registration Details";
                    message = "UserId:" + txtUserID.Text + ", Password:" + txtPassword.Text;
                    msg.Body = string.Concat(concat, message);
                    msg.IsBodyHtml = true;

                    SmtpClient client = new SmtpClient("smtp.gmail.com");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = loginInfo;
                    try
                    {
                        client.Send(msg);
                    }
                    catch
                    {
                        Response.Write("<script>alert('Email not sent. Check internet settings.')</script>");
                    }

                    try
                    {
                        if (!Directory.Exists(outputfile))
                        {
                            // Create the directory it does not exist.
                            Directory.CreateDirectory(outputfile);
                        }
                    }
                    catch (Exception ex)
                    {

                        Console.WriteLine(ex.Message.ToString());
                    }

                    Response.Redirect("Login.aspx", false);

                }
            }
            else
            {
                lblMessage.Text = "User with this ID already registered";

            }

        }
        catch (Exception ex)
        {

            lblMessage.Text = ex.ToString();

        }

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Login.aspx", false);
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.ToString();
        }
    }
}
