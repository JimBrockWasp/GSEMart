SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prInsAdvert]     
(
    @AccountId int,
	@Title nvarchar(100),
	@ShortDescription nvarchar(255),
	@LongDescription nvarchar(4000),
	@CategoryId char(2),
	@AdvertStatusId char(2),
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
	@Owner nvarchar(100),
	@FullText TEXT,
	@UserAccountTypeID INT,
	@GUID VARCHAR(100),
	@NewYN BIT,
    @AdvertId int output,
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
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
			        [CurrencyId],
			        [Price],
			        [Quantity],
			        [Age],
			        [ContactName],
			        [Telephone],
			        [Fax],
			        [Mobile],
			        [URL],
			        [EmailAddress],
			        [Address],
			        [ExpiryDate],
			        [CreatedDate],
			        [LastModifiedDate],
			        [AgreedTCYN],
			        [Owner],
			        [FullText],
			        [UserAccountTypeID],
			        [URLClickThrough],
			        [GUID],
			        NewYN
			  
                ) 
                VALUES 
                (
                    @AccountId,
			        @Title,
			        @ShortDescription,
			        @LongDescription,
			        @CategoryId,
			        @AdvertStatusId,
			        @CountryId,
			        @Location,
					@ShowPriceYN,
			        @CurrencyId,
			        @Price,
			        @Quantity,
			        @Age,
			        @ContactName,
			        @Telephone,
			        @Fax,
			        @Mobile,
			        @URL,
			        @EmailAddress,
			        @Address,
			        @ExpiryDate,
                    dbo.fnGetDate(),
                    dbo.fnGetDate(),
                    @AgreedTCYN,
                    @Owner,
                    @FullText,
                    @UserAccountTypeID,
                    0,
                    @GUID,
                    @NewYN
                )

                SET @AdvertId =  SCOPE_IDENTITY()

				INSERT INTO AdvertStatusHistory(
					AdvertId,
					[DateTime],
					AdvertStatusId
				)VALUES(
					@AdvertId,
					GETDATE(),
					'CR'
				)
                
                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Advert has been created succesfully.'
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
