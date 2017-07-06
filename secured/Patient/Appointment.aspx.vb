
Partial Class Patient_Appointment
    Inherits System.Web.UI.Page


    Dim doc_serial As Integer = 0
    Dim doc_username As String = ""


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Session("Doc") Is Nothing Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">You can not open this page without <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            Exit Sub
        End If


        doc_serial = Session("Doc").ToString().Trim()

        If Not IsNumeric(doc_serial) Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Doctor Selected. Goto  <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
            
            Exit Sub
        End If


        If Not Utility.IsValidDoctor(doc_serial) Then
            Me.Label_status.Text = "<div class=""alert alert-danger h4"">Invalid Doctor Selected. Goto  <a href=""ListDoctor.aspx"">Doctor Search</a></div>"
          
            Exit Sub
        End If



        doc_username = DBAccess.FetchScaler("select username from doctor_profile where serial=" & doc_serial)

        Me.div_appointmentOption.Visible = True



        If Session("p_id") Is Nothing Then


            Response.Redirect("CheckRegistration.aspx?Doc=" & doc_serial, True)


        End If




    End Sub

    Protected Sub Button_Check_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_Check.Click

        Me.Label_status.Text = ""

        Dim date_str As String = Me.TextBoxDate.Text.Trim()

        If Not IsDate(date_str) Then

            Me.Label_status.Text = "<div class=""alert alert-danger""><h4>Invalid Date</h4></div>"
            Exit Sub
        End If


        Dim selected_date As Date = CDate(date_str)

        Dim day_serial As Integer = CInt(selected_date.DayOfWeek)




        Dim ds_booked_av_serial As System.Data.DataSet = DBAccess.FetchData("select doc_av_serial from patient_appointment_schedule where appointment_date='" & selected_date.ToString("yyyy-MM-dd") & "' and is_paid=1", "patient_appointment_schedule")


        Dim booked_av_serials As String = ""
        For i = 0 To ds_booked_av_serial.Tables(0).Rows.Count - 1
            booked_av_serials &= ds_booked_av_serial.Tables(0).Rows(i).Item("doc_av_serial") & ","
        Next

        booked_av_serials &= "0"





        Dim ds_av_slots As System.Data.DataSet = DBAccess.FetchData("select slot_serial from doctor_in_week_slot where username='" & doc_username & "' and day_serial=" & day_serial & " and doc_av_serial not in (" & booked_av_serials & ")", "doctor_in_week_slot")


        ' Me.Label_status.Text = ds_av_slots.Tables(0).Rows.Count


        Dim av_slot_serials As String = ""
        For i = 0 To ds_av_slots.Tables(0).Rows.Count - 1
            av_slot_serials &= ds_av_slots.Tables(0).Rows(i).Item("slot_serial") & ","
        Next

        av_slot_serials &= "0"




        'Me.Label_status.Text = av_slot_serials

        Dim ds_slot_dtails As System.Data.DataSet = DBAccess.FetchData("select * from slot_master where slot_serial in(" & av_slot_serials & ")", "slot_master")





        Me.RadioButtonList_availability.DataSource = ds_slot_dtails
        Me.RadioButtonList_availability.DataMember = ds_slot_dtails.Tables(0).TableName
        Me.RadioButtonList_availability.DataTextField = "slot_name"
        Me.RadioButtonList_availability.DataValueField = "slot_serial"
        Me.RadioButtonList_availability.DataBind()



        If Me.RadioButtonList_availability.Items.Count > 0 Then
            Me.Button_book.Visible = True
            Me.Label_countRows.Text = "<div class=""alert alert-success"">" & Me.RadioButtonList_availability.Items.Count & " slots found for this date</div>"

        Else
            Me.Button_book.Visible = False
            Me.Label_countRows.Text = "<div class=""alert alert-warning"">No Slots found for this day</div>"
        End If


    End Sub

    Protected Sub TextBoxDate_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TextBoxDate.TextChanged
        Me.Button_Check_Click(Nothing, Nothing)
    End Sub

    Protected Sub Button_book_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_book.Click

       
        Dim slot_serial As Integer = CInt(Me.RadioButtonList_availability.SelectedValue)

        'Response.Write(slot_serial)


        Dim date_str As String = Me.TextBoxDate.Text.Trim()

        If Not IsDate(date_str) Then

            Me.Label_status.Text = "<div class=""alert alert-danger""><h4>Invalid Date</h4></div>"
            Exit Sub
        End If


        Dim selected_date As Date = CDate(date_str)

        Dim day_serial As Integer = CInt(selected_date.DayOfWeek)



        Dim doc_av_serial As Integer = DBAccess.FetchInt("select doc_av_serial from doctor_in_week_slot where username='" & doc_username & "' and day_serial=" & day_serial & " and slot_serial=" & slot_serial)
       

        'Response.Write(doc_av_serial)


        Dim pid As String = Session("p_id").ToString().Trim()


        Dim qry_appintment As String = "insert into patient_appointment_schedule values('" & pid & "'," & doc_av_serial & ",'" & selected_date.ToString("yyyy-MM-dd") & "','" & Date.Now.ToString("yyyy-MM-dd") & "',0,NULL,0,0," & doc_serial & ")"

        If DBAccess.SaveData(qry_appintment) Then


            Dim max_serial As Integer = DBAccess.FetchInt("select max(serial) from patient_appointment_schedule")



            Response.Redirect("Payment.aspx?Serial=" & max_serial, True)


            'Response.Write("Data Saved")

            'Me.TextBoxDate_TextChanged(Nothing, Nothing)

        Else


            Me.Label_status.Text = "<div class=""alert alert-danger"">Some unknown problem arrise Try again later.</div>"

        End If



    End Sub
End Class
