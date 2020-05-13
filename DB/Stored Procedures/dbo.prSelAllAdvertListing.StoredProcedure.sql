SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAllAdvertListing]
(   
    @NewYN BIT,
    @UsedYN BIT
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		SELECT
            a.[AdvertId],
			a.[Title],
			a.[ContactName],
			a.[Quantity],
			a.Owner,
			a.CountryName,
			a.NewYN
        FROM 
			dbo.vwAdverts a (NOLOCK)
			
		JOIN Account AC
		ON	a.AccountId = AC.AccountId 	
			
		WHERE ((a.ExpiryDate >= GETDATE() OR a.ExpiryDate IS NULL) AND (AC.ExpiryDate > GETDATE() OR AC.ExpiryDate IS NULL))
		AND ((A.AdvertStatusId = 'SL' AND DATEADD(dd,7,a.LastModifiedDate) >= GETDATE()) OR (A.AdvertStatusId IN ('CR', 'PL')))
		AND ((@NewYN = 1 AND a.NewYN = 1) OR (@UsedYN = 1 AND a.NewYN = 0))
		--ORDER BY CreatedDate 
		--ORDER BY AdvertId DESC
		ORDER BY a.Owner

    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END
GO
