USE `littlelemon_db`;

DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //

CREATE PROCEDURE AddBooking(IN BookID INT,IN CustID INT,IN TableNo INT,IN BookingDate DATE) 
BEGIN
DECLARE Response VARCHAR(80) DEFAULT 'New Booking Added';
INSERT INTO Bookings(BookingID,Date,TableNumber,CustomerID)
VALUES(BookID,BookingDate,TableNo,CustID);
SELECT Response AS Confirmation;
END //

DELIMITER ;

CALL AddBooking(10,3,4,'2022-12-30');