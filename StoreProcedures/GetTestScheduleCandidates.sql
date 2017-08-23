CREATE PROCEDURE dbo.uspGetTestScheduleCandidates
	@scheduleId INT
AS
BEGIN
	SELECT c.FirstName AS firstName,
		   c.LastName AS lastName,
		   c.RoleId AS roleId,
		   c.PositionId AS positionId,
		   c.StatusId AS statusId
	FROM dbo.CandidatesIdTestGroup cG
	INNER JOIN dbo.Candidate c
	ON c.Id = cG.CandidateId
	WHERE cG.ScheduleId = @scheduleId
END;