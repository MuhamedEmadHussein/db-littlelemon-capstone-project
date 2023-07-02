USE `littlelemon_db`;

DROP PROCEDURE IF EXISTS UpdateBooking ;

DELIMITER //

CREATE PROCEDURE UpdateBooking (IN BookID INT,IN BookingDate DATE) 
BEGIN
DECLARE Response VARCHAR(80);

UPDATE Bookings 
SET Date = BookingDate
WHERE BookingID = BookID;

SELECT CONCAT("Booking ",BookID," Updated")AS Confirmation;

END //

DELIMITER ;

CALL UpdateBooking (9,'2022-12-17');
