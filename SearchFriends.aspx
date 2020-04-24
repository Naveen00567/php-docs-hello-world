<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="SearchFriends.aspx.cs" Inherits="SearchFriends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
                                ForeColor="#17668D" Text="Search Friends"></asp:Label>
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
                                    <td style="width: 313px; height: 30px;">
                                    </td>
                                    <td style="height: 30px; width: 169px;" align="left">
                                        <asp:Label ID="lblEmployeeId0" runat="server" Font-Names="Garamond" Font-Size="Medium"
                                            ForeColor="#176694" Text="Name ?"></asp:Label>
                                    </td>
                                    <td style="height: 30px;">
                                    </td>
                                    <td style="height: 30px; width: 132px;">
                                        <asp:TextBox ID="txtName" runat="server" BorderColor="Black" Width="239px"></asp:TextBox>
                                    </td>
                                    <td style="height: 30px;">
                                        <asp:Button ID="btnName" runat="server" BackColor="#176694" BorderColor="#176694"
                                            Font-Bold="True" ForeColor="White" OnClick="btnName_Click" Text="Find" />
                                    </td>
                                    <td style="width: 196px; text-align: left; height: 30px;">
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 313px; height: 32px;">
                                        &nbsp;
                                    </td>
                                    <td style="height: 32px; width: 169px;" align="left">
                                        &nbsp;
                                    </td>
                                    <td style="height: 32px;">
                                        &nbsp;
                                    </td>
                                    <td style="height: 32px; width: 132px;">
                                        &nbsp;
                                    </td>
                                    <td style="height: 32px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 196px; text-align: left; height: 32px;">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="gvFriends" runat="server" BackColor="White" BorderColor="#E7E7FF"
                                BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Names="Verdana" Font-Size="Small"
                                GridLines="Horizontal" HorizontalAlign="Center" AutoGenerateColumns="False" DataSourceID="SqlDataSourceFriends"
                                OnSelectedIndexChanged="gvFriends_SelectedIndexChanged" OnSelectedIndexChanging="gvFriends_SelectedIndexChanging"
                                DataKeyNames="UserID" AllowPaging="True" AllowSorting="True" Width="500px">
                                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Photo" SortExpression="Photo">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Photo") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" Height="40px" ImageUrl='<%# Eval("Photo") %>'
                                                Width="40px" />
                                        </ItemTemplate>
                                        <ItemStyle Height="40px" Width="40px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SNo" HeaderText="SNo" InsertVisible="False" ReadOnly="True"
                                        SortExpression="SNo" Visible="false" />
                                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName">
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender">
                                        <ItemStyle Width="70px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" Visible="false" />
                                    <asp:CommandField ShowSelectButton="True" />
                                </Columns>
                                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                <HeaderStyle BackColor="#176694" Font-Bold="True" ForeColor="#F7F7F7" />
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:SqlDataSource ID="SqlDataSourceFriends" runat="server" ConnectionString="<%$ ConnectionStrings:strcon %>"
                                SelectCommand="SELECT SNo, UserName, Gender, UserID, Photo FROM tblRegistration WHERE (UserName LIKE '%' + @UserName + '%') AND (NOT (UserID = @UId))">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtName" Name="UserName" PropertyName="Text" Type="String" />
                                    <asp:SessionParameter DefaultValue="Session" Name="UId" SessionField="UserName" />
                                </SelectParameters>
                            </asp:SqlDataSource>
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
