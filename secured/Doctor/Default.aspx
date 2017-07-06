<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Doctor.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="secured_Doctor_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">


Open Patient Worksheet

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">



<div class="col-md-6 col-md-offset-3">

  <div class="panel panel-primary" id="div_app_id" runat="server">
    <div class="panel-body">
        <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

        <div class="row">
        <div class="col-md-3">Enter Appointment ID</div>
        <div class="col-md-9">
            <asp:TextBox ID="TextBox_appId" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
        
        </div>
        <div class="col-md-3">
        
         <asp:Button ID="Button_submit" runat="server" Text="SUBMIT" CssClass="btn btn-success  " />
      
        </div>
        </div>
       

       


    </div>
</div>

</div>
</asp:Content>

