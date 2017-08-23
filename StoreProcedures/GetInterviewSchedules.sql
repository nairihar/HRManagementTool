CREATE PROCEDURE dbo.uspGetInterviewSchedules
AS
BEGIN
	SELECT sI.Id AS id,
		   sI.CreatedDate AS createdDate,
		   sI.MeetingDate AS meetingDate,
		   sI.IsCancelled AS isCanceled,
		   sI.Document AS document,
		   e.FirstName AS hrName,
		   e.LastName AS hrSurname,
		   c.Id AS candidateId,
		   c.FirstName AS candidateName,
		   c.LastName AS candidateSurname,
		   c.PositionId AS candidatePositionId,
		   c.RoleId AS candidateRoleId
	FROM dbo.ScheduleInterview sI
	INNER JOIN dbo.Employee e
	ON sI.HrId = e.Id
	INNER JOIN dbo.Candidate c
	ON sI.CandidateId = c.Id
END;

