SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsTender]     
(
    @CompanyName  nvarchar(100),
    @ContactName  nvarchar(100),
    @Telephone nvarchar(50),
    @EmailAddress nvarchar(50),
    @ExpiryDate date,
    @Subject  nvarchar(200),
    @Notes  nvarchar(max),
    @URL nvarchar(200),
    @Country nvarchar(100),
    @TenderId int output,
    @RespCode int output,    
    @RespMsg  varchar(500) output
)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION    
        
				DEC
            
                --Add Account
                INSERT INTO [Tender] 
                (
                    [CompanyName],
                    [ContactName],
                    [Telephone],
                    [EmailAddress],
					[ExpiryDate],
					[Subject],
					Notes,
					CreatedDate,
					URL,
					Country
					                    
                ) 
                VALUES 
                (
                    @CompanyName,
                    @ContactName,
                    @Telephone,
                    @EmailAddress,
                    @ExpiryDate,
                    @Subject,
                    @Notes,
                    GETDATE(),
                    @URL,
                    @Country
                )

                SET @TenderId =  SCOPE_IDENTITY()
                
                -- Return 0 to the calling program to indicate success.
                SET @RespCode = 0
                SET @RespMsg = 'Tender has been created succesfully.'           
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
