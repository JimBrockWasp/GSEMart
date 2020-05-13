SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuantityUnit](
	[GSETypeId] [int] NOT NULL,
	[QuantityUnitId] [char](5) NOT NULL,
	[QuantityId] [char](5) NOT NULL,
	[ShortDescription] [nvarchar](10) NOT NULL,
	[LongDescription] [nvarchar](50) NOT NULL,
	[MetricYN] [bit] NOT NULL,
	[MetricConversionRatio] [float] NOT NULL,
 CONSTRAINT [PK_QuantityUnit_1] PRIMARY KEY CLUSTERED 
(
	[GSETypeId] ASC,
	[QuantityUnitId] ASC,
	[QuantityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
