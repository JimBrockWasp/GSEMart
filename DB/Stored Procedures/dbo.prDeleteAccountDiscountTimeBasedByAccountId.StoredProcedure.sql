SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prDeleteAccountDiscountTimeBasedByAccountId] 
(   
    @AccountId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
			BEGIN TRANSACTION
			
			--Archiving the discount records each time when user click to update the discount rate
			--in order to keeping track the discount pattern and monitoring purposes
			INSERT INTO AccountDiscountTimeBasedHistory(AccountDiscountTimeBasedId, AccountId, FromDate, ToDate, DiscountRate, LastUpdate, CreateDate, ArchiveDate)
			SELECT AccountDiscountTimeBasedId, AccountId, FromDate, ToDate, DiscountRate, LastUpdate, CreateDate, GETDATE() AS ArchiveDate
			FROM AccountDiscountTimeBased (NOLOCK)
			WHERE [AccountId] = @AccountId
			
            --Deleting records from main actual table after archiving
            DELETE FROM [AccountDiscountTimeBased] WHERE AccountId = @AccountId
            
            COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
