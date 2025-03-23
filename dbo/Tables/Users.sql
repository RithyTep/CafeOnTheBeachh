CREATE TABLE [dbo].[User] (
    [UserID] INT IDENTITY(1, 1) PRIMARY KEY,
    [OperatorId] INT,
    [FirstName] NVARCHAR(50) NOT NULL,
    [LastName] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL UNIQUE,
    [PasswordHash] NVARCHAR(255) NOT NULL,
    [PhoneNumber] NVARCHAR(15),
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE()
);
