<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/RO.master" AutoEventWireup="false" CodeFile="ConfirmPatient.aspx.vb" Inherits="secured_RO_ConfirmPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">

td
{
    padding:10px;
}


    .style1
    {
        font-weight: bold;
    }


    .style2
    {
        height: 40px;
    }


</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">
 
 <div class="col-md-8 col-md-offset-2">


        <table align="center" frame="box"><tr><td>
        
            
            <table cellpadding="10" cellspacing="10">
            <tr><td colspan="3">
                <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>
                </td></tr>
            <tr><td>Enter Appointment ID</td><td>
                <asp:TextBox ID="TextBox_app_id" runat="server" CssClass="form-control" Width="200px"></asp:TextBox>
                </td><td>
                    <asp:Button ID="Button_display" runat="server" Text="SHOW DETAILS" CssClass="btn btn-default btn-warning" Width="150px" />
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_appId" runat="server" 
                ControlToValidate="TextBox_app_id" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
            <asp:RegularExpressionValidator ID="RegularExpressionValidator_app_id" runat="server" 
                ControlToValidate="TextBox_app_id" CssClass="label-label-danger" 
                Display="Dynamic" ErrorMessage="Invalid Appointment ID" SetFocusOnError="True" 
                ValidationExpression="\d{13}"></asp:RegularExpressionValidator>


                </td></tr>
            <tr><td colspan="3">
            
            
                <table runat="server" id="tbl_patient_details" visible="false">
                
                    <tr><td>Name</td><td>
                        <asp:Label ID="Label_name" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td>Address</td><td>
                        <asp:Label ID="Label_address" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td>Appointment Date &amp; Time</td><td>
                        <asp:Label ID="Label_app_dateTime" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td>Name of the Doctor</td><td>
                        <asp:Label ID="Label_doc_name" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td class="style2"></td><td class="style2"></td></tr>
                    <tr><td colspan="2" align="center" >
                    
                    
                    
                        <asp:Button ID="Button_print" runat="server" 
                            CssClass="btn btn-default btn-success" Text="PRINT PRECRIPTION" 
                            Width="200px" />
                    
                    
                    
                    </td></tr>
                                    
                </table>
            
            
            
            </td></tr>
                      
            </table>
        
        
        
        </td></tr></table>

</div>

</asp:Content>

