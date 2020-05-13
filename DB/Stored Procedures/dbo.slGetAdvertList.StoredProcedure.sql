SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[slGetAdvertList] 
(   
    @AccountId int,
    @StatusId nvarchar(50) = NULL
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
        
			SELECT 	A.AdvertId,
					GT.Description GSEType,
					Manufacturer,
					Title,
					AdvertStatusId,
					ExpiryDate
					
					
			FROM	Advert A
			
			JOIN	AdvertGSE AG
			ON		A.AdvertId = AG.AdvertId
			
			JOIN	GSEType GT
			ON		AG.GSETypeId = GT.GSETypeId
						
			
			
			WHERE AccountId = @AccountId
			AND   (
					(@StatusId IS NULL) OR 
					
					(CHARINDEX(',' + A.AdvertStatusId + ',', ',' + @StatusId + ',') > 0)
					
				   )
             ORDER By A.AdvertId DESC  
            
            
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
