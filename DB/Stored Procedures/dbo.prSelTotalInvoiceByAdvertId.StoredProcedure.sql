SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelTotalInvoiceByAdvertId](
	@AdvertId INT
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		
		SELECT
		(
			SELECT COUNT(1) AS total
			FROM 
				AdvertInvoice i
			WHERE
				i.AdvertId = @AdvertId
				AND i.InvoiceStatusId = 1
		) + 
		(
			SELECT COUNT(1) AS total
			FROM 
				AdvertInvoice i
			LEFT OUTER JOIN AdvertTransaction t ON i.AdvertTransactionId = t.AdvertTransactionId
			WHERE
				i.AdvertId = @AdvertId
				AND i.InvoiceStatusId = 2
				AND t.StatusCode = 2
		) AS total
	
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
