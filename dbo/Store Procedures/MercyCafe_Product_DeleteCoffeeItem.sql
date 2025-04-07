CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_DeleteCoffeeItem_1.0.0]
    @CustomerId INT,
    @UserName NVARCHAR(100),
    @CoffeeId INT
AS
BEGIN
    SET NOCOUNT ON;
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Customer] WHERE [CustomerId] = @CustomerId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Customer Id' AS ErrorMessage;
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM [Product].[dbo].[Product] WHERE [Id] = @CoffeeId AND [CustomerId] = @CustomerId)
    BEGIN
        SELECT 119 AS ErrorCode, 'Coffee not found' AS ErrorMessage;
        RETURN;
    END
    
    UPDATE [Product].[dbo].[Product]
    SET
          [Status] = 0,
          [ModifyBy] = @UserName,
          [ModifyOn] = GETDATE()
    WHERE [Id] = @CoffeeId
    AND   [Status] = 1
    AND   [CustomerId] = @CustomerId;
END
