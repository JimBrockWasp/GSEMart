#tag Class
Protected Class Session
Inherits WebSession
	#tag Event
		Sub Open()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Session.Open
		  ' Date          : 14/04/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Get everything ready for the session
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Create a Current user object
		    Me.User = New User
		    
		    ' Get the application path for all futher file IO
		    ApplicationPath = GetApplicationPath
		    
		    ' This loads in all the Windows ErrorCodes
		    WindowsErrorCodes = New ErrorCodes
		    
		    ' This loads in the Configuration settings from Session.Config
		    ConfigurationItems = New Configuration 
		    
		    ' Create an emailer
		    SMTP = New Email
		    
		    ' Set the current form to the login page
		    Session.CurrentPage = frmLogin
		    
		    
		  Catch Err as RunTimeException
		    Session.DisplayError ("Session.Open", Err)
		  End Try
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PrepareSession(ByRef HTMLHeader as String)
		  'Select Case Me.Platform
		  'Case WebSession.PlatformType.iPhone
		  '// Allow iPhone 5 to scale web app to use entire screen height when
		  '// it is added to the home screen
		  '// The "apple-mobile-web-app-status-bar-style" ensures that the
		  '// status bar remains visible
		  'HTMLHeader = "<meta name=""viewport"" content=""initial-scale=1.0"" />" + _
		  'EndOfLine + "<meta name=""apple-mobile-web-app-status-bar-style"" content=""black"" />"
		  '
		  'Case WebSession.PlatformType.iPad
		  '// Force the viewport to be exactly 1012 wide when the user connects with an iPad
		  'HTMLHeader = "<meta name=""viewport"" content=""width=1012"">"
		  '
		  'End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CommentBlock()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name:
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "routinename", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommentBlockSQL()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: 
		  ' By            : Jim Brock
		  ' Notes         
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Connect to the database
		    Dim db As New MSSQLServerDatabaseEx
		    ' Dim sp As New SQLStoredProcedure(db, "")
		    
		    
		    ' Disconnect
		    db.Close
		    
		  Catch Err as RunTimeException
		    Session.DisplayError "routinename", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisplayError(Method As String, Err As RuntimeException)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: DisplayError
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Display an Error and log it to the error log file
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim ErrorType As String
		    
		    ' Get the Error Type
		    ErrorType = Introspection.GetType(Err).FullName
		    
		    
		    ' Display the error to the user
		    Dim dlg As New dlgrunTimeErrorMessage
		    dlg.lblHeading.Text = "Error"
		    dlg.lblMethod.Text = Method
		    dlg.lblType.Text = ErrorType
		    dlg.lblNumber.Text = CStr(Err.ErrorNumber)
		    dlg.lblMessage.Text = Err.Message
		    dlg.Show
		    
		    ' Now try writing the error to the error log
		    WriteError(Method, ErrorType, Err.Message, Err.ErrorNumber)
		    
		  Catch RuntimeException
		    
		    ' Ignore errors in this routine
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetApplicationPath() As FolderItem
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GetApplicationPath
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Work out what the application path is so you can do file IO
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim ApplicationPath As FolderItem
		    
		    ' Get the application folder
		    ApplicationPath = GetFolderItem("")
		    
		    ' If DebugBuild then the Session.Config is in the parent folder because RB creates
		    ' a debug<appname> folder to debug the code in!!!!
		    #If DebugBuild
		      ApplicationPath = ApplicationPath.Parent
		    #endif
		    
		    Return ApplicationPath
		    
		    
		  Catch Err as RunTimeException
		    
		    MsgBox "An Error has occurred in GetApplicationPath: " + EndOfLine + Cstr(Err.ErrorNumber) + ":" + Err.Message
		    
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NavigateTo(Page As WebPage)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: NavigateTo
		  ' Date          : 16/04/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Close the current form and load the new one
		  ' ----------------------------------------------------------------------
		  
		  ' Check you are not already on the page to navigate to
		  If Page.Name <> Session.CurrentPage.Name Then
		    Session.CurrentPage.Close
		    Session.CurrentPage = Page
		    
		    Page.Show
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeImage(ThisImage As WebImageView)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ThisImage.PictureChanged
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim Scale As Single = 1
		    Dim ThisWidth As Integer
		    Dim ThisHeight As Integer
		    
		    ' Calculate the scale
		    If ThisImage.Picture.Width > ThisImage.Width Or ThisImage.Picture.Height > ThisImage.Height Then
		      
		      ' Calculate the size of the picture on the screen
		      Scale = ThisImage.Height / ThisImage.Picture.Height
		      
		      If Scale * ThisImage.Picture.Width > ThisImage.Width Then
		        Scale = ThisImage.Width /ThisImage.Picture.Width
		      End If
		      
		    End If
		    
		    ' Get the new size of the logo Image
		    ThisWidth = ThisImage.Picture.Width * Scale
		    ThisHeight = ThisImage.Picture.Height * Scale
		    
		    ' Apply a style to size the image
		    Dim script As String
		    
		    script = "var elt = document.getElementById('" + ThisImage.ControlID + "_image');" + EndOfLine + _
		    "elt.style.left = '0px';" + EndOfLine + _
		    "elt.style.top = '0px';" + EndOfLine + _
		    "elt.style.marginTop = '0px';" + EndOfLine + _
		    "elt.style.marginLeft = '0px';" + EndOfLine + _
		    "elt.style.width = '" + str(ThisWidth, "0") + "px';" + EndOfLine + _
		    "elt.style.height = '" + str(ThisHeight, "0") + "px';"
		    
		    ThisImage.ExecuteJavaScript(script)
		    ThisImage.Visible = True
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "ThisImage.PictureChanged", Err
		    
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
		    ErrorLine = Now.SQLDateTime + "," + Session.User.Username + "," +  Method + "," +  ErrorType + "," + Cstr(Number) + ","  + Message + EndOfLine
		    
		    
		    ' The Errors.csv file must be in the same folder as the exe file
		    ErrorFile = Session.ApplicationPath.Child("Errors.csv")
		    
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
		CurrentPage As WebPage
	#tag EndProperty

	#tag Property, Flags = &h0
		Loaded As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		SMTP As Email
	#tag EndProperty

	#tag Property, Flags = &h0
		User As User
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowsErrorCodes As ErrorCodes
	#tag EndProperty


	#tag Constant, Name = ErrorDialogCancel, Type = String, Dynamic = True, Default = \"Do Not Send", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorDialogMessage, Type = String, Dynamic = True, Default = \"This application has encountered an error and cannot continue.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorDialogQuestion, Type = String, Dynamic = True, Default = \"Please describe what you were doing right before the error occurred:", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorDialogSubmit, Type = String, Dynamic = True, Default = \"Send", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorThankYou, Type = String, Dynamic = True, Default = \"Thank You", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorThankYouMessage, Type = String, Dynamic = True, Default = \"Your feedback helps us make improvements.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IndexLoadError, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IndexLoadNoDocuments, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = IndexLoadSuccess, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoJavascriptInstructions, Type = String, Dynamic = True, Default = \"To turn Javascript on\x2C please refer to your browser settings window.", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoJavascriptMessage, Type = String, Dynamic = True, Default = \"Javascript must be enabled to access this page.", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ScaleFactor"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_baseurl"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Browser"
			Group="Behavior"
			Type="BrowserType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - Safari"
				"2 - Chrome"
				"3 - Firefox"
				"4 - InternetExplorer"
				"5 - Opera"
				"6 - ChromeOS"
				"7 - SafariMobile"
				"8 - Android"
				"9 - Blackberry"
				"10 - OperaMini"
				"11 - Epiphany"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Connection"
			Group="Behavior"
			Type="ConnectionType"
			EditorType="Enum"
			#tag EnumValues
				"0 - AJAX"
				"1 - WebSocket"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Platform"
			Group="Behavior"
			Type="PlatformType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - Macintosh"
				"2 - Windows"
				"3 - Linux"
				"4 - Wii"
				"5 - PS3"
				"6 - iPhone"
				"7 - iPodTouch"
				"8 - Blackberry"
				"9 - WebOS"
				"10 - iPad"
				"11 - AndroidTablet"
				"12 - AndroidPhone"
				"13 - RaspberryPi"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="RenderingEngine"
			Group="Behavior"
			Type="EngineType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - WebKit"
				"2 - Gecko"
				"3 - Trident"
				"4 - Presto"
				"5 - EdgeHTML"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mConnection"
			Group="Behavior"
			Type="ConnectionType"
			EditorType="Enum"
			#tag EnumValues
				"0 - AJAX"
				"1 - WebSocket"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="_hasQuit"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActiveConnectionCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BrowserVersion"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GMTOffset"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HashTag"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeaderCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageCode"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LanguageRightToLeft"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Protocol"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StatusMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Timeout"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Expiration"
			Group="Behavior"
			InitialValue="-1"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Loaded"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
