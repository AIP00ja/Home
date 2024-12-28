CREATE PROCEDURE sp_RegisterAdmin
(
    @AdminKey VARCHAR(50),    
    @Name VARCHAR(MAX),      
    @Age INT,                
    @Gender VARCHAR(MAX),    
    @Phone VARCHAR(MAX),     
    @Email VARCHAR(MAX),     
    @Password VARCHAR(MAX),   
    @ProfileImage VARCHAR(MAX) = NULL, 
    @ImportPath VARCHAR(MAX) = NULL  
)
AS
BEGIN
    SET NOCOUNT ON;

    
    IF NOT EXISTS (SELECT 1 FROM AdminKeys WHERE AdminKey = @AdminKey AND IsUsed = 0)
    BEGIN
       
        SELECT 'Invalid or already used Admin Key.' AS Message;
        RETURN;
    END

    
    INSERT INTO dbo.HomeAppliances (Name, Age, Gender, Phone, Email, Password, UserType, ProfileImage, ImportPath)
    VALUES (@Name, @Age, @Gender, @Phone, @Email, @Password, 'Admin', @ProfileImage, @ImportPath);

    
    DECLARE @AdminId INT = SCOPE_IDENTITY();

    
    UPDATE AdminKeys
    SET IsUsed = 1, UsedBy = @AdminId
    WHERE AdminKey = @AdminKey;

    
    SELECT 'Admin registered successfully!' AS Message;
END