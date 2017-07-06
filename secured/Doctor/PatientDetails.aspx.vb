
Partial Class secured_Doctor_PatientDetails
    Inherits System.Web.UI.Page


    Dim username As String = ""

    Dim app_id As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        username = Page.User.Identity.Name

        Session("this_username") = "@achamma_balraj"

        If Request.QueryString("AppID") Is Nothing Then
            Me.tbl_patient_details.Visible = False
            Me.Label_status.Text = "<div class=""alert alert-danger""><h4>No records found for this Appointment ID</h4></div>"
            Exit Sub
        End If


        If Request.QueryString("AppID").ToString().Trim() = "" Then
            Me.tbl_patient_details.Visible = False
            Me.Label_status.Text = "<div class=""alert alert-danger""><h4>No records found for this Appointment ID</h4></div>"
            Exit Sub
        End If

        app_id = Request.QueryString("AppID").ToString().Trim()
        Me.Label_app_id.Text = app_id
        Dim pid As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedule where app_id='" & app_id & "'")

        Session("this_p_id") = pid

        If pid = "" Or pid Is Nothing Then
            Me.tbl_patient_details.Visible = False
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">No records found for this Appointment ID</div>"
            Exit Sub
        End If

        Session("this_app_id") = app_id



        DBAccess.SaveData("update patient_appointment_schedule set is_appointed='True' where app_id='" & app_id & "'")

        'Dim p_id As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedulewhere app_id='" & app_id & "'")

        'Session("this_p_id") = p_id


        Me.tbl_patient_details.Visible = True

        Me.Label_name.Text = DBAccess.FetchScaler("select p_name from patient_details where p_id='" & pid & "'").ToUpper()

        Dim address1 As String = DBAccess.FetchScaler("select address1 from patient_details where p_id='" & pid & "'")
        Dim address2 As String = DBAccess.FetchScaler("select address2 from patient_details where p_id='" & pid & "'")
        Dim address3 As String = DBAccess.FetchScaler("select address3 from patient_details where p_id='" & pid & "'")

        Dim address As String = address1 & ", " & address2 & ", " & address3

        Me.Label_address.Text = address



        Dim app_date As String = DBAccess.FetchScaler("select appointment_date from patient_appointment_schedule where app_id='" & app_id & "'")


        Dim doc_av_serial As String = DBAccess.FetchScaler("select doc_av_serial from patient_appointment_schedule where  app_id='" & app_id & "'")

        Dim slot_serial As Integer = DBAccess.FetchInt("select slot_serial from doctor_in_week_slot where doc_av_serial=" & doc_av_serial)

        Dim slot_name As String = DBAccess.FetchScaler("select slot_name from slot_master where slot_serial=" & slot_serial)

        Me.Label_app_dateTime.Text = CDate(app_date).ToString("dd-MM-yyyy") & "  " & slot_name




        Dim doc_username As String = DBAccess.FetchScaler("select username from doctor_in_week_slot where doc_av_serial=" & doc_av_serial)


        Me.Label_doc_name.Text = DBAccess.FetchScaler("select name from doctor_profile where username='" & doc_username & "'").ToUpper()

        If Not IsPostBack Then
            LoadPreviousTestSuggestion()
        End If


    End Sub




    Private Sub LoadPreviousTestSuggestion()
        Me.CheckBoxList_suggestedReports.DataBind()

        Dim ds_previous_testSuggestion As Data.DataSet = DBAccess.FetchData("select report_type from patient_reports where is_done='False' and app_id='" & app_id & "'", "patient_report")


        Dim suggestion_serials As String = "0"


        For i = 0 To ds_previous_testSuggestion.Tables(0).Rows.Count - 1


            'Me.CheckBoxList_suggestedReports.Items.Remove(Me.CheckBoxList_suggestedReports.Items.FindByValue(ds_previous_testSuggestion.Tables(0).Rows(i).Item("serial").ToString().Trim()).Text)

            suggestion_serials = CInt(ds_previous_testSuggestion.Tables(0).Rows(i).Item("report_type").ToString().Trim())

          
            For Each itm As ListItem In Me.CheckBoxList_suggestedReports.Items

                If itm.Value = suggestion_serials Then
                    itm.Selected = True
                End If

            Next






        Next






    End Sub




    'Protected Sub Button_submitReportSuggestion_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_submitReportSuggestion.Click






    '    Dim p_id As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedule where app_id='" & app_id & "'")


    '    Dim upload_type As String = "R"



    '    Dim uploaded_by As String = ""


    '    Dim time_stamp As String = Date.Now.ToString()




    '    Dim file_path As String = ""
    '    Dim file_name As String = ""




    '    Dim is_done = False




    '    For Each itm As ListItem In Me.CheckBoxList_suggestedReports.Items

    '        Dim report_type As Integer = 0


    '        If itm.Selected Then
    '            report_type = itm.Value



    '            If DBAccess.SaveData("insert into patient_reports values('" & app_id & "','" & p_id & "','" & upload_type & "'," & report_type & ",'" & uploaded_by & "','" & time_stamp & "','" & file_path & file_name & "','" & is_done & "')") Then



    '            End If




    '        End If






    '    Next
    'End Sub

    Protected Sub CheckBoxList_suggestedReports_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList_suggestedReports.SelectedIndexChanged


        Dim p_id As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedule where app_id='" & app_id & "'")


        Dim upload_type As String = "R"



        Dim uploaded_by As String = ""


        Dim time_stamp As String = Date.Now.ToString()




        Dim file_path As String = ""
        Dim file_name As String = ""




        Dim is_done = False




        For Each itm As ListItem In Me.CheckBoxList_suggestedReports.Items

            Dim report_type As Integer = 0


            If itm.Selected Then
                report_type = itm.Value



                If DBAccess.SaveData("insert into patient_reports values('" & app_id & "','" & p_id & "','" & upload_type & "'," & report_type & ",'" & uploaded_by & "','" & time_stamp & "','" & file_path & file_name & "','" & is_done & "')") Then



                End If




            End If






        Next


        If DBAccess.SaveData("insert into patient_reports values('" & app_id & "','" & p_id & "','P'," & 0 & ",'" & uploaded_by & "','" & time_stamp & "','" & file_path & file_name & "','" & is_done & "')") Then



        End If






    End Sub
End Class
