USE AdventureWorks2014


--creating stored procedure with 2 paramaters

CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
AS
SELECT *
FROM Person.Address

WHERE City = ISNULL(@City,City)
AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1 ,AddressLine1) + '%'
GO
--Execute:

EXEC dbo.uspGetAddress @City = 'Calgary'

--2 paramaters END


/* SIMPLE OUTPUT*/

CREATE PROC dbo.uspGetAddressCount @City nvarchar(30), @AddressCount int OUTPUT
AS 
SELECT @AddressCount = count(*)
FROM AdventureWorks2014.Person.Address
WHERE City = @City

DECLARE @AddressCount int

EXEC dbo.uspGetAddressCount 'Calgary', @AddressCount OUTPUT
SELECT @AddressCount

/* TRY CATCH*/

CREATE PROC dbo.uspTryCatchTest
AS
BEGIN TRY 
	SELECT 1/0
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrorNumber
	,ERROR_SEVERITY() AS ErrorSeverity
	,ERROR_STATE() AS ErrorState
	,ERROR_PROCEDURE() AS ErrorProcedure
	,ERROR_LINE() AS ErrorLine
	,ERROR_MESSAGE() AS ErrorMessage
END CATCH

/* This is a line comment*/

--this is an in-line comment

/*
This
is
a
block
comment
*/

/* No count Xmessages */

CREATE PROC dbo.uspGetAddress @City nvarchar(30)
AS 
SET NOCOUNT ON 
SELECT* FROM
Person.Address
WHERE City=@City
GO

-- not using SET NOCOUNT ON 
CREATE PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SET NOCOUNT ON
SELECT * 
FROM Person.Address
WHERE City = @City
PRINT @@ROWCOUNT
GO
--END

/* Alter procedures*/

ALTER PROCEDURE dbo.uspGetAddress @City nvarchar(30)
AS
SELECT * 
FROM Person.Address
WHERE City LIKE @City + '%'
GO
--END






CREATE PROC PersonInfo @Name nvarchar(30)=NULL , @LastName nvarchar(50)=Null
AS 
SET NOCOUNT ON
SELECT FirstName, LastName, PhoneNumber, EmailAddress
FROM Person.Person
INNER JOIN Person.PersonPhone ON PersonPhone.BusinessEntityID = Person.BusinessEntityID 
INNER JOIN Person.EmailAddress ON EmailAddress.BusinessEntityID = Person.BusinessEntityID
INNER JOIN Sales.PersonCreditCard ON PersonCreditCard.BusinessEntityID = Person.BusinessEntityID 

WHERE FirstName LIKE @Name + '%' 
OR LastName LIKE @LastName  + '%'
GO


EXEC PersonInfo @LastName = 'Thompson' 

