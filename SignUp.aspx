<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    <!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#i1')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(150);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="table7" border="0" cellpadding="0" cellspacing="0" height="256" width="100%"
        bgcolor="#F6F9FD">
        <tr>
            <td style="height: 19px">
            </td>
        </tr>
        <tr>
            <td height="28">
                <p align="center">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                        ForeColor="#17668D" Text="Registration"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td height="28">
                <hr />
            </td>
        </tr>
        <tr>
            <td height="28" align="center">
                <asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" Font-Size="Small"
                    ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" align="right">
                    <tr>
                        <td style="width: 268px" align="center" bgcolor="#F6F9FD" rowspan="6">
                            <img alt="" src="images/bio3.jpg" style="width: 200px; height: 291px" />
                        </td>
                        <td align="left" style="width: 162px">
                            <b><font face="Verdana" size="2">User ID</font></b>
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtUserID" runat="server" BorderColor="Black" Width="182px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserID"
                                ErrorMessage="UserId required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td width="4" nowrap="nowrap">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="height: 31px; width: 162px;">
                            <b><font face="Verdana" size="2">Password</font></b>
                        </td>
                        <td width="9" style="height: 31px">
                        </td>
                        <td align="left" style="height: 31px">
                            <asp:TextBox ID="txtPassword" runat="server" BorderColor="Black" TextMode="Password"
                                Width="182px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Password required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td width="4" style="height: 31px" nowrap="nowrap">
                            &nbsp;
                        </td>
                        <td width="61" style="height: 31px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="height: 33px; width: 162px;">
                            <b><font face="Verdana" size="2">Confirm Password</font></b>
                        </td>
                        <td width="9" style="height: 33px">
                        </td>
                        <td align="left" style="height: 33px">
                            <asp:TextBox ID="txtConfirmPassword" runat="server" BorderColor="Black" TextMode="Password"
                                Width="183px"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword"
                                ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Passwords don't match"
                                SetFocusOnError="True" ForeColor="Red"></asp:CompareValidator>
                        </td>
                        <td width="4" nowrap="nowrap">
                            &nbsp;
                        </td>
                        <td width="61" style="height: 33px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="height: 38px; width: 162px;">
                            <b><font face="Verdana" size="2">User Name</font></b>
                        </td>
                        <td width="9" style="height: 38px">
                        </td>
                        <td align="left" style="height: 38px">
                            <asp:TextBox ID="txtUserName" runat="server" BorderColor="Black" Width="184px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName"
                                ErrorMessage="Username required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td width="4" style="height: 38px" nowrap="nowrap">
                            &nbsp;
                        </td>
                        <td width="61" style="height: 38px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="height: 30px; width: 162px;">
                            <b><font face="Verdana" size="2">Gender</font></b>
                        </td>
                        <td width="9" style="height: 30px">
                        </td>
                        <td align="left">
                            <asp:RadioButton ID="rbtnMale" runat="server" Checked="True" Font-Bold="True" GroupName="Gender"
                                Text="Male" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButton ID="rbtnFemale" runat="server" Font-Bold="True" GroupName="Gender"
                                Text="Female" />
                            &nbsp;&nbsp;
                        </td>
                        <td width="4" style="height: 30px">
                        </td>
                        <td width="61" style="height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <b><font face="Verdana" size="2">DOB</font></b>
                        </td>
                        <td width="9" style="height: 33px">
                        </td>
                        <td align="left" valign="top">
                            <asp:TextBox ID="txtDOB" runat="server" BorderColor="Black" Width="186px"></asp:TextBox>
                            <asp:CalendarExtender ID="txtDOB_CalendarExtender" runat="server" 
                                Enabled="True" TargetControlID="txtDOB">
                            </asp:CalendarExtender>
                        </td>
                        <td width="4" style="height: 33px">
                            &nbsp;
                        </td>
                        <td width="61" style="height: 33px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px">
                            &nbsp;
                        </td>
                        <td align="left" style="width: 162px">
                            <b><font face="Verdana" size="2">Email ID</font></b>
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtEmailID" runat="server" BorderColor="Black" Width="186px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmailID"
                                Display="Dynamic" ErrorMessage="Email required" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailID"
                                Display="Dynamic" ErrorMessage="Invalid email" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                        <td width="4" nowrap="nowrap">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px; height: 36px;">
                        </td>
                        <td align="left" style="height: 36px; width: 162px;">
                            <b><font face="Verdana" size="2">Mobile Number</font></b>
                        </td>
                        <td width="9" style="height: 36px">
                        </td>
                        <td align="left" style="height: 36px">
                            <asp:TextBox ID="txtMobileNumber" runat="server" BorderColor="Black" 
                                Width="186px" MaxLength="10"></asp:TextBox>
                        </td>
                        <td width="4" style="height: 36px">
                            &nbsp;
                        </td>
                        <td width="61" style="height: 36px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px">
                            &nbsp;
                        </td>
                        <td align="left" valign="top">
                            <b><font face="Verdana" size="2">Address</font></b>
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtAddress" runat="server" BorderColor="Black" Height="90px" TextMode="MultiLine"
                                Width="187px"></asp:TextBox>
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px" rowspan="6" align="right">
                            <img id="i1" height="150px" width="150px" alt="User Image" align="middle" name="i1"
                                alt="User Photo" />
                        </td>
                        <td align="left" style="width: 162px">
                            <b><font face="Verdana" size="2">Finger Print Image</font></b>
                        </td>
                        <td height="38" width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <input id="fFingerPrintImage" runat="server" name="fFingerPrintImage" type="file" /><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5" runat="server" ControlToValidate="fFingerPrintImage"
                                ErrorMessage="Select an fingerprint image" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                        <td width="4" nowrap="nowrap">
                            &nbsp;
                        </td>
                        <td height="38" width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 162px">
                            <b><font face="Verdana" size="2">Upload your Photo</font></b>
                        </td>
                        <td height="29" width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <input id="fyPhoto" runat="server" name="fFingerPrintImage0" type="file" onchange="readURL(this);" />
                        </td>
                        <td height="29" width="4">
                            &nbsp;
                        </td>
                        <td height="29" width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 162px">
                            &nbsp;
                        </td>
                        <td height="29" width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td height="29" width="4">
                            &nbsp;
                        </td>
                        <td height="29" width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 162px">
                            &nbsp;
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td width="358" align="left">
                            <asp:Button ID="btnRegister" runat="server" BackColor="Black" BorderColor="Black"
                                BorderStyle="Groove" ForeColor="White" Text="Register" OnClick="btnRegister_Click" />
                            &nbsp;<asp:Button ID="btnSignUp" runat="server" BackColor="Black" BorderColor="Black"
                                BorderStyle="Groove" ForeColor="White" Text="Cancel" OnClick="btnSignUp_Click"
                                CausesValidation="False" />
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 162px">
                            &nbsp;
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td width="358">
                            &nbsp;
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 162px">
                            &nbsp;
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td width="358">
                            &nbsp;
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="19">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
