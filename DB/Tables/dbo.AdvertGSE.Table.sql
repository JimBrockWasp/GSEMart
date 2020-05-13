SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertGSE](
	[AdvertId] [int] NOT NULL,
	[Manufacturer] [nvarchar](200) NOT NULL,
	[DateofRegistration] [datetime] NULL,
	[Year] [nvarchar](200) NULL,
	[GSETypeId] [int] NULL,
	[AdvertAvailabilityId] [char](3) NOT NULL,
	[ForSaleYN] [bit] NOT NULL,
	[ForRentYN] [bit] NOT NULL,
	[ForLeaseYN] [bit] NOT NULL,
 CONSTRAINT [PK_AdvertGSE] PRIMARY KEY CLUSTERED 
(
	[AdvertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
