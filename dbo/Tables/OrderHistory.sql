CREATE TABLE [dbo].[OrderHistory] (
    [OperatorId] INT IDENTITY(1,1) PRIMARY KEY,
    [OrderHistoryID] INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each order history entry
    [UserID] INT FOREIGN KEY REFERENCES [dbo].[User](UserID), -- Links to the User table
    [OrderID] INT FOREIGN KEY REFERENCES [dbo].[Order](OrderID), -- Links to the Order table
    [OrderDate] DATETIME DEFAULT GETDATE(),         -- Date and time of the order
    [TotalAmount] DECIMAL(10, 2) NOT NULL,          -- Total amount of the order
    [Status] NVARCHAR(50) DEFAULT 'Completed',      -- Status of the order (e.g., Completed, Cancelled)
    [CreatedAt] DATETIME DEFAULT GETDATE(),         -- Timestamp when the order history was created
    [UpdatedAt] DATETIME DEFAULT GETDATE()          -- Timestamp when the order history was last updated
);
