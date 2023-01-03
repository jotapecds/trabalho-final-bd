-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2022 at 12:03 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_bd`
--

-- --------------------------------------------------------

--
-- Table structure for table `bairro`
--

CREATE TABLE `bairro` (
  `qtd_beneficiarios_pbf` int(11) DEFAULT NULL,
  `qtd_extrema_popreza` int(11) DEFAULT NULL,
  `qtd_ep_cadastrado` int(11) DEFAULT NULL,
  `qtd_pobreza` int(11) DEFAULT NULL,
  `qtd_baixa_renda` int(11) DEFAULT NULL,
  `qtd_acima_meio_sal_min` int(11) DEFAULT NULL,
  `id_bairro` int(11) NOT NULL,
  `nome` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bairro_biblioteca`
--

CREATE TABLE `bairro_biblioteca` (
  `id_bairro` int(11) DEFAULT NULL,
  `qtd_bibliotecas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bairro_museu`
--

CREATE TABLE `bairro_museu` (
  `id_bairro` int(11) DEFAULT NULL,
  `qtd_museus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bairro_patrimonio`
--

CREATE TABLE `bairro_patrimonio` (
  `id_bairro` int(11) DEFAULT NULL,
  `qtd_patrimonios` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `biblioteca`
--

CREATE TABLE `biblioteca` (
  `id_biblioteca` int(11) NOT NULL,
  `acervo` varchar(50) DEFAULT NULL,
  `id_bairro` int(11) DEFAULT NULL,
  `nome` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `esfera_do_gov`
--

CREATE TABLE `esfera_do_gov` (
  `id_esfera_gov` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `museu`
--

CREATE TABLE `museu` (
  `id_museu` int(11) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `qtd_museu` int(11) DEFAULT NULL,
  `id_bairro` int(11) DEFAULT NULL,
  `nome` varchar(55) NOT NULL,
  `tipo` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patrimonio`
--

CREATE TABLE `patrimonio` (
  `id_patrimonio` int(11) NOT NULL,
  `localizacao` varchar(100) DEFAULT NULL,
  `id_bairro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pertence`
--

CREATE TABLE `pertence` (
  `id_patrimonio` int(11) DEFAULT NULL,
  `id_esfera_do_gov` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id_bairro`);

--
-- Indexes for table `bairro_biblioteca`
--
ALTER TABLE `bairro_biblioteca`
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Indexes for table `bairro_museu`
--
ALTER TABLE `bairro_museu`
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Indexes for table `bairro_patrimonio`
--
ALTER TABLE `bairro_patrimonio`
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Indexes for table `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD PRIMARY KEY (`id_biblioteca`),
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Indexes for table `esfera_do_gov`
--
ALTER TABLE `esfera_do_gov`
  ADD PRIMARY KEY (`id_esfera_gov`);

--
-- Indexes for table `museu`
--
ALTER TABLE `museu`
  ADD PRIMARY KEY (`id_museu`),
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Indexes for table `patrimonio`
--
ALTER TABLE `patrimonio`
  ADD PRIMARY KEY (`id_patrimonio`),
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Indexes for table `pertence`
--
ALTER TABLE `pertence`
  ADD KEY `id_patrimonio` (`id_patrimonio`),
  ADD KEY `id_esfera_do_gov` (`id_esfera_do_gov`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id_bairro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `id_biblioteca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `museu`
--
ALTER TABLE `museu`
  MODIFY `id_museu` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bairro_biblioteca`
--
ALTER TABLE `bairro_biblioteca`
  ADD CONSTRAINT `bairro_biblioteca_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Constraints for table `bairro_museu`
--
ALTER TABLE `bairro_museu`
  ADD CONSTRAINT `bairro_museu_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Constraints for table `bairro_patrimonio`
--
ALTER TABLE `bairro_patrimonio`
  ADD CONSTRAINT `bairro_patrimonio_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Constraints for table `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD CONSTRAINT `biblioteca_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Constraints for table `museu`
--
ALTER TABLE `museu`
  ADD CONSTRAINT `museu_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Constraints for table `patrimonio`
--
ALTER TABLE `patrimonio`
  ADD CONSTRAINT `patrimonio_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Constraints for table `pertence`
--
ALTER TABLE `pertence`
  ADD CONSTRAINT `pertence_ibfk_1` FOREIGN KEY (`id_patrimonio`) REFERENCES `patrimonio` (`id_patrimonio`),
  ADD CONSTRAINT `pertence_ibfk_2` FOREIGN KEY (`id_esfera_do_gov`) REFERENCES `esfera_do_gov` (`id_esfera_gov`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
