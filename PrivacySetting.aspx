<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="PrivacySetting.aspx.cs" Inherits="PrivacySetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="table7" border="0" cellpadding="0" cellspacing="0" height="256" width="100%">
        <tr>
            <td align="left" bgcolor="Black">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="left" bgcolor="Black">
                <table>
                    <tr>
                        <td>
                            <asp:Menu ID="Menu1" runat="server" BackColor="Black" DynamicHorizontalOffset="2"
                                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#FFFF99" Orientation="Horizontal"
                                StaticSubMenuIndent="10px">
                                <StaticSelectedStyle BackColor="#507CD1" />
                                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                                <DynamicMenuStyle BackColor="#B5C7DE" />
                                <DynamicSelectedStyle BackColor="#507CD1" />
                                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                                <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                                <Items>
                                    <asp:MenuItem NavigateUrl="~/MessageInbox.aspx" Text="Message" Value="Branch">
                                        <asp:MenuItem NavigateUrl="~/MessageCompose.aspx" Text="Compose" Value="New Branch">
                                        </asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/MessageInbox.aspx" Text="Inbox" Value="Edit Branch">
                                        </asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/MessageSentItems.aspx" Text="Sent Item" Value="View Branch">
                                        </asp:MenuItem>
                                    </asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/NewsFeed.aspx" Text="News Feed" Value="New Item"></asp:MenuItem>
                                    <asp:MenuItem Text="Friends" Value="New Item" NavigateUrl="~/FriendsView.aspx">
                                        <asp:MenuItem Text="Search Friend" Value="Edit Customer" NavigateUrl="~/SearchFriends.aspx">
                                        </asp:MenuItem>
                                        <asp:MenuItem NavigateUrl="~/FriendsRequest.aspx" Text="Friends Request" Value="Friends Request">
                                        </asp:MenuItem>
                                    </asp:MenuItem>
                                    <asp:MenuItem Text="Profile" Value="New Item" NavigateUrl="~/Profiles.aspx">
                                        <asp:MenuItem Text="Education" Value="Pledge View" NavigateUrl="~/School.aspx"></asp:MenuItem>
                                        <asp:MenuItem Text="Employement" Value="Employement" NavigateUrl="~/Employeement.aspx">
                                        </asp:MenuItem>
                                    </asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/PrivacySetting.aspx" Text="Privacy " Value="Payment">
                                    </asp:MenuItem>
                                    <asp:MenuItem NavigateUrl="~/Signout.aspx" Text="Sign Out" Value="Sign Out"></asp:MenuItem>
                                </Items>
                                <StaticItemTemplate>
                                    <%# Eval("Text") %>
                                </StaticItemTemplate>
                            </asp:Menu>
                        </td>
                        <td align="right" bgcolor="Black" style="width: 468px">
                        </td>
                        <td align="right" bgcolor="Black">
                            <asp:Label ID="lblName0" runat="server" Font-Bold="True" Font-Names="Verdana" Font-Size="Smaller"
                                ForeColor="Yellow">Welcome</asp:Label>
                        </td>
                        <td align="left" bgcolor="Black">
                            &nbsp;
                        </td>
                        <td align="left" bgcolor="Black">
                            <asp:Label ID="lblName" runat="server" Font-Bold="False" Font-Names="Verdana" Font-Size="Smaller"
                                ForeColor="#FFFF66"></asp:Label>
                        </td>
                        <td align="left" bgcolor="Black">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 19px">
            </td>
        </tr>
        <tr>
            <td height="28">
                <p align="center">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                        ForeColor="#17668D" Text="Privacy Settings"></asp:Label>
                </p>
            </td>
        </tr>
        <tr>
            <td height="28">
                <asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" Font-Size="Small"
                    ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table id="table8" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 268px; height: 33px;">
                        </td>
                        <td align="left" style="height: 33px; width: 164px;">
                            <b><font face="Verdana" size="2">DOB</font></b>
                        </td>
                        <td width="9" style="height: 33px">
                        </td>
                        <td align="left" style="height: 33px">
                            <asp:DropDownList ID="ddlDOB" runat="server" BackColor="#003366" ForeColor="White">
                                <asp:ListItem>Public</asp:ListItem>
                                <asp:ListItem>Private Shareable</asp:ListItem>
                                <asp:ListItem>Private Not Shareable</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="4" style="height: 33px">
                        </td>
                        <td width="61" style="height: 33px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px">
                            &nbsp;
                        </td>
                        <td align="left" style="width: 164px">
                            <b><font face="Verdana" size="2">Email ID</font></b>
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlEmailID" runat="server" BackColor="#003366" ForeColor="White">
                                <asp:ListItem>Public</asp:ListItem>
                                <asp:ListItem>Private Shareable</asp:ListItem>
                                <asp:ListItem>Private Not Shareable</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px; height: 36px;">
                        </td>
                        <td align="left" style="height: 36px; width: 164px;">
                            <b><font face="Verdana" size="2">Mobile Number</font></b>
                        </td>
                        <td width="9" style="height: 36px">
                        </td>
                        <td align="left" style="height: 36px">
                            <asp:DropDownList ID="ddlMobileNumber" runat="server" BackColor="#003366" ForeColor="White">
                                <asp:ListItem>Public</asp:ListItem>
                                <asp:ListItem>Private Shareable</asp:ListItem>
                                <asp:ListItem>Private Not Shareable</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="4" style="height: 36px">
                        </td>
                        <td width="61" style="height: 36px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px">
                            &nbsp;
                        </td>
                        <td align="left" style="width: 164px">
                            <b><font face="Verdana" size="2">Address</font></b>
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlAddress" runat="server" BackColor="#003366" ForeColor="White">
                                <asp:ListItem>Public</asp:ListItem>
                                <asp:ListItem>Private Shareable</asp:ListItem>
                                <asp:ListItem>Private Not Shareable</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="38" style="width: 268px">
                            &nbsp;
                        </td>
                        <td align="left" style="width: 164px">
                            &nbsp;
                        </td>
                        <td height="38" width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            &nbsp;
                        </td>
                        <td height="38" width="4">
                            &nbsp;
                        </td>
                        <td height="38" width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="29" style="width: 268px">
                            &nbsp;
                        </td>
                        <td align="left" style="width: 164px">
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
                        <td style="width: 268px">
                            &nbsp;
                        </td>
                        <td align="left" style="width: 164px">
                            &nbsp;
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td width="358" align="left">
                            <asp:Button ID="btnSettings" runat="server" BackColor="#003366" BorderColor="Black"
                                BorderStyle="Groove" ForeColor="White" Text="Update Settings" OnClick="btnRegister_Click" />
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 268px">
                            &nbsp;
                        </td>
                        <td style="width: 164px">
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
                        <td style="width: 268px">
                            &nbsp;
                        </td>
                        <td style="width: 164px">
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
