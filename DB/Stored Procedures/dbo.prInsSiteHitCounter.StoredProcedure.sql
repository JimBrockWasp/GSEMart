SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsSiteHitCounter]     
(
    @VisitorBrowser nvarchar(200),
	@IPAddress nvarchar(100),
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                --Add SiteHitCounter
                INSERT INTO [SiteHitCounter] 
                (
                    [VisitorBrowser],
			        [IPAddress]
                ) 
                VALUES 
                (
                    @VisitorBrowser,
			        @IPAddress
                )

                 -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Hit Counter update.'           
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
