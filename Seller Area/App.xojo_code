#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Sub Open(args() as String)
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: App.Open
		  ' By            : Jim Brock
		  ' Notes
		  '
		  ' ----------------------------------------------------------------------
		  StartScreen
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub StartScreen()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: App.StartScreen
		  ' Date          :2016-09-09
		  ' By            : Metodija Angjelkoski
		  ' ----------------------------------------------------------------------
		  
		  Dim AppStarted As New Date
		  
		  ' Start information
		  Dim S As String = AppStarted.ShortDate + " " + AppStarted.LongTime
		  
		  ' Version information
		  Dim V As String 
		  V = Format(App.MajorVersion, "00")
		  V = V + "."
		  V = V + Format(App.MinorVersion, "00")
		  V = V + "."
		  V = V + Format(App.BugVersion, "00")
		  V = V + "."
		  V = V + Format(App.NonReleaseVersion, "00")
		  
		  ' Port Number
		  Dim PortNumber As String
		  PortNumber = CStr(App.Port)
		  
		  ' look/feel
		  Print "****************************************" 
		  Print "*   Application: GSEMart Seller Area   *"
		  Print "*   Version:     " + V + "           *"
		  Print "*   Started:     " + S + "   *"
		  Print "*   Port   :     " + PortNumber + "                  *"
		  Print "****************************************" 
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
