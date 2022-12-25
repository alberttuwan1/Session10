-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 04:07 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binusclass`
--

-- --------------------------------------------------------

--
-- Table structure for table `classroomdetail`
--

CREATE TABLE `classroomdetail` (
  `ScheduledClassID` char(5) NOT NULL,
  `BinusianID` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classroomdetail`
--

INSERT INTO `classroomdetail` (`ScheduledClassID`, `BinusianID`) VALUES
('CR001', 'BN124401777'),
('CR001', 'BN124401778'),
('CR001', 'BN124401779');

-- --------------------------------------------------------

--
-- Table structure for table `classroomheader`
--

CREATE TABLE `classroomheader` (
  `ScheduledClassID` char(5) NOT NULL CHECK (`ScheduledClassID` regexp '^CR[0-9]*$'),
  `LecturerID` char(5) NOT NULL CHECK (`LecturerID` regexp '^D[0-9]*$'),
  `CourseID` char(11) NOT NULL CHECK (`CourseID` regexp '^[A-Z]{4}[0-9]*$'),
  `ClassroomNumber` int(11) NOT NULL,
  `ClassStart` datetime NOT NULL,
  `ClassEnd` datetime NOT NULL CHECK (`ClassEnd` > `ClassStart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `classroomheader`
--

INSERT INTO `classroomheader` (`ScheduledClassID`, `LecturerID`, `CourseID`, `ClassroomNumber`, `ClassStart`, `ClassEnd`) VALUES
('CR001', 'D6657', 'COMP6708016', 423, '2023-01-04 09:20:00', '2023-01-04 10:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `msbinusian`
--

CREATE TABLE `msbinusian` (
  `BinusianID` char(11) NOT NULL CHECK (`BinusianID` regexp '^BN[0-9]*$'),
  `BinusianName` varchar(100) NOT NULL,
  `BinusianMajor` varchar(50) NOT NULL,
  `BinusianEmail` varchar(50) NOT NULL CHECK (`BinusianEmail` like '%@binus.ac.id'),
  `BinusianPhone` varchar(15) NOT NULL CHECK (octet_length(`BinusianPhone`) >= 11 and `BinusianPhone` regexp '^[0-9]*$'),
  `BinusianAddress` varchar(100) NOT NULL,
  `BinusianDOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `msbinusian`
--

INSERT INTO `msbinusian` (`BinusianID`, `BinusianName`, `BinusianMajor`, `BinusianEmail`, `BinusianPhone`, `BinusianAddress`, `BinusianDOB`) VALUES
('BN124401777', 'Albert Tuwan', 'Computer Science and Mathematics', 'agt@binus.ac.id', '081234567890', 'Jl. a No. 1', '2012-12-12'),
('BN124401778', 'Jason Adriel', 'Computer Science and Mathematics', 'ja@binus.ac.id', '080987654321', 'Jl. b No. 2', '2001-01-01'),
('BN124401779', 'Mario Iskandar', 'Computer Science and Mathematics', 'mi@binus.ac.id', '08112233445566', 'Jl. c No. 3', '2003-03-17');

-- --------------------------------------------------------

--
-- Table structure for table `mscourse`
--

CREATE TABLE `mscourse` (
  `CourseID` char(11) NOT NULL CHECK (`CourseID` regexp '^[A-Z]{4}[0-9]*$'),
  `CourseName` varchar(100) NOT NULL,
  `CourseSCU` int(11) NOT NULL CHECK (`CourseSCU` in (1,2,4)),
  `CourseType` char(3) NOT NULL CHECK (`CourseType` in ('Lec','Lab'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mscourse`
--

INSERT INTO `mscourse` (`CourseID`, `CourseName`, `CourseSCU`, `CourseType`) VALUES
('COMP6708016', 'Object Oriented Programming', 2, 'Lec');

-- --------------------------------------------------------

--
-- Table structure for table `mslecturer`
--

CREATE TABLE `mslecturer` (
  `LecturerID` char(5) NOT NULL CHECK (`LecturerID` regexp '^D[0-9]*$'),
  `LecturerName` varchar(100) NOT NULL,
  `LecturerEmail` varchar(50) NOT NULL CHECK (`LecturerEmail` like '%@binus.edu'),
  `LecturerPhone` varchar(15) NOT NULL CHECK (octet_length(`LecturerPhone`) >= 11 and `LecturerPhone` regexp '^[0-9]*$'),
  `LecturerAddress` varchar(100) NOT NULL,
  `LecturerDOB` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mslecturer`
--

INSERT INTO `mslecturer` (`LecturerID`, `LecturerName`, `LecturerEmail`, `LecturerPhone`, `LecturerAddress`, `LecturerDOB`) VALUES
('D6657', 'Anderies Notanto', 'anderies.notanto@binus.edu', '080099887766', 'Jl. d No. 4', '1997-04-07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `classroomdetail`
--
ALTER TABLE `classroomdetail`
  ADD PRIMARY KEY (`ScheduledClassID`,`BinusianID`),
  ADD KEY `BinusianID` (`BinusianID`);

--
-- Indexes for table `classroomheader`
--
ALTER TABLE `classroomheader`
  ADD PRIMARY KEY (`ScheduledClassID`),
  ADD KEY `LecturerID` (`LecturerID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `msbinusian`
--
ALTER TABLE `msbinusian`
  ADD PRIMARY KEY (`BinusianID`);

--
-- Indexes for table `mscourse`
--
ALTER TABLE `mscourse`
  ADD PRIMARY KEY (`CourseID`);

--
-- Indexes for table `mslecturer`
--
ALTER TABLE `mslecturer`
  ADD PRIMARY KEY (`LecturerID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `classroomdetail`
--
ALTER TABLE `classroomdetail`
  ADD CONSTRAINT `classroomdetail_ibfk_1` FOREIGN KEY (`ScheduledClassID`) REFERENCES `classroomheader` (`ScheduledClassID`),
  ADD CONSTRAINT `classroomdetail_ibfk_2` FOREIGN KEY (`BinusianID`) REFERENCES `msbinusian` (`BinusianID`);

--
-- Constraints for table `classroomheader`
--
ALTER TABLE `classroomheader`
  ADD CONSTRAINT `classroomheader_ibfk_1` FOREIGN KEY (`LecturerID`) REFERENCES `mslecturer` (`LecturerID`),
  ADD CONSTRAINT `classroomheader_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `mscourse` (`CourseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
