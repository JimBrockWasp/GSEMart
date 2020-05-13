SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tender](
	[TenderId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[ContactName] [nvarchar](100) NOT NULL,
	[Telephone] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
	[CreatedDate] [date] NOT NULL,
	[ExpiryDate] [date] NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[URL] [nvarchar](200) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Tender] PRIMARY KEY CLUSTERED 
(
	[TenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
