CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_GetCoffee_1.0.0]
    @customerId INT,
    @coffeeId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [dbo].[Customer] WHERE [CustomerId] = @customerId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Customer Id' AS ErrorMessage;
        RETURN;
    END

    IF @coffeeId <> 0 AND NOT EXISTS (SELECT 1 FROM [Product].[dbo].[Product] 
                  WHERE [Id] = @coffeeId
                  AND [CustomerId] = @customerId)
    BEGIN
        SELECT 119 AS ErrorCode, 'Coffee not found' AS ErrorMessage;
        RETURN;
    END

    SELECT 
        0 AS ErrorCode,
        'Success' AS ErrorMessage,
        [Id],
        [CustomerId],
        [CoffeeName],
        [Description],
        [ImageUrl],
        [SpecialInstructions],
        [Price],
        [Ingredients],
        [IsAvailable],
        [Status],
        [Category],
        [Type],
        [ModifyBy],
        [ModifyOn],
        [CreatedBy],
        [CreatedOn]
    FROM [Product].[dbo].[Product]
    WHERE [Id] = @coffeeId OR @coffeeId = 0
    AND [CustomerId] = @customerId;
END
