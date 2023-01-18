-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 19 jan. 2023 à 00:11
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `système scolaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `activités`
--

CREATE TABLE `activités` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Description` text DEFAULT NULL,
  `Professeur_responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `activités`
--

INSERT INTO `activités` (`ID`, `Nom`, `Description`, `Professeur_responsable`) VALUES
(200, 'Jeux d\'échecs ', 'Initiation aux jeux d\'échecs', 10),
(301, 'Yoga', 'Yoga et travaille sur la respiration ', 20),
(402, 'Informatique débutant', 'Initiation à la programmation', 40),
(500, 'Sport', 'Match de volley pour débutant', 30);

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

CREATE TABLE `inscriptions` (
  `ID` int(11) NOT NULL,
  `Élève` int(11) NOT NULL,
  `Activité` int(11) NOT NULL,
  `Statut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `inscriptions`
--

INSERT INTO `inscriptions` (`ID`, `Élève`, `Activité`, `Statut`) VALUES
(2, 2, 402, 'Refuser'),
(3, 3, 301, 'Accepter'),
(4, 4, 500, 'Accepter');

-- --------------------------------------------------------

--
-- Structure de la table `professeurs`
--

CREATE TABLE `professeurs` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prénom` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `professeurs`
--

INSERT INTO `professeurs` (`ID`, `Nom`, `Prénom`, `Email`) VALUES
(10, 'Dupont', 'Louise', 'louise-dupont@gmail.com'),
(20, 'Cha', 'Latif', 'cha-latif@gmail.com'),
(30, 'Farou', 'Sully', 'farou_sully@hotmail.com'),
(40, 'Janine', 'Suez', 'suez12janine@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `élèves`
--

CREATE TABLE `élèves` (
  `ID` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prénom` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Classe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `élèves`
--

INSERT INTO `élèves` (`ID`, `Nom`, `Prénom`, `Email`, `Classe`) VALUES
(1, 'Remi', 'Nanick', 'nanick-remi@gmail.com', '3eme002'),
(2, 'Nami', 'Nadine', 'nadine123@gmail.com', '5eme'),
(3, 'Asma', 'Mezzai', 'asmi23@gmail.com', '3eme'),
(4, 'Jani', 'Isa', 'latif-cha@gmail.fr', '6eme'),
(5, 'Dali', 'Molar', 'molar-dali@gmail.com', '3eme');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activités`
--
ALTER TABLE `activités`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Professeur_responsable` (`Professeur_responsable`);

--
-- Index pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Élève` (`Élève`),
  ADD KEY `Activité` (`Activité`);

--
-- Index pour la table `professeurs`
--
ALTER TABLE `professeurs`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `élèves`
--
ALTER TABLE `élèves`
  ADD PRIMARY KEY (`ID`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activités`
--
ALTER TABLE `activités`
  ADD CONSTRAINT `activités_ibfk_1` FOREIGN KEY (`Professeur_responsable`) REFERENCES `professeurs` (`ID`);

--
-- Contraintes pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD CONSTRAINT `inscriptions_ibfk_1` FOREIGN KEY (`Élève`) REFERENCES `élèves` (`ID`),
  ADD CONSTRAINT `inscriptions_ibfk_2` FOREIGN KEY (`Activité`) REFERENCES `activités` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
