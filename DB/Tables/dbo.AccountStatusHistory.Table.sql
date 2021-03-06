SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountStatusHistory](
	[AccountId] [int] NOT NULL,
	[HistoryDate] [datetime] NOT NULL,
	[AccountStatusId] [char](2) NOT NULL,
 CONSTRAINT [PK_AccountStatusHistory] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[HistoryDate] ASC,
	[AccountStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
