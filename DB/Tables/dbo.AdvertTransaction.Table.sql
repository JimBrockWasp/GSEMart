SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertTransaction](
	[AdvertTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[VendorTransactionCode] [nvarchar](100) NOT NULL,
	[AdvertId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[ChargeRateId] [int] NULL,
	[CreditCardNumber] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[CurrencyId] [nvarchar](10) NOT NULL,
	[AmountSubmit] [decimal](15, 2) NOT NULL,
	[AmountPaid] [decimal](15, 2) NOT NULL,
	[CustomerEmailAddress] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[StatusCode] [int] NOT NULL,
	[TransactionCode] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_AdvertTransaction] PRIMARY KEY CLUSTERED 
(
	[AdvertTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
