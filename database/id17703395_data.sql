-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 04, 2021 at 06:19 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id17703395_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_dates`
--

CREATE TABLE `class_dates` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class_dates`
--

INSERT INTO `class_dates` (`id`, `date`, `from_time`, `to_time`, `type`) VALUES
(1, '2021-09-01', '14:00:00', '16:00:00', 'theory'),
(2, '2021-09-08', '14:00:00', '16:00:00', 'paper'),
(5, '2021-09-15', '14:00:00', '16:00:00', 'theory');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `paper_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `marks` float NOT NULL,
  `student_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`paper_no`, `marks`, `student_email`) VALUES
('P0001', 75.2, 'test@abc.com'),
('P0002', 85, 'test@abc.com');

-- --------------------------------------------------------

--
-- Table structure for table `paper_details`
--

CREATE TABLE `paper_details` (
  `paper_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `paper_details`
--

INSERT INTO `paper_details` (`paper_no`, `date`, `type`) VALUES
('P0001', '2021-10-04', 'MCQ'),
('P0002', '2021-10-02', 'Structured');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `student_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `month` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `bill_no` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`student_email`, `date`, `month`, `amount`, `bill_no`) VALUES
('test@abc.com', '2021-09-01', '2021-Sep', 1500, 'B0001'),
('test@abc.com', '2021-10-04', '2021-Oct', 1500, 'B0002');

-- --------------------------------------------------------

--
-- Table structure for table `student_attendence`
--

CREATE TABLE `student_attendence` (
  `student_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_date_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_attendence`
--

INSERT INTO `student_attendence` (`student_email`, `class_date_id`) VALUES
('test@abc.com', 1),
('test@abc.com', 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_data`
--

CREATE TABLE `student_data` (
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_data`
--

INSERT INTO `student_data` (`email`, `name`, `password`) VALUES
('test@abc.com', '', '$5$RTeZIGReAASo1UGl$CqnbVGl1CtlCUJM4K23.3M0Qmbn662pthhspZXk/ed8');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_dates`
--
ALTER TABLE `class_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`paper_no`,`student_email`),
  ADD KEY `student_email` (`student_email`);

--
-- Indexes for table `paper_details`
--
ALTER TABLE `paper_details`
  ADD PRIMARY KEY (`paper_no`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`bill_no`),
  ADD KEY `email` (`student_email`);

--
-- Indexes for table `student_attendence`
--
ALTER TABLE `student_attendence`
  ADD PRIMARY KEY (`student_email`,`class_date_id`),
  ADD KEY `class_date_id` (`class_date_id`);

--
-- Indexes for table `student_data`
--
ALTER TABLE `student_data`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_dates`
--
ALTER TABLE `class_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`student_email`) REFERENCES `student_data` (`email`),
  ADD CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`paper_no`) REFERENCES `paper_details` (`paper_no`);

--
-- Constraints for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD CONSTRAINT `payment_details_ibfk_1` FOREIGN KEY (`student_email`) REFERENCES `student_data` (`email`);

--
-- Constraints for table `student_attendence`
--
ALTER TABLE `student_attendence`
  ADD CONSTRAINT `student_attendence_ibfk_1` FOREIGN KEY (`student_email`) REFERENCES `student_data` (`email`),
  ADD CONSTRAINT `student_attendence_ibfk_2` FOREIGN KEY (`class_date_id`) REFERENCES `class_dates` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
