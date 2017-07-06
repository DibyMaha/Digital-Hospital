<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/Uploader.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="secured_Uploader_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_head" Runat="Server">



  <h3 style="color:White;">  Upload Documents</h3>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">


<div class="col-md-6 col-md-offset-2">


    <asp:Label ID="Label_status" runat="server" Text=""></asp:Label>


    <table frame="box"><tr><td>
    <br />

    <div class="panel" id="div_uploadReport" runat="server">
    <div class="panel-body">
      
        
        <div class="row">
        <div class="col-md-4">Enter Appointment ID</div>
        <div class="col-md-8">
            <asp:DropDownList ID="DropDownList_appID" runat="server" 
                CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource_appIDs" 
                DataTextField="app_id" DataValueField="app_id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource_appIDs" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                SelectCommand="SELECT distinct [app_id] FROM [patient_reports] WHERE ([is_done] = @is_done) ORDER BY [app_id]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="False" Name="is_done" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        </div>
        <br />

          <div class="row">
        <div class="col-md-4">Select Test Type </div>
        <div class="col-md-8">
          
            <asp:DropDownList ID="DropDownList_testType" runat="server" 
                CssClass="form-control" DataSourceID="SqlDataSource1" 
                DataTextField="type_name" DataValueField="type_serial">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:SmartHospitalConnectionString %>" 
                SelectCommand="SELECT distinct ( [type_group] + '-' + [type_name]) as type_name,[type_serial] FROM [report_type_master] inner join patient_reports on patient_reports.report_type=report_type_master.type_serial where is_done='False' and app_id=@app_id ORDER BY  [type_name]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList_appID" Name="app_id" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        </div>

        <br />

          <div class="row">
        <div class="col-md-4">Select File</div>
        <div class="col-md-8">
            <asp:FileUpload ID="FileUpload1" runat="server" />
        
        </div>

        </div>

        <br /><br />
        <div class="col-md-4">
        
            <asp:Button ID="Button_submit" runat="server" Text="SUBMIT" CssClass="btn btn-success btn-block" />
        </div>

</div>
    
    </div>
    <br />
    </td></tr></table>

    </div>

</asp:Content>

