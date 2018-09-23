use cs598_w1


IF OBJECT_ID('salesTransactions') IS NOT NULL
    DROP TABLE salesTransactions;
GO

IF OBJECT_ID('vehicleInventory') IS NOT NULL
    DROP TABLE vehicleInventory;
GO

IF OBJECT_ID('vehicleTypeOptionsPowerTrans') IS NOT NULL
    DROP TABLE vehicleTypeOptionsPowerTrans;
GO


IF OBJECT_ID('vehicleTypeOptionsTrimPackages') IS NOT NULL
    DROP TABLE vehicleTypeOptionsTrimPackages;
GO

--vehicleTypeOptionsMotors
IF OBJECT_ID('vehicleTypeOptionsMotors') IS NOT NULL
    DROP TABLE vehicleTypeOptionsMotors;
GO

IF OBJECT_ID('vehicleTypeOptionsDoors') IS NOT NULL
    DROP TABLE vehicleTypeOptionsDoors;
GO


IF OBJECT_ID('vehicleTypeOptionsColors') IS NOT NULL
    DROP TABLE vehicleTypeOptionsColors;
GO

IF OBJECT_ID('vehicleTypes') IS NOT NULL
    DROP TABLE vehicleTypes;
GO


IF OBJECT_ID('vehicleBreeds') IS NOT NULL
    DROP TABLE vehicleBreeds;
GO
--DROP TABLE IF EXISTS vehicleColors

IF OBJECT_ID('vehiclePowerTrans') IS NOT NULL
    DROP TABLE vehiclePowerTrans;
GO

IF OBJECT_ID('vehicleColors') IS NOT NULL
    DROP TABLE vehicleColors;
GO
--Drop Table IF Exists vehicleDoorStyles
IF OBJECT_ID('vehicleDoorStyles') IS NOT NULL
    DROP TABLE vehicleDoorStyles;
GO

--DROP TABLE IF EXISTS customer
IF OBJECT_ID('customers') IS NOT NULL
    DROP TABLE customers;
GO

--DROP TABLE IF EXISTS customer
IF OBJECT_ID('customerPurchasers') IS NOT NULL
    DROP TABLE customerPurchasers;
GO

--DROP TABLE IF EXISTS vehicleCompanies
IF OBJECT_ID('vehicleMakes') IS NOT NULL
    DROP TABLE vehicleMakes;
GO
--DROP TABLE IF EXISTS vehicleModels
IF OBJECT_ID('vehicleModels') IS NOT NULL
    DROP TABLE vehicleModels;
GO
IF OBJECT_ID('vehicleTrimPackages') IS NOT NULL
    DROP TABLE vehicleTrimPackages;
GO

--DROP TABLE IF EXISTS vehicleYears
IF OBJECT_ID('vehicleYears') IS NOT NULL
    DROP TABLE vehicleYears;
GO

IF OBJECT_ID('vehicleSaleYears') IS NOT NULL
    DROP TABLE vehicleSaleYears;
GO


--DROP TABLE IF EXISTS vehicleMotorTypes
IF OBJECT_ID('vehicleMotors') IS NOT NULL
    DROP TABLE vehicleMotors;
GO

--DROP TABLE IF EXISTS salesDiscounts
IF OBJECT_ID('salesDiscounts') IS NOT NULL
    DROP TABLE salesDiscounts;
GO

IF OBJECT_ID('customerOccupationCategories') IS NOT NULL
    DROP TABLE customerOccupationCategories;
GO

--DROP TABLE IF EXISTS customerOccupation
IF OBJECT_ID('customerOccupations') IS NOT NULL
    DROP TABLE customerOccupations;
GO

IF OBJECT_ID('customerSubOccupationCategories') IS NOT NULL
    DROP TABLE customerSubOccupationCategories;
GO

--locationAddresses
IF OBJECT_ID('locationAddresses') IS NOT NULL
    DROP TABLE locationAddresses;
GO


IF OBJECT_ID('locationCitiesInStatesZips') IS NOT NULL
    DROP TABLE locationCitiesInStatesZips;
GO

--locationCitiesInStates
IF OBJECT_ID('locationCitiesInStates') IS NOT NULL
    DROP TABLE locationCitiesInStates;
GO



--locationZips
IF OBJECT_ID('locationZips') IS NOT NULL
    DROP TABLE locationZips;
GO

--locationCountry
IF OBJECT_ID('locationCountries') IS NOT NULL
    DROP TABLE locationCountries;
GO

--DROP TABLE IF EXISTS customerOccupation
IF OBJECT_ID('locationStates') IS NOT NULL
    DROP TABLE locationStates;
GO

--DROP TABLE IF EXISTS customerOccupation
IF OBJECT_ID('locationCities') IS NOT NULL
    DROP TABLE locationCities;
GO


--DROP TABLE IF EXISTS customerOccupation
IF OBJECT_ID('customerLoanStatuses') IS NOT NULL
    DROP TABLE customerLoanStatuses;
GO



CREATE TABLE vehicleMakes (
    makeId int IDENTITY(1,1),
    makeName varchar(255) NOT NULL,
    PRIMARY KEY (makeId),
	CONSTRAINT UC_vehiclecompanyName UNIQUE (makeName)
);


CREATE TABLE vehicleDoorStyles (
    doorId int IDENTITY(1,1),
    doorCount int NOT NULL,
	doorStyle varchar(255),
    PRIMARY KEY (doorId),
	CONSTRAINT UC_vehicledoorName UNIQUE (doorCount, doorStyle )
);

CREATE TABLE vehicleModels (
    modelId int IDENTITY(1,1),
    modelName varchar(255) NOT NULL,
    PRIMARY KEY (modelId),
	CONSTRAINT UC_vehiclemodelName UNIQUE (modelName)
);

CREATE TABLE vehiclePowerTrans (
    powerTranId int IDENTITY(1,1),
    powerTranName varchar(255) NOT NULL,
    PRIMARY KEY (powerTranId),
	CONSTRAINT UC_vehiclepowerTranName UNIQUE (powerTranName)
);


CREATE TABLE vehicleTrimPackages (
    trimPackageId int IDENTITY(1,1),
    trimPackageName varchar(255), 
    PRIMARY KEY (TrimPackageId),
	CONSTRAINT UC_vehicleTrimPackageName UNIQUE (trimPackageName)
);


CREATE TABLE vehicleColors (
    colorId int IDENTITY(1,1),
    colorName varchar(255) NOT NULL,
    PRIMARY KEY (colorId),
	CONSTRAINT UC_vehiclecolorName UNIQUE (colorName)
);


CREATE TABLE vehicleYears (
    yearId int IDENTITY(1,1),
    year int NOT NULL,
    PRIMARY KEY (yearId),
	CONSTRAINT UC_vehicleYears UNIQUE (year)
)

CREATE TABLE vehicleSaleYears (
    yearId int IDENTITY(1,1),
    year int NOT NULL,
    PRIMARY KEY (yearId),
	CONSTRAINT UC_vehicleSaleYears UNIQUE (year)
)

CREATE TABLE vehicleMotors (
    motorId int IDENTITY(1,1),
    motorName varchar(255) NOT NULL,
	motorNameSalesAlias varchar(255) NOT NULL, 
    PRIMARY KEY (motorId),
	CONSTRAINT UC_vehicleMotors UNIQUE (motorName, motorNameSalesAlias)
);

CREATE TABLE vehicleBreeds (
    breedId int IDENTITY(1,1),
	makeId int NOT NULL,
    modelId int NOT NULL,
    PRIMARY KEY (breedId),
	FOREIGN KEY (makeId)		REFERENCES vehicleMakes(makeId),
	FOREIGN KEY (modelId)		REFERENCES vehicleModels(modelId),
	CONSTRAINT [UC_vehicleBreed] UNIQUE NONCLUSTERED
    (
        makeId, modelId
    )
);


CREATE TABLE vehicleTypes (
    typeId int IDENTITY(1,1),
	vehicleBreedId int NOT NULL,
    vehicleYearId int NOT NULL,
    PRIMARY KEY (TypeId),
	FOREIGN KEY (vehicleBreedId)    REFERENCES vehicleBreeds(breedId),
	FOREIGN KEY (vehicleYearId)		REFERENCES vehicleYears(yearId),
	CONSTRAINT [UC_vehicleTypes] UNIQUE NONCLUSTERED
    (
        vehicleBreedId, vehicleYearId
    )
);

CREATE TABLE vehicleTypeOptionsMotors (
    typeOptionsMotorId int IDENTITY(1,1),
	vehicleTypeId int NOT NULL,
    vehicleMotorId int NOT NULL,
    PRIMARY KEY (typeOptionsMotorId),
	FOREIGN KEY (vehicleTypeId)		REFERENCES vehicleTypes(typeId),
	FOREIGN KEY (vehicleMotorId)		REFERENCES vehicleMotors(motorId),
		CONSTRAINT [UC_vehicleTypeOptionsMotors] UNIQUE NONCLUSTERED
    (
        vehicleTypeId, vehicleMotorId
    )
);

CREATE TABLE vehicleTypeOptionsPowerTrans (
    typeOptionsPowerTranId int IDENTITY(1,1),
	vehicleTypeId int NOT NULL,
    vehiclePowerTranId int NOT NULL,
    PRIMARY KEY (typeOptionsPowerTranId),
	FOREIGN KEY (vehicleTypeId)				REFERENCES vehicleTypes(typeId),
	FOREIGN KEY (vehiclePowerTranId)		REFERENCES vehiclePowerTrans(powerTranId),
	CONSTRAINT [UC_vehicleTypeOptionsPowerTrans] UNIQUE NONCLUSTERED
    (
        vehicleTypeId, vehiclePowerTranId
    )
);

CREATE TABLE vehicleTypeOptionsColors(
    typeOptionsColorId int IDENTITY(1,1),
	vehicleTypeId int NOT NULL,
    vehicleColorId int NOT NULL,
    PRIMARY KEY (typeOptionsColorId),
	FOREIGN KEY (vehicleTypeId)				REFERENCES vehicleTypes(typeId),
	FOREIGN KEY (vehicleColorId)		REFERENCES vehicleColors(colorId),
	CONSTRAINT [UC_vehicleTypeOptionsColors] UNIQUE NONCLUSTERED
    (
        vehicleTypeId, vehicleColorId
    )
);

CREATE TABLE vehicleTypeOptionsTrimPackages(
    typeOptionsTrimPackageId int IDENTITY(1,1),
	vehicleTypeId int NOT NULL,
    vehicleTrimPackageId int NOT NULL,
    PRIMARY KEY (TypeOptionsTrimPackageId),
	FOREIGN KEY (vehicleTypeId)				REFERENCES vehicleTypes(typeId),
	FOREIGN KEY (vehicleTrimPackageId)		REFERENCES vehicleTrimPackages(TrimPackageId),
	CONSTRAINT [UC_vehicleTypeOptionsTrimPackages] UNIQUE NONCLUSTERED
    (
        vehicleTypeId, vehicleTrimPackageId
    )
);

CREATE TABLE vehicleTypeOptionsDoors(
    typeOptionsDoorId int IDENTITY(1,1),
	vehicleTypeId int NOT NULL,
    vehicleDoorId int NOT NULL,
    PRIMARY KEY (typeOptionsDoorId),
	FOREIGN KEY (vehicleTypeId)				REFERENCES vehicleTypes(typeId),
	FOREIGN KEY (vehicleDoorId)		REFERENCES vehicleDoorStyles(doorId),
    CONSTRAINT [UC_vehicleTypeOptionsDoors] UNIQUE NONCLUSTERED
    (
        vehicleTypeId, vehicleDoorId
    )
);



CREATE TABLE salesDiscounts (
    discountId int IDENTITY(1,1),
    discountName varchar(255) NOT NULL,
    PRIMARY KEY (DiscountId),
	CONSTRAINT [UC_salesDiscounts] UNIQUE NONCLUSTERED
    (
        discountName
    )
);


CREATE TABLE vehicleInventory (
    inventoryId int IDENTITY(1,1),
    vin varchar(255) NOT NULL,
	MSRP MONEY,
	inventoryIngestId int,
	vehicleTypeOptionsMotorId  int,
	vehicleTypeOptionsPowerTranId  int,
	vehicleTypeOptionsColorId int,
	vehicleTypeOptionsTrimPackageId int,

	vehcileTypeOptionsDoorId int,
	vehicleYearFromSales int,

	PRIMARY KEY (inventoryId),
	FOREIGN KEY (vehicleTypeOptionsMotorId)					REFERENCES vehicleTypeOptionsMotors(typeOptionsMotorId),
	FOREIGN KEY (vehicleTypeOptionsPowerTranId)				REFERENCES vehicleTypeOptionsPowerTrans(typeOptionsPowerTranId),
	FOREIGN KEY (vehicleTypeOptionsColorId)					REFERENCEs vehicleTypeOptionsColors(typeOptionsColorId),
	FOREIGN KEY (vehicleTypeOptionsTrimPackageId)			REFERENCES vehicleTypeOptionsTrimPackages(typeOptionsTrimPackageId),
	FOREIGN KEY (vehcileTypeOptionsDoorId)					REFERENCES vehicleTypeOptionsDoors(typeOptionsDoorId),
	FOREIGN KEY (vehicleYearFromSales)						REFERENCES vehicleSaleYears(yearId),
	CONSTRAINT [UC_vehicleInventory] UNIQUE NONCLUSTERED
    (
        vin
    )

);



CREATE TABLE customerSubOccupationCategories (
    occupationSubCategoryId int IDENTITY(1,1),
	occupationSubCategory varchar(255) NOT NULL,
    PRIMARY KEY (occupationSubCategoryId),
	CONSTRAINT [UC_customerSubOccupationCategories] UNIQUE NONCLUSTERED
    (
        occupationSubCategory
    )
);


CREATE TABLE customerOccupations (
    occupationId int IDENTITY(1,1),
	occupationCategory varchar(255) NOT NULL,
	occupationSubCategoryId int,
    PRIMARY KEY (occupationId),
	FOREIGN KEY (occupationSubCategoryId)			REFERENCES customerSubOccupationCategories(occupationSubCategoryId),
	CONSTRAINT [UC_customerOccupations] UNIQUE NONCLUSTERED
    (
        occupationCategory,occupationSubCategoryId
    )
);

CREATE TABLE locationStates (
    stateId int IDENTITY(1,1),
	stateName varchar(255) NOT NULL,
	PRIMARY KEY (stateId),
	CONSTRAINT UC_locationStates UNIQUE (stateName)
);

CREATE TABLE locationCities (
    cityId int IDENTITY(1,1),
	cityName varchar(255) NOT NULL,
	PRIMARY KEY (cityId),
	CONSTRAINT UC_cityName UNIQUE (cityName)

);

CREATE TABLE locationCountries (
    countryId int IDENTITY(1,1),
	countryName varchar(255) NOT NULL,
	PRIMARY KEY (countryId),
	CONSTRAINT UC_countryName UNIQUE (countryName)
);

CREATE TABLE locationCitiesInStates (
    cityInStateId int IDENTITY(1,1),
	locationStateId int,
	locationCityId int,
	locationCountryId int,
	PRIMARY KEY (cityInStateId),
	FOREIGN KEY (locationStateId)	REFERENCES locationStates(stateId),
	FOREIGN KEY (locationCityId)	REFERENCES locationCities(cityId),
	FOREIGN KEY (locationCountryId)	REFERENCES locationCountries(countryid),
	CONSTRAINT UC_locationCitiesInStates UNIQUE (locationStateId,locationCityId, locationCountryId)
);

CREATE TABLE locationZips (
    zipId int IDENTITY(1,1),
	zipCode varchar(255) NOT NULL,
	PRIMARY KEY (zipId),
	CONSTRAINT UC_locationZips UNIQUE (zipCode)
);

CREATE TABLE locationCitiesInStatesZips (
    citiesInStatesZipsId int IDENTITY(1,1),
	locationCityInStateId int,
	locationZipId int,
	PRIMARY KEY (citiesInStatesZipsId),
	FOREIGN KEY (locationCityInStateId)	REFERENCES locationCitiesInStates(cityInstateId),
	FOREIGN KEY (locationZipId)	REFERENCES locationZips(zipId),
	CONSTRAINT UC_locationCitiesInStatesZips UNIQUE (locationCityInStateId, locationZipId)
);

CREATE TABLE locationAddresses (
    addressId int IDENTITY(1,1),
	street varchar(255) NOT NULL,
	locationCitiesInStatesZipsId int,
	PRIMARY KEY (addressId),
	FOREIGN KEY (locationCitiesInStatesZipsId)	REFERENCES locationCitiesInStatesZips(citiesInStatesZipsId),
	--a street address can't be in more than one city state and zip
	CONSTRAINT UC_locationAddresses UNIQUE (street, locationCitiesInStatesZipsId)
);

CREATE TABLE customerLoanStatuses (
    loanStatusId int IDENTITY(1,1),
    loanStatusName varchar(255) NOT NULL,
    PRIMARY KEY (loanStatusId),
	CONSTRAINT UC_customerLoanStatuses UNIQUE (loanStatusName)
);

CREATE TABLE customerPurchasers (
    purchaserId int IDENTITY(1,1),
    NameLast varchar(255) NOT NULL,
	NameFirst varchar(255) ,
	NameMI varchar(255) ,
	Repeat bit,
	customerOccupationId int,
	customerLoanStatusId int,
	customerAddressId int,
    PRIMARY KEY (purchaserId),
	FOREIGN KEY (customerOccupationId)  REFERENCES customerOccupations(occupationId),
	FOREIGN KEY (customerLoanStatusId)  REFERENCES customerLoanStatuses(loanStatusId),
    FOREIGN KEY (customerAddressId)  REFERENCES locationAddresses(addressId),
	CONSTRAINT UC_customerPurchasers UNIQUE (NameLast, NameFirst, NameMI, customerAddressId)

);


CREATE TABLE salesTransactions (
    transactionId int IDENTITY(1,1),
    transactionDate Date,
	transactionIngestId int,
	
	tradeInValue MONEY,
    purchasePrice MONEY,
	vehicleInventoryId int,
	salesDiscountId int,
	customerPurchaserId int,

    PRIMARY KEY (transactionId),
	FOREIGN KEY (vehicleInventoryId) REFERENCES vehicleInventory(inventoryId),
	FOREIGN KEY (salesDiscountId)  REFERENCES salesDiscounts(discountId),
	FOREIGN KEY (customerPurchaserId) REFERENCES customerPurchasers(purchaserId),
	CONSTRAINT UC_salesTransactions UNIQUE (transactionDate, vehicleInventoryId)
);


