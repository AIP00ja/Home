<<<<<<< HEAD
create table dbo.Registration(

Id int identity,
Name varchar(Max) not null,
Email varchar(Max) not null,
Password varchar(Max) not null,
Mobile varchar(Max) not null,
Gender varchar(Max) not null,
UserType varchar(Max) not null,
ProfileImage varchar(Max)
)

update dbo.Registration set Password=1, UserType='Admin' where id=2



delete from dbo.Registration where id=1012
select * from dbo.Registration

=======
create table dbo.Registration(

Id int identity,
Name varchar(Max) not null,
Email varchar(Max) not null,
Password varchar(Max) not null,
Mobile varchar(Max) not null,
Gender varchar(Max) not null,
UserType varchar(Max) not null,
ProfileImage varchar(Max)
)

update dbo.Registration set Password=1, UserType='Admin' where id=2



delete from dbo.Registration where id=1012
select * from dbo.Registration

>>>>>>> 9653a206d7b3c87fd201ccb8488abacdcccca0b2
drop table dbo.Registration