<%@ WebHandler Language="VB" Class="Barcode" %>

Imports System
Imports System.Web


Imports iTextSharp
Imports iTextSharp.text
Imports iTextSharp.text.pdf

Public Class Barcode : Implements IHttpHandler
    
    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest

        Dim form_no As String = ""
        If context.Request.QueryString("key") <> Nothing Then
            form_no = context.Request.QueryString("key").Trim()
        End If

        If form_no.Trim().Length > 0 Then
            Dim bc39 As New Barcode128()
            bc39.Code = form_no
            bc39.Font = Nothing
            bc39.BarHeight = 40
            bc39.GuardBars = True
            bc39.Extended = True
            bc39.ChecksumText = True
            'bc39.AltText = form_no 
            Dim bc As System.Drawing.Image = bc39.CreateDrawingImage(System.Drawing.Color.Black, System.Drawing.Color.White)

            context.Response.ContentType = "image/gif"
            'bc39.CreateImageWithBarco()




            bc.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif)
       

        End If
    End Sub
 
    Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

End Class