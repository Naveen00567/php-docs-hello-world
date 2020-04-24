<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Profiles.aspx.cs" Inherits="Profiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="table7" border="0" cellpadding="0" cellspacing="0" height="256" bgcolor="#ccccff"
        width="100%">
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
                        ForeColor="#17668D" Text="User Profile"></asp:Label>
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
                        <td style="width: 268px; height: 38px;" align="left">
                            &nbsp;
                        </td>
                        <td align="left" style="height: 38px; width: 162px;">
                            &nbsp;
                        </td>
                        <td width="9" style="height: 38px" align="left">
                            <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#CC9966"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="UserID" DataSourceID="dsProfile"
                                GridLines="Both">
                                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                <RowStyle BackColor="White" ForeColor="#330099" />
                                <EditItemTemplate>
                                    UserName:
                                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' Width="300px" />
                                    <br />
                                    Gender:
                                    <br />
                                    <asp:TextBox ID="GenderTextBox" runat="server" Text='<%# Bind("Gender") %>' Width="300px" />
                                    <br />
                                    DOB:
                                    <br />
                                    <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' Width="300px" />
                                    <br />
                                    EmailID:
                                    <br />
                                    <asp:TextBox ID="EmailIDTextBox" runat="server" Text='<%# Bind("EmailID") %>' Width="300px" />
                                    <br />
                                    MobileNumber:
                                    <br />
                                    <asp:TextBox ID="MobileNumberTextBox" runat="server" Text='<%# Bind("MobileNumber") %>'
                                        Width="300px" />
                                    <br />
                                    Address:
                                    <br />
                                    <asp:TextBox ID="AddressTextBox" runat="server" Height="89px" Text='<%# Bind("Address") %>'
                                        TextMode="MultiLine" Width="300px" />
                                    <br />
                                    &nbsp;<br />
                                    &nbsp;<br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    &nbsp;&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table align="left" border="0" cellpadding="5" cellspacing="5" style="height: 185px;
                                        width: 71%">
                                        <tr>
                                            <td align="right">
                                                <b>UserName:</b>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <hr style="border-top: 0px; border-style: dotted; border-color: #C0C0C0; border-bottom: 1px;
                                                    border-width: 0px 0px 1px 0px; border-style: none;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <b>Gender: </b>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="GenderLabel" runat="server" Text='<%# Bind("Gender") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <b>DOB: </b>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="DOBLabel" runat="server" Text='<%# Bind("DOB") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <b>EmailID: </b>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="EmailIDLabel" runat="server" Text='<%# Bind("EmailID") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <b>MobileNumber:</b>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="MobileNumberLabel" runat="server" Text='<%# Bind("MobileNumber") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="top">
                                                <b>Address: </b>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                                                    Text="Edit" />
                                                &nbsp;
                                            </td>
                                            <td align="left">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                            </asp:FormView>
                        </td>
                        <td align="left" style="height: 38px; width: 273px;">
                            <asp:SqlDataSource ID="dsProfile" runat="server" ConnectionString="<%$ ConnectionStrings:strcon %>"
                                SelectCommand="SELECT UserID, Gender, DOB, EmailID, MobileNumber, Address, UserName FROM tblRegistration WHERE (UserID = @UserID)"
                                UpdateCommand="UPDATE tblRegistration SET UserName = @UserName, Gender = @Gender, DOB = @DOB, EmailID = @EmailID, MobileNumber = @MobileNumber, Address = @Address WHERE (UserID = @UserId)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="UserName" Type="String" />
                                    <asp:Parameter Name="Gender" Type="String" />
                                    <asp:Parameter Name="DOB" Type="String" />
                                    <asp:Parameter Name="EmailID" Type="String" />
                                    <asp:Parameter Name="MobileNumber" Type="String" />
                                    <asp:Parameter Name="Address" Type="String" />
                                    <asp:Parameter Name="UserId" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td width="4" valign="top" align="center">
                            <asp:Image ID="imgPhoto" runat="server" Height="173px" Width="162px" />
                            <br />
                            <br />
                            Change Image:
                            <asp:FileUpload ID="fyPhoto" runat="server" />
                            <br />
                            <br />
                            <asp:Button ID="btnChangeImg" runat="server" OnClick="btnChangeImg_Click" Text="Change Image" />
                        </td>
                        <td width="61" style="height: 38px">
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
                        <asp:SessionParameter Name="UserID" SessionField="userID" Type="String" />
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
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
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
            <td height="19">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
