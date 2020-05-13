SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountRate](
	[DiscountRateId] [int] NOT NULL,
	[DiscountRateName] [nvarchar](100) NOT NULL,
	[DiscountRate] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DiscountRate] PRIMARY KEY CLUSTERED 
(
	[DiscountRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
