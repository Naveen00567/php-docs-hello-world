<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
            background-color: #DDE4EC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Welcome to Admin Page</h2>
<hr />
    <table cellpadding="2" cellspacing="2" class="style2">
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Friend Status Report" 
                    onclick="Button1_Click" />
&nbsp;<asp:Button ID="Button2" runat="server" Text="Registeration Report" 
                    onclick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <h2>Friend Status Report</h2>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                            CellPadding="4" DataKeyNames="SNo" DataSourceID="SqlDataSource1" 
                            ForeColor="Black" GridLines="Horizontal" AllowPaging="True" 
                            AllowSorting="True" Width="99%" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SNo" HeaderText="SNo" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="SNo" />
                                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                    SortExpression="UserID" />
                                <asp:BoundField DataField="FriendsID" HeaderText="FriendsID" 
                                    SortExpression="FriendsID" />
                                <asp:BoundField DataField="Status" HeaderText="Status" 
                                    SortExpression="Status" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                           <%-- <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />--%>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strcon %>" 
                            SelectCommand="SELECT * FROM [tblFriendsList]"></asp:SqlDataSource>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <h2>
                            registration report</h2>
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                            DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical" 
                            Width="99%" PageSize="5">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                                    SortExpression="UserID" />
                                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                                    SortExpression="UserName" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                                    SortExpression="Gender" />
                                <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                                <asp:BoundField DataField="EmailID" HeaderText="EmailID" 
                                    SortExpression="EmailID" />
                                <asp:BoundField DataField="MobileNumber" HeaderText="MobileNumber" 
                                    SortExpression="MobileNumber" />
                                <asp:BoundField DataField="Address" HeaderText="Address" 
                                    SortExpression="Address" />
                                <asp:TemplateField HeaderText="Photo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" Height="50px" 
                                            ImageUrl='<%# Eval("Photo") %>' Width="50px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <%--<SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />--%>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strcon %>" 
                            SelectCommand="SELECT [UserID], [UserName], [Gender], [DOB], [EmailID], [MobileNumber], [Address], [Photo] FROM [tblRegistration] ORDER BY [UserName], [EmailID], [MobileNumber]">
                        </asp:SqlDataSource>
                        <br />

                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

