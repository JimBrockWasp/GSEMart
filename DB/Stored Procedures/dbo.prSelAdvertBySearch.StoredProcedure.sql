SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prSelAdvertBySearch] 
(   
    @RowsPerPage INT,
    @RowStart INT,
    @CategoryId char(3) = null,
    @CountryId char(3) = null,
    @Location nvarchar(100)  = null,
    @SearchAllFor nvarchar(255) = null,
	@SearchCurrencyID nvarchar(10) = null,
	@PriceFrom money,
	@PriceTo MONEY,
	@GSETypeId INT = null,
	@ASAMembersOnlyYN BIT = 0,
	@SortBy VARCHAR(20)
)
AS
BEGIN
    BEGIN TRY
		DECLARE @tmpTable TABLE (
			AdvertId INT,
			AccountId INT,
			Title NVARCHAR(100),
			ShortDescription NVARCHAR(255),
			LongDescription NVARCHAR (4000),
			CatDesc NVARCHAR(50),
			CategoryId CHAR(2),
			AdvertStatusId CHAR(2),
			StatusDesc NVARCHAR(50),
			CountryId CHAR(3),
			CountryName NVARCHAR(100),
			CountryCurrency NVARCHAR(10),
			EUYN BIT,
			CurrencyDesc NVARCHAR(50),
			DecimalUnicode NVARCHAR(25),
			Manufacturer NVARCHAR(200),
			ProductId NVARCHAR(100),
			Supplier NVARCHAR(100),
			DateofRegistration DATETIME,
			[Year] NVARCHAR (200),
			Age INT,
			Location NVARCHAR(100),
			ShowPriceYN BIT,
			CurrencyId NVARCHAR(10),
			Price MONEY,
			PriceInEuro MONEY,
			Quantity INT,
			ContactName NVARCHAR(100),
			Telephone NVARCHAR(100),
			Fax NVARCHAR(100),
			Mobile NVARCHAR(100),
			URL NVARCHAR(100),
			EmailAddress NVARCHAR(50),
			Address NVARCHAR(500),
			ExpiryDate DATETIME,
			CreatedDate DATETIME,
			LastModifiedDate DATETIME,
			Owner NVARCHAR(100),
			Counter INT,
			UserAccountTypeID INT,
			AdvertImageId INT,
			AdvertImageAdvertId INT,
			Description NVARCHAR(100),
			[Image] IMAGE,
			ContentType VARCHAR(50),
			ImageCreatedDate DATETIME,
			InUseYN BIT,
			IsDefaultYN BIT, 
			GSETypeId INT,
			GSETypeDescription NVARCHAR(50),
			AdvertAvailabilityId CHAR(3),
			AvailabilityDescription nvarChar(50),
			ForSaleYN BIT,
			ForRentYN BIT,
			ASAMemberYN BIT
		)

        IF @SearchAllFor IS NULL OR @SearchAllFor = ''
        BEGIN
			SET @SearchAllFor = '""'
        END

		   INSERT INTO @tmpTable(AdvertId, AccountId, Title, ShortDescription, LongDescription, CatDesc, CategoryId, AdvertStatusId, StatusDesc, CountryId, 
								CountryName, CountryCurrency, EUYN, CurrencyDesc, DecimalUnicode, Manufacturer, ProductId, 
								Supplier, DateofRegistration, [Year], Age, Location, ShowPriceYN, CurrencyId
								, Price, PriceInEuro, Quantity, ContactName, Telephone, Fax, Mobile, URL, EmailAddress
								, Address, ExpiryDate, CreatedDate, LastModifiedDate, Owner, Counter, UserAccountTypeID,
								AdvertImageId, AdvertImageAdvertId, Description, [Image], ContentType, ImageCreatedDate, InUseYN, IsDefaultYN, GSETypeId,GSETypeDescription,
								AdvertAvailabilityId,AvailabilityDescription, ForSaleYN, ForRentYN, ASAMemberYN)
           SELECT 
				A.AdvertId,
				A.AccountId,
				[Title],
				[ShortDescription],
				[LongDescription],

				CA.Description AS CatDesc,
				A.CategoryId,   

				ADS.AdvertStatusId,
				ADS.Description AS StatusDesc,

				A.CountryId,
				CO.CountryName,
				CO.CurrencyId AS CountryCurrency,
				CO.EUYN,

				CU.Description  AS CurrencyDesc,
				CU.DecimalUnicode,

				CASE 
					WHEN A.CategoryId = 'GS' THEN AG.Manufacturer
					WHEN A.CategoryId = 'SP' THEN ''
					WHEN A.CategoryId = 'TL' THEN ADTOOLS.Manufacturer
					ELSE null
				 END AS Manufacturer,

				 CASE 
					WHEN A.CategoryId = 'GS' THEN null
					WHEN A.CategoryId = 'SP' THEN ADSPA.ProductId
					WHEN A.CategoryId = 'TL' THEN ADTOOLS.ProductId
					ELSE null
				 END AS ProductId,

				 CASE 
					WHEN A.CategoryId = 'GS' THEN null
					WHEN A.CategoryId = 'SP' THEN ADSPA.Supplier
					WHEN A.CategoryId = 'TL' THEN ADTOOLS.Supplier
					ELSE null
				 END AS Supplier,

				 CASE 
					WHEN A.CategoryId = 'GS' THEN AG.DateofRegistration
					WHEN A.CategoryId = 'SP' THEN null
					WHEN A.CategoryId = 'TL' THEN null
					ELSE null
				 END AS DateofRegistration,
				 CASE 
					WHEN A.CategoryId = 'GS' THEN AG.[Year]
					WHEN A.CategoryId = 'SP' THEN null
					WHEN A.CategoryId = 'TL' THEN ADTOOLS.[Year]
					ELSE null
				 END AS [Year],
				 A.Age AS Age,
				[Location],
				[ShowPriceYN],
				A.CurrencyId,
				[Price],
				[PriceInEuro] = ISNULL(ROUND(([Price] / CU.CurrencyValue), 2), 0),
				[Quantity],
				[ContactName],
				A.Telephone,
				A.Fax,
				A.Mobile,
				A.URL,
				A.EmailAddress,
				A.Address,
				A.ExpiryDate,
				A.[CreatedDate],
				A.LastModifiedDate,
				[Owner],
				[Counter],
				[UserAccountTypeID],
				i.[AdvertImageId] AS [AdvertImageId],
				i.[AdvertId] AS AdvertImageAdvertId,
				i.[Description] AS Description,
				i.[Image],
				i.[ContentType],
				i.[CreatedDate] AS ImageCreatedDate,
				i.[InUseYN],
				i.[IsDefaultYN],
				G.GSETypeId,
				G.Description,
				AG.AdvertAvailabilityId,
				AA.Description,
				AG.ForSaleYN,
				AG.ForRentYN,
				AC.ASAMemberYN 
				
			FROM [dbo].[Advert] A (NOLOCK)
				INNER JOIN Category CA (NOLOCK) on CA.CategoryId = A.CategoryId
				INNER JOIN AdvertStatus ADS (NOLOCK) ON ADS.AdvertStatusId = A.AdvertStatusId
				INNER JOIN Country CO (NOLOCK) ON CO.CountryId = A.CountryId
				INNER JOIN Account AC ON A.AccountId = AC.AccountId 
				LEFT OUTER JOIN [AdvertImage] i ON i.AdvertId = A.AdvertId AND i.[InUseYN] = 1 AND i.[IsDefaultYN] = 1
				LEFT OUTER JOIN Currency CU (NOLOCK) ON CU.CurrencyId = A.CurrencyId
				LEFT OUTER JOIN AdvertGSE AG (NOLOCK) ON AG.AdvertId = A.AdvertId
				LEFT OUTER JOIN AdvertSpares ADSPA (NOLOCK) ON ADSPA.AdvertId = A.AdvertId
				LEFT OUTER JOIN AdvertTool ADTOOLS (NOLOCK) ON ADTOOLS.AdvertId = A.AdvertId
				LEFT OUTER JOIN GSEType G (NOLOCK) ON G.GSETypeId = AG.GSETypeId 
				LEFT OUTER JOIN AdvertAvailability AA ON AA.AdvertAvailabilityId =AG.AdvertAvailabilityId
				
            WHERE  
            (          
				(
					(@CategoryId = '' OR @CategoryId IS NULL OR A.[CategoryId] =  @CategoryId) AND
					(@CountryId = '' OR @CountryId IS NULL OR A.[CountryId] = @CountryId ) AND
					(@Location = '' OR @Location IS NULL OR A.[Location] LIKE '%'+ @Location +'%') AND
					(@GSETypeId = 0 OR @GSETypeId IS NULL OR AG.GSETypeId = @GSETypeId) AND
					(@SearchAllFor IS NULL OR @SearchAllFor ='')
				)
				OR
				( 
					(@CategoryId = '' OR @CategoryId IS NULL OR A.[CategoryId] =  @CategoryId) AND
					(@CountryId = '' OR @CountryId IS NULL OR A.[CountryId] = @CountryId ) AND
					(@Location = '' OR @Location IS NULL OR A.[Location] LIKE '%'+ @Location +'%') AND
					(@GSETypeId = 0 OR @GSETypeId IS NULL OR AG.GSETypeId = @GSETypeId) 
					AND                
					(
						@SearchAllFor = '""' OR CONTAINS (A.[FullText], @SearchAllFor)
					) 
					AND @SearchAllFor IS NOT NULL 
				)
			)
			AND
			(
				@SearchCurrencyID = '' OR @SearchCurrencyID IS NULL OR 
				(
					@SearchCurrencyID IS NOT NULL AND
					(
						dbo.[fnGetCommonPrice](A.CurrencyId,Price) between dbo.[fnGetCommonPrice](@SearchCurrencyID,@PriceFrom) AND dbo.[fnGetCommonPrice](@SearchCurrencyID,@PriceTo)
					)
				)
			)
			AND
				ExpiryDate >= GETDATE() AND
				((A.AdvertStatusId = 'SL' AND DATEADD(dd,7,A.LastModifiedDate) >= GETDATE()) OR (A.AdvertStatusId = 'CR'))
			AND
				(@ASAMembersOnlyYN = 0 OR (@ASAMembersOnlyYN = 1 AND AC.ASAMemberYN = 1))

			-- Query to sort record by certain order,
			-- and get only certain range of records for paging purposes
			IF @SortBy = 'Title'
			BEGIN
				SELECT * FROM (
					SELECT 
					ROW_NUMBER() OVER (ORDER BY Title ASC) AS RowNumber, *
					FROM @tmpTable AS t
				) AS a
				WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
			END
			ELSE IF @SortBy = 'Country'
			BEGIN
				SELECT * FROM (
					SELECT 
					ROW_NUMBER() OVER (ORDER BY CountryName ASC) AS RowNumber, *
					FROM @tmpTable AS t
				) AS a
				WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
			END
			ELSE IF @SortBy = 'Location'
			BEGIN
				SELECT * FROM (
					SELECT 
					ROW_NUMBER() OVER (ORDER BY Location ASC) AS RowNumber, *
					FROM @tmpTable AS t
				) AS a
				WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
			END
			ELSE IF @SortBy = 'ContactName'
			BEGIN
				SELECT * FROM (
					SELECT 
					ROW_NUMBER() OVER (ORDER BY ContactName ASC) AS RowNumber, *
					FROM @tmpTable AS t
				) AS a
				WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
			END
			ELSE IF @SortBy = 'PriceAsc'
			BEGIN
				SELECT * FROM (
					SELECT 
					ROW_NUMBER() OVER (ORDER BY PriceInEuro ASC) AS RowNumber, *
					FROM @tmpTable AS t
				) AS a
				WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
			END
			ELSE IF @SortBy = 'PriceDesc'
			BEGIN
				SELECT * FROM (
					SELECT 
					ROW_NUMBER() OVER (ORDER BY PriceInEuro DESC) AS RowNumber, *
					FROM @tmpTable AS t
				) AS a
				WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
			END
			ELSE
			BEGIN
				SELECT * FROM (
					SELECT 
					ROW_NUMBER() OVER (ORDER BY CreatedDate DESC) AS RowNumber, *
					FROM @tmpTable AS t
				) AS a
				WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
			END

			--Getting the total number of records
			SELECT COUNT(1) AS totalResult
			FROM @tmpTable AS t

    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
