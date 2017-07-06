Imports System.Data

Partial Class secured_RO_PatientPrecription
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Request.QueryString("AppId") Is Nothing Then
            Response.Redirect("ConfirmPatient.aspx", True)
        End If

        Dim app_id As String = Request.QueryString("AppId").ToString().Trim()


        Dim pid As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedule where app_id='" & app_id & "'")
        Me.Label_patient_id.Text = pid



        If pid = "" Or pid Is Nothing Then
            Me.tbl_patient_details.Visible = False
            Me.Label_status.Text = "<h3 style=""color:Red;"">No records found for this Appointment ID</h3>"
            Exit Sub
        End If

        Me.tbl_patient_details.Visible = True

        Me.Label_appointmentId.Text = app_id



        Dim doc_av_serial As String = DBAccess.FetchScaler("select doc_av_serial from patient_appointment_schedule where  app_id='" & app_id & "'")
        Dim doc_username As String = DBAccess.FetchScaler("select username from doctor_in_week_slot where doc_av_serial=" & doc_av_serial)
        Me.Label_Dr_name.Text = DBAccess.FetchScaler("select name from doctor_profile where username='" & doc_username & "'").ToUpper()

        Dim ds_qualification As DataSet = DBAccess.FetchData("select q_serial from doctor_qualification where username='" & doc_username & "'", "doctor_qualification")
        Dim q_names As String = ""
        For q = 0 To ds_qualification.Tables(0).Rows.Count - 1

            Dim q_serial As Integer = CInt(ds_qualification.Tables(0).Rows(q).Item("q_serial").ToString())
            Dim q_name As String = DBAccess.FetchScaler("select q_name from qualification_master where q_serial=" & q_serial)
            q_names &= "," & q_name
        Next

        If q_names.Length > 0 Then
            q_names = q_names.Substring(1).Replace(",", ", ")
        End If
        Me.Label_Dr_qualification.Text = q_names


      

        Me.Label_patient_name.Text = DBAccess.FetchScaler("select p_name from patient_details where p_id='" & pid & "'").ToUpper()

        Dim address1 As String = DBAccess.FetchScaler("select address1 from patient_details where p_id='" & pid & "'")
        Dim address2 As String = DBAccess.FetchScaler("select address2 from patient_details where p_id='" & pid & "'")
        Dim address3 As String = DBAccess.FetchScaler("select address3 from patient_details where p_id='" & pid & "'")

        Dim address As String = address1 & ", " & address2 & ", " & address3

        Me.Label_patient_address.Text = address



        Dim app_date As String = DBAccess.FetchScaler("select appointment_date from patient_appointment_schedule where app_id='" & app_id & "'")

        Dim slot_serial As Integer = DBAccess.FetchInt("select slot_serial from doctor_in_week_slot where doc_av_serial=" & doc_av_serial)

        Dim slot_name As String = DBAccess.FetchScaler("select slot_name from slot_master where slot_serial=" & slot_serial)

        Me.Label_dateandTime.Text = CDate(app_date).ToString("dd-MM-yyyy") & "  " & slot_name




        Dim sex As String = DBAccess.FetchScaler("select gender from patient_details where p_id='" & pid & "'")

        Me.Label_sex.Text = sex


       
         



    End Sub
End Class
