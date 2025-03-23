CREATE TABLE [dbo].[Transaction] (
    [RefNo] NVARCHAR(250) NOT NULL,
    [CustomerId] INT FOREIGN KEY REFERENCES [dbo].[Customer](CustomerID),
    [OrderDate] DATETIME DEFAULT GETDATE(),
    [TotalAmount] DECIMAL(19, 6) NOT NULL, 
    [Status] NVARCHAR(50) DEFAULT 'Pending',
    [PaymentStatus] NVARCHAR(50) DEFAULT 'Unpaid',
    [QRCode] NVARCHAR(255), -- Stores the QR code data for the order
    [CreatedAt] DATETIME DEFAULT GETDATE(),
    [UpdatedAt] DATETIME DEFAULT GETDATE()
);
