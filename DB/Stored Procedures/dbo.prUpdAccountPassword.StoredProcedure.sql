SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prUpdAccountPassword] 
(   
    @AccountId int,
    @Password nvarchar(50),
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION                    
            UPDATE [dbo].[Account]                
            SET
                [Password] = @Password,
                [LastModifiedDate] = dbo.fnGetDate()                                            
            WHERE 
                [AccountId] = @AccountId                
            
            -- Return 0 to the calling program to indicate success.
            SET @RespCode = 0
            SET @RespMsg = 'Account password has been updated succesfully. '
            
            
            
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
