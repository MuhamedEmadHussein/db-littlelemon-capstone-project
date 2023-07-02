USE `littlelemon_db`;

DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //

CREATE PROCEDURE CheckBooking(IN BookingDate Date, IN TableNo INT)
BEGIN
DECLARE Tablenum VARCHAR(150) default "Not Exist"; 
DECLARE Response VARCHAR(200);
SELECT TableNumber INTO Tablenum FROM Bookings WHERE Date = BookingDate AND TableNumber = TableNo;
if Tablenum = "Not Exist" THEN
	SET Response = concat("Table " ,TableNo, " Not Booked");
else
	SET Response = concat("Table ",TableNo, " Is Already Booked");
END IF;
SELECT Response;		
END //

DELIMITER ;

CALL CheckBooking('2022-11-12',3);