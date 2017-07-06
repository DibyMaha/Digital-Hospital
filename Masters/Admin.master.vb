
Partial Class Masters_Admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.User.Identity.IsAuthenticated = False Then
            Response.Redirect("~/Accounts/Login.aspx", True)
            Exit Sub
        End If

        Dim username As String = Page.User.Identity.Name.ToString()


        If username = "" Then
            Response.Redirect("~/Accounts/Login.aspx", True)
            Exit Sub
        End If


        Dim user_type As String = DBAccess.FetchInt("select user_type from user_accounts where username='" & username & "'")


        If user_type <> 1 Then
            Response.Redirect("~/Accounts/Login.aspx", True)
            Exit Sub
        End If



    End Sub
End Class

