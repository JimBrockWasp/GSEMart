SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelSiteHitCount]     

AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
               SELECT COUNT(1) + 4500 AS 'HitCount' FROM SiteHitCounter      
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
