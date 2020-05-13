SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelLastCreditCardInvoiceByAdvertId]
(    
	@AdvertId INT
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        

				SELECT
				TOP 1
				AdvertInvoiceId,
				AdvertId,
				AccountId,
				AdvertTransactionId,
				InvoiceStatusId,
				MonthCount
				FROM AdvertInvoice i
				WHERE i.AdvertId = @AdvertId
				AND i.InvoiceStatusId = 2 -- Credit Card only
				AND i.AdvertTransactionId IS NOT NULL
				AND i.AdvertTransactionId <> 0
				ORDER BY LastUpdate DESC
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
