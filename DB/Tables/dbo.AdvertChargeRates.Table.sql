SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertChargeRates](
	[ChargeRateId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[MonthCount] [tinyint] NOT NULL,
	[CategoryId] [char](2) NOT NULL,
	[CurrencyId] [nvarchar](10) NOT NULL,
	[Rate] [money] NOT NULL,
	[FreeYN] [bit] NOT NULL,
	[UntilYouBuyYN] [bit] NOT NULL,
 CONSTRAINT [PK_AdvertChargeRates] PRIMARY KEY CLUSTERED 
(
	[ChargeRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
