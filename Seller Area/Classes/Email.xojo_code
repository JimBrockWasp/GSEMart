#tag Class
Protected Class Email
	#tag Method, Flags = &h0
		Sub Constructor()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Email.Constructor
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    MailSocket = New SMTPSocket
		    
		    MailSocket.Address  = Session.ConfigurationItems.Item.Value("SMTPAddress")
		    MailSocket.Port     = Session.ConfigurationItems.Item.Value("SMTPPort")
		    MailSocket.Username = Session.ConfigurationItems.Item.Value("SMTPUsername")
		    MailSocket.Password = Session.ConfigurationItems.Item.Value("SMTPPassword")
		    
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "Email.Constructor", Err
		    
		  End Try
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		MailSocket As SMTPSocket
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
