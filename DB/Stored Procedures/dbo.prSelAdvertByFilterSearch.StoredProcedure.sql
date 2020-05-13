SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[prSelAdvertByFilterSearch] 
(   
    @RowsPerPage INT,
    @RowStart INT,
    @CountryId char(3) = null,
    @RegionId CHAR(5),
    @GSETypeId INT = null,
	@ASAMembersOnlyYN BIT,
	@SortBy VARCHAR(20),
	
	@NewYN BIT,
	@UsedYN BIT,
	@ForRentYN BIT,
	@ForLeaseYN BIT,
	@ForSaleYN BIT,

	@QtyId1 CHAR(5),
	@QtyUnitId1 CHAR(5),
	@QtyValue1  NUMERIC(18,4),

	@QtyId2 CHAR(5),
	@QtyUnitId2 CHAR(5),
	@QtyValue2  NUMERIC(18,4),

	@SpecId1 CHAR(5),
	@SpecOptionId1 CHAR(5),

	@SpecId2 CHAR(5),
	@SpecOptionId2 CHAR(5),
	
	@SpecId3 CHAR(5),
	@SpecOptionId3 CHAR(5),
	
	@Manufacturer nvarchar(200),
	@AccountId int
)
AS
BEGIN
    BEGIN TRY
    
		-- Convert the passed qtys to metric
		SELECT	@QtyValue1 = @QtyValue1 / MetricConversionRatio 
		FROM	QuantityUnit
		WHERE	QuantityId = @QtyId1 
		AND		QuantityUnitId = @QtyUnitId1 
		AND		GSETypeId = @GSETypeId 

		SELECT	@QtyValue2 = @QtyValue2 / MetricConversionRatio 
		FROM	QuantityUnit
		WHERE	QuantityId = @QtyId2 
		AND		QuantityUnitId = @QtyUnitId2
		AND		GSETypeId = @GSETypeId 
    
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
			ForLeaseYN BIT,
			ASAMemberYN BIT,
			NewYN BIT,
			
			QtyId1 CHAR(5),
			QtyDescription1 NVARCHAR(50),
			QtyValue1  NUMERIC(18,4),
			QtyUnitId1 CHAR(5),
			QtyUnitDescription1 NVARCHAR(25),
			
			QtyId2 CHAR(5),
			QtyDescription2 NVARCHAR(50),
			QtyValue2 NUMERIC(18,4),
			QtyUnitId2 CHAR(5),
			QtyUnitDescription2 NVARCHAR(25),
			
			SpecId1 CHAR(5),
			SpecDescription1  NVARCHAR(50),
			SpecOptionId1 CHAR(5),
			SpecOptionDescription1  NVARCHAR(50),

			SpecId2 CHAR(5),
			SpecDescription2  NVARCHAR(50),
			SpecOptionId2 CHAR(5),
			SpecOptionDescription2  NVARCHAR(50),
			
			SpecId3 CHAR(5),
			SpecDescription3  NVARCHAR(50),
			SpecOptionId3 CHAR(5),
			SpecOptionDescription3  NVARCHAR(50)			
			
		)

        

		   INSERT INTO @tmpTable(AdvertId, AccountId, Title, ShortDescription, LongDescription, CatDesc, CategoryId, AdvertStatusId, StatusDesc, CountryId, 
								CountryName, CountryCurrency, EUYN, CurrencyDesc, DecimalUnicode, Manufacturer, DateofRegistration, [Year], Age, Location, ShowPriceYN, CurrencyId
								, Price, PriceInEuro, Quantity, ContactName, Telephone, Fax, Mobile, URL, EmailAddress
								, Address, ExpiryDate, CreatedDate, LastModifiedDate, Owner, Counter, UserAccountTypeID,
								AdvertImageId, AdvertImageAdvertId, Description, [Image], ContentType, ImageCreatedDate, InUseYN, IsDefaultYN, GSETypeId,GSETypeDescription,
								AdvertAvailabilityId,AvailabilityDescription, ForSaleYN, ForRentYN, ForLeaseYN, ASAMemberYN,
								NewYN,
								
								QtyId1, QtyDescription1, QtyValue1, QtyUnitId1, QtyUnitDescription1,
								QtyId2, QtyDescription2, QtyValue2, QtyUnitId2, QtyUnitDescription2,
								SpecId1, SpecDescription1, SpecOptionId1, SpecOptionDescription1,
								SpecId2, SpecDescription2, SpecOptionId2, SpecOptionDescription2,
								SpecId3, SpecDescription3, SpecOptionId3, SpecOptionDescription3
								
								)
           SELECT 
           
				A.AdvertId,
				A.AccountId,
				A.[Title],
				A.[ShortDescription],
				A.[LongDescription],

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
				
				AG.Manufacturer Manufacturer,

	
				AG.DateofRegistration DateofRegistration,
				AG.[Year] [Year],
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
				AG.ForLeaseYN,
				AC.ASAMemberYN,
				A.NewYN,
				
				CASE WHEN Q1.QuantityId IS NULL THEN '' ELSE Q1.QuantityId END,
				CASE WHEN Q1.Description IS NULL THEN '' ELSE Q1.ShortDescription END,
				CASE WHEN AGQ1.MetricValue IS NULL THEN -1 ELSE AGQ1.MetricValue END,
				CASE WHEN QU1.QuantityUnitId IS NULL THEN '' ELSE QU1.QuantityUnitId END,
				CASE WHEN QU1.ShortDescription IS NULL THEN '' ELSE QU1.ShortDescription END,
				
				CASE WHEN Q2.QuantityId IS NULL  THEN '' ELSE Q2.QuantityId END, 
				CASE WHEN Q2.Description IS NULL THEN '' ELSE Q2.ShortDescription END,
				CASE WHEN AGQ2.MetricValue IS NULL THEN -1 ELSE AGQ2.MetricValue END,
				CASE WHEN QU2.QuantityUnitId IS NULL THEN '' ELSE QU2.QuantityUnitId END,
				CASE WHEN QU2.ShortDescription IS NULL THEN '' ELSE QU2.ShortDescription END,
				
				CASE WHEN S1.SpecificationId IS NULL THEN '' ELSE S1.SpecificationId END,
				CASE WHEN S1.Description IS NULL THEN '' ELSE S1.ShortDescription END,
				CASE WHEN AGS1.SpecificationOptionId IS NULL THEN '' ELSE AGS1.SpecificationOptionId END,
				CASE WHEN SO1.Description IS NULL THEN '' ELSE SO1.ShortDescription END,
				
				CASE WHEN S2.SpecificationId IS NULL THEN '' ELSE S2.SpecificationId END,
				CASE WHEN S2.Description IS NULL THEN '' ELSE S2.ShortDescription END,
				CASE WHEN AGS2.SpecificationOptionId IS NULL THEN '' ELSE AGS2.SpecificationOptionId END,
				CASE WHEN SO2.Description IS NULL THEN '' ELSE SO2.ShortDescription END,

				CASE WHEN S3.SpecificationId IS NULL THEN '' ELSE S3.SpecificationId END,
				CASE WHEN S3.Description IS NULL THEN '' ELSE S3.ShortDescription END,
				CASE WHEN AGS3.SpecificationOptionId IS NULL THEN '' ELSE AGS3.SpecificationOptionId END,
				CASE WHEN SO3.Description IS NULL THEN '' ELSE SO3.ShortDescription END
				
				
			FROM [dbo].[Advert] A (NOLOCK)
				INNER JOIN Category CA (NOLOCK) on CA.CategoryId = A.CategoryId
				INNER JOIN AdvertStatus ADS (NOLOCK) ON ADS.AdvertStatusId = A.AdvertStatusId
				INNER JOIN Country CO (NOLOCK) ON CO.CountryId = A.CountryId
				INNER JOIN Account AC ON A.AccountId = AC.AccountId 
				LEFT OUTER JOIN [AdvertImage] i ON i.AdvertId = A.AdvertId AND i.[InUseYN] = 1 AND i.[IsDefaultYN] = 1
				LEFT OUTER JOIN Currency CU (NOLOCK) ON CU.CurrencyId = A.CurrencyId
				LEFT OUTER JOIN AdvertGSE AG (NOLOCK) ON AG.AdvertId = A.AdvertId
				LEFT OUTER JOIN GSEType G (NOLOCK) ON G.GSETypeId = AG.GSETypeId 
				LEFT OUTER JOIN AdvertAvailability AA ON AA.AdvertAvailabilityId =AG.AdvertAvailabilityId
				
				LEFT OUTER JOIN Region R
				ON CO.RegionId = R.RegionId
				
				LEFT OUTER JOIN Quantity Q1	
				ON AG.GSETypeId = Q1.GSETypeId 
				-- AND Q1.QuantityId = @QtyId1 
				AND Q1.Sequence = 1
				
				LEFT OUTER JOIN QuantityUnit QU1 
				ON QU1.GSETypeId = AG.GSETypeId 
				AND QU1.QuantityId = Q1.QuantityId	
				AND QU1.MetricYN = 1

				LEFT OUTER JOIN AdvertGSEQuantity AGQ1 
				ON AG.AdvertId = AGQ1.AdvertId 
				AND AGQ1.GSETypeId = AG.GSETypeId 				
				AND AGQ1.QuantityId = Q1.QuantityId 

				LEFT OUTER JOIN Quantity Q2	
				ON AG.GSETypeId = Q2.GSETypeId 
				-- AND Q2.QuantityId = @QtyId2
				AND Q2.Sequence = 2
				
				
				LEFT OUTER JOIN QuantityUnit QU2 
				ON QU2.GSETypeId = AG.GSETypeId 
				AND QU2.QuantityId = Q2.QuantityId	
				AND QU2.MetricYN = 1

				LEFT OUTER JOIN AdvertGSEQuantity AGQ2 
				ON AG.AdvertId = AGQ2.AdvertId 
				AND AGQ2.GSETypeId = AG.GSETypeId 
				AND AGQ2.QuantityId = Q2.QuantityId 

				LEFT OUTER JOIN Specification S1 
				ON	AG.GSETypeId = S1.GSETypeId 
				-- AND S1.SpecificationId = @SpecId1 
				AND S1.Sequence = 1
				
				LEFT OUTER JOIN AdvertGSESpecification AGS1	
				ON A.AdvertId = AGS1.AdvertId 
				AND AGS1.GSETypeId = AG.GSETypeId
				AND AGS1.SpecificationId = S1.SpecificationId

				LEFT OUTER JOIN SpecificationOption SO1
				ON	AGS1.GSETypeId = SO1.GSETypeId
				AND AGS1.SpecificationId = SO1.SpecificationId
				AND AGS1.SpecificationOptionId = SO1.SpecificationOptionId

				LEFT OUTER JOIN Specification S2
				ON	AG.GSETypeId = S2.GSETypeId
				-- AND S2.SpecificationId = @SpecId2
				AND S2.Sequence = 2
				
				LEFT OUTER JOIN AdvertGSESpecification AGS2
				ON A.AdvertId = AGS2.AdvertId
				AND AGS2.GSETypeId = AG.GSETypeId
				AND AGS2.SpecificationId = S2.SpecificationId

				LEFT OUTER JOIN SpecificationOption SO2
				ON	AGS2.GSETypeId = SO2.GSETypeId
				AND AGS2.SpecificationId = SO2.SpecificationId
				AND AGS2.SpecificationOptionId = SO2.SpecificationOptionId

				LEFT OUTER JOIN Specification S3
				ON	AG.GSETypeId = S3.GSETypeId
				-- AND S3.SpecificationId = @SpecId3
				AND S3.Sequence = 3
				
				LEFT OUTER JOIN AdvertGSESpecification AGS3
				ON A.AdvertId = AGS3.AdvertId
				AND AGS3.GSETypeId = AG.GSETypeId
				AND AGS3.SpecificationId = S3.SpecificationId

				LEFT OUTER JOIN SpecificationOption SO3
				ON	AGS3.GSETypeId = SO3.GSETypeId
				AND AGS3.SpecificationId = SO3.SpecificationId
				AND AGS3.SpecificationOptionId = SO3.SpecificationOptionId

				
            WHERE  
            (          
				(@GSETypeId = 0 OR (AG.GSETypeId = @GSETypeId))
				AND		(@AccountId = 0 OR (A.AccountId = @AccountId))
				AND		((@CountryId ='' AND @RegionId ='') OR A.CountryId =  @CountryId OR R.RegionId = @RegionId)
				AND		(
							(A.NewYN = 1 AND @NewYN = 1) 
							OR 
							(
								(A.NewYN = 0 AND @UsedYN = 1) 
								AND
								(@ASAMembersOnlyYN = 0 OR (@ASAMembersOnlyYN = 1 AND AC.ASAMemberYN = 1))
											
							)
						)
				
				
				AND		((AG.ForLeaseYN = @ForLeaseYN) OR (AG.ForRentYN = @ForRentYN) OR (AG.ForSaleYN = @ForSaleYN))
				AND		((@SpecOptionId1 ='') OR (AGS1.SpecificationId IS NULL) OR (@SpecOptionId1 ='ANY') OR (AGS1.SpecificationOptionId = @SpecOptionId1))
				AND		((@SpecOptionId2 ='') OR (AGS2.SpecificationId IS NULL) OR (@SpecOptionId2 ='ANY') OR (AGS2.SpecificationOptionId = @SpecOptionId2))
				AND		((@SpecOptionId3 ='') OR (AGS3.SpecificationId IS NULL) OR (@SpecOptionId3 ='ANY') OR (AGS3.SpecificationOptionId = @SpecOptionId3))
				AND		  ((@QtyUnitId1 ='') OR (AGQ1.MetricValue IS NULL) 
						OR (@GSETypeId <> 18 AND @QtyValue1 <= AGQ1.MetricValue) 
						OR (@GSETypeId = 18  AND ((@QtyValue1 = AGQ1.MetricValue) OR @QtyValue1 = 0)))
				AND		((@QtyUnitId2 ='') OR (AGQ2.MetricValue IS NULL) OR (@QtyValue2 <= AGQ2.MetricValue))
				AND		((@Manufacturer = '') OR (@Manufacturer = AG.Manufacturer))
			)
			AND
				(
					(
						AC.ExpiryDate >= GETDATE() 
						OR 
						AC.ExpiryDate IS NULL
					) 
					AND
					(
						(
							(
								A.AdvertStatusId = 'SL' 
								AND 
								DATEADD(dd,7,A.LastModifiedDate) >= GETDATE()
							) 
							OR 
							A.AdvertStatusId = 'PL'
						)

					)
					AND
					AC.AccountStatusId = 'CF'
				)
			

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
			SELECT COUNT(1) AS TotalRecords
			FROM @tmpTable AS t

    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END


GO
