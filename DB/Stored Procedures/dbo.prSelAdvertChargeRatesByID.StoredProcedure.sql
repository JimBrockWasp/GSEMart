SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertChargeRatesByID] 
(
    @ChargeRateId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
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
            WHERE
			    [ChargeRateId] = @ChargeRateId
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
