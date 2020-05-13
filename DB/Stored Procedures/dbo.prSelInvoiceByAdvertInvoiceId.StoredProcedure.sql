SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelInvoiceByAdvertInvoiceId]       
(  
    @AdvertInvoiceId INT
)  
AS  
BEGIN  
    SET NOCOUNT ON     
    BEGIN TRY          
        BEGIN TRANSACTION          
                SELECT
                AdvertInvoiceId,
                AdvertId,
                AccountId,
                CurrencyId,
                ISNULL(Net, 0) AS Net,
                ISNULL(Vat, 0) AS Vat,
                ISNULL(Amount, 0) AS Amount,
                Description,
                InvoiceStatusId,
                MonthCount,
                CreateDate,
                LastUpdate
                FROM AdvertInvoice i
                WHERE AdvertInvoiceId = @AdvertInvoiceId
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
