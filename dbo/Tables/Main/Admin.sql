CREATE TABLE [dbo].[Admin] (
    [AdminId] INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
    [AdminName] NVARCHAR(50) NOT NULL,
    [Password] NVARCHAR(255) NOT NULL,
    [CreatedOn] DATETIME DEFAULT GETDATE(),
    [ModifiedOn] DATETIME DEFAULT GETDATE()
);

CREATE NONCLUSTERED INDEX IDX_Admin_AdminName ON [dbo].[Admin]([AdminName]);
