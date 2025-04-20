CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_CreateCoffeeItem_1.0.0]
    @customerId INT,
    @coffeeName NVARCHAR(100),
    @description NVARCHAR(MAX) = NULL,
    @imageUrl NVARCHAR(MAX) = NULL,
    @specialInstructions NVARCHAR(255) = NULL,
    @price DECIMAL(19, 6),
    @ingredients NVARCHAR(255) = NULL,
    @isAvailable BIT = 0,
    @status BIT = 1,
    @category NVARCHAR(50) = NULL,
    @type NVARCHAR(50) = NULL,
    @modifyBy  NVARCHAR(255) = NULL,
    @modifyOn DATETIME = NULL,
    @createdBy  NVARCHAR(255) = NULL,
    @createdOn DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [Main].[dbo].[Customer] WHERE [CustomerId] = @customerId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Customer Id' AS ErrorMessage;
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM [Product].[dbo].[Product] 
              WHERE [CoffeeName] = @coffeeName)
    BEGIN
        SELECT 108 AS ErrorCode, 'Coffee name already exists' AS ErrorMessage;
        RETURN;
    END

    INSERT INTO [Product].[dbo].[Product] (
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
    )
    VALUES (
        @customerId,
        @coffeeName,
        @description,
        @imageUrl,
        @specialInstructions,
        @price,
        @ingredients,
        @isAvailable,
        @status,
        @category,
        @type,
        @modifyBy,
        @modifyOn,
        @createdBy,
        @createdOn
    );

    SELECT 0 AS ErrorCode, 'Success' AS ErrorMessage;
END;
