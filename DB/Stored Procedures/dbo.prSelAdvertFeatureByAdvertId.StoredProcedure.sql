SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertFeatureByAdvertId] 
(   
    @AdvertId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION  
        
             
			DECLARE @GSETypeId INT

			SELECT @GSETypeId = GSETypeId
			FROM AdvertGSE
			WHERE AdvertId = @AdvertId


			SELECT 
				S.Description Description,
				CASE WHEN SO.Description IS NULL THEN '-1' ELSE SO.Description END Value,
				1 SortOrder

			FROM Specification S

			LEFT OUTER JOIN AdvertGSESpecification AGS
			ON	S.SpecificationId = AGS.SpecificationId 
			AND S.GSETypeId = AGS.GSETypeId
			AND AGS.AdvertId = @AdvertId

			LEFT OUTER JOIN SpecificationOption SO
			ON	AGS.GSETypeId = SO.GSETypeId
			AND	AGS.SpecificationOptionId = SO.SpecificationOptionId
			AND AGS.SpecificationId = SO.SpecificationId

			WHERE S.GSETypeId = @GSETypeId
			
			UNION

			
			/*
			SELECT 
					Q.Description,
					CASE WHEN AGQ.MetricValue IS NULL THEN '-1' ELSE CONVERT(NVARCHAR(10), AGQ.MetricValue) + ' ' + QU.ShortDescription END Value,
					2 SortOrder

			FROM Quantity Q
			

			LEFT OUTER JOIN AdvertGSEQuantity AGQ
			ON Q.QuantityId = AGQ.QuantityId
			AND Q.GSETypeId = AGQ.GSETypeId
			AND AGQ.AdvertId = @AdvertId

			LEFT OUTER JOIN QuantityUnit QU
			ON AGQ.QuantityId = QU.QuantityId
			AND AGQ.GSETypeId = QU.GSETypeId
			AND QU.MetricYN = 1

			WHERE Q.GSETypeId = @GSETypeId 
			*/
			
			SELECT	Q.Description QuantityDescription,
					CONVERT(nvarchar(20), ROUND(AGQ.MetricValue, 2)) + ' ' + QU.ShortDescription +
					CASE  
						WHEN iQU.GSETypeId IS NULL THEN ''
						ELSE
							'/' + CONVERT(nvarchar(20), ROUND((AGQ.MetricValue * IQU.MetricConversionRatio), 0)) + ' ' + IQU.ShortDescription
					END Value,
					2 SortOrder
									
			FROM	Quantity Q

			LEFT OUTER JOIN AdvertGSEQuantity AGQ
			ON		Q.GSETypeId = AGQ.GSETypeId 
			AND		Q.QuantityId = AGQ.QuantityId 
			AND		AGQ.AdvertId = @AdvertId 

			JOIN QuantityUnit QU
			ON	Q.GSETypeId = QU.GSETypeId
			AND Q.QuantityId = QU.QuantityId
			AND QU.MetricYN = 1


			LEFT OUTER JOIN QuantityUnit IQU
			ON	Q.GSETypeId = IQU.GSETypeId
			AND Q.QuantityId = IQU.QuantityId
			AND IQU.MetricYN = 0

			WHERE	Q.GSETypeId = @GSETypeId 


			UNION

			SELECT	Title,
					Value,
					3 SortOrder

			FROM AdvertGSEFeature

			WHERE AdvertId = @AdvertId

			ORDER BY SortOrder 
            
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
