
Partial Class Patient_Register
    Inherits System.Web.UI.Page

    Protected Sub Button_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_submit.Click




        Dim max_serial As Integer = DBAccess.FetchInt("select max(serial) from patient_details")




        Dim p_id As String = Date.Now.ToString("yyyyMMdd") & max_serial + 10001


        Dim p_name As String = Me.TextBox_name.Text.Trim()
        Dim dob As String = Me.TextBox_dob.Text.Trim()
        Dim email As String = Me.TextBox_email.Text.Trim()
        Dim mobile As String = Me.TextBox_mobile.Text.Trim()
        Dim gender As String = Me.RadioButtonList_gender.SelectedValue.ToString()
        Dim address1 As String = Me.TextBox_address1.Text.Trim()
        Dim address2 As String = Me.TextBox_address2.Text.Trim()
        Dim address3 As String = Me.TextBox_address3.Text.Trim()
        Dim pin As String = Me.TextBox_pin.Text.Trim()


        Dim qry_register_patient As String = "insert into patient_details values('" & p_id & "','" & dob & "','" & p_name & "','" & email & "','" & mobile & "','" & gender & "','" & address1 & "','" & address2 & "','" & address3 & "','" & pin & "')"


        If DBAccess.SaveData(qry_register_patient) Then
            Me.MultiView1.ActiveViewIndex = 1
            Me.Label_status.Text = ""
            Me.Label_success.Text = "<div class=""alert alert-success""><h3>Congratualation ! You have registered successfully.<br />Note the Patient ID : " & p_id & "</h3></div>"

            Session("p_id") = p_id

            Response.Redirect("CheckRegistration.aspx", True)

        Else

            Me.Label_status.Text = "<div class=""alert alert-danger"">Some unknown problem arrise. Try again later.</div>"

        End If





    End Sub

    Dim doc_serial As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Doc") Is Nothing Then
            Me.MultiView1.Visible = False
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">You can not open this page without <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            Exit Sub
        End If


        doc_serial = Session("Doc").ToString().Trim()

        If Not IsNumeric(doc_serial) Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Doctor Selected. Goto  <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            Me.MultiView1.Visible = False

            Exit Sub
        End If


        If Not Utility.IsValidDoctor(doc_serial) Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Doctor Selected. Goto  <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            Me.MultiView1.Visible = False

            Exit Sub
        End If


        Session("doc") = doc_serial
    End Sub
End Class
