SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slUpateCompanyDetails]
(
    @AccountId int,    
	@CompanyWebSite	nvarchar(60),
	@CompanyName nvarchar(100),
	@Profile nvarchar(2000)
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION

				--Update Account
                UPDATE dbo.[Account] 
                SET
                    CompanyName = @CompanyName,
                    CompanyWebsite = @CompanyWebSite,
                    Profile = @Profile
                    
                WHERE 
                    [AccountId]= @AccountId 

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
