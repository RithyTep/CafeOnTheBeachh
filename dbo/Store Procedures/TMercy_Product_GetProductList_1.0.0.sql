CREATE PROCEDURE [dbo].[TMercy_Product_GetProductList_1.0.0]
  @OperatorId INT,
  @Category NVARCHAR(50) = NULL -- Optional category filter
AS
BEGIN
  SELECT
    p.ProductID,
    p.Name,
    p.Description,
    p.Price,
    p.Category,
    p.ImageUrl
  FROM
    [dbo].[Product] p
  WHERE
    p.OperatorId = @OperatorId
    AND (@Category IS NULL OR p.Category = @Category);
END
