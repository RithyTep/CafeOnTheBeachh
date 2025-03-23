CREATE PROCEDURE [dbo].[TMercy_Order_GetOrderHistory_1.0.0]
  @OperatorId INT,
  @userId INT
AS
BEGIN
  SELECT
    oh.OrderHistoryID,
    oh.OrderDate,
    oh.TotalAmount,
    oh.Status
  FROM
    [dbo].[OrderHistory] oh
  WHERE
        oh.UserId = @userId
    AND oh.OperatorId = @OperatorId;
END
