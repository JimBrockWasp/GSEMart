SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelTotalNumberOfAdvertInMonth](
	@AccountId INT,
	@AdvertCategory CHAR(2),
	@Month INT,
	@Total INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY        
            SET @Total = 
			ISNULL((
			SELECT
				COUNT(1) As Total
            FROM [dbo].[vwAdverts] (NOLOCK)
            WHERE [AccountId] = @AccountId
			AND [CreatedDate] >= dateadd(mm, @Month, getdate())
			AND [CategoryId] = @AdvertCategory
			), 0)
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
