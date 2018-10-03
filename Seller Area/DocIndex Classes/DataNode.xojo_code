#tag Class
Protected Class DataNode
	#tag Method, Flags = &h0
		Sub Constructor()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: DataNode.Constructor
		  ' Date          : 2014-08-26
		  ' By            : Jim Brock
		  ' Notes
		  ' Get the next datanode to store the document in
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Connect to the database
		    Dim db As New MSSQLServerDatabaseEx
		    Dim sp As New SQLStoredProcedure(db, "DLGetNode")
		    Dim rs As RecordSet
		    
		    ' Get the datanode record
		    rs = sp.ExecuteRecordSet
		    
		    DataNodeId = rs.Field("DataNodeId").IntegerValue
		    PhysicalPath = rs.Field("PhysicalPath").StringValue.DefineEncoding(Encodings.WindowsANSI)
		    
		    ' Close the recordset
		    rs.Close
		    
		    ' Disconnect
		    db.Close
		    
		  Catch Err as RunTimeException
		    
		    ' Throw the error to the calling routine
		    Raise New RunTimeExceptionEx (Err.ErrorNumber, Err.Message)
		    
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DataNodeId As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PhysicalPath As String
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
		#tag ViewProperty
			Name="DataNodeId"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PhysicalPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
