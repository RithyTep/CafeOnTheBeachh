CREATE PROCEDURE [dbo].[TMercy_User_GetUserDetails_1.0.0]
  @OperatorId INT,
  @userId INT
AS
BEGIN
  SELECT
    u.UserID,
    u.FirstName,
    u.LastName,
    u.Email,
    u.PhoneNumber,
    u.Address,
    u.City,
    u.State,
    u.ZipCode
  FROM
    [dbo].[User] u
  WHERE
    u.UserID = @userId
    AND u.OperatorId = @OperatorId;
END
