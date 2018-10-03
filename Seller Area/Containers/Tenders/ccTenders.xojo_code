#tag WebPage
Begin WebContainer ccTenders
   Compatibility   =   ""
   Cursor          =   0
   Enabled         =   True
   Height          =   464
   HelpTag         =   ""
   HorizontalCenter=   0
   Index           =   -2147483648
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   Style           =   "None"
   TabOrder        =   0
   Top             =   0
   VerticalCenter  =   0
   Visible         =   True
   Width           =   622
   ZIndex          =   1
   _DeclareLineRendered=   False
   _HorizontalPercent=   0.0
   _IsEmbedded     =   False
   _Locked         =   False
   _NeedsRendering =   True
   _OfficialControl=   False
   _OpenEventFired =   False
   _ShownEventFired=   False
   _VerticalPercent=   0.0
   Begin WebListBox lstTenders
      AlternateRowColor=   &cEDF3FE00
      ColumnCount     =   4
      ColumnWidths    =   "5%,25%,60%,10%"
      Cursor          =   0
      Enabled         =   True
      HasHeading      =   True
      HeaderStyle     =   "0"
      Height          =   356
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      InitialValue    =   ""
      Left            =   20
      ListIndex       =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MinimumRowHeight=   22
      Multiline       =   False
      PrimaryRowColor =   &cFFFFFF00
      Scope           =   0
      SelectionStyle  =   "1397665791"
      Style           =   "0"
      TabOrder        =   -1
      Top             =   88
      VerticalCenter  =   0
      Visible         =   True
      Width           =   582
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _VerticalPercent=   0.0
   End
   Begin WebLabel lblTenders
      Cursor          =   1
      Enabled         =   True
      HasFocusRing    =   True
      Height          =   22
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      Style           =   "467515391"
      TabOrder        =   0
      Text            =   "Current Tenders"
      TextAlign       =   0
      Top             =   20
      VerticalCenter  =   0
      Visible         =   True
      Width           =   409
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _VerticalPercent=   0.0
   End
   Begin WebLabel lblInstructions
      Cursor          =   1
      Enabled         =   True
      HasFocusRing    =   True
      Height          =   22
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      Style           =   "484685823"
      TabOrder        =   1
      Text            =   "Click a TenderId to view the tender"
      TextAlign       =   0
      Top             =   66
      VerticalCenter  =   0
      Visible         =   True
      Width           =   253
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _VerticalPercent=   0.0
   End
   Begin ccTender conTender
      Cursor          =   0
      Enabled         =   True
      Height          =   464
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      ScrollbarsVisible=   0
      Style           =   "158834687"
      TabOrder        =   2
      TenderId        =   0
      Top             =   0
      VerticalCenter  =   0
      Visible         =   False
      Width           =   622
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _ShownEventFired=   False
      _VerticalPercent=   0.0
   End
   Begin ccLoadingTenders conLoadingTenders
      Cursor          =   0
      Enabled         =   True
      Height          =   464
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      ScrollbarsVisible=   0
      Style           =   "158834687"
      TabOrder        =   3
      Top             =   0
      VerticalCenter  =   0
      Visible         =   True
      Width           =   622
      ZIndex          =   1
      _DeclareLineRendered=   False
      _HorizontalPercent=   0.0
      _IsEmbedded     =   False
      _Locked         =   False
      _NeedsRendering =   True
      _OfficialControl=   False
      _OpenEventFired =   False
      _ShownEventFired=   False
      _VerticalPercent=   0.0
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Open()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccTender.Open
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    lstTenders.Heading(0) = "TenderId"
		    lstTenders.Heading(1) = "CompanyName"
		    lstTenders.Heading(2) = "Subject"
		    lstTenders.Heading(3) = "Expiry Date"
		    
		  Catch Err as RunTimeException
		    session.DisplayError "ccTender.Open", Err
		    
		  End Try
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccTenders.Shown
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    lstTenders.ColumnHeaderStyle(0) = styListHeadingLeft
		    lstTenders.ColumnHeaderStyle(1) = styListHeadingLeft
		    lstTenders.ColumnHeaderStyle(2) = styListHeadingLeft
		    lstTenders.ColumnHeaderStyle(3) = styListHeadingCentre
		    
		    GetTenders
		    
		    conLoadingTenders.Visible = False
		    
		  Catch Err as RunTimeException
		    session.DisplayError "ccTenders.Shown", Err
		    
		  End Try
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub GetTenders()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccTenders.GetTenders
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Connect to the database
		    Dim db As New MSSQLServerDatabaseEx
		    Dim sp As New SQLStoredProcedure(db, "slGetTenders")
		    Dim rs As RecordSet
		    
		    rs = sp.ExecuteRecordSet
		    
		    PopulateTenderList rs
		    
		    rs.Close
		    
		    ' Disconnect
		    db.Close
		    
		  Catch Err as RunTimeException
		    Session.DisplayError "ccTenders.GetTenders", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PopulateTenderList(rs As RecordSet)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccTenders.PopulateTenderList
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    Dim ListIndex As Integer
		    
		    
		    While Not rs.EOF
		      
		      lstTenders.AddRow("")
		      ListIndex = lstTenders.LastIndex
		      
		      lstTenders.Cell(ListIndex, 0) = rs.Field("TenderId").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      lstTenders.CellStyle(ListIndex, 0) = styListId
		      
		      lstTenders.Cell(ListIndex, 1) = rs.Field("CompanyName").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      lstTenders.Cell(ListIndex, 2) = rs.Field("Subject").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      lstTenders.Cell(ListIndex, 3) = rs.Field("ExpiryDate").StringValue.DefineEncoding(Encodings.WindowsANSI)
		      lstTenders.CellStyle(ListIndex, 3) = styListCellCentre
		      
		      
		      rs.MoveNext
		      
		    Wend
		    
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "ccTenders.PopulateTenderList", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartLoadingTenders()
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events lstTenders
	#tag Event
		Sub CellClick(Row As Integer, Column As Integer)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccTenders.lstTenders.CellClick
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    If Column = 0 Then
		      
		      conTender.Show(CInt(lstTenders.Cell(Row, 0)))
		      
		    End If
		    
		  Catch Err as RunTimeException
		    session.DisplayError "ccTenders.lstTenders.CellClick", Err
		    
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="300"
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
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ScrollbarsVisible"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
			"3 - Vertical"
			"4 - Horizontal"
		#tag EndEnumValues
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
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ZIndex"
		Group="Behavior"
		InitialValue="1"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_DeclareLineRendered"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="_OpenEventFired"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ShownEventFired"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_VerticalPercent"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
#tag EndViewBehavior
