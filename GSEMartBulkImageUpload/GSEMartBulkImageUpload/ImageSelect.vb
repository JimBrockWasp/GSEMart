' Namespaces in Use
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class ImageSelect

    Private SelectedFolder As String
    Private SelectedFile As String

    ' SQL Objects
    Private mConnection As SqlConnection
    Private mCmd As SqlCommand
    Private mCmdAccountImage As SqlCommand
    Private lRecord As SqlDataReader
    Private mSQLConnected As Boolean = False

    ' Sage Connection Variables
    Private mDataPath As String
    Private mUserName As String
    Private mPassword As String


    Private Sub ImageSelect_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'LiveGSEMartv8DataSet.prSelAccounts' table. You can move, or remove it, as needed.
        Me.PrSelAccountsTableAdapter.Fill(Me.LiveGSEMartv8DataSet.prSelAccounts)

        ' Set the default values
        SelectedFolder = ""
        SelectedFile = ""





    End Sub

    Private Sub cmdInsertImages_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdInsertImages.Click


        ' Check that a folder has been selected
        If SelectedFolder <> "" Then

            ' make a reference to a directory
            Dim SelectedFolderInfo As New IO.DirectoryInfo(SelectedFolder)
            Dim SelectedFolderFileList As IO.FileInfo() = SelectedFolderInfo.GetFiles()
            Dim CurrentFileInfo As IO.FileInfo


            Try


                ' Connect to the SQL Database
                ConnectToSQL()

                ' Get the number of elements for the progress bar
                prgProgress.Maximum = SelectedFolderFileList.Length

                'list the names of all files in the specified directory
                For Each CurrentFileInfo In SelectedFolderFileList

                    ' Increment the progress bar
                    prgProgress.Increment(1)


                    Try

                        ' Check that the image is a valid image
                        picCurrent.Load(CurrentFileInfo.FullName)
                        picCurrent.SizeMode = PictureBoxSizeMode.StretchImage

                    Catch ex As Exception

                        MsgBox("Invalid Image File : " & CurrentFileInfo.Name)

                    End Try

                    ' Load this image into the database
                    AddImage(CurrentFileInfo)

                Next


            Catch ex As Exception

                MsgBox(ex.Message)

            Finally

                ' If SQL is connected then close the connection
                If mSQLConnected Then

                    ' Close the SQL Connection
                    mConnection.Close()

                End If

            End Try


            ' Complete
            MsgBox("Complete!")


        Else
            MsgBox("No Folder Selected")

        End If


    End Sub

    Private Sub cmdSelectFolder_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSelectFolder.Click

        Dim result As System.Windows.Forms.DialogResult


        ' Show the Folder Select dialog box
        result = folderBrowser.ShowDialog()

        ' If OK selected then set the selected folder
        If result = Windows.Forms.DialogResult.OK Then

            ' Get the selected path
            SelectedFolder = folderBrowser.SelectedPath

            ' Update the label
            lblSelectedFolder.Text = SelectedFolder

        End If


    End Sub


    Private Sub AddImage(ByVal ThisFile As IO.FileInfo)

        Dim AdvertId As String
        Dim Description As String
        Dim DefaultYN As Boolean
        Dim NewName As String
        Dim ContentType As String


        Try

            ' Get the image file name including the extension
            AdvertId = ThisFile.Name

            ' Check whether the filename contains an underscore
            If AdvertId.IndexOf("_") > 0 Then

                ' Get the advert description as the whole filename
                Description = Mid(AdvertId, 1, AdvertId.IndexOf("."))

                ' Get the advertId as the name up to the underscore
                AdvertId = Mid(AdvertId, 1, AdvertId.IndexOf("_"))

                ' This is an extra image so not the default image
                DefaultYN = False

            Else

                ' Get the advert description as the whole filename up to the .
                Description = Mid(AdvertId, 1, AdvertId.IndexOf("."))

                ' Get the advertId as the name up to the .
                AdvertId = Mid(AdvertId, 1, AdvertId.IndexOf("."))

                ' This is the first image so make it the default one
                DefaultYN = True


            End If

            ' Check that the advertId is a number
            If Val(AdvertId) = 0 Then
                Throw New Exception("Invalid Filename: " & ThisFile.Name)
            End If

            ' Build a content type description
            ContentType = "image/" & ThisFile.Extension


            '' Size the Byte Array
            Dim Image(ThisFile.Length) As Byte

            '' Get a stream to read the image file.
            Dim fileStream As New System.IO.FileStream(ThisFile.FullName, IO.FileMode.Open)


            '' Load the image into the byte array
            fileStream.Read(Image, 0, ThisFile.Length)

            ' Close the stream
            fileStream.Close()

            ' Set the Size of the image parameter
            mCmd.Parameters("@Image").Size = Image.Length

            ' Set the parameter values
            mCmd.Parameters("@AdvertId").Value = CInt(AdvertId)
            mCmd.Parameters("@Description").Value = Description
            mCmd.Parameters("@Image").Value = Image
            mCmd.Parameters("@ContentType").Value = ContentType
            mCmd.Parameters("@InUseYN").Value = True
            mCmd.Parameters("@IsDefaultYN").Value = DefaultYN


            
            ' Execute the stored procedure
            mCmd.ExecuteNonQuery()



            ' rename the file
            '
            ' Generate the new filename
            NewName = ThisFile.DirectoryName & "\" & Description & ".bak"

            ' Rename the file
            Rename(ThisFile.FullName, NewName)



        Catch ex As Exception

            MsgBox(ex.Message)

        End Try




    End Sub

    ' -----------------------------------------------------------
    ' Name: ConnectToSQL
    ' Date: 17/02/2012
    ' By  : Jim Brock
    ' Notes
    ' Open a connection to the SQL database 
    ' ------------------------------------------------------------
    Private Sub ConnectToSQL()

        Dim lsConnectionString As String

        ' Load the connection string from the configuration file
        lsConnectionString = ConfigurationManager.AppSettings("GSEMARTDB")

        ' Connect to the database
        mConnection = New SqlConnection(lsConnectionString)

        ' Open the connection
        mConnection.Open()

        '' Accessing DB Layer
        mCmd = New SqlCommand("prInsAdvertImage", mConnection)
        mCmd.CommandType = CommandType.StoredProcedure

        ' Create the parameters
        mCmd.Parameters.Add(New SqlParameter("@AdvertId", SqlDbType.Int, 4))
        mCmd.Parameters.Add(New SqlParameter("@Description", SqlDbType.NVarChar, 100))
        mCmd.Parameters.Add(New SqlParameter("@Image", SqlDbType.Binary, 1))
        mCmd.Parameters.Add(New SqlParameter("@ContentType", SqlDbType.VarChar, 50))
        mCmd.Parameters.Add(New SqlParameter("@InUseYN", SqlDbType.Bit, 1))
        mCmd.Parameters.Add(New SqlParameter("@IsDefaultYN", SqlDbType.Bit, 1))

        mCmd.Parameters.Add(New SqlParameter("@AdvertImageId", SqlDbType.Int, 2, ParameterDirection.Output))
        mCmd.Parameters.Add(New SqlParameter("@RespCode", SqlDbType.Int, 2, ParameterDirection.Output))
        mCmd.Parameters.Add(New SqlParameter("@RespMsg", SqlDbType.VarChar, 500, ParameterDirection.Output))

        mCmd.Parameters("@AdvertImageId").Value = DBNull.Value
        mCmd.Parameters("@RespCode").Value = DBNull.Value
        mCmd.Parameters("@RespMsg").Value = DBNull.Value

        mCmd.Parameters("@AdvertImageId").Direction = ParameterDirection.Output
        mCmd.Parameters("@RespCode").Direction = ParameterDirection.Output
        mCmd.Parameters("@RespMsg").Direction = ParameterDirection.Output


        mCmd.UpdatedRowSource = UpdateRowSource.OutputParameters



        '' Account Image command object
        mCmdAccountImage = New SqlCommand("prInsAccountImage", mConnection)
        mCmdAccountImage.CommandType = CommandType.StoredProcedure

        ' Create the parameters
        mCmdAccountImage.Parameters.Add(New SqlParameter("@AccountId", SqlDbType.Int, 4))
        mCmdAccountImage.Parameters.Add(New SqlParameter("@Image", SqlDbType.Binary, 1))

        mCmdAccountImage.Parameters.Add(New SqlParameter("@RespCode", SqlDbType.Int, 2, ParameterDirection.Output))
        mCmdAccountImage.Parameters.Add(New SqlParameter("@RespMsg", SqlDbType.VarChar, 500, ParameterDirection.Output))

        mCmdAccountImage.Parameters("@AccountId").Value = DBNull.Value
        mCmdAccountImage.Parameters("@RespCode").Value = DBNull.Value
        mCmdAccountImage.Parameters("@RespMsg").Value = DBNull.Value

        mCmdAccountImage.Parameters("@RespCode").Direction = ParameterDirection.Output
        mCmdAccountImage.Parameters("@RespMsg").Direction = ParameterDirection.Output

        mCmdAccountImage.UpdatedRowSource = UpdateRowSource.OutputParameters




        '//Adding Output parameters
        'db.AddOutParameter(dbCommand, "AdvertImageID", DbType.Int32, 25);
        'db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
        'db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);



        ' Set the SQL connected string
        mSQLConnected = True


    End Sub



    ' -----------------------------------------------------------
    ' Name: cmdSelectImage_Click
    ' Date: 19/09/2013
    ' By  : Jim Brock
    ' Notes
    ' Select and open the account image file
    ' ------------------------------------------------------------
    Private Sub cmdSelectImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdSelectImage.Click

        Dim result As System.Windows.Forms.DialogResult


        ' Show the Folder Select dialog box
        result = fileBrowser.ShowDialog()

        ' If OK selected then set the selected folder
        If result = Windows.Forms.DialogResult.OK Then

            ' Get the selected path
            SelectedFile = fileBrowser.FileName

            Try

                ' Check that the image is a valid image
                picCurrent.SizeMode = PictureBoxSizeMode.Zoom
                picAccountImage.Load(SelectedFile)
                lblImage.Text = SelectedFile




            Catch ex As Exception

                MsgBox("Invalid Image File : " & SelectedFile)
                SelectedFile = ""
                lblImage.Text = "<no image selected>"

            End Try


        End If



    End Sub


    ' -----------------------------------------------------------
    ' Name: cmdInsertAccountImage_Click
    ' Date: 19/09/2013
    ' By  : Jim Brock
    ' Notes
    ' Insert the selected image to the account
    ' -----------------------------------------------------------
    Private Sub cmdInsertAccountImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cmdInsertAccountImage.Click

        Dim AccountId As String

        Try


            ' Connect to the SQL Database
            ConnectToSQL()

            ' Get the image file name including the extension
            AccountId = cboAccount.SelectedValue


            ' Check that the AccountId is a number
            If Val(AccountId) = 0 Then
                Throw New Exception("No Account Selected: " & cboAccount.SelectedText)
            End If

            ' Check that a file has been selected
            If SelectedFile = "" Then
                Throw New Exception("No File Selected")
            End If



            '' Get a stream to read the image file.
            Dim fileStream As System.IO.FileStream


            '' Open the file
            fileStream = fileBrowser.OpenFile()

            '' Size the Byte Array
            Dim Image(fileStream.Length) As Byte


            '' Load the image into the byte array
            fileStream.Read(Image, 0, fileStream.Length)

            ' Close the stream
            fileStream.Close()

            ' Set the Size of the image parameter
            mCmdAccountImage.Parameters("@Image").Size = Image.Length

            ' Set the parameter values
            mCmdAccountImage.Parameters("@AccountId").Value = CInt(AccountId)
            mCmdAccountImage.Parameters("@Image").Value = Image



            ' Execute the stored procedure
            mCmdAccountImage.ExecuteNonQuery()

            '' Show Success Message
            MsgBox("Image Inserted!")



        Catch ex As Exception

            MsgBox(ex.Message)


        Finally

            ' If SQL is connected then close the connection
            If mSQLConnected Then

                ' Close the SQL Connection
                mConnection.Close()

            End If

        End Try

    End Sub


End Class
