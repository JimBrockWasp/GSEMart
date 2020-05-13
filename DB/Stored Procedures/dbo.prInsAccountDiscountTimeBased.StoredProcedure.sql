SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsAccountDiscountTimeBased]     
(
    @AccountId INT,
    @FromDate DATETIME,
    @ToDate DATETIME,
    @DiscountRate INT,
    @LastUpdate DATETIME,
    @CreateDate DATETIME, 
    @AccountDiscountTimeBasedId int output,
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                --Add Account
                INSERT INTO [AccountDiscountTimeBased] 
                (
                    [AccountId],
                    [FromDate],
                    [ToDate],
                    [DiscountRate],
                    [LastUpdate],
                    [CreateDate]
                ) 
                VALUES 
                (
                    @AccountId,
                    @FromDate,
                    @ToDate,
                    @DiscountRate,
                    @LastUpdate,
                    @CreateDate
                )

                SET @AccountDiscountTimeBasedId =  SCOPE_IDENTITY()

                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Account has been created succesfully. Please check your mail box for account confirmation link.'           
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
