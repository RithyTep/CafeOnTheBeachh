CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Product_UpdateCoffeeItem_1.0.0]
    @customerId INT,
    @coffeeId INT,
    @coffeeName NVARCHAR(100),
    @description NVARCHAR(MAX) = NULL,
    @price DECIMAL(19,6) = 0,
    @imageUrl NVARCHAR(MAX) = NULL,
    @specialInstructions NVARCHAR(255) = NULL,
    @isAvailable BIT = 0,
    @status BIT = 1,
    @category NVARCHAR(50) = NULL,
    @type NVARCHAR(50) = NULL,
    @ingredients NVARCHAR(MAX) = NULL,
    @modifyBy NVARCHAR(100) = NULL,
    @modifyOn DATETIME = NULL
  AS
  BEGIN
    SET NOCOUNT ON;

    UPDATE [Product].[dbo].[Product]
    SET 
      [CoffeeName]         = ISNULL(NULLIF(@coffeeName, ''), [CoffeeName]),
      [Description]        = ISNULL(NULLIF(@description, ''), [Description]),
      [Price]              = IIF(@price = 0, [Price], @price),
      [ImageUrl]           = ISNULL(NULLIF(@imageUrl, ''), [ImageUrl]),
      [SpecialInstructions]= ISNULL(NULLIF(@specialInstructions, ''), [SpecialInstructions]),
      [IsAvailable]        = @isAvailable,
      [Status]             = @status,
      [Category]           = ISNULL(NULLIF(@category, ''), [Category]),
      [Type]               = ISNULL(NULLIF(@type, ''), [Type]),
      [Ingredients]        = ISNULL(NULLIF(@ingredients, ''), [Ingredients]),
      [ModifyBy]           = ISNULL(NULLIF(@modifyBy, ''), [ModifyBy]),
      [ModifyOn]           = ISNULL(@modifyOn, GETDATE())
    WHERE 
      [CustomerId] = @customerId 
      AND [Id] = @coffeeId;

    SELECT 0 AS [ErrorCode], 'success' AS [ErrorMessage];
  END;
