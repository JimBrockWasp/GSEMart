SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prUpdAccountImage]
(    
    @AccountId int,        
    @Image varbinary (max),
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
        
			-- Delete the existing image if one exists
			DELETE FROM AccountImage WHERE AccountId = @AccountId 
        
            INSERT INTO dbo.AccountImage
            (
                AccountId ,
                Image
            ) 
            VALUES 
            (
                @AccountId,
                @Image
            )
            
            -- Return 0 to the calling program to indicate success.
            SET @RespCode = 0
            SET @RespMsg = 'Account image has been uploaded succesfully.'
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
