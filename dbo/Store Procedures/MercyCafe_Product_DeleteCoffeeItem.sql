CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_DeleteCoffeeItem_1.0.0]
    @customerId INT,
    @username NVARCHAR(100),
    @coffeeId INT
AS
BEGIN
    SET NOCOUNT ON;
    
    IF NOT EXISTS (SELECT 1 FROM [dbo].[Customer] WHERE [CustomerId] = @customerId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Customer Id' AS ErrorMessage;
        RETURN;
    END
    IF NOT EXISTS (SELECT 1 FROM [Product].[dbo].[Product] WHERE [Id] = @coffeeId AND [CustomerId] = @customerId)
    BEGIN
        SELECT 119 AS ErrorCode, 'Coffee not found' AS ErrorMessage;
        RETURN;
    END
    
    UPDATE [Product].[dbo].[Product]
    SET
          [Status] = 0,
          [ModifyBy] = @username,
          [ModifyOn] = GETDATE()
    WHERE [Id] = @coffeeId
    AND   [Status] = 1
    AND   [CustomerId] = @customerId;
END
