# Fall-2021-Shopify-DS-Challenge
Data Science Challenge for Shopify Internship Fall 2021
Created by Sujeethan Vigneswaran, May 2, 2021 2:21 AM


# Question 1:

## Think about what could be going wrong with our calculation. Think about a better way to evaluate this data. 
### Data cleaning is neccessary, and simply finding the mean of the order amounts will not work as multiple items are purchased (details in jupyter notebook)

## What metric would you report for this dataset?
### The better way to get the AOV after cleaning would be to get the sum of all order amounts and divide by the total number of items sold. That would give the average cost per item. Then multiply that by the average items per order to get the average order value.

## What is its value?
### AOV: 303.38

# Question 2:
Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

## How many orders were shipped by Speedy Express in total?
### Ans: 54
```
/*
How many orders were shipped by Speedy Express in total?

Thought Process:
Count all distinct order identities where the Shipper name is "Speedy Express"
Ensure that it is easy to reuse query to change the Shipper Name

Notes:
I am used to the BigQuery SQL syntax
w3 schools doesn't allow the WITH column AS (SELECT * FROM table), ... subquery syntax
*/
SELECT 
Shippers.ShipperName as ShipperName, 
COUNT(distinct OrderID) as TotalOrders
FROM Orders
INNER JOIN Shippers
ON Orders.ShipperID = Shippers.ShipperID
WHERE Shippers.ShipperName = "Speedy Express";
```


## What is the last name of the employee with the most orders?
### Ans: Peacock
```
/*
What is the last name of the employee with the most orders?

Thought Process:
Identify each order by EmployeeID, return the MAX of the number of orders
Ensure easy of reuse to get top 3, top 5, bot 3, bot 5 instead 

Notes:
The w3 schools editor is read only and does not allow subqueries
*/
SELECT 
Employees.LastName, 
COUNT(Orders.EmployeeID) AS NumOrders
FROM Employees
INNER JOIN Orders
ON Employees.EmployeeID = Orders.EmployeeId
GROUP BY Employees.LastName
ORDER BY NumOrders DESC
LIMIT 1;
```


## What product was ordered the most by customers in Germany?
### Ans: Boston Crab Meat
```
/*
What product was ordered the most by customers in Germany?

Thought Process:
Get all orders where customers are in Germany
Then get the total quantitiy of all products
Then get the product details of the product with the highest purchase quantity

Notes:
w3 schools read only mode prevented the ability to subquery
The query would be much cleaner and faster with subqueries
*/
SELECT Products.*,
SUM(OrderDetails.Quantity) AS TotalQuantity
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Customers.Country = "Germany"
GROUP BY Products.ProductID, Products.ProductName, Products.SupplierID, Products.CategoryID, Products.Unit, Products.Price
ORDER BY TotalQuantity DESC
LIMIT 1;
```