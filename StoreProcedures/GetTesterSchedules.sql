CREATE PROCEDURE dbo.uspGetTesterSchedules
	@id INT
AS
BEGIN
	SELECT sTer.Id AS id,
		sT.CreatedDate AS createdDate,
		sT.MeetingDate AS meetingDate,
		sT.IsCancelled AS isCanceled,   
		e.FirstName AS hrName,
		e.LastName AS hrSurname,
		(SELECT COUNT(*) FROM dbo.CandidatesIdTestGroup WHERE ScheduleId = sT.Id) AS candidatesCount,
		(SELECT COUNT(*) FROM dbo.ScheduleTester WHERE ScheduleId = sT.Id) AS testersCount
	FROM dbo.ScheduleTester sTer
	INNER JOIN dbo.ScheduleTest sT
	ON sTer.ScheduleId = sT.Id
	INNER JOIN dbo.Employee e
	ON sT.HrId = e.Id	
	WHERE sTer.EmployeeId = @id
END;