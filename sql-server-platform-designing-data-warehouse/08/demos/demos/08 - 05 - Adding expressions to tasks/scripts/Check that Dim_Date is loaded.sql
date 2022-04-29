USE [HappyScoopers_DW]
GO

-- Make sure that data is present in the Date dimension table
SELECT * FROM Dim_Date

-- Check the minimum and maximum dates loaded
SELECT MIN(Date) AS [Minimum loaded date], MAX(Date) AS [Maximum loaded date] 
FROM Dim_Date
WHERE [Date Key] != 0