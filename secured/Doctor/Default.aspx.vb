
Partial Class secured_Doctor_Default
    Inherits System.Web.UI.Page

    Protected Sub Button_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_submit.Click
        Dim app_id As String = Me.TextBox_appId.Text.Trim()


        Dim is_valid As Boolean = CBool(DBAccess.FetchScaler("select is_reported from patient_appointment_schedule where app_id='" & app_id & "'"))


        If is_valid = False Then
            Me.Label_status.Text = "<div class=""alert alert-danger""><h3>Patient has not been reported</h3></div>"
            Exit Sub
        Else
            Response.Redirect("PatientDetails.aspx?AppID=" & app_id, True)
        End If





    End Sub
End Class
