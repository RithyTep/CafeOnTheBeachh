CREATE OR ALTER PROCEDURE [dbo].[MercyCafe_Main_CustomerRegister_1.0.0]
    @username NVARCHAR(50) = '',
    @password NVARCHAR(255) = '',
    @accountType TINYINT = 1
AS
BEGIN

    SET NOCOUNT ON;
    
    IF EXISTS (SELECT 1 FROM [Customer] WITH(NOLOCK) WHERE Username = @username)
    BEGIN
        SELECT 117 AS ErrorCode, 'Customer already exists' AS ErrorMessage;
        RETURN;
    END

    INSERT INTO [Main].[dbo].[Customer] (
        [Username],
        [Password],
        [AccountType],
        [CreatedOn],
        [ModifiedOn]
    )
    VALUES (
        @username, -- Username
        @password,  -- Password
        @accountType, -- AccountType
        GETDATE(),  -- CreatedOn
        GETDATE()   -- ModifiedOn
    );

    SELECT 0 AS ErrorCode, 'success' AS ErrorMessage;
END
