SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prUpdAdvertStatus] 
(   
    @AdvertId int,
    @AdvertStatusId char(2)
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
			UPDATE 
				dbo.Advert
			SET 
				AdvertStatusId = @AdvertStatusId,
				[LastModifiedDate] = GETDATE()
			WHERE
				AdvertId = @AdvertId

			INSERT INTO AdvertStatusHistory(
				AdvertId,
				[DateTime],
				AdvertStatusId
			)VALUES(
				@AdvertId,
				GETDATE(),
				@AdvertStatusId
			)

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
