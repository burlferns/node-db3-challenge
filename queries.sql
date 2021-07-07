-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName, c.CategoryName 
FROM [Product] as p
JOIN [Category] as c
    ON p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id as OrderId
    , s.CompanyName as "Shipper CompanyName"
FROM [Order] as o
JOIN [Shipper] as s
    ON o.ShipVia = s.Id
WHERE OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, od.Quantity
FROM [Order] as o
JOIN [OrderDetail] as od
    ON o.Id = od.OrderId
JOIN [Product] as p
    ON od.ProductId = p.Id
WHERE o.Id = 10251
ORDER BY p.ProductName ;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as OrderId
    , cu.CompanyName as "Customer's Company Name"
    , e.LastName as "Employee's LastName"
FROM [Order] as o
JOIN [Customer] as cu
    ON o.CustomerId = cu.Id
JOIN [Employee] as e
    ON o.EmployeeId = e.Id; 

----------------------------------------------------------------------------    
-- Stretch problems::
-- internet site:    https://www.w3schools.com/Sql/tryit.asp?filename=trysql_select_top

-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records.
SELECT c.CategoryName
	, COUNT(*) AS "No of products"
FROM [Products] AS p
JOIN [Categories] AS c
	ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT od.OrderID
	, COUNT(*) AS "ItemCount"
FROM [OrderDetails] AS od
GROUP BY od.OrderID
ORDER BY od.OrderID;



