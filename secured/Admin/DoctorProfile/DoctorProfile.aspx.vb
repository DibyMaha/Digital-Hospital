
Partial Class secured_Doctor_Doctor_s_Profile_DoctorProfile
    Inherits System.Web.UI.Page

    Dim username As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("username") Is Nothing Then

            Me.Label_status.Text = "<div class=""alert alert-danger"">Some unknown problem arrise. Try again later.</div>"
            Me.div_updateProfile.Visible = False
            Exit Sub
        End If


      


        username = Request.QueryString("username").ToString().Trim()


        If Not UserAccounts.GetUserType(username) = 2 Then

            Me.Label_status.Text = "<div class=""alert alert-danger"">This page is only for Doctors profile.</div>"
            Me.div_updateProfile.Visible = False

        End If



        Me.Label_username.Text = "<span class=""label label-warning"">" & username & "</span>"


        If Not IsPostBack Then
            RestoreDoctorProfile()
            Me.DropDownList_Dept.DataBind()
            Me.CheckBoxList_specialization.DataBind()
            Me.CheckBoxList_qualification.DataBind()
            RestoreDoctorSpecialization()
            RestoreDoctorQualification()
        End If




    End Sub



    Private Sub RestoreDoctorProfile()

        Dim ds_docProfile As System.Data.DataSet = DBAccess.FetchData("select * from doctor_profile where username='" & username & "'", "doctor_profile")

        If ds_docProfile Is Nothing Then
            Me.Label_status.Text = "<div class=""alert alert-danger"">Some unknown problem arrise. Try again later.</div>"
            Me.div_updateProfile.Visible = False
            Exit Sub
        End If

        If ds_docProfile.Tables(0).Rows.Count = 0 Then
          
            Exit Sub
        End If



        Me.DropDownList_Dept.SelectedValue = CInt(ds_docProfile.Tables(0).Rows(0).Item("dept_serial").ToString())

        Me.TextBox_name.Text = ds_docProfile.Tables(0).Rows(0).Item("name").ToString()

        Me.TextBox_ExperienceYear.Text = ds_docProfile.Tables(0).Rows(0).Item("experience_in_year").ToString()

        Me.TextBox_PersonalDetails.Text = ds_docProfile.Tables(0).Rows(0).Item("personal_details").ToString()

      
        Me.Image1.ImageUrl = ds_docProfile.Tables(0).Rows(0).Item("photograph").ToString()

    End Sub



    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click


        Dim name As String = Me.TextBox_name.Text.Trim()
        Dim experience As Decimal = CDec(Me.TextBox_ExperienceYear.Text.Trim())
        Dim personal_details As String = Me.TextBox_PersonalDetails.Text.Trim()
        Dim dept_serial As Integer = CInt(Me.DropDownList_Dept.SelectedValue)
        Dim photograph As String = ""
     


        Dim photo_path As String = "~/Files/Images/"



        If FileUpload1.PostedFile.ContentLength > 0 Then








            If Not Me.FileUpload1.PostedFile.ContentType.Contains("jpeg") Then

                Me.Label_status.Text = "<div class=""alert alert-danger"">Only JPEG Files are allowed.</div>"
                Exit Sub

            End If



            Dim file_extension As String = System.IO.Path.GetExtension(Me.FileUpload1.PostedFile.FileName)

            Dim new_file_name As String = username & file_extension

            photograph = photo_path & new_file_name

            Me.FileUpload1.PostedFile.SaveAs(Server.MapPath(photo_path) & new_file_name)


            Me.Image1.ImageUrl = photograph

        End If


      


        Dim qry As String = ""

        photograph = photograph.Trim()

        If UserAccounts.isDoctorProfileExists(username) Then


            If photograph = "" Then

                qry = "update doctor_profile set dept_serial=" & dept_serial & ",name='" & name & "',experience_in_year=" & experience & ",personal_details='" & personal_details & "' where username='" & username & "'"

            Else
                qry = "update doctor_profile set dept_serial=" & dept_serial & ",name='" & name & "',experience_in_year=" & experience & ",personal_details='" & personal_details & "', photograph='" & photograph & "' where username='" & username & "'"


            End If


        Else

            If photograph = "" Then
                Me.Label_status.Text = "<div class=""alert alert-danger"">You must have to upload a Doctor Profile Picture for the first time.</div>"
                Exit Sub
            End If

            qry = "insert into doctor_profile values('" & username & "','" & name & "'," & experience & ",'" & personal_details & "'," & dept_serial & ",'" & photograph & "')"


        End If



     


        DBAccess.SaveData("delete from doctor_specialization where username='" & username & "' and dept_serial=" & dept_serial)


        For Each itm As ListItem In Me.CheckBoxList_specialization.Items

            If itm.Selected Then

                Dim s_serial As Integer = itm.Value

                DBAccess.SaveData("insert into doctor_specialization values('" & username & "'," & s_serial & "," & dept_serial & ")")

            End If


        Next


        DBAccess.SaveData("delete from doctor_qualification where username='" & username & "'")


        For Each itm1 As ListItem In Me.CheckBoxList_qualification.Items

            If itm1.Selected Then

                Dim q_serial As Integer = itm1.Value

                DBAccess.SaveData("insert into doctor_qualification values('" & username & "'," & q_serial & ")")

            End If


        Next


      


        If DBAccess.SaveData(qry) Then
            Me.Label_status.Text = "<div class=""alert alert-success"">Profile has been updated successfully.</div>"

        Else
            Me.Label_status.Text = "<div class=""alert alert-danger"">Some unknown problem arrise. Try again later.</div>"

        End If








    
    End Sub



    Private Sub RestoreDoctorSpecialization()

        Dim dept_serial As Integer = CInt(Me.DropDownList_Dept.SelectedValue)

        Dim ds_doc_sp As System.Data.DataSet = DBAccess.FetchData("select * from doctor_specialization where username='" & username & "' and dept_serial=" & dept_serial, "doctor_specialization")


        For i = 0 To ds_doc_sp.Tables(0).Rows.Count - 1

            Dim s_serial As Integer = CInt(ds_doc_sp.Tables(0).Rows(i).Item("s_serial").ToString())

            For Each itm As ListItem In Me.CheckBoxList_specialization.Items
                If s_serial = CInt(itm.Value) Then
                    itm.Selected = True
                End If
            Next

        Next



    End Sub


    Private Sub RestoreDoctorQualification()

     
        Dim ds_doc_q As System.Data.DataSet = DBAccess.FetchData("select * from doctor_qualification where username='" & username & "'", "doctor_qualification")


        For i = 0 To ds_doc_q.Tables(0).Rows.Count - 1

            Dim q_serial As Integer = CInt(ds_doc_q.Tables(0).Rows(i).Item("q_serial").ToString())

            For Each itm As ListItem In Me.CheckBoxList_qualification.Items
                If q_serial = CInt(itm.Value) Then
                    itm.Selected = True
                End If
            Next

        Next



    End Sub



    Protected Sub DropDownList_Dept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList_Dept.SelectedIndexChanged
        Me.CheckBoxList_specialization.Items.Clear()
        Me.CheckBoxList_specialization.DataBind()
        RestoreDoctorSpecialization()
    End Sub

   


   



    
End Class
