<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="MessageViewSent.aspx.cs" Inherits="MessageViewSent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="style2">
                    <tr>
                        <td align="left" bgcolor="White">
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
                        <td align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                                ForeColor="#17668D" Text="Message View"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <hr />
                        </td>
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
                                    <td style="width: 60px; height: 51px;">
                                    </td>
                                    <td style="height: 51px;">
                                        <table id="table147" border="0" cellspacing="1" style="width: 552px; height: 232px"
                                            width="552">
                                            <tr>
                                                <td align="left" class="DataLables" height="17" style="height: 17px" width="5">
                                                </td>
                                                <td align="left" class="DataLables" height="17" style="height: 17px" width="53">
                                                    To
                                                </td>
                                                <td align="left" class="DataLables" height="17" style="height: 17px" width="4">
                                                    :
                                                </td>
                                                <td class="Normal" height="17" style="width: 172px; height: 17px" width="172" align="left">
                                                    &nbsp;
                                                    <asp:Label ID="lblToUserID" runat="server">Label</asp:Label>
                                                </td>
                                                <td class="Normal" height="17" style="height: 17px" width="430">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="DataLables" width="5">
                                                    &nbsp;
                                                </td>
                                                <td align="left" class="DataLables" width="53">
                                                    Subject&nbsp;&nbsp;
                                                </td>
                                                <td align="left" class="DataLables" width="4">
                                                    :
                                                </td>
                                                <td class="Normal" style="width: 172px" width="172" align="left">
                                                    &nbsp;
                                                    <asp:Label ID="lblSubject" runat="server">Label</asp:Label>
                                                </td>
                                                <td width="430">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="DataLables" height="21" style="height: 21px" width="5">
                                                    &nbsp;
                                                </td>
                                                <td align="left" class="DataLables" height="21" style="height: 21px" width="53">
                                                    Date
                                                </td>
                                                <td align="left" class="DataLables" height="21" style="height: 21px" width="4">
                                                    :
                                                </td>
                                                <td class="Normal" height="21" style="width: 172px; height: 21px" width="172" align="left">
                                                    &nbsp;
                                                    <asp:Label ID="lblDate" runat="server">Label</asp:Label>
                                                </td>
                                                <td height="21" style="height: 21px" width="430">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="DataLables" height="21" width="5">
                                                    &nbsp;
                                                </td>
                                                <td align="left" class="DataLables" height="21" width="53">
                                                    From&nbsp;
                                                </td>
                                                <td align="left" class="DataLables" height="21" width="4">
                                                    :
                                                </td>
                                                <td class="Normal" height="21" style="width: 172px" width="172" align="left">
                                                    &nbsp;
                                                    <asp:Label ID="lblFromUserID" runat="server">Label</asp:Label>
                                                </td>
                                                <td height="21" width="430" align="left">
                                                    &nbsp;
                                                    Attachment:
                                                    <asp:LinkButton ID="lbDownload" runat="server" OnClick="lbDownload_Click">Download</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="DataLables" colspan="5" height="146">
                                                    &nbsp;
                                                    <asp:TextBox ID="txtMessage" runat="server" BorderColor="Gold" BorderStyle="Solid"
                                                        BorderWidth="2px" CssClass="Normal" Height="134px" ReadOnly="True" TextMode="MultiLine"
                                                        Width="544px">Message</asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" class="DataLables" colspan="5">
                                                    &nbsp;
                                                    <asp:Button ID="btnReplay" runat="server" CssClass="Button" OnClick="btnReplay_Click"
                                                        Style="cursor: hand;" Text="Reply" Visible="False" />
                                                    <asp:Button ID="btnForward" runat="server" CssClass="Button" OnClick="btnForward_Click"
                                                        Style="cursor: hand" Text="Forward" Visible="False" />
                                                    <asp:Button ID="btnDelete" runat="server" CssClass="Button" OnClick="btnDelete_Click"
                                                        Style="cursor: hand;" Text="Delete" Visible="False" />
                                                    <asp:Button ID="btnAddToAddressBook" runat="server" CssClass="Button" Style="cursor: hand"
                                                        Text="Add To Address Book" OnClick="btnAddToAddressBook_Click" Visible="False" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 196px; text-align: left; height: 51px;">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
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
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
