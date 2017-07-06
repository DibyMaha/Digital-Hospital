<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Admin.master" AutoEventWireup="false" CodeFile="UpdateQualification.aspx.vb" Inherits="secured_Admin_UpdateDoctorPage_NewFolder1_UpdateQualification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">
   
   <div class="row">
   
    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

 </div>
    
<h3>Add New Doctor Qualification</h3>
<br>

    <div class="col-md-6 bg- bg-info">

    <div class="form-group">

        <Label>Qualification</Label>
     
        <asp:TextBox ID="TextBox_Qualification" runat="server" CssClass="form-control"></asp:TextBox>
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_Qualification" 
            runat="server" ErrorMessage="RequiredField" Display="Dynamic" 
            CssClass="label label-danger" ControlToValidate="TextBox_Qualification" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <br>
    </div>

    
   
      <br>            
           <asp:Button ID="Button_update" runat="server" Text="Update Qualification" 
             CssClass="btn btn-success btn-lg col-md-6 col-md-offset-2" />


 
    </div>
</asp:Content>

