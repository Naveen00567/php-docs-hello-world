<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table cellpadding="0" cellspacing="0"align="center" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" bgcolor="#E9F2F5" width="100%">
                    <tr>
                        <td align="left" bgcolor="#BB92E4">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                                ForeColor="#17668D" Text="Password Authentication"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <hr /></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" Font-Size="Small"
                                ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table cellpadding="0" cellspacing="0" class="style2">
                                <tr>
                                    <td style="width: 60px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 217px" align="center" rowspan="6" bgcolor="#E9F2F5">
                                        <img alt="" src="images/login.jpg" style="width: 137px; height: 133px" />
                                    </td>
                                    <td align="left" style="width: 96px">
                                        <asp:Label ID="lblEmployeeId" runat="server" Font-Names="Garamond" Font-Size="Medium"
                                            ForeColor="#176694" Text="User ID"></asp:Label>
                                    </td>
                                    <td style="width: 2px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 148px">
                                        <asp:TextBox ID="txtUserID" runat="server" BorderColor="#176694" BorderStyle="Double"
                                            BorderWidth="1px" Font-Bold="False" Font-Names="vardana" 
                                            Font-Size="Medium" ForeColor="#176694" style="margin-bottom: 1px"></asp:TextBox>
                                    </td>
                                    <td style="width: 196px; text-align: left;">
                                        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 60px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 96px">
                                        <asp:Label ID="lblEmployeeId0" runat="server" Font-Names="Garamond" Font-Size="Medium"
                                            ForeColor="#176694" Text="Password"></asp:Label>
                                    </td>
                                    <td style="width: 2px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 148px">
                                        <asp:TextBox ID="txtPassword" runat="server" BorderColor="#176694" BorderStyle="Double"
                                            BorderWidth="1px" Font-Bold="False" Font-Names="vardana" Font-Size="Medium" ForeColor="#176694"
                                            TextMode="Password"></asp:TextBox>
                                    </td>
                                    <td style="width: 196px; text-align: left;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 60px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 96px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 2px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 148px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 196px; text-align: left;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 60px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 96px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 2px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 148px">
                                        <asp:Button ID="btnSubmit" runat="server" BackColor="#176694" BorderColor="#176694"
                                            Font-Bold="True" ForeColor="White" OnClick="btnSubmit_Click" Text="Submit" />
                                        <asp:Button ID="btnSignUP" runat="server" BackColor="#176694" BorderColor="#176694"
                                            Font-Bold="True" ForeColor="White" OnClick="btnSubmit1_Click" Text="Sign Up" />
                                    </td>
                                    <td style="width: 196px">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 60px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 96px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 2px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 148px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 196px">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 60px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 96px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 2px">
                                        &nbsp;
                                    </td>
                                    <td align="left" style="width: 148px">
                                        &nbsp;
                                    </td>
                                    <td style="width: 196px">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="NavContent">
    <nav id="navigation">
    <ul runat="server" id="menu">
        <li><a href="default.aspx">Home</a></li>
        <li><a href="about.aspx">About Us</a></li>
        <li><a href="projects.aspx">Project Info</a></li>
        <li class="active"><a href="login.aspx">Login</a></li>
    </ul>
    </nav>
</asp:Content>

