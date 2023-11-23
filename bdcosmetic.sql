-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 23, 2023 at 02:14 AM
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
-- Database: `bdcosmetic`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name_category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name_category`) VALUES
(1, 'Categeria 1'),
(2, 'Categoría 2'),
(3, 'Prueba Categoria');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Id` int(11) NOT NULL,
  `Image` varchar(500) NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `description_product` varchar(255) NOT NULL,
  `Catalogue` varchar(250) NOT NULL,
  `Stock` varchar(255) NOT NULL,
  `price_base` double NOT NULL,
  `price_ofert` double DEFAULT NULL,
  `Status` enum('0','1') NOT NULL DEFAULT '1',
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Id`, `Image`, `name_product`, `description_product`, `Catalogue`, `Stock`, `price_base`, `price_ofert`, `Status`, `category_id`) VALUES
(2, '', 'jabon', '', '', '', 10, 11, '1', 1),
(3, '', 'cepillo', '', '', '', 10, 12, '1', 1),
(4, '', 'crema', '', '', '', 12, 10, '1', 1),
(30, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700672609/neheolrcpevrvggwpvd1.jpg', 'Example Product', 'Description', 'Catalogue', '100', 19.99, 15.99, '1', 1),
(31, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700672609/neheolrcpevrvggwpvd1.jpg', 'Example Product', 'Description', 'Catalogue', '100', 19.99, 15.99, '1', 1),
(33, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700672609/neheolrcpevrvggwpvd1.jpg', 'Prueba', 'Test123', '123', '100', 100, 80, '1', 1),
(34, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700675507/vgnr9byxrylyzechek7u.jpg', 'Test', 'Test', 'Test', '12', 123, 120, '1', 1),
(35, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700675574/cniwltrsvuaxi000mkqv.jpg', '123', '123', '123', '10', 10, 1, '1', 1),
(36, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700694091/qi3vmxaihwaakg83brod.jpg', 'Test ', '123', '123', '10', 100, 80, '1', 1),
(37, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700694180/grr6yb0ayqprkk6dothh.jpg', 'Prueba 1234', '1234', '1234', '100', 10, 8, '1', 1),
(38, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700694350/gkmz3fgtbam0s7jw20ej.jpg', 'Prueba', '1234', '1234', '100', 100, 80, '1', 1),
(39, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700695618/g0fxpgqjuun9aothqt2a.jpg', 'PRODUCTO', 'CAT 2', 'PC2', '20', 50, 45, '1', 2),
(40, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700699867/lxn6fvrt02muubsizgkc.jpg', 'Plnta', 'Planta', 'P1', '100', 50, 45, '1', 2),
(41, 'https://res.cloudinary.com/da7fxpp2k/image/upload/v1700700758/pfawdhfk3rifhy5pfafl.jpg', 'Producto Prueba', 'Test 123', 'CP', '10', 50, 45, '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `technical_support`
--

CREATE TABLE `technical_support` (
  `id` int(11) NOT NULL,
  `Problem_title` varchar(255) NOT NULL,
  `Affair` varchar(255) NOT NULL,
  `Failed` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `technical_support`
--

INSERT INTO `technical_support` (`id`, `Problem_title`, `Affair`, `Failed`, `Description`) VALUES
(2, 'Fallo', 'Problemas', 'Login', 'no puedo iniciar session');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Sex` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `Num_washatpp` varchar(250) NOT NULL,
  `role` bit(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `username`, `password`, `Sex`, `location`, `Num_washatpp`, `role`) VALUES
(43, 'alejandra', '1234', '', '', '', b'00'),
(44, 'jose', '1234', '', '', '', b'00'),
(45, 'josefina', '123456', '', '', '', b'00'),
(46, 'sadasd', 'asdasd', '', '', '', b'00'),
(47, 'jhon', '123456', '', '', '', b'00'),
(48, 'Ytzel', '321323', '', '', '', b'00'),
(49, 'Ytzel', '123456', '', '', '', b'00'),
(50, 'Elias', '123456', '', '', '', b'00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `category_id_fk` (`category_id`);

--
-- Indexes for table `technical_support`
--
ALTER TABLE `technical_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `technical_support`
--
ALTER TABLE `technical_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
