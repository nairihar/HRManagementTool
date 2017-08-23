CREATE TABLE dbo.RoleTypes (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	[Role] VARCHAR(255) NOT NULL,
	CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	CreatedBy INT REFERENCES dbo.Employee(Id) DEFAULT NULL,
	UNIQUE ([Role])
);
