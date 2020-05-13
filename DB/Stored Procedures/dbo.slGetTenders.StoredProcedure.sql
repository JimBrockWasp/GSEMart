SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slGetTenders] 
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION        
            SELECT	TenderId,
					CompanyName,
					ContactName,
					Telephone,
					EmailAddress,
					CreatedDate,
					ExpiryDate,
					Subject                  
                
            FROM	Tender
            
            WHERE	ExpiryDate > DATEADD(day, -7, GETDATE())
            
            ORDER BY TenderId DESC
            
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
