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