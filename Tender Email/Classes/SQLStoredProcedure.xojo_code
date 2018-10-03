#tag Class
Protected Class SQLStoredProcedure
	#tag Method, Flags = &h0
		Sub AddParameter(Name As String, Value as boolean)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: AddParameter (the BOOLEAN version)
		  ' Date          : 8/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Add the parameter as an Integer parameter
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new parameter
		  dim Parameter as new Parameter
		  
		  ' Update the name
		  Parameter.Name = Name
		  
		  ' Use 1 and 0 for true and false in SQL
		  If Value = True then
		    Parameter.Value = "1"
		  Else
		    Parameter.Value = "0"
		  End if
		  
		  ' Add the new parameter to the collection
		  Parameters.Append (Parameter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddParameter(Name as String, Value as Date, DateFormat as string)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: AddParameter (the DATE version)
		  ' Date          : 4/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Add the parameter as a DATE parameter
		  '
		  ' This is NOT the double version, this passes a real date at SQL
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new parameter
		  dim Parameter as new Parameter
		  dim StringDate as string
		  
		  
		  ' Update the name
		  Parameter.Name = Name
		  
		  ' Deal with some standard formats
		  Select Case DateFormat
		  Case "ShortDate"
		    StringDate = Value.SQLDate
		  Case "LongDate"
		    StringDate = Value.SQLDateTime
		  Case else
		    StringDate = Value.SQLDateTime
		  End Select
		  
		  
		  ' Add the value
		  ' Format the date as a long
		  Parameter.Value = "'" + StringDate + "'"
		  
		  ' Add the new parameter to the collection
		  Parameters.Append (Parameter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddParameter(Name As String, Value As Double)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: AddParameter (the Double version)
		  ' Date          : 8/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Add the parameter as a Double parameter
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new parameter
		  dim Parameter as new Parameter
		  
		  ' Update the name
		  Parameter.Name = Name
		  
		  ' Convert the number to a string for the SQL. Format the number otherwise you loose a few digits!
		  Parameter.Value = Format(Value, "##########.###")
		  
		  ' Add the new parameter to the collection
		  Parameters.Append (Parameter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddParameter(Name As String, Value as Integer)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: AddParameter (the INTEGER version)
		  ' Date          : 8/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Add the parameter as an Integer parameter
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new parameter
		  dim Parameter as new Parameter
		  
		  ' Update the name
		  Parameter.Name = Name
		  
		  ' Convert the number to a string for the SQL
		  Parameter.Value = CStr(Value)
		  
		  ' Add the new parameter to the collection
		  Parameters.Append (Parameter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddParameter(Name As String, Value As Single)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: AddParameter (the SINGLE version)
		  ' Date          : 11/11/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Add the parameter as an Single/float parameter
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new parameter
		  dim Parameter as new Parameter
		  
		  ' Update the name
		  Parameter.Name = Name
		  
		  ' Convert the number to a string for the SQL
		  Parameter.Value = CStr(Value)
		  
		  ' Add the new parameter to the collection
		  Parameters.Append (Parameter)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddParameter(Name as String, Value as String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: AddParameter (the STRING version)
		  ' Date          : 4/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Add the parameter as a string parameter
		  ' Escape and single quotes in the string and then wrap in single quotes
		  ' for the call.
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new parameter
		  dim Parameter as new Parameter
		  
		  ' Update the name
		  Parameter.Name = Name
		  
		  ' Add the value, escape and single quotes and wrap on single quotes
		  Parameter.Value = "'" + ReplaceAll(Value, "'", "''") + "'"
		  
		  ' Add the new parameter to the collection
		  Parameters.Append (Parameter)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddParameter(Name As String, Value As String, DateFormat As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: AddParameter (the DATE as string version)
		  ' Date          : 4/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Add the parameter as a DATE parameter but from a string
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new parameter
		  dim Parameter as new Parameter
		  dim StringDate as string
		  Dim CheckDate As Date
		  
		  If Not ParseDate(Value, CheckDate) Then
		    Raise New RunTimeExceptionEx (-1, "Invalid Date Passed")
		  End if
		  
		  ' Update the name
		  Parameter.Name = Name
		  
		  ' Deal with some standard formats
		  Select Case DateFormat
		  Case "ShortDate"
		    StringDate = CheckDate.SQLDate
		  Case "LongDate"
		    StringDate = CheckDate.SQLDateTime
		  Case else
		    StringDate = CheckDate.SQLDateTime
		  End Select
		  
		  
		  ' Add the value
		  ' Format the date as a long
		  Parameter.Value = "'" + StringDate + "'"
		  
		  ' Add the new parameter to the collection
		  Parameters.Append (Parameter)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(DB As MSSQLServerDatabaseEx, ProcedureName As String)
		  ' Set the ProcedureName at the ConstructorInfo
		  Me.ProcedureName = ProcedureName
		  Me.SQLDatabase = DB
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ProcedureName as String)
		  ' Set the ProcedureName at the ConstructorInfo
		  Me.ProcedureName = ProcedureName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteParameter(Name As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: DeleteParameter
		  ' Date          : 8/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Removes the named parameter from the list
		  ' ----------------------------------------------------------------------
		  
		  Dim n As Integer
		  Dim ParameterFound As Boolean
		  
		  ' Reset the found flag
		  ParameterFound = False
		  
		  ' Loop through the Parameters
		  For n = 0 to UBound(Parameters)
		    
		    ' If this Parameter is found then remove it from the list
		    If Parameters(n).Name = Name then
		      
		      ' Remove it
		      Parameters.Remove(n)
		      
		      ' Set the found flag
		      ParameterFound = True
		      
		      ' Exit the loop
		      Exit For
		      
		    End If
		    
		  Next
		  
		  ' If the parameter was not found, raise an Error
		  If Not ParameterFound then
		    Raise New RuntimeExceptionEx(-1, "SQLStoredProcedure Parameter Not Found:" + Name)
		  End if
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExecuteNonRecordSet()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ExecuteNonRecordSet
		  ' Date          : 25/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Create the call to the stored procedure
		  '
		  ' Any errors will be thrown to the calling routine
		  ' ----------------------------------------------------------------------
		  
		  
		  Dim ParameterValue as String
		  
		  ' Generate the SQL statement
		  GenerateSQL
		  
		  ' Execute the SQL to create a RecordSet
		  SQLDatabase.SQLExecute (SQL)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExecuteRecordSet() As Recordset
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Execute
		  ' Date          : 4/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Create the call to the stored procedure and return the resulting
		  ' recordset
		  '
		  ' Any errors will be thrown to the calling routine
		  ' ----------------------------------------------------------------------
		  
		  
		  Dim ParameterValue as String
		  Dim rs as RecordSet
		  
		  ' Generate the SQL statement
		  GenerateSQL
		  
		  ' Execute the SQL to create a RecordSet
		  rs = SQLDatabase.SQLSelect (SQL)
		  
		  ' Return the recordset
		  Return rs
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GenerateSQL()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: GenerateSQL
		  ' Date          : 5/10/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Generate the SQL statement from the ProcedureName and Parameters
		  ' ----------------------------------------------------------------------
		  
		  Dim n as Integer
		  
		  ' Add the ProcedureName
		  SQL = "EXEC " + Me.ProcedureName
		  
		  ' Now add the parameters
		  for n = 0 to Parameters.Ubound
		    
		    ' add a comma if not the first parameter
		    if n > 0 then
		      SQL = SQL + ", "
		    end if
		    
		    ' add the parameter name
		    SQL = SQL + " " + Parameters(n).Name + "="
		    
		    ' Add the formatted parameter value
		    SQL = SQL + Parameters(n).Value
		    
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Parameters() As Parameter
	#tag EndProperty

	#tag Property, Flags = &h0
		ProcedureName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SQL As string
	#tag EndProperty

	#tag Property, Flags = &h0
		SQLDatabase As MSSQLServerDatabase
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
			Name="ProcedureName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SQL"
			Group="Behavior"
			Type="string"
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
	#tag EndViewBehavior
End Class
#tag EndClass
