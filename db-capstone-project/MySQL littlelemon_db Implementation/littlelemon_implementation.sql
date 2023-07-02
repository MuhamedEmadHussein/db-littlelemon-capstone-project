-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Littlelemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Littlelemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Littlelemon_db` DEFAULT CHARACTER SET utf8 ;
USE `Littlelemon_db` ;

-- -----------------------------------------------------
-- Table `Littlelemon_db`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`Customers` (
  `CustmerID` INT NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`CustmerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `Bookings_Custmers_FK_idx` (`CustomerID` ASC) ,
  CONSTRAINT `Bookings_Custmers_FK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Littlelemon_db`.`Customers` (`CustmerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`MenuItems` (
  `ItemID` INT NOT NULL,
  `Name` VARCHAR(200) NOT NULL,
  `Type` VARCHAR(150) NOT NULL,
  `Price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`Menus` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(200) NOT NULL,
  `ItemID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `Menu_MenuItems_FK_idx` (`ItemID` ASC) ,
  CONSTRAINT `Menu_MenuItems_FK`
    FOREIGN KEY (`ItemID`)
    REFERENCES `Littlelemon_db`.`MenuItems` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`Orders` (
  `OrderID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `CustomerID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `Customers_Orders_FK_idx` (`CustomerID` ASC) ,
  INDEX `Orders_Menus_FK_idx` (`MenuID` ASC),
  CONSTRAINT `Customers_Orders_FK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Littlelemon_db`.`Customers` (`CustmerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Orders_Menus_FK`
    FOREIGN KEY (`MenuID`)
    REFERENCES `Littlelemon_db`.`Menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`Roles` (
  `RoleID` INT NOT NULL,
  `RoleName` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`RoleID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`Staff` (
  `StaffID` INT NOT NULL,
  `Name` VARCHAR(200) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  `RoleID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `Staff_Role_FK_idx` (`RoleID` ASC),
  CONSTRAINT `Staff_Role_FK`
    FOREIGN KEY (`RoleID`)
    REFERENCES `Littlelemon_db`.`Roles` (`RoleID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`OrderDeliveryStatus` (
  `DeliveryID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Status` VARCHAR(100) NOT NULL,
  `OrderID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  INDEX `Orders_Delivery_FK_idx` (`OrderID` ASC) ,
  INDEX `Staff_Delivery_FK_idx` (`StaffID` ASC),
  CONSTRAINT `Orders_Delivery_FK`
    FOREIGN KEY (`OrderID`)
    REFERENCES `Littlelemon_db`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Staff_Delivery_FK`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Littlelemon_db`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Littlelemon_db`.`ContactDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Littlelemon_db`.`ContactDetails` (
  `ContactID` INT NOT NULL,
  `Email` VARCHAR(200) NOT NULL,
  `PhoneNumber` VARCHAR(55) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Country` VARCHAR(150) NOT NULL,
  `City` VARCHAR(150) NOT NULL,
  `CustomerID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`ContactID`),
  INDEX `Customer_Details_FK_idx` (`CustomerID` ASC) ,
  INDEX `Staff_Details_FK_idx` (`StaffID` ASC),
  CONSTRAINT `Customer_Details_FK`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `Littlelemon_db`.`Customers` (`CustmerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Staff_Details_FK`
    FOREIGN KEY (`StaffID`)
    REFERENCES `Littlelemon_db`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
