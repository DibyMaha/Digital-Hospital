
Partial Class secured_Admin_UpdateDoctorAvailability_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Private Sub BoundSlot()


        Me.CheckBoxList_slot.DataBind()



        Dim doctor_username As String = Me.DropDownList_doctors.SelectedValue

        Dim day_serial As String = Me.DropDownList_weekDay.SelectedValue



        Dim ds As System.Data.DataSet = DBAccess.FetchData("select slot_serial from doctor_in_week_slot where username='" & doctor_username & "' and day_serial='" & day_serial & "'", "doctor_in_week_slot")


        For i = 0 To ds.Tables(0).Rows.Count - 1

            Dim slot_serial As Integer = CInt(ds.Tables(0).Rows(i).Item("slot_serial").ToString())

            Me.CheckBoxList_slot.Items.FindByValue(slot_serial).Selected = True


        Next




    End Sub




    Protected Sub Button_submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_submit.Click





        Dim doc_username As String = Me.DropDownList_doctors.SelectedValue
        Dim day_serial As Integer = CInt(Me.DropDownList_weekDay.SelectedValue)





        DBAccess.SaveData("delete from doctor_in_week_slot where username='" & doc_username & "' and day_serial=" & day_serial)


        For Each slot As ListItem In Me.CheckBoxList_slot.Items


            If slot.Selected Then

                Dim slot_serial As Integer = CInt(slot.Value)

                If DBAccess.SaveData("insert into doctor_in_week_slot values('" & doc_username & "'," & day_serial & "," & slot_serial & ")") Then

                End If



            End If

         




        Next




        Me.Label_status.Text = "<div class=""alert alert-success"">Slot information updated succcessfully.</div>"



    End Sub

  
    Protected Sub DropDownList_doctors_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList_doctors.SelectedIndexChanged
        BoundSlot()

    End Sub

    Protected Sub DropDownList_weekDay_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList_weekDay.SelectedIndexChanged
        BoundSlot()

    End Sub

   
   
    Protected Sub DropDownList_dept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList_dept.SelectedIndexChanged
        Me.DropDownList_doctors.Items.Clear()
        Me.DropDownList_doctors.Items.Add(New ListItem("Please Select", "x"))
    End Sub
End Class
