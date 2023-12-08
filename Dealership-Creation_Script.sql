# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          Erik's_Cars_Inc                                 #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS Eriks_Cars_Inc;

CREATE DATABASE IF NOT EXISTS Eriks_Cars_Inc;

USE Eriks_Cars_Inc;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `Dealerships` (
    `DealershipID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(50),
    `Address` VARCHAR(50),
    `Phone` VARCHAR(12),
    CONSTRAINT `PK_Categories` PRIMARY KEY (`DealershipID`)
);

CREATE INDEX `Name` ON `Dealerships` (`Name`);

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Vehicles` (
    `VIN` VARCHAR(17) NOT NULL,
	`Make` VARCHAR(15),
	`Model` VARCHAR(15),
    `Sold` BIT(1),
    CONSTRAINT `PK_Vehicles` PRIMARY KEY (`VIN`)
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `Inventory` (
    `DealershipID` INTEGER NOT NULL,
    `VIN` VARCHAR(17) NOT NULL,
    CONSTRAINT `FK_Inventory_Dealerships` FOREIGN KEY (`DealershipID`) REFERENCES Dealerships(DealershipID),
	CONSTRAINT `FK_Inventory_Vehicles` FOREIGN KEY (`VIN`) REFERENCES Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add table "Sales_Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `Sales_Contracts` (
    `SaleID` INTEGER NOT NULL AUTO_INCREMENT,
    `VIN` VARCHAR(17) NOT NULL,
	`TotalPrice` DECIMAL(10, 2),
    CONSTRAINT `PK_Sales_Contracts` PRIMARY KEY (`SaleID`),
	CONSTRAINT `FK_Sales_Contracts_Vehicles` FOREIGN KEY (`VIN`) REFERENCES Vehicles(VIN)
);

# ---------------------------------------------------------------------- #
# Add table "Lease_Contracts"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `Lease_Contracts` (
    `LeaseID` INTEGER NOT NULL AUTO_INCREMENT,
    `VIN` VARCHAR(17) NOT NULL,
	`TotalPrice` DECIMAL(10, 2),
	`MonthlyPrice` DECIMAL(10, 2),
    CONSTRAINT `PK_Lease_Contracts` PRIMARY KEY (`LeaseID`),
	CONSTRAINT `FK_Lease_Contracts_Vehicles` FOREIGN KEY (`VIN`) REFERENCES Vehicles(VIN)
);

##----------------------------------------------------------------------##

# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                            #
# ---------------------------------------------------------------------- #

INSERT INTO Dealerships (Name, Address, Phone) VALUES
	('AutoHaven Dealership', '123 Main Street', '555-123-4567'),
	('Speedy Motors', '789 Oak Avenue', '555-987-6543'),
	('City Cars Emporium', '456 Maple Blvd', '555-234-5678'),
	('Sunset Auto Sales', '321 Pine Street', '555-876-5432'),
	('Golden Wheels Motors', '567 Cedar Drive', '555-345-6789');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #

INSERT INTO Vehicles (VIN, Make, Model, Sold) VALUES
	('1HGCM82633A000001', 'Honda', 'Accord', 1),
	('2T3ZFREV0FW000002', 'Toyota', 'Rav4', 0),
	('3VWCM82644M000003', 'Volkswagen', 'Jetta', 1),
	('4S3BMHB67B000004', 'Subaru', 'Legacy', 0),
	('5YFBURHE0EP000005', 'Toyota', 'Corolla', 1),
	('6G2VC579X5L000006', 'Pontiac', 'GTO', 0),
	('7FARW2H88JE000007', 'Ford', 'Mustang', 1),
	('8JFDXHTR1WL000008', 'Jeep', 'Cherokee', 0),
	('9R2GG00Y430000009', 'Nissan', 'Altima', 1),
	('10L9AAA2X2000010', 'Chevrolet', 'Camaro', 0),
	('11P0WEHDB9C000011', 'Dodge', 'Charger', 1),
	('12L2AK5J7H4000012', 'Kia', 'Soul', 0),
	('13TMBW5H1ED000013', 'BMW', 'X5', 1),
	('14FMCK8C4DH000014', 'Ford', 'Escape', 0),
	('15VWZZZ6KZ6G00001', 'Volkswagen', 'Golf', 1);

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #

INSERT INTO Inventory (DealershipID, VIN) VALUES
	('1', '1HGCM82633A000001'),
	('2', '2T3ZFREV0FW000002'),
	('3', '3VWCM82644M000003'),
	('4', '4S3BMHB67B000004'),
	('5', '5YFBURHE0EP000005'),
	('1', '6G2VC579X5L000006'),
	('2', '7FARW2H88JE000007'),
	('3', '8JFDXHTR1WL000008'),
	('4', '9R2GG00Y430000009'),
	('5', '10L9AAA2X2000010'),
	('1', '11P0WEHDB9C000011'),
	('2', '12L2AK5J7H4000012'),
	('3', '13TMBW5H1ED000013'),
	('4', '14FMCK8C4DH000014'),
	('5', '15VWZZZ6KZ6G00001');

# ---------------------------------------------------------------------- #
# Add info into "Sales_Contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO Sales_Contracts (VIN, TotalPrice) VALUES
	('1HGCM82633A000001', '15000.00'),
	('5YFBURHE0EP000005', '54221.00'),
	('9R2GG00Y430000009', '64351.00'),
	('13TMBW5H1ED000013', '12314.00');

# ---------------------------------------------------------------------- #
# Add info into "Lease_Contracts"                                        #
# ---------------------------------------------------------------------- #

INSERT INTO Lease_Contracts (VIN, TotalPrice, MonthlyPrice) VALUES
	('3VWCM82644M000003', '12345.00', '412.00'),
	('7FARW2H88JE000007', '43213.00', '123.00'),
	('11P0WEHDB9C000011', '52431.00', '42.00'),
	('15VWZZZ6KZ6G00001', '100000.00', '12.00');
