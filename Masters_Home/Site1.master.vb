Imports System.Data

Partial Class Masters_Site1
    Inherits System.Web.UI.MasterPage



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ds_departments As Data.DataSet = DBAccess.FetchData ("select dept_name from dept_master order by dept_name", "dept_master")

        Me.Label_departments.Text = "<table cellpadding=""5"">"
        For i = 0 To ds_departments.Tables(0).Rows.Count - 1
            Me.Label_departments.Text &= "<tr><td style=""font-size:12px;"">" & ds_departments.Tables(0).Rows(i).Item("dept_name").ToString().Trim() & "</td><tr>"
        Next
        Me.Label_departments.Text &= "</table>"

    End Sub
End Class

