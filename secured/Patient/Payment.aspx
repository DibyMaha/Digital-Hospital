<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/View.master" AutoEventWireup="false" CodeFile="Payment.aspx.vb" Inherits="Patient_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">


    Payment Demo Page

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">
    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>
<div class="col-md-4 col-md-offset-4">


    <asp:Button ID="Button_pay" runat="server" Text="Make Payment" CssClass="btn btn-block btn-warning btn-lg" />


</div>



</asp:Content>

