Imports Microsoft.VisualBasic

Public Class Utility

    Public Shared Function IsValidDoctor(ByVal doc_serial As Integer) As Boolean
        If DBAccess.FetchInt("select count(*) from doctor_profile where serial=" & doc_serial) = 1 Then
            Return True
        Else
            Return False
        End If
    End Function



End Class
