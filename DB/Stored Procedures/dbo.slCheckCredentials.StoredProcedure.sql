SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slCheckCredentials] 
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
                FullName,
                LastName,
                CompanyName,
                CASE 
                WHEN TenderYN = 1 THEN 'Yes' ELSE 'No' 
                END Tenders,
                CASE
                WHEN NewYN = 1 THEN 'Yes' ELSE 'No' 
                END NewYN,
                MaxAdverts,
                ExpiryDate,
                AC.AccountStatusId,
                AC.Description AccountStatusDescription,
                CompanyWebsite URL,
                FullName ContactName,
                EmailAddress,
                Telephone
                
                
            FROM Account A
            
            JOIN AccountStatus AC
            ON	A.AccountStatusId = AC.AccountStatusId
            
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
