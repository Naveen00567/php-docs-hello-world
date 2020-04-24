<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About your team
    </h2>
    <p>
        Put content here.
    </p>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="NavContent">
    <nav id="navigation">
    <ul runat="server" id="menu">
        <li><a href="default.aspx">Home</a></li>
        <li class="active"><a href="about.aspx">About Us</a></li>
        <li><a href="projects.aspx">Project Info</a></li>
        <li><a href="login.aspx">Login</a></li>
    </ul>
    </nav>
</asp:Content>

