#tag Class
Protected Class WebListBoxEx
Inherits WebListBox
	#tag Method, Flags = &h0
		Sub GetColumnNames(rs As RecordSet)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WebListBoxEx.GetColumnNames
		  ' Date          : 11/06/2014 10:25
		  ' By            : Metodija Angjelkoski
		  ' Notes
		  ' Gets Database names - Mainly for development purposes
		  ' ----------------------------------------------------------------------
		  
		  Dim i as Integer
		  for i = 0 To rs.FieldCount-1
		    
		    Me.Heading(i)=rs.IdxField(i+1).Name
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateListBox(rs As RecordSet)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WebListBoxEx.PopulateListBox
		  ' Date          : 15/04/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Populate the listbox from the recordset
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim Col as integer
		    Dim CellValue As String
		    
		    
		    
		    
		    ' Clear the  list
		    Me.deleteAllRows
		    
		    ' Loop until we reach the end of the recordset
		    While Not rs.eof
		      
		      ' Add a new row
		      Me.addRow ""
		      
		      ' Loop through all of the fields in the recordset
		      For Col = 0 To Me.ColumnCount - 1
		        
		        
		        ' Check whether the number of columns exceeds the number of fields in the RecordSet
		        If Col <= rs.FieldCount Then
		          
		          ' Format the value
		          Select Case ColumnFormat(Col)
		            
		          Case "NonZeroMoney"
		            
		            If rs.IdxField(Col+2).DoubleValue <> 0 Then
		              CellValue = Format(rs.idxField(Col+1).DoubleValue, "\£###,###,##0.00")
		            Else
		              CellValue = ""
		            End if
		            
		          Case "Money"
		            
		            CellValue = Format(rs.idxField(Col+1).DoubleValue, "\£###,###,##0.00")
		            
		          Case "NonZeroNumber"
		            
		            If rs.IdxField(Col+2).DoubleValue <> 0 Then
		              CellValue = rs.IdxField(Col+1).StringValue
		            Else
		              CellValue = ""
		            End if
		            
		          Case Else
		            
		            If ColumnFormat(Col) <> "" Then
		              
		              ' Use a standard RealBasic format string
		              CellValue = Format(rs.idxField(Col+1).DoubleValue, ColumnFormat(Col))
		              
		            Else
		              
		              ' Default is a simple string
		              CellValue = rs.idxField(Col+1).StringValue
		              
		            End If
		            
		            
		            
		          End Select
		          
		          ' Set the cell
		          Me.Cell( Me.lastIndex, Col ) = CellValue
		          
		        End If
		        
		      Next
		      
		      ' Save the first column as the Id in the RowTag
		      Me.RowTag (Me.LastIndex) = rs.IdxField(1).StringValue
		      
		      rs.moveNext// move to the next record
		    Wend
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "WebListBoxEx.PopulateListBox", Err
		    
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ColumnFormat(50) As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="_OpenEventFired"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_DeclareLineRendered"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlternateRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cEDF3FE"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Behavior"
			InitialValue="*"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Cursor"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Automatic"
				"1 - Standard Pointer"
				"2 - Finger Pointer"
				"3 - IBeam"
				"4 - Wait"
				"5 - Help"
				"6 - Arrow All Directions"
				"7 - Arrow North"
				"8 - Arrow South"
				"9 - Arrow East"
				"10 - Arrow West"
				"11 - Arrow Northeast"
				"12 - Arrow Northwest"
				"13 - Arrow Southeast"
				"14 - Arrow Southwest"
				"15 - Splitter East West"
				"16 - Splitter North South"
				"17 - Progress"
				"18 - No Drop"
				"19 - Not Allowed"
				"20 - Vertical IBeam"
				"21 - Crosshair"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Behavior"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HorizontalCenter"
			Group="Behavior"
			Type="Integer"
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
			Name="ListIndex"
			Visible=true
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumRowHeight"
			Visible=true
			Group="Behavior"
			InitialValue="22"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrimaryRowColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabOrder"
			Visible=true
			Group="Behavior"
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
			Name="VerticalCenter"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Behavior"
			InitialValue="200"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZIndex"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_HorizontalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_IsEmbedded"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_Locked"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_NeedsRendering"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OfficialControl"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_VerticalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
