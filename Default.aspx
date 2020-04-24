<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hangout</title>
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all">
    <script src="js/jquery-1.7.2.min.js"></script>
    <!--[if lt IE 9]><script src="js/modernizr.custom.js"></script><![endif]-->
    <script src="js/jquery.flexslider-min.js"></script>
    <script src="js/functions.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <!-- wrapper -->
    <div id="wrapper">
        <!-- shell -->
        <div class="shell">
            <!-- container -->
            <div class="container">
                <!-- header -->
                <header class="header">
        <h1 id="logo"><a href="default.aspx">Hangout</a></h1>
        <nav id="navigation">
          <ul>
            <li class="active"><a href="#">Home</a></li>
            <li><a href="about.aspx">About Us</a></li>           
            <li> <a href="projects.aspx">Project Info</a>
            <li> <a href="login.aspx">Login</a>
          </ul>
        </nav>
        <div class="cl">&nbsp;</div>
      </header>
                <!-- end of header -->
                <div class="main">
                    <!-- slider -->
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <img src="css/images/slide-img1.jpg" alt="Social Media">
                                <div class="slide-cnt">
                                    <h2>
                                        Multi-Authentication
                                        <br>
                                        Social Networking</h2>
                                    <p>
                                       This aims at the development of Multilevel Access Control to communicate and share information and ideas. CAML is based on Bioinformatics. The authentication is done using the finger print/face scanned image.</p>
                                </div>
                                <a href="projects.aspx" class="slider-btn"><span>Read Now</span></a> </li>
                            <li>
                                <img src="css/images/slide-img2.jpg" alt="Security">
                                <div class="slide-cnt">
                                    <h2>
                                        Secure Systems
                                        <br>
                                        Multi-modal System</h2>
                                    <p>
                                        A multimodal system, which combines the conclusions made by a number of unrelated biometrics indicators, can overcome many of these restrictions.</p>
                                </div>
                                <a href="projects.aspx" class="slider-btn"><span>Read Now</span></a> </li>
                            <li>
                                <img src="css/images/slide-img3.jpg" alt="Biometric">
                                <div class="slide-cnt">
                                    <h2>
                                        Biometric
                                        <br>
                                        Enhanced Security</h2>
                                    <p style="color:White">
                                        Biometric features are inherent and unique, and it means that they cannot be changed. The unchanging biometric features are hard to be updated, reissued, or destroyed when the biometric is compromised.</p>
                                </div>
                                <a href="projects.aspx" class="slider-btn"><span>Read Now</span></a> </li>
                        </ul>
                    </div>
                    <!-- end of slider -->
                    <!-- cols -->
                    <section class="cols">
          <div class="col">
            <h3><a href="#">Basic Authentication</a></h3>
            <p>In this module, the username and password is authenticated by the server as we see in most of the applications. </p>
            <br />
            <a href="#" class="col-btn">Read More</a></div>
          <div class="col">
            <h3><a href="#">Biometric Authentication</a></h3>
            <p>Here, a biometric simulation is setup. The user is supposed to select his finger-print image from his system, which is authenticated by the server. </p>
            <a href="#" class="col-btn">Read More</a> </div>
          <div class="col">
            <h3><a href="#">Social Media</a></h3>
            <p>Social media allows all sections of the people to come together and air their views without any restrictions. </p>
            <br />            
            <a href="#" class="col-btn">Read More</a> </div>
          <div class="col">
            <h3><a href="#">Other Features</a></h3>
            <div style="margin-left:10px;"> 
            <ul>
            <li>Send/Receive Emails</li>
            <li>News Feed</li>
            <li>Friend List/Search/Request</li>
            <li>Privacy Settings</li>
            </ul>
            </div>
            <br />
            <a href="#" class="col-btn">Read More</a> </div>
        </section>
                    <section class="services">
          <div class="cl">&nbsp;</div>
        </section>
                    <!-- end of services -->
                </div>
                <!-- end of main -->
            </div>
            <!-- end of container -->
            <div class="footer">
                <nav class="footer-nav">
        <ul>
          <li><a href="default.aspx">Home</a></li>
          <li><a href="about.aspx">About Us</a></li>
          <li><a href="contact.aspx">Contact</a></li>
        </ul>
      </nav>
                <p class="copy">
                    Copyright &copy; 2014 All Rights Reserved.
                </p>
            </div>
        </div>
        <!-- end of shell -->
    </div>
    <!-- end of wrapper-->
    </form>
</body>
</html>
