#tag Class
Protected Class ODBCDatabaseEx
Inherits ODBCDatabase
	#tag Method, Flags = &h0
		Sub BeginTransaction()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: BeginTransaction
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Check whether there are any uncommitted transactions and if not
		  ' begin a new transaction
		  '
		  ' This prevents nested transactions in the code!
		  ' ----------------------------------------------------------------------
		  
		  ' Make sure there are no uncommitted transactions
		  CheckTransactions
		  
		  ' Begin This transaction
		  Me.SQLExecute ("BEGIN TRANSACTION")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckTransactions()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: CheckTransactions
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Check whether there are any uncommitted transactions on this connection
		  ' ----------------------------------------------------------------------
		  Dim Transactions As Integer
		  Dim rs As RecordSet
		  
		  ' Check wether there are any outstanding Transactions
		  rs = Me.SQLSelect("SELECT @@TRANCOUNT Transactions")
		  Transactions = rs.Field("Transactions").IntegerValue
		  rs.Close
		  
		  
		  if Transactions > 0 Then
		    
		    ' Raise the SQL error to the error trap
		    Raise New RuntimeExceptionEx(1, "Uncommitted Transactions")
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Close
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' This routine can be called as part of an error trap where the connection
		  ' may already be closed. I want this so I've allowed for the routine to be
		  ' called even if the database is already closed.
		  '
		  ' Check whether there are any uncommitted transactions and then close
		  ' the connection
		  ' ----------------------------------------------------------------------
		  
		  ' Check whether the database is connected
		  If mConnected then
		    
		    Try
		      
		      CheckTransactions
		      
		    Catch
		      
		      ' Raise the SQL error to the error trap
		      Raise New RuntimeExceptionEx(1, "Uncommitted Transactions")
		      
		    Finally
		      
		      Super.close
		      mConnected = False
		      
		    End try
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Commit()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Commit
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Commit the transaction and then check there are no uncommitted transactions
		  '
		  ' This prevents nested transactions in the code
		  ' ----------------------------------------------------------------------
		  
		  ' Commit the transaction
		  Me.SQLExecute ("COMMIT TRANSACTION")
		  
		  ' Make sure there are no uncommitted transactions
		  CheckTransactions
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Connect()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Connect
		  ' Date          : 25/04/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Connect to the database
		  ' ----------------------------------------------------------------------
		  
		  ' Set the database properties
		  Me.DataSource = Session.ConfigurationItems.Item.Value("ODBCConnection")
		  
		  ' Check whether the connection succeeded
		  If Super.connect Then
		    
		    mConnected = True
		    
		  Else
		    
		    ' Raise the SQL error to the error trap
		    Raise New RuntimeExceptionEx(1, Me.ErrorMessage)
		    
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Constructor
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Connect to the database when the object is created
		  ' ----------------------------------------------------------------------
		  
		  Me.Connect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Destructor
		  ' Date          : 25/04/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Rollback any uncommitted transactions
		  ' ----------------------------------------------------------------------
		  Me.Rollback
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRecord(tableName As String, dbRecord As DatabaseRecord)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: InsertRecord
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Insert a record into the database
		  ' ----------------------------------------------------------------------
		  
		  Super.InsertRecord tableName, dbRecord
		  
		  ' Raise any errors
		  If Me.Error Then
		    
		    Raise New RunTimeExceptionEx(Me.ErrorCode, Me.ErrorMessage)
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rollback()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Rollback
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Try to Rollback any transactions and ignore any errors
		  ' ----------------------------------------------------------------------
		  
		  ' Check whether the database is connected
		  If mConnected then
		    
		    Try
		      
		      ' Rollback any transactions
		      Me.SQLExecute ("ROLLBACK TRANSACTION")
		      
		    Catch Err as RunTimeException
		      
		      ' Ignore any errors
		      
		    End Try
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SQLExecute(sqlString As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: SQLExecute
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Run the SQL and throw any errors to the calling routine
		  ' ----------------------------------------------------------------------
		  
		  ' Execute the SQL
		  
		  Super.SQLExecute (sqlString)
		  
		  
		  ' Raise any errors
		  If Me.Error Then
		    
		    Raise New RunTimeExceptionEx(Me.ErrorCode, Me.ErrorMessage)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(sqlString As String) As RecordSet
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: SQLSelect
		  ' Date          : 24/05/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Run the SQL and throw any errors to the calling routine
		  ' ----------------------------------------------------------------------
		  
		  Dim rs As RecordSet
		  
		  ' Execute the SQL
		  rs = Super.SQLSelect (sqlString)
		  
		  ' Raise any errors
		  If Me.Error Then
		    
		    Raise New RunTimeExceptionEx(Me.ErrorCode, Me.ErrorMessage)
		    
		  End If
		  
		  Return rs
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mConnected
			End Get
		#tag EndGetter
		Connected As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mConnected As Boolean = False
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Timeout"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExtendedSchema"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Attribute"
			Visible=true
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttributeString"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DatabaseName"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollableCursor"
			Visible=true
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Connected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
