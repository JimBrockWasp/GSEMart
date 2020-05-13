SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slSetAdvertImageAsDefault]
(
	@AdvertId Int,    
    @AdvertImageId int
 )
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
        
            -- First reset all the images for this advert
        	UPDATE	AdvertImage
			SET		IsDefaultYN	= 0
			WHERE	AdvertId = @AdvertId
        
            -- Now set the select image as default
            UPDATE	AdvertImage
			SET		IsDefaultYN	= 1
			WHERE	AdvertImageId = @AdvertImageId
            
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
