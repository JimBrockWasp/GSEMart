SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelDiscountRateByDiscountRateId](
	@DiscountRateId INT,
	@DiscountRate INT OUTPUT
) 
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY      
            SET @DiscountRate = (SELECT
                TOP 1 [DiscountRate]
            FROM [dbo].[DiscountRate] (NOLOCK)
			WHERE DiscountRateId = @DiscountRateId)
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END


GO
