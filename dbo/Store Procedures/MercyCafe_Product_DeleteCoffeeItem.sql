CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_DeleteCoffeeItem_1.0.0]
    @AdminId INT,
    @AdminName NVARCHAR(100),
    @CoffeeId INT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Admin] WHERE [AdminId] = @AdminId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Admin Id' AS ErrorMessage;
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM [Product].[dbo].[Product] WHERE [Id] = @CoffeeId AND [AdminId] = @AdminId)
    BEGIN
        SELECT 119 AS ErrorCode, 'Coffee not found' AS ErrorMessage;
        RETURN;
    END
    
    UPDATE [Product].[dbo].[Product]
    SET
          [Status] = 0,
          [ModifyBy] = @AdminName,
          [ModifyOn] = GETDATE()
    WHERE [Id] = @CoffeeId
    AND   [Status] = 1
    AND   [AdminId] = @AdminId;
END
