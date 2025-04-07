CREATE TABLE [dbo].[Customer] (
  [CustomerId] INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
  [UserName] NVARCHAR(50) NOT NULL,
  [Password] NVARCHAR(255) NOT NULL,
  [CreatedOn] DATETIME DEFAULT GETDATE(),
  [ModifiedOn] DATETIME DEFAULT GETDATE(),
  [AccountType] TINYINT NOT NULL,
);
CREATE NONCLUSTERED INDEX IDX_Customer_UserName ON [dbo].[Customer]([UserName]);
