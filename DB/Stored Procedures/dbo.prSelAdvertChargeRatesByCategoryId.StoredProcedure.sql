SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertChargeRatesByCategoryId](
	@CurrencyId Char(3),
	@AdvertCategoryId Char(2)
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
            SELECT                         
                [ChargeRateId],
		        [Description],
		        [MonthCount],
		        [CategoryId],
		        [CurrencyId],
		        [Rate],
		        [FreeYN],
		        [UntilYouBuyYN]
            FROM [dbo].[AdvertChargeRates]
			WHERE [CategoryId] = @AdvertCategoryId
			AND CurrencyId = @CurrencyId
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
