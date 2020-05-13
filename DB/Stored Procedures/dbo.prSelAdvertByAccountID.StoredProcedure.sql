SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertByAccountID] 
(   
    @RowsPerPage INT,
    @RowStart INT,
	@AccountId INT
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		DECLARE @tmpTable TABLE (
			AdvertId INT,
			AccountId INT,
			Title NVARCHAR(100),
			ShortDescription NVARCHAR(255),
			LongDescription NVARCHAR (4000),
			CatDesc NVARCHAR(50),
			CategoryId CHAR(2),
			GSETypeId INT,
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
			[GUID] VARCHAR(100),
			AdvertImageId INT,
			AdvertImageAdvertId INT,
			Description NVARCHAR(100),
			[Image] IMAGE,
			ContentType VARCHAR(50),
			ImageCreatedDate DATETIME,
			InUseYN BIT,
			IsDefaultYN BIT,
			StatusCode INT,
			AdvertAvailabilityId CHAR(3),
			AvailabilityDescription nvarChar(50),
			ForSaleYN BIT,
			ForRentYN BIT,
			ASAMemberYN BIT,
			ForLeaseYN BIT,
			NewYN BIT
		)
        
		INSERT INTO @tmpTable(AdvertId, AccountId, Title, ShortDescription, LongDescription, CatDesc, CategoryId, AdvertStatusId, StatusDesc, CountryId, 
		CountryName, CountryCurrency, EUYN, CurrencyDesc, DecimalUnicode, Manufacturer, ProductId, 
		Supplier, DateofRegistration, [Year], Age, Location, ShowPriceYN, CurrencyId
		, Price, PriceInEuro, Quantity, ContactName, Telephone, Fax, Mobile, URL, EmailAddress
		, Address, ExpiryDate, CreatedDate, LastModifiedDate, Owner, Counter, UserAccountTypeID, [GUID], GSETypeId, AdvertAvailabilityId, AvailabilityDescription,ForSaleYN,ForRentYN, ASAMemberYN, ForLeaseYN, NewYN,
		AdvertImageId, AdvertImageAdvertId, Description, [Image], ContentType, ImageCreatedDate, InUseYN, IsDefaultYN, StatusCode)    
		SELECT 
            a.*,
			i.[AdvertImageId] AS [AdvertImageId],
			i.[AdvertId] AS AdvertImageAdvertId,
			i.[Description] AS Description,
			i.[Image],
			i.[ContentType],
			i.[CreatedDate] AS ImageCreatedDate,
			i.[InUseYN],
			i.[IsDefaultYN],
			(SELECT TOP 1 StatusCode FROM AdvertTransaction t WHERE t.AdvertId = a.AdvertId AND t.AccountId = a.AccountId ORDER BY LastUpdate DESC) AS StatusCode
        FROM 
			dbo.vwAdverts a (NOLOCK)
		LEFT OUTER JOIN [AdvertImage] i (NOLOCK) ON i.AdvertId = A.AdvertId AND i.[InUseYN] = 1 AND i.[IsDefaultYN] = 1
        WHERE 
            [AccountId] = @AccountId

		SELECT * FROM (
			SELECT 
			ROW_NUMBER() OVER (ORDER BY ExpiryDate DESC) AS RowNumber, *
			FROM @tmpTable AS t
		) AS a
		WHERE a.RowNumber >= @RowStart AND a.RowNumber < (@RowStart + @RowsPerPage)
		
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
