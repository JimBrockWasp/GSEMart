SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slInsertAdvertImage]
(    
    @AdvertId int,        
    @Image varbinary (max),
    @ContentType varchar(100)
    )
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
        
            INSERT INTO dbo.[AdvertImage]
            (
                [AdvertId],
                Description,
                [Image],
                [ContentType],
                [InUseYN],
                IsDefaultYN, 
                CreatedDate
            ) 
            VALUES 
            (
                @AdvertId,
                'Advert Image', 
                @Image,
                @ContentType,
                1,
                0,
                GETDATE()     
            )
            
            
            DECLARE	@Adverts INT
            
            SELECT	@Adverts = COUNT(*)
            FROM	AdvertImage
            WHERE	AdvertId = @AdvertId
            
            -- If there's only 1 image for this advert then set the default flag to true
            IF (@Adverts = 1)
            BEGIN
				UPDATE	AdvertImage
				SET		IsDefaultYN	= 1
				WHERE	AdvertId = @AdvertId
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
