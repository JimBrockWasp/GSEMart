SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAccountDiscountTimeBasedByAccountId] 
(   
    @AccountId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY    
            SELECT 
                [AccountDiscountTimeBasedId],
                [AccountId],
                [FromDate],
                [ToDate],
                [DiscountRate],
                [LastUpdate],
                [CreateDate]
            FROM [dbo].[AccountDiscountTimeBased] (NOLOCK)
            WHERE 
                [AccountId] = @AccountId
            ORDER BY [FromDate] ASC
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
