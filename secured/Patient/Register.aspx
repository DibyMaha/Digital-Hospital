<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/View.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Patient_Register" %>



<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">
    <p>
        &nbsp;</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">


<div class="col-md-8 col-md-offset-2">
  
  
  
  
    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>

    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
       
        
       
        <asp:View ID="View1" runat="server">
       


              <div class="panel panel-primary">
    
        <div class="panel-heading">
        
        Personal Details
        </div>
        

        <div class="panel-body" style="min-height:700px;">


        


        
               <div class="form-group">
            
                <label>Name of the Patient</label>
                   <asp:TextBox ID="TextBox_name" runat="server" CssClass="form-control"></asp:TextBox>


                 
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator_name" runat="server" 
                       ControlToValidate="TextBox_name" CssClass="label label-danger" 
                       Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>


                </div>
            
                 <div class="form-group">
            
                <label>Date of Birth</label>
                   <asp:TextBox ID="TextBox_dob" runat="server" CssClass="form-control"></asp:TextBox>


                   
                   
                    
                 
                     <ajaxToolkit:CalendarExtender ID="TextBox_dob_CalendarExtender1" runat="server" 
                         BehaviorID="TextBox_dob_CalendarExtender1" TargetControlID="TextBox_dob" Format="yyyy-MM-dd" />


                   
                   
                    
                 
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator_dob" runat="server" 
                ControlToValidate="TextBox_dob" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator_dob" runat="server" 
                ControlToValidate="TextBox_dob" 
                Display="Dynamic" ErrorMessage="Invalid Date of Birth" SetFocusOnError="True" CssClass="label label-danger" 
                ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>

                 

                 </div>


        
           <div class="form-group">
            
                <label>Email Address</label>
                   <asp:TextBox ID="TextBox_email" runat="server" CssClass="form-control"></asp:TextBox>

                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="TextBox_email" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
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
            
                <label>Gender</label>
               <asp:RadioButtonList ID="RadioButtonList_gender" runat="server" 
                  RepeatColumns="3" CellPadding="5" CellSpacing="5">
                   <asp:ListItem Value="M">&nbsp; Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:ListItem>
                   <asp:ListItem Value="F">&nbsp; Female&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </asp:ListItem>
                   <asp:ListItem Value="O">&nbsp;Other </asp:ListItem>
               </asp:RadioButtonList>

               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Select any Gender" ControlToValidate="RadioButtonList_gender" 
                    Display="Dynamic" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </div>
        
        
           <div class="form-group">
            
                <label>Address 1</label>
                   <asp:TextBox ID="TextBox_address1" runat="server" CssClass="form-control"></asp:TextBox>

                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox_address1" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>

                </div>
        
        
           <div class="form-group">
            
                <label>Address 2</label>
                   <asp:TextBox ID="TextBox_address2" runat="server" CssClass="form-control"></asp:TextBox>

                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox_address2" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>


                </div>
        
        
           <div class="form-group">
            
                <label>Address 3</label>
                   <asp:TextBox ID="TextBox_address3" runat="server" CssClass="form-control"></asp:TextBox>

                </div>
        
        
           <div class="form-group">
            
                <label>PIN</label>
                   <asp:TextBox ID="TextBox_pin" runat="server" CssClass="form-control"></asp:TextBox>

                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox_pin" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Required Field" SetFocusOnError="True"></asp:RequiredFieldValidator>
           
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox_pin" CssClass="label-label-danger" 
                Display="Dynamic" ErrorMessage="Invalid Pin " SetFocusOnError="True" 
                ValidationExpression="\d{6}"></asp:RegularExpressionValidator>

                </div>
   
            <asp:Button ID="Button_submit" runat="server" Text="SUBMIT DETAILS" CssClass="btn btn-lg btn-success" />
        
        
        </div>
         
        
    
        
        
        
        
         </div>
   




         </asp:View>



        <asp:View ID="View2" runat="server">


            <asp:Label ID="Label_success" runat="server" Text=""></asp:Label>


        </asp:View>


    </asp:MultiView>
   
    


</div>



</asp:Content>

