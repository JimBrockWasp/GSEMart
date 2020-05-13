SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremiumAccountInvoiceStatus](
	[PremiumAccountInvoiceStatusId] [int] NOT NULL,
	[PremiumAccountInvoiceStatusDesc] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_PremiumAccountInvoiceStatus] PRIMARY KEY CLUSTERED 
(
	[PremiumAccountInvoiceStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
