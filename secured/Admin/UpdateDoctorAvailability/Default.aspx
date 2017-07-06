<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Admin.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="secured_Admin_UpdateDoctorAvailability_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
.table
{
    color:White;
}

</style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">



    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>


        <div class="row">
        
            <div class="col-md-4 bg-info" style="padding:25px;">
            

                <div class="form-group">
                <label>Select Department</label>

              <asp:DropDownList ID="DropDownList_dept" runat="server"  AutoPostBack="true" 
                        AppendDataBoundItems="True" CssClass="form-control"
                DataSourceID="SqlDataSource_dept" DataTextField="dept_name" 
                DataValueField="dept_serial" >
                <asp:ListItem Value="0">Please Select</asp:ListItem>
            </asp:DropDownList>
            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ControlToValidate="DropDownList_dept" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Select User Type" SetFocusOnError="True" 
                ValidationExpression="\d\d?"></asp:RegularExpressionValidator>
            <asp:SqlDataSource ID="SqlDataSource_dept" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                SelectCommand="SELECT * FROM [dept_master] ORDER BY [dept_name]">
            </asp:SqlDataSource>


                    

                </div>

                <div class="form-group">
                <label>Select Doctor</label>

                    <asp:DropDownList ID="DropDownList_doctors" runat="server" 
                        CssClass="form-control" AppendDataBoundItems="True" 
                        DataSourceID="SqlDataSource_doctors" DataTextField="name" 
                        DataValueField="username" AutoPostBack="True">
                     <asp:ListItem Value="x">Please Select</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="DropDownList_dept" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Select User Type" SetFocusOnError="True" 
                ValidationExpression="\d\d?"></asp:RegularExpressionValidator>
                    <asp:SqlDataSource ID="SqlDataSource_doctors" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                        
                        SelectCommand="SELECT [username], [name] FROM [doctor_profile] WHERE ([dept_serial] = @dept_serial) ORDER BY [name]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList_dept" Name="dept_serial" 
                              Type="Int32" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>

         

                </div>
            
            
               <div class="form-group">
                
                    <label>Select Week Day</label>
                    <asp:DropDownList ID="DropDownList_weekDay" runat="server" 
                        CssClass="form-control" DataSourceID="SqlDataSource_weekDay" 
                        DataTextField="day_name" DataValueField="day_serial" AutoPostBack="True">
                    </asp:DropDownList>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="DropDownList_dept" CssClass="label label-danger" 
                Display="Dynamic" ErrorMessage="Select User Type" SetFocusOnError="True" 
                ValidationExpression="\d\d?"></asp:RegularExpressionValidator>
                    <asp:SqlDataSource ID="SqlDataSource_weekDay" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                        SelectCommand="SELECT * FROM [week_day_master] ORDER BY [day_serial]">
                    </asp:SqlDataSource>



                
                </div>
            


            <br /><br />
                <asp:Button ID="Button_submit" runat="server" Text="Submit"  CssClass="btn btn-success btn-block btn-lg"/>





            
            </div>
        
            <div class="col-md-8 bg-warning" style="padding:25px;">
            
            
                
            
         

                <h4>Select Slot</h4>
                <asp:CheckBoxList ID="CheckBoxList_slot" runat="server" 
                    DataSourceID="SqlDataSource_slot" DataTextField="slot_name" 
                    DataValueField="slot_serial" RepeatColumns="4" CellPadding="5" 
                    CellSpacing="5" CssClass="table" ForeColor="White" 
                    RepeatDirection="Horizontal">
                </asp:CheckBoxList>

            
                <asp:SqlDataSource ID="SqlDataSource_slot" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                    SelectCommand="SELECT * FROM [slot_master] ORDER BY [slot_serial]">
                </asp:SqlDataSource>

            
            </div>
        
        
        
        </div>





</asp:Content>

