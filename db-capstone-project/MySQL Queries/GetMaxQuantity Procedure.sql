USE `littlelemon_db`;

DROP procedure IF EXISTS GetMaxQuantity;

CREATE procedure GetMaxQuantity()
SELECT MAX(Quantity) as 'Max Quantity in Order'
FROM Orders;

CALL GetMaxQuantity();