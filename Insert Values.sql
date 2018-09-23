use cs598_w1

INSERT INTO vehicleYears (year)
VALUES
	(2017),
    (2018);

INSERT INTO vehicleSaleYears (year)
VALUES
	(2016),
    (2017),
	(2018);

Insert INTO  vehicleTrimPackages(trimPackageName)
VALUES
('King Ranch'),
('Titanium'),
('P100D'),
('60'),
('75D'),
('100 D'),
(NULL);


Insert INTO  vehicleModels(modelName)
VALUES
('Expedition'),
('Fusion'),
('Model S'),
('Prius')




Insert INTO vehicleMakes (makeName)
VALUES
('Ford'),
('Tesla'),
('Toyota');

Insert INTO vehiclePowerTrans (powerTranName)
VALUES
('FWD'),
('AWD'),
('4WD');

INSERT INTO vehicleColors (colorName)
VALUES
('White (Pearl)'),
('Gold'),
('White'),
('Gray'),
('Blue'),
('Silver'),
('Black');

INSERT INTO vehicleDoorStyles (doorCount, doorStyle)
VALUES
(4, NULL),
(4, 'Sedan'),
(5, 'Hatchback');


INSERT INTO vehicleMotors(motorName,[motorNameSalesAlias] )
VALUES
('Internal Combustion', 'Internal Combustion'),
('Electric / Internal Combustion Hybrid', 'Hybrid'),
('Electric', 'Electric');


INSERT INTO  [dbo].[customerSubOccupationCategories](occupationSubCategory)
VALUES
('UIC'),
('pediatrician');

INSERT INTO customerOccupations(occupationCategory, occupationSubCategoryId)
VALUES
('Dean', NULL),
('Archivist', NULL),
('Doctor', NULL),
('Student', NULL),
('Doctor', 2),
('Unknown profession', NULL),
('Librarian', NULL),
('Professor', 1),
('Stay at home mother', NULL),
('Research scientist', NULL);

INSERT INTO locationStates (StateName)
VALUES
('IL'),
('NA'), 
('IN')

INSERT INTO locationCities (CityName)
VALUES
('Chicago'),
('NA'), 
('Urbana'),
('Savoy'), 
('Indianapolis'),
('Bloomington'),
('Champaign'),
('Rantoul')

INSERT INTO [dbo].[locationCountries] (countryName)
VALUES
('USA')

INSERT INTO [dbo].[locationCitiesInStates]([locationStateId], [locationCityId], [locationCountryId])
VALUES
(1,3,1),
(3,5, 1),
(1,1, 1),
(1,6, 1),
(1,7, 1),
(1,8, 1),
(1,4, 1);

INSERT INTO locationZips(zipCode)
VALUES
(61866),
(61821),
(61874),
(61802),
(61701),
(61801),
(46077),
(60007),
(61820),
(60018)

INSERT INTO [dbo].[locationCitiesInStatesZips]
VALUES
(1, 4),
(1, 6),
(2, 7),
(3, 8), 
(3, 10),
(4, 5),
(5, 2),
(5, 9),
(6, 1),
(7, 3);








INSERT INTO  customerLoanStatuses (loanStatusName)
VALUES
('Needs loan'),
('Needs financing'),
('Inquiry into financing options');





INSERT INTO [dbo].[salesDiscounts] ([discountName])
VALUES
('EndOfYear'),
('First Time Driver'),
('Repeat Customer'),
('Seniour Citizen');

--vehicleBreed
--INSERT INTO [dbo].[vehicleTypes] ([makeId], [modelId])
INSERT INTO [dbo].[vehicleBreeds]([makeId], [modelId])
VALUES
(1,1),
(1, 2),
(2, 3),
(3, 4);

--vehcileType
--INSERT INTO [dbo].[vehicleTypesAndYear] ([vehicleTypeId], [vehicleYearId])
INSERT INTO [dbo].[vehicleTypes]([vehicleBreedId], [vehicleYearId])
VALUES
(1,1),
(2, 1),
(3, 1),
(3, 2),
(4, 2);

--[dbo].[vehicleTypeOptionsColors]
--INSERT INTO [dbo].[vehicleTypeAndYearColor] ([vehicleTypesAndYearId], [vehicleColorId])
INSERT INTO [dbo].[vehicleTypeOptionsColors] ([vehicleTypeId], [vehicleColorId])
VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 3),
(5, 5),
(5, 3),
(5, 6),
(5,7);

---------
--[dbo].[vehicleTypeOptionsDoors]
--INSERT INTO [dbo].[vehicleTypeAndYearDoor] ([vehicleTypesAndYearId], [vehicleDoorId])
INSERT INTO [dbo].[vehicleTypeOptionsDoors]([vehicleTypeId], [vehicleDoorId])
VALUES
(1, 1),
(2,1),
(3,1),
(4,1),
(5,2),
(5,3)

--[dbo].[vehicleTypeOptionsMotors]
--INSERT INTO [dbo].[vehicleTypeAndYearMotorType] ([vehicleTypesAndYearId], [vehicleMotorTypeId])
INSERT INTO [dbo].[vehicleTypeOptionsMotors]([vehicleTypeId], [vehicleMotorId])
VALUES
(1, 1), 
(2, 2), 
(3, 3),
(4, 3), 
(5, 2)

--[dbo].[vehicleTypeOptionsPowerTrans]
--INSERT INTO [dbo].[vehicleTypeAndYearPowerTran] ([vehicleTypesAndYearId], [vehiclePowerTranId])
INSERT INTO [dbo].[vehicleTypeOptionsPowerTrans]([vehicleTypeId], [vehiclePowerTranId])
VALUES
(1,3),
(2,1),
(3, 2),
(4, 2),
(5, 1)

--[dbo].[vehicleTypeOptionsTrimPackages]
--INSERT INTO [dbo].[vehicleTypeAndYearStyle] ([vehicleTypesAndYearId], [vehicleStyleId])
INSERT INTO [dbo].[vehicleTypeOptionsTrimPackages]([vehicleTypeId], [vehicleTrimPackageId])
VALUES
(1,1),
(2, 2),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(5, 7);


INSERT INTO [dbo].[locationAddresses] ([street], [locationCitiesInStatesZipsId])
VALUES
('557 Rodeo Trl', 9),
('190 Clemton Ave', 7),
('34 Lark Meadow Dr', 10),
('245-B Church St', 1),
('911 Megellan Ave', 6),
('987 Withrop Lane', 2),
('55 Shadow Canyon Trl',3),
('2008 Williams Dr', 4),
('8890 Winston St', 8),
('54 Lane Ave', 5);

INSERT INTO [customerPurchasers]( [NameLast], [NameFirst], [NameMI], [Repeat], [customerOccupationId], [customerLoanStatusId],[customerAddressId] )
VALUES
('Potter', 'Harry', 'D', 0 , 8,NULL,8),
('Granger', 'Hermione', 'S',0 , 2,1,2), 
('Malfoy', 'Draco', 'M', 0,6, NULL,6),
('Longbottom', 'Neville', 'R',0 ,3,NULL,3), 
('Pettigrew', 'Peter', '',0,7,2, 7),
('Lupin', 'Remus', 'W', 0,5,NULL,5), 
('Weasley', 'Ronald', 'R',0,10,NULL, 10),
('Weasley', 'Ginny', '', 0,9,3,9),
('Lovegood', 'Luna', 'D', 1,4,1,4),
('Dumbledore', 'Albus', 'R',0,1,NULL, 1)


INSERT INTO [dbo].[vehicleInventory] 
([vin], [MSRP], [inventoryIngestId], [vehicleTypeOptionsMotorId], [vehicleTypeOptionsPowerTranId], [vehicleTypeOptionsColorId], [vehicleTypeOptionsTrimPackageId], [vehcileTypeOptionsDoorId],[vehicleYearFromSales])
VALUES
('vHxfKmtZ8bSd4JqP5y',	60615.00 ,		 1, 1, 1, 1, 1, 1, 2),
('Ab3F3AR5QX4jmxQGNX',	30740.00 ,		 2, 2, 2, 2, 2, 2, 2),
('S7enznmKTrKsbm4ceC',	135000.00 ,	     3, 3, 3, 3, 3, 3, 2),
('ZdspCskTUsEMuA5xj4',	68000.00 ,		 4, 3, 3, 4, 4, 3, 2),
('QMsFeqUT38MFLV4NxW',	74500.00,		 5, 4, 4, 5, 5, 4, 1),
('eLqdyxVVA2q5vRZNg5',	94000.00 ,       6, 4, 4, 5, 6, 4, 3),
('UW7W4XUcxaMBL2PHqS',	23475.00 ,       7, 5, 5, 6, 7, 5, 3),
('AQm44N9vhHn6DsWvsr',	23475.00 ,       8, 5, 5, 7, 7, 5, 3),
('amdRVQn8AVfrdP48CY',	23475.00 ,       9, 5, 5, 8, 7, 5, 3),
('3T3zsvzUp5Vm5r2SGm',	29685.00,        10, 5, 5, 9, 7, 6, 1);

INSERT INTO [dbo].[salesTransactions]([transactionDate], [transactionIngestId], [tradeInValue],purchasePrice,[vehicleInventoryId],[salesDiscountId], customerPurchaserId)
VALUES
('9/8/2017', 1,       7500.00,  127500.00, 3, NULL, 1),
('10/9/2018', 2,      NULL,		19500.00,   7, 1, 2),
('8/8/2017',3,        NULL,		NULL,       1, NULL, 3),
('8/9/2017',4,        NULL ,	62000.00 ,  4, 1, 4),
('10/20/2017',5,      1250.00,	26512.00 ,  2, 1, 5),
('2/28/2018',6,       NULL,		23475.00 ,  8, NULL, 6),
('6/15/2018',7,       NULL,		20975.00 ,  9, NULL, 7),
('5/5/2018',8,        NULL,		89300.00,   6, 2, 8),
('4/3/2018',9,        NULL,		25232.25 ,  10, 3, 9 ),
('1/21/2018',10,      5000.00,	57685.00 ,  5, 4, 10);





