#tag Class
Protected Class DocumentIndex
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  db.BeginTransaction
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Commit()
		  db.Commit
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ThisDataNode As DataNode)
		  DataNode = ThisDataNode
		  db = New MSSQLServerDatabaseEx
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertIndex()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: DocumentIndex.InsertIndex
		  ' Date          : 2014-08-27
		  ' By            : Jim Brock
		  ' Notes
		  ' Insert a record into the document Index
		  ' ----------------------------------------------------------------------
		  
		  
		  Dim sp As New SQLStoredProcedure(db, "DLInsertIndex")
		  Dim rs As RecordSet
		  
		  
		  sp.AddParameter("@ObjectId", AdvertId)
		  sp.AddParameter("@DocumentType", "Advert")
		  sp.AddParameter("@Title", DocumentTitle)
		  sp.AddParameter("@DataNodeId", DataNode.DataNodeId)
		  sp.AddParameter("@FileName", IndexFileName)
		  sp.GenerateSQL
		  
		  ' This returns the index id 
		  rs = sp.ExecuteRecordSet
		  IndexId = rs.Field("IndexId").Value
		  
		  ' So, just close
		  rs.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveFileAttempt(SourceFileName As String, DestinationFileName As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: MoveFileAttempt
		  ' Date          : 2014-08-26
		  ' By            : Jim Brock
		  ' Notes
		  ' Attempt to move the file to the new path but ignore any errors
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim Source As FolderItem
		    Dim Destination As FolderItem
		    
		    Source = GetFolderItem(SourceFileName)
		    Destination = GetFolderItem(DestinationFileName)
		    
		    ' Move the file to the new path
		    Source.MoveFileTo(Destination)
		    
		  Catch Err as RunTimeException
		    
		    ' Ignore any errors
		    'App.DisplayError ("MoveFileAttempt", Err)
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveToDataNode()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: MoveToDataNode
		  ' Date          : 2014-08-27
		  ' By            : Jim Brock
		  ' Notes
		  ' Move this document to the data node
		  ' ----------------------------------------------------------------------
		  
		  
		  Dim DateNow As New Date
		  Dim Destination As FolderItem
		  
		  ' Get the index file name
		  IndexFileName =  FormatDate(DateNow) + " " + SourceFile.Name
		  
		  ' Get the destination folder item
		  Destination = GetFolderItem(DataNode.PhysicalPath).Child(IndexFileName)
		  
		  ' Move the source to the destination
		  ' DONT use move here because the file does not inherit the Permissions from the 
		  ' destination folder if you use Move. Use copy instead!
		  ' SourceFile.File.MoveFileTo Destination
		  SourceFile.File.CopyFileTo Destination
		  
		  ' Throw any errors
		  If SourceFile.File.LastErrorCode <> 0 Then
		    
		    Raise New RunTimeExceptionEx (SourceFile.File.LastErrorCode, "Error Moving " + SourceFile.Name + " to " + IndexFileName)
		    
		  End If
		  
		  SourceFile.File.Delete
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RollBack()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: DocumentIndex.ResetDocument
		  ' Date          : 2014-08-27
		  ' By            : Jim Brock
		  ' Notes
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Rollback insert into the library
		    db.Rollback
		    
		  Catch Err as RunTimeException
		    
		    ' Ignore any errors in this routine
		    
		  End Try
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AdvertId As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		DataNode As DataNode
	#tag EndProperty

	#tag Property, Flags = &h21
		Private db As MSSQLServerDatabaseEx
	#tag EndProperty

	#tag Property, Flags = &h0
		DocumentMovedYN As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		DocumentTitle As String
	#tag EndProperty

	#tag Property, Flags = &h0
		IndexFileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		IndexId As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SourceFile As WebUploadedFile
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
			Name="IndexFileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DocumentTitle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DocumentMovedYN"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndexId"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AdvertId"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
