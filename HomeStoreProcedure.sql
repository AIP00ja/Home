CREATE PROCEDURE sp_CheckDetails
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
	@ProfileImage varchar(Max)= Null
)
AS
BEGIN
    SET NOCOUNT ON;

    IF @Action = 'Login'
    BEGIN
        -- Retrieve user details based on Email and Password
        SELECT Email, UserType
        FROM dbo.HomeAppliances
        WHERE Email = @Email AND Password = @Password;
    END
    ELSE IF @Action = 'Insert'
    BEGIN
        INSERT INTO dbo.HomeAppliances (Name, Age, Gender, Phone, Email, Password, UserType, ProfileImage)
        VALUES (@Name, @Age, @Gender, @Phone, @Email, @Password, @UserType, @ProfileImage);
    END
    ELSE IF @Action = 'Update'
    BEGIN
        UPDATE dbo.HomeAppliances
        SET Name = @Name, Age = @Age, Gender = @Gender, Phone = @Phone, Email = @Email,
            Password = @Password, UserType = @UserType, ProfileImage=@ProfileImage
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
END
