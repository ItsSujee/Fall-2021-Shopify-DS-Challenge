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
LIMIT 1