SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[prSelAllAccount] 
(   
    @EmailAddress NVARCHAR(50),
    @Name NVARCHAR(100),
    @NameCategoryId INT,
    @CountryID CHAR(3),
    @AccountStatusID CHAR(2),
    @AccountTypeID INT
)
AS
BEGIN
    SET NOCOUNT ON
    BEGIN TRY     
            SELECT 
                [AccountId],
                [EmailAddress],
                [FullName],
				[LastName],
                [CompanyName],
                [Address],
				[PostCode],
				[City],
				[StateId],
                [CountryId],
                [Telephone],
                [Fax],
                [Mobile],
                [Password],
                [AccountStatusId],
                [SalesCode],
                [VATNumber],
                [VATNumberStatusId],
                [Discount],
                [AccountTypeID],
                [CompanyWebsite],
                [Profile]
            FROM [dbo].[Account] (NOLOCK)
            WHERE
            (@EmailAddress = '' OR [EmailAddress] LIKE '%' + @EmailAddress + '%')
            AND
            (
				(@NameCategoryId = 0 AND (@Name = '' OR [FullName] LIKE '%' + @Name + '%' OR [LastName] LIKE '%' + @Name + '%' OR [CompanyName] LIKE '%' + @Name + '%'))
				OR
				(@NameCategoryId = 1 AND (@Name = '' OR [FullName] LIKE '%' + @Name + '%' OR [LastName] LIKE '%' + @Name + '%'))
				OR
				(@NameCategoryId = 2 AND ([CompanyName] LIKE '%' + @Name + '%'))
			)
            AND
            (LTRIM(RTRIM(@CountryID)) = '' OR [CountryId] = @CountryID)
            AND
            (LTRIM(RTRIM(@AccountStatusID)) = '' OR [AccountStatusId] = @AccountStatusID)
            AND
            (@AccountTypeID = 0 OR [AccountTypeID] = @AccountTypeID)
            
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
