SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAccountType] 
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY        
            SELECT
                [AccountTypeId],
                [AccountTypeName]
            FROM [dbo].[AccountType] (NOLOCK)
            WHERE [AccountTypeId] <> 0
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
