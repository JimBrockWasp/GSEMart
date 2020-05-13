SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAccountsWithAdverts] 
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION    
            
			SELECT DISTINCT
					A.AccountId,
					CompanyName
			FROM	[dbo].[Account] A WITH (NOLOCK)

			JOIN	Advert Ad WITH (NOLOCK)
			ON		A.AccountId = Ad.AccountId

			LEFT OUTER JOIN AccountImage AI
			ON		A.AccountId = AI.AccountId

			WHERE	AccountTypeID IN (1,2,3)
			AND		AccountStatusId <> 'OH'
			AND		(A.ExpiryDate > GETDATE() OR A.ExpiryDate IS NULL)

			AND		Ad.AdvertStatusId ='PL'
			
			AND		AI.Image IS NOT NULL

			ORDER By CompanyName 

			            
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
