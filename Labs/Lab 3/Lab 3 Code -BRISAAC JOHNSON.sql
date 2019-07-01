/*
	!!!!!! IMPORTANT !!!!!!!
	Only run this in the Labs database
	Before running, do a find replace on the word CHANGEME
	and replace it with your SCHEMA
*/

create table BLJOHN0313.UserAccounts (
	UserAccountId int not null primary key identity(1,1),
	Username nvarchar(30) not null unique,
	[Password] nvarchar(4000) not null,
	AccountCreatedOn datetime not null default (getdate()),
	AccountCreatedBy nvarchar(30) not null,
	isActive bit not null,
	isLocked bit not null
)

create table BLJOHN0313.Roles (
	RoleId int not null primary key identity(1,1),
	RoleName nvarchar(100) not null unique,
	RoleDesc nvarchar(max) not null,
	RoleCreatedOn datetime not null default (getdate()),
	RoleCreatedBy nvarchar(30) not null
)

create table BLJOHN0313.UserRoles (
	UserRoleId int not null primary key identity(1,1),
	RoleId int not null references BLJOHN0313.Roles(RoleId),
	UserAccountId int not null references BLJOHN0313.UserAccounts(UserAccountId),
	UserRoleCreatedOn datetime not null default (getdate()),
	UserRoleCreatedBy nvarchar(30) not null,
	constraint UC_BLJOHN0313_UserRole unique (RoleId, UserAccountId)
)

create table BLJOHN0313.Audit_UserRoles (
	UserRoleAuditId bigint not null primary key identity(1,1),
	InsertedOn datetime not null default (getdate()),
	InsertedBy nvarchar(30) not null,
	TargetUserAccountId int not null,
	TargetRoleId int not null	
)

go

insert into BLJOHN0313.UserAccounts
values ('admin', 'securePassword123', getdate(), 'system', 1, 0),
	   ('jdoe', 'Password123', getdate(), 'admin', 1, 0)

insert into BLJOHN0313.Roles
values ('Administrators', 'System Administrators', getdate(), 'system'),
       ('Users', 'Basic Users', getdate(), 'admin')

go

--_________________________MY CODE____________________________________--

--------------------------------------------------------------------------------------------STORED PROCEDURE
USE [labs]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bljohn0313].[sp_InsertUserRoles]
@RoleId int,
@UserAccountId int

AS

INSERT INTO BLJOHN0313.UserRoles(RoleId, UserAccountId, UserRoleCreatedBy)
VALUES (@RoleId, @UserAccountId, CURRENT_USER);

--drop procedure [bljohn0313].[sp_InsertUserRoles]

--------------------------------------------------------------------------------------------AFTER INSERT TRIGGER

--drop trigger [bljohn0313].[aur] 

CREATE TRIGGER [BLJOHN0313].[aur]  on [BLJOHN0313].[UserRoles]
AFTER INSERT
AS
DECLARE @InsertedOn DateTime = (select (UserRoleCreatedOn)
FROM BLJOHN0313.UserRoles)

DECLARE @InsertedBy nvarchar (30) = (select UserRoleCreatedBy
FROM BLJOHN0313.UserRoles)

DECLARE @TargetUserAccountId int = (select UserAccountId
FROM BLJOHN0313.UserRoles)

DECLARE @TargetRoleId int = (select RoleId
FROM BLJOHN0313.UserRoles)

BEGIN
INSERT INTO BLJOHN0313.Audit_UserRoles(InsertedOn, InsertedBy, TargetUserAccountId, TargetRoleId)
VALUES(@InsertedOn, @InsertedBy, @TargetUserAccountId, @TargetRoleId)
END

----------------------------------------------------------------------------------------------INSERT METHODS
exec [bljohn0313].[sp_InsertUserRoles]
@RoleId = 1,
@UserAccountId = 1,
select * from BLJOHN0313.UserRoles;
select * from BLJOHN0313.Audit_UserRoles;
