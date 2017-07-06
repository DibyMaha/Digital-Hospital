<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PatientPrecription.aspx.vb" Inherits="secured_RO_PatientPrecription" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>
    
            <table runat="server" id="tbl_patient_details" visible="false" align="center" width="100%" style="border:2px solid Black; padding:5px;" cellpadding="5" >
                       <tr> 
                       <td style="text-align:center;"><img id="Img1" runat="server" src="~/Masters/images/logo.png" alt=""><br />
                       <span style="font-family: Fixedsys; font-size: x-large; font-weight: lighter"> &nbsp;&nbsp;&nbsp;We Care</span>
                        </td> 
              
                        <td align="right">   <asp:Label ID="Label_Dr_name" runat="server" CssClass="style1" Text="" Font-Size="X-Large"></asp:Label>
                        <br>
                        <asp:Label ID="Label_Dr_qualification" runat="server" CssClass="style1" Text="" ></asp:Label>
                        </td>
                      </tr>
              
                       <tr> 
                       <td style="text-align:center;" colspan="2"><hr /></td> 
              
                      </tr>
              
                    <tr><td>
                                    <table>



                    <tr style="font-size:large;font-weight:bold;"><td>
                        Appointment ID</td>
                    <td class="style1">
                    <asp:Label ID="Label_appointmentId" runat="server" CssClass="style1" Text=""></asp:Label>
                    </td>
                    </tr>   

                    <tr><td>
                    Patient Id
                      </td>
                    <td class="style1">
                    <asp:Label ID="Label_patient_id" runat="server" CssClass="style1" Text=""></asp:Label>
                    </td>
                    </tr>   
                    
                    <tr><td>
                        Name</td>
                    <td class="style1">
                        <asp:Label ID="Label_patient_name" runat="server" CssClass="style1" Text=""></asp:Label>
                        </td>
                    </tr>   
                    
                    <tr><td>
                        Address</td>
                    <td class="style1">
                        <asp:Label ID="Label_patient_address" runat="server" CssClass="style1" Text=""></asp:Label>
                        </td>
                    </tr>   
                    
                    </table>   
                    
               </td>
                        <td>

                         <table>
                    <tr><td>
                    Date and Time
                      </td>
                    <td class="style1">
                    <asp:Label ID="Label_dateandTime" runat="server" CssClass="style1" Text=""></asp:Label>
                    </td>
                    </tr>   
                    <tr><td>
                         Sex</td>
                    <td class="style1">
                        <asp:Label ID="Label_sex" runat="server" CssClass="style1" Text=""></asp:Label>
                        </td>
                    </tr>   
                    
                    <tr><td>
                        Age</td>
                    <td class="style1">
                        <asp:Label ID="Label_age" runat="server" CssClass="style1" Text=""></asp:Label>
                        </td>
                    </tr>   
                    
                    </table>   
                    



                        </td>
                       </tr>



                      <tr>  <td style="text-align:center;" colspan="2"><hr /></td> </tr>


         <tr> <td class="style2" align="center" 
                 style="height:300px; border-right-style: solid; border-right-width: medium; border-right-color: #FF0000;" 
                 valign="top"> 
         
                <h2><u>Case History</u></h2>       
         </td>
          <td class="style2" align="center" valign="top">
              <h2><u>Medicine</u></h2>
          </td> 
          </tr>


         

         <tr>
         <td class="style2" align="center" rowspan="2"   style="height:500px; border-right-style: solid; border-right-width: medium; border-right-color: #FF0000;"  valign="top">
               <h2 ><u> Diagonosis and Advice</u></h2>
         </td>
         <%--<td class="style2" align="center" valign="top">
         <h2 ><u>Medicine</u></h2>
               </td> --%>
               
         </tr>

         <tr> <td class="style1" align="center">
         <input type="button"  onclick="window.print()" style="border: thin solid #000000; padding: inherit; width: 100px; font-family: fantasy; line-height: inherit; background-color: #00FFFF;" 
            value="Print" ></a>
            </td> </tr>

                     



         </table>









    </div>
    </form>
</body>
</html>
