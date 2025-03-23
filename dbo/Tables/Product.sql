CREATE TABLE [dbo].[Product] (
    [ProductId] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(255),
    [Price] DECIMAL(19, 6) NOT NULL,
    [Category] NVARCHAR(50),
    [ImageUrl] NVARCHAR(255),
    [IsActive] BIT DEFAULT 1,
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE()
);
