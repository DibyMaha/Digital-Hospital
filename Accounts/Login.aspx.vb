
Partial Class Accounts_Login
    Inherits System.Web.UI.Page

    Protected Sub Button_signIn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_signIn.Click


        Dim username As String = Me.TextBox_username.Text.Trim()
        Dim password As String = Me.TextBox_password.Text.Trim()


        If DBAccess.FetchInt("select count(*) from user_accounts where username='" & username & "' and password='" & password & "'") = 0 Then
            Me.Label_Status.Text = "<div class=""alert alert-danger"">Invalid Username or Password</div>"
            Exit Sub
        End If


        FormsAuthentication.SetAuthCookie(username, False)


        Dim user_type As String = DBAccess.FetchInt("select user_type from user_accounts where username='" & username & "'")


        'Response.Write(user_type)

        If user_type = 1 Then
            Response.Redirect("~/secured/Admin/", True)
        ElseIf user_type = 2 Then
            Response.Redirect("~/secured/Doctor/", True)

        ElseIf user_type = 3 Then

            Response.Redirect("~/secured/RO/", True)
        ElseIf user_type = 7 Then
            Response.Redirect("~/secured/Uploader/", True)

        ElseIf user_type = 11 Then
            Response.Redirect("~/secured/Patient/", True)

        End If




    End Sub
End Class
