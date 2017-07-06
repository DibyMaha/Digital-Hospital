<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Admin.master" AutoEventWireup="false" CodeFile="DoctorProfile.aspx.vb" Inherits="secured_Doctor_Doctor_s_Profile_DoctorProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">


    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

<div id="div_updateProfile" runat="server">


 <div class="col-md-5 bg-info" style="padding:20px;min-height:600px;">
    
        <h3>Doctor Profile Upload for user
            <asp:Label ID="Label_username" runat="server" Text=""></asp:Label>
        </h3>

     <br />  


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
            
            <label>Name</label>
             <asp:TextBox ID="TextBox_name" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox_name" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
     
        
        </div>
          
          



             <div class="form-group">
            
            <label>Experience In Year</label>
             <asp:TextBox ID="TextBox_ExperienceYear" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox_ExperienceYear" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ControlToValidate="TextBox_ExperienceYear" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Invalid Data" SetFocusOnError="True" 
                ValidationExpression="\d\d?(.)?\d?\d?"></asp:RegularExpressionValidator>
        
        
        </div>
          
          


             <div class="form-group">
            
            <label>Personal Details</label>
             <asp:TextBox ID="TextBox_PersonalDetails" runat="server" CssClass="form-control" 
                     TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox_PersonalDetails" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
        
        
        </div>


         <div class="form-group">


         
         <div class="col-md-6">
         
          <label>Picture</label>&nbsp;
             <asp:FileUpload ID="FileUpload1" runat="server" Width="576px" />

        </div>

        <div class="col-md-6">
        
            <asp:Image ID="Image1" runat="server" Width="120" Height="150" />
        
        </div>


         </div>

          
          

          

    
                  



    </div>


 <div class="col-md-3 bg-warning" style="padding:20px;min-height:600px;">
    
  <h3>Specilization
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </h3>

     <br />
     <asp:CheckBoxList ID="CheckBoxList_specialization" runat="server" 
                AppendDataBoundItems="True" 
          DataSourceID="SqlDataSource_specialization" 
         DataTextField="s_name" DataValueField="s_serial">
     </asp:CheckBoxList>

     <asp:SqlDataSource ID="SqlDataSource_specialization" runat="server" 
         ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
         
         SelectCommand="SELECT s_serial, s_name, dept_serial FROM specialization_master WHERE (dept_serial = @dept_serial) ORDER BY s_name">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList_Dept" Name="dept_serial" 
                 PropertyName="SelectedValue"  />
         </SelectParameters>
     </asp:SqlDataSource>

     <br />

 
 </div>


  <div class="col-md-4 bg-info" style="padding:20px;min-height:600px;">
  <h3>Qualification
   <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </h3>
      <asp:CheckBoxList ID="CheckBoxList_qualification" runat="server" 
          DataSourceID="SqlDataSource_qualification" DataTextField="q_name" 
          DataValueField="q_serial" RepeatColumns="3" Height="17px" Width="300px">
      </asp:CheckBoxList>
      <asp:SqlDataSource ID="SqlDataSource_qualification" runat="server" 
          ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
          
          SelectCommand="SELECT [q_serial], [q_name] FROM [qualification_master] ORDER BY [q_name]">
      </asp:SqlDataSource>
 </div>


 <div class="clearfix">
 
 </div>
 <br />
 
 <br />

  <asp:Button ID="Button_save" runat="server" Text="Update Details" CssClass="btn btn-success btn-lg col-md-4 col-md-offset-4" />

 

</div>


</asp:Content>

