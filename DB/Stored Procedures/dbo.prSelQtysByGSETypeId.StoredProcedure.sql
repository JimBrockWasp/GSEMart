SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelQtysByGSETypeId] 
(   
    @GSETypeId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
        
            SELECT	Q.QuantityId,
					Q.Description,
					Q.GSETypeId,
					QU.ShortDescription  MetricUnitDescription,
					QUI.ShortDescription  ImperialUnitDescription,
					QUI.MetricConversionRatio MetricConversionRatio
					 
            FROM	Quantity Q
            
            JOIN	QuantityUnit QU
            ON		Q.QuantityId = QU.QuantityId 
            AND		Q.GSETypeId = QU.GSETypeId 
            AND		QU.MetricYN = 1
            
            LEFT OUTER JOIN QuantityUnit QUI
            ON		Q.QuantityId = QUI.QuantityId 
            AND		Q.GSETypeId = QUI.GSETypeId 
            AND		QUI.MetricYN = 0
            
            
            WHERE	Q.GSETypeId = @GSETypeId 
                
            
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
