SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DLDeleteIndex] 
(   
    @IndexId INT    
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            
            DECLARE @PhysicalPath NVARCHAR(200)
            
            -- Get the physical path to the document
            SELECT	@PhysicalPath = PhysicalPath + FileName
            
            FROM	DLDocumentIndex DI
            
            JOIN	DLDataNode DN
            ON		DI.DataNodeId = DN.DataNodeId
            
            WHERE	IndexId = @IndexId
            
            
			-- Delete the record from the document index
			DELETE FROM DLDocumentIndex
			WHERE	IndexId = @IndexId
			
			-- Return the identity column created
			SELECT @PhysicalPath FullFilePath
            
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
