using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Biometric : System.Web.UI.Page
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
            string strUserID = "", strUserName = "";
            string strQuery;
            DataSet dsImage;
            Object b1, b2;

            byte[] Image1;
            byte[] Image2;
            byte[] Image3;
            byte[] Image4;

            int intLength1, intLength2, intLength3, intLength4;

            if (Session["UserID"] != null)
            {
                strUserID = Session["UserID"].ToString();
                strUserName = Session["UserName"].ToString();
            }

            strQuery = "select FingerPrintImage from tblRegistration where UserID='" + strUserID + "'";
            dsImage = clsDB.fnAdapterFill(strCon, CommandType.Text, strQuery);
            b1 = dsImage.Tables[0].Rows[0]["FingerPrintImage"];

            Image1 = (System.Byte[])b1; //finger print
            intLength1 = Image1.Length;

            intLength4 = File3.PostedFile.ContentLength;
            Image4 = new byte[intLength4];

            File3.PostedFile.InputStream.Read(Image4, 0, intLength4); //finger print
            bool flag = true;

            if (intLength1 == intLength4)
            {
                for (int intI = 0; intI < intLength1; intI++)
                {
                    if (Image1[intI] != Image4[intI])
                    {
                        flag = false;
                        break;
                    }
                }

                if (flag == true)
                {
                    string strFile, strFileName, FolderPath, outputfile;
                    int intIndex;
                    strFile = File3.PostedFile.FileName;
                    intIndex = strFile.LastIndexOf("\\");
                    strFileName = strFile.Substring(intIndex + 1);
                    //strPath = clsHelper.FilePath();
                    FolderPath = clsDB.getRootDirectory();
                    outputfile = FolderPath + "Upload/";

                    Class1.strPath3 = outputfile + strFileName;
                    File3.PostedFile.SaveAs(Class1.strPath3);

                    lblMessage.Text = "success";
                    Response.Redirect("NewsFeed.aspx", false);
                }
                else
                {
                    lblMessage.Text = "Please try again later";
                }
            }
            else
            {
                lblMessage.Text = "Fail";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message.ToString();
        }
    }
}