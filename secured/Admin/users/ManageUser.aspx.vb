
Partial Class secured_Admin_users_ManageUser
    Inherits System.Web.UI.Page

    Protected Sub Button_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_submit.Click

        Dim username As String = Me.TextBox_username.Text.Trim()
        Dim password As String = Me.TextBox_password.Text.Trim()
        Dim email As String = Me.TextBox_email.Text.Trim()
        Dim mobile As String = Me.TextBox_mobile.Text.Trim()
        Dim userType As Integer = CInt(Me.DropDownList_userType.SelectedValue)

        Dim qrySaveUser As String = "insert into user_accounts values('" & username & "','" & password & "','" & email & "','" & mobile & "'," & userType & ")"


        If DBAccess.SaveData(qrySaveUser) Then
            Me.Label_status.Text = "<div class=""alert alert-success""><h4>User Created Successfully</h4>"
            Me.GridView_Users.DataBind()

            If userType = 2 Then
                Response.Redirect("~/secured/Admin/DoctorProfile/DoctorProfile.aspx?username=" & username, True)
            End If


        Else
            Me.Label_status.Text = "Some unknown problem arrise. Try again."
        End If




    End Sub

    Protected Sub Button_generatePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_generatePassword.Click

        Dim random_str As String = ""

        Dim rand As New Random()

        random_str = rand.Next(111111, 999999).ToString()

        Me.TextBox_password.TextMode = TextBoxMode.SingleLine
        Me.TextBox_password.Text = random_str


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
