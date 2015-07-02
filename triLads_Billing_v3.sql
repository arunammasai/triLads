-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2015 at 01:49 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `trilads_billing`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE IF NOT EXISTS `account` (
  `AccountId` int(11) NOT NULL,
  `TotalBal` decimal(10,6) NOT NULL,
  `LastInvoiceId` int(11) NOT NULL,
  `PrevBal` decimal(10,6) NOT NULL,
  `RoundTo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE IF NOT EXISTS `charge` (
  `ChargeId` int(11) NOT NULL,
  `EventId` int(11) NOT NULL,
  `AccountId` int(11) NOT NULL,
  `AmountBeforeTax` decimal(10,6) NOT NULL,
  `TaxPercentage` decimal(10,6) NOT NULL,
  `TaxAmount` decimal(10,6) NOT NULL,
  `TotalAmount` decimal(10,6) NOT NULL,
  `InvoiceId` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Misc1` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc2` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc3` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc4` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `FromCurrency` varchar(3) COLLATE utf8_bin NOT NULL,
  `ToCurrency` varchar(3) COLLATE utf8_bin NOT NULL,
  `ExchangeRate` decimal(10,6) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`FromCurrency`, `ToCurrency`, `ExchangeRate`, `StartDate`, `EndDate`) VALUES
('INR', 'USD', '64.650000', '2014-07-01', '9999-12-31'),
('USD', 'INR', '0.015468', '2014-07-01', '9999-12-31'),
('INR', 'GBR', '90.650000', '2014-07-01', '9999-12-31'),
('GBR', 'INR', '0.011031', '2014-07-01', '9999-12-31'),
('INR', 'EUR', '55.650000', '2014-07-01', '9999-12-31'),
('EUR', 'INR', '0.017969', '2014-07-01', '9999-12-31');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `AddressLine`, `AddressStreet`, `AddressCity`, `AddressState`, `AddressPinCode`, `Currency`, `StartDate`, `ActiveDate`, `EndDate`, `LastBillDate`, `Status`, `AccountId`) VALUES
('Test', 'default line 1', 'default street', 'default city', 'Default State', 'default PinCode', 'INR', '2015-07-01', '2015-07-01', '9999-12-31', '0000-00-00', 'Active', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `EventId` int(11) NOT NULL,
  `EquipmentId` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `StartValue` decimal(10,6) NOT NULL,
  `EndValue` decimal(10,6) NOT NULL,
  `Misc1` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc2` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc3` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc4` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `InvoiceId` int(11) NOT NULL,
  `InvoicePages` blob NOT NULL,
  `InvoiceDate` date NOT NULL,
  `InvoiceAmount` decimal(10,6) NOT NULL,
  `PaymentDueDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE IF NOT EXISTS `rates` (
  `RatePlan` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'TEST',
  `TierStartValue` int(11) NOT NULL,
  `TierEndValue` int(11) NOT NULL,
  `Currency` varchar(3) COLLATE utf8_bin NOT NULL,
  `RatePerUnit` decimal(10,6) NOT NULL,
  `UOM` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'WATTS',
  `Misc1` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc2` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc3` varchar(300) COLLATE utf8_bin NOT NULL,
  `Misc4` varchar(300) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`RatePlan`, `TierStartValue`, `TierEndValue`, `Currency`, `RatePerUnit`, `UOM`, `Misc1`, `Misc2`, `Misc3`, `Misc4`) VALUES
('TEST', 0, 300, 'INR', '1.250000', 'WATTS', '', '', '', ''),
('TEST', 301, 600, 'INR', '1.750000', 'WATTS', '', '', '', ''),
('TEST', 601, 1000, 'INR', '2.250000', 'WATTS', '', '', '', ''),
('TEST', 1001, 99999999, 'INR', '2.750000', 'WATTS', '', '', '', ''),
('TEST', 0, 300, 'USD', '1.250000', 'WATTS', '', '', '', ''),
('TEST', 301, 600, 'USD', '1.750000', 'WATTS', '', '', '', ''),
('TEST', 601, 1000, 'USD', '2.250000', 'WATTS', '', '', '', ''),
('TEST', 1001, 99999999, 'USD', '2.750000', 'WATTS', '', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountId`);

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`ChargeId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`AccountId`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`EquipmentId`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EventId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`InvoiceId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `charge`
--
ALTER TABLE `charge`
  MODIFY `ChargeId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `AccountId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `EquipmentId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `EventId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `InvoiceId` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
