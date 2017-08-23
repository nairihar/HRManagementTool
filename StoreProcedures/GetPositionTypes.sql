CREATE PROCEDURE dbo.uspGetPositionTypes
AS
BEGIN
	SELECT Id AS id,
		   Position AS position
	FROM dbo.PositionTypes
END;