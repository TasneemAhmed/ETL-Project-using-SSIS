USE [HappyScoopers_DW]
GO

-- Check what happens in the Lineage table after a full load
SELECT * FROM [int].[Lineage] ORDER BY [StartLoad] DESC


-- Prepare some data to be transferred during an incremental load
USE [HappyScoopers_Demo]
GO

-- Look at the current information about Abby Patel
SELECT *
  FROM [HappyScoopers_Demo].[dbo].[Customers]
WHERE FirstName = 'Abby' AND LastName = 'Patel'


-- Update the phone number
UPDATE [HappyScoopers_Demo].[dbo].[Customers]
SET 
PhoneNumber = '1 (11) 500 555-0888',
ModifiedDate = GETDATE()
WHERE FirstName = 'Abby' AND LastName = 'Patel'


USE [HappyScoopers_DW]
GO

-- Check what happens in the Lineage table after an incremental load
SELECT * FROM [int].[Lineage] ORDER BY [StartLoad] DESC

-- Test the incremental load: all staging tables, besides Staging_Customer, should be empty
SELECT * FROM Staging_Location 
SELECT * FROM Staging_Employee 
SELECT * FROM Staging_PaymentType 
SELECT * FROM Staging_Product 
SELECT * FROM Staging_Promotion 
SELECT * FROM Staging_Customer 

-- The staging table should contain only the updates coming from the source database
SELECT * FROM Staging_Customer WHERE [Full Name] = 'Abby Patel'

-- Take a look inside Dim_Customer, at the new versions of the rows 
SELECT * FROM Dim_Customer WHERE [Full Name] = 'Abby Patel'
