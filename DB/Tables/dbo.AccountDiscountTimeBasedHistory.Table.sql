SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDiscountTimeBasedHistory](
	[AccountDiscountTimeBasedHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[AccountDiscountTimeBasedId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[DiscountRate] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ArchiveDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AccountDiscountTimeBasedHistory] PRIMARY KEY CLUSTERED 
(
	[AccountDiscountTimeBasedHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
