SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelTotalAdvertQuantity]
(   
    @NewYN BIT
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		SELECT
            SUM(Quantity) AS total
        FROM 
			dbo.vwAdverts a (NOLOCK)
		WHERE
			(ExpiryDate >= GETDATE() OR ExpiryDate IS NULL)
		AND ((A.AdvertStatusId = 'SL' AND DATEADD(dd,7,LastModifiedDate) >= GETDATE()) OR (A.AdvertStatusId IN ('CR', 'PL')))
		AND NewYN = @NewYN

    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END


GO
