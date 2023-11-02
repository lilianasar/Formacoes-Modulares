-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Jun-2021 às 20:56
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `invicta`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `dataCompra` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `compras`
--

INSERT INTO `compras` (`id`, `idProduto`, `idCliente`, `quantidade`, `valor`, `dataCompra`) VALUES
(1, 2, 2, 2, '6.00', '2021-06-13 20:06:46'),
(2, 4, 3, 2, '6.00', '2021-06-13 20:34:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `produto` varchar(50) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `referencia` varchar(50) NOT NULL,
  `valor` decimal(7,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `produto`, `categoria`, `referencia`, `valor`, `stock`) VALUES
(1, 'Postal Porto 1', 'Postais', '1', '3.00', 25),
(2, 'Postal Porto 2', 'Postais', '2', '3.00', 30),
(3, 'Postal Porto 3', 'Postais', '3', '3.00', 10),
(4, 'Postal Porto Sortido', 'Postais', '4', '3.00', 50),
(5, 'Chávena de café com pires 1', 'Loiça', '5', '10.00', 40),
(6, 'Chávena de café com pires Sortido', 'Loiça', '6', '10.00', 45);

-- --------------------------------------------------------

--
-- Estrutura da tabela `registos`
--

CREATE TABLE `registos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `morada` varchar(50) NOT NULL,
  `detmorada` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` int(20) NOT NULL,
  `dataRegisto` datetime NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `privilegio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `registos`
--

INSERT INTO `registos` (`id`, `nome`, `morada`, `detmorada`, `email`, `telefone`, `dataRegisto`, `username`, `pass`, `privilegio`) VALUES
(1, 'admin', '', '', '', 0, '2021-05-26 12:49:11', 'admin', 'admin', 'admin'),
(2, 'Liliana Rodrigues', 'Rua Ribeiro Cambado', 'Valongo', 'liliana@liliana.com', 92718, '2021-05-29 13:42:28', 'liliana', 'liliana', 'admin'),
(3, 'Manuel Rodrigues', 'Rua atrás', 'Valongo', 'manuel@manuel.com', 3747, '2021-05-29 13:46:27', 'manuel', 'manuel', 'user'),
(4, 'Teresa Lopes', 'Rua da Calçada', 'Mogadouro', '', 477838363, '2021-05-29 16:36:26', 'teresa', 'teresa', 'user'),
(5, 'Casimiro Rodrigues', 'Rua da Calçada', 'Bragança', 'casimiro@casimiro.com', 1111, '2021-05-29 16:41:23', 'casimiro', 'casimiro', 'user');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduto` (`idProduto`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `registos`
--
ALTER TABLE `registos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `registos`
--
ALTER TABLE `registos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `registos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idProduto` FOREIGN KEY (`idProduto`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
