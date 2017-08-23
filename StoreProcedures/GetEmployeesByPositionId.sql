CREATE PROCEDURE dbo.uspGetEmployeesByPositionId
	@PositionId INT
AS
BEGIN
	SELECT Id AS id, 
		   FirstName AS firstName, 
		   LastName AS lastName
	FROM dbo.Employee
	WHERE PositionId = @PositionId
END;