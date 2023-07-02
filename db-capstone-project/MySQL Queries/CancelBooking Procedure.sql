USE `littlelemon_db`;

DROP PROCEDURE IF EXISTS CancelBooking  ;

DELIMITER //

CREATE PROCEDURE CancelBooking (IN BookID INT) 
BEGIN
DECLARE Response VARCHAR(80);

DELETE FROM Bookings 
WHERE BookingID = BookID;

SELECT CONCAT("Booking ",BookID," Cancelled")AS Confirmation;

END //

DELIMITER ;

CALL CancelBooking (9);
