#tag Class
Protected Class ListBoxEx
Inherits ListBox
	#tag Method, Flags = &h0
		Sub constructor()
		  linecolor=&cDDDDDD
		  textColor=&c000000
		  backColor=rgb(200,200,200)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetRowHeight(Row As Integer, ColumnScale As Single, G As Graphics) As Integer
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ListBoxEx.GetRowHeight
		  ' Date          : 19/11/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Get the Row Height
		  ' ----------------------------------------------------------------------
		  Dim Col As Integer
		  Dim MaxHeight As Integer
		  Dim CellHeight As Integer
		  
		  ' Make sure you are using the correct font type and size
		  G.textfont=source.textFont
		  G.textsize=source.textsize
		  
		  ' Loop Throught the columns of this row checking the height of the text
		  For Col = 0 to Source.ColumnCount
		    
		    CellHeight = G.StringHeight(Source.Cell(Row, Col), Source.Column(Col).WidthActual * ColumnScale)
		    
		    If CellHeight > MaxHeight Then
		      MaxHeight = CellHeight
		    End If
		    
		  Next
		  
		  MaxHeight = MaxHeight + (2 * Cellpadding)
		  
		  ' If there's no text then return a default height
		  If MaxHeight < MinimumRowHeight Then
		    MaxHeight = MinimumRowHeight
		  End If
		  
		  
		  Return MaxHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateList(rs As RecordSet)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ListBoxEx.PopulateList
		  ' Date          : 14/11/2013
		  ' By            : Jim Brock
		  ' Notes
		  ' Populate the list box using the formatting specified
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim Col as integer
		    Dim CellValue As String
		    
		    ' Clear the  list
		    Me.deleteAllRows
		    
		    ' Loop until we reach the end of the recordset
		    while not rs.eof
		      
		      ' Add a new row
		      Me.addRow ""
		      
		      ' Loop through all of the fields in the recordset
		      for Col = 0 to rs.fieldCount - 1
		        
		        
		        ' Check whether the number of fields exceeds the number of columns in the list
		        if Col <= Me.ColumnCount Then
		          
		          ' Format the value
		          Select Case ColumnFormat(Col)
		            
		          Case "NonZeroMoney"
		            
		            If rs.IdxField(Col+1).DoubleValue <> 0 Then
		              CellValue = Format(rs.idxField(Col+1).DoubleValue, "\£###,###,##0.00")
		            Else
		              CellValue = ""
		            End if
		            
		          Case "Money"
		            
		            CellValue = Format(rs.idxField(Col+1).DoubleValue, "\£###,###,##0.00")
		            
		          Case "DoubleToDate"
		            
		            CellValue = DoubleToShortDate(rs.idxField(Col+1).DoubleValue)
		            
		          Case "NonZeroNumber"
		            
		            If rs.IdxField(Col+1).DoubleValue <> 0 Then
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
		      
		      rs.moveNext// move to the next record
		    wend
		    
		    
		  Catch Err as RunTimeException
		    app.DisplayError "ListBoxEx.PopulateList", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub printCell(row as integer, column as integer, g as graphics, sx as integer, sy as integer, width as integer, byref height as integer)
		  dim text as string
		  dim textW, tmpx as integer
		  
		  text=source.cell(row,column)
		  
		  g.textfont=source.textFont
		  g.textsize=source.textsize
		  g.bold=source.cellbold(row,column)
		  g.italic=source.cellItalic(row,column)
		  g.underline=source.cellUnderline(row,column)
		  
		  height=g.stringheight(text,width)
		  
		  If g.textheight>height then
		    height=g.textheight
		  End If
		  
		  height = height * 2
		  
		  g.foreColor=textcolor
		  
		  
		  textW=g.stringWidth(text)
		  select case source.columnAlignment(column)
		  case 2
		    //center
		    tmpx=sx+(width-textW)/2
		    if tmpx<sx then tmpx=sx+margin
		    g.drawString text,tmpx,sy+g.textAscent,width
		  case 3
		    //right
		    tmpx=sx+width-textW-margin
		    if tmpx<sx then tmpx=sx+margin
		    g.drawString text,tmpx,sy+g.textAscent,width
		  else
		    //left, default
		    g.drawString text,sx+margin,sy+g.textAscent,width
		  end select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function printHeaders(startRow as integer, g as graphics, scale as single, byref xs() as integer) As integer
		  dim text as string
		  dim w, height, maxH as integer
		  dim sx, sy, offset as integer
		  dim i as integer
		  
		  if not source.hasheading then return 0
		  
		  redim xs(-1)
		  
		  g.textfont=source.textFont
		  g.textsize=source.textsize
		  g.foreColor=textcolor
		  
		  ' Print all the graphics at the top of the page
		  headerHeight = DrawHeader(g)
		  sy = headerHeight
		  
		  sx = 15
		  
		  for i=startRow to source.columncount-1
		    
		    text=source.heading(i)
		    w=source.column(i).widthActual*scale
		    
		    height=g.stringheight(text,w)
		    if g.textheight>height then
		      height=g.textheight
		    End If
		    
		    if height>maxh then
		      maxH=height
		    End If
		    
		    offset=3
		    if w>g.stringwidth(text) then
		      offset=w/2-g.stringwidth(text)/2
		    end if
		    
		    
		    g.drawString text,sx+offset,g.textAscent + sy, w
		    xs.append sx
		    sx=sx+w
		  next
		  
		  MaxH = MaxH + Cellpadding
		  
		  g.drawline 0,maxH + sy, g.width,maxH + sy
		  
		  
		  return maxH + sy
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DrawHeader(g as graphics) As integer
	#tag EndHook


	#tag Property, Flags = &h1
		Protected backColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		Cellpadding As Integer = 2
	#tag EndProperty

	#tag Property, Flags = &h0
		ColumnFormat(50) As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected headerHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lineColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		MinimumRowHeight As Integer = 24
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected source As listbox
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TextColor As color
	#tag EndProperty


	#tag Constant, Name = margin, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ShowDropIndicator"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Cellpadding"
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumRowHeight"
			Group="Behavior"
			InitialValue="24"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
