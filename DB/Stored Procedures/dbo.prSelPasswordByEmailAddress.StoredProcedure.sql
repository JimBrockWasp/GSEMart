SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Author: Suraj
--Date  : 22 Feb 2010
--Description : Select password by email address
CREATE PROCEDURE [dbo].[prSelPasswordByEmailAddress] 
(   
    @EmailAddress nvarchar(50)
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY
        BEGIN TRANSACTION  
		    SELECT 
		        AccountID,
                [Password],
                FullName,
                EmailAddress
            FROM [dbo].[Account]
            WHERE 
                [EmailAddress] = @EmailAddress
 
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
