<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="ProfileView.aspx.cs" Inherits="ProfileView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="table7" border="0" cellpadding="0" cellspacing="0" height="256" bgcolor="#ccccff"
        width="100%">
        <tr>
            <td align="left" bgcolor="White">
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
            <td style="height: 19px">
            </td>
        </tr>
        <tr>
            <td height="28">
                <p align="center">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                        ForeColor="#17668D" Text="User Profile"></asp:Label>
                </p>
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
                <table id="table8" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td style="width: 268px;" rowspan="5">
                            <asp:Image ID="imgUser" runat="server" Height="150px" Width="150px" />
                        </td>
                        <td align="left" style="height: 38px; width: 162px;">
                            <b><font face="Verdana" size="2">User Name</font></b>
                        </td>
                        <td width="9" style="height: 38px">
                        </td>
                        <td align="left" style="height: 38px">
                            &nbsp;<asp:TextBox ID="txtUserName" runat="server" BorderColor="Black" Width="184px"
                                BackColor="#CCCCFF" BorderStyle="None" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td width="4" style="height: 38px">
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
                            <asp:TextBox ID="txtGender" runat="server" BorderColor="Black" Width="184px" BackColor="#CCCCFF"
                                BorderStyle="None" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td width="4" style="height: 30px">
                        </td>
                        <td width="61" style="height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="height: 33px; width: 162px;">
                            <b><font face="Verdana" size="2">DOB</font></b>
                        </td>
                        <td width="9" style="height: 33px">
                        </td>
                        <td align="left" style="height: 33px">
                            <asp:TextBox ID="txtDOB" runat="server" BorderColor="Black" Width="184px" BackColor="#CCCCFF"
                                BorderStyle="None" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td width="4" style="height: 33px">
                        </td>
                        <td width="61" style="height: 33px">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 162px">
                            <b><font face="Verdana" size="2">Email ID</font></b>
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtEmailID" runat="server" BorderColor="Black" Width="184px" BackColor="#CCCCFF"
                                BorderStyle="None" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td width="4">
                            &nbsp;
                        </td>
                        <td width="61">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="height: 36px; width: 162px;">
                            <b><font face="Verdana" size="2">Mobile Number</font></b>
                        </td>
                        <td width="9" style="height: 36px">
                        </td>
                        <td align="left" style="height: 36px">
                            <asp:TextBox ID="txtMobileNumber" runat="server" BorderColor="Black" Width="184px"
                                BackColor="#CCCCFF" BorderStyle="None" ReadOnly="True"></asp:TextBox>
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
                        <td align="left" style="width: 162px" valign="top">
                            <b><font face="Verdana" size="2">Address</font></b>
                        </td>
                        <td width="9">
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtAddress" runat="server" BorderColor="Black" Height="90px" TextMode="MultiLine"
                                Width="187px" BackColor="#CCCCFF" BorderStyle="None"></asp:TextBox>
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
                        <td align="left" style="width: 162px">
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
                </table>
            </td>
        </tr>
        <tr>
            <td height="19" align="center">
                <asp:Label ID="lblHeader0" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                    ForeColor="#17668D" Text="Education"></asp:Label>
            </td>
        </tr>
        <tr>
            <td height="19" align="center">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="19" align="center" style="margin-left: 40px">
                <asp:GridView ID="gvSchool" runat="server" BackColor="White" BorderColor="#E7E7FF"
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Names="Verdana" Font-Size="Small"
                    GridLines="Horizontal" HorizontalAlign="Center" AutoGenerateColumns="False" DataSourceID="DataSchool">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="School" HeaderText="School" SortExpression="School" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#176694" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataSchool" runat="server" ConnectionString="<%$ ConnectionStrings:strcon %>"
                    SelectCommand="SELECT [School] FROM [tblSchool] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="ProfileID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td height="19">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="19" align="center">
                <asp:Label ID="lblHeader1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Large"
                    ForeColor="#17668D" Text="Employement"></asp:Label>
            </td>
        </tr>
        <tr>
            <td height="19">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="19" align="center">
                <asp:GridView ID="gvEmployement" runat="server" BackColor="White" BorderColor="#E7E7FF"
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" Font-Names="Verdana" Font-Size="Small"
                    GridLines="Horizontal" HorizontalAlign="Center" AutoGenerateColumns="False" DataSourceID="DataEmployeement">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:BoundField DataField="Employement" HeaderText="Employement" SortExpression="Employement" />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#176694" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="DataEmployeement" runat="server" ConnectionString="<%$ ConnectionStrings:strcon %>"
                    SelectCommand="SELECT [Employement] FROM [tblEmployement] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="ProfileID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td height="19">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="19" align="center">
                <asp:Button ID="btnRegister" runat="server" BackColor="Black" BorderColor="Black"
                    BorderStyle="Groove" ForeColor="White" Text="Add Friend" OnClick="btnRegister_Click" />
            &nbsp;<asp:Button ID="btnBack" runat="server" BackColor="Black" BorderColor="Black"
                    BorderStyle="Groove" ForeColor="White" Text="Back" 
                    OnClick="btnBack_Click" />
            </td>
        </tr>
        <tr>
            <td height="19">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
