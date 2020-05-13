SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[slUpateMainAccountDetails]
(
    @AccountId int,    
    @FullName nvarchar(100),
    @LastName nvarchar(100),
	@Address  nvarchar(500),
	@PostCode nvarchar(20),
	@City nvarchar(200),
    @CountryId char(3),
    @Telephone  nvarchar(100), 
    @Fax  nvarchar(100),
    @Mobile  nvarchar(100),
    @County nvarchar(50) = Null

)
AS
BEGIN
    SET NOCOUNT ON   
    BEGIN TRY        
        BEGIN TRANSACTION

				--Update Account
                UPDATE dbo.[Account] 
                SET
                    [FullName] = @FullName,
                    [LastName] = @LastName,
					[Address] = @Address,
					[PostCode] = @PostCode,
					[City] = @City,
                    [CountryId] = @CountryId,
                    [Telephone] = @Telephone,
                    [Fax] = @Fax,
                    [Mobile] = @Mobile,                                   
                    [LastModifiedDate] = dbo.fnGetDate(),
   					County = @County

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
