USE [labs]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [BLJOHN0313].[sp_InsertUserRoles]
@RoleId int = 1,
@UserAccountId int = 1,
@UserRoleCreatedBy nvarchar(30) = 'admin'


AS

INSERT INTO BLJOHN0313.UserRoles(RoleId, UserAccountId, UserRoleCreatedBy)
VALUES (@RoleId, @UserAccountId, @UserRoleCreatedBy);

--select Insertedby from BLJOHN0313.Audit_UserRoles as ib join 

select * from BLJOHN0313.UserRoles; 