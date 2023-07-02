USE `littlelemon_db`;

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //


CREATE PROCEDURE AddValidBooking(IN BookingDate Date, IN TableNo INT)
BEGIN
DECLARE Tablenum VARCHAR(150) default "Not Exist"; 
DECLARE Response VARCHAR(200);
DECLARE CustomerID INT DEFAULT 202063;
SELECT TableNumber INTO Tablenum FROM Bookings WHERE Date = BookingDate AND TableNumber = TableNo;
START TRANSACTION;
if Tablenum = "Not Exist" THEN
	SET Response = concat("Table " ,TableNo, " Not Booked - Booking Inserted Successfully");
    INSERT INTO Bookings(BookingID,Date,TableNumber,CustomerID)
    VALUES(5,BookingDate,TableNo,2);
    COMMIT;
else
	SET Response = concat("Table ",TableNo, " Is Already Booked - Booking Cancelled");
    ROLLBACK;
END IF;
SELECT Response;		
END //

DELIMITER ;

CALL AddValidBooking('2022-11-12',6);