-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2024 at 11:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `customerid` int(11) DEFAULT NULL,
  `staffid` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` varchar(100) DEFAULT 'New',
  `datebooking` date DEFAULT curdate(),
  `foodcategory` varchar(200) DEFAULT 'others',
  `foodname` varchar(200) DEFAULT '',
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `ts`, `customerid`, `staffid`, `rating`, `comment`, `price`, `status`, `datebooking`, `foodcategory`, `foodname`, `quantity`) VALUES
(1, '2024-01-27 19:44:41', 1, 1, 10, 'Very nice', 188, 'Done', '2024-01-28', 'Western Food', 'Steak', 1),
(2, '2024-01-27 19:44:41', 1, 1, 2, 'Very bad', 188, 'Done', '2024-01-28', 'Western Food', 'Steak', 1),
(3, '2024-01-27 19:44:41', 1, 2, NULL, NULL, 188, 'On Going', '2024-01-28', 'Western Food', 'Steak', 1),
(4, '2024-01-27 19:44:41', 2, 3, 6, 'Normal steak', 188, 'Done', '2024-01-28', 'Western Food', 'Steak', 1),
(5, '2024-01-27 19:44:41', 1, 2, NULL, NULL, 65, 'On Going', '2024-01-28', 'Japan food', 'Sushi', 1),
(6, '2024-01-27 19:44:41', 4, 4, 8, 'Tasty!!!!', 65, 'Done', '2024-01-28', 'Japan food', 'Sushi', 1),
(7, '2024-01-27 19:44:41', 3, 4, NULL, NULL, 65, 'On Going', '2024-01-28', 'Japan food', 'Sushi', 1),
(8, '2024-01-27 19:44:41', 4, 4, 1, 'Cannot eat', 65, 'Done', '2024-01-28', 'Japan food', 'Sushi', 1),
(9, '2024-01-27 19:44:41', 4, 1, NULL, NULL, 25, 'New', '2024-01-28', 'Local food', 'Nasi Lemak', 1),
(10, '2024-01-27 19:44:41', 3, 1, 10, 'Very nice', 25, 'Done', '2024-01-28', 'Local food', 'Nasi Lemak', 1),
(11, '2024-01-27 19:44:41', 2, 3, NULL, NULL, 25, 'New', '2024-01-28', 'Local food', 'Nasi Lemak', 1),
(12, '2024-01-27 19:44:41', 2, 4, NULL, NULL, 25, 'New', '2024-01-28', 'Local food', 'Nasi Lemak', 1),
(13, '2024-01-27 19:44:41', 3, 5, NULL, NULL, 25, 'New', '2024-01-28', 'Local food', 'Nasi Lemak', 1),
(14, '2024-01-27 19:44:41', 2, 1, NULL, NULL, 15, 'New', '2024-01-28', 'Drinks', 'Apple Juice', 1),
(15, '2024-01-27 19:44:41', 4, 1, NULL, NULL, 15, 'New', '2024-01-28', 'Drinks', 'Apple Juice', 1),
(16, '2024-01-27 19:44:41', 3, 2, NULL, NULL, 15, 'New', '2024-01-28', 'Drinks', 'Apple Juice', 1),
(17, '2024-01-27 19:44:41', 3, 1, NULL, NULL, 15, 'On Going', '2024-01-28', 'Drinks', 'Apple Juice', 1),
(18, '2024-01-27 19:44:41', 2, 4, NULL, NULL, 15, 'New', '2024-01-28', 'Drinks', 'Apple Juice', 1),
(19, '2024-01-27 19:44:41', 2, 5, NULL, NULL, 15, 'New', '2024-01-28', 'Drinks', 'Apple Juice', 1),
(20, '2024-01-27 19:44:41', 2, 4, NULL, NULL, 15, 'New', '2024-01-28', 'Drinks', 'Apple Juice', 1),
(21, '2024-01-30 12:41:18', 1, 1, 10, 'Tastes great!', 25, 'Done', '2024-01-30', 'Local Food', 'Nasi Lemak', 1),
(22, '2024-01-31 03:41:19', 7, 1, NULL, NULL, 130, 'On Going', '2024-02-01', 'Japan Food', 'Sushi', 2),
(23, '2024-01-31 05:05:06', 7, 6, NULL, NULL, 15, 'New', '2024-02-01', 'Drinks', 'Apple Juice', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customertable`
--

CREATE TABLE `customertable` (
  `id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `name` varchar(255) DEFAULT NULL,
  `studentid` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `datejoined` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customertable`
--

INSERT INTO `customertable` (`id`, `ts`, `username`, `password`, `status`, `name`, `studentid`, `age`, `phone`, `datejoined`) VALUES
(1, '2024-01-27 19:44:41', 'customer1', '12345', 'approved', 'Customer 1', 'TP682359', 26, '01211233678', '2024-01-28'),
(2, '2024-01-27 19:44:41', 'customer2', '12345', 'approved', 'Customer 2', 'TP682359', 39, '01212345338', '2024-01-28'),
(3, '2024-01-27 19:44:41', 'customer3', '12345', 'approved', 'Customer 3', 'TP054698', 22, '01211235678', '2024-01-28'),
(4, '2024-01-27 19:44:41', 'customer4', '12345', 'approved', 'Customer 4', 'TP842976', 21, '01233345678', '2024-01-28'),
(5, '2024-01-27 19:44:41', 'customer5', '12345', 'pending', 'Customer 5', 'TP015687', 40, '01212345678', '2024-01-28'),
(6, '2024-01-27 19:44:41', 'customer6', '12345', 'pending', 'Customer 6', 'TP524960', 24, '01212342378', '2024-01-28'),
(7, '2024-01-31 03:38:49', 'shadeis', '12345', 'approved', 'Shahathir', '52213121172', 21, '01153787564', '2024-01-31');

-- --------------------------------------------------------

--
-- Table structure for table `managertable`
--

CREATE TABLE `managertable` (
  `id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `datejoined` date DEFAULT curdate(),
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `managertable`
--

INSERT INTO `managertable` (`id`, `ts`, `username`, `password`, `name`, `age`, `phone`, `datejoined`, `salary`) VALUES
(1, '2024-01-27 19:44:41', 'manager', '12345', 'Manager', 55, '01232321232', '2024-01-28', 9999);

-- --------------------------------------------------------

--
-- Table structure for table `stafftable`
--

CREATE TABLE `stafftable` (
  `id` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT current_timestamp(),
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `datejoined` date DEFAULT curdate(),
  `salary` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stafftable`
--

INSERT INTO `stafftable` (`id`, `ts`, `username`, `password`, `name`, `age`, `phone`, `datejoined`, `salary`) VALUES
(1, '2024-01-27 19:44:41', 'staff1', '12345', 'Staff 1', 21, '01012232453', '2024-01-28', 3200),
(2, '2024-01-27 19:44:41', 'staff2', '12345', 'Staff 2', 21, '01012223453', '2024-01-28', 3400),
(3, '2024-01-27 19:44:41', 'staff3', '12345', 'Staff 3', 25, '01212121213', '2024-01-28', 4600),
(4, '2024-01-27 19:44:41', 'staff4', '12345', 'Staff 4', 26, '01212232663', '2024-01-28', 3500),
(5, '2024-01-27 19:44:41', 'staff5', '12345', 'Staff 5', 32, '01032232453', '2024-01-28', 4800),
(6, '2024-01-31 10:06:16', 'carlstaff', '12345', 'Carl', 30, '0183947726', '2024-02-01', 2300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customertable`
--
ALTER TABLE `customertable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `managertable`
--
ALTER TABLE `managertable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stafftable`
--
ALTER TABLE `stafftable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `customertable`
--
ALTER TABLE `customertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `managertable`
--
ALTER TABLE `managertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stafftable`
--
ALTER TABLE `stafftable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
