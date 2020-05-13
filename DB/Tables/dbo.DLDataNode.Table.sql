SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DLDataNode](
	[DataNodeId] [int] NOT NULL,
	[PhysicalPath] [nvarchar](100) NOT NULL,
	[VirtualPath] [nvarchar](100) NULL,
	[PublishYN] [bit] NOT NULL,
	[SelectionOrder] [int] NULL
) ON [PRIMARY]
GO
