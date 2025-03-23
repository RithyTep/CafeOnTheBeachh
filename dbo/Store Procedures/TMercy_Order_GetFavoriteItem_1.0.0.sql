CREATE PROCEDURE [dbo].[TMercy_User_GetFavoriteItems_1.0.0]
  @OperatorId INT,
  @userId INT
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
    [dbo].[FavoriteItem] fi
    JOIN [dbo].[Product] p ON fi.ProductID = p.ProductID
  WHERE
    fi.UserID = @userId
    AND fi.OperatorId = @OperatorId;
END
