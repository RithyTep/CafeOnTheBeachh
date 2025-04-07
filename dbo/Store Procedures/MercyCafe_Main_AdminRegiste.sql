CREATE PROCEDURE [dbo].[TMercy_Order_UserRegister_1.0.0]
    @FirstName NVARCHAR(50),       -- User's first name
    @LastName NVARCHAR(50),        -- User's last name
    @Email NVARCHAR(100),          -- User's email (used for login)
    @PasswordHash NVARCHAR(255),   -- Hashed password for security
    @PhoneNumber NVARCHAR(15) = NULL -- Optional phone number
AS
BEGIN
    INSERT INTO [dbo].[User] (FirstName, LastName, Email, PasswordHash, PhoneNumber)
    VALUES (@FirstName, @LastName, @Email, @PasswordHash, @PhoneNumber);

    SELECT
        UserID AS Id,
        FirstName,
        LastName,
        Email,
        PhoneNumber,
        CreatedAt
    FROM
        [dbo].[User]
    WHERE
        UserID = SCOPE_IDENTITY(); 
END
