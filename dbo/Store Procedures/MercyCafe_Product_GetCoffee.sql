CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_GetCoffee_1.0.0]
    @AdminId INT,
    @CoffeeId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [dbo].[Admin] WHERE [AdminId] = @AdminId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Admin Id' AS ErrorMessage;
        RETURN;
    END

    IF @CoffeeId <> 0 AND NOT EXISTS (SELECT 1 FROM [Product].[dbo].[Product] 
                  WHERE [Id] = @CoffeeId
                  AND [AdminId] = @AdminId)
    BEGIN
        SELECT 119 AS ErrorCode, 'Coffee not found' AS ErrorMessage;
        RETURN;
    END

    SELECT 
        0 AS ErrorCode,
        'Success' AS ErrorMessage,
        [Id],
        [AdminId],
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
    AND [AdminId] = @AdminId;
END
