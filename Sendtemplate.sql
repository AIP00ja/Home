CREATE TABLE sendTemplate (
    SendID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each campaign
    CampaignName NVARCHAR(255) NOT NULL,
	Recipients INT NOT NULL,             -- Number of recipients
    Layout INT NOT NULL,                 -- Foreign key to Templates table
    SenderEmail NVARCHAR(255) NOT NULL,  -- Email of the sender
    -- Name of the campaign
    CreatedDate DATETIME NOT NULL,       -- Date the draft/campaign was created
    IsDraft BIT NOT NULL,                -- Indicates if it's a draft
    Status NVARCHAR(50) NOT NULL,        -- Status: Draft, Pending, Success, Failed
    RecipientDetails NVARCHAR(MAX) NOT NULL -- Stores recipient IDs as a comma-separated string
);
select * from dbo.sendTemplate;

select * from dbo.Templates;
CREATE TABLE Templates (
    TemplateID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each template
    LayoutName NVARCHAR(255) NOT NULL,       -- Name of the layout
    Thumbnail NVARCHAR(255) NULL,           -- Path to the thumbnail image
    EmailTitle NVARCHAR(255) NULL,          -- Subject of the email
    ContentHTML NVARCHAR(MAX) NOT NULL      -- HTML content of the template
);
--ALTER TABLE sendTemplate ADD CONSTRAINT 
--FK_Layout FOREIGN KEY (Layout) 
--REFERENCES Templates (TemplateID);
