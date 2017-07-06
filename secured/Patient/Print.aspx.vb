
Partial Class Patient_Print
    Inherits System.Web.UI.Page

    Dim app_serial As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Request.QueryString("Serial") Is Nothing Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Selection <a href=""Appointment.aspx"">Go to Appointment Page</a></div>"
            Me.tbl_print.Visible = False
            Exit Sub
        End If


        app_serial = Request.QueryString("Serial").ToString().Trim()

        If Not IsNumeric(app_serial) Then
            Me.tbl_print.Visible = False
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Selection <a href=""Appointment.aspx"">Go to Appointment Page</a></div>"
            Exit Sub
        End If


        If DBAccess.FetchInt("select count(*) from patient_appointment_schedule where serial=" & app_serial) = 0 Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Selection <a href=""Appointment.aspx"">Go to Appointment Page</a></div>"
            Me.tbl_print.Visible = False
            Exit Sub
        End If



        Dim pid As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedule where serial=" & app_serial)
        Dim app_id As String = DBAccess.FetchScaler("select app_id from patient_appointment_schedule where serial=" & app_serial)


        Me.Label_pid.Text = pid
        Me.Label_app_id.Text = app_id

        Me.Image_pid.ImageUrl = "~/BarcodeBarcode.ashx?key=" & pid


        Me.Label_pname.Text = DBAccess.FetchScaler("select p_name from patient_details where p_id='" & pid & "'").ToUpper()

        Dim app_date As String = DBAccess.FetchScaler("select appointment_date from patient_appointment_schedule where serial=" & app_serial)


        Dim doc_av_serial As String = DBAccess.FetchScaler("select doc_av_serial from patient_appointment_schedule where serial=" & app_serial)
        Dim doc_username As String = DBAccess.FetchScaler("select username from doctor_in_week_slot where doc_av_serial=" & doc_av_serial)


        Me.Label_docName.Text = DBAccess.FetchScaler("select name from doctor_profile where username='" & doc_username & "'").ToUpper()

        Dim slot_serial As Integer = DBAccess.FetchInt("select slot_serial from doctor_in_week_slot where doc_av_serial=" & doc_av_serial)

        Dim slot_name As String = DBAccess.FetchScaler("select slot_name from slot_master where slot_serial=" & slot_serial)

        Me.Label_appDate.Text = CDate(app_date).ToString("dd-MM-yyyy")
        Me.Label_appTime.Text = slot_name


    End Sub

    
End Class
