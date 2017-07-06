<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Print.aspx.vb" Inherits="Patient_Print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .btn-lg
        {}
        .style2
        {
            height: 34px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

    <table align="center" width="50%" id="tbl_print" runat="server">
    
    
    <tr style="text-align: center;background-color:Navy;color:White;"><td colspan="1" >
       <img id="Img1" runat="server" src="~/Masters/images/logo.png" alt=""><br />

     <span style="font-family: Fixedsys; font-size: x-large; font-weight: lighter"> We Care
</span> 
    </td><td>
    <p style="font-weight:bold; font-size:30px;">We Care Hospital Pvt. Ltd.</p>
    
    <p style="font-size:large;">   Panskura, Panskura RS, Purba Medinipur</p> </td></tr>
    
    
    
    
    
    <tr><td colspan="2" 
            
            style="text-align: center; font-weight: 700; font-size: x-large; text-decoration: underline;">Patient Appointment Copy</td></tr>
    
    
    
    
    
    <tr><td colspan="2">
    
    <table align="left" cellpadding="5" cellspacing="5">
    <tr><td class="style2">Patient ID</td>  <td class="style2"></td>  
        <td class="style2">
        <asp:Label ID="Label_pid" runat="server"></asp:Label>
        </td></tr>
    <tr><td>Appoint ID</td>  <td>&nbsp;</td>  <td>
        <asp:Label ID="Label_app_id" runat="server"></asp:Label>
        </td></tr>
    <tr><td>Patient Name</td>  <td></td>  <td>
        <asp:Label ID="Label_pname" runat="server"></asp:Label>
        </td></tr>
    <tr><td class="style2">Doctor Name</td>  <td class="style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;</td>  <td class="style2">
        <asp:Label ID="Label_docName" runat="server"></asp:Label>
        </td></tr>
    <tr><td>Appointment Date </td>  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;</td>  <td>
        <asp:Label ID="Label_appDate" runat="server" Text=""></asp:Label>
        </td></tr>
    <tr><td>Appointment Time</td>     
        <td>
        </td>
        <td>
        <asp:Label ID="Label_appTime" runat="server" Text=""></asp:Label>
        </td></tr>
        
    <tr><td class="style2" colspan="3" align="center"></td> 
    
        <asp:Image ID="Image_pid" runat="server" />
        
    
    
        </tr>
        
    </table>
    
    
    
    </td></tr>
    
    
    
    
    
    <tr><td colspan="2" align="center">
        <br />
        <br />
        Please contact MRO for any kind of help.<br />
        <br />
        Thanking you<br />
      
      
        </td></tr>




       


    
    
    
    
    
    <tr><td colspan="2" align="right">
        
       
       <input type="button"  onclick="window.print()" style="border: thin solid #000000; padding: inherit; width: 100px; font-family: fantasy; line-height: inherit; background-color: #00FFFF;" 
            value="Print" ></a>
     
        </td></tr>




       


    
    
    
    
    
    </table>


    </div>
    
  
    </form>
</body>
</html>
