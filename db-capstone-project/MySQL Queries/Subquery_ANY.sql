USE `littlelemon_db`;

SELECT Name AS 'Menu Name'
FROM Menus
WHERE MenuID = ANY( SELECT MenuID FROM Orders WHERE Quantity > 2); 