SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification](
	[GSETypeId] [int] NOT NULL,
	[SpecificationId] [char](5) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Sequence] [int] NULL,
	[ShortDescription] [nvarchar](15) NULL,
 CONSTRAINT [PK_Specification_1] PRIMARY KEY CLUSTERED 
(
	[GSETypeId] ASC,
	[SpecificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
