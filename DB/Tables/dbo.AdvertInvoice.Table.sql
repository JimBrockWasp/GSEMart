SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertInvoice](
	[AdvertInvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[AdvertId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[CurrencyId] [nvarchar](10) NOT NULL,
	[Net] [decimal](15, 2) NULL,
	[Vat] [decimal](15, 2) NULL,
	[Amount] [decimal](15, 2) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[AdvertTransactionId] [int] NULL,
	[InvoiceStatusId] [int] NOT NULL,
	[PremiumAccountInvoiceStatusId] [int] NULL,
	[MonthCount] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_AdvertInvoice] PRIMARY KEY CLUSTERED 
(
	[AdvertInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
