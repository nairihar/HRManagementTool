CREATE PROCEDURE dbo.uspGetRoleTypes
AS
BEGIN
	SELECT Id AS id,
		   [Role] AS [role]
	FROM dbo.RoleTypes
END;