CREATE DATABASE northwind_capstone_project;

SELECT *
	FROM information_schema.tables
	
SELECT * FROM categories;

/* Question 1: To display the lastname, firstname, title, country, 
and city of employees expected to be in Seattle */
SELECT lastname, firstname, title, country, city
	FROM employees
	WHERE country = 'USA' AND city = 'Seattle';
	
--Question 2: To list the details of all the shippers used by the company--
SELECT *
	FROM shippers;

--Question 3: To list the names and prices of the ten cheapest products--
SELECT productname, unitprice
	FROM products
	ORDER BY unitprice
	LIMIT 10;

--Question 4: To list the countries of Northwind Trader's suppliers are based--
SELECT DISTINCT country
	FROM suppliers;

--Question 5: To get the total value of units for each supplier--
SELECT s.companyname, SUM(od.unitprice * od.quantity) AS TotalValue
	FROM suppliers s
	JOIN products p ON s.supplierid = p.supplierid
	JOIN order_details od ON p.productid = od.productid
	GROUP BY s.companyname;

--Question 6: To display the product name and unit price of the top 3 most expensive products--
SELECT productname, unitprice
	FROM products
	ORDER BY unitprice DESC
	LIMIT 3;
	
/* Question 7: To display the full name, title, and hire date of the employee(s)
in the employees table with the job title Sales Representative */
SELECT CONCAT(title, ' ', firstname, ' ', lastname) 
	AS fullname, title, hiredate
	FROM employees
	WHERE title = 'Sales Representative';

/* Question 8: To display the product name and product quantity of the top 5 ordered products */
SELECT p.productname, SUM(od.quantity) AS productquantity
	FROM products p
	JOIN order_details od ON p.productid = od.productid
	GROUP BY p.productname
	ORDER BY productquantity DESC
	LIMIT 5;

-- Question 9: To display the product name and product quantity of the bottom 5 ordered products--
SELECT p.productname, SUM(od.quantity) AS productquantity
	FROM products p
	JOIN order_details od ON p.productid = od.productid
	GROUP BY p.productname
	ORDER BY productquantity
	LIMIT 5;
	
--Question 10: To find the number of employees hired between August 14, 1992 and August 4, 1993--
SELECT COUNT(*)
	FROM employees
	WHERE hiredate BETWEEN '1992-08-14' AND '1993-08-04';

/* Question 11: To display the productid and productname for each product from
the products table with name containing 'spread' */
SELECT productid, productname
	FROM products
	WHERE productname LIKE '%spread%';
	
--Question 12: To find the total revenue generated based on product ordered between 14/02/1997 and 25/12/1997--
SELECT SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue
	FROM Orders
	JOIN Order_Details
	ON Orders.OrderID = Order_Details.OrderID
	WHERE OrderDate BETWEEN '1997-02-14' AND '1997-12-25';
	
SELECT ROUND (523765.41000791406, 2);

--Question 13: To determine the number of products sold as beverages--
SELECT COUNT(*) AS Beverage_Count
	FROM Products
	JOIN Order_Details
	ON Products.ProductID = Order_Details.ProductID
	WHERE CategoryID = 1;
	
--Question 14: To determine the number of products sold as confections--
SELECT COUNT(*)
	FROM order_details
	JOIN products ON order_details.productid = products.productid
	WHERE products.categoryid = 3;






