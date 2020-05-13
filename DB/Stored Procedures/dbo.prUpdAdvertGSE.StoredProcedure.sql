SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[prUpdAdvertGSE]     
(
    @AdvertId int,
    @Manufacturer nvarchar(200),
	@DateofRegistration datetime,
	@Year NVARCHAR(200),
	@GSETypeId INT,
    @AdvertAvailabilityId CHAR(3),
	@ForSaleYN BIT,
	@ForRentYN BIT,
	@ForLeaseYN BIT,
	@RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION        
                --Add AdvertGSE 
                UPDATE [AdvertGSE]
                SET [Manufacturer] = @Manufacturer,
                [DateofRegistration] = @DateofRegistration,
                [Year] = @Year,
                GSETypeId = @GSETypeId,
                AdvertAvailabilityId = @AdvertAvailabilityId,
                ForSaleYN = @ForSaleYN,
                ForRentYN = @ForRentYN,
                ForLeaseYN = @ForLeaseYN
                
                WHERE [AdvertId] = @AdvertId
                
                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Advert GSE has been created succesfully.'
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
