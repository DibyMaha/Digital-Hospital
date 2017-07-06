<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/View.master" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Accounts_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">


    User Sign In

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">



    


    <div class="col-md-6 col-md-offset-3">
    

    <asp:Label runat="server" ID="Label_Status"></asp:Label>


        <div class="panel panel-primary"><div class="panel-body">  
        
        
             
            <div class="form-group">
            <label>Username</label>
                <asp:TextBox ID="TextBox_username" runat="server" CssClass="form-control" Width="300px"></asp:TextBox>
            </div>
     <div class="form-group">
            <label>Password</label>
                <asp:TextBox ID="TextBox_password" runat="server"  CssClass="form-control" Width="300px" TextMode="Password"></asp:TextBox>
            </div>
        <asp:Button ID="Button_signIn" runat="server" Text="Sign In"  CssClass="btn btn-success"/>



    </div></div> 
    
    </div>

</asp:Content>

