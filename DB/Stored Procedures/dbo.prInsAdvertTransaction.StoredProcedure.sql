SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsAdvertTransaction]     
(    
	@VendorTransactionCode NVARCHAR(100),
	@AdvertId INT,	
	@AccountId INT,
	@ChargeRateId INT,
	@CreditCardNumber NVARCHAR(50),
	@Description NVARCHAR(500),
	@CurrencyId NVARCHAR(10),
	@AmountSubmit DECIMAL(15,2),
	@CustomerEmailAddress NVARCHAR(50),
	@CustomerName NVARCHAR(100),
	@TransactionCode NVARCHAR(50),
	@AdvertTransactionId INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                --Add Advert 
                INSERT INTO [AdvertTransaction] 
                (
                    VendorTransactionCode,
					AdvertId,
					AccountId,
					ChargeRateId,
					CreditCardNumber,
					Description,
					CurrencyId,
					AmountSubmit,
					AmountPaid,
					CustomerEmailAddress,
					CustomerName,
					StatusCode,
					TransactionCode,
					CreateDate,
					LastUpdate
                ) 
                VALUES 
                (
					@VendorTransactionCode,
					@AdvertId,
					@AccountId,
					@ChargeRateId,
					@CreditCardNumber,
					@Description,
					@CurrencyId,
					@AmountSubmit,
					0, --Always 0.00 before transaction successful
					@CustomerEmailAddress,
					@CustomerName,
					1, -- Always 1 before transaction successful
					@TransactionCode,
					GETDATE(),
					GETDATE()
                )

				SET @AdvertTransactionId = SCOPE_IDENTITY()
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
