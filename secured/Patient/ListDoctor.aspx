<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/View.master" AutoEventWireup="false" CodeFile="ListDoctor.aspx.vb" Inherits="Patient_ListDoctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">

    Search Doctor


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">



    <div class="col-md-3" style="border-right-style: solid; border-width: thin">
    
 <h4>Filter by Department</h4>
    <table class="table table-bordered" style="height:200px; overflow:scroll;display:block;" ><tr><td>

       
        
        <asp:CheckBoxList ID="CheckBoxList_departments" runat="server" 
            DataSourceID="SqlDataSource_dept" DataTextField="dept_name" 
            DataValueField="dept_serial" AutoPostBack="True">
        </asp:CheckBoxList>

        <asp:SqlDataSource ID="SqlDataSource_dept" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
            SelectCommand="SELECT * FROM [dept_master] ORDER BY [dept_name]">
        </asp:SqlDataSource>

    </td></tr></table>


     <h4 runat="server" id="h4_specialization" visible="false" >Filter by Specialization</h4>
     <table class="table table-bordered" style="height:200px; overflow:scroll;display:block;"  id="tbl_specialization" runat="server" visible="false">


     <tr><td>
     
     
     
         <asp:CheckBoxList ID="CheckBoxList_specialization" runat="server" 
             AutoPostBack="True">
         </asp:CheckBoxList>
     
     
     </td></tr>

     </table>


      <h4>Filter by Qualification</h4>
     <table class="table table-bordered" style="height:200px; overflow:scroll;display:block;">
     
     <tr><td>


         <asp:CheckBoxList ID="CheckBoxList_qualification" runat="server" 
             AutoPostBack="True" DataSourceID="SqlDataSource_qualification" 
             DataTextField="q_name" DataValueField="q_serial">
         </asp:CheckBoxList>


         <asp:SqlDataSource ID="SqlDataSource_qualification" runat="server" 
             ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
             SelectCommand="SELECT [q_serial], [q_name] FROM [qualification_master] ORDER BY [q_name]">
         </asp:SqlDataSource>


     </td></tr>
     
     </table>
       <h4>Filter by Experience Year</h4>


       <asp:Button ID="Button_clearExpr" runat="server" Text="Clear" Width="50" />
        
     <table class="table table-bordered" style="height:200px; overflow:scroll;display:block;">
     

     <tr><td>

    
         <asp:RadioButtonList ID="RadioButtonList_experience_in_year" runat="server" AutoPostBack="True">


          <asp:ListItem Value="5">1 year to 5 year</asp:ListItem>
             <asp:ListItem Value="10">6 year to 10 year</asp:ListItem>
             <asp:ListItem Value="15">11 year to 15 year</asp:ListItem>
             <asp:ListItem Value="20">16 year to 20 year</asp:ListItem>
             <asp:ListItem Value="25">21 year to 25 year</asp:ListItem>
             <asp:ListItem Value="30">26 year to 30 year</asp:ListItem>
             <asp:ListItem Value="35">31 year to 35 year</asp:ListItem>
             <asp:ListItem Value="40">36 year to 40 year</asp:ListItem>
             <asp:ListItem Value="45">41 year to 45 year</asp:ListItem>
             <asp:ListItem Value="50">46 year to 50 year</asp:ListItem>
             <asp:ListItem Value="55">51 year to 55 year</asp:ListItem>
             <asp:ListItem Value="60">56 year to 60 year</asp:ListItem>
             

         </asp:RadioButtonList>



     </td></tr>
     
     </table>

    </div>



    
    <div class="col-md-9">
    
        <h3>List of Doctors</h3>
        <br />
      
       
           <asp:Label ID="Label_doctors" runat="server" Text=""></asp:Label>

        
      
    
    </div>




</asp:Content>

