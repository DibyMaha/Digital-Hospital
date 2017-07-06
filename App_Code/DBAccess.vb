Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient



Public Class DBAccess

    Shared con_str As String = System.Configuration.ConfigurationManager.ConnectionStrings("SmartHospitalConnectionString").ToString()



    Shared cmd As New SqlCommand()

    ''' <summary>
    ''' This Function used to save data into the data store against a T_SQL query
    ''' </summary>
    ''' <param name="qry">The T-SQL Statement to be executed into the datastore</param>
    ''' <returns>True, if data is saved successfully. otherwise return False</returns>
    ''' <remarks></remarks>
    Public Shared Function SaveData(ByVal qry As String) As Boolean

        Dim conn As New SqlConnection(con_str)
        cmd.Connection = conn
        cmd.CommandText = qry


        Try
            conn.Open()
            Dim ret As Integer = cmd.ExecuteNonQuery()

            If ret = 1 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False

        Finally

            If ConnectionState.Open Then
                conn.Close()
            End If

        End Try


    End Function




    Public Shared Function UpdateData(ByVal qry As String) As Boolean
        Dim conn As New SqlConnection(con_str)
        cmd.Connection = conn
        cmd.CommandText = qry


        Try
            conn.Open()
            Dim ret As Integer = cmd.ExecuteNonQuery()

            If ret = 1 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False

        Finally

            If ConnectionState.Open Then
                conn.Close()
            End If

        End Try


    End Function



    Public Shared Function DeleteData(ByVal qry As String) As Boolean
        Dim conn As New SqlConnection(con_str)
        cmd.Connection = conn
        cmd.CommandText = qry


        Try
            conn.Open()
            Dim ret As Integer = cmd.ExecuteNonQuery()

            If ret = 1 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Exception
            Return False

        Finally

            If ConnectionState.Open Then
                conn.Close()
            End If

        End Try


    End Function



    Public Shared Function FetchScaler(ByVal qry As String) As String

        Dim conn As New SqlConnection(con_str)
        cmd.Connection = conn
        cmd.CommandText = qry

        Try
            conn.Open()

            Dim result As String = cmd.ExecuteScalar()

            Return result


        Catch ex As Exception
            Return ""

        Finally

            If ConnectionState.Open Then
                conn.Close()
            End If

        End Try
    End Function



    Public Shared Function FetchInt(ByVal qry As String) As Integer

        Dim conn As New SqlConnection(con_str)
        cmd.Connection = conn
        cmd.CommandText = qry

        Try
            conn.Open()

            Dim result As String = cmd.ExecuteScalar()


            If IsNumeric(result) Then
                Return CInt(result)
            Else
                Return 0
            End If




        Catch ex As Exception
            Return 0

        Finally

            If ConnectionState.Open Then
                conn.Close()
            End If

        End Try
    End Function


    Public Shared Function FetchData(ByVal qry As String, ByVal srcTable As String) As DataSet

        Dim conn As New SqlConnection(con_str)
        cmd.Connection = conn
        cmd.CommandText = qry

        Try

            Dim adp As New SqlDataAdapter(cmd)
            Dim ds As New DataSet()

            conn.Open()

            adp.Fill(ds, srcTable)

            Return ds

        Catch ex As Exception
            Return Nothing

        Finally

            If ConnectionState.Open Then
                conn.Close()
            End If

        End Try
    End Function


End Class

