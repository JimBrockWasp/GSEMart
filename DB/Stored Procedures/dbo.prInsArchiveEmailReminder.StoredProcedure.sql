SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prInsArchiveEmailReminder]       
(  
    @EmailAddress NVARCHAR(50),  
    @AccountId int,  
    @EmailSubject NVARCHAR(200),  
    @EmailBody TEXT,  
    @SentDate DATETIME,  
	@RespCode int output,      
    @RespMsg  varchar(500) output  
)  
AS  
BEGIN  
    SET NOCOUNT ON     
    BEGIN TRY          
        BEGIN TRANSACTION          
                --Add Advert   
                INSERT INTO [EmailReminder]  
                (  
                    [EmailAddress],  
                    [AccountId],  
					[EmailSubject],  
					[EmailBody],  
					[SentDate]  
                )   
                VALUES   
                (  
					@EmailAddress,  
                    @AccountId,  
					@EmailSubject,  
					@EmailBody,  
					@SentDate  
                )  
                  
                -- Return 0 to the calling program to indicate success.  
                SET @RespCode = 0  
                SET @RespMsg = 'Archive Email Reminder has been created succesfully.'  
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
