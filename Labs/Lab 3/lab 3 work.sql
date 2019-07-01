CREATE TRIGGER [BLJOHN0313].[aur]  on [BLJOHN0313].[UserRoles]AFTER INSERTasdeclare @InsertedOn DateTime = (select Max(UserRoleCreatedOn)from BLJOHN0313.UserRoles)declare @InsertedBy nvarchar = (select UserRoleCreatedByfrom BLJOHN0313.UserRoleswhere UserRoleCreatedOn = (select Max(UserRoleCreatedOn)from BLJOHN0313.UserRoles))declare @TargetUserAccountId int = (select UserAccountIdfrom BLJOHN0313.UserRoleswhere UserRoleCreatedOn = (select Max(UserRoleCreatedOn)from BLJOHN0313.UserRoles))declare @TargetRoleId int = (select RoleIdfrom BLJOHN0313.UserRoleswhere UserRoleCreatedOn = (select Max(UserRoleCreatedOn)from BLJOHN0313.UserRoles))

	begin		insert into BLJOHN0313.Audit_UserRoles(InsertedOn, InsertedBy, TargetUserAccountId, TargetRoleId)		values(@InsertedOn, @InsertedBy, @TargetUserAccountId, @TargetRoleId)
	end

	DROP trigger [BLJOHN0313].[aur]