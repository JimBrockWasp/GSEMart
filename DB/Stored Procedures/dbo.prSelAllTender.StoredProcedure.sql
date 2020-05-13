SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAllTender]
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		SELECT
			*
        FROM 
			Tender t (NOLOCK)
		WHERE ActiveYN = 1
		ORDER BY t.RequestedDate DESC

    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
