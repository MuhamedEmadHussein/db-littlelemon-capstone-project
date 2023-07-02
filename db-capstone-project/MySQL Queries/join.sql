USE `littlelemon_db`;

SELECT C.CustmerID,C.Name,O.OrderID,O.TotalCost,M.Name,MI.CourseName
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustmerID = O.CustomerID
INNER JOIN Menus as M
ON O.MenuID = M.MenuID
INNER JOIN MenuItems as MI
ON M.ItemID = MI.ItemID
WHERE O.TotalCost > 150;