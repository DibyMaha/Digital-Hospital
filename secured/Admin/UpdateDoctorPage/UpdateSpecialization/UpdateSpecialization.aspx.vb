
Partial Class secured_Admin_UpdateDoctorPage_UpdateSpecialization
    Inherits System.Web.UI.Page

    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_update.Click
        Dim dept As Integer = CInt(Me.DropDownList_Dept.SelectedValue)
        Dim specialization As String = Me.TextBox_Specialization.Text.Trim()


        Dim qryUpdate As String = "insert into specialization_master values('" & specialization & "'," & dept & ")"


        If DBAccess.SaveData(qryUpdate) Then
            Me.Label_status.Text = "<div class=""alert alert-success""><h4>Specialization Update Successfully</h4>"
        Else
            Me.Label_status.Text = "Some unknown problem arrise. Try again."
        End If

    End Sub
End Class
