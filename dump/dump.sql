-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Nov-2018 às 23:03
-- Versão do servidor: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alimente-me`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `id_image` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `company`
--

INSERT INTO `company` (`id`, `id_image`, `status`) VALUES
(1, 5, 1),
(2, 6, 1),
(3, 7, 1),
(4, 8, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `company_description`
--

CREATE TABLE `company_description` (
  `id_company` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `company_description`
--

INSERT INTO `company_description` (`id_company`, `title`, `lat`, `long`, `text`) VALUES
(1, 'Di Paollo', NULL, NULL, NULL),
(2, 'Cantina Toldo', NULL, NULL, NULL),
(3, 'Restaurante Andrea', NULL, NULL, NULL),
(4, 'Restaurante Tranquilo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ez_file`
--

CREATE TABLE `ez_file` (
  `id` int(11) NOT NULL,
  `file` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `extension` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `ez_file`
--

INSERT INTO `ez_file` (`id`, `file`, `path`, `extension`) VALUES
(1, 'food-0.jpg', 'assets/img', 'jpg'),
(2, 'food-1.jpg', 'assets/img', 'jpg'),
(3, 'food-2.jpg', 'assets/img', 'jpg'),
(4, 'food-3.jpg', 'assets/img', 'jpg'),
(5, 'logo-0.png', 'assets/img', 'png'),
(6, 'logo-1.jpg', 'assets/img', 'jpg'),
(7, 'logo-2.jpg', 'assets/img', 'jpg'),
(8, 'logo-3.png', 'assets/img', 'png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `id_image` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `food`
--

INSERT INTO `food` (`id`, `id_company`, `id_image`, `status`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `food_description`
--

CREATE TABLE `food_description` (
  `id_food` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `rating` tinyint(5) DEFAULT '5',
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `food_description`
--

INSERT INTO `food_description` (`id_food`, `title`, `rating`, `text`) VALUES
(1, 'Agnoline', 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. Cras bibendum massa sed sodales rhoncus.'),
(2, 'Massa ao Pesto', 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. '),
(3, 'À Parmegiana', 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. '),
(4, 'Bife à Cavalo', 5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lobortis lorem turpis, sed venenatis libero facilisis aliquet. ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `list`
--

CREATE TABLE `list` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_food` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `list`
--

INSERT INTO `list` (`id`, `id_user`, `id_food`) VALUES
(1, 1, 3),
(2, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `online` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag para indicar se usuário está logado no sistema'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `status`, `online`) VALUES
(1, 'Ricardo Pellicioli', 'pellicioli_r@hotmail.com', 'W#B@ri1.', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_image` (`id_image`);

--
-- Indexes for table `company_description`
--
ALTER TABLE `company_description`
  ADD PRIMARY KEY (`id_company`),
  ADD KEY `id_company` (`id_company`);

--
-- Indexes for table `ez_file`
--
ALTER TABLE `ez_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_company` (`id_company`),
  ADD KEY `id_image` (`id_image`);

--
-- Indexes for table `food_description`
--
ALTER TABLE `food_description`
  ADD PRIMARY KEY (`id_food`),
  ADD KEY `id_food` (`id_food`);

--
-- Indexes for table `list`
--
ALTER TABLE `list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_food` (`id_food`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ez_file`
--
ALTER TABLE `ez_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `list`
--
ALTER TABLE `list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `site_food_ibfk_3` FOREIGN KEY (`id_image`) REFERENCES `ez_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `company_description`
--
ALTER TABLE `company_description`
  ADD CONSTRAINT `site_company_description_ibfk_3` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `food_ibfk_3` FOREIGN KEY (`id_image`) REFERENCES `ez_file` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `food_description`
--
ALTER TABLE `food_description`
  ADD CONSTRAINT `food_description_ibfk_3` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `list`
--
ALTER TABLE `list`
  ADD CONSTRAINT `list_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `list_ibfk_3` FOREIGN KEY (`id_food`) REFERENCES `food` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
