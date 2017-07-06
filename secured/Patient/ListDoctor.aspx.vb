Imports System.Data

Partial Class Patient_ListDoctor
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            BoundDoctors()
        End If


    End Sub





    Private Sub BoundDoctors()


        Me.Label_doctors.Text = ""

        Dim condition As String = " where 0=0 "

        Dim dept_serials As String = ""
        For Each itm As ListItem In Me.CheckBoxList_departments.Items

            If itm.Selected Then
                dept_serials &= "," & itm.Value

            End If

        Next

        If dept_serials.Length > 0 Then


            dept_serials = "0" & dept_serials

            condition &= " and doctor_profile.dept_serial in(" & dept_serials & ") "


        End If




        Dim sp_serials As String = ""
        For Each itm As ListItem In Me.CheckBoxList_specialization.Items

            If itm.Selected Then
                sp_serials &= "," & itm.Value
            End If

        Next

        If sp_serials.Length > 0 Then


            sp_serials = "0" & sp_serials

            condition &= " and s_serial in(" & sp_serials & ") "


        End If




        Dim q_serials As String = ""
        For Each itm As ListItem In Me.CheckBoxList_qualification.Items

            If itm.Selected Then
                q_serials &= "," & itm.Value
            End If

        Next

        If q_serials.Length > 0 Then


            q_serials = "0" & q_serials

            condition &= " and q_serial in(" & q_serials & ") "


        End If


        If Me.RadioButtonList_experience_in_year.SelectedIndex > 0 Then


            Dim max_expr As Integer = CInt(Me.RadioButtonList_experience_in_year.SelectedValue)

            condition &= " and (experience_in_year >=" & max_expr - 5 & " and experience_in_year<=" & max_expr & ") "




        End If





        Dim qry_listDoctors As String = "select distinct doctor_profile.username,doctor_profile.serial, doctor_profile.name,doctor_profile.experience_in_year,doctor_profile.photograph,doctor_profile.dept_serial from doctor_profile inner join doctor_specialization on doctor_profile.username=doctor_specialization.username inner join doctor_qualification on doctor_profile.username=doctor_qualification.username " & condition & " order by doctor_profile.dept_serial,doctor_profile.name "






        Dim ds_doctors As DataSet = DBAccess.FetchData(qry_listDoctors, "doctor_profile")


        For i = 0 To ds_doctors.Tables(0).Rows.Count - 1

            Dim doc_profile_serial As String = ds_doctors.Tables(0).Rows(i).Item("serial").ToString().Trim()

            Dim doc_username As String = ds_doctors.Tables(0).Rows(i).Item("username").ToString().Trim()
            Dim name As String = ds_doctors.Tables(0).Rows(i).Item("name").ToString().Trim()
            Dim experience As String = CDec(ds_doctors.Tables(0).Rows(i).Item("experience_in_year")).ToString("00.00").Trim()
            Dim photograph As String = ds_doctors.Tables(0).Rows(i).Item("photograph").ToString().Trim()
            photograph = "../.." & photograph.Substring(1)
            Dim dept_serial As Integer = ds_doctors.Tables(0).Rows(i).Item("dept_serial").ToString().Trim()
            Dim dept_name As String = DBAccess.FetchScaler("select dept_name from dept_master where dept_serial=" & dept_serial)



            Dim cssclass As String = ""
            If i Mod 2 = 0 Then
                cssclass = "bg-warning"
            Else
                cssclass = "bg-info"
            End If





            Dim ds_qualification As DataSet = DBAccess.FetchData("select q_serial from doctor_qualification where username='" & doc_username & "'", "doctor_qualification")

            Dim q_names As String = ""

            For q = 0 To ds_qualification.Tables(0).Rows.Count - 1

                Dim q_serial As Integer = CInt(ds_qualification.Tables(0).Rows(q).Item("q_serial").ToString())
                Dim q_name As String = DBAccess.FetchScaler("select q_name from qualification_master where q_serial=" & q_serial)
                q_names &= "," & q_name
            Next

            If q_names.Length > 0 Then
                q_names = q_names.Substring(1).Replace(",", ", ")
            End If






            Me.Label_doctors.Text &= "<div style=""padding:15px;"" class=""row " & cssclass & """>"
            Me.Label_doctors.Text &= "<div class=""col-md-2""><img src=""" & photograph & """ style=""width:75px;height:100px;"" /></div>"
            Me.Label_doctors.Text &= "<div class=""col-md-7""><b>" & name & "</b><br />" & q_names & "<br /><br>Department : " & dept_name & "<br />Experience : " & experience & " years</div>"
            Me.Label_doctors.Text &= "<div class=""col-md-3""><br /><a href=""CheckRegistration.aspx?Doc=" & doc_profile_serial & """ class=""btn btn-warning btn-lg"">Set Appointment</a></div>"
            Me.Label_doctors.Text &= "</div><br />"




        Next




    End Sub




    Protected Sub CheckBoxList_departments_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList_departments.SelectedIndexChanged





        Dim selected_depts As String = ""

        For Each itm As ListItem In Me.CheckBoxList_departments.Items

            If itm.Selected Then
                selected_depts &= itm.Value & ","
            End If

        Next


        selected_depts &= "0"


        Dim qry_specialization As String = "select * from specialization_master where dept_serial in (" & selected_depts & ") order by dept_serial"


        Dim ds_specilizations As System.Data.DataSet = DBAccess.FetchData(qry_specialization, "specialization_master")



        Me.CheckBoxList_specialization.DataSource = ds_specilizations
        Me.CheckBoxList_specialization.DataMember = ds_specilizations.Tables(0).TableName
        Me.CheckBoxList_specialization.DataTextField = "s_name"
        Me.CheckBoxList_specialization.DataValueField = "s_serial"

        Me.CheckBoxList_specialization.DataBind()



        If Me.CheckBoxList_specialization.Items.Count > 0 Then
            Me.tbl_specialization.Visible = True
            Me.h4_specialization.Visible = True
        Else
            Me.tbl_specialization.Visible = False
            Me.h4_specialization.Visible = False
        End If


        BoundDoctors()


    End Sub

   
    Protected Sub CheckBoxList_specialization_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList_specialization.SelectedIndexChanged
        BoundDoctors()
    End Sub

    Protected Sub CheckBoxList_qualification_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList_qualification.SelectedIndexChanged
        BoundDoctors()
    End Sub

 

    Protected Sub RadioButtonList_experience_in_year_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList_experience_in_year.SelectedIndexChanged
        BoundDoctors()
    End Sub

    Protected Sub Button_clearExpr_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_clearExpr.Click
        Me.RadioButtonList_experience_in_year.SelectedIndex = -1
        BoundDoctors()
    End Sub
End Class
