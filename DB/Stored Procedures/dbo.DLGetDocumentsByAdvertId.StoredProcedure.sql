SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DLGetDocumentsByAdvertId] 
(   
	@AdvertId nvarchar(20)
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            
            SELECT	IndexId,
					ObjectId AdvertId,
					FileName,
					Title,
					DN.PhysicalPath + FileName PhysicalPath,
					DN.VirtualPath + FileName VirtualPath
					
            FROM	DLDocumentIndex DI
            
            JOIN	DLDataNode DN
            ON		DI.DataNodeId = DN.DataNodeId 
            
            WHERE	ObjectId = @AdvertId
            AND		DocumentType = 'Advert'
            
            
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
