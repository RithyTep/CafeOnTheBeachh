CREATE TABLE [dbo].[FavoriteItem] (
    [FavoriteItemID] INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each favorite item entry
    [UserID] INT FOREIGN KEY REFERENCES [dbo].[User](UserID), -- Links to the User table
    [ProductID] INT FOREIGN KEY REFERENCES [dbo].[Product](ProductID), -- Links to the Product table
    [AddedAt] DATETIME DEFAULT GETDATE(),           -- Timestamp when the item was added to favorites
    [CreatedAt] DATETIME DEFAULT GETDATE(),         -- Timestamp when the favorite item was created
    [UpdatedAt] DATETIME DEFAULT GETDATE()          -- Timestamp when the favorite item was last updated
);
