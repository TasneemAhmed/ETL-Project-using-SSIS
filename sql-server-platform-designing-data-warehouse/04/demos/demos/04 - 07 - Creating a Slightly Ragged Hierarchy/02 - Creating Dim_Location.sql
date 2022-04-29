USE [HappyScoopers_DW]
GO
DROP TABLE IF EXISTS [dbo].[Dim_Location]
GO
CREATE TABLE [dbo].[Dim_Location](
	[Location Key] [int] IDENTITY(1,1) NOT NULL,
	[_Source Key] [nvarchar](200) NOT NULL,
	[Continent] [nvarchar](200) NOT NULL,
	[Region] [nvarchar](200) NOT NULL,
	[Subregion] [nvarchar](200) NOT NULL,
	[Country Code] [nvarchar](200) NULL,
	[Country] [nvarchar](200) NOT NULL,
	[Country Formal Name] [nvarchar](200) NOT NULL,
	[Country Population] [bigint] NULL,
	[Province Code] [nvarchar](200) NOT NULL,
	[Province] [nvarchar](200) NOT NULL,
	[Province Population] [bigint] NULL,
	[City] [nvarchar](200) NOT NULL,
	[City Population] [bigint] NULL,
	[Address Line 1] [nvarchar](200) NOT NULL,
	[Address Line 2] [nvarchar](200) NULL,
	[Postal Code] [nvarchar](200) NOT NULL,
	[Valid From] [datetime] NOT NULL,
	[Valid To] [datetime] NOT NULL,
	[Lineage Key] [int] NOT NULL,
 CONSTRAINT [PK_Dim_Location] PRIMARY KEY CLUSTERED ([Location Key] ASC)
) ON [PRIMARY]
GO
GO


