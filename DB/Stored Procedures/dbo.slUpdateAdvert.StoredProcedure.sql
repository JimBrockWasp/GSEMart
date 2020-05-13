SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[slUpdateAdvert]     
(
    @AdvertId INT,
    @Title nvarchar(100),
	@ShortDescription nvarchar(255),
	@LongDescription nvarchar(4000),
	@CountryId char(3),
	@Location nvarchar(100),
	@ShowPriceYN bit,
	@CurrencyId nvarchar(10) = Null,
	@Price money = Null,	
	@Quantity INT,
	@ContactName nvarchar(100),
	@Telephone nvarchar(100),
	@URL nvarchar(100),
	@EmailAddress nvarchar(50),
	@NewYN BIT,
	@Year INT,
	@AdvertStatusId CHAR(2),
	@AdvertAvailabilityId CHAR(3),
	@Manufacturer nvarchar(200),
	@ForLeaseYN BIT,
	@ForSaleYN BIT,
	@ForRentYN BIT
	
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                --Add Advert 
                Update [Advert] 
                SET 
			        [Title] = @Title,
			        [ShortDescription] = @ShortDescription,
			        [LongDescription] = @LongDescription,
			        [CategoryId] = 'GS',
			        [CountryId] = @CountryId,
			        [Location] = @Location,
					[ShowPriceYN] = @ShowPriceYN,
			        [CurrencyId] = @CurrencyId,
			        [Price] = @Price,
			        [Quantity] = @Quantity,
			        [ContactName] = @ContactName,
			        [Telephone] = @Telephone,
			        [URL] = @URL,
			        [EmailAddress] = @EmailAddress,
			        [LastModifiedDate] = GETDATE(),
			        [NewYN]= @NewYN,
			        AdvertStatusId = @AdvertStatusId
			        
			    WHERE AdvertId = @AdvertId
			    
			    UPDATE AdvertGSE
			    SET
						Manufacturer = @Manufacturer,
						[Year]= @Year,
						AdvertAvailabilityId = @AdvertAvailabilityId,
						ForLeaseYN = @ForLeaseYN,
						ForRentYN = @ForRentYN,
						ForSaleYN = @ForSaleYN
			    			    
			    WHERE AdvertId = @AdvertId
			    
			    
			    
			    
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
