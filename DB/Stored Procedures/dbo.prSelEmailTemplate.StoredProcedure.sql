SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Author: Suraj
--Date  : 22 Feb 2010
--Description : Select email template
CREATE PROCEDURE [dbo].[prSelEmailTemplate] 
(   
    @Code nvarchar(100)
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
          
            SELECT
                Id,
                [Text]
            FROM
                EmailTemplate
            WHERE
                Code = @Code
            
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
