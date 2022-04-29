USE [HappyScoopers_DW]
GO

-- Check whether a row for the Date dimension was inserted in the Lineage table
SELECT * FROM [int].[Lineage] ORDER BY StartLoad DESC

-- Make sure that data is present in the Date dimension table
SELECT * FROM Dim_Date
