SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[slAddBlankAdvert]     
(
    @AccountId int,
    @GSETypeId Int,
    @Manufacturer NVARCHAR(200),
    @Title NVARCHAR(100),
    @ShortDescription NVARCHAR(255),
    @LongDescription NVARCHAR(4000),
    @ForLeaseYN BIT,
    @ForRentYN BIT,
    @ForSaleYN BIT,
    @NewYN BIT,
    @AdvertAvailabilityId CHAR(3),
	@CountryId CHAR(3),
	@ContactName NVARCHAR(100),
	@Telephone NVARCHAR(100),
	@URL NVARCHAR(100),
	@EmailAddress NVARCHAR(50),
	@ShowPriceYN BIT,
	@Price MONEY = Null,
	@CurrencyID NVARCHAR(10) = Null,
	@Location NVARCHAR(100),
	@Year NVARCHAR(200)

    )
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
        
				DECLARE @AdvertId INT
        
                --Add Advert 
                INSERT INTO [Advert] 
                (
                    [AccountId],
			        [Title],
			        [ShortDescription],
			        [LongDescription],
			        [CategoryId],
			        [AdvertStatusId],
			        [CountryId],
			        [Location],
					[ShowPriceYN],
					[Price],
					[CurrencyId],					
			        [Quantity],
			        [ContactName],
			        [Telephone],
			        [URL],
			        [EmailAddress],
			        [AgreedTCYN],
			        [UserAccountTypeID],
			        [URLClickThrough],
			        NewYN,
			        [CreatedDate],
			        LastModifiedDate
			  
                ) 
                VALUES 
                (
                    @AccountId,
			        @Title,
			        @ShortDescription,
			        @LongDescription,
			        'GS',
			        'NP',
			        @CountryId,
			        @Location,
					@ShowPriceYN,
					@Price,
					@CurrencyID,
			        1,
			        @ContactName,
			        @Telephone,
			        @URL,
			        @EmailAddress,
			        1,
                    2,
                    0,
                    @NewYN,
                    GETDATE(),
                    GETDATE()
                    
                )

                SET @AdvertId =  SCOPE_IDENTITY()

				INSERT INTO AdvertGSE(
					AdvertId,
					Manufacturer,
					GSETypeId,
					AdvertAvailabilityId,
					ForLeaseYN,
					ForRentYN,
					ForSaleYN,
					[Year]
					
				)
				VALUES
				(
					@AdvertId,
					@Manufacturer,
					@GSETypeId,
					@AdvertAvailabilityId,
					@ForLeaseYN,
					@ForRentYN,
					@ForSaleYN,
					@Year
				)

				SELECT @AdvertId AdvertId

        COMMIT
    END TRY
    BEGIN CATCH
        IF (@@TRANCOUNT > 0)
        BEGIN  
            ROLLBACK
        END 
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH           
END


GO
