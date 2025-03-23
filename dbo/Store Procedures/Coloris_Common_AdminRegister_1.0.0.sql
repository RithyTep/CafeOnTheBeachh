CREATE PROCEDURE [dbo].[Coloris_Common_AdminRegister_1.0]
    @AdminName NVARCHAR(50) = '',
    @Password NVARCHAR(255) = ''
AS
BEGIN

    IF EXISTS (SELECT 1 FROM [Admin] WITH(NOLOCK) WHERE AdminName = @AdminName)
    BEGIN
        SELECT -1 AS ErrorCode, 'account exists' AS ErrorMessage;
        RETURN;
    END

    INSERT INTO [dbo].[Admin] (
        [AdminName],
        [Password],
        [CreatedOn],
        [ModifiedOn]
    )
    VALUES (
        @AdminName, -- AdminName
        @Password,  -- Password
        GETDATE(),  -- CreatedOn
        GETDATE()   -- ModifiedOn
    );

    SELECT 0 AS ErrorCode, 'success' AS ErrorMessage;
END
