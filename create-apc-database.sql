DROP TABLE IF EXISTS `vehicle`;
DROP TABLE IF EXISTS `gnss`;
DROP TABLE IF EXISTS `apc`;

CREATE TABLE `vehicle` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`VehicleID` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `gnss` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`VehicleRef` INT NOT NULL,
	`TimeStamp` TIMESTAMP NOT NULL,
	`LatitudeDegree` DOUBLE NOT NULL,
	`LatitudeDirection` VARCHAR(50),
	`LongitudeDegree` DOUBLE NOT NULL,
	`LongitudeDirection` VARCHAR(50),
	`Altitude` DOUBLE,
	`SpeedOverGround` DOUBLE,
	`SignalQuality` VARCHAR(50) ,
	`NumberOfSatellites` INT ,
	`HoriziontalDilutionOfPrecision` DOUBLE,
	`VerticalDilutionOfPrecision` DOUBLE,
	`TrackDegreeTrue` DOUBLE,
	`TrackDegreeMagnetic` DOUBLE,
	`GNSSType` VARCHAR(50),
	`GNSSCoordinateSystem` VARCHAR(50),
	PRIMARY KEY (`ID`),
	FOREIGN KEY (`VehicleRef`) REFERENCES vehicle(`ID`)
);

CREATE TABLE `apc` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`GnssLocation` INT NOT NULL,	
	`DoorID` VARCHAR(50) NOT NULL,
	`ObjectClass` VARCHAR(50),
	`In` INT NOT NULL,
	`Out` INT NOT NULL,
	`CountQuality` VARCHAR(50),
	`DoorOpenState` VARCHAR(50),
	`DoorOperationState` VARCHAR(50),
	PRIMARY KEY (`ID`),
	FOREIGN KEY (`GnssLocation`) REFERENCES gnss(`ID`)
);

INSERT INTO `vehicle`(`VehicleID`) VALUES('VEHICLE-1');
INSERT INTO `gnss` (`TimeStamp`, `VehicleRef`, `LatitudeDegree`, `LongitudeDegree`) VALUES(CURRENT_TIMESTAMP, 1,12.3456790,98.76543210);
INSERT INTO `apc` (`GnssLocation`, `DoorID`, `In`, `Out`) VALUES (1,1,10,12);
INSERT INTO `apc` (`GnssLocation`, `DoorID`, `In`, `Out`) VALUES (1,2,6,5);