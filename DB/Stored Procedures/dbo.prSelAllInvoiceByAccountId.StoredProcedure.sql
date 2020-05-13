SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAllInvoiceByAccountId]     
(    
	@AccountId INT
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                
			SELECT
			i.AdvertInvoiceId,
			i.AdvertId,
			i.CurrencyId,
			i.Amount,
			i.Description,
			ISNULL(i.AdvertTransactionId, 0) AS AdvertTransactionId,
			i.InvoiceStatusId,
			isc.InvoiceStatusDesc,
			CASE
				WHEN ISNULL(i.AdvertTransactionId, 0) <> 0 AND t.StatusCode = 0 THEN 'Not Specified'
				WHEN ISNULL(i.AdvertTransactionId, 0) <> 0 AND t.StatusCode = 1 THEN 'Unpaid'
				WHEN ISNULL(i.AdvertTransactionId, 0) <> 0 AND t.StatusCode = 2 THEN 'Paid'
				WHEN ISNULL(i.AdvertTransactionId, 0) <> 0 AND t.StatusCode = 3 THEN 'Failed'
				WHEN i.InvoiceStatusId = 1 AND i.PremiumAccountInvoiceStatusId = 1 THEN 'Unpaid'
				WHEN i.InvoiceStatusId = 1 AND i.PremiumAccountInvoiceStatusId = 2 THEN 'Paid'
				ELSE '-'
			END AS StatusCode,
			i.LastUpdate,
			i.CreateDate
			FROM AdvertInvoice i
			INNER JOIN InvoiceStatusCode isc ON i.InvoiceStatusId = isc.InvoiceStatusId
			LEFT OUTER JOIN AdvertTransaction t ON i.AdvertTransactionId = t.AdvertTransactionId
			WHERE i.AccountId = @AccountId
			AND
			(
				(i.InvoiceStatusId = 2 AND t.StatusCode = 2) --Success credit card processing
				OR
				(i.InvoiceStatusId = 1)
			)
			ORDER BY i.LastUpdate DESC

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
