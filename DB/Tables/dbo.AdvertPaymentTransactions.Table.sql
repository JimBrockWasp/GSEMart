SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertPaymentTransactions](
	[TransactionId] [int] NOT NULL,
	[AdvertId] [int] NOT NULL,
	[TransactionDateTime] [datetime] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[LCNet] [money] NOT NULL,
	[LCTax] [money] NOT NULL,
	[LCGross] [money] NOT NULL,
	[LocalCurrencyId] [nvarchar](10) NOT NULL,
	[GBPNet] [money] NOT NULL,
	[GBPTax] [money] NOT NULL,
	[GBPGross] [money] NOT NULL
) ON [PRIMARY]
GO
