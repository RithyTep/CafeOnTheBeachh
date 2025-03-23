CREATE PROCEDURE [dbo].[TMercy_User_AddFavoriteItem_1.0.0]
  @OperatorId INT,
  @userId INT,
  @ProductID INT
AS
BEGIN
  INSERT INTO [dbo].[FavoriteItem] (UserID, OperatorId, ProductID)
  VALUES (@userId, @OperatorId, @ProductID);
END
