SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertQtysByAdvertId] 
(   
    @AdvertId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION   
             
			SELECT	Q.QuantityId,
					Q.Description QuantityDescription,
					AGQ.MetricValue
							
			FROM	AdvertGSE AG

			JOIN	Quantity Q
			ON		AG.GSETypeId = Q.GSETypeId 

			LEFT OUTER JOIN AdvertGSEQuantity AGQ
			ON		Q.GSETypeId = AGQ.GSETypeId 
			AND		Q.QuantityId = AGQ.QuantityId 
			AND		AGQ.AdvertId = AG.AdvertId 

			WHERE	AG.AdvertId = @AdvertId



            
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
