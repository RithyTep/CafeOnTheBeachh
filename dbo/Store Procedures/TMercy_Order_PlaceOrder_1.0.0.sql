CREATE PROCEDURE [dbo].[TMercy_Order_PlaceOrder_1.0.0]
  @OperatorId INT,
  @userId INT,
  @TotalAmount DECIMAL(10, 2),
  @OrderItems NVARCHAR(MAX) -- JSON string for order items
AS
BEGIN
  DECLARE @OrderID INT;

  -- Insert into Order table
  INSERT INTO [dbo].[Order] (UserID, OperatorId, TotalAmount, Status, PaymentStatus)
  VALUES (@userId, @OperatorId, @TotalAmount, 'Pending', 'Unpaid');

  SET @OrderID = SCOPE_IDENTITY(); -- Get the newly created OrderID

  -- Insert order items from JSON
  INSERT INTO [dbo].[OrderItem] (OrderID, ProductID, Quantity, Price)
  SELECT
    @OrderID,
    ProductID,
    Quantity,
    Price
  FROM
    OPENJSON(@OrderItems)
    WITH (
      ProductID INT,
      Quantity INT,
      Price DECIMAL(10, 2)
    );

  -- Return the OrderID
  SELECT @OrderID AS OrderID;
END
