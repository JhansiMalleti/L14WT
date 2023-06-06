-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2023 at 09:10 PM
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
-- Table structure for table `faculty1`
--

CREATE TABLE `faculty1` (
  `Year` varchar(30) NOT NULL,
  `Section` varchar(30) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `Faculty` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty1`
--

INSERT INTO `faculty1` (`Year`, `Section`, `Subject`, `Faculty`) VALUES
('3', 'A', 'WT', 'Pranitha'),
('3', 'A', 'OOSE', 'Bhavani'),
('3', 'A', 'ML', 'Yasasswi'),
('3', 'A', 'NNDL', 'Krishna Prasad'),
('3', 'A', 'ITRE', 'Bhaskar'),
('3', 'A', 'CNS', 'Amaravathi'),
('3', 'A', 'SPORTS', '-'),
('3', 'A', 'COUNCELLING', '-'),
('3', 'A', 'LIBRARY', '-'),
('3', 'A', 'OOSE/WT LAB', 'Pranitha'),
('3', 'A', 'OOSE/WT LAB', 'Bhavani'),
('3', 'B', 'WT', 'Bosu Babu'),
('3', 'B', 'OOSE', 'Krishnanjeyulu'),
('3', 'B', 'ML', 'Sangeetha'),
('3', 'B', 'NNDL', 'Anusha'),
('3', 'B', 'ITRE', 'Vijay'),
('3', 'B', 'CNS', 'Gayathri'),
('3', 'B', 'SPORTS', '-'),
('3', 'B', 'COUNCELLING', '-'),
('3', 'B', 'LIBRARY', '-'),
('3', 'B', 'OOSE/WT LAB', 'Bosu Babu'),
('3', 'B', 'OOSE/WT LAB', 'Krishnanjeyulu'),
('3', 'C', 'WT', 'Bosu Babu'),
('3', 'C', 'ML', 'Rohini'),
('3', 'C', 'NNDL', 'Anusha'),
('3', 'C', 'ITRE', 'Prakash'),
('3', 'C', 'CNS', 'Usha Bala'),
('3', 'C', 'SPORTS', '-'),
('3', 'C', 'COUNCELLING', '-'),
('3', 'C', 'LIBRARY', '-'),
('3', 'C', 'OOSE/WT LAB', 'Bosu Babu'),
('3', 'C', 'OOSE/WT LAB', 'Preethi'),
('3', 'C', 'OOSE', 'Preethi');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
