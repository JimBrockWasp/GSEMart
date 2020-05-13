SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSettings](
	[SettingId] [int] NOT NULL,
	[Pagesize] [tinyint] NOT NULL,
	[DateFormat] [varchar](50) NOT NULL,
	[DateTimeFormat] [varchar](50) NOT NULL,
	[ExceptionMsg] [varchar](500) NOT NULL,
	[TimeZoneDiff] [int] NOT NULL,
	[CreatedBy] [varchar](25) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedBy] [varchar](25) NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
