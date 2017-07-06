<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Doctor.master" AutoEventWireup="false" CodeFile="PatientDetails.aspx.vb" Inherits="secured_Doctor_PatientDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">

td
{
    padding:10px;
}

</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">


Appointment Details for ID : 
    <asp:Label ID="Label_app_id" runat="server" Text=""></asp:Label>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">


    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>


        <table width="100%"><tr>
        
        <td width="30%" valign="top">
         <div class="alert alert-info"><h4>Patient Details</h4></div>
        <table runat="server" id="tbl_patient_details" visible="false" align="center" width="100%">
                
                    <tr><td>Name</td><td>
                        <asp:Label ID="Label_name" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td>Address</td><td>
                        <asp:Label ID="Label_address" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td>Appointment Date &amp; Time</td><td>
                        <asp:Label ID="Label_app_dateTime" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td>Name of the Doctor</td><td>
                        <asp:Label ID="Label_doc_name" runat="server" Text="" CssClass="style1"></asp:Label>
                        </td></tr>
                    <tr><td class="style2"></td><td class="style2"></td></tr>
                   
                                    
                </table>
        
        
        </td>
        <td width="30%" valign="top">
        

            <div class="alert alert-info"><h4>Test Reports / Prescriptions / Case History under this appointment</h4></div>

            <asp:DropDownList ID="DropDownList_reportType" runat="server" 
                CssClass="form-control" AutoPostBack="True">

             <asp:ListItem Text="Please Select" Value="0"></asp:ListItem>
            <asp:ListItem Text="Test Reports" Value="R"></asp:ListItem>
            <asp:ListItem Text="Prescriptions / Case History" Value="P"></asp:ListItem>

            </asp:DropDownList>
        
        <br />
            <asp:GridView ID="GridView_reports" runat="server" 
                CssClass="table table-bordered" AutoGenerateColumns="False" 
                DataKeyNames="file_path" DataSourceID="SqlDataSource_reports">
                <Columns>
                    <asp:BoundField DataField="serial" HeaderText="serial" InsertVisible="False" 
                        ReadOnly="True" SortExpression="serial" Visible="False" />
                    <asp:BoundField DataField="type_name" HeaderText="type_name" ReadOnly="True" 
                        SortExpression="type_name" />
                    <asp:BoundField DataField="file_path" HeaderText="file_path" 
                        SortExpression="file_path" Visible="False" />
                   
                    <asp:HyperLinkField DataNavigateUrlFields="file_path" 
                        DataNavigateUrlFormatString="{0}" HeaderText="View Reports" 
                        NavigateUrl="~/Files/Reports/" Target="_blank" Text="Cleck Here" />
                   
                </Columns>
            </asp:GridView>

        
        
            <asp:SqlDataSource ID="SqlDataSource_reports" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                SelectCommand="SELECT patient_reports.serial, report_type_master.type_group + '-' + report_type_master.type_name AS type_name, patient_reports.file_path FROM patient_reports INNER JOIN report_type_master ON patient_reports.report_type = report_type_master.type_serial WHERE (patient_reports.upload_type = @upload_type) AND (patient_reports.app_id = @app_id) and (is_done='True') order by patient_reports.serial desc">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList_reportType" Name="upload_type" 
                        PropertyName="SelectedValue" />
                    <asp:SessionParameter Name="app_id" SessionField="this_app_id" />
                </SelectParameters>
            </asp:SqlDataSource>

        
        
        </td>
        
        <td valign="top" width="40%" >
        


           
            <div class="alert alert-info"><h4>Suggested Reports</h3></div>
             <div style="height:300px;width:100%;display:block;overflow:scroll;">
                <asp:CheckBoxList ID="CheckBoxList_suggestedReports" runat="server" 
                RepeatColumns="1" RepeatDirection="Horizontal" 
                DataSourceID="SqlDataSource1" DataTextField="type_name" 
                DataValueField="type_serial" AutoPostBack="True">
            </asp:CheckBoxList>


              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                SelectCommand="SELECT [type_serial], [type_group] + '-' + [type_name] as type_name FROM [report_type_master] where type_serial not in(0) ORDER BY [type_group], [type_name]">
            </asp:SqlDataSource>

</div>



          <%--  <asp:Button ID="Button_submitReportSuggestion" runat="server" Text="SUBMIT" CssClass="btn btn-success" />
--%>

        </td>

        
        </tr></table>

        
        <hr />


        <table width="100%"><tr>
        
        <td width="40%" valign="top">
        
         <div class="alert alert-info"><h4>Appointments under you</h4></div>
            <asp:GridView ID="GridView_app_under_this_doc" runat="server"  CssClass="table table-bordered"
                AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource_app_this_doc" 
                EmptyDataText="No appointments found">
                <Columns>


                  <asp:BoundField DataField="app_id" HeaderText="app_id" SortExpression="app_id" 
                        Visible="False" />
                    <asp:HyperLinkField DataNavigateUrlFields="app_id" 
                        DataNavigateUrlFormatString="~/secured/Doctor/PatientDetails.aspx?AppID={0}" 
                        DataTextField="app_id" HeaderText="Appointment ID" 
                        NavigateUrl="~/secured/Doctor/PatientDetails.aspx" />
                    <asp:BoundField DataField="name" HeaderText="Doctor Name" 
                        SortExpression="name" />
                    <asp:BoundField DataField="appointment_date" HeaderText="Appointment Date" 
                        SortExpression="appointment_date" />
                   
                  
                  
                </Columns>
            </asp:GridView>
        
        
            <asp:SqlDataSource ID="SqlDataSource_app_this_doc" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                
                SelectCommand="SELECT patient_appointment_schedule.app_id, doctor_profile.name, patient_appointment_schedule.appointment_date FROM doctor_profile INNER JOIN patient_appointment_schedule ON doctor_profile.serial = patient_appointment_schedule.doc_serial WHERE (doctor_profile.username = @username)  AND (patient_appointment_schedule.p_id = @p_id)">
                <SelectParameters>
                    <asp:SessionParameter  Name="username" 
                        SessionField="this_username" />
                   
                    <asp:SessionParameter  Name="p_id" 
                        SessionField="this_p_id" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        
        </td>
       
        <td width="40%" valign="top">
        
        
        
        <div class="alert alert-info"><h4>Appointments under other Doctor</h4></div>
            <asp:GridView ID="GridView_app_anotherDocor" runat="server"  CssClass="table table-bordered"
                AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource_app_other_doc" 
                EmptyDataText="No appointments found">
                <Columns>


                  <asp:BoundField DataField="app_id" HeaderText="app_id" SortExpression="app_id" 
                        Visible="False" />
                    <asp:HyperLinkField DataNavigateUrlFields="app_id" 
                        DataNavigateUrlFormatString="~/secured/Doctor/PatientDetails.aspx?AppID={0}" 
                        DataTextField="app_id" HeaderText="Appointment ID" 
                        NavigateUrl="~/secured/Doctor/PatientDetails.aspx" />
                    <asp:BoundField DataField="name" HeaderText="Doctor Name" 
                        SortExpression="name" />
                    <asp:BoundField DataField="appointment_date" HeaderText="Appointment Date" 
                        SortExpression="appointment_date" />
                   
                  
                  
                </Columns>
            </asp:GridView>
        
        
            <asp:SqlDataSource ID="SqlDataSource_app_other_doc" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                
                SelectCommand="SELECT patient_appointment_schedule.app_id, doctor_profile.name, patient_appointment_schedule.appointment_date FROM doctor_profile INNER JOIN patient_appointment_schedule ON doctor_profile.serial = patient_appointment_schedule.doc_serial WHERE (doctor_profile.username <> @username)  AND (patient_appointment_schedule.p_id = @p_id)">
                <SelectParameters>
                    <asp:SessionParameter  Name="username" 
                        SessionField="this_username" />
                   
                    <asp:SessionParameter  Name="p_id" 
                        SessionField="this_p_id" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        
        
        
        
        </td>
        
        
        </tr></table>


</asp:Content>

