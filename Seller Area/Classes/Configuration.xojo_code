#tag Class
Protected Class Configuration
	#tag Method, Flags = &h0
		Sub Constructor()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Constructor
		  ' Date          : 7/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Read in the Configuration file as part of the constructor
		  ' Throw errors to the calling routine
		  ' ----------------------------------------------------------------------
		  
		  ' A string to hold a Configuration item from the file
		  Dim ConfigurationItem() As String
		  Dim ConfigurationLine As String
		  Dim ConfigFile As FolderItem
		  
		  ' A stream to read the file
		  Dim ConfigFileStream as TextInputStream
		  
		  ' Create a new instance of the items
		  Item = New Dictionary
		  
		  ' The Session.config file must be in the same folder as the exe file
		  ConfigFile = (Session.ApplicationPath.Child("app.config"))
		  
		  ' Open the file
		  ConfigFileStream = TextInputStream.Open(ConfigFile)
		  
		  ' The first line is the comment line
		  ConfigurationLine = ConfigFileStream.ReadLine
		  
		  
		  ' Now loop reading in Name value pairs into the Dictionary
		  Do Until ConfigFileStream.EOF
		    
		    ' Read the item from the file
		    ConfigurationLine = ConfigFileStream.ReadLine
		    
		    ' Check the line has something in it
		    if ConfigurationLine <> "" then
		      ConfigurationItem = Split(ConfigurationLine, "|")
		    End if
		    
		    ' Append it to the item dictionary
		    Item.Value(Trim(ConfigurationItem(0))) = Trim(ConfigurationItem(1))
		    
		    
		  Loop
		  
		  ' Close the configuration file
		  ConfigFileStream.Close
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Item As Dictionary
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
