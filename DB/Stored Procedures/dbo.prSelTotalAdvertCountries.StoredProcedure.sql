SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prSelTotalAdvertCountries]

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		SELECT COUNT(DISTINCT a.CountryId) Total
            
        FROM 
			dbo.vwAdverts a (NOLOCK)
		
		JOIN Account
		ON a.AccountId = Account.AccountId	
		
		WHERE
			((Account.ExpiryDate >= GETDATE()) OR Account.ExpiryDate IS NULL)
		AND ((A.AdvertStatusId IN ('CR', 'PL')))


    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END


GO
