#tag Window
Begin Window frmTenderEmail
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   473
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Wasp Software"
   Visible         =   True
   Width           =   845
   Begin ListBoxEx lstTenderAccounts
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      Cellpadding     =   2
      ColumnCount     =   8
      ColumnsResizable=   False
      ColumnWidths    =   "40, 170,80,200,100,80,80,50"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   365
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Id	Company	Contact	Email	Expiry	Type	Status	Tender"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MinimumRowHeight=   24
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   28
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   805
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton cmdEmail
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Send Emails"
      Default         =   False
      Enabled         =   True
      Height          =   30
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   363
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   437
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin ProgressBar prgEmails
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   405
      Transparent     =   True
      Value           =   50
      Visible         =   False
      Width           =   805
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: frmFileMonitor.Open
		  ' Date          : 2014-08-25
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    LoadTenderAccounts
		    
		    
		    
		  Catch Err as RunTimeException
		    
		    app.DisplayError "frmFileMonitor.Open", Err
		    
		  End Try
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadTenderAccounts()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: LoadTenderAccounts
		  ' Date          : 2015-03-06
		  ' By            : Jim Brock
		  ' Notes
		  ' Load in a list of accounts that subscribe to tenders
		  ' ----------------------------------------------------------------------
		  Try
		    
		    ' Connect to the database
		    Dim db As New MSSQLServerDatabaseEx
		    Dim sp As New SQLStoredProcedure(db, "slGetTenderAccounts")
		    Dim rs As RecordSet
		    
		    rs = sp.ExecuteRecordSet
		    
		    lstTenderAccounts.PopulateList(rs)
		    
		    rs.Close
		    
		    ' Disconnect
		    db.Close
		    
		  Catch Err as RunTimeException
		    app.DisplayError "routinename", Err
		    
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendEmail(Contact As String, EmailAddress As String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: SendNewEmail
		  ' By            : Jim Brock
		  ' Notes
		  ' 
		  ' ----------------------------------------------------------------------
		  
		  
		  Dim Message As New EmailMessage
		  Dim HTML() As String
		  Dim d As New Date
		  
		  Try
		    
		    HTML.Append("<span style='font-family:tahoma; font-size:11pt;'>")
		    HTML.Append("Dear " + Contact)
		    HTML.Append(EMAILBODY)
		    HTML.Append("</span>")
		    HTML.Append(DISCLAIMER)
		    
		    Message.FromAddress = app.ConfigurationItems.Item.Value("SenderEmailAddress")
		    Message.AddRecipient(EmailAddress)
		    Message.Subject     = "New Tender at GSE-Mart.aero : " + d.SQLDate
		    Message.BodyHTML    = Join (HTML, "")
		    
		    app.SMTP.MailSocket.Messages.Append(Message)
		    app.SMTP.MailSocket.SendMail
		    
		  Catch Err as RunTimeException
		    
		    ' Ignore any errors in this routine
		    app.DisplayError "frmTenderEmail.SendEmail", Err
		    
		  End Try
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Errors As Integer = 0
	#tag EndProperty


	#tag Constant, Name = DISCLAIMER, Type = String, Dynamic = False, Default = \"<span style\x3D\'font-size:8pt; color: gray\'>\rDisclaimer: This message is intended only for the individual or entity to which it is addressed \x2C and may contain information that is privileged\x2C confidential and exempt from disclosure under applicable law. If the reader of this message is not the intended recipient\x2C or the employee or agent responsible  for delivering the message to the intended recipient\x2C you are hereby notified that any dissemination\x2C distribution\x2C or copying of this communication is strictly prohibited. If you have received thsi communication in error\x2C please delete it and notify the sender immediately. Thank you.</span>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = EMAILBODY, Type = String, Dynamic = False, Default = \"<br>\r<br>\rYou are receiving this email because you subscribe to the Tenders Service at GSE-Mart.aero\r<br>\r<br>\rA new tender has been uploaded and you can view this tender from the GSE-Mart.aero sellers area by logging in here:\r<br>\r<br>\r<a href\x3D\'http://www.gse-mart.aero:8080\'>www.gse-mart.aero:8080</a>\r<br>\r<br>\rIf you can\'t remember your login details\x2C please let me know and I will send you a reminder\r<br>\r<br>\rIf you reply to this tender\x2C please mention that you saw it on GSE-Mart.aero\r<br>\r<br>\rThank you\r<br>\r<br>\r<b>Jim Brock</b>\r<br>\rUK Representative\r<br>\rE-Mail:<a href\x3D \'mailto: jim.brock@gse-mart.aero\'>jim.brock@gse-mart.aero</a>\r<br>\rGSE-Mart.aero\r<br>\rP.O. Box 390920\r<br>\rDubai\x2C United Arab Emirates\r<br>\r<br>\r<a href\x3D\'http://www.gse-mart.aero\'>www.gse-mart.aero</a>\r<br>\r<br>", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events cmdEmail
	#tag Event
		Sub Action()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name:
		  ' Date          :
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  Try
		    
		    
		    Dim Accounts As Integer
		    Dim Account As Integer
		    Dim EmailAddress As String
		    Dim Contact As String
		    
		    Accounts = lstTenderAccounts.ListCount
		    
		    prgEmails.Visible = True
		    prgEmails.Maximum = Accounts
		    
		    For Account = 0 to Accounts - 1
		      
		      EmailAddress = lstTenderAccounts.Cell(Account, 3)
		      Contact = lstTenderAccounts.Cell(Account, 2)
		      
		      If EmailAddress<> "" Then
		        SendEmail (Contact, EmailAddress)
		        lstTenderAccounts.Cell(Account, 0) = "Sent"
		      End If
		      
		      prgEmails.Value = Account + 1
		      
		    Next
		    
		    MsgBox ("Complete")
		    prgEmails.Visible = False
		    
		    
		    
		  Catch Err as RunTimeException
		    app.DisplayError "routinename", Err
		    
		  End Try
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Errors"
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
