USE [HappyScoopers_DW]
GO

-- Empty the tables, for testing the load
TRUNCATE TABLE [dbo].[Staging_Product]
TRUNCATE TABLE [dbo].[Staging_Location]
TRUNCATE TABLE [dbo].[Dim_Product]
TRUNCATE TABLE [dbo].[Dim_Locatiom]


-- Check the changes from the auxiliary tables
SELECT * FROM [int].[Lineage] ORDER BY [StartLoad] DESC
SELECT * FROM [int].[IncrementalLoads]


-- Look inside the tables, to make sure they were loaded
SELECT * FROM [dbo].[Staging_Product]
SELECT * FROM [dbo].[Staging_Location]

SELECT * FROM [dbo].[Dim_Product]
SELECT * FROM [dbo].[Dim_Location]






