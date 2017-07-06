<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/View.master" AutoEventWireup="false" CodeFile="CheckRegistration.aspx.vb" Inherits="Patient_CheckRegistration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">

Check Registration

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">


    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>



<div class="row" id="div_register_login" runat="server">

<div class="col-md-6">
<div class="panel panel-info"  style="min-height:300px;">
<div class="panel-body">

<h2>If you are not registered patient</h2>
<br /><br /><br />

<a href="Register.aspx" class="btn btn-warning btn-lg">Register Now</a>


</div>
</div>
    
</div>


<div class="col-md-6">
    
<div class="panel panel-info" style="min-height:300px;">
<div class="panel-body">

<h2>If you are already registered patient</h2>
<br /><br />

<div class="form-group">
<label>Patient ID</label>
    <asp:TextBox ID="TextBox_PatientID" runat="server" CssClass="form-control" Width="400px" placeholder="13 Digit Patient ID" ></asp:TextBox>

     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox_PatientID" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox_PatientID" CssClass="label-label-danger" 
                Display="Dynamic" ErrorMessage="Invalid Patient ID" SetFocusOnError="True" 
                ValidationExpression="\d{13}"></asp:RegularExpressionValidator>

</div>


<div class="form-group">
<label>Date of Birth</label>
    <asp:TextBox ID="TextBox_dob" runat="server" CssClass="form-control" Width="400px" placeholder="yyyy-MM-dd"></asp:TextBox>

       <ajaxtoolkit:calendarextender ID="TextBox_dob_CalendarExtender" 
        runat="server" BehaviorID="TextBox_dob_CalendarExtender" Format="yyyy-MM-dd" 
        TargetControlID="TextBox_dob">
    </ajaxtoolkit:calendarextender>

       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox_dob" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBox_dob" 
                Display="Dynamic" ErrorMessage="Invalid Date of Birth" SetFocusOnError="True" CssClass="label label-danger" 
                ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>


</div>


   <asp:Button ID="Button_submit" runat="server" Text="Submit" CssClass="btn btn-success" Width="80px" />



</div>
</div>
</div>




</div>
    
</asp:Content>

