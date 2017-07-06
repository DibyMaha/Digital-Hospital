
Partial Class secured_RO_ConfirmPatient
    Inherits System.Web.UI.Page

    Protected Sub Button_display_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_display.Click

        Dim app_id As String = Me.TextBox_app_id.Text.Trim()


        Dim pid As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedule where app_id='" & app_id & "'")


        If pid = "" Or pid Is Nothing Then
            Me.tbl_patient_details.Visible = False
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">No records found for this Appointment ID</div>"
            Exit Sub
        End If

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



    End Sub

    Protected Sub Button_print_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_print.Click
        Dim app_id As String = Me.TextBox_app_id.Text.Trim()

        DBAccess.SaveData("update patient_appointment_schedule set is_reported='True' where app_id='" & app_id & "'")

        Response.Redirect("PatientPrecription.aspx?AppId=" & app_id, True)

    End Sub
End Class
