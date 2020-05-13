SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[prUpdAdvertGSESpecifications]     
(
    @AdvertId int,
	@SpecId1 CHAR(5),
	@SpecOptionId1 CHAR(5),
	@SpecId2 CHAR(5),
	@SpecOptionId2 CHAR(5),
	@SpecId3 CHAR(5),
	@SpecOptionId3 CHAR(5),
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
			DELETE FROM AdvertGSESpecification 
			WHERE AdvertId = @AdvertId 
			
			-- Now Insert the new values
			IF @SpecOptionId1 <> Null 
			BEGIN
				INSERT INTO AdvertGSESpecification (AdvertId, GSETypeId, SpecificationId,SpecificationOptionId)
				VALUES
				(@AdvertId, @GSETypeId, @SpecId1, @SpecOptionId1)
			END

			IF @SpecOptionId2 <> Null 
			BEGIN
				INSERT INTO AdvertGSESpecification (AdvertId, GSETypeId, SpecificationId,SpecificationOptionId)
				VALUES
				(@AdvertId, @GSETypeId, @SpecId2, @SpecOptionId2)
			END

			IF @SpecOptionId3 <> Null 
			BEGIN
				INSERT INTO AdvertGSESpecification (AdvertId, GSETypeId, SpecificationId,SpecificationOptionId)
				VALUES
				(@AdvertId, @GSETypeId, @SpecId3, @SpecOptionId3)
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
