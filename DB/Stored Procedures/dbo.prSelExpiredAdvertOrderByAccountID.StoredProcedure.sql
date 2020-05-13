SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelExpiredAdvertOrderByAccountID] 
(   
    @days int
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY        
		SELECT 
			v.*,
			acc.AccountId,
			acc.[EmailAddress] AS UserEmailAddress,
			acc.[CompanyName],
			acc.[FullName]
		FROM 
			dbo.vwAdverts v (NOLOCK)
			INNER JOIN [Account] acc (NOLOCK) ON v.[AccountId] = acc.[AccountId]		
		WHERE 
			CAST(FLOOR(CAST(v.[ExpiryDate] AS FLOAT))AS DATETIME)  = CAST(FLOOR(CAST(DATEADD(dd, @days, GETDATE()) AS FLOAT))AS DATETIME) 
			AND v.[AdvertStatusId] = 'CR'
			AND acc.[AccountStatusId] = 'CF'		    
		ORDER BY 
			v.[AccountID], 
			v.[ExpiryDate]
    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
