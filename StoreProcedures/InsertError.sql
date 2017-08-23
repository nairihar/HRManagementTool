CREATE PROCEDURE dbo.InsertError
	@Number INT,
	@Severity INT,
	@State INT,
	@Procedure VARCHAR(255),
	@Line INT,
	@Message VARCHAR(8000)
AS
BEGIN
	INSERT INTO dbo.ErrorLog (Number, Severity, [State], Prodecure, Line, [Message])
	VALUES (@Number, @Severity, @State, @Procedure, @Line, @Message)
END;