-- SQL Practice Problems
-- 57 beginning, intermediate, and advanced challenges for you to solve using a "learn-by-doing" approach
-- Database used -- 	NORTHWIND DATABASE	-----
-- Author Sylvia Moestl Vasilik
-- Solved by Bilau Dauda
-- Date June, 2020

show databases;
use northwind;

-- 1. 
-- Which shippers do we have?
-- We have a table called Shippers. Return all the fields from all the shippers

SELECT 
    *
FROM
    shippers;
    
-- 2   
-- Certain fields from Categories
-- In the Categories table, selecting all the fields using this SQL:
-- …will return 4 columns. We only want to see two columns, CategoryName and Description.
SELECT 
    categoryname, Description
FROM
    categories;
    
-- 3. 
-- Sales Representatives
-- We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. 
-- Write a SQL statement that returns only those employees.

SELECT 
    firstname, lastname, hiredate, title
FROM
    employees
WHERE
    title = 'sales Representative';
    
-- 4. Sales Representatives in the United States
-- Now we’d like to see the same columns as above, but only for those employees 
-- that both have the title of Sales Representative, and also are in the United States.

SELECT 
    *
FROM
    employees
WHERE
    title = 'Sales Representative'
        AND country = 'USA';
        
-- 5. Orders placed by specific EmployeeID
-- Show all the orders placed by a specific employee.
-- The EmployeeID for this Employee (Steven Buchanan) is 5.      

SELECT 
    orderid, YEAR(orderdate) 'Orderdate'
FROM
    orders
WHERE
    employeeid = 5;
    
-- 6. Suppliers and ContactTitles
-- In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for those Suppliers 
-- whose ContactTitle is not Marketing Manager.
SELECT 
    supplierid, contactname, contacttitle
FROM
    suppliers
WHERE
    contacttitle != 'Marketing Manager';
    
-- 7. Products with “queso” in ProductName
-- In the products table, we’d like to see the ProductID and ProductName for those products 
-- where the ProductName includes the string “queso”.

SELECT 
    productid, productname
FROM
    products
WHERE
    productname LIKE '%queso%';
    
-- 8. Orders shipping to France or Belgium
-- Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, CustomerID,
-- and ShipCountry for the orders where the ShipCountry is either France or Belgium.

SELECT 
    orderid, customerid, shipcountry
FROM
    orders
WHERE
    shipcountry IN ('France' , 'Belgium');
    
-- 9. Orders shipping to any country in Latin America
-- Now, instead of just wanting to return all the orders from France of Belgium,
-- we want to show all the orders from any Latin American country.
-- But we don’t have a list of Latin American countries in a table in the Northwind database.
-- So, we’re going to just use this list of Latin American countries that happen to be in the Orders table:
-- Brazil
-- Mexico
-- Argentina
-- Venezuela

SELECT 
    orderid, customerid, shipcountry
FROM
    orders
WHERE
    shipcountry IN ('Venezuela' , 'Argentina', 'Mexico', 'Brazil');
    
-- 10. Employees, in order of age
-- For all the employees in the Employees table, show the FirstName,
-- LastName, Title, and BirthDate. Order the results by BirthDate, so we have the oldest employees first.

SELECT 
    firstname, lastname, title, birthdate
FROM
    employees
ORDER BY birthdate;

-- 11. Showing only the Date with a DateTime field
-- In the output of the query above, showing the Employees in order of BirthDate,
-- we see the time of the BirthDate field, which we don’t want. 
-- Show only the date portion of the BirthDate field.

SELECT 
    firstname, lastname, title, DATE(birthdate) Birthdate
FROM
    employees
ORDER BY birthdate;


-- 12. Employees full name
-- Show the FirstName and LastName columns from the Employees table,and then create a
-- new column called FullName, showing FirstName and LastName joined together in one column,
-- with a space in-between.

SELECT 
    firstname,
    lastname,
    CONCAT(firstname, '  ', lastname) AS fullname
FROM
    employees;
    
-- 13. OrderDetails amount per line item
-- In the OrderDetails table, we have the fields UnitPrice and Quantity.
-- Create a new field, TotalPrice, that multiplies these two together.
-- We’ll ignore the Discount field for now.
-- In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.

SELECT 
    orderid,
    productid,
    quantity,
    ROUND(unitprice, 2) AS unitprice,
    (ROUND(unitprice, 2) * quantity) AS TotalPrice
FROM
    `order details`;
    
-- 14. How many customers?
-- How many customers do we have in the Customers table? Show one value only,
-- and don’t rely on getting the recordcount at the end of a resultset.

SELECT 
    COUNT(*) AS 'total customers'
FROM
    customers;
    
-- 15. When was the first order?
-- Show the date of the first order ever made in the Orders table.
use northwind;
SELECT 
    MIN(orderdate) AS firstOrder
FROM
    orders;

-- 16. Countries where there are customers
-- Show a list of countries where the Northwind company has customers.

SELECT DISTINCT
    country AS country
FROM
    customers order by country;
    
-- 17. Contact titles for customers
-- Show a list of all the different values in the Customers table for ContactTitles.
-- Also include a count for each ContactTitle.
-- This is similar in concept to the previous question “Countries where there are customers”,
-- except we now want a count for each ContactTitle.

SELECT 
    contactTitle, COUNT(contacttitle) AS 'TotalTitle'
FROM
    customers
GROUP BY contacttitle
order by Totaltitle desc;

-- 18. Products with associated supplier names
-- We’d like to show, for each product, the associated Supplier.
-- Show the ProductID, ProductName, and the CompanyName of the Supplier.
-- Sort by ProductID.
-- This question will introduce what may be a new concept, the Join clause in SQL.
-- The Join clause is used to join two or more relational database tables together in a logical way.
-- Here’s a data model of the relationship between Products and Suppliers.

SELECT 
    p.productid AS ProductID,
    p.productname AS Productname,
    s.companyname AS supplier
FROM
    products AS p
        JOIN
    suppliers AS s ON s.supplierid = p.supplierid;
    
-- 19. Orders and the Shipper that was used
-- We’d like to show a list of the Orders that were made, including the Shipper that was used.
-- Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID.
-- In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.

-- select * from shippers;
-- select * from orders;
SELECT 
    o.orderid, DATE(o.orderdate) OrderDate, s.companyname
FROM
    orders o
        JOIN
    shippers s ON s.shipperid = o.shipvia;
    
    
-- --------------------- Congratulations! You've completed the introductory problems  ----------------------------------------------















    




















    






    



  
        
        








    
    




    







