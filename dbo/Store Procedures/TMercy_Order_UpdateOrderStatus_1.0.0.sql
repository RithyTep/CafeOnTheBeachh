CREATE PROCEDURE [dbo].[TMercy_Order_UpdateOrderStatus_1.0.0]
  @OperatorId INT,
  @OrderID INT,
  @Status NVARCHAR(50)
AS
BEGIN
  UPDATE [dbo].[Order]
  SET Status = @Status
  WHERE
    OrderID = @OrderID
    AND OperatorId = @OperatorId;
END
