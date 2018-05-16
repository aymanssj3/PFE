-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 16 mai 2018 à 16:14
-- Version du serveur :  10.1.32-MariaDB
-- Version de PHP :  7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `atos2`
--

-- --------------------------------------------------------

--
-- Structure de la table `agenda`
--

CREATE TABLE `agenda` (
  `IDAgenda` int(5) NOT NULL,
  `IDvisite` int(4) NOT NULL,
  `Nom visite` varchar(50) NOT NULL,
  `Jour` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `choix`
--

CREATE TABLE `choix` (
  `IDChoix` int(11) NOT NULL,
  `Choix` varchar(100) NOT NULL,
  `IDquestion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `event`
--

CREATE TABLE `event` (
  `IDevent` int(5) NOT NULL,
  `IDagenda` int(4) NOT NULL,
  `IDIntervenant` varchar(50) NOT NULL,
  `Nomevent` varchar(100) NOT NULL,
  `heuredebut` varchar(5) NOT NULL,
  `heurefin` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fonctionnality`
--

CREATE TABLE `fonctionnality` (
  `IDFonct` int(2) NOT NULL,
  `Nomfonction` varchar(50) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `process`
--

CREATE TABLE `process` (
  `IDProcess` int(11) NOT NULL,
  `NomProcess` varchar(100) NOT NULL,
  `NumProcess` int(11) NOT NULL,
  `ISActif` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `IDquestion` int(4) NOT NULL,
  `IDquestionnaire` int(11) NOT NULL,
  `Question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `IDquestionnaire` int(3) NOT NULL,
  `Nomqst` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `IDRole` int(1) NOT NULL,
  `NomRole` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `userfonct`
--

CREATE TABLE `userfonct` (
  `IDFonct` int(2) NOT NULL,
  `IDuser` int(4) NOT NULL,
  `Actif` tinyint(1) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `userrole`
--

CREATE TABLE `userrole` (
  `IDRole` int(11) NOT NULL,
  `IDUser` int(11) NOT NULL,
  `Role` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `IDUser` int(4) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  `Pasword` varchar(50) NOT NULL,
  `Photo` text NOT NULL,
  `QRCodeImg` text NOT NULL,
  `Details` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `uservisite`
--

CREATE TABLE `uservisite` (
  `IDuser` int(11) NOT NULL,
  `IDvisite` int(11) NOT NULL,
  `Role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `visite`
--

CREATE TABLE `visite` (
  `IDvisite` int(11) NOT NULL,
  `NomVisite` varchar(50) NOT NULL,
  `de` double NOT NULL,
  `A` double NOT NULL,
  `IDquestionnaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `visiteproc`
--

CREATE TABLE `visiteproc` (
  `IDProcess` int(11) NOT NULL,
  `IDvisite` int(11) NOT NULL,
  `Enabled` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`IDAgenda`),
  ADD KEY `IDvisite` (`IDvisite`);

--
-- Index pour la table `choix`
--
ALTER TABLE `choix`
  ADD PRIMARY KEY (`IDChoix`),
  ADD KEY `IDquestion` (`IDquestion`);

--
-- Index pour la table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`IDevent`),
  ADD KEY `IDagenda` (`IDagenda`);

--
-- Index pour la table `fonctionnality`
--
ALTER TABLE `fonctionnality`
  ADD PRIMARY KEY (`IDFonct`);

--
-- Index pour la table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`IDProcess`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`IDquestion`),
  ADD KEY `IDquestionnaire` (`IDquestionnaire`);

--
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`IDquestionnaire`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`IDRole`);

--
-- Index pour la table `userfonct`
--
ALTER TABLE `userfonct`
  ADD PRIMARY KEY (`IDFonct`,`IDuser`),
  ADD KEY `IDuser` (`IDuser`);

--
-- Index pour la table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`IDRole`,`IDUser`),
  ADD KEY `IDUser` (`IDUser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IDUser`);

--
-- Index pour la table `uservisite`
--
ALTER TABLE `uservisite`
  ADD PRIMARY KEY (`IDuser`,`IDvisite`),
  ADD KEY `IDvisite` (`IDvisite`);

--
-- Index pour la table `visite`
--
ALTER TABLE `visite`
  ADD PRIMARY KEY (`IDvisite`),
  ADD KEY `IDquestionnaire` (`IDquestionnaire`);

--
-- Index pour la table `visiteproc`
--
ALTER TABLE `visiteproc`
  ADD PRIMARY KEY (`IDProcess`,`IDvisite`),
  ADD KEY `IDvisite` (`IDvisite`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `IDAgenda` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `choix`
--
ALTER TABLE `choix`
  MODIFY `IDChoix` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `event`
--
ALTER TABLE `event`
  MODIFY `IDevent` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fonctionnality`
--
ALTER TABLE `fonctionnality`
  MODIFY `IDFonct` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `process`
--
ALTER TABLE `process`
  MODIFY `IDProcess` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `IDquestion` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `IDquestionnaire` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `IDRole` int(1) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `IDUser` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `visite`
--
ALTER TABLE `visite`
  MODIFY `IDvisite` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`IDvisite`) REFERENCES `visite` (`IDvisite`);

--
-- Contraintes pour la table `choix`
--
ALTER TABLE `choix`
  ADD CONSTRAINT `choix_ibfk_1` FOREIGN KEY (`IDquestion`) REFERENCES `question` (`IDquestion`);

--
-- Contraintes pour la table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`IDagenda`) REFERENCES `agenda` (`IDAgenda`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`IDquestionnaire`) REFERENCES `questionnaire` (`IDquestionnaire`);

--
-- Contraintes pour la table `userfonct`
--
ALTER TABLE `userfonct`
  ADD CONSTRAINT `userfonct_ibfk_1` FOREIGN KEY (`IDFonct`) REFERENCES `fonctionnality` (`IDFonct`),
  ADD CONSTRAINT `userfonct_ibfk_2` FOREIGN KEY (`IDuser`) REFERENCES `users` (`IDUser`);

--
-- Contraintes pour la table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`IDRole`) REFERENCES `roles` (`IDRole`),
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`IDUser`) REFERENCES `users` (`IDUser`);

--
-- Contraintes pour la table `uservisite`
--
ALTER TABLE `uservisite`
  ADD CONSTRAINT `uservisite_ibfk_1` FOREIGN KEY (`IDuser`) REFERENCES `users` (`IDUser`),
  ADD CONSTRAINT `uservisite_ibfk_2` FOREIGN KEY (`IDvisite`) REFERENCES `visite` (`IDvisite`);

--
-- Contraintes pour la table `visite`
--
ALTER TABLE `visite`
  ADD CONSTRAINT `visite_ibfk_1` FOREIGN KEY (`IDquestionnaire`) REFERENCES `questionnaire` (`IDquestionnaire`);

--
-- Contraintes pour la table `visiteproc`
--
ALTER TABLE `visiteproc`
  ADD CONSTRAINT `visiteproc_ibfk_1` FOREIGN KEY (`IDProcess`) REFERENCES `process` (`IDProcess`),
  ADD CONSTRAINT `visiteproc_ibfk_2` FOREIGN KEY (`IDvisite`) REFERENCES `visite` (`IDvisite`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
