CREATE PROCEDURE dbo.uspGetEmployeeByUserName	
	@userName VARCHAR(255)
AS
BEGIN
	SELECT Id AS id, 
		   FirstName AS firstName, 
		   LastName AS lastName,
		   UserName AS userName, 
		   PasswordHash AS passwordHash,
		   PositionId AS positionId,
		   RoleId AS roleId
	FROM dbo.Employee
	WHERE UserName = @userName
END;