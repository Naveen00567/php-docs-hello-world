<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="projects.aspx.cs" Inherits="projects" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
       Project Information
    </h2>
    <p class="MsoNormal">
        <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The system entitled “Combined Authentication Based Multilevel Access Social Networking” is web application software. This aims at the development of Multilevel Access Control to communicate and share information and ideas. CAML is based on Bioinformatics. The authentication is done using the finger print/face scanned image.&nbsp; <o:p></o:p></span>
    </p>
    <p class="MsoNormal">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>A common biometric authentication is to capture the biometric features of all users at the enrollment phase and to store the generated templates in a reference database. During the authentication phase, new measurements are matched against the original template in the reference database <o:p></o:p></span>
    </p>
    <p class="MsoNormal">
        <span><o:p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </o:p>
        Biometric data are noisy. Because of variable presentation, a matching test is inexact and inaccurate. The ability of authentication depends on technologies such as False Acceptance Rate (FAR) or False Rejection Rate (FRR).<o:p></o:p></span></p>
    <p class="MsoNormal">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>The fact that biometric templates are stored in a database can cause a number of security and privacy risks. One of the most serious problems is impersonation. An attacker steals templates in a database and constructs artificial biometrics that pass authentication. It can make the exposure of sensitive personal information much easier. The using frequency of a biometric has influence on its security. The more frequently a biometric is used, the lessee cure it is. This is because people may leave fingerprints anywhere, and iris images may be captured by a hidden camera, so that biometrics can be found and copied easily. Biometric features are inherent and unique, and it means that they cannot be changed. The unchanging biometric features are hard to be updated, reissued, or destroyed when the biometric is compromised. Therefore, once compromised, it may cause some problems as well as verification. <o:p></o:p></span>
    </p>
    <p class="MsoNormal">
        <span><o:p>&nbsp;</o:p></span></p>
</asp:Content>

<asp:Content ID="Content1" runat="server" contentplaceholderid="NavContent">
    <nav id="navigation">
    <ul runat="server" id="menu">
        <li><a href="default.aspx">Home</a></li>
        <li><a href="about.aspx">About Us</a></li>
        <li  class="active"><a href="projects.aspx">Project Info</a></li>
        <li><a href="login.aspx">Login</a></li>
    </ul>
    </nav>
</asp:Content>


