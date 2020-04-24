<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="MessageCompose.aspx.cs" Inherits="MessageCompose" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="style2">
                    <tr>
                        <td align="left" bgcolor="White" colspan="5">
                            &nbsp;</td>
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
                        <td align="center" colspan="5">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                            <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                                ForeColor="#17668D" Text="Message Compose"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                            <asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" Font-Size="Small"
                                ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                            <hr size="2" width="100%" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                            <table cellpadding="0" cellspacing="0" class="style2">
                                <tr>
                                    <td style="width: 60px; height: 51px;">
                                    </td>
                                    <td style="height: 51px;">
                                        <table id="table147" border="0" cellpadding="0" cellspacing="0" style="width: 634px;
                                            height: 406px" width="634">
                                            <tr>
                                                <td height="19">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="143" valign="top">
                                                    <table id="table148" border="0" cellpadding="0" cellspacing="0" style="width: 624px;
                                                        height: 378px" width="624">
                                                        <tr>
                                                            <td align="right" class="DataLables" height="26" style="width: 93px" width="93">
                                                            </td>
                                                            <td class="Normal" height="26">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="DataLables" height="58" style="width: 93px; height: 58px"
                                                                width="93">
                                                                To&nbsp;&nbsp;
                                                            </td>
                                                            <td class="Normal" height="58" style="height: 58px" align="left">
                                                                <p>
                                                                    <input id="txtTo" runat="server" name="txtToEmailId" size="53" style="border-right: #003333 1px groove;
                                                                        border-top: #003333 1px groove; border-left: #003333 1px groove; width: 352px;
                                                                        border-bottom: #003333 1px groove; height: 22px" type="text" /></p>
                                                            </td>
                                                        </tr>
                                                        <tr align="left">
                                                            <td align="left" class="DataLables" height="24" style="width: 93px; height: 24px"
                                                                width="93">
                                                                Subject&nbsp;&nbsp;
                                                            </td>
                                                            <td height="24" style="height: 24px" align="left">
                                                                <asp:TextBox ID="txtSubject" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                                                    CssClass="Normal" Height="18px" Width="352px" BorderColor="Black"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" class="DataLables" style="width: 93px" width="93">
                                                                Message&nbsp;&nbsp;
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtMessage" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                                                    CssClass="Normal" Height="173px" TextMode="MultiLine" Width="352px" BorderColor="Black"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="29" style="width: 93px" width="93">
                                                                &nbsp;
                                                            </td>
                                                            <td align="left" height="29">
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="29" style="width: 93px" width="93">
                                                                Add Attachment&nbsp;
                                                            </td>
                                                            <td height="29">
                                                                <asp:FileUpload ID="FileUpload1" runat="server" Width="433px" />
                                                                &nbsp;
                                                                <asp:Button ID="Button1" runat="server" Text="Attach File" OnClick="Button1_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td height="29" style="width: 93px" width="93">
                                                                &nbsp;</td>
                                                            <td height="29" align="left">
                                                                <asp:Label ID="lblAttach" runat="server" ForeColor="Red"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                                <asp:Button ID="btnSend" runat="server" CssClass="Button" Height="65px" OnClick="btnSend_Click"
                                                                    Style="cursor: hand; height: 25px;" Text="Send" Width="97px" BorderColor="Black" />
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
                        <td align="center" colspan="5">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="5">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
