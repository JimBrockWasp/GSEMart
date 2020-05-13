SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertSpecsByAdvertId] 
(   
    @AdvertId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION   
            
            DECLARE @GSETypeId INT
            
            SELECT	@GSETypeId = GSETypeId
            FROM	AdvertGSE 
            WHERE	AdvertId = @AdvertId 
            
            
			SELECT	S.SpecificationId,
					S.Description SpecificationDescription,
					AGS.SpecificationOptionId,
					SO.Description SpecificationOptionDescription
					
			FROM	Specification S

			LEFT OUTER JOIN	AdvertGSE AG
			ON		AG.GSETypeId = S.GSETypeId 
			AND		AG.AdvertId = @AdvertId
			
			LEFT OUTER JOIN AdvertGSESpecification AGS
			ON		S.GSETypeId = AGS.GSETypeId 
			AND		S.SpecificationId = AGS.SpecificationId 
			AND		AGS.AdvertId = AG.AdvertId 

			LEFT OUTER JOIN SpecificationOption SO
			ON		SO.GSETypeId = S.GSETypeId
			AND		SO.SpecificationId = S.SpecificationId 
			AND		SO.SpecificationOptionId = AGS.SpecificationOptionId 
			
			WHERE S.GSETypeId = @GSETypeId 
            
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
