-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2024 at 04:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `fID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Size` decimal(10,0) DEFAULT NULL,
  `Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`fID`, `Name`, `Size`, `Time`) VALUES
(101, 'KM', 200, '02:30:00'),
(202, 'Mariam', 300, '02:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Stars` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hID`, `Name`, `Stars`) VALUES
(1, 'stella', 3),
(2, 'Mariam', 5);

-- --------------------------------------------------------

--
-- Table structure for table `reserve_flight`
--

CREATE TABLE `reserve_flight` (
  `uID` int(11) DEFAULT NULL,
  `fID` int(11) DEFAULT NULL,
  `Place` varchar(100) DEFAULT NULL,
  `Day` date DEFAULT NULL,
  `rfID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserve_flight`
--

INSERT INTO `reserve_flight` (`uID`, `fID`, `Place`, `Day`, `rfID`) VALUES
(1, 101, 'paris', '2024-11-06', 1),
(2, 202, 'alex', '2024-11-27', 2);

-- --------------------------------------------------------

--
-- Table structure for table `reserve_hotel`
--

CREATE TABLE `reserve_hotel` (
  `uID` int(11) NOT NULL,
  `hID` int(11) DEFAULT NULL,
  `Day` date DEFAULT NULL,
  `rID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserve_hotel`
--

INSERT INTO `reserve_hotel` (`uID`, `hID`, `Day`, `rID`) VALUES
(2, 1, '2024-11-11', 1),
(1, 1, '2024-11-11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Card` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uID`, `Name`, `Address`, `Phone`, `Card`) VALUES
(1, 'Koko', 'Alex', '0123456789', '12345678'),
(2, 'mariam', 'cairo', '012345979', '9101123445');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`fID`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hID`);

--
-- Indexes for table `reserve_flight`
--
ALTER TABLE `reserve_flight`
  ADD PRIMARY KEY (`rfID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `fID` (`fID`);

--
-- Indexes for table `reserve_hotel`
--
ALTER TABLE `reserve_hotel`
  ADD PRIMARY KEY (`rID`),
  ADD KEY `uID` (`uID`),
  ADD KEY `hID` (`hID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reserve_flight`
--
ALTER TABLE `reserve_flight`
  MODIFY `rfID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reserve_hotel`
--
ALTER TABLE `reserve_hotel`
  MODIFY `rID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reserve_flight`
--
ALTER TABLE `reserve_flight`
  ADD CONSTRAINT `reserve_flight_ibfk_1` FOREIGN KEY (`uID`) REFERENCES `user` (`uID`),
  ADD CONSTRAINT `reserve_flight_ibfk_2` FOREIGN KEY (`fID`) REFERENCES `flights` (`fID`);

--
-- Constraints for table `reserve_hotel`
--
ALTER TABLE `reserve_hotel`
  ADD CONSTRAINT `reserve_hotel_ibfk_1` FOREIGN KEY (`uID`) REFERENCES `user` (`uID`),
  ADD CONSTRAINT `reserve_hotel_ibfk_2` FOREIGN KEY (`hID`) REFERENCES `hotel` (`hID`),
  ADD CONSTRAINT `uID` FOREIGN KEY (`uID`) REFERENCES `user` (`uID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
