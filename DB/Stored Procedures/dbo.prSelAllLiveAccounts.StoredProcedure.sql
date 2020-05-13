SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAllLiveAccounts] 

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY     
            SELECT DISTINCT
                A.AccountId,
                A.EmailAddress,
                FullName,
				LastName,
                CompanyName,
                A.Address,
				PostCode,
				City,
				StateId,
                A.CountryId,
                A.Telephone,
                A.Fax,
                A.Mobile,
                Password,
                AccountStatusId,
                SalesCode,
                VATNumber,
                VATNumberStatusId,
                Discount,
                AccountTypeID,
                Profile,
                CompanyWebsite
                
            FROM dbo.Account A (NOLOCK)
            
            JOIN Advert ON 
            A.AccountId = Advert.AccountId 
            WHERE (Advert.AdvertStatusId = 'CR' AND (Advert.ExpiryDate > GETDATE() OR Advert.ExpiryDate IS NULL))
            AND AccountStatusId = 'CF'
            AND (A.ExpiryDate > GETDATE() OR A.ExpiryDate IS NULL)
            
            
            
            ORDER By CompanyName 
		
            
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
