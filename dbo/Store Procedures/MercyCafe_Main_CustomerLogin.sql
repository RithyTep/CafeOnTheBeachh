CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Main_CustomerLogin_1.0.0]
  @username NVARCHAR(50) = '',
  @password NVARCHAR(255) = '',
  @accountType TINYINT = 1
AS
BEGIN
  SET NOCOUNT ON;
  
  SELECT TOP 1 
    0 AS ErrorCode, 
    'success' AS ErrorMessage,
    c.Username,
    c.CustomerId
  FROM [dbo].[Customer] c WITH (NOLOCK)
  WHERE c.Username = @username
    AND c.AccountType = @accountType
    AND c.Password = @password;

  
  IF @@ROWCOUNT = 0
  BEGIN
    IF EXISTS (
      SELECT 1 
      FROM [dbo].[Customer] WITH (NOLOCK)
      WHERE Username = @username
        AND AccountType = @accountType
    )
    BEGIN
      SELECT -1 AS ErrorCode, 'password incorrect' AS ErrorMessage;
    END
    ELSE
    BEGIN
      SELECT -1 AS ErrorCode, 'customer not found' AS ErrorMessage;
    END
  END
END
