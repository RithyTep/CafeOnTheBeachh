CREATE PROCEDURE [dbo].[TMercy_Payment_GetPaymentDetails_1.0.0]
  @OperatorId INT,
  @OrderID INT
AS
BEGIN
  SELECT
    p.PaymentID,
    p.PaymentMethod,
    p.Amount,
    p.TransactionID,
    p.Status
  FROM
    [dbo].[Payment] p
  WHERE
    p.OrderID = @OrderID
    AND p.OperatorId = @OperatorId;
END
