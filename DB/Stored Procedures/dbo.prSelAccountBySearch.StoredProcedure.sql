SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAccountBySearch] 
(   
    @EmailAddress nvarchar(50) = null,    
    @FullName nvarchar(100)  = null,
	@LastName nvarchar(100)  = null,
    @CompanyName nvarchar(100)  = null,
    @Address nvarchar(500)  = null,
    @CountryID char(3)  = null,
    @AccountStatusID char(2)  = null,
    @SalesCode  nvarchar(10) =null,
    @VATNumber  nvarchar(50) =null,
    @VATNumberStatusId  char(2) =null,
    @SearchAllFor nvarchar(255) = null
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            SELECT 
                [AccountId],
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
                [Discount]
            FROM [dbo].[Account]
            WHERE 
            (
                (@EmailAddress = '' OR @EmailAddress IS NULL OR [EmailAddress] LIKE '%' +  @EmailAddress +'%') AND
                (@FullName = '' OR @FullName IS NULL OR [FullName] LIKE '%'+ @FullName +'%') AND
				(@LastName = '' OR @LastName IS NULL OR [LastName] LIKE '%'+ @LastName +'%') AND
                (@CompanyName = '' OR @CompanyName IS NULL OR [CompanyName] LIKE '%'+ @CompanyName +'%') AND
                (@Address = '' OR @Address IS NULL OR [Address] LIKE '%'+ @Address +'%') AND
                (@CountryID = '' OR @CountryID IS NULL OR [CountryID] =@CountryID) AND
                (@AccountStatusID = '' OR @AccountStatusID IS NULL OR [AccountStatusID] = @AccountStatusID ) AND
                (@SalesCode = '' OR @SalesCode IS NULL OR [SalesCode] = @SalesCode) AND
                (@VATNumber = '' OR @VATNumber IS NULL OR [VATNumber] = @VATNumber) AND
                (@VATNumberStatusId = '' OR @VATNumberStatusId IS NULL OR [VATNumberStatusId] = @VATNumberStatusId) AND
                @SearchAllFor IS NULL
            )
            OR
            ( 
                (
                    ([EmailAddress] LIKE '%'+ @SearchAllFor +'%') OR
                    ([FullName] LIKE '%'+ @SearchAllFor +'%') OR
                    ([CompanyName] LIKE '%'+ @SearchAllFor +'%') OR
                    ([Address] LIKE '%'+ @SearchAllFor +'%') 
                ) 
                AND @SearchAllFor IS NOT NULL 
            )
            
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
