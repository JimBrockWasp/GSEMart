SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slGetTender] 
(
	@TenderId INT
)
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
					Subject,
					Notes,
					DN.VirtualPath + DL.[FileName] FileURL,
					URL,
					Country
                
            FROM	Tender
            
            LEFT OUTER JOIN
					DLDocumentIndex DL
			ON		Tender.TenderId = DL.ObjectId
			AND		DL.DocumentType = 'Tender'
			
			LEFT OUTER JOIN
					DLDataNode DN
			ON		DL.DataNodeId = DN.DataNodeId
            
            WHERE	TenderId = @TenderId
            
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
