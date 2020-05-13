SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advert](
	[AdvertId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ShortDescription] [nvarchar](255) NOT NULL,
	[LongDescription] [nvarchar](4000) NOT NULL,
	[CategoryId] [char](2) NOT NULL,
	[AdvertStatusId] [char](2) NOT NULL,
	[CountryId] [char](3) NOT NULL,
	[Location] [nvarchar](100) NOT NULL,
	[ShowPriceYN] [bit] NOT NULL,
	[CurrencyId] [nvarchar](10) NULL,
	[Price] [money] NULL,
	[Age] [int] NULL,
	[ContactName] [nvarchar](100) NOT NULL,
	[Telephone] [nvarchar](100) NOT NULL,
	[Fax] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[URL] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[ExpiryDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[AgreedTCYN] [bit] NOT NULL,
	[Owner] [nvarchar](100) NULL,
	[Quantity] [int] NOT NULL,
	[FullText] [text] NULL,
	[Counter] [int] NOT NULL,
	[UserAccountTypeID] [int] NOT NULL,
	[URLClickThrough] [int] NOT NULL,
	[GUID] [varchar](100) NULL,
	[NewYN] [bit] NOT NULL,
 CONSTRAINT [PK_Advert] PRIMARY KEY CLUSTERED 
(
	[AdvertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Advert] ADD  CONSTRAINT [DF_Advert_Counter]  DEFAULT ((0)) FOR [Counter]
GO
