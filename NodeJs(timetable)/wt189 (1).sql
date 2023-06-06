-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 08:40 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wt189`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `uname`, `password`, `email`) VALUES
(1, 'Anits', 'Anits', 'Anits', 'Anits@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `classteacher`
--

CREATE TABLE `classteacher` (
  `Year` varchar(10) NOT NULL,
  `Section` varchar(10) NOT NULL,
  `Faculty` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classteacher`
--

INSERT INTO `classteacher` (`Year`, `Section`, `Faculty`) VALUES
('3', 'C', 'Bosu Babu'),
('3', 'B', 'Krishnanjeyulu'),
('3', 'A', 'Amaravathi');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `Year` varchar(30) DEFAULT NULL,
  `Section` varchar(30) DEFAULT NULL,
  `Subject` varchar(30) NOT NULL,
  `Faculty` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`Year`, `Section`, `Subject`, `Faculty`) VALUES
('3', 'C', 'WT', 'Bosu Babu');

-- --------------------------------------------------------

--
-- Table structure for table `faculty1`
--

CREATE TABLE `faculty1` (
  `id` int(60) NOT NULL,
  `name` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL DEFAULT 'root'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty1`
--

INSERT INTO `faculty1` (`id`, `name`, `email`, `password`) VALUES
(2, 'Bosu Babu', 'bosubabu@anits.edu.in', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `Year` varchar(100) DEFAULT NULL,
  `Section` varchar(100) DEFAULT NULL,
  `Day` varchar(100) DEFAULT NULL,
  `Period1` varchar(100) DEFAULT NULL,
  `Period2` varchar(100) DEFAULT NULL,
  `Period3` varchar(100) DEFAULT NULL,
  `Period4` varchar(100) DEFAULT NULL,
  `Period5` varchar(100) DEFAULT NULL,
  `Period6` varchar(100) DEFAULT NULL,
  `Period7` varchar(100) DEFAULT NULL,
  `Period8` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`Year`, `Section`, `Day`, `Period1`, `Period2`, `Period3`, `Period4`, `Period5`, `Period6`, `Period7`, `Period8`) VALUES
('3', 'C', 'Monday', 'WT/00SE', 'WT/OOSE', 'WT/OOSE', 'WT/OOSE', 'NNDL', 'WT', 'WT', 'ML');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
