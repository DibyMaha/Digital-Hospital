
Partial Class Patient_CheckRegistration
    Inherits System.Web.UI.Page


    Dim doc_serial As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Session("p_id") Is Nothing Then

            If Not Session("Doc") Is Nothing Then

                Response.Redirect("Appointment.aspx", True)

            End If

        End If

        If Request.QueryString("Doc") Is Nothing Then
            Me.div_register_login.Visible = False
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">You can not open this page without <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            Response.Redirect("ListDoctor.aspx", True)
            Exit Sub
        End If


        doc_serial = Request.QueryString("Doc").ToString().Trim()

        If Not IsNumeric(doc_serial) Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Doctor Selected. Goto  <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            Me.div_register_login.Visible = False

            Exit Sub
        End If


        If Not Utility.IsValidDoctor(doc_serial) Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Doctor Selected. Goto  <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            Me.div_register_login.Visible = False

            Exit Sub
        End If


        Session("doc") = doc_serial



        'If Not Session("p_id") Is Nothing Then


        '    Response.Redirect("Appointment.aspx?Doc=" & doc_serial, True)


        'End If




    End Sub

    Protected Sub Button_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_submit.Click

        Dim p_id As String = Me.TextBox_PatientID.Text.Trim()
        Dim p_dob As String = Me.TextBox_dob.Text.Trim()


        Dim qry_check_patient As String = "select count(*) from patient_details where p_id='" & p_id & "' and dob='" & p_dob & "'"

        If DBAccess.FetchInt(qry_check_patient) Then

            Session("p_id") = p_id

            Response.Redirect("Appointment.aspx?Doc=" & doc_serial, True)



        Else

            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Either Patient ID or Date of Birth mismatched. Try again.</div>"


        End If



    End Sub

    
End Class
