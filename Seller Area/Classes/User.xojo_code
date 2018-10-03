#tag Class
Protected Class User
	#tag Method, Flags = &h0
		Function Authenticate() As Boolean
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: User.Authenticate
		  ' Date          : 14/04/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Autheniticate the username and password
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim Authenticated As Boolean = False
		    Dim db As New MSSQLServerDatabaseEx
		    Dim sp As New SQLStoredProcedure(db, "slCheckCredentials")
		    Dim rs As RecordSet
		    
		    sp.AddParameter("@EmailAddress", Username)
		    sp.AddParameter("@Password", Password)
		    
		    ' Run the procedure
		    rs = sp.ExecuteRecordSet
		    
		    If NOT rs.EOF Then
		      
		      ' Save the AccountId
		      AccountId = rs.Field("AccountId").IntegerValue
		      FirstName = rs.Field("FullName").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      LastName = rs.Field("LastName").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      CompanyName = rs.Field("CompanyName").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      AccountStatusId = rs.Field("AccountStatusId").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      AccountStatusDescription = rs.Field("AccountStatusDescription").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      ExpiryDate = rs.Field("ExpiryDate").DateValue
		      Tenders = rs.Field("Tenders").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      MaxAdverts = rs.Field("MaxAdverts").IntegerValue
		      NewYN = rs.Field("NewYN").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      
		      URL = rs.Field("URL").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      EmailAddress = rs.Field("EmailAddress").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      ContactName = rs.Field("ContactName").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      Telephone = rs.Field("Telephone").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      
		      
		      ' Return the result
		      Authenticated = True
		      
		    End if
		    
		    db.Close
		    
		    return Authenticated
		    
		  Catch Err as RunTimeException
		    Session.DisplayError "User.Authenticate", Err
		    
		  End Try
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Logout()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: User.Authenticate
		  ' Date          : 14/04/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Autheniticate the username and password
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Me.Username = ""
		    Me.Password = ""
		    Me.Authenticated = False
		    
		  Catch Err as RunTimeException
		    Session.DisplayError "User.Logout", Err
		    
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AccountId As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		AccountStatusDescription As String
	#tag EndProperty

	#tag Property, Flags = &h0
		AccountStatusId As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Authenticated As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		CompanyName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ContactName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		EmailAddress As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ExpiryDate As Date
	#tag EndProperty

	#tag Property, Flags = &h0
		FirstName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxAdverts As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NewYN As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Telephone As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Tenders As String
	#tag EndProperty

	#tag Property, Flags = &h0
		URL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Username As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Authenticated"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="Password"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccountId"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FirstName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CompanyName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccountStatusId"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccountStatusDescription"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tenders"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxAdverts"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NewYN"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EmailAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Telephone"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContactName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
