
Partial Class secured_Uploader_Default
    Inherits System.Web.UI.Page

    Protected Sub Button_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_submit.Click

        Dim app_id As String = Me.DropDownList_appID.SelectedValue.ToString()

        Dim p_id As String = DBAccess.FetchScaler("select p_id from patient_appointment_schedule where app_id='" & app_id & "'")


        Dim upload_type As String = ""

        Dim report_type As Integer = CInt(Me.DropDownList_testType.SelectedValue)
        If report_type = 0 Then
            upload_type = "P"
        Else
            upload_type = "R"
        End If



        Dim uploaded_by As String = Page.User.Identity.Name.ToString()


        Dim time_stamp As String = Date.Now.ToString()


        If Not Me.FileUpload1.PostedFile.ContentType.ToUpper().Contains("PDF") Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Only PDF Files are allowed</div>"
            Exit Sub
        End If

        Dim max_serial As Integer = DBAccess.FetchInt("select max(serial) from patient_reports where report_type=" & report_type & " and app_id='" & app_id & "'")


        Dim file_path As String = "~/Files/reports/"
        Dim file_name As String = p_id & "_" & (1000 + max_serial) & ".pdf"






        If DBAccess.SaveData("update patient_reports set uploaded_by='" & uploaded_by & "',time_stamp='" & time_stamp & "',file_path='" & file_path & file_name & "',is_done='True' where serial=" & max_serial) Then

            Me.FileUpload1.PostedFile.SaveAs(Server.MapPath(file_path) & file_name)

            Me.Label_status.Text = "<div class=""alert alert-danger ""><h3>File has been uploaded to the system.<br /><a href=""../../Files/reports/" & file_name & """ target=""_blank"">Review file</a></h3><br /><br /><a href=""Default.aspx"">Upload a new file</a></h3></div>"
            Me.div_uploadReport.Visible = False


        End If






    End Sub
End Class
