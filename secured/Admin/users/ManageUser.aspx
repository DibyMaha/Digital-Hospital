<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Admin.master" AutoEventWireup="false" CodeFile="ManageUser.aspx.vb" Inherits="secured_Admin_users_ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">

    
    <div class="row">
    
     <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

    
    </div>

      <br />     
    

    <div class="col-md-5 bg-info" style="padding:20px;">
    
        <h3>New User Information</h3>

     <br />




        <div class="form-group">
            
            <label>Username</label>
             <asp:TextBox ID="TextBox_username" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox_username" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
        
        </div>
          
          


           <div class="form-group">
            
            <label>Password</label>
             <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox_password" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
      <br />     <asp:Button ID="Button_generatePassword" runat="server" Text="Generate"  CssClass="btn btn-warning"
                ValidationGroup="GeneratePassword" />
        
        </div>
          
          



             <div class="form-group">
            
            <label>Email</label>
             <asp:TextBox ID="TextBox_email" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox_email" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox_email" CssClass="label-label-danger" 
                Display="Dynamic" ErrorMessage="Invalid Email" SetFocusOnError="True" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
           
        
        </div>
          
          


             <div class="form-group">
            
            <label>Mobile</label>
             <asp:TextBox ID="TextBox_mobile" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox_mobile" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBox_mobile" CssClass="label-label-danger" 
                Display="Dynamic" ErrorMessage="Invalid Mobile" SetFocusOnError="True" 
                ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
        
        
        </div>
          
          

            <div class="form-group">
            
            <label>User Type</label>

              <asp:DropDownList ID="DropDownList_userType" runat="server"  AppendDataBoundItems="true" CssClass="form-control"
                DataSourceID="SqlDataSource_userTypes" DataTextField="type_name" 
                DataValueField="type_serial" >
                <asp:ListItem Value="x">Please Select</asp:ListItem>
            </asp:DropDownList>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ControlToValidate="DropDownList_userType" CssClass="label-label-danger" 
                Display="Dynamic" ErrorMessage="Select User Type" SetFocusOnError="True" 
                ValidationExpression="\d\d?"></asp:RegularExpressionValidator>
            <asp:SqlDataSource ID="SqlDataSource_userTypes" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                SelectCommand="SELECT * FROM [user_type_master] ORDER BY [type_name]">
            </asp:SqlDataSource>

            </div>

    
                   <asp:Button ID="Button_submit" runat="server" Text="Submit" CssClass="btn btn-success btn-lg" />




    </div>


    <div class="col-md-1"></div>

    <div class="col-md-6"  style="padding:20px;">
    

        <div class="panel panel-primary" >
        
            <div class="panel-heading">
            
             <h3>Present Users</h3><br />
            
            </div>
        
            <div class="panel-body"  >
            
                    
        <asp:GridView ID="GridView_Users" runat="server" AutoGenerateColumns="False"  CssClass="grid-top"
            DataKeyNames="username" DataSourceID="SqlDataSource_Users" Font-Bold="True" 
                    ForeColor="Black" Height="18px" Width="700px">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" 
                    SortExpression="username" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="mobile" HeaderText="mobile" 
                    SortExpression="mobile" />
                <asp:BoundField DataField="type_name" HeaderText="type_name" 
                    SortExpression="type_name" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    
    
        <asp:SqlDataSource ID="SqlDataSource_Users" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
            DeleteCommand="DELETE FROM user_accounts WHERE (username = @username)" 
            SelectCommand="SELECT user_accounts.username, user_accounts.email, user_accounts.mobile, user_type_master.type_name FROM user_accounts INNER JOIN user_type_master ON user_accounts.user_type = user_type_master.type_serial ORDER BY user_accounts.username">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView_Users" Name="username" 
                    PropertyName="SelectedValue" />
            </DeleteParameters>
        </asp:SqlDataSource>
    
    
            
            
            </div>
        
        </div>


    
     
    </div>


</asp:Content>

