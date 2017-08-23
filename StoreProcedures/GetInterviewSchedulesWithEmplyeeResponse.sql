CREATE PROCEDURE dbo.uspGetInterviewSchedulesWithEmplyeeResponse
AS
BEGIN
	SELECT sI.Id AS id,
		   sI.CreatedDate AS createdDate,
		   sI.MeetingDate AS meetingDate,
		   sI.IsCancelled AS isCanceled,
		   sI.Document AS document,
		   e.FirstName AS hrName,
		   e.LastName AS hrSurname,
		   c.FirstName AS candidateName,
		   c.LastName AS candidateSurname,
		   c.PositionId AS candidatePositionId,
		   c.PhoneNumber AS candidatePhone,
		   c.Email AS candidateEmail,
		   c.CV AS candidateCv,
		   c.Address AS candidateAddress
	FROM dbo.ScheduleInterview sI
	INNER JOIN dbo.Employee e
	ON sI.HrId = e.Id
	INNER JOIN dbo.Candidate c
	ON sI.CandidateId = c.Id

	SELECT sIr.Id AS id,
	       sIr.Status AS status,
		   sIr.Note AS note,
		   sIr.ScheduleId AS scheduleId,
		   e.FirstName AS firstName,
		   e.LastName AS lastName,
		   e.PositionId AS positionId,
		   e.RoleId AS roleId
	FROM dbo.ScheduleInterview sI
	INNER JOIN dbo.ScheduleInterviewer sIr
	ON sI.Id = sIr.ScheduleId
	INNER JOIN dbo.Employee e
	ON e.Id = sIr.EmployeeId
	ORDER BY sIr.ScheduleId;
END;

