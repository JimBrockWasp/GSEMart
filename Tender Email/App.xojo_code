#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: App.Open
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Open the application and connect to the database
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Set the application to AutoQuit, so if all windows are closed then the application
		    ' will quit.
		    app.autoQuit = true
		    
		    ' Get the application path for all futher file IO
		    GetApplicationPath
		    
		    ' This loads in all the Windows ErrorCodes
		    WindowsErrorCodes = New ErrorCodes
		    
		    ' This loads in the Configuration settings from App.Config
		    ConfigurationItems = New Configuration
		    
		    SMTP = new Email
		    
		    ' all good so load the starting page
		    frmTenderEmail.Show
		    
		  Catch Err as RunTimeException
		    App.DisplayError ("App.Open", Err)
		    
		    
		  End Try
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CommentBlock()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: 
		  ' Date          : 
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Connect to the database
		    Dim db As New MSSQLServerDatabaseEx
		    
		    
		    
		    ' Disconnect
		    db.Close
		    
		  Catch Err as RunTimeException
		    app.DisplayError "routinename", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayError(Method as string, Err As RuntimeException)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: DisplayError
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Display an Error and log it to the error log file
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Create the Message to display
		    Dim DisplayMessage As String
		    Dim Button As Integer
		    Dim ErrorType As String
		    
		    ' Get the Error Type
		    ErrorType = Introspection.GetType(Err).FullName
		    Method = Replace(Method, ",", " ")
		    
		    
		    DisplayMessage = "An Error has occurred. Please take a note of the following details: "
		    DisplayMessage = DisplayMessage + EndOfLine + EndOfLine
		    DisplayMessage = DisplayMessage + "Method" + Chr(9)   + ": "+ Method  + EndOfLine
		    DisplayMessage = DisplayMessage + "Number" + Chr(9)   + ": "+ Cstr(Err.ErrorNumber)  + EndOfLine
		    DisplayMessage = DisplayMessage + "Type"   + Chr(9)   + ": " + ErrorType  + EndOfLine
		    DisplayMessage = DisplayMessage + "Message"  + Chr(9) + ": " + EndOfLine + EndOfLine
		    DisplayMessage = DisplayMessage + Err.Message
		    
		    'Display the error to the user
		    Button = MsgBox (DisplayMessage, 16, "An Error has Occurred!")
		    
		    
		    
		  Catch RuntimeException
		    
		    ' Ignore errors in this routine
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetApplicationPath()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GetApplicationPath
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Work out what the application path is so you can do file IO
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Get the application folder
		    ApplicationPath = GetFolderItem("")
		    
		    ' If DebugBuild then the App.Config is in the parent folder because RB creates
		    ' a debug<appname> folder to debug the code in!!!!
		    #If DebugBuild
		      ApplicationPath = ApplicationPath.Parent
		    #endif
		    
		  Catch Err as RunTimeException
		    
		    MsgBox "An Error has occurred in GetApplicationPath: " + EndOfLine + Cstr(Err.ErrorNumber) + ":" + Err.Message
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintReport(rpt As Report, rs As RecordSet)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: App.PrintReport
		  ' Date          : 23/01/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Print the report out!
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim ps As New PrinterSetup
		    
		    'set the resolution to 300 DPI for printing
		    ps.MaxHorizontalResolution = 300
		    ps.MaxVerticalResolution = 300
		    
		    
		    dim g as graphics
		    g = OpenPrinterDialog(ps, nil)
		    if g <> nil then
		      
		      If rpt.Run( rs, ps ) Then
		        rpt.Document.Print(g)
		      End If
		    end if
		    
		  Catch Err as RunTimeException
		    app.DisplayError "App.PrintReport", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WriteError(Method as string, ErrorType As String, Message as string, Number as integer)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WriteError
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Display an Error and log it to the error log file
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' A string to hold a Configuration item from the file
		    Dim ErrorFile As FolderItem
		    
		    ' A stream to write to the file
		    Dim ErrorFileStream as TextOutputStream
		    
		    ' A string to write to the file
		    Dim ErrorLine As String
		    
		    ' Get the date and time now
		    Dim Now As New Date
		    
		    ' Create the line to write to the file
		    ErrorLine = Now.SQLDateTime + "," + app.Username + "," +  Method + "," + ErrorType + "," + Cstr(Number) + ","  + Message + EndOfLine
		    
		    ' The app.config file must be in the same folder as the exe file
		    ErrorFile = app.ApplicationPath.Child("Errors.csv")
		    
		    ' If the file does not exist, create it
		    If Not ErrorFile.Exists then
		      
		      ' Create a new file
		      ErrorFileStream = TextOutputStream.Create(ErrorFile)
		      
		      ' Write the headings to the new file
		      ErrorFileStream.Write "Date/Time, Username, Method, Type, Error  Number, Message" + EndOfLine
		      
		    Else
		      ErrorFileStream = TextOutputStream.Append(ErrorFile)
		    End If
		    
		    ' Append the error to the end of the file
		    ErrorFileStream.Write ErrorLine
		    
		    ' Close the file
		    ErrorFileStream.Close
		    
		    
		  Catch Err as RunTimeException
		    
		    ' Ignore any errors in this routine!
		    
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ApplicationPath As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ConfigurationItems As Configuration
	#tag EndProperty

	#tag Property, Flags = &h0
		SMTP As Email
	#tag EndProperty

	#tag Property, Flags = &h0
		UserName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowsErrorCodes As ErrorCodes
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="UserName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
