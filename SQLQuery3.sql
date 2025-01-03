USE [PoojaGaud]
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterAdmin]    Script Date: 30-11-2024 16:57:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_RegisterAdmin]
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

    IF NOT EXISTS (SELECT 1 FROM AdminKeys WHERE AdminKey = @AdminKey)
    BEGIN
        SELECT 'Invalid Admin Key.' AS Message;
        RETURN;
    END
  
    IF EXISTS (SELECT 1 FROM dbo.HomeAppliances WHERE Email = @Email AND UserType = 'Admin')
    BEGIN
        SELECT 'Admin with this email already exists!' AS Message;
        RETURN;
    END
   
    INSERT INTO dbo.HomeAppliances (Name, Age, Gender, Phone, Email, Password, UserType, ProfileImage, ImportPath)
    VALUES (@Name, @Age, @Gender, @Phone, @Email, @Password, 'Admin', @ProfileImage, @ImportPath);

    UPDATE AdminKeys
    SET UsageCount = UsageCount + 1
    WHERE AdminKey = @AdminKey;
   
    SELECT 'Admin registered successfully!' AS Message;
END