#tag Class
Protected Class WebHTMLViewerEx
Inherits WebHTMLViewer
	#tag Method, Flags = &h0
		Sub ClearImage()
		  Dim HTML As String
		  HTML = "<HTML><HEAD></HEAD><BODY style='margin:0px;'></BODY></HTML>"
		  Me.LoadPage(HTML)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPicture()
		  ' ----------------------------------------------------------------------
		  ' Procedure Name: WebHTMLViewerEx.ShowPicture
		  ' By            : Jim Brock
		  ' Notes
		  ' Create the HTML Necessary to Display the picture.
		  ' ----------------------------------------------------------------------
		  
		  Dim HTML As String
		  Dim Scale As Single = 1
		  Dim Style As String
		  
		  ' Check a picture has been specified
		  If Picture is Nil then
		    Raise New RuntimeExceptionEx(1, "No Current Picture")
		  End If
		  
		  ' Calculate the size of the picture on the screen
		  Scale = Me.Height / Picture.Height
		  
		  If Scale * Picture.Width > Me.Width Then
		    Scale = Me.Width /Picture.Width
		  End If
		  
		  Style = "width:" + CStr(CType((Picture.Width * Scale), Integer) - 1) + "px;"
		  Style = Style + "height:" + CStr(CType((Picture.height * Scale), Integer) - 1) + "px;"
		  
		  HTML = "<HTML><HEAD></HEAD><BODY style='margin:0px;'><IMG style='"+ Style + "' src = 'data:image/png;base64,"
		  HTML = HTML + EncodeBase64(Picture.GetData(Picture.FormatPNG)) + "' /></BODY></HTML>"
		  
		  Me.LoadPage(HTML)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Picture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		PNGData As String
	#tag EndProperty


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
			Name="URL"
			Visible=true
			Group="Behavior"
			InitialValue="http://www.example.com/"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="_VerticalPercent"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Picture"
			Group="Behavior"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PNGData"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
