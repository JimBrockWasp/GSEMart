SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAdvertImageByAdvertID] 
(   
    @AdvertId int
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
                [InUseYN],
                [IsDefaultYN]              
            FROM [dbo].[AdvertImage]
            WHERE 
                [AdvertId] = @AdvertId
                AND [InUseYN] = 1
            ORDER BY [IsDefaultYN] DESC, [CreatedDate] ASC
            
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
