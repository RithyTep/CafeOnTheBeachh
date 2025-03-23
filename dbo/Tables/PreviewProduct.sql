CREATE TABLE [dbo].[Review] (
    [ReviewId] INT IDENTITY(1,1) PRIMARY KEY,
    [CustomerId] INT FOREIGN KEY REFERENCES [dbo].[Customer](CustomerId),
    [ProductId] INT FOREIGN KEY REFERENCES [dbo].[Product](ProductId),
    [Rating] INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    [Comment] NVARCHAR(500),
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE()
);
