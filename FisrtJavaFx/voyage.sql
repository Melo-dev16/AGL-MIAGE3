-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 09 mars 2022 à 11:34
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `voyage`
--

-- --------------------------------------------------------

--
-- Structure de la table `aeroport`
--

CREATE TABLE `aeroport` (
  `ID_AEROPORT` int(11) NOT NULL,
  `NOM_AER` char(35) DEFAULT NULL,
  `VILLE_DESTINATION` char(35) DEFAULT NULL,
  `PAYS_DESTINATION` char(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID_CLIENT` int(11) NOT NULL,
  `NOM_CLI` text DEFAULT NULL,
  `PRENOM_CLI` text DEFAULT NULL,
  `CONTACT` int(11) DEFAULT NULL,
  `EMAIL` char(35) DEFAULT NULL,
  `ADRESSE` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

CREATE TABLE `compagnie` (
  `ID_COMPAGNIE` int(11) NOT NULL,
  `NOM_COMP` char(35) DEFAULT NULL,
  `ADRESSE_COMP` char(35) DEFAULT NULL,
  `CONTACT_COMP` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `ID_RESERVATION` int(11) NOT NULL,
  `ID_TYPEVOL` int(11) NOT NULL,
  `ID_VOL` int(11) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL,
  `STATUT_RESEVATION` char(25) DEFAULT NULL,
  `DATE_RESERVATION` datetime DEFAULT NULL,
  `REGLER_RESERVATION` tinyint(1) DEFAULT NULL,
  `MONTANT_REGLEMENT` float(100,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type_vol`
--

CREATE TABLE `type_vol` (
  `ID_TYPEVOL` int(11) NOT NULL,
  `NOM_TYPE` char(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `ID_VOL` int(11) NOT NULL,
  `ID_COMPAGNIE` int(11) NOT NULL,
  `ID_DEPART` int(11) NOT NULL,
  `ID_ARRIVE` int(11) NOT NULL,
  `DATE_DEPART` date DEFAULT NULL,
  `DATE_ARRIVEE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `aeroport`
--
ALTER TABLE `aeroport`
  ADD PRIMARY KEY (`ID_AEROPORT`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_CLIENT`);

--
-- Index pour la table `compagnie`
--
ALTER TABLE `compagnie`
  ADD PRIMARY KEY (`ID_COMPAGNIE`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ID_RESERVATION`),
  ADD KEY `FK_CONTENIR` (`ID_VOL`),
  ADD KEY `FK_DETENIR` (`ID_TYPEVOL`),
  ADD KEY `FK_EFFECTUE` (`ID_CLIENT`);

--
-- Index pour la table `type_vol`
--
ALTER TABLE `type_vol`
  ADD PRIMARY KEY (`ID_TYPEVOL`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`ID_VOL`),
  ADD KEY `ID_DEPART` (`ID_DEPART`),
  ADD KEY `ID_ARRIVE` (`ID_ARRIVE`),
  ADD KEY `FK_POSSEDER` (`ID_COMPAGNIE`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_CONTENIR` FOREIGN KEY (`ID_VOL`) REFERENCES `vol` (`ID_VOL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DETENIR` FOREIGN KEY (`ID_TYPEVOL`) REFERENCES `type_vol` (`ID_TYPEVOL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EFFECTUE` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `vol`
--
ALTER TABLE `vol`
  ADD CONSTRAINT `FK_ARRIVEE` FOREIGN KEY (`ID_ARRIVE`) REFERENCES `aeroport` (`ID_AEROPORT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_DEPART` FOREIGN KEY (`ID_DEPART`) REFERENCES `aeroport` (`ID_AEROPORT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_POSSEDER` FOREIGN KEY (`ID_COMPAGNIE`) REFERENCES `compagnie` (`ID_COMPAGNIE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
