-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 03:23 PM
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
  `qtd_extrema_pobreza` int(11) DEFAULT NULL,
  `qtd_ep_cadastrado` int(11) DEFAULT NULL,
  `qtd_pobreza` int(11) DEFAULT NULL,
  `qtd_baixa_renda` int(11) DEFAULT NULL,
  `qtd_acima_meio_sal_min` int(11) DEFAULT NULL,
  `id_bairro` int(11) NOT NULL,
  `nome` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bairro`
--

INSERT INTO `bairro` (`qtd_beneficiarios_pbf`, `qtd_extrema_pobreza`, `qtd_ep_cadastrado`, `qtd_pobreza`, `qtd_baixa_renda`, `qtd_acima_meio_sal_min`, `id_bairro`, `nome`) VALUES
(1029, 881, 1014, 99, 196, 197, 1, 'Ipanema'),
(1017, 792, 1026, 172, 86, 124, 2, 'Grajau'),
(1050, 835, 1055, 121, 137, 90, 3, 'Deodoro'),
(1352, 1088, 1348, 122, 176, 175, 4, 'Vaz Lobo'),
(13860, 9868, 12931, 2244, 2749, 1467, 5, 'Mare'),
(12, 9, 11, 2, 2, 1, 6, 'Senador Camara'),
(12, 10, 13, 411, 824, 989, 7, 'Sepetiba'),
(8, 7, 8, 632, 1, 936, 8, 'Rocinha'),
(32, 33, 35, 1, 8, 22, 9, 'Lagoa'),
(192, 171, 205, 25, 42, 50, 10, 'Gavea'),
(3866, 3223, 4106, 221, 416, 480, 11, 'São cristovão'),
(502, 415, 487, 78, 95, 121, 12, 'Cidade Nova'),
(6142, 5263, 6668, 150, 379, 703, 13, 'Centro'),
(1366, 1151, 1466, 1110, 363, 535, 14, 'Botafogo'),
(390, 349, 411, 25, 92, 156, 15, 'Flamengo');

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

--
-- Dumping data for table `biblioteca`
--

INSERT INTO `biblioteca` (`id_biblioteca`, `acervo`, `id_bairro`, `nome`) VALUES
(1, '9000000', 13, 'Nacional'),
(2, '15000', 13, 'do centro de inf da ONU'),
(3, '6000000', 13, 'Histórica do itamarati'),
(4, '1000000', 13, 'Centro de documentação e informação em arte'),
(5, '120000', 13, 'do centro cultura do Banco do Brasil'),
(6, '3500000', 12, 'Arquivo geral da cidade do Rio de Janeiro'),
(7, '0', 15, 'Instituto Fernando Figueiras'),
(8, '136000', 14, 'Biblioteca Mário Henqqiue Simonsen(FGV)'),
(9, '17150', 14, 'Marechal Rondon (Museu do Índio - FUNAI)'),
(10, '37000', 14, 'Da Fundação Casa de Rui Barbosa (museu?)');

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
  `id_bairro` int(11) DEFAULT NULL,
  `nome` varchar(55) NOT NULL,
  `tipo` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `museu`
--

INSERT INTO `museu` (`id_museu`, `endereco`, `id_bairro`, `nome`, `tipo`) VALUES
(1, 'Praça da República, 45', 13, 'do corpo de bombeiro', 'militar'),
(2, 'Avenida Pasteur, 520', 14, 'Antonio de Oliveira', 'histórico'),
(3, 'Quinta da boa vista', 11, 'da fauna', 'de ciencias'),
(4, 'Av. Epitácio pessoa, 2480', 9, 'Fundação Eva Klabin Rapaport', 'de artes'),
(5, 'R. Major Daemon, 81', 13, 'Cartográfico do Serviço Geográfico do Exército', 'Militar'),
(6, 'R. do Riachuelo, 303', 13, 'Casa de General Osório', 'Militar'),
(7, 'R. Santa Luzia, 206', 13, 'Da Farmácia (Sta. Casa de Misericórdia)', 'De Economia'),
(8, 'R. Dom Manoel, 29 - 3° andar', 13, 'Da Justiça', ''),
(9, 'Av. Rio Branco, 199', 13, 'Nacional de Belas Artes', 'De Artes Plásticas');

-- --------------------------------------------------------

--
-- Table structure for table `patrimonio`
--

CREATE TABLE `patrimonio` (
  `id_patrimonio` int(11) NOT NULL,
  `localizacao` varchar(100) DEFAULT NULL,
  `id_bairro` int(11) DEFAULT NULL,
  `nome` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patrimonio`
--

INSERT INTO `patrimonio` (`id_patrimonio`, `localizacao`, `id_bairro`, `nome`) VALUES
(1, 'R. Mayrink Veiga, 28', 13, 'Prédio da Embrafilme'),
(2, 'Ilha Fiscal', 13, 'Ilha Fiscal'),
(3, 'R. Barão de São Félix, 94', 13, 'Solar'),
(4, 'Largo da Carioca', 13, 'Relógio da Carioca'),
(5, 'R. Costa Ferreira, 70', 13, 'Cortiço');

-- --------------------------------------------------------

--
-- Table structure for table `patrimonio_esfera_do_gov`
--

CREATE TABLE `patrimonio_esfera_do_gov` (
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
  ADD PRIMARY KEY (`id_patrimonio`);

--
-- Indexes for table `patrimonio_esfera_do_gov`
--
ALTER TABLE `patrimonio_esfera_do_gov`
  ADD KEY `id_patrimonio` (`id_patrimonio`),
  ADD KEY `id_esfera_do_gov` (`id_esfera_do_gov`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id_bairro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `id_biblioteca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `museu`
--
ALTER TABLE `museu`
  MODIFY `id_museu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `patrimonio`
--
ALTER TABLE `patrimonio`
  MODIFY `id_patrimonio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `patrimonio_esfera_do_gov`
--
ALTER TABLE `patrimonio_esfera_do_gov`
  ADD CONSTRAINT `patrimonio_esfera_do_gov_ibfk_1` FOREIGN KEY (`id_patrimonio`) REFERENCES `patrimonio` (`id_patrimonio`),
  ADD CONSTRAINT `patrimonio_esfera_do_gov_ibfk_2` FOREIGN KEY (`id_esfera_do_gov`) REFERENCES `esfera_do_gov` (`id_esfera_gov`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
