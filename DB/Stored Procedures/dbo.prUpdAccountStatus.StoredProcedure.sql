SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prUpdAccountStatus] 
(   
    @EmailAddress nvarchar(50),
    @AccountStatusId char(2),
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            DECLARE @AccountId int
            SELECT 
                @AccountId = [AccountId]
            FROM [dbo].[Account]                                                                
            WHERE 
                [EmailAddress] = @EmailAddress
        
            UPDATE [dbo].[Account]                
            SET
                [AccountStatusId] = @AccountStatusId,
                [LastModifiedDate] = dbo.fnGetDate()                                            
            WHERE 
                [EmailAddress] = @EmailAddress
                
            --Add into AccountStatusHistory table
            INSERT INTO dbo.[AccountStatusHistory] 
            (
                [AccountId],                     
                [HistoryDate],
                [AccountStatusId]
            )
            VALUES
            (
                @AccountId,
                dbo.fnGetDate(),
                @AccountStatusId
            )

            -- Return 0 to the calling program to indicate success.
            SET @RespCode = 0
            SET @RespMsg = 'Account status has been updated succesfully. '
            
            
            
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
