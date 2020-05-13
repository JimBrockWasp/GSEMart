SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slUpdateLoginCredentials]
(
    @AccountId int,    
    @EmailAddress nvarchar(50),
    @Password nvarchar(100)
	
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION

				--Update Account
                UPDATE dbo.[Account] 
                SET
                    EmailAddress = @EmailAddress,
                    Password = @Password

                WHERE 
                    [AccountId]= @AccountId 

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
