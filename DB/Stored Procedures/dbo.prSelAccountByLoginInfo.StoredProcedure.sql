SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAccountByLoginInfo] 
(   
    @EmailAddress nvarchar(50),
    @Password nvarchar(50)
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
                [Discount],
                [AccountTypeID]
            FROM [dbo].[Account]
            WHERE 
                [EmailAddress] = @EmailAddress
                AND [Password] = @Password
            
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
