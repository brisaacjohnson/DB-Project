USE [labs]
GO
/****** Object:  StoredProcedure [bljohn0313].[sp_InsertUserRoles]    Script Date: 4/12/2019 11:53:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [bljohn0313].[sp_InsertUserRoles]
@RoleId int,
@UserAccountId int,
@UserRoleCreatedBy nvarchar(30)


AS

INSERT INTO BLJOHN0313.UserRoles(RoleId, UserAccountId, UserRoleCreatedBy)
VALUES (@RoleId, @UserAccountId, @UserRoleCreatedBy);

