SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsAdvertImage]
(    
    @AdvertId int,        
    @Description nvarchar(100),
    @Image varbinary (max),
    @ContentType varchar(100),
    @InUseYN bit = 1,
    @IsDefaultYN bit = 0,
    @AdvertImageId int output,
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION
            INSERT INTO dbo.[AdvertImage]
            (
                [AdvertId],
                [Description],
                [Image],
                [ContentType],
                [CreatedDate],
                [InUseYN],
                [IsDefaultYN]
            ) 
            VALUES 
            (
                @AdvertId,
                @Description,
                @Image,
                @ContentType,
                dbo.fnGetDate(),
                @InUseYN,
                @IsDefaultYN
            )
            
            SET @AdvertImageId=  SCOPE_IDENTITY()
            
            -- Return 0 to the calling program to indicate success.
            SET @RespCode = 0
            SET @RespMsg = 'Advert image has been uploaded succesfully.'
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
