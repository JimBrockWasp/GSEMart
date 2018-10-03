#tag WebPage
Begin WebContainer ccWebTab
   Compatibility   =   ""
   Cursor          =   0
   Enabled         =   True
   Height          =   40
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
   Style           =   "1241567231"
   TabOrder        =   0
   Top             =   0
   VerticalCenter  =   0
   Visible         =   True
   Width           =   285
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
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Open()
		  styNoTabs = styWebTabNoTabs
		  stySelected = styWebTabSelected
		  styUnSelected = styWebTabUnSelected
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddTab(Text As String, Value As Variant, Selected as Boolean, Optional xLine As integer = 1)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WebSelector.AddTab
		  ' Date          : 16.06.2014
		  ' By            : Metodija Angjelkoski
		  ' Notes
		  ' Add an Tab for the web selector
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new item
		  Dim NewTab As New ccWebTabItem
		  Dim Ubnd As Integer = Tabs.Ubound + 1
		  
		  ' Update the text and value for this item
		  
		  
		  
		  NewTab.EmbedWithin(Self, Ubnd * (TabWidth + Gap) + LeftOffset, 0, TabWidth, Self.Height\TabLines - 2)
		  
		  NewTab.ScrollbarsVisible = ScrollbarsNever
		  ' NewTab.Text = Text
		  NewTab.Value = Value
		  NewTab.Line = xLine
		  
		  NewTab.lblItem.Text = Text
		  NewTab.lblItem.Height = NewTab.Height
		  NewTab.lblItem.Width = TabWidth
		  NewTab.lblItem.Top = -2
		  NewTab.lblItem.Left = -2
		  
		  if Selected then
		    'NewTab.lblItem.Style = stySelected
		    NewTab.Style = stySelected
		    SelectedTab = NewTab
		  else
		    'NewTab.lblItem.Style = styUnSelected
		    NewTab.Style = styUnSelected
		  end if
		  
		  '
		  'NewTab.LockLeft = True
		  'NewTab.LockTop = True
		  'NewTab.LockRight = False
		  'NewTab.LockBottom = False
		  
		  ' Add the item to the list
		  Tabs.Append(NewTab)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeSelectAll()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccWebTab.DeSelectAll
		  ' Date          : 23/06/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' De-select all the tabs on the control
		  ' This is used when there are multiple tab controls on one screen
		  ' ----------------------------------------------------------------------
		  Dim i As Integer
		  
		  For i = 0 to Tabs.Ubound
		    Tabs(i).lblItem.Style = styUnSelected
		  Next
		  
		  SelectedTab = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawTabs()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccWebTab.DrawTabs
		  ' Date          : 23/06/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Redraw the tabs with any left offset
		  ' ----------------------------------------------------------------------
		  
		  Dim n As Integer
		  Dim m1 As Integer = 0
		  Dim m2 As integer = 0
		  
		  Dim ExtraPadding As Integer
		  
		  If TabLines > 1 Then 
		    ExtraPadding = TabWidth \ 3
		  Else
		    ExtraPadding = 0
		  End If
		  
		  
		  For n = 0 to Tabs.Ubound
		    
		    if Tabs(n).Line = 1 then
		      Tabs(n).Left = (m1 * (TabWidth + Gap)) + LeftOffSet + ExtraPadding
		      m1 = m1 + 1
		    end if
		    
		    if Tabs(n).Line = 2 then
		      Tabs(n).Left = (m2 * (TabWidth + Gap)) + LeftOffSet
		      m2 = m2 + 1
		    end if
		    
		    Tabs(n).Top = (Tabs(n).Line - 1) * (TabHeight+1)
		    
		    If Tabs(n) = SelectedTab Then
		      Tabs(n).Style = stySelected
		    Else
		      Tabs(n).Style = styUnSelected
		    End If
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetAll()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WebTab.ResetAll
		  ' Date          : 16/07/2014
		  ' By            : Metodija Angjelkoski
		  ' Notes
		  ' Resets All items to the selector
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new item
		  
		  Dim i As Integer
		  for i = Me.ControlCount to 0 step -1
		    if Me.ControlAtIndex(i) isa ccWebTabItem Then
		      Tabs(i).Close
		      Tabs.Remove(i)
		    end if
		  next
		  SelectedTab = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WSTabClick(ccWSTab As ccWebTabItem)
		  
		  Dim i As Integer
		  
		  For i = 0 to Tabs.Ubound
		    
		    if Tabs(i) = ccWSTab then
		      SelectedTab = ccWSTab
		      'Tabs(i).lblItem.Style = stySelected
		      Tabs(i).Style = stySelected
		    else
		      'Tabs(i).lblItem.Style = styUnSelected
		      Tabs(i).Style = styUnSelected
		    end if
		    
		  Next
		  
		  TabSelected (ccWSTab)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event TabSelected(SelectedTab As ccWebTabItem)
	#tag EndHook


	#tag Property, Flags = &h0
		BorderWidth As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Gap As Integer = 4
	#tag EndProperty

	#tag Property, Flags = &h0
		LeftOffSet As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Orientation As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedTab As ccWebTabItem
	#tag EndProperty

	#tag Property, Flags = &h0
		styNoTabs As WebStyle
	#tag EndProperty

	#tag Property, Flags = &h0
		stySelected As WebStyle
	#tag EndProperty

	#tag Property, Flags = &h0
		styUnSelected As WebStyle
	#tag EndProperty

	#tag Property, Flags = &h0
		TabHeight As Integer = 33
	#tag EndProperty

	#tag Property, Flags = &h0
		TabLines As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		Tabs() As ccWebTabItem
	#tag EndProperty

	#tag Property, Flags = &h0
		TabWidth As Integer = 150
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="_DeclareLineRendered"
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
		Name="Gap"
		Group="Behavior"
		InitialValue="5"
		Type="Integer"
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
		Name="Orientation"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
		Name="_ShownEventFired"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="_VerticalPercent"
		Group="Behavior"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabWidth"
		Group="Behavior"
		InitialValue="60"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BorderWidth"
		Group="Behavior"
		InitialValue="1"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LeftOffSet"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabLines"
		Group="Behavior"
		InitialValue="1"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabHeight"
		Group="Behavior"
		InitialValue="33"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
