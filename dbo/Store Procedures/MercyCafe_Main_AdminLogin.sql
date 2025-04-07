CREATE PROCEDURE [dbo].[MercyCafe_Main_CustomerLogin_1.0.0]
  @UserName NVARCHAR(50) = '',
  @Password NVARCHAR(255) = '',
  @AccountType TINYINT = 1
AS
BEGIN
  DECLARE @StoredPassword NVARCHAR(255);

  SELECT @StoredPassword = Password
  FROM [dbo].[Customer] WITH (NOLOCK)
  WHERE UserName = @UserName
  AND AccountType = @AccountType;

  IF @StoredPassword IS NOT NULL
  BEGIN
    IF @Password = @StoredPassword
    BEGIN
      SELECT 0 AS ErrorCode, 'success' AS ErrorMessage;
    END
    ELSE
    BEGIN
      SELECT -1 AS ErrorCode, 'password incorrect' AS ErrorMessage;
    END
  END
  ELSE
  BEGIN
    SELECT -1 AS ErrorCode, 'customer not found' AS ErrorMessage;
  END
END
