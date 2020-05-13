SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prUpdAccountByAdmin]     
(
    @AccountId int,    
    @FullName nvarchar(100),
	@LastName nvarchar(20),
    @CompanyName  nvarchar(100),
    @Address  nvarchar(500),
	@PostCode nvarchar(20),
	@City nvarchar(200),
	@StateId char(2),
    @CountryId char(3),
    @Telephone  nvarchar(100), 
    @Fax  nvarchar(100),
    @Mobile  nvarchar(100),
    @SalesCode  nvarchar(10),
    @AccountStatusId NVARCHAR(2),
    @AccountTypeId INT,
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                
				IF @StateId = ''
				BEGIN 
					SET @StateId = NULL
				END

				--Update Account
                UPDATE dbo.[Account] 
                SET
                    [FullName] = @FullName,
					[LastName] = @LastName,
                    [CompanyName] = @CompanyName,
                    [Address] = @Address,
					[PostCode] = @PostCode,
					[City] = @City,
					[StateId] = @StateId,
                    [CountryId] = @CountryId,
                    [Telephone] = @Telephone,
                    [Fax] = @Fax,
                    [Mobile] = @Mobile,                                   
                    [SalesCode] = @SalesCode,
					[AccountStatusId] = @AccountStatusId,
                    [AccountTypeId] = @AccountTypeId,
                    [LastModifiedDate] = dbo.fnGetDate()
                WHERE 
                    [AccountId]= @AccountId 

                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Account has been updated succesfully. '           
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
