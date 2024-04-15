-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2024 at 10:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `samp`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `ACC_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACC_NO` varchar(20) NOT NULL,
  `ACC_TYPE` varchar(50) DEFAULT NULL,
  `ACC_BAL` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`ACC_ID`, `USER_ID`, `ACC_NO`, `ACC_TYPE`, `ACC_BAL`) VALUES
(4, 10, '1234', 'savings', 1500.00),
(5, 11, '789456', 'savings', 1100.00),
(6, 13, '812103', 'savings', 1200.00);

-- --------------------------------------------------------

--
-- Table structure for table `payment_options`
--

CREATE TABLE `payment_options` (
  `PAY_ID` int(11) NOT NULL,
  `ENTERPRISE` tinyint(1) DEFAULT 0,
  `REC_ACC` varchar(20) DEFAULT NULL,
  `PAY_PHONE` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `REWARD_ID` int(11) NOT NULL,
  `CODE` varchar(20) NOT NULL,
  `DESCR` varchar(255) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `EXPIRY_DATE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `PAY_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACC_ID` int(11) DEFAULT NULL,
  `PAY_AMT` decimal(10,2) DEFAULT NULL,
  `PAY_DATE` date DEFAULT NULL,
  `PAY_DESC` varchar(255) DEFAULT NULL,
  `REC_NAME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `USER_PASSWORD` varchar(255) NOT NULL,
  `FNAME` varchar(50) NOT NULL,
  `MNAME` varchar(50) DEFAULT NULL,
  `LNAME` varchar(50) NOT NULL,
  `USER_EMAIL` varchar(100) NOT NULL,
  `USER_PHONE` varchar(15) DEFAULT NULL,
  `ADMIN_EMAIL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `USER_PASSWORD`, `FNAME`, `MNAME`, `LNAME`, `USER_EMAIL`, `USER_PHONE`, `ADMIN_EMAIL`) VALUES
(10, 'passwordu', 'uday', 'kumar', 'parimi', 'uday@gmail.com', '8333915678', 'admin@gmail.com'),
(11, 'passwordk', 'komal', 'sai', 'somireddi', 'komal@gmail.com', '7793904377', 'admin@gmail.com'),
(12, 'passwordj', 'jeevan', 'sai', 'golthi', 'jeevan@gmail.com', '8465922609', 'jeevan@gmail.com'),
(13, 'passwordjr', 'sai', 'joga', 'lenki', 'joga@gmail.com', '8121033275', 'jeevan@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`ACC_ID`),
  ADD UNIQUE KEY `ACC_NO` (`ACC_NO`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `payment_options`
--
ALTER TABLE `payment_options`
  ADD PRIMARY KEY (`PAY_ID`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`REWARD_ID`),
  ADD UNIQUE KEY `CODE` (`CODE`),
  ADD KEY `USER_ID` (`USER_ID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`PAY_ID`),
  ADD KEY `USER_ID` (`USER_ID`),
  ADD KEY `ACC_ID` (`ACC_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`),
  ADD UNIQUE KEY `USER_EMAIL` (`USER_EMAIL`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `ACC_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `REWARD_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `PAY_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `USER_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE;

--
-- Constraints for table `payment_options`
--
ALTER TABLE `payment_options`
  ADD CONSTRAINT `payment_options_ibfk_1` FOREIGN KEY (`PAY_ID`) REFERENCES `transactions` (`PAY_ID`) ON DELETE CASCADE;

--
-- Constraints for table `rewards`
--
ALTER TABLE `rewards`
  ADD CONSTRAINT `rewards_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE SET NULL;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`ACC_ID`) REFERENCES `account` (`ACC_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
