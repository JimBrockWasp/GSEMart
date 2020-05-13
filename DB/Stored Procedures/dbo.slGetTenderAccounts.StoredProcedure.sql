SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slGetTenderAccounts] 
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        

			SELECT	AccountId,
					CompanyName,
					FullName + ' ' + LastName ContactName,
					EmailAddress,
					ExpiryDate,
					AT.AccountTypeName,
					AST.Description AccountStatus,
					TenderYN
					
			
			FROM	Account A
			
			JOIN	AccountType AT
			ON		A.AccountTypeID = AT.AccountTypeID
			
			JOIN	AccountStatus AST
			ON		A.AccountStatusId = AST.AccountStatusId

			-- Promotional or Standard Live Accounts
			WHERE	A.AccountTypeID IN (1,2,3)
			
			-- Confirmed
			AND		A.AccountStatusId = 'CF'
			
			-- Not Expired
			AND		((A.ExpiryDate IS NULL) OR (A.ExpiryDate>GETDATE()))
			
			-- Subscribed to the Tender Account
			AND		A.TenderYN = 1
			

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
