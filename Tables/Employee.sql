CREATE TABLE dbo.Employee
(
	Id INT IDENTITY (1,1) PRIMARY KEY,
	FirstName VARCHAR(255) NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	UserName VARCHAR(255) NOT NULL,
	PasswordHash  VARCHAR (255) NOT NULL,
	CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
	CreatedBy INT REFERENCES dbo.Employee(Id) DEFAULT NULL,
	UNIQUE (UserName)
);

-- run execute this query after create PositionTypes table
ALTER TABLE dbo.Employee ADD PositionId INT REFERENCES dbo.PositionTypes(Id) NOT NULL;

-- run execute this query after create RoleTypes table
ALTER TABLE dbo.Employee ADD RoleId INT REFERENCES dbo.RoleTypes(Id) NOT NULL;