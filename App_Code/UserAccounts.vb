Imports Microsoft.VisualBasic

Public Class UserAccounts

    Public Shared Function GetUserType(ByVal username As String) As Integer

        Return DBAccess.FetchInt("select user_type from user_accounts where username='" & username & "'")


    End Function

    Public Shared Function isDoctorProfileExists(ByVal username As String) As Boolean

        If DBAccess.FetchInt("select count(*) from doctor_profile where username='" & username & "'") = 1 Then
            Return True
        Else
            Return False
        End If


    End Function


End Class
