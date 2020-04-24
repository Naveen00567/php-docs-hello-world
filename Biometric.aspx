<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Biometric.aspx.cs" Inherits="Biometric" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style2" bgcolor="White" width="100%">
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" class="style2" align="center">
                    <tr>
                        <td align="center">
                        &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Names="Tahoma" 
                            Font-Size="Large" ForeColor="#17668D" Text="Biometric Authentication"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <hr /></td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblMessage" runat="server" Font-Names="Verdana" 
                            Font-Size="Small" ForeColor="#FF3300"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table cellpadding="0" cellspacing="0" class="style2">
                                <tr>
                                    <td align="left" rowspan="5">
                                        <img alt="" src="images/biometric.gif" style="width: 132px; height: 132px" /></td>
                                    <td align="left" nowrap="nowrap">
                                    <asp:Label ID="lblEmployeeId0" runat="server" Font-Names="Garamond" 
                                        Font-Size="Medium" ForeColor="#176694" Text="Browse The finger print Image"></asp:Label>
                                    </td>
                                    <td style="width: 2px; height: 51px;">
                                    </td>
                                    <td align="left" style="width: 148px; height: 51px;">
                                        <input id="File3" runat="server" name="File3" size="25" type="file" /></td>
                                    <td style="width: 196px; text-align: left; height: 51px;">
                                        <asp:Image ID="Image3" runat="server" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="width: 190px">
                                        &nbsp;</td>
                                    <td style="width: 2px">
                                        &nbsp;</td>
                                    <td align="left" style="width: 148px">
                                    &nbsp;</td>
                                    <td style="width: 196px; text-align: left;">
                                    &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 190px">
                                        &nbsp;</td>
                                    <td style="width: 2px">
                                        &nbsp;</td>
                                    <td align="left" style="width: 148px">
                                        <asp:Button ID="btnSubmit" runat="server" BackColor="#176694" 
                                        BorderColor="#176694" Font-Bold="True" ForeColor="White" 
                                        onclick="btnSubmit_Click" Text="Verify" />
                                    </td>
                                    <td style="width: 196px">
                                    &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" style="width: 190px">
                                        &nbsp;</td>
                                    <td style="width: 2px">
                                        &nbsp;</td>
                                    <td align="left" style="width: 148px">
                                    &nbsp;</td>
                                    <td style="width: 196px">
                                    &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" style="width: 190px">
                                        &nbsp;</td>
                                    <td style="width: 2px">
                                        &nbsp;</td>
                                    <td align="left" style="width: 148px">
                                    &nbsp;</td>
                                    <td style="width: 196px">
                                    &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

