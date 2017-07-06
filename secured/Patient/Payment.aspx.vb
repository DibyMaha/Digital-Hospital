
Partial Class Patient_Payment
    Inherits System.Web.UI.Page

    Dim app_serial As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Request.QueryString("Serial") Is Nothing Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Selection <a href=""Appointment.aspx"">Go to Appointment Page</a></div>"
            Exit Sub
        End If


        app_serial = Request.QueryString("Serial").ToString().Trim()

        If Not IsNumeric(app_serial) Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Selection <a href=""Appointment.aspx"">Go to Appointment Page</a></div>"
            Exit Sub
        End If


        If DBAccess.FetchInt("select count(*) from patient_appointment_schedule where serial=" & app_serial) = 0 Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Selection <a href=""Appointment.aspx"">Go to Appointment Page</a></div>"
            Exit Sub
        End If








    End Sub

    Protected Sub Button_pay_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_pay.Click

        Dim a_serial As Integer = CInt(app_serial)

        If a_serial < 10000 Then
            a_serial = (a_serial + 10000)
        End If


        Dim app_date As DateTime = CDate(DBAccess.FetchScaler("select appointment_date from patient_appointment_schedule where serial=" & app_serial))

        Dim app_id As String = app_date.Year & app_date.Month.ToString("00") & app_date.Day.ToString("00") & a_serial


        If DBAccess.SaveData("update patient_appointment_schedule set is_paid=1,app_id='" & app_id & "' where serial=" & app_serial) Then
            Response.Redirect("Print.aspx?Serial=" & app_serial, True)
        Else
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Some unknown problem arrise. Try again later</div>"
            Exit Sub
        End If
    End Sub
End Class
