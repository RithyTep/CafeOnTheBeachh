CREATE TABLE [dbo].[Product] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [AdminId] INT NOT NULL,
    [CoffeeName] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [ImageUrl] NVARCHAR(MAX) NULL,
    [SpecialInstructions] NVARCHAR(255) NULL,
    [Price] DECIMAL(19,6) NOT NULL CHECK ([Price] >= 0), 
    [IsAvailable] BIT NOT NULL DEFAULT 0,
    [Status] BIT NOT NULL DEFAULT 1,
    [Category] NVARCHAR(100) NULL,  
    [Type] NVARCHAR(100) NULL,  
    [Ingredients] NVARCHAR(MAX) NULL,
    [ModifyBy] NVARCHAR(100) NULL, 
    [ModifyOn] DATETIME NULL,
    [CreatedBy] NVARCHAR(100) NOT NULL, 
    [CreatedOn] DATETIME NOT NULL
);

CREATE UNIQUE INDEX IX_Product_AdminId_CoffeeName
ON dbo.Product(AdminId, CoffeeName);
