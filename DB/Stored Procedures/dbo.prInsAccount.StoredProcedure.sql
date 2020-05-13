SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsAccount]     
(
    @EmailAddress nvarchar(50),
    @FullName nvarchar(100),
	@LastName nvarchar(100),
    @CompanyName  nvarchar(100),
    @Address  nvarchar(500),
	@PostCode nvarchar(20),
	@City nvarchar(200),
	@StateId char(2),
    @CountryId char(3),
    @Telephone  nvarchar(100), 
    @Fax  nvarchar(100),
    @Mobile  nvarchar(100),
    @Password  nvarchar(50),
    @AccountStatusId  char(2),
    @SalesCode  nvarchar(10),
    @VATNumber  nvarchar(50),
    @VATNumberStatusId  char(2), 
    @Discount tinyint,
    @ConfirmationCode   nvarchar(50),
    @AgreedTCYN BIT,
    @AccountTypeId INT,
    @AccountId int output,
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                --Add Account
                INSERT INTO [Account] 
                (
                    [EmailAddress],
                    [FullName],
					[LastName],
                    [CompanyName],
                    [Address],
					[PostCode],
					[City],
					[StateId],
                    [CountryId],
                    [Telephone],
                    [Fax],
                    [Mobile],
                    [Password],
                    [AccountStatusId],
                    [SalesCode],
                    [VATNumber],
                    [VATNumberStatusId],
                    [Discount],
                    [CreatedDate],
                    [LastModifiedDate],
                    [AgreedTCYN],
                    [AccountTypeID]
                ) 
                VALUES 
                (
                    @EmailAddress,
                    @FullName,
					@LastName,
                    @CompanyName,
                    @Address,
					@PostCode,
					@City,
					@StateId,
                    @CountryId,
                    @Telephone,
                    @Fax,
                    @Mobile,
                    @Password,
                    @AccountStatusId,
                    @SalesCode,
                    @VATNumber,
                    @VATNumberStatusId,
                    @Discount,
                    dbo.fnGetDate(),
                    dbo.fnGetDate(),
                    @AgreedTCYN,
                    @AccountTypeId
                )

                SET @AccountId =  SCOPE_IDENTITY()
                
                --Add into AccountConfirmationAudit table
                INSERT INTO dbo.[AccountConfirmationAudit] 
                (
                    [EmailAddress],                     
                    [ConfirmationCode],
                    [ConfirmedYN]
                )
                VALUES
                (
                    @EmailAddress,
                    @ConfirmationCode,
                    0
                )
                
                --Add into AccountStatusHistory table
                INSERT INTO dbo.[AccountStatusHistory] 
                (
                    [AccountId],                     
                    [HistoryDate],
                    [AccountStatusId]
                )
                VALUES
                (
                    @AccountId,
                    dbo.fnGetDate(),
                    @AccountStatusId
                )

                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Account has been created succesfully. Please check your mail box for account confirmation link.'           
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
