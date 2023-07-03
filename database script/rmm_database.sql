-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2023 at 04:47 PM
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
-- Database: `rmm_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers table`
--

CREATE TABLE `customers table` (
  `Customer Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `State` text NOT NULL,
  `Pimcode` int(11) NOT NULL,
  `Issue` text NOT NULL,
  `Model name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders table`
--

CREATE TABLE `orders table` (
  `Order ID` int(11) NOT NULL,
  `Creation date` int(11) NOT NULL,
  `Customer id` int(11) NOT NULL,
  `Partner id` int(11) NOT NULL,
  `Order remark` text NOT NULL,
  `Order Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partners table`
--

CREATE TABLE `partners table` (
  `Partner Id` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Address` text NOT NULL,
  `State` text NOT NULL,
  `Pincode` int(11) NOT NULL,
  `Remarks` text NOT NULL,
  `Specialization` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partners table`
--

INSERT INTO `partners table` (`Partner Id`, `Name`, `Address`, `State`, `Pincode`, `Remarks`, `Specialization`) VALUES
(1, 'Sougata Mandal', 'village-Deocharai P.O Balaghat', 'West Bengal', 736156, '', 0),
(2, 'Dinabandhu Mahato', 'Jhimri\'post-muri-ps Nimdih', 'Jharkhand', 832403, '', 0),
(3, 'Imtiyaz Khan', 'village; Dhakwala P.O kot kalsia ', 'Haryana', 135103, '', 0),
(4, 'Japadhar Patel', 'patrapali block muribahal balangir', 'odisha', 767037, '', 0),
(5, 'pradeep kumar', 'village kaisra dhanaura diste amroha', 'uttar pradesh', 244231, '', 0),
(6, 'manoj kumar', '	serapur po;bhotaka ps kuakhia;dist;-jajpur', 'odisha', 755051, '', 0),
(7, 'brahmdeo kunwar', '	village bhandhu post banwar jarmundi', '	jharkhand', 814141, '', 0),
(8, 'sandeep kumar', '	gopipara gala pathalgaon n.p jashpur', '	chattisgrh', 496118, '', 0),
(9, 'ram bharosh', '	s/o;kapilsay.alola raigarh', '	chattisgarh', 496118, '', 0),
(10, 'akhilesh yadav', '	bardiha urf gaderua mubarakpur dis.azamgarh', '	uttarpradesh', 276404, '', 0),
(11, 'mahesh kumar  mahato', '	shastri ngar east dhowatand dhanbad ', '	jharkhand', 8260001, '', 0),
(12, 'sujoy  choudhary', '	village-p.o-lakhanpur,dist- puruliap.s hura', '	west bengal', 723104, '', 0),
(13, 'ramkumar ojha', '	 danta kelwara shahbadh dist baran', '	rajastan	', 325216, '', 0),
(14, 'vikash kumar', '	tata road khapparsai near indian oil petrol pump dis-west -singhbhum', '	jharkhand', 833201, '', 0),
(15, 'mohammad niyaz', '	jhalaraptatan tahsil jhalarapatan district jhalawar', ' 	rajasthan', 326023, '', 0),
(16, 'rahul jaiswal', '	bakrapalra near sani mandir pillingkata road near sarla residency ', '	assam', 781029, '', 0),
(17, 'abul kalam	', 'manikpur chowk district, east champaran', '	bihar', 845437, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers table`
--
ALTER TABLE `customers table`
  ADD PRIMARY KEY (`Customer Id`);

--
-- Indexes for table `orders table`
--
ALTER TABLE `orders table`
  ADD PRIMARY KEY (`Order ID`),
  ADD KEY `Customer id` (`Customer id`),
  ADD KEY `test` (`Partner id`);

--
-- Indexes for table `partners table`
--
ALTER TABLE `partners table`
  ADD PRIMARY KEY (`Partner Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders table`
--
ALTER TABLE `orders table`
  ADD CONSTRAINT `orders table_ibfk_1` FOREIGN KEY (`Customer id`) REFERENCES `customers table` (`Customer Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test` FOREIGN KEY (`Partner id`) REFERENCES `partners table` (`Partner Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
