-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/06/2026 às 23:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `views`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `departamentos`
--

INSERT INTO `departamentos` (`id`, `nome`) VALUES
(1, 'RH'),
(2, 'financeiro'),
(3, 'compras');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cargo`, `departamento_id`) VALUES
(1, 'João', 'Gerente', 1),
(2, 'Pedro', 'Faxineiro', 2),
(3, 'Joana', 'Cozinheira', 3);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `vw_funcionarios_departamentos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `vw_funcionarios_departamentos` (
`nome` varchar(45)
,`funcionarios` varchar(45)
,`departamentos` varchar(15)
);

-- --------------------------------------------------------

--
-- Estrutura para view `vw_funcionarios_departamentos`
--
DROP TABLE IF EXISTS `vw_funcionarios_departamentos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_funcionarios_departamentos`  AS SELECT `f`.`nome` AS `nome`, `f`.`cargo` AS `funcionarios`, `d`.`nome` AS `departamentos` FROM (`funcionarios` `f` join `departamentos` `d` on(`f`.`departamento_id` = `d`.`id`)) ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamento_id` (`departamento_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
