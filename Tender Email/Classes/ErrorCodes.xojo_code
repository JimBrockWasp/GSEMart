#tag Class
Protected Class ErrorCodes
	#tag Method, Flags = &h0
		Sub Constructor()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Constructor
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Read in the Windows Error Codes file as part of the constructor
		  ' Throw errors to the calling routine
		  ' ----------------------------------------------------------------------
		  
		  
		  Dim ErrorCode() As String
		  Dim ErrorLine As String
		  Dim ErrorCodeFile As FolderItem
		  
		  ' A stream to read the file
		  Dim ErrorCodeFileStream as TextInputStream
		  
		  ' Create a new instance of the items
		  Code = New Dictionary
		  
		  ' The app.config file must be in the same folder as the exe file
		  ErrorCodeFile = app.ApplicationPath.Child("WindowsSystemErrorCodes.txt")
		  
		  ' Open the file
		  ErrorCodeFileStream = TextInputStream.Open(ErrorCodeFile)
		  
		  ' The first line is the comment line
		  ErrorLine = ErrorCodeFileStream.ReadLine
		  
		  
		  ' Now loop reading in Name value pairs into the Dictionary
		  Do Until ErrorCodeFileStream.EOF
		    
		    ' Read the item from the file
		    ErrorLine = ErrorCodeFileStream.ReadLine
		    
		    ' Check the line has something in it!
		    If ErrorLine <> "" then
		      ErrorCode = Split(ErrorLine, ":")
		    End If
		    
		    ' Append it to the item dictionary
		    Code.Value(CLong(ErrorCode(0))) = Trim(ErrorCode(1))
		    
		    
		  Loop
		  
		  ' Close the Error Code file
		  ErrorCodeFileStream.Close
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Code As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
