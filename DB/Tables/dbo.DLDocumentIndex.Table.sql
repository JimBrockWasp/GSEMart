SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DLDocumentIndex](
	[DataNodeId] [int] NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ObjectId] [int] NOT NULL,
	[IndexId] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [nvarchar](10) NULL
) ON [PRIMARY]
GO
