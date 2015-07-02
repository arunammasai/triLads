INSERT INTO `currencies` (`FromCurrency`, `ToCurrency`, `ExchangeRate`, `StartDate`, `EndDate`) VALUES ('INR', 'USD', 64.65, '2014-07-01', '9999-12-31');
INSERT INTO `currencies` (`FromCurrency`, `ToCurrency`, `ExchangeRate`, `StartDate`, `EndDate`) VALUES ('USD', 'INR', 1/64.65, '2014-07-01', '9999-12-31');
INSERT INTO `currencies` (`FromCurrency`, `ToCurrency`, `ExchangeRate`, `StartDate`, `EndDate`) VALUES ('INR', 'GBR', 90.65, '2014-07-01', '9999-12-31');
INSERT INTO `currencies` (`FromCurrency`, `ToCurrency`, `ExchangeRate`, `StartDate`, `EndDate`) VALUES ('GBR', 'INR', 1/90.65, '2014-07-01', '9999-12-31');
INSERT INTO `currencies` (`FromCurrency`, `ToCurrency`, `ExchangeRate`, `StartDate`, `EndDate`) VALUES ('INR', 'EUR', 55.65, '2014-07-01', '9999-12-31');
INSERT INTO `currencies` (`FromCurrency`, `ToCurrency`, `ExchangeRate`, `StartDate`, `EndDate`) VALUES ('EUR', 'INR', 1/55.65, '2014-07-01', '9999-12-31'); 


INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (0, 300, 'INR', 1.25, 'WATTS');
INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (301, 600, 'INR', 1.75, 'WATTS');
INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (601, 1000, 'INR', 2.25, 'WATTS');
INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (1001, 99999999, 'INR', 2.75, 'WATTS');
INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (0, 300, 'USD', 1.25, 'WATTS');
INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (301, 600, 'USD', 1.75, 'WATTS');
INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (601, 1000, 'USD', 2.25, 'WATTS');
INSERT INTO `rates`(`TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`) VALUES (1001, 99999999, 'USD', 2.75, 'WATTS');


INSERT INTO `customer`(`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES ('Karthik2', 'Line2', 'Street2', 'City2', 'State2', 'PinCode2', 'INR', '2015-01-01', '2015-01-01', '9999-12-31', '2000-01-01', 'Active', 2); 
INSERT INTO `customer`(`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES ('Karthik3', 'Line3', 'Street3', 'City3', 'State3', 'PinCode3', 'INR', '2015-01-01', '2015-01-01', '9999-12-31', '2000-01-01', 'Active', 3);
INSERT INTO `customer`(`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES ('Karthik4', 'Line4', 'Street4', 'City4', 'State4', 'PinCode4', 'INR', '2015-01-01', '2015-01-01', '9999-12-31', '2000-01-01', 'Active', 4);
INSERT INTO `customer`(`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES ('Karthik5', 'Line5', 'Street5', 'City5', 'State5', 'PinCode5', 'INR', '2015-01-01', '2015-01-01', '9999-12-31', '2000-01-01', 'Active', 5);
INSERT INTO `customer`(`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES ('Karthik6', 'Line6', 'Street6', 'City6', 'State6', 'PinCode6', 'INR', '2015-01-01', '2015-01-01', '9999-12-31', '2000-01-01', 'Active', 6);
INSERT INTO `customer`(`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES ('Karthik7', 'Line7', 'Street7', 'City7', 'State7', 'PinCode7', 'INR', '2015-01-01', '2015-01-01', '9999-12-31', '2000-01-01', 'Active', 7);
INSERT INTO `customer`(`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES ('Karthik8', 'Line8', 'Street8', 'City8', 'State8', 'PinCode8', 'INR', '2015-01-01', '2015-01-01', '9999-12-31', '2000-01-01', 'Active', 8);

INSERT INTO `account`(`AccountId`, `RoundTo`) VALUES (2, 2);
INSERT INTO `account`(`AccountId`, `RoundTo`) VALUES (3, 2);
INSERT INTO `account`(`AccountId`, `RoundTo`) VALUES (4, 2);
INSERT INTO `account`(`AccountId`, `RoundTo`) VALUES (5, 2);
INSERT INTO `account`(`AccountId`, `RoundTo`) VALUES (6, 2);
INSERT INTO `account`(`AccountId`, `RoundTo`) VALUES (7, 2);
INSERT INTO `account`(`AccountId`, `RoundTo`) VALUES (8, 2);

CREATE TABLE IF NOT EXISTS `ne_stage` (
  `Meter_id` int(20) NOT NULL,
  `StartDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `meter_start` int(11) NOT NULL,
  `meter_end` int(11) NOT NULL,
  `units_consumed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO ne_stage (Meter_id,startDate,endDate,meter_start,meter_end,units_consumed) VALUES
('3',STR_TO_DATE('6/30/15 5:00 AM', '%m/%d/%Y %h:%i %p'),STR_TO_DATE('6/30/15 5:15 AM', '%m/%d/%Y %h:%i %p'),'22','37','15');
INSERT INTO ne_stage (Meter_id,startDate,endDate,meter_start,meter_end,units_consumed) VALUES
('3',STR_TO_DATE('6/23/15 5:00 PM', '%m/%d/%Y %h:%i %p'),STR_TO_DATE('6/24/15 5:15 AM', '%m/%d/%Y %h:%i %p'),'12','22','10');
INSERT INTO ne_stage (Meter_id,startDate,endDate,meter_start,meter_end,units_consumed) VALUES
('3',STR_TO_DATE('7/2/15 1:00 PM', '%m/%d/%Y %h:%i %p'),STR_TO_DATE('7/02/15 4:55 PM', '%m/%d/%Y %h:%i %p'),'37','50','13');
INSERT INTO ne_stage (Meter_id,startDate,endDate,meter_start,meter_end,units_consumed) VALUES
('4',STR_TO_DATE('6/30/15 5:00 AM', '%m/%d/%Y %h:%i %p'),STR_TO_DATE('6/30/15 5:15 AM', '%m/%d/%Y %h:%i %p'),'12','22','10');
INSERT INTO ne_stage (Meter_id,startDate,endDate,meter_start,meter_end,units_consumed) VALUES
('4',STR_TO_DATE('7/11/15 5:00 AM', '%m/%d/%Y %h:%i %p'),STR_TO_DATE('7/11/15 5:15 AM', '%m/%d/%Y %h:%i %p'),'22','42','20');
INSERT INTO ne_stage (Meter_id,startDate,endDate,meter_start,meter_end,units_consumed) VALUES
('5',STR_TO_DATE('6/30/15 5:00 AM', '%m/%d/%Y %h:%i %p'),STR_TO_DATE('6/30/15 5:15 AM', '%m/%d/%Y %h:%i %p'),'12','22','10');


INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (2, 2, 'ElectricMeter', 'Active') ;
INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (3, 3, 'ElectricMeter', 'Active') ;
INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (4, 4, 'ElectricMeter', 'Active') ;
INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (5, 5, 'ElectricMeter', 'Active') ;
INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (6, 6, 'ElectricMeter', 'Active') ;
INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (7, 7, 'ElectricMeter', 'Active') ;
INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (8, 8, 'ElectricMeter', 'Active') ;
INSERT INTO `equipment`(`EquipmentId`, `AccountId`, `EquipmentType`, `Status`) VALUES (8, 2, 'ElectricMeter', 'Active') ;
