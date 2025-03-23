CREATE PROCEDURE [dbo].[TMercy_Order_GetOrderDetails_1.0.0]
  @OperatorId INT,
  @OrderID INT
AS
BEGIN
  SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.Status,
    o.PaymentStatus,
    p.ProductID,
    p.Name,
    oi.Quantity,
    oi.Price
  FROM
    [dbo].[Order] o
    JOIN [dbo].[OrderItem] oi ON o.OrderID = oi.OrderID
    JOIN [dbo].[Product] p ON oi.ProductID = p.ProductID
  WHERE
    o.OrderID = @OrderID
    AND o.OperatorId = @OperatorId;
END
