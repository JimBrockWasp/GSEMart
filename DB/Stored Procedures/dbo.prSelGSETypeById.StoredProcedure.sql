SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelGSETypeById]
(   
    @GSETypeId int
)

AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            SELECT 
                GSETypeId,
                [Description]
            FROM
                GSEType
            WHERE GSETypeId = @GSETypeId
            ORDER BY DisplayOrder
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
