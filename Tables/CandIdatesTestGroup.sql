CREATE TABLE dbo.CandidatesIdTestGroup (
    Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,    
    CreatedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    ScheduleId  INT REFERENCES ScheduleTest(Id) NOT NULL,
    CandidateId INT REFERENCES CandIdate(Id) NOT NULL
);