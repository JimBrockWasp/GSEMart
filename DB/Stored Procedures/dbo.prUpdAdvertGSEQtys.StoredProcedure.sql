SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[prUpdAdvertGSEQtys]     
(
    @AdvertId int,
	@QtyId1 CHAR(5),
	@MetricValue1 FLOAT,
	@QtyId2 CHAR(5),
	@MetricValue2 FLOAT,
	@RespCode int output,    
    @RespMsg  varchar(500) output

)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION   
        
			-- Get the GSE Type from AdvertGSE table
			DECLARE @GSETypeId INT
			SELECT @GSETypeId = GSETypeId FROM AdvertGSE WHERE AdvertId = @AdvertId      

			-- First Delete the existing rows
			DELETE FROM AdvertGSEQuantity 
			WHERE AdvertId = @AdvertId 
			
			-- Now Insert the new values
			IF @QtyId1 <> Null 
			BEGIN
				INSERT INTO AdvertGSEQuantity (AdvertId, GSETypeId, QuantityId, MetricValue)
				VALUES
				(@AdvertId, @GSETypeId, @QtyId1, @MetricValue1)
			END

			-- Now Insert the new values
			IF @QtyId2 <> Null 
			BEGIN
				INSERT INTO AdvertGSEQuantity (AdvertId, GSETypeId, QuantityId, MetricValue)
				VALUES
				(@AdvertId, @GSETypeId, @QtyId2, @MetricValue2)
			END

			
            -- Return 0 to the calling program to indicate success.
            SET @RespCode = 0
            SET @RespMsg = 'Advert GSE has been created succesfully.'


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
