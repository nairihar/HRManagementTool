CREATE PROCEDURE dbo.uspGetTestSchedules
AS
BEGIN
	SELECT sT.Id AS id,
		   sT.CreatedDate AS createdDate,
		   sT.MeetingDate AS meetingDate,
		   sT.IsCancelled AS isCanceled,
		   e.FirstName AS hrName,
		   e.LastName AS hrSurname,
		   (SELECT COUNT(*) FROM dbo.CandidatesIdTestGroup WHERE ScheduleId = sT.Id) AS candidatesCount,
		   (SELECT COUNT(*) FROM dbo.ScheduleTester WHERE ScheduleId = sT.Id) AS testersCount
	FROM dbo.ScheduleTest sT
	INNER JOIN dbo.Employee e
	ON sT.HrId = e.Id
END;