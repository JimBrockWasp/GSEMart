SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[prDelAdvert]     
(
    @AdvertId int
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
        
                DELETE FROM [AdvertImage] WHERE AdvertId = @AdvertId
				DELETE FROM AdvertInvoice WHERE AdvertId = @AdvertId
				DELETE FROM AdvertPaymentTransactions WHERE AdvertId = @AdvertId
				DELETE FROM AdvertTransaction  WHERE AdvertId = @AdvertId
				DELETE FROM AdvertStatusHistory  WHERE AdvertId = @AdvertId
				DELETE FROM AdvertGSEQuantity  WHERE AdvertId = @AdvertId
				DELETE FROM AdvertGSESpecification  WHERE AdvertId = @AdvertId
				DELETE FROM AdvertGSEFeature  WHERE AdvertId = @AdvertId
				DELETE FROM AdvertGSE  WHERE AdvertId = @AdvertId
				DELETE FROM Advert  WHERE AdvertId = @AdvertId
                        
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
