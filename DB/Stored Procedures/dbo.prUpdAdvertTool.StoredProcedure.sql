SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prUpdAdvertTool]     
(
    @AdvertId int,
    @Manufacturer nvarchar(100),
	@ProductId nvarchar(100),
	@Supplier nvarchar(100),
	@Year NVARCHAR(200),
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                UPDATE [AdvertTool]
                SET [Manufacturer] = [Manufacturer],
                [ProductId] = @ProductId,
				[Supplier] = @Supplier,
				[Year] = @Year
                WHERE [AdvertId] = @AdvertId
                
                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Advert Tool has been updated succesfully.'
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
