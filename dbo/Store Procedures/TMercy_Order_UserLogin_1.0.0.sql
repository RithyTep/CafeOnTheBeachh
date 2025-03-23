CREATE PROCEDURE [dbo].[TMercy_Order_UserLogin_1.0.0]
    @AdminName NVARCHAR(50) = '',
    @Password NVARCHAR(255) = ''
AS
BEGIN
    DECLARE @StoredPassword NVARCHAR(255);

    SELECT @StoredPassword = Password
    FROM [dbo].[Admin] WITH (NOLOCK)
    WHERE AdminName = @AdminName;

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
        SELECT -1 AS ErrorCode, 'admin not found' AS ErrorMessage;
    END

    SELECT 0 AS ErrorCode, 'success' AS ErrorMessage;
END
