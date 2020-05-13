SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prUpdAdvert]     
(
    @AdvertId INT,
    @AccountId int,
	@Title nvarchar(100),
	@ShortDescription nvarchar(255),
	@LongDescription nvarchar(4000),
	@CategoryId char(2),
	@CountryId char(3),
	@Location nvarchar(100),
	@ShowPriceYN bit,
	@CurrencyId nvarchar(10),
	@Price money,	
	@Quantity INT,
	@Age INT,
	@ContactName nvarchar(100),
	@Telephone nvarchar(100),
	@Fax nvarchar(100),
	@Mobile nvarchar(100),
	@URL nvarchar(100),
	@EmailAddress nvarchar(50),
	@Address nvarchar(500),
	@ExpiryDate datetime,
	@AgreedTCYN BIT,
	@FullText TEXT,
	@UserAccountTypeID INT,
	@GUID VARCHAR(100),
	@NewYN BIT,
    @OutAdvertId int output,
    @RespCode int output,    
    @RespMsg  varchar(500) output
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
			        [CategoryId] = @CategoryId,
			        [CountryId] = @CountryId,
			        [Location] = @Location,
					[ShowPriceYN] = @ShowPriceYN,
			        [CurrencyId] = @CurrencyId,
			        [Price] = @Price,
			        [Quantity] = @Quantity,
			        [Age] = @Age,
			        [ContactName] = @ContactName,
			        [Telephone] = @Telephone,
			        [Fax] = @Fax,
			        [Mobile] = @Mobile,
			        [URL] = @URL,
			        [EmailAddress] = @EmailAddress,
			        [Address] = @Address,
			        [ExpiryDate] = @ExpiryDate,
			        [LastModifiedDate] = GETDATE(),
			        [AgreedTCYN] = @AgreedTCYN,
			        [FullText] = @FullText,
			        [UserAccountTypeID] = @UserAccountTypeID,
			        [GUID] = @GUID,
			        [NewYN]= @NewYN
			    WHERE AccountId = @AccountId
			    AND AdvertId = @AdvertId
			    
			    SET @OutAdvertId = @AdvertId
			    
                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Advert has been updated succesfully.'
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
