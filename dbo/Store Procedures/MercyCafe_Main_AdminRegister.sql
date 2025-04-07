CREATE PROCEDURE [dbo].[MercyCafe_Main_CustomerRegister_1.0.0]
    @UserName NVARCHAR(50) = '',
    @Password NVARCHAR(255) = ''
AS
BEGIN

    IF EXISTS (SELECT 1 FROM [Customer] WITH(NOLOCK) WHERE UserName = @UserName)
    BEGIN
        SELECT 117 AS ErrorCode, 'Customer already exists' AS ErrorMessage;
        RETURN;
    END

    INSERT INTO [dbo].[Customer] (
        [UserName],
        [Password],
        [CreatedOn],
        [ModifiedOn]
    )
    VALUES (
        @UserName, -- UserName
        @Password,  -- Password
        GETDATE(),  -- CreatedOn
        GETDATE()   -- ModifiedOn
    );

    SELECT 0 AS ErrorCode, 'success' AS ErrorMessage;
END
