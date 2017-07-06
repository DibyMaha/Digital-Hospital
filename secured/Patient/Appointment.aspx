<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/View.master" AutoEventWireup="false" CodeFile="Appointment.aspx.vb" Inherits="Patient_Appointment" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>





 





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">


Take Appointment Schedule

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">



 <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>



 <div class="row" id="div_appointmentOption" runat="server" visible="false">

<div class="col-md-3">


    <div class="form-group">
    
        <label>Select Date</label>
        <asp:TextBox ID="TextBoxDate" runat="server" CssClass="form-control" 
            AutoPostBack="True"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" 
            BehaviorID="TextBoxDate_CalendarExtender" Format="yyyy-MM-dd" 
            TargetControlID="TextBoxDate" />
    </div>
    <asp:Button ID="Button_Check" runat="server" Text="Check Availability" CssClass="btn btn-warning"  Width="150px"   />


</div>


<div class="col-md-9">


   <h3>Available Slots</h3>
   <br />
<asp:Label ID="Label_countRows" runat="server" Text=""></asp:Label>
<br />
    <asp:RadioButtonList ID="RadioButtonList_availability" runat="server" CssClass="table" RepeatColumns="4">
    </asp:RadioButtonList>
    
    <br /><br />
    <asp:Button ID="Button_book" runat="server" Text="Book Slot" CssClass="btn btn-block btn-success btn-lg" Visible="false" />


</div>

</div>
   

</asp:Content>

