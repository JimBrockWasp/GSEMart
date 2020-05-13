SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelLastTransactionByAdvertId]
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
				AdvertTransactionId,
				VendorTransactionCode,
				AdvertId,
				AccountId,
				ChargeRateId,
				Description,
				CurrencyId,
				AmountSubmit
				FROM AdvertTransaction t
				WHERE t.AdvertId = @AdvertId
				AND AmountPaid = 0
				AND StatusCode IN (1,3) -- Still Pending Status
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
