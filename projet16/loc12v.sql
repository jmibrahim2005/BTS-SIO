-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 25 nov. 2026 à 09:01
-- Version du serveur : 8.0.44
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `loc12`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int NOT NULL,
  `nom` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `num_permis` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `num_permis`) VALUES
(1, 'Florient', 'Donovan', 100),
(2, 'Alberto', 'Riquet', 200);

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

CREATE TABLE `locations` (
  `num_location` int NOT NULL,
  `date_location` date NOT NULL,
  `id_client` int NOT NULL,
  `immatriculation` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `prix_location` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`num_location`, `date_location`, `id_client`, `immatriculation`, `prix_location`) VALUES
(12, '2026-11-03', 1, '300 TU 300', 150.00),
(13, '2026-11-10', 2, '200 TU 200', 200.00);

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE `reparations` (
  `num_rep` int NOT NULL,
  `date_rep` date NOT NULL,
  `type_panne` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `lieu_rep` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `prix_rep` decimal(10,2) NOT NULL,
  `nbre_jours_rep` int NOT NULL,
  `adresse_mecanicien` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `immatriculation` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reparations`
--

INSERT INTO `reparations` (`num_rep`, `date_rep`, `type_panne`, `lieu_rep`, `prix_rep`, `nbre_jours_rep`, `adresse_mecanicien`, `immatriculation`) VALUES
(1, '2026-11-15', 'Freins', 'Garage JM', 5000.00, 18, '22 Rue Vilgénis, Paris', '300 TU 300'),
(2, '2026-11-20', 'Pneus', 'Garage JM', 120.59, 1, '22 Rue Vilgénis, Paris', '200 TU 200');

-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE `voitures` (
  `immatriculation` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `marque` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `kilometrage` int NOT NULL,
  `date_circulation` date NOT NULL,
  `nbre_portes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `marque`, `kilometrage`, `date_circulation`, `nbre_portes`) VALUES
('200 TU 200', 'bmw', 10000, '2026-11-09', 5),
('300 TU 300', 'mercedes', 20000, '2026-11-10', 3);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`num_location`),
  ADD KEY `id_client` (`id_client`,`immatriculation`),
  ADD KEY `immatriculation` (`immatriculation`);

--
-- Index pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD PRIMARY KEY (`num_rep`),
  ADD KEY `index` (`immatriculation`),
  ADD KEY `immatriculation` (`immatriculation`);

--
-- Index pour la table `voitures`
--
ALTER TABLE `voitures`
  ADD PRIMARY KEY (`immatriculation`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
