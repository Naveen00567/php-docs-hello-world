<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="MessageSentItems.aspx.cs" Inherits="MessageSentItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <head>
        <link href="IMSWDS.css" type="text/css" rel="stylesheet">
        <script language="javascript">
            function SelectAllCheckboxes(spanChk) {

                //get the checkbox status
                var xState = spanChk.checked;
                //calling control
                var theBox = spanChk;

                //get all the controls in the form
                elm = theBox.form.elements;

                for (i = 0; i < elm.length; i++) {

                    if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                        if (elm[i].checked != xState)
                            elm[i].checked = xState;
                    }
                }
            }

            function SelectHeaderFooter(spanChk) {

                var xState = spanChk.checked;
                var theBox = spanChk;
                var flag = true;

                elm = theBox.form.elements;

                for (i = 0; i < elm.length; i++) {
                    if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                        control = new String(elm[i].id);
                        if (control.search("cbHeader") <= -1) {
                            if (elm[i].checked != true) {
                                flag = false;

                                break;
                            }
                        }
                    }
                }

                for (i = 0; i < elm.length; i++)
                    if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                        control = new String(elm[i].id);
                        if (control.search("cbHeader") != -1) {
                            if (flag == true)
                                elm[i].checked = xState;
                        }
                    }
            }
        </script>
    </head>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="style2">
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
                        <td align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                                ForeColor="#17668D" Text="Message Sent Items"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;
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
                                        <table id="table147" border="0" cellpadding="0" cellspacing="0" style="width: 634px;
                                            height: 406px" width="634">
                                            <tr>
                                                <td height="19">
                                                    <p>
                                                        <table id="table148" border="0" cellpadding="0" cellspacing="0" style="width: 623px;
                                                            height: 36px">
                                                            <tr>
                                                                <td style="width: 79px; height: 17px" align="left">
                                                                    <asp:Button ID="btnRemove" runat="server" CssClass="Button" OnClick="fnDeleteMessage"
                                                                        Text="Remove" BackColor="#176694" Font-Names="Verdana" ForeColor="White" />
                                                                </td>
                                                                <td style="height: 17px" align="left">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                    </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td height="143" valign="top" align="left">
                                                    <asp:DataGrid ID="dgMessageSentItem" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                        BorderStyle="None" CssClass="normal" DataKeyField="Message_Id" Font-Names="Tahoma"
                                                        Font-Size="Small" ShowFooter="True" Width="624px" BorderColor="Black" OnSelectedIndexChanged="dgMessageSentItem_SelectedIndexChanged">
                                                        <HeaderStyle BackColor="#17668D" CssClass="datalables" Height="10px" />
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <HeaderStyle Width="10px" />
                                                                <HeaderTemplate>
                                                                    <asp:CheckBox ID="cbHeader1" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="cbSelected" runat="server" onclick="javascript:SelectHeaderFooter(this);" />
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:CheckBox ID="cbHeader2" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
                                                                </FooterTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Send To">
                                                                <HeaderStyle HorizontalAlign="Center" Width="115px" />
                                                                <ItemStyle HorizontalAlign="Center" Width="115px" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEmailId" runat="server" Text='<%#  Bind("To_UserID") %>'>
                                                                    </asp:Label>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    <asp:Button ID="btnRemoveF" runat="server" CssClass="Button" OnClick="fnDeleteMessage"
                                                                        Text="Remove" />
                                                                </FooterTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn HeaderText="Subject">
                                                                <HeaderStyle HorizontalAlign="Center" Width="115px" />
                                                                <ItemStyle HorizontalAlign="Center" Width="115px" />
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="Hyperlink1" runat="server" NavigateUrl='<%# Bind("Url")  %>' Style="text-decoration: none"
                                                                        Text='<%# Bind("Subject") %>'>
                                                                    </asp:HyperLink>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Sent_Date" HeaderText="Sent Date"></asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Message_Id" HeaderText="MessageId" Visible="False"></asp:BoundColumn>
                                                        </Columns>
                                                        <PagerStyle Mode="NumericPages" />
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
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
