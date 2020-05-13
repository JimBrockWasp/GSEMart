SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertTool](
	[AdvertId] [int] NOT NULL,
	[Manufacturer] [nvarchar](100) NOT NULL,
	[ProductId] [nvarchar](100) NULL,
	[Supplier] [nvarchar](100) NULL,
	[Year] [nvarchar](200) NULL,
 CONSTRAINT [PK_AdvertTool] PRIMARY KEY CLUSTERED 
(
	[AdvertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO