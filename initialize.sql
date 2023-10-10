CREATE TABLE Offer (
	`offerID` int unsigned NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`offerID`)
);

CREATE TABLE `Carrier` (
	`carrierID` int unsigned NOT NULL AUTO_INCREMENT,
	`columns` varchar(60) NOT NULL,
	PRIMARY KEY (`carrierID`)
);

CREATE TABLE `CarrierInOffer` (
	`offerID` int unsigned NOT NULL,
	`carrierID` int unsigned NOT NULL,
	PRIMARY KEY (`carrierID`, `offerID`),
	INDEX CarrierInOffer_Offer (`offerID`),
	INDEX CarrierInOffer_Carrier (`carrierID`),
	CONSTRAINT `carrierInOffer_Offer` FOREIGN KEY (`offerID`) REFERENCES `Offer` (`offerID`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `carrierInOffer_Carrier` FOREIGN KEY (`carrierID`) REFERENCES `Carrier` (`carrierID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `DocumentationOfCarrier` (
	`date` date NOT NULL,
	`carrierID` int unsigned NOT NULL,
	PRIMARY KEY (`date`, `carrierID`),
	INDEX DocCarrierID (`carrierID`),
	CONSTRAINT `documentationOfCarrier_offer` FOREIGN KEY (`carrierID`) REFERENCES `CarrierInOffer` (`carrierID`) ON DELETE CASCADE ON UPDATE CASCADE
);
