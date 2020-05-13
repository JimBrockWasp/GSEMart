SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[slInsertAccountImage] 
(    
    @AccountId int,        
    @Image varbinary (max)
)
AS
BEGIN

    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
        
			UPDATE AccountImage
			SET Image = @Image
			WHERE AccountId = @AccountId         
        
			-- If no row was updated then there was no record for this account so insert one
			IF @@ROWCOUNT = 0
			BEGIN
				INSERT INTO dbo.[AccountImage]
				(
					[AccountId],
					[Image]
				) 
				VALUES 
				(
					@AccountId,
					@Image
				)
			END
          
            
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
