SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvertGSESpecification](
	[SpecificationId] [char](5) NOT NULL,
	[SpecificationOptionId] [char](5) NOT NULL,
	[GSETypeId] [int] NOT NULL,
	[AdvertId] [int] NOT NULL,
 CONSTRAINT [PK_AdvertGSESpecification_1] PRIMARY KEY CLUSTERED 
(
	[SpecificationId] ASC,
	[SpecificationOptionId] ASC,
	[GSETypeId] ASC,
	[AdvertId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
