CREATE TABLE [dbo].[Payment] (
    [PaymentId] INT IDENTITY(1,1) PRIMARY KEY,
    [OrderId] INT FOREIGN KEY REFERENCES [dbo].[Order](OrderId),
    [PaymentMethod] NVARCHAR(50) NOT NULL,
    [Amount] DECIMAL(10, 2) NOT NULL,
    [TransactionId] NVARCHAR(255),
    [Status] NVARCHAR(50) DEFAULT 'Pending',
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE()
);
