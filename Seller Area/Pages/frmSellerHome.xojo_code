#tag WebPage
Begin WebPage frmSellerHome
   Compatibility   =   ""
   Cursor          =   0
   Enabled         =   True
   Height          =   412
   HelpTag         =   ""
   HorizontalCenter=   0
   ImplicitInstance=   True
   Index           =   -2147483648
   IsImplicitInstance=   False
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinHeight       =   400
   MinWidth        =   600
   Style           =   "368787455"
   TabOrder        =   0
   Title           =   "GSE-Mart Sellers Site"
   Top             =   0
   VerticalCenter  =   0
   Visible         =   True
   Width           =   786
   ZIndex          =   1
   _DeclareLineRendered=   False
   _HorizontalPercent=   0.0
   _ImplicitInstance=   False
   _IsEmbedded     =   False
   _Locked         =   False
   _NeedsRendering =   True
   _OfficialControl=   False
   _OpenEventFired =   False
   _ShownEventFired=   False
   _VerticalPercent=   0.0
   Begin ccHeader conHeader
      Cursor          =   0
      Enabled         =   True
      Height          =   102
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Scope           =   0
      ScrollbarsVisible=   0
      Style           =   "0"
      TabOrder        =   0
      Top             =   0
      VerticalCenter  =   0
      Visible         =   True
      Width           =   786
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
   Begin ccWebTab conTabs
      BorderWidth     =   1
      Cursor          =   0
      Enabled         =   True
      Gap             =   5
      Height          =   42
      HelpTag         =   ""
      HorizontalCenter=   0
      Index           =   -2147483648
      Left            =   8
      LeftOffSet      =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Orientation     =   0
      Scope           =   0
      ScrollbarsVisible=   0
      Style           =   "0"
      TabHeight       =   33
      TabLines        =   1
      TabOrder        =   1
      TabWidth        =   60
      Top             =   114
      VerticalCenter  =   0
      Visible         =   True
      Width           =   770
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
		Sub Resized()
		  dim w As Integer
		  Dim h As Integer
		  
		  w = Me.Width
		  h = me.Height
		  
		  w = 0
		End Sub
	#tag EndEvent

	#tag Event
		Sub Shown()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: frmSeller.Open
		  ' Date          :
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    conHeader.LoadAccountSettings
		    
		    conTabs.Style = styWebTabNoTabs
		    
		    'conTabs.AddTab("Welcome", "ccWelcome", True)
		    conTabs.AddTab("My Account", "ccMyAccount", True)
		    conTabs.AddTab("Company Profile", "ccProfile", False)
		    conTabs.AddTab("Contact Details", "ccContact", False)
		    conTabs.AddTab("Adverts", "ccAdverts", False)
		    
		    If Session.User.Tenders = "Yes" Then
		      conTabs.AddTab("Tenders", "ccTenders", False)
		    End If
		    
		    'conTabs.AddTab("Upgrade", "ccUpgrade", False)
		    
		    conTabs.DrawTabs
		    
		    NavigateTo "ccMyAccount"
		    
		  Catch Err as RunTimeException
		    session.DisplayError "frmSellerHome.Open", Err
		    
		  End Try
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub NavigateTo(ScreenName As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: frmSellerHome.NavigateTo
		  ' Date          : 22/04/2014
		  ' By            : Jim Brock 
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    
		    Dim OldAndNew() As String
		    Dim NavigateYN As Boolean
		    NavigateYN = False
		    
		    'Refresh Icon State
		    If CurrentContainer <> Nil Then
		      
		      ' If the Screen name has changed then set the current page to Nil and navigate to
		      ' the new screen
		      If ScreenName <> CurrentContainer.Name Then
		        'LastContainerName = CurrentContainer.Name
		        
		        ' Do a save before navigating away from Contact or Profile tab
		        Select Case CurrentContainer.Name
		          
		        case "ccContact"
		          ccContact(CurrentContainer).Save
		          
		        case "ccProfile"
		          ccProfile(CurrentContainer).Save
		          
		        End Select
		        
		        
		        CurrentContainer.Close
		        CurrentContainer = Nil
		        NavigateYN = True
		      End If
		      
		    Else
		      
		      ' No current page so navigate to the new page
		      NavigateYN = True
		      
		    End If
		    
		    ' If Navigation is required then do it!
		    If NavigateYN = True Then
		      
		      Select Case ScreenName
		        
		      case "ccContact"
		        CurrentContainer = New ccContact
		        
		      case "ccWelcome"
		        CurrentContainer = New ccWelcome
		        
		      case "ccProfile"
		        CurrentContainer = New ccProfile
		        
		      case "ccAdverts"
		        CurrentContainer = New ccAdverts
		        
		      case "ccTenders"
		        CurrentContainer = New ccTenders
		        
		      case "ccUpgrade"
		        CurrentContainer = New ccUpgrade
		        
		      case "ccMyAccount"
		        CurrentContainer = New ccMyAccount
		        
		      End Select
		      
		      ' Set the properties of the new container
		      CurrentContainer.LockTop = True
		      CurrentContainer.LockBottom = True
		      CurrentContainer.LockLeft = True
		      CurrentContainer.LockRight = True
		      CurrentContainer.Style = styControlContainer
		      
		      ' Embed this instance into the page
		      CurrentContainer.EmbedWithin (Self, 8, 164, conTabs.Width - 4, Me.Height - 170)
		      
		      
		      
		    End If
		    
		  Catch Err as RunTimeException
		    session.DisplayError "frmSellerHome.NavigateTo", Err
		    
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentContainer As WebContainer
	#tag EndProperty


#tag EndWindowCode

#tag Events conTabs
	#tag Event
		Sub TabSelected(SelectedTab As ccWebTabItem)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: conTabs.TabSelected
		  ' Date          :
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    If Session.Loaded = True Then
		      Me.Enabled = False
		      
		      ' Navigate to the selected screen
		      NavigateTo SelectedTab.Value
		      
		      Me.Enabled = True
		    End If
		    
		    
		  Catch Err as RunTimeException
		    session.DisplayError "conTabs.TabSelected", Err
		    
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
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
		Group="ID"
		InitialValue="-2147483648 "
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
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
		Name="TabOrder"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
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
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
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
		Name="_ImplicitInstance"
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
#tag EndViewBehavior
