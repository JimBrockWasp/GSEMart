SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prUpdDiscountRate] 
(   
    @DiscountRateId INT,
    @DiscountRate INT,
	@RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
			UPDATE 
				dbo.DiscountRate
			SET 
				[DiscountRate] = @DiscountRate,
				[LastUpdate] = GETDATE()
			WHERE
				[DiscountRateId] = @DiscountRateId
				
			-- Return 0 to the calling program to indicate success.
            SET @RespCode = 0
            SET @RespMsg = 'Discount Rate has been successfully updated'
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
