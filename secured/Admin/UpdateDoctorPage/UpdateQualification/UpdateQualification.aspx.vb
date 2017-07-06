
Partial Class secured_Admin_UpdateDoctorPage_NewFolder1_UpdateQualification
    Inherits System.Web.UI.Page

    Protected Sub Button_update_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_update.Click
        Dim qualification As String = Me.TextBox_Qualification.Text.Trim

        Dim qryUpdate As String = "insert into qualification_master values('" & qualification & "')"

        If DBAccess.SaveData(qryUpdate) Then
            Me.Label_status.Text = "<div class=""alert alert-success""><h4>Specialization Update Successfully</h4>"
        Else
            Me.Label_status.Text = "Some unknown problem arrise. Try again."

        End If
    End Sub
End Class
