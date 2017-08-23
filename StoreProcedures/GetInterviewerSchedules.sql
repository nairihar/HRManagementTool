CREATE PROCEDURE dbo.uspGetInterviewerSchedules
	@id INT
AS
BEGIN
	SELECT sIr.Id AS id,
		   sI.CreatedDate AS createdDate,
		   sI.MeetingDate AS meetingDate,
		   sI.IsCancelled AS isCanceled,   
		   e.FirstName AS hrName,
		   e.LastName AS hrSurname,
		   c.Id AS candidateId,
		   c.FirstName AS candidateName,
		   c.LastName AS candidateSurname,
		   c.PositionId AS candidatePositionId,
		   c.RoleId AS candidateRoleId,
		   c.StatusId AS candidateStatusId
	FROM dbo.ScheduleInterviewer sIr
	INNER JOIN dbo.ScheduleInterview sI
	ON sIr.ScheduleId = sI.Id
	INNER JOIN dbo.Employee e
	ON sI.HrId = e.Id
	INNER JOIN dbo.Candidate c
	ON sI.CandidateId = c.Id
	WHERE sIr.EmployeeId = @id
END;

