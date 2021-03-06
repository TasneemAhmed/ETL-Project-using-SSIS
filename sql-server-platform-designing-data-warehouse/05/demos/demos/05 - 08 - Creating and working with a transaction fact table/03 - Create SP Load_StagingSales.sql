USE [HappyScoopers_Demo]
GO
-- Create or modify the procedure for loading data into the staging table
ALTER PROCEDURE [dbo].[Load_StagingSales]
@LastLoadDate datetime,
@NewLoadDate datetime
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SELECT CAST(ord.OrderDate AS date)								AS [_SourceOrderDateKey],
           CAST(ord.DeliveryDate AS date)							AS [_SourceDeliveryDateKey],
           ord.OrderID												AS [_SourceOrder],
		   ISNULL(orl.OrderLineID, 0)								AS [_SourceOrderLine],
		   cus.CustomerID											AS [_SourceCustomerKey],
		   emp.EmployeeID											AS [_SourceEmployeeKey],
		   prd.ProductID											AS [_SourceProductKey],
		   pmt.PaymentTypeID										AS [_SourcePaymentTypeKey],
		   cou.CountryID											AS [_SourceDeliveryCountryKey],
		   prv.ProvinceID											AS [_SourceDeliveryProvinceKey],
		   cit.CityID												AS [_SourceDeliveryCityKey],
		   adr.AddressID											AS [_SourceDeliveryAddressKey],
		   CONCAT('|', cou.CountryID, 
			prv.ProvinceID,
			cit.CityID,
			adr.AddressID)											AS [_SourceDeliveryLocationKey],
		   pro.PromotionID											AS [_SourcePromotionKey],
		   ISNULL(orl.Description, 'N/A)')							AS [Description],
           ISNULL(pck.PackageTypeName, 'N/A')						AS [Package],
           orl.Quantity												AS [Quantity],
           orl.UnitPrice											AS [Unit Price],
           ISNULL(orl.VATRate, 0.20)								AS [VAT Rate],
           orl.Quantity * orl.UnitPrice								AS [Total Excluding VAT],
		   orl.Quantity * orl.UnitPrice * ISNULL(orl.VATRate, 0.20) AS [VAT Amount],
		   orl.Quantity*orl.UnitPrice*(1+ ISNULL(orl.VATRate, 0.20)) AS [Total Including VAT],
           CASE 
			WHEN orl.ModifiedDate > ord.ModifiedDate 
				THEN orl.ModifiedDate 
			ELSE ord.ModifiedDate END								AS [ModifiedDate]
    FROM 
		[HappyScoopers_Demo].[dbo].[Orders] ord
		LEFT JOIN [HappyScoopers_Demo].[dbo].[OrderLines] orl ON ord.OrderID = orl.OrderID
	    LEFT JOIN [HappyScoopers_Demo].[dbo].[Customers] cus ON ord.CustomerID = cus.CustomerID
		LEFT JOIN [HappyScoopers_Demo].[dbo].[Addresses] adr ON ord.DeliveryAddressID = adr.AddressID
		LEFT JOIN [HappyScoopers_Demo].[dbo].[Cities] cit ON adr.CityID = cit.CityID
		LEFT JOIN [HappyScoopers_Demo].[dbo].[Provinces] prv ON cit.ProvinceID = prv.ProvinceID
		LEFT JOIN [HappyScoopers_Demo].[dbo].[Countries] cou ON prv.CountryID = cou.CountryID
	    LEFT JOIN [HappyScoopers_Demo].[dbo].[Employees] emp ON ord.EmployeeID = emp.EmployeeID
        LEFT JOIN [HappyScoopers_Demo].[dbo].[PaymentTypes] pmt ON ord.PaymentTypeID = pmt.PaymentTypeID
		LEFT JOIN [HappyScoopers_Demo].[dbo].[Products] prd ON orl.ProductID = prd.ProductID
		LEFT JOIN [HappyScoopers_Demo].[dbo].[PackageTypes] pck ON orl.PackageTypeID = pck.PackageTypeID 
		LEFT JOIN [HappyScoopers_Demo].[dbo].[Promotions] pro ON orl.PromotionID = pro.PromotionID
WHERE 
	([ord].ModifiedDate > @LastLoadDate AND [ord].ModifiedDate <= @NewLoadDate) OR
	([orl].ModifiedDate > @LastLoadDate AND [orl].ModifiedDate <= @NewLoadDate) 


    RETURN 0;
END
GO






















