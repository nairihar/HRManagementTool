CREATE PROCEDURE dbo.uspGetTestScheduleTesters
	@scheduleId INT
AS
BEGIN
	SELECT e.Id AS id,
		   e.FirstName AS firstName,
		   e.LastName AS lastName
	FROM dbo.ScheduleTester sTer
	INNER JOIN dbo.Employee e
	ON e.Id = sTer.EmployeeId
	WHERE sTer.ScheduleId = @scheduleId
END;