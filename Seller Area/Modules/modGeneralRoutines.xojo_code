#tag Module
Protected Module modGeneralRoutines
	#tag Method, Flags = &h0
		Function CBool(Value As String) As Boolean
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: CBool
		  ' Date          : 2014-08-20
		  ' By            : Jim Brock
		  ' Notes
		  ' Determine if the string value passed is a value representing "True"
		  ' ----------------------------------------------------------------------
		  Dim ReturnValue As Boolean = False
		  
		  ' Possible True Values
		  Select Case UpperCase(Value)
		    
		  Case "YES"
		    ReturnValue = True
		  Case "1"
		    ReturnValue = True
		  Case "-1"
		    ReturnValue = True
		  Case "TRUE"
		    ReturnValue = True
		    
		  End Select
		  
		  
		  Return ReturnValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CDateTime(strDate as String, strType As String) As Date
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Global.CDateTime
		  ' By            : Metodija Angjelkoski
		  ' Notes
		  ' Creates date from any string format
		  ' ----------------------------------------------------------------------
		  
		  Dim Y As String
		  Dim M As String
		  Dim D As String
		  Dim hh As String
		  Dim mm As String
		  Dim ss As String
		  
		  ' SQL Type of Date (example: 2014-06-02 11:20:00, type: Longdate/ShortDate)
		  If Mid(strDate,5,1)="-" And Mid(strDate,8,1)="-" Then
		    Y = Left(strDate,4)
		    M = Mid(strDate,6,2)
		    D = Mid(strDate,9,2)
		    if len(strDate)>11 then
		      hh = Mid(strDate,12,2)
		      mm = Mid(strDate,15,2)
		      ss = Right(strDate,2)
		    else
		      hh = "00"
		      mm = "00"
		      ss = "00"
		    end if
		  End If
		  
		  ' Usual DD/MM/YYYY hh:mm:ss
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CDouble(Value As String) As Double
		  Return CType(Val(Value), Double)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckPlacedAdvertCount() As Boolean
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Global.CheckPlacedAdvertCount
		  ' By            : Jim Brock
		  ' Notes
		  ' Check whether the max number of placed adverts has been reached
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim db As New MSSQLServerDatabaseEx
		    Dim sp As New SQLStoredProcedure(db, "slCheckPlacedAdverts")
		    Dim rs As RecordSet
		    Dim Adverts As Integer
		    
		    sp.AddParameter("@AccountId", Session.User.AccountId)
		    rs = sp.ExecuteRecordSet
		    
		    Adverts = rs.Field("Adverts").IntegerValue
		    
		    If Adverts >= Session.User.MaxAdverts Then
		      
		      ShowMaxExceeded
		      Return False
		      
		    Else
		      
		      Return True
		      
		    End If
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "Global.CheckPlacedAdvertCount", Err
		    
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CInt(StringValue As String) As Integer
		  Return CType(Val(StringValue), Integer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CXMLDate(XMLDate As String) As Date
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: CXMLDate
		  ' Date          : 24/06/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Convert an XML Date to a Xojo Date Object
		  ' The XMLDate is in the format: -
		  ' "yyyy-mm-ddThh:nn:ss"
		  ' 
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new date object
		  Dim d As New Date
		  
		  ' Replace the "T" with a space
		  XMLDate = Replace(XMLDate, "T", " ")
		  
		  ' Set the new date object's SQL date property
		  d.SQLDate = XMLDate
		  
		  ' Return the new date object
		  Return d
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatAddress(ParamArray AddressLines As String) As String
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: FormatAddress
		  ' Date          : 2014-07-15
		  ' By            : Jim Brock
		  ' Notes
		  ' Format the address lines as a single line
		  ' ----------------------------------------------------------------------
		  
		  Dim ReturnValue As String
		  Dim AddressLine As String
		  Dim n As Integer
		  
		  ' Loop through the address lines
		  For Each AddressLine In AddressLines
		    
		    ' Check there is a value
		    If Trim(AddressLine) <> "" Then
		      
		      ' If this is not the first line with a value add a comma
		      If ReturnValue <> "" Then
		        ReturnValue = ReturnValue + ", "
		      End If
		      
		      ' Add the value to the address
		      ReturnValue = ReturnValue + AddressLine
		      
		    End If
		    
		  Next
		  
		  ' Return the single line address
		  Return ReturnValue
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatDate(ThisDate As Date) As String
		  Dim ReturnValue As String
		  ReturnValue = ThisDate.SQLDateTime
		  
		  ReturnValue = ReplaceAll(ReturnValue, ":", "")
		  ReturnValue = ReplaceAll(ReturnValue, "-", "")
		  ReturnValue = ReplaceAll(ReturnValue, " ", "")
		  
		  
		  Return ReturnValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatNHSNumber(NHSNumber As String) As String
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: FormatNHSNumber
		  ' Date          : 2014-07-15
		  ' By            : Jim Brock
		  ' Notes
		  ' Format the NHSNumber as nnn-nnn-nnnn, whatever is passed
		  ' ----------------------------------------------------------------------
		  Dim Formatted As String
		  
		  ' Get rid of any existing "-"
		  Formatted = Replace(NHSNumber, "-", "")
		  
		  ' Get rid of any spaces
		  Formatted = Replace(Formatted, " ", "")
		  
		  ' Check the length of the result. If there's 10 characters then format as nnn-nnn-nnnn
		  If Len(Formatted) = 10 Then
		    Formatted = Mid(Formatted, 1, 3) + "-" + Mid(Formatted, 4, 3) + "-" + Mid(Formatted, 7, 4)
		  End if
		  
		  ' Return the result
		  Return Formatted
		  
		   
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBrowserDescription() As String
		  
		  Dim Result As String
		  
		  
		  Select Case Session.Browser
		  Case WebSession.BrowserType.Android
		    Result = "Android"
		  Case WebSession.BrowserType.Blackberry
		    Result = "Blackberry"
		  Case WebSession.BrowserType.Chrome
		    Result = "Chrome"
		  Case WebSession.BrowserType.ChromeOS
		    Result = "ChromeOS"
		  Case WebSession.BrowserType.Firefox
		    Result = "Firefox"
		  Case WebSession.BrowserType.InternetExplorer
		    Result = "Internet Explorer"
		  Case WebSession.BrowserType.Opera
		    Result = "Opera"
		  Case WebSession.BrowserType.OperaMini
		    Result = "Opera Mini"
		  Case WebSession.BrowserType.Safari
		    Result = "Safari"
		  Case WebSession.BrowserType.SafariMobile
		    Result = "Safari Mobile"
		  Case WebSession.BrowserType.Unknown
		    Result = "Unknown web browser"
		  End Select
		  
		  Result = "Browser: " + Result + " Version:" + Session.BrowserVersion
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInteger(Value As String) As Boolean
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: IsInteger
		  ' By            : Jim Brock
		  ' Notes
		  ' Is the string an integer?
		  ' ----------------------------------------------------------------------
		  
		  Dim ReturnValue As Boolean
		  
		  Try
		    
		    Dim n As Integer
		    n = CInt(Value)
		    ReturnValue = True
		    
		  Catch Err as RunTimeException
		    
		    ReturnValue = False
		    
		  Finally
		    
		    Return ReturnValue
		    
		  End Try
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
		Sub ShowMaxExceeded()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Global.ShowMaxExceeded
		  ' By            : Jim Brock
		  ' Notes
		  ' Show the Maximum Adverts Exceeded message
		  ' ----------------------------------------------------------------------
		  Try
		    Dim dlgMessage As New dlgMessage
		    Dim Message() As String
		    
		    Message.Append("You cannot place any more adverts as you've exceeded you maximum")
		    Message.Append("")
		    Message.Append("You can either:")
		    Message.Append("")
		    Message.Append("* Upgrade you account to allow more adverts")
		    Message.Append("* Mark some of you adverts as 'Sold', 'Not Placed' or 'Deleted'")
		    Message.Append("")
		    
		    dlgMessage.lblHeading.Text = "Maximum Adverts Exceeded"
		    dlgMessage.lblMessage.Text = Join(Message, EndOfLine)
		    dlgMessage.Show
		    
		  Catch Err as RunTimeException
		    session.DisplayError "Global.ShowMaxExceeded", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type(extends e As RuntimeException) As String
		  Dim t As Introspection.TypeInfo = Introspection.GetType(e)
		  If t <> Nil Then
		    Return t.FullName
		  Else
		    //this should never happen...
		    Return ""
		  End If
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
