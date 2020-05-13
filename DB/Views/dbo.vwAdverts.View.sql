SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*--------------------------------------------------------------------------------------
 =============================================
 Author:        Bala
 Create date: March 15,2009
 Description: View for the Adverts
 =============================================*/
CREATE VIEW [dbo].[vwAdverts]
AS

SELECT		A.AdvertId, 
			A.AccountId, 
			A.Title, 
			A.ShortDescription, 
			A.LongDescription, 
			CA.Description AS CatDesc, 
			A.CategoryId, 
			ADS.AdvertStatusId, 
			ADS.Description AS StatusDesc, 
            A.CountryId, 
            CO.CountryName, 
            CO.CurrencyId AS CountryCurrency, 
            CO.EUYN, 
            CU.Description AS CurrencyDesc, 
            CU.DecimalUnicode, 
            CASE 
				WHEN A.CategoryId = 'GS' THEN AG.Manufacturer 
				WHEN A.CategoryId = 'SP' THEN '' 
				WHEN A.CategoryId = 'TL' THEN ADTOOLS.Manufacturer 
				ELSE NULL 
            END AS Manufacturer, 
            CASE 
				WHEN A.CategoryId = 'GS' THEN NULL 
                WHEN A.CategoryId = 'SP' THEN ADSPA.ProductId 
                WHEN A.CategoryId = 'TL' THEN ADTOOLS.ProductId 
                ELSE NULL 
            END AS ProductId, 
            CASE 
				WHEN A.CategoryId = 'GS' THEN NULL 
				WHEN A.CategoryId = 'SP' THEN ADSPA.Supplier 
				WHEN A.CategoryId = 'TL' THEN ADTOOLS.Supplier 
				ELSE NULL 
            END AS Supplier, 
            CASE 
				WHEN A.CategoryId = 'GS' THEN AG.DateofRegistration 
				WHEN A.CategoryId = 'SP' THEN NULL 
				WHEN A.CategoryId = 'TL' THEN NULL 
                ELSE NULL 
            END AS DateofRegistration, 
            CASE 
				WHEN A.CategoryId = 'GS' THEN AG.[Year] 
				WHEN A.CategoryId = 'SP' THEN NULL 
                WHEN A.CategoryId = 'TL' THEN ADTOOLS.[Year]
				ELSE NULL
            END AS Year, 
            A.Age, 
            A.Location, 
            A.ShowPriceYN, 
            A.CurrencyId, 
            A.Price, 
			ISNULL(ROUND(A.Price / CU.CurrencyValue, 2), 0) AS PriceInEuro, 
			A.Quantity, 
			A.ContactName, 
			A.Telephone, 
			A.Fax, 
			A.Mobile, 
			A.URL, 
			A.EmailAddress, 
			A.Address, 
			A.ExpiryDate AdvertExpiryDate, 
			A.CreatedDate, 
			A.LastModifiedDate, 
			A.Owner, 
			A.Counter, 
			A.UserAccountTypeID, A.GUID, 
			AG.GSETypeId, 
			AG.AdvertAvailabilityId, 
			dbo.AdvertAvailability.Description AS AvailabilityDescription, 
			AG.ForSaleYN, 
			AG.ForRentYN, 
			AC.ASAMemberYN, 
			AG.ForLeaseYN, 
			A.NewYN,
			AC.ExpiryDate

FROM		dbo.Advert A 

INNER JOIN		  dbo.Country		CO	ON	A.CountryId = CO.CountryId
INNER JOIN        dbo.Category		CA	ON CA.CategoryId = A.CategoryId 
INNER JOIN        dbo.AdvertStatus	ADS ON ADS.AdvertStatusId = A.AdvertStatusId 
INNER JOIN        dbo.Account		AC  ON A.AccountId = AC.AccountId
INNER JOIN        dbo.AdvertGSE		AG	ON A.AdvertId = AG.AdvertId 

LEFT OUTER JOIN   dbo.Currency		CU	ON A.CurrencyId = CU.CurrencyId 
LEFT OUTER JOIN   dbo.AdvertAvailability ON dbo.AdvertAvailability.AdvertAvailabilityId = AG.AdvertAvailabilityId 
LEFT OUTER JOIN   dbo.AdvertSpares	ADSPA ON ADSPA.AdvertId = A.AdvertId 
LEFT OUTER JOIN   dbo.AdvertTool	ADTOOLS ON ADTOOLS.AdvertId = A.AdvertId




GO
