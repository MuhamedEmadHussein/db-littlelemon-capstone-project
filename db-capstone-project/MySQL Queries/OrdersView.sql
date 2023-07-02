USE `littlelemon_db`;

create view OrdersView AS
SELECT OrderID,Quantity,TotalCost AS 'Cost'
FROM Orders
WHERE Quantity > 2; 

SELECT * FROM OrdersView;

