CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_CreateCoffeeItem_1.0.0]
    @AdminId INT,
    @CoffeeName NVARCHAR(100),
    @Description NVARCHAR(MAX) = NULL,
    @ImageUrl NVARCHAR(MAX) = NULL,
    @SpecialInstructions NVARCHAR(255) = NULL,
    @Price DECIMAL(19, 6),
    @Ingredients NVARCHAR(255) = NULL,
    @IsAvailable BIT = 0,
    @Status BIT = 1,
    @Category NVARCHAR(50) = NULL,
    @Type NVARCHAR(50) = NULL,
    @ModifyBy  NVARCHAR(255) = NULL,
    @ModifyOn DATETIME = NULL,
    @CreatedBy  NVARCHAR(255) = NULL,
    @CreatedOn DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM [Main].[dbo].[Admin] WHERE [AdminId] = @AdminId)
    BEGIN
        SELECT 105 AS ErrorCode, 'Invalid Admin Id' AS ErrorMessage;
        RETURN;
    END

    IF EXISTS (SELECT 1 FROM [Product].[dbo].[Product] 
              WHERE [CoffeeName] = @CoffeeName)
    BEGIN
        SELECT 108 AS ErrorCode, 'Coffee name already exists' AS ErrorMessage;
        RETURN;
    END

    INSERT INTO [Product].[dbo].[Product] (
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
    )
    VALUES (
        @AdminId,
        @CoffeeName,
        @Description,
        @ImageUrl,
        @SpecialInstructions,
        @Price,
        @Ingredients,
        @IsAvailable,
        @Status,
        @Category,
        @Type,
        @ModifyBy,
        @ModifyOn,
        @CreatedBy,
        @CreatedOn
    );

    SELECT 0 AS ErrorCode, 'Success' AS ErrorMessage;
END;
