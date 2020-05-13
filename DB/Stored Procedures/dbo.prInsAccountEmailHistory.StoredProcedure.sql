SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsAccountEmailHistory]     
(
    @AccountId int,
    @DateSent datetime,
    @EmailAddress nvarchar(50),
    @Subject  nvarchar(200), 
    @Message  nvarchar(2000),
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                --Add History
                INSERT INTO [AccountEmailHistory] 
                (
                    [AccountId],
                    [EmailAddress],                   
                    [DateSent],
                    [Subject],
                    [Message]                   
                ) 
                VALUES 
                (
                    @AccountId,
                    @EmailAddress,                   
                    dbo.fnGetDate(),
                    @Subject,
                    @Message
                )
                
                  -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Account Email History has been created succesfully.'           
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
