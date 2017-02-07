--Jillian Preece
--February 7, 2017
--Lab 3


--Number 1

SELECT ordNumber, totalUSD
FROM Orders;

--Number 2

SELECT name, city
FROM Agents
WHERE name = 'Smith';

--Number 3

SELECT pid, name, priceUSD
FROM Products
WHERE quantity > 200100;

--Number 4

SELECT name, city
FROM Customers
WHERE city = 'Duluth';

--Number 5

SELECT name
FROM Agents 
WHERE city != 'New York' 
AND city!= 'Duluth';

--Number 6

SELECT *
FROM Products
WHERE city != 'Duluth'
AND city != 'Dallas'
AND priceUSD >= 1;

--Number 7

SELECT *
FROM Orders
WHERE month = 'Feb'
OR month = 'May';

--Number 8

SELECT *
FROM Orders
WHERE month = 'Feb'
AND totalUSD >= 600;

--Number 9

SELECT *
FROM Orders
WHERE cid = 'c005';

