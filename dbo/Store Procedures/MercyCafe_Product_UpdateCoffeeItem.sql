CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_UpdateCoffeeItem_1.0.0]
    @AdminId INT,
    @CoffeeId INT,
    @CoffeeName NVARCHAR(100),
    @Description NVARCHAR(MAX) = NULL,
    @Price DECIMAL(19,6) = 0,
    @ImageUrl NVARCHAR(MAX) = NULL,
    @SpecialInstructions NVARCHAR(255) = NULL,
    @IsAvailable BIT = 0,
    @Status BIT = 1,
    @Category NVARCHAR(50) = NULL,
    @Type NVARCHAR(50) = NULL,
    @Ingredients NVARCHAR(MAX) = NULL,
    @ModifyBy NVARCHAR(100) = NULL,
    @ModifyOn DATETIME = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [Product].[dbo].[Product]
    SET 
        [CoffeeName]         = ISNULL(NULLIF(@CoffeeName, ''), [CoffeeName]),
        [Description]        = ISNULL(NULLIF(@Description, ''), [Description]),
        [Price]              = IIF(@Price = 0, [Price], @Price),
        [ImageUrl]           = ISNULL(NULLIF(@ImageUrl, ''), [ImageUrl]),
        [SpecialInstructions]= ISNULL(NULLIF(@SpecialInstructions, ''), [SpecialInstructions]),
        [IsAvailable]        = @IsAvailable,
        [Status]             = @Status,
        [Category]           = ISNULL(NULLIF(@Category, ''), [Category]),
        [Type]               = ISNULL(NULLIF(@Type, ''), [Type]),
        [Ingredients]        = ISNULL(NULLIF(@Ingredients, ''), [Ingredients]),
        [ModifyBy]           = ISNULL(NULLIF(@ModifyBy, ''), [ModifyBy]),
        [ModifyOn]           = ISNULL(@ModifyOn, GETDATE())
    WHERE 
        [AdminId] = @AdminId 
        AND [Id] = @CoffeeId;

    SELECT 0 AS [ErrorCode], 'success' AS [ErrorMessage];
END;
