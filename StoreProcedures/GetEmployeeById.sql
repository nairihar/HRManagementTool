CREATE PROCEDURE dbo.uspGetEmployeeById
	@id INT
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
	WHERE Id = @id
END;