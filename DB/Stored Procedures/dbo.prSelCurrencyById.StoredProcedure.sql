SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelCurrencyById] 
(   
    @CurrencyId nvarchar(10)
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            SELECT                         
                [CurrencyId],
                [Description],
				[CurrencyValue],
                [DecimalUnicode],
                IsPaymentAllowed
            FROM [dbo].[Currency]
            WHERE 
                [CurrencyId] = @CurrencyId       
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
