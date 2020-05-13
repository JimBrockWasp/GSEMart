SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelTopAdvertListing]
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
		SELECT TOP 6
            a.*,
			i.[AdvertImageId] AS [AdvertImageId],
			i.[AdvertId] AS AdvertImageAdvertId,
			i.[Description] AS Description,
			i.[Image],
			i.[ContentType],
			i.[CreatedDate] AS ImageCreatedDate,
			i.[InUseYN],
			i.[IsDefaultYN]
        FROM 
			dbo.vwAdverts a (NOLOCK)
		-- Use Inner Join, we only want to list top adverts which have images,
		-- without images the homepage will looks ugly
		INNER JOIN [AdvertImage] i (NOLOCK) ON i.AdvertId = A.AdvertId AND i.[InUseYN] = 1 AND i.[IsDefaultYN] = 1
		
		--WHERE a.AdvertId IN (6030, 5972, 6267, 6260) 
		--WHERE a.AdvertId IN (6030, 5972, 6265, 6155) 
		--WHERE a.AdvertId IN (7930, 7919, 6524, 6505,6507,6509)
		--ORDER BY CreatedDate DESC
		
	
		WHERE
		(ExpiryDate IS NULL OR ExpiryDate >= GETDATE())
		AND a.NewYN = 0
		AND a.AdvertStatusId = 'PL'
		AND ((A.AdvertStatusId = 'SL' AND DATEADD(dd,7,LastModifiedDate) >= GETDATE()) OR (A.AdvertStatusId <> 'SL'))
		ORDER BY CreatedDate DESC
		

    END TRY
    BEGIN CATCH
        DECLARE @Errmsg nvarchar (4000), @ErrSeverity int
        SELECT @Errmsg=ERROR_MESSAGE (), @ErrSeverity=ERROR_SEVERITY ()
        RAISERROR (@Errmsg, @ErrSeverity, 1)
    END CATCH    
END

GO
