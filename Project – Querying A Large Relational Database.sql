/* Perform the following with help of the above database: AdventureWorks2012*/

USE AdventureWorks2012

/* Get all the details from the person table including email ID, phone
number and phone number type */

SELECT * 
FROM Person.Person;

/* Get the details of the sales header order made in May 2011 */

SELECT *
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;

/* Get details of the sales details order made in the month of May 2011: */

SELECT *
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (
   SELECT SalesOrderID
   FROM Sales.SalesOrderHeader
   WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5
);

/* Get the total sales made in May 2011: */

SELECT SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 5;

/* Get the total sales made in the year 2011 by month, order by increasing sales: */

SELECT 
   MONTH(OrderDate) AS Month,
   SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
GROUP BY MONTH(OrderDate)
ORDER BY TotalSales;

/* Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong': */

SELECT SUM(TotalDue) 
FROM Sales.SalesOrderHeader 
WHERE CustomerID IN (
    SELECT BusinessEntityID 
    FROM Person.Person 
    WHERE FirstName = 'Gustavo' AND LastName = 'Achong'
);