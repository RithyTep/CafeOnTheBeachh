CREATE PROCEDURE [dbo].[TMercy_Payment_ProcessPayment_1.0.0]
  @OperatorId INT,
  @OrderID INT,
  @PaymentMethod NVARCHAR(50),
  @Amount DECIMAL(10, 2),
  @TransactionID NVARCHAR(255)
AS
BEGIN
  INSERT INTO [dbo].[Payment] (OrderID, OperatorId, PaymentMethod, Amount, TransactionID, Status)
  VALUES (@OrderID, @OperatorId, @PaymentMethod, @Amount, @TransactionID, 'Completed');

  -- Update order status to 'Paid'
  UPDATE [dbo].[Order]
  SET PaymentStatus = 'Paid'
  WHERE
    OrderID = @OrderID
    AND OperatorId = @OperatorId;
END
