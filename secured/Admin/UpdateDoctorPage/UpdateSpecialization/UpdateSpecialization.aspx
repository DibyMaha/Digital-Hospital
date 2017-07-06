<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Admin.master" AutoEventWireup="false" CodeFile="UpdateSpecialization.aspx.vb" Inherits="secured_Admin_UpdateDoctorPage_UpdateSpecialization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">

 <div class="row">
    
     <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

    
    </div>

      <br />     


<h3>Add New Doctor Specialization
            </h3>

     <br />

     <div class="col-md-6 bg- bg-info" >
    
       <div class="form-group">
            
            <label>Department</label>

              <asp:DropDownList ID="DropDownList_Dept" runat="server"  
                AppendDataBoundItems="True" CssClass="form-control"
                DataSourceID="SqlDataSource_depat" DataTextField="dept_name" 
                DataValueField="dept_serial" AutoPostBack="True" >
                <asp:ListItem Value="0">Please Select</asp:ListItem>
            </asp:DropDownList>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ControlToValidate="DropDownList_Dept" CssClass="label-label-danger" 
                Display="Dynamic" ErrorMessage="Select Department" SetFocusOnError="True" 
                ValidationExpression="\d\d?"></asp:RegularExpressionValidator>
            <asp:SqlDataSource ID="SqlDataSource_depat" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                SelectCommand="SELECT * FROM [dept_master] ORDER BY [dept_name]">
            </asp:SqlDataSource>

            </div>




      
          
          


           <div class="form-group">
            
            <label>Specialization</label>
             <asp:TextBox ID="TextBox_Specialization" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox_Specialization" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
     
        
        </div>
           
           <br>
           <br>  
   
                  
           <asp:Button ID="Button_update" runat="server" Text="Update Specialization" 
             CssClass="btn btn-success btn-lg col-md-6 col-md-offset-2" />

 <br>  
  <br> 
  


 </div>


</asp:Content>

