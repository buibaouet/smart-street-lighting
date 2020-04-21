-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2020 at 12:51 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `street_lighting`
--

-- --------------------------------------------------------

--
-- Table structure for table `e_report`
--

CREATE TABLE `e_report` (
  `id` int(5) NOT NULL,
  `e_consume` float NOT NULL,
  `e_save` float NOT NULL,
  `turn_on` datetime NOT NULL,
  `turn_off` datetime NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `e_report`
--

INSERT INTO `e_report` (`id`, `e_consume`, `e_save`, `turn_on`, `turn_off`, `day`) VALUES
(1, 8642, 10254, '2020-04-13 17:34:09', '2020-04-14 05:42:59', '2020-04-14'),
(2, 8642, 8678, '2020-04-19 17:34:09', '2020-04-20 05:42:59', '2020-04-20'),
(3, 7642, 9698, '2020-04-15 17:34:09', '2020-04-16 05:42:59', '2020-04-16'),
(4, 5756, 8468, '2020-04-17 17:34:09', '2020-04-18 05:42:59', '2020-04-18'),
(5, 8647, 9677, '2020-04-19 17:34:09', '2020-04-20 05:42:59', '2020-04-20'),
(6, 5784, 9685, '2020-04-10 17:34:09', '2020-04-11 05:42:59', '2020-04-11');

-- --------------------------------------------------------

--
-- Table structure for table `group_lights`
--

CREATE TABLE `group_lights` (
  `id` int(5) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL,
  `num_lights` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `group_lights`
--

INSERT INTO `group_lights` (`id`, `name`, `location`, `num_lights`) VALUES
(1, 'Cụm đèn 1', 'Đường Xuân Thủy', 6);

-- --------------------------------------------------------

--
-- Table structure for table `light_inf`
--

CREATE TABLE `light_inf` (
  `id` int(5) NOT NULL,
  `group_id` int(5) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `on_off` tinyint(1) NOT NULL,
  `percent` int(3) NOT NULL,
  `location` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `light_inf`
--

INSERT INTO `light_inf` (`id`, `group_id`, `name`, `on_off`, `percent`, `location`) VALUES
(1, 1, 'Đèn số 1', 1, 82, '144 Xuân Thủy'),
(2, 1, 'Đèn số 2', 1, 93, '147 Xuân Thủy'),
(3, 1, 'Đèn số 3', 0, 0, '25 Xuân Thủy'),
(4, 1, 'Đèn số 4', 1, 74, '14 Xuân Thủy'),
(5, 1, 'Đèn số 5', 0, 0, '94 Xuân Thủy'),
(6, 1, 'Đèn số 6', 1, 99, '72 Xuân Thủy');

-- --------------------------------------------------------

--
-- Table structure for table `l_report`
--

CREATE TABLE `l_report` (
  `id` int(5) NOT NULL,
  `on_off` tinyint(1) NOT NULL,
  `percent` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `l_report`
--

INSERT INTO `l_report` (`id`, `on_off`, `percent`, `time`) VALUES
(1, 1, 78, '2020-04-19 18:35:09'),
(2, 1, 98, '2020-04-20 21:11:22'),
(3, 0, 0, '2020-04-03 15:34:34'),
(4, 1, 88, '2019-12-24 19:37:09'),
(5, 0, 0, '2020-04-17 20:34:04'),
(6, 1, 67, '2020-04-16 03:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `email`, `admin`) VALUES
(2, 'Bùi Văn Bảo', '1', 'buivbao.uet@gmail.com', 0),
(6, 'Bùi Văn Bảo', '1', 'buivbao1234@gmail.com', 1),
(7, 'Đình', 'q', 'anhbay_x0x@yahoo.com.vn', 0),
(8, 'Dương', '1', 'duongduong@gmail.com', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `e_report`
--
ALTER TABLE `e_report`
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `group_lights`
--
ALTER TABLE `group_lights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `light_inf`
--
ALTER TABLE `light_inf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `l_report`
--
ALTER TABLE `l_report`
  ADD KEY `id` (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `group_lights`
--
ALTER TABLE `group_lights`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `light_inf`
--
ALTER TABLE `light_inf`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `e_report`
--
ALTER TABLE `e_report`
  ADD CONSTRAINT `e_report_ibfk_2` FOREIGN KEY (`id`) REFERENCES `light_inf` (`id`);

--
-- Constraints for table `light_inf`
--
ALTER TABLE `light_inf`
  ADD CONSTRAINT `light_inf_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group_lights` (`id`);

--
-- Constraints for table `l_report`
--
ALTER TABLE `l_report`
  ADD CONSTRAINT `l_report_ibfk_1` FOREIGN KEY (`id`) REFERENCES `light_inf` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
