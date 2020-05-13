SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertImageByID] 
(   
    @AdvertImageId int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            SELECT 
                [AdvertImageId],
                [AdvertId],
                [Description],
                [Image],
                [ContentType],
                [CreatedDate],
                [InUseYN]         
            FROM [dbo].[AdvertImage]
            WHERE 
                [AdvertImageId] = @AdvertImageId
                AND [InUseYN] = 1
            
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
