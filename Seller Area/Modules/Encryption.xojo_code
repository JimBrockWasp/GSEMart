#tag Module
Protected Module Encryption
	#tag Method, Flags = &h0
		Function Encrypt(MyText As String) As string
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Encrypt
		  ' Date          : 07/07/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Take the string and turn it into a string of encrypted hex values 
		  ' ----------------------------------------------------------------------
		  Dim Result as string
		  Dim char As Integer
		  Dim Value As Integer
		  
		  ' Loop through the string
		  For Char = 0 to Len(MyText) - 1
		    
		    ' Get the Acii Value
		    Value = AscB(Mid(MyText, Char + 1, 1))
		    
		    ' Encrypt
		    Value = Value Xor Char
		    
		    ' Append to the result
		    If Char > 0 Then
		      Result = Result + "-"
		    End If
		    
		    ' Concatenate this character to the result
		    Result = Result + Hex8Bit(Value)
		    
		  Next
		  
		  ' Return the result
		  Return Result
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Hex8Bit(Value As Integer) As String
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: Hex8Bit
		  ' Date          : 07/07/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Take the number passed and return as a hex value with a leading zero
		  ' e.g. 0A or BC
		  ' ----------------------------------------------------------------------
		  
		  ' Create a prefix of 2 zeros
		  Const prefix="00"
		  
		  ' The return value
		  Dim Result As String
		  
		  ' Set the result to the right 2 digits
		  Result = Right( prefix + Hex( value ), 2 ) 
		  
		  ' Return the result
		  Return Result
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
