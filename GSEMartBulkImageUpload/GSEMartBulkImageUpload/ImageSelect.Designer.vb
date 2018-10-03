<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ImageSelect
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.folderBrowser = New System.Windows.Forms.FolderBrowserDialog
        Me.cmdSelectFolder = New System.Windows.Forms.Button
        Me.lblSelectedFolder = New System.Windows.Forms.Label
        Me.cmdInsertImages = New System.Windows.Forms.Button
        Me.picCurrent = New System.Windows.Forms.PictureBox
        Me.prgProgress = New System.Windows.Forms.ProgressBar
        Me.cmdInsertAccountImage = New System.Windows.Forms.Button
        Me.cboAccount = New System.Windows.Forms.ComboBox
        Me.PrSelAccountsBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.LiveGSEMartv8DataSet = New GSEMartBulkImageUpload.liveGSEMartv8DataSet
        Me.Label1 = New System.Windows.Forms.Label
        Me.PrSelAccountsTableAdapter = New GSEMartBulkImageUpload.liveGSEMartv8DataSetTableAdapters.prSelAccountsTableAdapter
        Me.cmdSelectImage = New System.Windows.Forms.Button
        Me.picAccountImage = New System.Windows.Forms.PictureBox
        Me.fileBrowser = New System.Windows.Forms.OpenFileDialog
        Me.lblImage = New System.Windows.Forms.Label
        CType(Me.picCurrent, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PrSelAccountsBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.LiveGSEMartv8DataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.picAccountImage, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'cmdSelectFolder
        '
        Me.cmdSelectFolder.Location = New System.Drawing.Point(59, 40)
        Me.cmdSelectFolder.Name = "cmdSelectFolder"
        Me.cmdSelectFolder.Size = New System.Drawing.Size(87, 23)
        Me.cmdSelectFolder.TabIndex = 0
        Me.cmdSelectFolder.Text = "Select Folder"
        Me.cmdSelectFolder.UseVisualStyleBackColor = True
        '
        'lblSelectedFolder
        '
        Me.lblSelectedFolder.AutoSize = True
        Me.lblSelectedFolder.Location = New System.Drawing.Point(166, 45)
        Me.lblSelectedFolder.Name = "lblSelectedFolder"
        Me.lblSelectedFolder.Size = New System.Drawing.Size(110, 13)
        Me.lblSelectedFolder.TabIndex = 1
        Me.lblSelectedFolder.Text = "<No Folder Selected>"
        '
        'cmdInsertImages
        '
        Me.cmdInsertImages.Location = New System.Drawing.Point(59, 79)
        Me.cmdInsertImages.Name = "cmdInsertImages"
        Me.cmdInsertImages.Size = New System.Drawing.Size(87, 23)
        Me.cmdInsertImages.TabIndex = 2
        Me.cmdInsertImages.Text = "Insert Images"
        Me.cmdInsertImages.UseVisualStyleBackColor = True
        '
        'picCurrent
        '
        Me.picCurrent.Location = New System.Drawing.Point(61, 135)
        Me.picCurrent.Name = "picCurrent"
        Me.picCurrent.Size = New System.Drawing.Size(266, 169)
        Me.picCurrent.TabIndex = 3
        Me.picCurrent.TabStop = False
        '
        'prgProgress
        '
        Me.prgProgress.Location = New System.Drawing.Point(61, 108)
        Me.prgProgress.Name = "prgProgress"
        Me.prgProgress.Size = New System.Drawing.Size(266, 21)
        Me.prgProgress.TabIndex = 4
        '
        'cmdInsertAccountImage
        '
        Me.cmdInsertAccountImage.Location = New System.Drawing.Point(360, 320)
        Me.cmdInsertAccountImage.Name = "cmdInsertAccountImage"
        Me.cmdInsertAccountImage.Size = New System.Drawing.Size(128, 23)
        Me.cmdInsertAccountImage.TabIndex = 5
        Me.cmdInsertAccountImage.Text = "Insert Account Image"
        Me.cmdInsertAccountImage.UseVisualStyleBackColor = True
        '
        'cboAccount
        '
        Me.cboAccount.DataSource = Me.PrSelAccountsBindingSource
        Me.cboAccount.DisplayMember = "CompanyName"
        Me.cboAccount.FormattingEnabled = True
        Me.cboAccount.Location = New System.Drawing.Point(483, 42)
        Me.cboAccount.Name = "cboAccount"
        Me.cboAccount.Size = New System.Drawing.Size(219, 21)
        Me.cboAccount.TabIndex = 6
        Me.cboAccount.ValueMember = "AccountId"
        '
        'PrSelAccountsBindingSource
        '
        Me.PrSelAccountsBindingSource.DataMember = "prSelAccounts"
        Me.PrSelAccountsBindingSource.DataSource = Me.LiveGSEMartv8DataSet
        '
        'LiveGSEMartv8DataSet
        '
        Me.LiveGSEMartv8DataSet.DataSetName = "liveGSEMartv8DataSet"
        Me.LiveGSEMartv8DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(357, 45)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(80, 13)
        Me.Label1.TabIndex = 7
        Me.Label1.Text = "Select Account"
        '
        'PrSelAccountsTableAdapter
        '
        Me.PrSelAccountsTableAdapter.ClearBeforeFill = True
        '
        'cmdSelectImage
        '
        Me.cmdSelectImage.Location = New System.Drawing.Point(360, 77)
        Me.cmdSelectImage.Name = "cmdSelectImage"
        Me.cmdSelectImage.Size = New System.Drawing.Size(87, 23)
        Me.cmdSelectImage.TabIndex = 8
        Me.cmdSelectImage.Text = "Select Image"
        Me.cmdSelectImage.UseVisualStyleBackColor = True
        '
        'picAccountImage
        '
        Me.picAccountImage.Location = New System.Drawing.Point(360, 135)
        Me.picAccountImage.Name = "picAccountImage"
        Me.picAccountImage.Size = New System.Drawing.Size(342, 169)
        Me.picAccountImage.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom
        Me.picAccountImage.TabIndex = 9
        Me.picAccountImage.TabStop = False
        '
        'lblImage
        '
        Me.lblImage.AutoSize = True
        Me.lblImage.Location = New System.Drawing.Point(483, 79)
        Me.lblImage.Name = "lblImage"
        Me.lblImage.Size = New System.Drawing.Size(105, 13)
        Me.lblImage.TabIndex = 10
        Me.lblImage.Text = "<no image selected>"
        '
        'ImageSelect
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(776, 426)
        Me.Controls.Add(Me.lblImage)
        Me.Controls.Add(Me.picAccountImage)
        Me.Controls.Add(Me.cmdSelectImage)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.cboAccount)
        Me.Controls.Add(Me.cmdInsertAccountImage)
        Me.Controls.Add(Me.prgProgress)
        Me.Controls.Add(Me.picCurrent)
        Me.Controls.Add(Me.cmdInsertImages)
        Me.Controls.Add(Me.lblSelectedFolder)
        Me.Controls.Add(Me.cmdSelectFolder)
        Me.Name = "ImageSelect"
        Me.Text = "GSE-Mart Bulk Image Uploader"
        CType(Me.picCurrent, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PrSelAccountsBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.LiveGSEMartv8DataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.picAccountImage, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents folderBrowser As System.Windows.Forms.FolderBrowserDialog
    Friend WithEvents cmdSelectFolder As System.Windows.Forms.Button
    Friend WithEvents lblSelectedFolder As System.Windows.Forms.Label
    Friend WithEvents cmdInsertImages As System.Windows.Forms.Button
    Friend WithEvents picCurrent As System.Windows.Forms.PictureBox
    Friend WithEvents prgProgress As System.Windows.Forms.ProgressBar
    Friend WithEvents cmdInsertAccountImage As System.Windows.Forms.Button
    Friend WithEvents cboAccount As System.Windows.Forms.ComboBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents LiveGSEMartv8DataSet As GSEMartBulkImageUpload.liveGSEMartv8DataSet
    Friend WithEvents PrSelAccountsBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents PrSelAccountsTableAdapter As GSEMartBulkImageUpload.liveGSEMartv8DataSetTableAdapters.prSelAccountsTableAdapter
    Friend WithEvents cmdSelectImage As System.Windows.Forms.Button
    Friend WithEvents picAccountImage As System.Windows.Forms.PictureBox
    Friend WithEvents fileBrowser As System.Windows.Forms.OpenFileDialog
    Friend WithEvents lblImage As System.Windows.Forms.Label

End Class
