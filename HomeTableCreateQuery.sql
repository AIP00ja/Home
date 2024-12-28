<<<<<<< HEAD
create table dbo.HomeAppliances(

Id INT IDENTITY(1,1) PRIMARY KEY,
Name varchar(Max) null,
Age int null,
Gender varchar(Max) null,
Phone varchar(Max) null,
Email varchar(Max) null,
Password varchar(Max) null,
UserType varchar(Max) null,
ProfileImage varchar(Max) null,
ImportPath varchar(max)
)

ALTER TABLE dbo.HomeAppliances add ImportPath varchar(max);

ALTER TABLE dbo.HomeAppliances DROP COLUMN ImagePath;

insert into dbo.HomeAppliances VALUES ('Pooja', 24, 'Female', 3859475934, 'pooja@gmail.com', 1, 'Admin','','');

update dbo.HomeAppliances set Email='taskt4638@gmail.com', UserType='Admin' where id=2


delete from dbo.HomeAppliances where id=1012
select * from dbo.HomeAppliances

--truncate table  dbo.HomeAppliances

--drop table dbo.HomeAppliances


=======
create table dbo.HomeAppliances(

Id INT IDENTITY(1,1) PRIMARY KEY,
Name varchar(Max) null,
Age int null,
Gender varchar(Max) null,
Phone varchar(Max) null,
Email varchar(Max) null,
Password varchar(Max) null,
UserType varchar(Max) null,
ProfileImage varchar(Max) null,
ImportPath varchar(max)
)

ALTER TABLE dbo.HomeAppliances add ImportPath varchar(max);

ALTER TABLE dbo.HomeAppliances DROP COLUMN ImagePath;

insert into dbo.HomeAppliances VALUES ('Pooja', 24, 'Female', 3859475934, 'pooja@gmail.com', 1, 'Admin','','');

update dbo.HomeAppliances set Email='taskt4638@gmail.com', UserType='Admin' where id=2


delete from dbo.HomeAppliances where id=1012
select * from dbo.HomeAppliances

--truncate table  dbo.HomeAppliances

--drop table dbo.HomeAppliances


>>>>>>> 9653a206d7b3c87fd201ccb8488abacdcccca0b2


CREATE TABLE dbo.AdminKeys
(
    AdminKey VARCHAR(50) NOT NULL PRIMARY KEY, 
    UsageCount INT DEFAULT 0,
    CreatedDate DATETIME DEFAULT GETDATE()
);

INSERT INTO dbo.AdminKeys (AdminKey) VALUES ('ADMIN123'), ('ADMIN456');

INSERT INTO dbo.AdminKeys (AdminKey) VALUES ('ADMIN780');

select * from dbo.AdminKeys;

   