SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsAdvertInvoice]     
(    
	@AdvertId INT,	
	@AccountId INT,
	@CurrencyId NVARCHAR(10),
	@Net DECIMAL(15,2),	
	@Vat DECIMAL(15,2),	
	@Amount DECIMAL(15,2),	
	@Description NVARCHAR(500),
	@AdvertTransactionId INT,
	@InvoiceStatusId INT,
	@MonthCount INT,
	@PremiumAccountInvoiceStatusId INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                
				IF @AdvertTransactionId = 0
				BEGIN
					SET @AdvertTransactionId = NULL
				END
				
                INSERT INTO [AdvertInvoice] 
                (
					AdvertId,
					AccountId,
					CurrencyId,
					Net,
					Vat,
					Amount,
					Description,
					AdvertTransactionId,
					InvoiceStatusId,
					MonthCount,
					PremiumAccountInvoiceStatusId,
					CreateDate,
					LastUpdate
                ) 
                VALUES 
                (
					@AdvertId,
					@AccountId,
					@CurrencyId,
					@Net,
					@Vat,
					@Amount,					
					@Description,
					@AdvertTransactionId,
					@InvoiceStatusId,
					@MonthCount,
					@PremiumAccountInvoiceStatusId,
					GETDATE(),
					GETDATE()
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
