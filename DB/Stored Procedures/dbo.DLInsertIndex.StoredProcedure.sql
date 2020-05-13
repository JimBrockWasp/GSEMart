SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DLInsertIndex] 
(   
    @ObjectId INT,
    @DocumentType nvarchar(10),
    @dataNodeId INT,
    @fileName nvarchar(100),
    @title nvarchar(100)
    
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            
			-- Insert a record into the document index
			INSERT INTO DLDocumentIndex 
				(
					ObjectId,
					DocumentType,
					DataNodeId, 
					FileName, 
					Title
				)
			VALUES
				(
					@ObjectId,
					@DocumentType,
					@dataNodeId,
					@fileName,
					@title
				)

			-- Return the identity column created
			SELECT @@IDENTITY IndexId

            
            
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
