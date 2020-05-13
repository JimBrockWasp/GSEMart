SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[slUpdateAdvertGSESpecifications]     
(
    @AdvertId int,
	@SpecId1 CHAR(5) = NULL,
	@SpecOptionId1 CHAR(5) = NULL,
	@SpecId2 CHAR(5) = NULL,
	@SpecOptionId2 CHAR(5) = NULL,
	@SpecId3 CHAR(5) = NULL,
	@SpecOptionId3 CHAR(5) = NULL
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
