SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DLGetNode] 
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            
			DECLARE @Index INT
			DECLARE @NodeCnt INT
			DECLARE @SelectionOrder INT

			-- Get the maximum indexId from the index
			SELECT	@Index = ISNULL(Max(IndexId), 0)
			FROM	DLDocumentIndex

			-- Work out have many data nodes are currently running
			SELECT	@NodeCnt = COUNT(DataNodeId)
			FROM	DLDataNode
			WHERE	PublishYN = 1

			-- Select the node using the Maximum IndexId and the node count
			SELECT	@SelectionOrder = @Index % @NodeCnt 

			-- Get the full path of the node
			SELECT	DataNodeId,
					PhysicalPath  
			FROM	DLDataNode
			WHERE	SelectionOrder = @SelectionOrder 
            
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
