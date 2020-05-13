SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificationOption](
	[SpecificationId] [char](5) NOT NULL,
	[SpecificationOptionId] [char](5) NOT NULL,
	[GSETypeId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ShortDescription] [nvarchar](15) NULL,
 CONSTRAINT [PK_SpecificationOption_1] PRIMARY KEY CLUSTERED 
(
	[SpecificationId] ASC,
	[SpecificationOptionId] ASC,
	[GSETypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
