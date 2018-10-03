#tag WebPage
Begin WebContainer ccWebSelector
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
   Style           =   "None"
   TabOrder        =   0
   Top             =   0
   VerticalCenter  =   0
   Visible         =   True
   Width           =   300
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
	#tag Method, Flags = &h0
		Sub AddItem(Text As String, Value As Variant, Selected As Boolean)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WebSelector.AddItem
		  ' Date          : 05/06/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Add an item to the selector
		  ' ----------------------------------------------------------------------
		  
		  ' Create a new item
		  Dim NewItem As New ccWebSelectorItem
		  
		  
		  ' Display depending on the Orientation of the control
		  Select Case Orientation
		    
		  Case Horizontal
		    NewItem.EmbedWithin(Self, (Items.Ubound + 1) * (Gap + ItemWidth), 0, ItemWidth, ItemHeight)
		    
		  Case Vertical
		    NewItem.EmbedWithin(Self, 0 , (Items.Ubound + 1) * (Gap + ItemHeight), ItemWidth, ItemHeight)
		    
		  End Select
		  
		  ' Update the text and value for this item
		  NewItem.Value = Value
		  NewItem.lblItem.Text = Text
		  NewItem.lblItem.Width = ItemWidth
		  NewItem.lblItem.Height = ItemHeight
		  NewItem.LockLeft = True
		  NewItem.LockTop = True
		  NewItem.LockRight = True
		  NewItem.LockBottom = True
		  NewItem.Style = styWSUnSelected
		  
		  ' Add the item to the list
		  Items.Append(NewItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeSelectAllItems()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: ccWebSelector.DeSelectAllItems
		  ' By            : Jim Brock
		  ' Notes
		  ' Deselect all the items on the control
		  ' ----------------------------------------------------------------------
		  Try
		    Dim i As Integer
		    
		    For i = 0 to Items.Ubound
		      Items(i).Style = styWSUnSelected
		    Next
		    
		    SelectedItem = Nil
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "ccWebSelector.DeSelectAllItems", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawItems()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: DrawItems
		  ' Date          : 05/06/2014
		  ' By            : Jim Brock
		  ' Notes
		  ' Reset all the positions of the items
		  ' ----------------------------------------------------------------------
		  Dim CurrentX As Integer
		  Dim CurrentY As Integer
		  Dim Item As Integer
		  
		  
		  ' Set the Current positions to the padding values
		  CurrentX = BorderWidth
		  CurrentY = BorderWidth
		  
		  ' Calculate the Item size
		  Select Case Orientation
		  Case Horizontal
		    ItemHeight = Height - 4 * BorderWidth
		    ItemWidth = (Width - (Items.Ubound * Gap) - (2 * BorderWidth))/(Items.Ubound + 1)
		    
		  Case Vertical
		    ItemHeight = (Height - (Items.Ubound * Gap)  - (2 * BorderWidth))/(Items.Ubound + 1)
		    ItemWidth = Width - 4 * BorderWidth
		    
		  End Select
		  
		  ' Loop setting the position and size of each item
		  For Item = 0 to Items.Ubound
		    
		    Items(Item).Left = CurrentX
		    Items(Item).Top = CurrentY
		    Items(Item).Width = ItemWidth
		    Items(Item).Height = ItemHeight
		    Items(Item).lblItem.Height = ItemHeight
		    Items(Item).lblItem.Width = ItemWidth
		    
		    Select Case Orientation
		      
		    Case Horizontal
		      
		      CurrentX = CurrentX + ItemWidth + Gap
		      
		    Case Vertical
		      
		      CurrentY = CurrentY + ItemHeight + Gap
		      
		    End Select
		    
		    
		  Next Item
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WSItemClick(ccWSItem As ccWebSelectorItem)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WebSelector.WSItemClick
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  
		  ' If the user is allowed to deselect an item and this is the currently selected items,
		  ' deselect it
		  If AllowDeselectYN = True And SelectedItem = ccWSItem Then
		    
		    SelectedItem.Style = styWSUnSelected
		    SelectedItem = Nil
		    
		  Else
		    
		    ' Set the selected item
		    Dim i As Integer
		    
		    For i = 0 to Items.Ubound
		      
		      if Items(i) = ccWSItem then
		        
		        SelectedItem = ccWSItem
		        Items(i).Style = styWSSelected
		        
		      else
		        
		        Items(i).Style = styWSUnSelected
		        
		      end if
		      
		    Next
		    
		    ' Raise the Item Selected Event
		    ItemSelected  (ccWSItem)
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ItemSelected(SelectedItem As ccWebSelectorItem)
	#tag EndHook


	#tag Property, Flags = &h0
		AllowDeselectYN As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderWidth As Integer = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		Gap As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemHeight As Integer = 25
	#tag EndProperty

	#tag Property, Flags = &h0
		Items() As ccWebSelectorItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ItemWidth As Integer = 50
	#tag EndProperty

	#tag Property, Flags = &h0
		Orientation As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedItem As ccWebSelectorItem
	#tag EndProperty


	#tag Constant, Name = Horizontal, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Vertical, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


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
		Name="ItemHeight"
		Group="Behavior"
		InitialValue="25"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ItemWidth"
		Group="Behavior"
		InitialValue="50"
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
		Name="BorderWidth"
		Group="Behavior"
		InitialValue="1"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowDeselectYN"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
#tag EndViewBehavior
