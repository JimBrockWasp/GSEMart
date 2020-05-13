SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelSpecOptions] 
(   
    @GSETypeId int,
    @SpecId CHAR(5)
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
        
            SELECT	SpecificationId,
					SpecificationOptionId,
					Description 
            FROM	SpecificationOption
            WHERE	GSETypeId = @GSETypeId 
            AND		SpecificationId = @SpecId
            AND		SpecificationOptionId <> 'ANY'
            
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
