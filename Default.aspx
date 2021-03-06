﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


      <link rel="stylesheet" href="Masters_Home/css/style.css" type="text/css">


</head>
<body>
    <form id="form1" runat="server">
    <div class="background">
		<div class="page">

        <table><tr>
        
        <td width="100px">  <img id="Img1" src="~/masters/images/logo.png" runat="server" /></td>
        <td width="600px">  <a style="padding-top:20px;"  href="index.html" id="logo"> We Care Hospital</a></td>
        <td width="*" align="right">
        
        
         <div style="float:right;">

       <asp:LoginView ID="LoginView1" runat="server">
                                
                                <AnonymousTemplate>Hello Guest !
                                
                                <asp:LoginStatus ID="LoginStatus1" runat="server" ForeColor="#FFFFCC"></asp:LoginStatus>
                                </AnonymousTemplate>
                                

                                <LoggedInTemplate>
                                
                                Hi <asp:LoginName ID="LoginName1" runat="server"></asp:LoginName>
                                <asp:LoginStatus ID="LoginStatus2" runat="server" ForeColor="#FF9933"></asp:LoginStatus>
                                
                                </LoggedInTemplate>


                                </asp:LoginView>


      </div>
        </td>

        </tr></table>
      
      
			
			<div class="sidebar">

           

      
				<ul>
					<li class="selected">
						<a href="index.html">Home</a>
					</li>
					<li>
						<a href="programs.html">Programs</a>
					</li>
					<li>
						<a href="about.html">About</a>
					</li>
					<li>
						<a href="services.html">Services</a>
					</li>
					<li>
						<a href="blog.html">Blog</a>
					</li>
					<li>
						<a href="contact.html">Contact</a>
					</li>
				</ul>
				<div class="first">



                     <div>
						<h3>Find a Doctor</h3>
					

                        
                                <a id="A1" href="~/secured/Patient/ListDoctor.aspx" runat="server"> <img src="Masters_Home/images/doc_find.png" width="200px" /></a> 


					</div>


                    </div><div>

					<div>
						<h3>Available Specialities</h3>
						

                          <asp:Label ID="Label_departments" runat="server" Text=""></asp:Label>


					</div>



               

				</div>
				
			</div>
			<div class="body">
				<div class="home">
					<div class="featured">
						<img src="Masters_Home/images/doctors.jpg" alt="">
						<div>
							<p>
								Combining the best specialists and equipment to provide you nothing short of the best in healthcare
							</p>
						</div>
					</div>
					<div>
						<div>
							<div>
								<h4>Programs</h4>
								
								<p>
								We Care Prism helps you receive, store and access all your health information online.<br /><img src="Masters_Home/images/we-prism.png" height="100px" alt="" align="bottom">
								</p>
								<span><a href="programs.html">Learn More</a></span>
							</div>
							<div>
								<h4>Specialities Available</h4>
								<h2>A lage number of specialities are available in our hospital</h2>
								
                                


								<span><a href="programs.html">Learn More</a></span>
							</div>
						</div>
						<div>
							<h4>Patient's Speak</h4>
							
							
					
						<img src="Masters_Home/images/man.jpg" alt="">
						
                        <br />
	                    <p style="font-size:12px;">
							Thanks for an extremely nice treatment provided at Mulund Fortis Hospital by Dr. Naresh Mehta & his team. The nursing staff there is very well trained, caring, supportive & selfless.
						</p>
                           

							<span><a href="#">See More</a></span>
						</div>
					</div>
				</div>
			</div>
			<div class="footer">
				<div>
					<div>
						<h4>Blog</h4>
						<p>
							This website template has been designed by Free Website Templates for you, for free. You can replace all this text with your own text.
						</p>
						<a href="blog.html">Go To Blog</a>
					</div>
					<div>
						<h4>Links</h4>
						<ul>
							<li>
								<a href="index.html">Home</a>
							</li>
							<li>
								<a href="programs.html">Programs</a>
							</li>
							<li>
								<a href="about.html">About</a>
							</li>
							<li>
								<a href="services.html">Services</a>
							</li>
							<li>
								<a href="blog.html">Blog</a>
							</li>
							<li>
								<a href="contact.html">Contact</a>
							</li>
						</ul>
					</div>
					<div class="connect">
						<h4>Keep In Touch</h4>
						<a href="http://freewebsitetemplates.com/go/twitter/" id="twitter">twitter</a> <a href="http://freewebsitetemplates.com/go/facebook/" id="facebook">facebook</a> <a href="http://freewebsitetemplates.com/go/googleplus/" id="googleplus">google+</a>
					</div>
				</div>
				<p>
					&#169; Copyright 2012. All rights reserved
				</p>
			</div>
		</div>
	</div>
     </form>
</body>
</html>
