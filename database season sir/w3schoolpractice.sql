# TO CREATE DATABASE
CREATE DATABASE w3schoolpractice;

#TO USE DATABASE
USE w3schoolpractice;

# TO CREATE TABLE
CREATE TABLE Customers (
CustomerID  varchar(10),
FirstName varchar(20),
LastName varchar(20),
Gender char(1),
DateofBirth date,
Email varchar(225),
City varchar(225),
Address varchar(225)
);

#TO INSERT VALUES
INSERT INTO Customers (CustomerID, FirstName , LastName, Gender, DateofBirth,
Email , City , Address)
values('001', 'Sneha', 'Thakur','F', '2004-06-15','sneha@gmail.com','Nepal','janakpur'),
('002', 'Anjali', 'Thakur','F', '2001-07-17','Anjali@gmail.com','Nepal','Kathmandu'),
('003', 'Bishal', 'Thakur','M', '2006-02-26','Bishal@gmail.com','Nepal','Silliguri');

select * from Customers;

#TO UPDATE DATABASE
update Customers
set LastName = 'Yadav'
where CustomerID ='002';

#TO DELETE DATABASE
DELETE from Customers
 WHERE CustomerId = '003';

#TO ALTER AND DROP DATABASE
ALTER TABLE Customers
DROP COLUMN PhoneNo;

#TO USE OPERATORS
#ALL
SELECT FirstName 
FROM Customers
WHERE CustomerID = ALL (SELECT CustomerID FROM Customers WHERE Address = 'Kathmandu');

#AND
SELECT * FROM Customers
WHERE City = "Nepal" AND Address = "Janakpur";

#ANY
SELECT * FROM Customers
WHERE DateofBirth > ANY
(SELECT DateofBirth 
 FROM Customers 
 WHERE DateofBirth > '2004-01-01');
 
 #IN
 SELECT * FROM Customers
WHERE City IN ('Kathmandu', 'Janakpur');

#BETWEEN
SELECT * FROM Customers
WHERE DateofBirth BETWEEN '2001-01-01' AND '2005-12-31';

#NOT
SELECT * FROM Customers
WHERE NOT Gender = 'M';

#AND
SELECT * FROM Customers 
WHERE Gender = 'F' AND City = 'Nepal';

#OR
SELECT * FROM Customers 
WHERE City = 'Kathmandu' OR City = 'Janakpur';


#LIKE
 -- Names starting with 'S'
SELECT * FROM Customers
WHERE FirstName LIKE 'S%';

-- Names ending with 'al'
SELECT * FROM Customers
WHERE FirstName LIKE '%al';

-- Names containing 'sh'
SELECT * FROM Customers
WHERE FirstName LIKE '%sh%';

#T0 USE JOIN
# INNER JOINS
SELECT 
    A.FirstName AS Customer1,
    B.FirstName AS Customer2,
    A.City
FROM Customers A
INNER JOIN Customers B
ON A.City = B.City AND A.CustomerID <> B.CustomerID;

#LEFT JOINS
SELECT 
    A.FirstName AS Customer,
    B.FirstName AS OtherCustomerInSameCity,
    A.City
FROM Customers A
LEFT JOIN Customers B
ON A.City = B.City AND A.CustomerID <> B.CustomerID;

#RIGHT JOINS
SELECT 
    A.FirstName AS Customer,
    B.FirstName AS OtherCustomerInSameCity,
    A.City
FROM Customers A
RIGHT JOIN Customers B
ON A.City = B.City AND A.CustomerID <> B.CustomerID;







 



 





