#tag Module
Protected Module GlobalFunctions
	#tag Method, Flags = &h0
		Function CDouble(Value As Variant) As Double
		  Return CType(Value, Double)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CInt(StringValue As String) As Integer
		  
		  Dim ReturnValue As Integer
		  
		  
		  If IsNumeric (StringValue) OR Trim(StringValue) = "" then
		    
		    ReturnValue = CType(Val(Trim(StringValue)), Integer)
		    
		  Else
		    
		    Raise New RuntimeExceptionEx (1, "Invalid Number: " + StringValue)
		    
		  End If
		  
		  Return ReturnValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CSingle(Value As Variant) As Single
		  Return CType(Value, Single)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoubleToShortDate(DateAsDouble As Double) As String
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GlobalFunctions.DoubleToShortDate
		  ' Date          : 14/11/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Convert a double back to a short date
		  ' ----------------------------------------------------------------------
		  
		  
		  Dim ConvertedDate As New Date
		  
		  ' If a value has been specified
		  if DateAsDouble > 0 then
		    
		    ' Set the number of seconds of the date object
		    ConvertedDate.TotalSeconds = DateAsDouble
		    
		    ' Return the ShortDate version
		    return ConvertedDate.ShortDate
		    
		  else
		    
		    ' Return Blank
		    return ""
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatDate(ThisDate As Date) As String
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: FormatDate
		  ' Date          : 2014-08-27
		  ' By            : Jim Brock
		  ' Notes
		  ' Format the date to yyMMddhhmmss
		  ' ----------------------------------------------------------------------
		  
		  Dim ReturnValue As String
		  
		  ReturnValue = Right(CStr(ThisDate.Year), 2)
		  ReturnValue = ReturnValue + Right("0" + CStr(ThisDate.Month), 2)
		  ReturnValue = ReturnValue + Right("0" + CStr(ThisDate.Day), 2)
		  ReturnValue = ReturnValue + Right("0" + CStr(ThisDate.Hour), 2)
		  ReturnValue = ReturnValue + Right("0" + CStr(ThisDate.Minute), 2)
		  ReturnValue = ReturnValue + Right("0" + CStr(ThisDate.Second), 2)
		  
		  Return ReturnValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTodaysDate() As String
		  
		  ' A New date takes the current Date
		  Dim d As New Date
		  
		  ' Return the short value
		  Return d.ShortDate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InStrL(Source As String, Find As String) As Integer
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GlobalFunctions.InStrL
		  ' Date          : 2014-08-31
		  ' By            : Jim Brock
		  ' Notes
		  ' Get the position of Find in Source starting from the right
		  ' ----------------------------------------------------------------------
		  
		  Dim n As Integer
		  Dim FindLength As Integer
		  
		  ' Get the length of the find string
		  FindLength = Len(Find)
		  
		  ' Check something has been passed
		  If FindLength = 0 Then
		    Raise New RuntimeExceptionEx (1, "Invalid Parameter: " + Find)
		  End If
		  
		  ' Loop looking for find in source
		  For n = Len(Source) To 0 Step -1
		    
		    ' If the substring has been found
		    If Find = Mid(Source, n, FindLength) Then
		      Exit for
		    End If
		  Next
		  
		  ' Return the position 
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsNullOrEmpty(Value As String) As Boolean
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GlobalFunctions.IsNullOrEmpty
		  ' Date          : 2014-08-27
		  ' By            : Jim Brock
		  ' Notes
		  ' Check whether the string is Null or Empty
		  ' ----------------------------------------------------------------------
		  
		  Dim ReturnValue As Boolean = False
		  
		  If IsNull(Value) Or Value = "" Then
		    ReturnValue = True
		  End If
		  
		  Return ReturnValue
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoneyToDouble(amount As String) As Double
		  // Convert a string that represents a money amount to a double.
		  // For example $5,394.85 will convert to the double value of 5394.85
		  
		  dim result as string
		  
		  // strip off all commas
		  result = replaceAll( amount, ",", "" )
		  
		  // strip off currency signs
		  result = replaceAll( result, "£", "" )
		  
		  // strip out spaces
		  result = replaceAll( result, " ", "" )
		  
		  // convert to double and return result
		  return val( result )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SavePrinterSettings(ps As PrinterSetup)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GlobalFunctions.SavePrinterSettings
		  ' Date          : 26/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Save printer settings
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim PrinterSettingsPath As New FolderItem(app.ConfigurationItems.Item.Value("PrinterSettingsPath"), 0)
		    Dim PrinterSettingsFile As FolderItem
		    
		    ' A stream to read the file
		    Dim PrinterSettingsFileStream as TextOutputStream
		    
		    If Not PrinterSettingsPath.Exists Then
		      PrinterSettingsPath.CreateAsFolder
		    End if
		    
		    
		    ' The app.config file must be in the same folder as the exe file
		    PrinterSettingsFile = PrinterSettingsPath.Child("PrinterSettings.txt")
		    
		    ' Open the file
		    PrinterSettingsFileStream = TextOutputStream.Create(PrinterSettingsFile)
		    
		    ' Put the settings into the string
		    PrinterSettingsFileStream.Write EncodeBase64(ps.SetupString)
		    
		    ' Close the Error Code file
		    PrinterSettingsFileStream.Close
		    
		  Catch Err as RunTimeException
		    app.DisplayError "GlobalFunctions.SavePrinterSettings", Err
		    
		  End Try
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StripNHSNumber(NHSNumber As String) As String
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: StripNHSNumber
		  ' Date          : 2014-08-29
		  ' By            : Jim Brock
		  ' Notes
		  ' Strip the NHSNumber back to just the numbers
		  ' ----------------------------------------------------------------------
		  
		  Dim i As Integer
		  Dim c As String
		  Dim ReturnValue As String
		  
		  For i = 1 to Len(NHSNumber)
		    
		    ' Get the character from the NHS Number
		    c = Mid(NHSNumber, i , 1)
		    
		    If Instr("0123456789", c) > 0 then
		      ReturnValue = ReturnValue + c
		    End If
		    
		  Next
		  
		  Return ReturnValue
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
