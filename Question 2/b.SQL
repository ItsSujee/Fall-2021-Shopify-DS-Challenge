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
LIMIT 1