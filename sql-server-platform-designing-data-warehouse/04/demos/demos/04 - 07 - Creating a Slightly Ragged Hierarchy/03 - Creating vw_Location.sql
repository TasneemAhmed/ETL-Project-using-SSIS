USE [HappyScoopers_DW]
GO

CREATE OR ALTER VIEW [dbo].[vw_Location]
AS
SELECT 
	CONCAT_WS('|', 'HSD', 
		CONVERT(nvarchar(5), ISNULL(cou.CountryID, 0)),
		CONVERT(nvarchar(5), ISNULL(prv.ProvinceID, 0)),
		CONVERT(nvarchar(5), ISNULL(cit.CityID, 0)), 
		CONVERT(nvarchar(5), ISNULL(adr.AddressID, 0)))						AS [_Source Key],
	CONVERT(nvarchar(200),ISNULL(cou.Continent, 'N/A'))						AS [Continent],
	CONVERT(nvarchar(200),ISNULL(cou.Region, 'N/A'))						AS [Region],
	CONVERT(nvarchar(200),ISNULL(cou.Subregion, 'N/A'))						AS [Subregion],
	CONVERT(nvarchar(200), ISNULL(cou.CountryCode, 'N/A'))					AS [Country Code], 
	CONVERT(nvarchar(200), ISNULL(cou.CountryName, 'N/A'))					AS [Country], 
	CONVERT(nvarchar(200),ISNULL(cou.FormalName, 'N/A'))					AS [Country Formal Name],
	ISNULL(CONVERT(bigint,cou.Population), -1)								AS [Country Population],
	CONVERT(nvarchar(200),ISNULL(prv.ProvinceCode, 'N/A'))					AS [Province Code],
	CONVERT(nvarchar(200),ISNULL(prv.ProvinceName, 'N/A'))					AS [Province],
	ISNULL(CONVERT(bigint,prv.Population), -1)								AS [Province Population],
	CONVERT(nvarchar(200),ISNULL(cit.CityName, 'N/A'))						AS [City],
	ISNULL(CONVERT(bigint,cit.Population), -1)								AS [City Population],
	CONVERT(nvarchar(200),ISNULL(adr.PostalCode, 'N/A'))					AS [Postal Code],
	CONVERT(nvarchar(200),ISNULL(adr.AddressLine1, 'N/A'))					AS [Address Line 1],
	CONVERT(nvarchar(200),ISNULL(adr.AddressLine2, 'N/A'))					AS [Address Line 2],
	CONVERT(datetime, cou.ModifiedDate)										AS [Valid From],
	CONVERT(datetime, '9999-12-31')											AS [Valid To],
	CONVERT(int, -1)														AS [Lineage Key]
FROM	
	[HappyScoopers_Demo].[dbo].[Addresses] adr 
	FULL JOIN [HappyScoopers_Demo].[dbo].[Cities] cit on adr.CityID = cit.CityID
	FULL JOIN [HappyScoopers_Demo].[dbo].[Provinces] prv on cit.ProvinceID = prv.ProvinceID
	FULL JOIN [HappyScoopers_Demo].[dbo].[Countries] cou on prv.CountryID = cou.CountryID
  
  
UNION ALL
  SELECT
		'CSV|1|0|0|1'														AS [_SourceKey]
      ,'Europe'																AS [Continent]
      ,'Europe'																AS [Region]
      ,'Southern Europe'													AS [Subregion]
      ,'VAT'																AS [Country Code]
      ,'Vatican'															AS [Country]
      ,'Vatican City'														AS [Country Formal Name]
      ,1000																	AS [Country Population]
      ,'N/A'																AS [Province Code]
      ,'N/A'																AS [Province]
      ,-1																	AS [Province Population]
      ,'N/A'																AS [City]
      ,-1																	AS [City Population]
      ,'00120'																AS [Postal Code]
      ,'Sistine Chapel'														AS [Address Line 1]
      ,'00120 Città del Vaticano'											AS [Address Line 2]
      ,'2019-05-17'															AS [ValidFrom]
      ,'9999-12-31'															AS [ValidTo]
      ,-1																	AS [LineageKey]
UNION ALL
  SELECT
		'CSV|1|0|0|2'														AS [_SourceKey]
      ,'Europe'																AS [Continent]
      ,'Europe'																AS [Region]
      ,'Southern Europe'													AS [Subregion]
      ,'VAT'																AS [Country Code]
      ,'Vatican'															AS [Country]
      ,'Vatican City'														AS [Country Formal Name]
      ,1000																	AS [Country Population]
      ,'N/A'																AS [Province Code]
      ,'N/A'																AS [Province]
      ,-1																	AS [Province Population]
      ,'N/A'																AS [City]
      ,-1																	AS [City Population]
      ,'00165'																AS [Postal Code]
      ,'Porta Pertusa'														AS [Address Line 1]			
      ,'Viale Vaticano, 37, 00165 Roma RM, Italy'							AS [Address Line 2]
      ,'2019-05-17'															AS [ValidFrom]
      ,'9999-12-31'															AS [ValidTo]
      ,-1																	AS [LineageKey]
UNION ALL
  SELECT
		'CSV|1|0|0|3'
      ,'Europe'																AS [Continent]
      ,'Europe'																AS [Region]
      ,'Southern Europe'													AS [Subregion]
      ,'VAT'																AS [Country Code]
      ,'Vatican'															AS [Country]
      ,'Vatican City'														AS [Country Formal Name]
      ,1000																	AS [Country Population]
      ,'N/A'																AS [Province Code]
      ,'N/A'																AS [Province]
      ,-1																	AS [Province Population]
      ,'N/A'																AS [City]
      ,-1																	AS [City Population]
      ,'00165'																AS [Postal Code]
      ,'Cancello Petriano'													AS [Address Line 1]	
      ,'Via Paolo VI 31 00193 Roma Italy, 00120 Città del Vaticano'			AS [Address Line 2]
      ,'2019-05-17'															AS [ValidFrom]
      ,'9999-12-31'															AS [ValidTo]
      ,-1																	AS [LineageKey]
UNION ALL
  SELECT
		'CSV|1|0|0|4'
      ,'Europe'																AS [Continent]
      ,'Europe'																AS [Region]
      ,'Southern Europe'													AS [Subregion]
      ,'VAT'																AS [Country Code]
      ,'Vatican'															AS [Country]
      ,'Vatican City'														AS [Country Formal Name]
      ,1000																	AS [Country Population]
      ,'N/A'																AS [Province Code]
      ,'N/A'																AS [Province]
      ,-1																	AS [Province Population]
      ,'N/A'																AS [City]
      ,-1																	AS [City Population]
      ,'00120'																AS [Postal Code]
      ,'Paul VI Audience Hall'												AS [Address Line 1]	
      ,'Via di Porta Cavalleggeri, 7891, 00165 Roma RM, Italy'				AS [Address Line 2]
      ,'2019-05-17'															AS [ValidFrom]
      ,'9999-12-31'															AS [ValidTo]
      ,-1																	AS [LineageKey]

UNION ALL
  SELECT
		'CSV|152|333|48922|1'
      ,'Asia'
      ,'Asia'
      ,'South-Eastern Asia'
      ,'SGP'
      ,'Singapore'
      ,'Republic of Singapore'
      ,4657542
      ,'CEN'
      ,'Singapore'
      ,-1
      ,'Singapore'
      ,-1
      ,'578775'
      ,'TreeTop Walk'
      ,'601 Island Club Rd, Singapore 578775'
      ,'2019-05-17'
      ,'9999-12-31'
      ,-1
UNION ALL
  SELECT
		'CSV|152|333|48922|2'
      ,'Asia'
      ,'Asia'
      ,'South-Eastern Asia'
      ,'SGP'
      ,'Singapore'
      ,'Republic of Singapore'
      ,4657542
      ,'CEN'
      ,'Singapore'
      ,-1
      ,'Singapore'
      ,-1
      ,'729826'
      ,'River Safari'
      ,'80 Mandai Lake Rd, Singapore 729826'
      ,'2019-05-17'
      ,'9999-12-31'
      ,-1
UNION ALL
  SELECT
		'CSV|152|333|48922|3'
      ,'Asia'
      ,'Asia'
      ,'South-Eastern Asia'
      ,'SGP'
      ,'Singapore'
      ,'Republic of Singapore'
      ,4657542
      ,'CEN'
      ,'Singapore'
      ,-1
      ,'Singapore'
      ,-1
      ,'018956'
      ,'Marina Bay Sands'
      ,'10 Bayfront Ave, Singapore 018956'
      ,'2019-05-17'
      ,'9999-12-31'
      ,-1
UNION ALL
  SELECT
		'CSV|152|333|48922|4'
      ,'Asia'
      ,'Asia'
      ,'South-Eastern Asia'
      ,'SGP'
      ,'Singapore'
      ,'Republic of Singapore'
      ,4657542
      ,'CEN'
      ,'Singapore'
      ,-1
      ,'Singapore'
      ,-1
      ,'538768'
      ,'Punggol Park'
      ,'Hougang Ave 10, Singapore 538768'
      ,'2019-05-17'
      ,'9999-12-31'
      ,-1

GO


