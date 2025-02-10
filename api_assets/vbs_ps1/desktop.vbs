Private Function DesktopImage() As Bitmap

    Dim desktop_win As Int32 = GetDesktopWindow()
    Dim desktop_dc As Int32 = GetDC(desktop_win)
    Dim desktop_bounds As Rectangle = Screen.GetBounds(New _
        Point(1, 1))
    Dim desktop_wid As Int32 = desktop_bounds.Width
    Dim desktop_hgt As Int32 = desktop_bounds.Height

    ' Make a Bitmap to hold the image.
    Dim bm As New Bitmap(desktop_wid, desktop_hgt)
    Dim bm_gr As Graphics = Graphics.FromImage(bm)
    Dim bm_hdc As IntPtr = bm_gr.GetHdc

    ' Copy the desktop's image.
    StretchBlt( _
        bm_hdc, 0, 0, desktop_wid, desktop_hgt, _
        desktop_dc, 0, 0, desktop_wid, desktop_hgt, _
        SRCCOPY)

    ' Release the bitmap's  and desktop's DCs.
    bm_gr.ReleaseHdc(bm_hdc)
    ReleaseDC(desktop_win, desktop_dc)

    ' Return the result.
    Return bm
End Function

Private Sub Form1_Load(ByVal sender As System.Object, ByVal _
    e As System.EventArgs) Handles MyBase.Load
    Me.Hide()
    Application.DoEvents()

    ' Get the desktop image.
    m_bmDesktop = DesktopImage()

    ' Display the image.
    picDesktop.Image = DirectCast(m_bmDesktop.Clone(), _
        Bitmap)
    Me.Show()
End Sub

' Start dragging to select an area.
Private Sub picDesktop_MouseDown(ByVal sender As Object, _
    ByVal e As System.Windows.Forms.MouseEventArgs) Handles _
    picDesktop.MouseDown
    m_Drawing = True

    ' Save the point's coordinates.
    m_X1 = e.X
    m_X2 = e.X
    m_Y1 = e.Y
    m_Y2 = e.Y

    ' Make a Graphics object to draw on.
    m_grDesktop = picDesktop.CreateGraphics()
End Sub

' Continue drawing.
Private Sub picDesktop_MouseMove(ByVal sender As Object, _
    ByVal e As System.Windows.Forms.MouseEventArgs) Handles _
    picDesktop.MouseMove
    If Not m_Drawing Then Exit Sub

    ' Save the new point.
    m_X2 = e.X
    m_Y2 = e.Y

    ' Redraw the desktop image.
    m_grDesktop.DrawImage(m_bmDesktop, 0, 0)

    ' Draw the rubberband rectangle.
    Dim rect As New Rectangle( _
        Min(m_X1, m_X2), Min(m_Y1, m_Y2), _
        Abs(m_X1 - m_X2), Abs(m_Y1 - m_Y2))
    m_grDesktop.DrawRectangle(Pens.Blue, rect)
End Sub

' Stop drawing.
Private Sub picDesktop_MouseUp(ByVal sender As Object, _
    ByVal e As System.Windows.Forms.MouseEventArgs) Handles _
    picDesktop.MouseUp
    If Not m_Drawing Then Exit Sub
    m_Drawing = False

    ' Hide the form.
    Me.Hide()

    ' Get the name of a file on the desktop.
    Dim file_path As String = _
        GetFolderPath(SpecialFolder.Desktop)
    If Not file_path.EndsWith("\") Then file_path &= "\"
    file_path &= "Screen Grab"

    Dim file_name As String
    For i As Integer = 0 To 1000000
        file_name = file_path & i.ToString & ".jpg"
        Dim file_info As New FileInfo(file_name)
        If Not file_info.Exists() Then Exit For
    Next i

    ' Grab the selected piece of the image.
    Dim rect As New Rectangle( _
        Min(m_X1, m_X2), Min(m_Y1, m_Y2), _
        Abs(m_X1 - m_X2), Abs(m_Y1 - m_Y2))
    Dim bm As Bitmap = DirectCast( _
        m_bmDesktop.Clone(rect, m_bmDesktop.PixelFormat), _
            Bitmap)

    ' Save the image into the file.
    bm.Save(file_name, ImageFormat.Jpeg)

    ' Unload.
    Me.Close()
End Sub