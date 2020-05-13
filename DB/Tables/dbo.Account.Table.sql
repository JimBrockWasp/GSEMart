SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[CompanyName] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NOT NULL,
	[CountryId] [char](3) NOT NULL,
	[Telephone] [nvarchar](100) NOT NULL,
	[Fax] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[AccountStatusId] [char](2) NOT NULL,
	[SalesCode] [nvarchar](10) NULL,
	[VATNumber] [nvarchar](50) NULL,
	[VATNumberStatusId] [char](2) NOT NULL,
	[Discount] [tinyint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[AgreedTCYN] [bit] NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[PostCode] [nvarchar](20) NULL,
	[City] [nvarchar](200) NULL,
	[StateId] [char](2) NULL,
	[TenderYN] [tinyint] NULL,
	[ASAMemberYN] [bit] NULL,
	[Profile] [nvarchar](2000) NULL,
	[CompanyWebsite] [nvarchar](60) NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[County] [nvarchar](50) NULL,
	[MaxAdverts] [int] NULL,
	[NewYN] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_ASAMemberYN]  DEFAULT ((0)) FOR [ASAMemberYN]
GO
