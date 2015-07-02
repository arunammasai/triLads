-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2015 at 10:43 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `triLads_Billing`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `AccountId` int(11) NOT NULL,
  `TotalBal` decimal(10,0) NOT NULL,
  `InvoiceId` int(11) NOT NULL,
  `PrevBal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `Name` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT 'Test',
  `AddressLine` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT 'default line 1',
  `AddressStreet` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT 'default street',
  `AddressCity` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT 'default city',
  `AddressState` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT 'Default State',
  `AddressPinCode` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT 'default PinCode',
  `Currency` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT 'INR',
  `StartDate` date NOT NULL,
  `ActiveDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `LastBillDate` date NOT NULL,
  `Status` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT 'Active',
  `AccountId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES
('Test', 'default line 1', 'default street', 'default city', 'Default State', 'default PinCode', 'INR', '2015-07-01', '2015-07-01', '9999-12-31', '0000-00-00', 'Active', 0);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `EquipmentId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL,
  `EquipmentType` varchar(100) COLLATE utf8_bin NOT NULL,
  `InstanceId` int(11) NOT NULL,
  `Status` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE IF NOT EXISTS `charge` (
  `ChargeId` int(11) NOT NULL,
  `EventId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL,
  `AmountBeforeTax` decimal(10,2) NOT NULL,
  `TaxPercentage` decimal(10,2) NOT NULL,
  `TaxAmount` decimal(10,2) NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Description` varchar(300) COLLATE utf8_bin NOT NULL default 'Default test',
  `Misc1` varchar(300) COLLATE utf8_bin NULL,
  `Misc2` varchar(300) COLLATE utf8_bin NULL,
  `Misc3` varchar(300) COLLATE utf8_bin NULL,
  `Misc4` varchar(300) COLLATE utf8_bin NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `Event` (
  `EventId` int(11) NOT NULL,
  `EquipmentId` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `StartValue` decimal(10,2) NOT NULL,
  `EndValue` decimal(10,2) NOT NULL,
  `UOM` varchar(30) collate utf8_bin NOT NULL default 'WATTS',
  `Misc1` varchar(300) COLLATE utf8_bin NULL,
  `Misc2` varchar(300) COLLATE utf8_bin NULL,
  `Misc3` varchar(300) COLLATE utf8_bin NULL,
  `Misc4` varchar(300) COLLATE utf8_bin NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `rates` (
  `RatePlan` varchar(30) collate utf8_bin NOT NULL default 'TEST',
  `TierStart` int(11) NOT NULL,
  `TierEnd` int(11) NOT NULL,
  `StartTime` datetime NOT NULL,
  `EndTime` datetime NOT NULL,
  `UOM` varchar(30) collate utf8_bin NOT NULL default 'WATTS',
  `Currency` varchar(3) collate utf8_bin NOT NULL default 'INR',
  `RatePerUnit` decimal(10,2) NOT NULL,
  `Misc1` varchar(300) COLLATE utf8_bin NULL,
  `Misc2` varchar(300) COLLATE utf8_bin NULL,
  `Misc3` varchar(300) COLLATE utf8_bin NULL,
  `Misc4` varchar(300) COLLATE utf8_bin NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
--
-- Indexes for dumped tables
--
CREATE TABLE IF NOT EXISTS `currencies` (
  `FromCurrency` varchar(3) collate utf8_bin NOT NULL,
  `ToCurrency` varchar(3) collate utf8_bin NOT NULL,
  `StartTime` date NOT NULL,
  `EndTime` datetime NOT NULL,
  `ExchangeRate` decimal(10,2) NOT NULL,
  `Misc1` varchar(300) COLLATE utf8_bin NULL,
  `Misc2` varchar(300) COLLATE utf8_bin NULL,
  `Misc3` varchar(300) COLLATE utf8_bin NULL,
  `Misc4` varchar(300) COLLATE utf8_bin NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountId`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EquipmentId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
