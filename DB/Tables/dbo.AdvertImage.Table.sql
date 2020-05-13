SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertImage](
	[AdvertImageId] [int] IDENTITY(1,1) NOT NULL,
	[AdvertId] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Image] [image] NOT NULL,
	[ContentType] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsDefaultYN] [bit] NOT NULL,
	[InUseYN] [bit] NOT NULL,
 CONSTRAINT [PK_AdvertImages] PRIMARY KEY CLUSTERED 
(
	[AdvertImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
