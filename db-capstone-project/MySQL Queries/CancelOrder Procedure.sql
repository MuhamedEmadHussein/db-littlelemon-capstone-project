USE `littlelemon_db`;

DROP procedure IF EXISTS CancelOrder;

DELIMITER //

CREATE PROCEDURE CancelOrder(IN ID INT)
BEGIN
DELETE FROM Orders 
WHERE OrderID = ID;
SELECT CONCAT("Order ", ID, " IS Deleted") AS 'Confirmation';
END //

DELIMITER ;

CALL CancelOrder(5);