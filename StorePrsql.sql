USE [PoojaGaud]
GO
/****** Object:  StoredProcedure [dbo].[sp_CheckDetails]    Script Date: 30-11-2024 16:56:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_CheckDetails]
(
    @Action VARCHAR(MAX),
    @Id INT = NULL,
    @Name VARCHAR(500) = NULL,
    @Age INT = NULL,
    @Gender VARCHAR(MAX) = NULL,
    @Phone VARCHAR(MAX) = NULL,
    @Email VARCHAR(MAX) = NULL,
    @Password VARCHAR(MAX) = NULL,
    @UserType VARCHAR(MAX) = NULL OUTPUT,
	@ProfileImage varchar(Max)= Null,
	@ImportPath varchar(max)=null,
	@CurrentPass VARCHAR(MAX) = NULL,
    @NewPassword VARCHAR(MAX) = NULL,
	@Search NVARCHAR(Max) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'Login'
    BEGIN
        -- Retrieve the encrypted password from the database
        SELECT Email, Password, UserType, ProfileImage
        FROM dbo.HomeAppliances
        WHERE Email = @Email;
    END

	ELSE IF @Action='CheckEmail'
	BEGIN
       
        SELECT 
            ProfileImage
        FROM dbo.HomeAppliances
        WHERE Email = @Email;
    END

    ELSE IF @Action = 'Insert'
    BEGIN
        INSERT INTO dbo.HomeAppliances (Name, Age, Gender, Phone, Email, Password, UserType, ProfileImage, ImportPath)
        VALUES (@Name, @Age, @Gender, @Phone, @Email, @Password, 'User', @ProfileImage, @ImportPath);
    END

    ELSE IF @Action = 'Update' 
    BEGIN
        UPDATE dbo.HomeAppliances
        SET Name = @Name, Age = @Age, Gender = @Gender, Phone = @Phone, Email = @Email,
            Password = @Password, UserType = @UserType, ProfileImage=@ProfileImage, ImportPath=@ImportPath
        WHERE Id = @Id;
    END

    ELSE IF @Action = 'Delete'
    BEGIN
        DELETE FROM dbo.HomeAppliances WHERE Id = @Id;
    END
    ELSE IF @Action = 'Select'
    BEGIN
        SELECT * FROM dbo.HomeAppliances; 
    END

   ELSE IF @Action = 'UserDetails'
   BEGIN
        SELECT * FROM dbo.HomeAppliances WHERE Email = @Email 
    END

	 ELSE IF @Action = 'UpdateDetails' 
   BEGIN
    UPDATE dbo.HomeAppliances
        SET Name = @Name, Age = @Age, Gender = @Gender, Phone = @Phone, Email = @Email , 
		ProfileImage = CASE 
                          WHEN @ProfileImage IS NOT NULL THEN @ProfileImage
                          ELSE ProfileImage
                       END     
        WHERE Id = @Id;  
    END

	ELSE IF @Action = 'ChangePass' 
	BEGIN
	 SET NOCOUNT OFF;
    UPDATE dbo.HomeAppliances
        SET Password = @NewPassword         
        WHERE Email=@Email and Password=@CurrentPass;  
    END
 ELSE IF @Action = 'Search'
    BEGIN
        SELECT * 
        FROM HomeAppliances
        WHERE  (Name LIKE '%' + @Search + '%'
        OR Gender LIKE '%' + @Search + '%'
        OR Email LIKE '%' + @Search + '%'
        OR REPLACE(REPLACE(REPLACE(Phone, '(', ''), ')', ''), '-', '') LIKE '%' + REPLACE(REPLACE(REPLACE(@Search, '(', ''), ')', ''), '-', '') + '%'
        OR CAST(Age AS VARCHAR(10)) LIKE '%' + @Search + '%')
		END
END


