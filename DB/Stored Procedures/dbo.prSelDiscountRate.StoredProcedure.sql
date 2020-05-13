SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelDiscountRate] 
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY      
            SELECT
                [DiscountRateId],
                [DiscountRate],
                [LastUpdate],
                [CreateDate]
            FROM [dbo].[DiscountRate] (NOLOCK)
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
