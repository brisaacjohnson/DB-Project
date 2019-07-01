exec [bljohn0313].[sp_InsertUserRoles]
@RoleId = ,
@UserAccountId = ,
@UserRoleCreatedBy = 
select * from bljohn0313.userroles;


Delete from bljohn0313.userroles WHERE UserRoleId = 7; 
select * from BLJOHN0313.UserAccounts  
select * from BLJOHN0313.Roles

INSERT INTO BLJOHN0313.UserRoles(UserRoleId, RoleId, UserAccountId, UserRoleCreatedOn, UserRoleCreatedBy)
VALUES((select))
