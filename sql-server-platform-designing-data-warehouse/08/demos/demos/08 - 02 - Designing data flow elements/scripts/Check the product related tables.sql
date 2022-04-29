USE [HappyScoopers_DW]
GO

-- Before Dim_Product is loaded, we first populate the staging table
SELECT * FROM [dbo].[Staging_Product]


-- Empty the tables, for testing the load
TRUNCATE TABLE [dbo].[Staging_Product]
TRUNCATE TABLE [dbo].[Dim_Product]

-- Look inside the tables, to make sure they are empty
SELECT * FROM [dbo].[Staging_Product]
SELECT * FROM [dbo].[Dim_Product]

-- Between these steps, a load is executed from SSIS

-- Look inside the tables, to make sure they were loaded
SELECT * FROM [dbo].[Staging_Product]
SELECT * FROM [dbo].[Dim_Product]

-- Check the changes from the auxiliary tables
SELECT * FROM [int].[Lineage] ORDER BY [StartLoad] DESC
SELECT * FROM [int].[IncrementalLoads]







