-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3390
-- Generation Time: Apr 15, 2024 at 04:12 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adslocadoraveiculos`
--

-- --------------------------------------------------------

--
-- Table structure for table `aluguel`
--

CREATE TABLE `aluguel` (
  `idAluguel` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `Veiculo_Placa` varchar(7) NOT NULL,
  `DateTime_Inicio` datetime NOT NULL,
  `DateTime_Fim` datetime NOT NULL,
  `Entrega_CNPJ` varchar(14) NOT NULL,
  `Motorista_CPF` varchar(11) NOT NULL,
  `Numero_CNH` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aluguel`
--

INSERT INTO `aluguel` (`idAluguel`, `idCliente`, `Veiculo_Placa`, `DateTime_Inicio`, `DateTime_Fim`, `Entrega_CNPJ`, `Motorista_CPF`, `Numero_CNH`) VALUES
(1, 2, 'ABC1234', '2024-04-15 10:00:00', '2024-04-30 15:00:00', '12345678901234', '12345678901', '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `automóvel`
--

CREATE TABLE `automóvel` (
  `Veiculo_Placa` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `camioneta_carga`
--

CREATE TABLE `camioneta_carga` (
  `Veiculo_Placa` varchar(7) NOT NULL,
  `Capacidade_Carga` float NOT NULL COMMENT 'EM TONELADAS (t), ACEITA APENAS NUMEROS (COM E SEM DECIMAL).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `camioneta_pass`
--

CREATE TABLE `camioneta_pass` (
  `Veiculo_Placa` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `EnderecoCliente` varchar(45) NOT NULL,
  `NomeCliente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`idCliente`, `EnderecoCliente`, `NomeCliente`) VALUES
(1, 'Av. Paulista, 123', 'João da Silva'),
(2, 'Rua da Praia, 456', 'Maria Oliveira'),
(3, 'Av. das Árvores, 789', 'Empresa XYZ');

-- --------------------------------------------------------

--
-- Table structure for table `cliente_indica_motorista`
--

CREATE TABLE `cliente_indica_motorista` (
  `idCliente` int(11) NOT NULL,
  `Motorista_CPF` varchar(11) NOT NULL,
  `Numero_CNH` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente_indica_motorista`
--

INSERT INTO `cliente_indica_motorista` (`idCliente`, `Motorista_CPF`, `Numero_CNH`) VALUES
(2, '12345678901', '9876543210');

-- --------------------------------------------------------

--
-- Table structure for table `filial`
--

CREATE TABLE `filial` (
  `CNPJ_Filial` varchar(14) NOT NULL,
  `Endereço` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filial`
--

INSERT INTO `filial` (`CNPJ_Filial`, `Endereço`) VALUES
('12345678901234', 'Av. das Flores, 789');

-- --------------------------------------------------------

--
-- Table structure for table `motorista`
--

CREATE TABLE `motorista` (
  `Motorista_CPF` varchar(11) NOT NULL,
  `Numero_CNH` varchar(12) NOT NULL,
  `Validade_CNH` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `motorista`
--

INSERT INTO `motorista` (`Motorista_CPF`, `Numero_CNH`, `Validade_CNH`) VALUES
('12345678901', '9876543210', '2025-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `passageiro`
--

CREATE TABLE `passageiro` (
  `Veiculo_Placa` varchar(7) NOT NULL,
  `Tamanho` varchar(45) NOT NULL,
  `N.Passageiros` int(2) NOT NULL,
  `N.Portas` int(2) NOT NULL,
  `Direcao Hidraulica` tinyint(4) NOT NULL,
  `Cambio` varchar(45) NOT NULL,
  `Acessorios` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pessoa_fisica`
--

CREATE TABLE `pessoa_fisica` (
  `Cliente_idCliente` int(11) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `Data_N` date NOT NULL,
  `Gênero` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoa_fisica`
--

INSERT INTO `pessoa_fisica` (`Cliente_idCliente`, `CPF`, `Data_N`, `Gênero`) VALUES
(1, '12345678901', '1990-05-15', 'Masculino'),
(2, '98765432109', '1985-09-20', 'Feminino');

-- --------------------------------------------------------

--
-- Table structure for table `pessoa_juridica`
--

CREATE TABLE `pessoa_juridica` (
  `Cliente_idCliente` int(11) NOT NULL,
  `CNPJ` varchar(14) NOT NULL,
  `Inscricao_Estadual` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pessoa_juridica`
--

INSERT INTO `pessoa_juridica` (`Cliente_idCliente`, `CNPJ`, `Inscricao_Estadual`) VALUES
(3, '01234567890123', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `revisão`
--

CREATE TABLE `revisão` (
  `Veiculo_Placa` varchar(7) NOT NULL,
  `Data_e_hora` datetime NOT NULL,
  `Descricao_Revisao` varchar(512) NOT NULL,
  `KM_Total_record` float NOT NULL,
  `KM_Medio_record` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revisão`
--

INSERT INTO `revisão` (`Veiculo_Placa`, `Data_e_hora`, `Descricao_Revisao`, `KM_Total_record`, `KM_Medio_record`) VALUES
('ABC1234', '2024-04-14 10:00:00', 'Troca de óleo e filtro', 5000, 50);

-- --------------------------------------------------------

--
-- Table structure for table `seguradora`
--

CREATE TABLE `seguradora` (
  `idSeguradora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seguradora`
--

INSERT INTO `seguradora` (`idSeguradora`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `veiculo`
--

CREATE TABLE `veiculo` (
  `Placa` varchar(7) NOT NULL,
  `Número Chassis` varchar(17) NOT NULL,
  `Número Motor` varchar(9) NOT NULL,
  `Tipo Veiculo` varchar(2) NOT NULL,
  `Cor Veiculo` varchar(45) NOT NULL,
  `Grupo Veiculo` varchar(45) NOT NULL,
  `KM Total` float NOT NULL,
  `KM_Medio_Dia` float NOT NULL,
  `CNPJ_Filial` varchar(14) NOT NULL,
  `idSeguradora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `veiculo`
--

INSERT INTO `veiculo` (`Placa`, `Número Chassis`, `Número Motor`, `Tipo Veiculo`, `Cor Veiculo`, `Grupo Veiculo`, `KM Total`, `KM_Medio_Dia`, `CNPJ_Filial`, `idSeguradora`) VALUES
('ABC1234', '12345678901234567', '987654321', 'G4', 'Preto', 'SUV', 5000, 50, '12345678901234', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aluguel`
--
ALTER TABLE `aluguel`
  ADD PRIMARY KEY (`idAluguel`),
  ADD UNIQUE KEY `fk_info_Indicado` (`Motorista_CPF`,`Numero_CNH`,`idCliente`),
  ADD UNIQUE KEY `Veiculo_Placa_UNIQUE` (`Veiculo_Placa`),
  ADD UNIQUE KEY `idAluguel_UNIQUE` (`idAluguel`),
  ADD KEY `fk_Filial_Destino` (`Entrega_CNPJ`);

--
-- Indexes for table `automóvel`
--
ALTER TABLE `automóvel`
  ADD PRIMARY KEY (`Veiculo_Placa`);

--
-- Indexes for table `camioneta_carga`
--
ALTER TABLE `camioneta_carga`
  ADD PRIMARY KEY (`Veiculo_Placa`);

--
-- Indexes for table `camioneta_pass`
--
ALTER TABLE `camioneta_pass`
  ADD PRIMARY KEY (`Veiculo_Placa`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `idCliente_UNIQUE` (`idCliente`);

--
-- Indexes for table `cliente_indica_motorista`
--
ALTER TABLE `cliente_indica_motorista`
  ADD PRIMARY KEY (`idCliente`,`Motorista_CPF`,`Numero_CNH`),
  ADD KEY `fk_dadosMotorista` (`Motorista_CPF`,`Numero_CNH`);

--
-- Indexes for table `filial`
--
ALTER TABLE `filial`
  ADD PRIMARY KEY (`CNPJ_Filial`),
  ADD UNIQUE KEY `CNPJ_Filial_UNIQUE` (`CNPJ_Filial`),
  ADD UNIQUE KEY `Endereço_UNIQUE` (`Endereço`);

--
-- Indexes for table `motorista`
--
ALTER TABLE `motorista`
  ADD PRIMARY KEY (`Motorista_CPF`,`Numero_CNH`),
  ADD UNIQUE KEY `Número CNH_UNIQUE` (`Numero_CNH`),
  ADD KEY `fk_Motorista_CPF` (`Motorista_CPF`);

--
-- Indexes for table `passageiro`
--
ALTER TABLE `passageiro`
  ADD PRIMARY KEY (`Veiculo_Placa`);

--
-- Indexes for table `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD PRIMARY KEY (`Cliente_idCliente`),
  ADD UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  ADD KEY `fk_idCliente` (`Cliente_idCliente`);

--
-- Indexes for table `pessoa_juridica`
--
ALTER TABLE `pessoa_juridica`
  ADD PRIMARY KEY (`Cliente_idCliente`,`CNPJ`),
  ADD UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`),
  ADD UNIQUE KEY `Inscricao_Estadual_UNIQUE` (`Inscricao_Estadual`);

--
-- Indexes for table `revisão`
--
ALTER TABLE `revisão`
  ADD PRIMARY KEY (`Veiculo_Placa`,`Data_e_hora`),
  ADD UNIQUE KEY `Data_e_hora_UNIQUE` (`Data_e_hora`),
  ADD KEY `fk_Revisão_Veiculo1_idx` (`Veiculo_Placa`);

--
-- Indexes for table `seguradora`
--
ALTER TABLE `seguradora`
  ADD PRIMARY KEY (`idSeguradora`);

--
-- Indexes for table `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`Placa`),
  ADD UNIQUE KEY `Placa_UNIQUE` (`Placa`),
  ADD UNIQUE KEY `Número Chassis_UNIQUE` (`Número Chassis`),
  ADD UNIQUE KEY `Número Motor_UNIQUE` (`Número Motor`),
  ADD KEY `fk_CNPJ_Filial` (`CNPJ_Filial`),
  ADD KEY `fk_idSeguradora` (`idSeguradora`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aluguel`
--
ALTER TABLE `aluguel`
  ADD CONSTRAINT `fk_Filial_Destino` FOREIGN KEY (`Entrega_CNPJ`) REFERENCES `filial` (`CNPJ_Filial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Info_Indicado` FOREIGN KEY (`Motorista_CPF`,`Numero_CNH`,`idCliente`) REFERENCES `cliente_indica_motorista` (`Motorista_CPF`, `Numero_CNH`, `idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Info_Veiculo` FOREIGN KEY (`Veiculo_Placa`) REFERENCES `veiculo` (`Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `automóvel`
--
ALTER TABLE `automóvel`
  ADD CONSTRAINT `fk_Automóvel_Passageiro1` FOREIGN KEY (`Veiculo_Placa`) REFERENCES `passageiro` (`Veiculo_Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `camioneta_carga`
--
ALTER TABLE `camioneta_carga`
  ADD CONSTRAINT `fk_Camioneta_Carga_Veiculo1` FOREIGN KEY (`Veiculo_Placa`) REFERENCES `veiculo` (`Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `camioneta_pass`
--
ALTER TABLE `camioneta_pass`
  ADD CONSTRAINT `fk_Camioneta_Pass_Passageiro1` FOREIGN KEY (`Veiculo_Placa`) REFERENCES `passageiro` (`Veiculo_Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cliente_indica_motorista`
--
ALTER TABLE `cliente_indica_motorista`
  ADD CONSTRAINT `fk_dadosMotorista` FOREIGN KEY (`Motorista_CPF`,`Numero_CNH`) REFERENCES `motorista` (`Motorista_CPF`, `Numero_CNH`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `motorista`
--
ALTER TABLE `motorista`
  ADD CONSTRAINT `fk_Motorista_Pessoa_Fisica1` FOREIGN KEY (`Motorista_CPF`) REFERENCES `pessoa_fisica` (`CPF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `passageiro`
--
ALTER TABLE `passageiro`
  ADD CONSTRAINT `fk_Passageiro_Veiculo1` FOREIGN KEY (`Veiculo_Placa`) REFERENCES `veiculo` (`Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD CONSTRAINT `fk_Pessoa Fisica_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pessoa_juridica`
--
ALTER TABLE `pessoa_juridica`
  ADD CONSTRAINT `fk_Pessoa Juridica_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `revisão`
--
ALTER TABLE `revisão`
  ADD CONSTRAINT `fk_Revisão_Veiculo1` FOREIGN KEY (`Veiculo_Placa`) REFERENCES `veiculo` (`Placa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `fk_Veiculo_Filial` FOREIGN KEY (`CNPJ_Filial`) REFERENCES `filial` (`CNPJ_Filial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Veiculo_Seguradora` FOREIGN KEY (`idSeguradora`) REFERENCES `seguradora` (`idSeguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
