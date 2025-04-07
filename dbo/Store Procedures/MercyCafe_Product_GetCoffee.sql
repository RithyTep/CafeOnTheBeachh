CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_GetCoffee_1.0.0]
    @CustomerId INT,
    @CoffeeId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [dbo].[Customer] WHERE [CustomerId] = @CustomerId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Customer Id' AS ErrorMessage;
        RETURN;
    END

    IF @CoffeeId <> 0 AND NOT EXISTS (SELECT 1 FROM [Product].[dbo].[Product] 
                  WHERE [Id] = @CoffeeId
                  AND [CustomerId] = @CustomerId)
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
    WHERE [Id] = @CoffeeId OR @CoffeeId = 0
    AND [CustomerId] = @CustomerId;
END
