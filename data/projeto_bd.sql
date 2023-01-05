-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Jan-2023 às 03:52
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

CREATE TABLE `bairro` (
  `qtd_beneficiarios_pbf` int(11) NOT NULL,
  `qtd_extrema_pobreza` int(11) NOT NULL,
  `qtd_ep_cadastrado` int(11) NOT NULL,
  `qtd_pobreza` int(11) NOT NULL,
  `qtd_baixa_renda` int(11) NOT NULL,
  `qtd_acima_meio_sal_min` int(11) NOT NULL,
  `id_bairro` int(11) NOT NULL,
  `nome` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `bairro`
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
(390, 349, 411, 25, 92, 156, 15, 'Flamengo'),
(2822, 2209, 2800, 349, 709, 766, 20, 'copacabana'),
(451, 379, 455, 89, 167, 199, 21, 'Vila da Penha'),
(3908, 2770, 3767, 721, 1106, 1027, 22, 'Tijuca'),
(936, 804, 1019, 19, 86, 124, 23, 'Laranjeira'),
(1257, 940, 1190, 168, 276, 231, 24, 'Pedra de Guaratiba'),
(1449, 936, 1275, 334, 489, 374, 25, 'Jardim Carioca'),
(1352, 1079, 1287, 198, 343, 255, 26, 'Vila Valqueire'),
(1479, 1077, 1341, 281, 441, 362, 27, 'Freguesia'),
(1306, 1127, 1364, 97, 162, 166, 28, 'Turiacu'),
(1369, 1056, 1387, 119, 178, 158, 29, 'Cavalcanti'),
(1312, 1150, 1393, 62, 184, 164, 30, 'Rocha'),
(1359, 1248, 1425, 40, 127, 225, 31, 'Encantado'),
(1374, 1186, 1443, 71, 241, 312, 32, 'Cachambi'),
(1594, 1297, 1533, 213, 248, 175, 33, 'Parque Comlubia');

--
-- Acionadores `bairro`
--
DELIMITER $$
CREATE TRIGGER `trg_deletar_bairro_museu` AFTER DELETE ON `bairro` FOR EACH ROW DELETE
FROM bairro_museu 
WHERE id_bairro=OLD.id_bairro
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_inserir_bairro` AFTER INSERT ON `bairro` FOR EACH ROW INSERT INTO bairro_biblioteca (id_bairro) VALUES (NEW.id_bairro)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_inserir_bairro_museu` AFTER INSERT ON `bairro` FOR EACH ROW INSERT INTO bairro_museu (id_bairro) VALUES (NEW.id_bairro)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_inserir_bairro_patrimonio` AFTER INSERT ON `bairro` FOR EACH ROW INSERT INTO bairro_patrimonio (id_bairro) VALUES (NEW.id_bairro)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairros`
--

CREATE TABLE `bairros` (
  `id_bairro` int(10) NOT NULL,
  `nome` varchar(55) NOT NULL,
  `qtd_beneficiarios_pbf` int(11) NOT NULL DEFAULT 0,
  `qtd_extrema_pobreza` int(11) NOT NULL DEFAULT 0,
  `qtd_pobreza` int(11) NOT NULL DEFAULT 0,
  `qtd_baixa_renda` int(11) NOT NULL DEFAULT 0,
  `qtd_acima_meio_sal_min` int(11) NOT NULL DEFAULT 0,
  `qtd_ep_cadastrado` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `bairros`
--

INSERT INTO `bairros` (`id_bairro`, `nome`, `qtd_beneficiarios_pbf`, `qtd_extrema_pobreza`, `qtd_pobreza`, `qtd_baixa_renda`, `qtd_acima_meio_sal_min`, `qtd_ep_cadastrado`) VALUES
(1, 'IPANEMA', 1, 861, 99, 196, 197, 1),
(2, 'LARANJEIRAS', 936, 804, 19, 86, 124, 1),
(3, 'GRAJAU', 1, 792, 172, 256, 262, 1),
(4, 'DEODORO', 1, 835, 121, 137, 90, 1),
(5, 'PEDRA DE GUARATIBA', 1, 940, 168, 276, 231, 1),
(6, 'JARDIM CARIOCA', 1, 936, 334, 489, 374, 1),
(7, 'VILA VALQUEIRE', 1, 1, 198, 343, 255, 1),
(8, 'FREGUESIA', 1, 1, 281, 441, 362, 1),
(9, 'VAZ LOBO', 1, 1, 122, 176, 175, 1),
(10, 'TURIACU', 1, 1, 97, 162, 166, 1),
(11, 'CAVALCANTI', 1, 1, 119, 178, 158, 1),
(12, 'ROCHA', 1, 1, 62, 184, 164, 1),
(13, 'ENCANTADO', 1, 1, 40, 127, 225, 1),
(14, 'CACHAMBI', 1, 1, 71, 241, 312, 1),
(15, 'BOTAFOGO', 1, 1, 110, 363, 535, 1),
(16, 'PARQUE COLUMBIA', 1, 1, 213, 248, 175, 1),
(17, 'CATUMBI', 1, 1, 177, 279, 252, 1),
(18, 'BONSUCESSO', 1, 1, 141, 254, 295, 1),
(19, 'MEIER', 1, 1, 24, 168, 348, 1),
(20, 'PARQUE ANCHIETA', 1, 1, 222, 288, 354, 1),
(21, 'ANDARAI', 1, 1, 274, 413, 365, 1),
(22, 'ANIL', 1, 1, 392, 737, 521, 1),
(23, 'VASCO DA GAMA', 1, 1, 173, 226, 205, 1),
(24, 'VARGEM GRANDE', 1, 1, 295, 309, 259, 1),
(25, 'DEL CASTILHO', 1, 1, 57, 200, 208, 1),
(26, 'OSWALDO CRUZ', 1, 1, 144, 262, 298, 1),
(27, 'QUINTINO BOCAIUVA', 1, 1, 141, 269, 300, 1),
(28, 'VIDIGAL', 1, 1, 128, 356, 261, 1),
(29, 'SAMPAIO', 1, 1, 85, 193, 163, 1),
(30, 'BARROS FILHO', 1, 1, 297, 306, 172, 1),
(31, 'VICENTE DE CARVALHO', 1, 1, 277, 324, 286, 1),
(32, 'TAUA', 2, 1, 462, 552, 375, 1),
(33, 'COMPLEXO DA PENHA', 9, 10, 1, 4, 2, 10),
(34, 'VILA COSMOS', 8, 7, 0, 1, 5, 10),
(35, 'GARDENIA', 11, 10, 3, 2, 0, 11),
(36, 'SENADOR CAMARA', 11, 8, 1, 1, 1, 11),
(37, 'CIDADE DE DEUS', 11, 9, 732, 1, 845, 11),
(38, 'COMPLEXO DO ALEMAO', 13, 10, 1, 1, 1, 12),
(39, 'SEPETIBA', 12, 10, 411, 824, 989, 12),
(40, 'MARE', 13, 9, 2, 2, 1, 12),
(41, 'JARDIM BOTANICO', 131, 108, 11, 48, 70, 129),
(42, 'COLONIA', 14, 13, 3, 1, 1, 13),
(43, 'GRUMARI', 16, 14, 3, 1, 0, 14),
(44, 'VICENTE CARVALHO', 15, 14, 3, 6, 2, 14),
(45, 'GUARATIBA', 15, 12, 2, 2, 1, 14),
(46, 'JARDIM GUANABARA', 137, 107, 37, 48, 82, 145),
(47, 'PITANGUEIRA', 19, 16, 5, 7, 2, 16),
(48, 'REALENGO', 16, 12, 1, 2, 1, 16),
(49, 'NOVA HOLANDA', 16, 17, 1, 4, 0, 17),
(50, 'PARQUE DA CIDADE', 16, 17, 2, 6, 1, 17),
(51, 'SAO CONRADO', 160, 133, 7, 37, 25, 177),
(52, 'RIO DAS PEDRAS', 215, 177, 62, 81, 26, 179),
(53, 'PACIENCIA', 17, 14, 1, 1, 1, 18),
(54, 'CIDADE UNIVERSITARIA', 167, 104, 27, 94, 75, 182),
(55, 'BARREIRA DO VASCO', 18, 19, 0, 0, 0, 19),
(56, 'RICARDO ALBUQUERQUE', 17, 19, 1, 1, 2, 19),
(57, 'BANGU', 19, 15, 2, 2, 2, 19),
(58, 'ANTARES', 2, 2, 0, 0, 0, 2),
(59, 'ARARA', 2, 2, 0, 0, 0, 2),
(60, 'BOIUNA', 1, 2, 0, 0, 0, 2),
(61, 'COMOS', 2, 2, 1, 0, 0, 2),
(62, 'FORMIGA', 2, 2, 0, 0, 0, 2),
(63, 'JARDIM GUARATIBA', 3, 2, 2, 0, 0, 2),
(64, 'JESUITAS', 2, 1, 0, 0, 0, 2),
(65, 'KELSON', 2, 2, 0, 0, 0, 2),
(66, 'MANDELA', 2, 2, 0, 0, 0, 2),
(67, 'MANGARATIBA', 2, 2, 0, 0, 0, 2),
(68, 'MUZEMA', 4, 2, 2, 4, 3, 2),
(69, 'NOVA BRASILIA', 2, 2, 1, 1, 0, 2),
(70, 'PARQUE OSVALDO CRUZ', 2, 2, 0, 0, 1, 2),
(71, 'PARQUE PROLETARIO DA PENHA', 2, 1, 0, 0, 0, 2),
(72, 'PEDREIRA', 1, 1, 0, 0, 0, 2),
(73, 'PRACA ONZE', 2, 2, 0, 0, 0, 2),
(74, 'QUINTINO BOCAUIVA', 2, 2, 0, 0, 0, 2),
(75, 'RICARDO ALBOQUERQUE', 2, 2, 0, 0, 0, 2),
(76, 'SANTACRUZ', 2, 2, 0, 0, 0, 2),
(77, 'SENADOR VASCONCELLOS', 2, 1, 0, 0, 0, 2),
(78, 'TRAVESSA', 2, 2, 0, 0, 0, 2),
(79, 'VILA DO JOAO', 3, 2, 1, 0, 0, 2),
(80, 'VILA DOS PINHEIROS', 4, 2, 2, 0, 1, 2),
(81, 'VILAGE', 2, 2, 0, 0, 0, 2),
(82, 'VILA VINTEM', 2, 2, 0, 0, 0, 2),
(83, 'ESTACIO', 2, 1, 258, 442, 365, 2),
(84, 'BENTO RIBEIRO', 2, 1, 179, 337, 377, 2),
(85, 'MAGALHAES BASTOS', 2, 1, 214, 353, 306, 2),
(86, 'GARDENIA AZUL', 2, 1, 545, 837, 430, 2),
(87, 'TOMAS COELHO', 2, 1, 52, 274, 269, 2),
(88, 'PARADA DE LUCAS', 2, 1, 272, 396, 306, 2),
(89, 'RICARDO DE ALBUQUERQUE', 2, 1, 345, 359, 313, 2),
(90, 'SANTO CRISTO', 2, 2, 62, 159, 259, 2),
(91, 'JACAREZINHO', 2, 1, 233, 286, 292, 2),
(92, 'ENGENHO DA RAINHA', 2, 1, 73, 239, 292, 2),
(93, 'CASCADURA', 2, 1, 189, 377, 353, 2),
(94, 'RAMOS', 2, 1, 391, 576, 437, 2),
(95, 'GALEAO', 2, 1, 526, 688, 368, 2),
(96, 'GAMBOA', 2, 2, 59, 131, 262, 2),
(97, 'RECREIO DOS BANDEIRANTES', 2, 2, 411, 480, 445, 2),
(98, 'PILARES', 2, 2, 69, 271, 342, 2),
(99, 'INHAUMA', 2, 2, 114, 362, 387, 2),
(100, 'COLEGIO', 2, 2, 396, 420, 282, 2),
(101, 'COPACABANA', 2, 2, 349, 709, 766, 2),
(102, 'OLARIA', 2, 2, 220, 491, 548, 2),
(103, 'SENADOR VASCONCELOS', 2, 2, 181, 386, 399, 2),
(104, 'JARDIM BANGU', 22, 20, 3, 2, 4, 20),
(105, 'VILA ALIANCA', 20, 20, 2, 1, 1, 20),
(106, 'GAVEA', 192, 171, 25, 42, 50, 205),
(107, 'MARACANA', 196, 149, 30, 53, 91, 206),
(108, 'LEBLON', 201, 180, 14, 80, 141, 208),
(109, 'ZUMBI', 30, 16, 14, 14, 14, 21),
(110, 'VILA MILITAR', 219, 185, 25, 32, 26, 222),
(111, 'COCOTA', 265, 200, 47, 83, 102, 252),
(112, 'VISTA ALEGRE', 286, 239, 49, 99, 100, 274),
(113, 'ILHA DO GOVERNADOR', 26, 15, 0, 0, 2, 28),
(114, 'CAMPO GRANDE', 27, 21, 1, 3, 3, 28),
(115, 'PRACA DA BANDEIRA', 277, 224, 42, 77, 93, 284),
(116, 'JARDIM SULACAP', 265, 214, 28, 47, 58, 290),
(117, 'CANCELA PRETA', 3, 3, 0, 0, 0, 3),
(118, 'CANDIDO MAGALHAES', 3, 3, 0, 0, 0, 3),
(119, 'JARDIM MARAVILHA', 3, 3, 2, 0, 0, 3),
(120, 'NOSSA SENHORA DAS GRACAS', 3, 3, 0, 2, 1, 3),
(121, 'PROVIDENCIA', 3, 3, 0, 0, 0, 3),
(122, 'RAMOS PISCINAO', 2, 3, 0, 1, 0, 3),
(123, 'REALENGO BATAN', 3, 3, 0, 0, 0, 3),
(124, 'RICARDO DE ALBOQUERQUE', 4, 3, 1, 1, 0, 3),
(125, 'SAO CARLOS', 3, 3, 0, 0, 0, 3),
(126, 'TIJUQUINHA', 3, 3, 0, 0, 0, 3),
(127, 'TUIUTI', 3, 3, 0, 0, 0, 3),
(128, 'VARGEM PEQUENA', 3, 2, 493, 603, 461, 3),
(129, 'TANQUE', 3, 2, 536, 728, 567, 3),
(130, 'VILA ISABEL', 3, 2, 415, 625, 552, 3),
(131, 'SANTA TERESA', 3, 2, 225, 486, 492, 3),
(132, 'ITANHANGA', 4, 3, 966, 1, 644, 3),
(133, 'JARDIM AMERICA', 3, 2, 376, 632, 485, 3),
(134, 'COELHO NETO', 3, 2, 229, 425, 443, 3),
(135, 'RIO COMPRIDO', 3, 2, 468, 635, 598, 3),
(136, 'TIJUCA', 3, 2, 721, 1, 1, 3),
(137, 'ROCHA MIRANDA', 3, 3, 280, 473, 555, 3),
(138, 'IRAJA', 3, 3, 550, 902, 936, 3),
(139, 'COSMO', 27, 27, 5, 8, 0, 30),
(140, 'BARRA DA TIJUCA', 305, 258, 44, 95, 102, 0),
(141, 'LAGOA', 32, 33, 1, 8, 22, 35),
(142, 'SANTA CRUZ', 35, 29, 2, 3, 3, 36),
(143, 'CESARAO', 5, 0, 1, 1, 1, 4),
(144, 'COMPLEXO DA MARE', 4, 2, 0, 0, 0, 4),
(145, 'GUANDU', 4, 4, 0, 0, 0, 4),
(146, 'MAGARCA', 5, 4, 1, 1, 0, 4),
(147, 'TRIAGEM', 4, 4, 0, 0, 0, 4),
(148, 'VILA CANOAS', 4, 4, 0, 1, 0, 4),
(149, 'VILA DO PINHEIRO', 4, 4, 0, 0, 0, 4),
(150, 'BENFICA', 3, 3, 426, 507, 496, 4),
(151, 'SAO CRISTOVAO', 3, 3, 221, 416, 480, 4),
(152, 'VIGARIO GERAL', 4, 3, 371, 679, 545, 4),
(153, 'ENGENHO NOVO', 4, 3, 223, 632, 656, 4),
(154, 'CORDOVIL', 4, 3, 248, 490, 502, 4),
(155, 'BRAS DE PINA', 4, 3, 281, 644, 637, 4),
(156, 'LINS DE VASCONCELOS', 4, 3, 167, 473, 521, 4),
(157, 'PENHA CIRCULAR', 4, 3, 333, 558, 589, 4),
(158, 'JACARE', 4, 4, 798, 662, 559, 4),
(159, 'MANGUINHOS', 4, 3, 543, 682, 508, 4),
(160, 'FLAMENGO', 390, 349, 25, 92, 156, 411),
(161, 'SAUDE', 392, 354, 9, 22, 29, 416),
(162, 'ALTO DA BOA VISTA', 0, 0, 104, 165, 139, 0),
(163, 'BARRA DE GUARATIBA', 428, 0, 48, 53, 75, 0),
(164, 'RIBEIRA', 50, 35, 16, 20, 18, 43),
(165, 'URCA', 41, 39, 2, 7, 21, 43),
(166, 'RIACHUELO', 410, 337, 26, 77, 94, 437),
(167, 'RECREIO', 39, 33, 0, 4, 3, 44),
(168, 'SAO FRANCISCO XAVIER', 412, 317, 15, 45, 78, 440),
(169, 'VILA DA PENHA', 451, 379, 89, 167, 199, 455),
(170, 'MONERO', 54, 34, 17, 18, 29, 47),
(171, 'PAQUETA', 475, 422, 28, 34, 61, 479),
(172, 'CACUIA', 551, 380, 130, 182, 166, 487),
(173, 'CIDADE NOVA', 502, 415, 78, 95, 121, 487),
(174, 'COSME VELHO', 497, 374, 30, 67, 63, 491),
(175, 'AUGUSTO VASCONCELOS', 0, 0, 0, 0, 1, 0),
(176, 'BAIRRO CARIOCA', 0, 0, 0, 1, 0, 0),
(177, 'BAIXA DO SAPATEIRO', 5, 0, 0, 0, 0, 0),
(178, 'BATAN', 5, 0, 0, 0, 0, 0),
(179, 'ILHA DE GUARATIBA', 5, 5, 3, 5, 0, 5),
(180, 'PINHEIRO', 5, 5, 0, 2, 0, 5),
(181, 'TUBIACANGA', 5, 4, 2, 3, 1, 5),
(182, 'GUADALUPE', 5, 3, 603, 813, 802, 5),
(183, 'CURICICA', 5, 4, 881, 1, 1, 5),
(184, 'ENGENHO DE DENTRO', 4, 4, 104, 479, 705, 5),
(185, 'PIEDADE', 4, 4, 114, 531, 658, 5),
(186, 'ANCHIETA', 0, 0, 742, 1, 757, 0),
(187, 'MADUREIRA', 5, 4, 391, 668, 616, 5),
(188, 'PRACA SECA', 5, 4, 743, 1, 898, 5),
(189, 'ACARI', 0, 0, 992, 933, 457, 0),
(190, 'CAJU', 5, 4, 265, 634, 639, 5),
(191, 'SANTISSIMO', 5, 4, 604, 630, 711, 5),
(192, 'JACAREPAGUA', 6, 4, 1, 1, 1, 5),
(193, 'TODOS OS SANTOS', 476, 438, 15, 81, 112, 518),
(194, 'CAMORIM', 568, 425, 85, 128, 129, 533),
(195, 'LEME', 564, 436, 75, 158, 136, 558),
(196, 'GLORIA', 550, 468, 40, 71, 97, 566),
(197, 'ILHA DE PAQUETA', 5, 6, 0, 0, 2, 6),
(198, 'PARQUE UNIAO', 6, 6, 0, 1, 0, 6),
(199, 'PADRE MIGUEL', 6, 5, 680, 936, 779, 6),
(200, 'MANGUEIRA', 5, 5, 65, 262, 472, 6),
(201, 'TAQUARA', 6, 5, 997, 1, 1, 6),
(202, 'CENTRO', 6, 5, 150, 379, 703, 6),
(203, 'COSTA BARROS', 7, 5, 914, 1, 648, 6),
(204, 'PITANGUEIRAS', 719, 465, 171, 224, 158, 615),
(205, 'RIO DE JANEIRO', 538, 553, 10, 8, 7, 615),
(206, 'QUINTINO', 63, 60, 3, 7, 8, 62),
(207, 'ENGENHEIRO LEAL', 627, 473, 69, 89, 62, 624),
(208, 'PRAIA DA BANDEIRA', 71, 51, 16, 37, 32, 66),
(209, 'CATETE', 625, 529, 42, 114, 150, 663),
(210, 'HUMAITA', 53, 54, 4, 27, 62, 68),
(211, 'PALMARES', 6, 5, 0, 0, 0, 7),
(212, 'VILA KOSMO', 6, 7, 0, 3, 2, 7),
(213, 'PAVUNA', 7, 5, 1, 1, 1, 7),
(214, 'VILA KENNEDY', 7, 6, 328, 476, 495, 7),
(215, 'CAMPINHO', 715, 567, 78, 133, 111, 705),
(216, 'BANCARIOS', 0, 0, 206, 296, 223, 0),
(217, 'HIGIENOPOLIS', 728, 571, 166, 172, 176, 731),
(218, 'VILA KOSMOS', 753, 596, 135, 218, 148, 731),
(219, 'AGUA SANTA', 0, 0, 14, 69, 83, 0),
(220, 'ABOLICAO', 0, 0, 16, 81, 163, 0),
(221, 'LAPA', 73, 65, 4, 5, 5, 79),
(222, 'ROCINHA', 8, 6, 632, 1, 936, 8),
(223, 'PENHA', 8, 7, 424, 870, 990, 8),
(224, 'PECHINCHA', 823, 639, 129, 234, 232, 807),
(225, 'PORTUGUESA', 1, 669, 240, 341, 249, 857),
(226, 'CAMPO DOS AFONSOS', 6, 4, 0, 2, 1, 0),
(227, 'QUINTINO DE BOCAIUVA', 10, 9, 1, 2, 0, 9),
(228, 'SULACAP', 7, 9, 1, 5, 1, 9),
(229, 'INHOAIBA', 8, 6, 626, 783, 824, 9),
(230, 'COSMOS', 8, 6, 758, 1, 989, 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro_biblioteca`
--

CREATE TABLE `bairro_biblioteca` (
  `id_bairro` int(11) DEFAULT NULL,
  `qtd_bibliotecas` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `bairro_biblioteca`
--

INSERT INTO `bairro_biblioteca` (`id_bairro`, `qtd_bibliotecas`) VALUES
(20, 0),
(21, 2),
(22, 0),
(14, 1),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro_museu`
--

CREATE TABLE `bairro_museu` (
  `id_bairro` int(11) DEFAULT NULL,
  `qtd_museus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `bairro_museu`
--

INSERT INTO `bairro_museu` (`id_bairro`, `qtd_museus`) VALUES
(20, 0),
(21, 1),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro_patrimonio`
--

CREATE TABLE `bairro_patrimonio` (
  `id_bairro` int(11) DEFAULT NULL,
  `qtd_patrimonios` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `bairro_patrimonio`
--

INSERT INTO `bairro_patrimonio` (`id_bairro`, `qtd_patrimonios`) VALUES
(21, 1),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `biblioteca`
--

CREATE TABLE `biblioteca` (
  `id_bairro` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `acervo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `biblioteca`
--

INSERT INTO `biblioteca` (`id_bairro`, `nome`, `acervo`) VALUES
(202, 'Nacional', 9000000),
(202, 'Do Centro de Inf. da ONU', 15000),
(202, 'Histórica do Itamaraty', 6000000),
(202, 'Museu Nacional de Belas Artes', 0),
(202, 'Centro de Documentação e Informação em Arte', 1000000),
(202, 'Do Centro Cultural Banco do Brasil', 120000),
(202, 'Do Instituto Histórico e Geográfico Brasileiro', 500000),
(202, 'Do Instituto Brasileiro de Mercado de Capitais', 18000),
(202, 'Biblioteca Acadêmica Lúcio de Mendonça (ABL)', 20000),
(202, 'Arquivo Nacional', 0),
(202, 'Da Academia de Polícia', 0),
(202, 'Da Assembléia Legislativa do Rio de Janeiro', 0),
(202, 'Bastos Tigre (Associação Brasileira de Imprensa)', 9000),
(202, 'Da Marinha', 110000),
(202, 'Do Exército (BIBLIEx)', 0),
(202, 'Euclides da Cunha', 150000),
(202, 'Paulo Santos (Paço Imperial/IPHAN)', 8000),
(202, 'Biblioteca Rodolfo Garcia (vinculada à ABL)', 70000),
(202, 'Real Gabinete Português de Leitura', 350000),
(202, 'Da Academia Brasileira de Ciências', 30000),
(173, 'Arquivo Geral da Cidade do Rio de Janeiro', 3500000),
(160, 'Do Instituto Fernandes Figueiras', 0),
(15, 'Biblioteca Mario Henrique Simonsen (FGV)', 136000),
(15, 'Marechal Rondon (Museu do Índio - FUNAI)', 17150),
(15, 'Da Fundação Casa de Rui Barbosa (museu?)', 37000),
(2, 'Casa de Leitura', 500),
(165, 'General Lobo Viana', 0),
(41, 'Barbosa Rodrigues', 108700),
(151, 'Do Museu de Astronomia-MAST', 7000),
(107, 'Do IBGE', 181150),
(159, 'Fundação Oswaldo Cruz', 28000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `esfera_do_gov`
--

CREATE TABLE `esfera_do_gov` (
  `id_esfera_gov` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `esfera_do_gov`
--

INSERT INTO `esfera_do_gov` (`id_esfera_gov`, `tipo`) VALUES
(1, 'Nacional'),
(2, 'Municipal'),
(3, 'Federal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `museu`
--

CREATE TABLE `museu` (
  `id_museu` int(11) NOT NULL,
  `id_bairro` int(10) NOT NULL,
  `nome` varchar(56) DEFAULT NULL,
  `endereco` varchar(47) DEFAULT NULL,
  `tipo` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `museu`
--

INSERT INTO `museu` (`id_museu`, `id_bairro`, `nome`, `endereco`, `tipo`) VALUES
(1, 190, 'Da Limpeza Urbana (Casa de Banho D. João VI)', 'R. Praia do Caju, 385', 'Histórico'),
(2, 202, 'Cartográfico do Serviço Geográfico do Exército', 'R. Major Daemon, 81', 'Militar'),
(3, 202, 'Casa de General Osório', 'R. do Riachuelo, 303', 'Militar'),
(4, 202, 'Da  Academia Nacional de Medicina', 'Av. General Justo, 365/9º and.', 'De Farmácia'),
(5, 202, 'Da Eletricidade', 'Av. Marechal Floriano, 168', 'De Técnica'),
(6, 202, 'Da Escola Naval', 'Av. Almirante Silvio de Noronha', 'Militar'),
(7, 202, 'Da Farmácia (Sta. Casa de Misericórdia)', 'R. Santa Luzia, 206', 'De Economia'),
(8, 202, 'Da Fazenda Federal', 'Av. Presidente Antônio Carlos, 375, slj A', 'De Economia'),
(9, 202, 'Da Força Expedicionária Brasileira (FEB)', 'R. das Marrecas, 35, loja', 'Militar'),
(10, 202, 'Da Imagem e do Som (MIS)', 'Pça. Rui Barbosa, 1', 'De Artes'),
(11, 202, 'Da Imprensa Brasileira', 'R. Marquês de Olinda, 29', ''),
(12, 202, 'Da Justiça', 'R. Dom Manoel, 29 - 3° andar', ''),
(13, 202, 'Da Santa Cruz dos Militares', 'R. 1º de Março, 36', 'Histórico'),
(14, 202, 'De Arte Moderna (MAM) do Rio de Janeiro', 'Av. Infante Dom Henrique, 85', 'De Artes'),
(15, 202, 'De Farmácia Antônio Lago ', 'R. dos Andradas, 96/10º and.', 'De Farmácia'),
(16, 202, 'De Gemologia', 'Av. Rio Branco, 15', 'De Ciências'),
(17, 202, 'De Tecnologia Educacional', 'Av. Presidente Vargas, 418 - 21° andar', ''),
(18, 202, 'De Valores do Banco Central', 'Av. Rio Branco, 30', 'De Economia'),
(19, 202, 'Do Banco do Brasil', 'R. 1º de Março, 66/4º and.', 'De Artes'),
(20, 202, 'Do Bonde', 'Av. República do Chile, 65-A', 'De Técnica'),
(21, 202, 'Do Corpo de Bombeiros', 'Pça. da República, 45', 'Militar'),
(22, 202, 'Do Corpo de Fuzileiros Navais', 'Praça Barão de Ladário s/n°- Ilha das Cobras', 'Militar'),
(23, 202, 'Do Crime - Academia de Polícia', 'R. Frei Caneca, 162', 'Militar'),
(24, 202, 'Do Exército - Casa de Deodoro', 'Pça. da República, 197', 'Militar'),
(25, 202, 'Do Negro', 'R. Uruguaiana, 77/1º and.', 'De Etnologia'),
(26, 202, 'Espaço Cultural da Marinha', 'Av. Alfredo Agache, s/nº', 'Histórico'),
(27, 202, 'Histórico e Diplomático do Itamaraty', 'Av. Marechal Floriano, 196', 'Histórico'),
(28, 202, 'Histórico Nacional', 'Av. Marechal Âncora, s/nº', 'Histórico'),
(29, 202, 'Instituto Histórico e Geográfico do Brasil', 'Av. Augusto Severo, 8/10º and.', 'Histórico'),
(30, 202, 'Instrumental Delgado de Carvalho', 'R. do Passeio, 98', 'De Artes'),
(31, 202, 'Judaico', 'R. México 90, 1° andar', ''),
(32, 202, 'Nacional de Belas Artes', 'Av. Rio Branco, 199', 'De Artes Plásticas'),
(33, 202, 'Venerável Ordem Terceira S. Francisco da Penitência', 'Convento St° Antonio - Largo da Carioca', 'Militar'),
(34, 202, 'Naval e Oceanográfico', 'R. Dom Manoel, 15', 'Militar'),
(35, 202, 'Navio Bauru- Museu Flutuante', 'Av. Alfredo Agache, s/nº', 'Histórico'),
(36, 202, 'Pantheon Duque de Caxias', 'Praça Duque de Caxias, 25', 'Militar'),
(37, 202, 'Submarino Riachuelo', 'Av. Alfredo Agache, s/nº', 'Histórico'),
(38, 202, 'Venerável Ordem Terceira S. Francisco', 'Convento Santo Antonio -', 'Militar'),
(39, 17, 'Do Carnaval', 'Av. dos Desfiles,  s/nº', 'De Artes'),
(40, 135, 'De Odontologia Prof. Salles Cunha', 'R. Barão do Sertório, 75', 'De Ciências'),
(41, 173, 'Da Polícia Militar do Estado do RJ', 'R. Marquês de Pombal, 128', 'Militar'),
(42, 160, 'Carmen Miranda', 'Av. Rui Barbosa, s/nº', 'De Artes'),
(43, 160, 'Do Telefone ', 'R. 2 de Dezembro, 63', 'De Técnica'),
(44, 196, 'Da II Guerra Mundial', 'Pça. Brigadeiro Eduardo Gomes', 'Histórico'),
(45, 196, 'Fundação Oscar Niemeyer', 'R. Conde Lages, 25', 'De Artes'),
(46, 196, 'Imperial Irm. N.S. Glória do Outeiro', 'Pça. N.S. da Glória, 135', 'Histórico'),
(47, 209, 'Da República', 'R. do Catete, 153', 'Histórico'),
(48, 209, 'De Folclore Edison Carneiro', 'R. do Catete, 181', 'De Etnologia'),
(49, 15, 'Casa de Rui Barbosa', 'R. São Clemente, 134', 'Histórico'),
(50, 15, 'Do Gás', 'R. Jornalista Orlando Dantas, 44', 'De Técnica'),
(51, 15, 'Do Índio', 'R. das Palmeiras, 55', 'De Etnologia'),
(52, 15, 'Dos Teatros do Rio de Janeiro', 'R. São João Batista, 105', 'De Artes'),
(53, 15, 'Glauber Rocha', 'R. Sorocaba, 190', 'De Artes'),
(54, 15, 'Villa-Lobos', 'R. Sorocaba, 200', 'De Artes'),
(55, 165, 'Antônio de Oliveira', 'Av. Pasteur, 520', 'Histórico'),
(56, 165, 'De Minerais e Rochas do DNPM', 'Av. Pasteur, 404/2º and.', 'De Ciências'),
(57, 174, 'Internacional de Arte Naïf  ', '', 'De Artes'),
(58, 174, 'do Brasil (MIAN)', 'R. Cosme Velho, 561', 'De Artes'),
(59, 101, 'Histórico do Exército e Forte de Copacabana', 'Av. Atlântica - Posto Seis', 'Militar'),
(60, 1, 'Amsterdam Sauer de Pedras Preciosas', 'R. Garcia D\'Ávila, 105', 'De Técnica'),
(61, 1, 'H. Stern', 'R. Garcia D\'Ávila, 113', 'De Técnica'),
(62, 41, 'Botânico', 'R. Jardim Botânico, 1.008', 'De Ciências'),
(63, 41, 'Carpológico do Rio de Janeiro', 'R. Pacheco Leão, 915', 'De Ciências'),
(64, 41, 'Casa dos Pilões', 'R. Jardim Botânico, 1.008', 'De Ciências'),
(65, 106, 'Histórico da Cidade do Rio de Janeiro', 'Estrada de Santa Marina, s/nº-Parque da Cidade ', 'Histórico'),
(66, 106, 'Solar Grandjean de Montigny', 'R. Marquês de São Vicente, 225', 'Histórico'),
(67, 141, 'Fundação Eva Klabin Rapaport', 'Av. Epitácio Pessoa, 2.480', 'De Artes'),
(68, 151, 'Da Fauna', 'Quinta da Boa Vista', 'De Ciências'),
(69, 151, 'De Astronomia e Ciências Afins (MCP)', 'R. General Bruce, 586', 'De Ciências'),
(70, 151, 'De História em Quadrinhos', 'R. General Almério de Moura, 302', 'De Artes '),
(71, 151, 'Do Primeiro Reinado (Antigo Solar da Marquesa de Santos)', 'Av. Dom Pedro II, 293', 'Histórico'),
(72, 151, 'Militar Conde de Linhares', 'Av. Pedro II, 383', 'Militare'),
(73, 151, 'Nacional', 'Quinta da Boa Vista, s/nº', 'De Ciências'),
(74, 162, 'Do Açude', 'Estrada do Açude, 764', 'De Artes Plásticas'),
(75, 107, 'Dos Esportes Mané Garrincha', 'R. Prof. Eurico Rabelo, portão 18', 'De Esportes'),
(76, 107, 'Emílio Garrastazu Médici', 'Estádio do Maracanã, portão 18', 'De Esportes'),
(77, 159, 'Do Instituto Oswaldo Cruz (Museu da Vida)', 'Av. Brasil, 4.365', 'De Ciências'),
(78, 159, 'De Patologia', 'Av. Brasil, 4.365', 'De Ciências'),
(79, 185, 'Universitário Gama Filho', 'R. Manoel Vitorino, 625', 'Histórico'),
(80, 19, 'Histórico do Corpo de Bombeiros', 'R. Aristides Caire, 56', 'Militare'),
(81, 184, 'De Imagens do Inconsciente', 'R. Ramiro Magalhães, 521', 'De Artes Plásticas'),
(82, 184, 'Do Trem', 'R. Arquias Cordeiro, 1.046', 'De Técnica'),
(83, 187, 'Do Clube dos Caçadores', 'R. São Geraldo, 38', 'De Esportes'),
(84, 131, 'Casa de Benjamin Constant', 'R. Monte Alegre, 255', 'Histórico'),
(85, 131, 'Chácara do Céu (Parque das Ruínas)', 'R. Murtinho Nobre, 93', 'De Artes Plásticas'),
(86, 131, 'Do Bonde', 'R. Carlos Brant, 14', ''),
(87, 131, 'Espaço Museu do Universo', 'R. Vice-Governador Rubens Berardo, 100', ''),
(88, 97, 'Casa do Pontal - Arte Popular Brasileira', 'Estrada do Pontal, 3.295', 'De Artes');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bairro`
--
ALTER TABLE `bairro`
  ADD PRIMARY KEY (`id_bairro`);

--
-- Índices para tabela `bairros`
--
ALTER TABLE `bairros`
  ADD PRIMARY KEY (`id_bairro`);

--
-- Índices para tabela `bairro_biblioteca`
--
ALTER TABLE `bairro_biblioteca`
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Índices para tabela `bairro_museu`
--
ALTER TABLE `bairro_museu`
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Índices para tabela `bairro_patrimonio`
--
ALTER TABLE `bairro_patrimonio`
  ADD KEY `id_bairro` (`id_bairro`);

--
-- Índices para tabela `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD KEY `fk_id_bairro_biblioteca` (`id_bairro`);

--
-- Índices para tabela `esfera_do_gov`
--
ALTER TABLE `esfera_do_gov`
  ADD PRIMARY KEY (`id_esfera_gov`);

--
-- Índices para tabela `museu`
--
ALTER TABLE `museu`
  ADD PRIMARY KEY (`id_museu`),
  ADD KEY `fk_id_bairro_museu` (`id_bairro`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bairro`
--
ALTER TABLE `bairro`
  MODIFY `id_bairro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `bairros`
--
ALTER TABLE `bairros`
  MODIFY `id_bairro` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT de tabela `esfera_do_gov`
--
ALTER TABLE `esfera_do_gov`
  MODIFY `id_esfera_gov` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `museu`
--
ALTER TABLE `museu`
  MODIFY `id_museu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bairro_biblioteca`
--
ALTER TABLE `bairro_biblioteca`
  ADD CONSTRAINT `bairro_biblioteca_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Limitadores para a tabela `bairro_museu`
--
ALTER TABLE `bairro_museu`
  ADD CONSTRAINT `bairro_museu_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Limitadores para a tabela `bairro_patrimonio`
--
ALTER TABLE `bairro_patrimonio`
  ADD CONSTRAINT `bairro_patrimonio_ibfk_1` FOREIGN KEY (`id_bairro`) REFERENCES `bairro` (`id_bairro`);

--
-- Limitadores para a tabela `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD CONSTRAINT `fk_id_bairro_biblioteca` FOREIGN KEY (`id_bairro`) REFERENCES `bairros` (`id_bairro`);

--
-- Limitadores para a tabela `museu`
--
ALTER TABLE `museu`
  ADD CONSTRAINT `fk_id_bairro` FOREIGN KEY (`id_bairro`) REFERENCES `bairros` (`id_bairro`),
  ADD CONSTRAINT `fk_id_bairro_museu` FOREIGN KEY (`id_bairro`) REFERENCES `bairros` (`id_bairro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
