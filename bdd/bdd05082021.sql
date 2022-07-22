-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Dim 15 Août 2021 à 12:06
-- Version du serveur: 5.5.16
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `sc2vwly2348_asifiwebz`
--
CREATE DATABASE `sc2vwly2348_asifiwebz` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sc2vwly2348_asifiwebz`;

-- --------------------------------------------------------

--
-- Structure de la table `admin_gstock_baraka`
--

CREATE TABLE IF NOT EXISTS `admin_gstock_baraka` (
  `id_admin` int(3) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(150) DEFAULT NULL,
  `user_funct` varchar(50) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `mdp_admin` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `admin_gstock_baraka`
--

INSERT INTO `admin_gstock_baraka` (`id_admin`, `nom_admin`, `user_funct`, `date_creation`, `mdp_admin`) VALUES
(1, 'Placide', 'admin', '2019-12-14', '1234'),
(2, 'Antoine', 'admin', '2019-12-14', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `approvboiss`
--

CREATE TABLE IF NOT EXISTS `approvboiss` (
  `idApprovBoiss` int(11) NOT NULL AUTO_INCREMENT,
  `qnteApprov` int(11) NOT NULL,
  `puApprov` double NOT NULL,
  `ptApprov` double NOT NULL,
  `dateApprov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idBoiss` int(11) NOT NULL,
  `idFour` int(11) NOT NULL,
  `modeAchat` varchar(20) NOT NULL,
  `accompte` double NOT NULL,
  `reste` double NOT NULL,
  `idDepot` int(11) NOT NULL,
  PRIMARY KEY (`idApprovBoiss`),
  KEY `idBoiss` (`idBoiss`),
  KEY `idFour` (`idFour`),
  KEY `idDepot` (`idDepot`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `approvboiss`
--

INSERT INTO `approvboiss` (`idApprovBoiss`, `qnteApprov`, `puApprov`, `ptApprov`, `dateApprov`, `idBoiss`, `idFour`, `modeAchat`, `accompte`, `reste`, `idDepot`) VALUES
(6, 10, 24000, 240000, '2021-08-03 15:00:07', 108, 8, 'Cash', 240000, 0, 1),
(7, 20, 23000, 460000, '2021-08-03 15:11:45', 109, 8, 'Cash', 460000, 0, 2),
(8, 5, 20000, 100000, '2021-08-15 07:29:38', 108, 8, 'Cash', 100000, 0, 1),
(9, 2, 20000, 40000, '2021-08-15 09:47:18', 109, 8, 'Cash', 40000, 0, 2),
(10, 1, 20000, 20000, '2021-08-15 09:49:47', 109, 8, 'Cash', 20000, 0, 2),
(11, 2, 20000, 40000, '2021-08-15 09:56:34', 109, 8, 'Cash', 40000, 0, 2),
(12, 1, 10, 10, '2021-08-15 09:57:23', 109, 8, 'Cash', 10, 0, 2),
(13, 1, 20000, 20000, '2021-08-15 09:58:35', 109, 8, 'Cash', 20000, 0, 2),
(14, 11, 22000, 242000, '2021-08-15 09:59:19', 108, 8, 'Cash', 242000, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `approvboissbuv`
--

CREATE TABLE IF NOT EXISTS `approvboissbuv` (
  `idApprovBoiss` int(11) NOT NULL AUTO_INCREMENT,
  `qnteApprov` int(11) NOT NULL,
  `puApprov` double NOT NULL,
  `ptApprov` double NOT NULL,
  `dateApprov` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idBoiss` int(11) NOT NULL,
  PRIMARY KEY (`idApprovBoiss`),
  KEY `idBoiss` (`idBoiss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `approvboissbuv`
--

INSERT INTO `approvboissbuv` (`idApprovBoiss`, `qnteApprov`, `puApprov`, `ptApprov`, `dateApprov`, `idBoiss`) VALUES
(1, 120, 2500, 300000, '2021-08-15 11:02:43', 109);

-- --------------------------------------------------------

--
-- Structure de la table `approvdiv`
--

CREATE TABLE IF NOT EXISTS `approvdiv` (
  `idApprovDiv` int(11) NOT NULL AUTO_INCREMENT,
  `qnteApprovDiv` int(11) NOT NULL,
  `puApprovDiv` double NOT NULL,
  `ptApprovDiv` double NOT NULL,
  `dateApprovDiv` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idDiv` int(11) NOT NULL,
  `modepaie` varchar(10) NOT NULL,
  `accompte` double NOT NULL,
  `reste` double NOT NULL,
  `idFour` int(11) NOT NULL,
  PRIMARY KEY (`idApprovDiv`),
  KEY `idDiv` (`idDiv`),
  KEY `idFour` (`idFour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `avarieboiss`
--

CREATE TABLE IF NOT EXISTS `avarieboiss` (
  `idBoissAv` int(11) NOT NULL AUTO_INCREMENT,
  `qteBoissAv` double NOT NULL,
  `motif` varchar(255) DEFAULT NULL,
  `dateBoissAv` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postePvBoiss` varchar(255) DEFAULT NULL,
  `idBoiss` int(11) NOT NULL,
  PRIMARY KEY (`idBoissAv`),
  KEY `idBoiss` (`idBoiss`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `avariedivers`
--

CREATE TABLE IF NOT EXISTS `avariedivers` (
  `idDivAvar` int(11) NOT NULL AUTO_INCREMENT,
  `qteDivAvar` int(11) NOT NULL,
  `motifDivAvar` varchar(50) NOT NULL,
  `posteDivAvar` varchar(50) NOT NULL,
  `dateDivAvar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idDiv` int(11) NOT NULL,
  PRIMARY KEY (`idDivAvar`),
  KEY `idDiv` (`idDiv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `barman`
--

CREATE TABLE IF NOT EXISTS `barman` (
  `id_brm` int(11) NOT NULL AUTO_INCREMENT,
  `brm_name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `brm_sex` char(10) CHARACTER SET latin1 DEFAULT NULL,
  `brm_add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `brm_phone` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `brm_address` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `mdp_brm` varchar(10) DEFAULT NULL,
  `idPv` int(11) NOT NULL,
  PRIMARY KEY (`id_brm`),
  KEY `idPv` (`idPv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `barman`
--

INSERT INTO `barman` (`id_brm`, `brm_name`, `brm_sex`, `brm_add_date`, `brm_phone`, `brm_address`, `mdp_brm`, `idPv`) VALUES
(2, 'Aristote ', 'Masculin', '2021-07-15 07:05:39', '0987890984', 'Av Baraka', 'brm1234', 1);

-- --------------------------------------------------------

--
-- Structure de la table `caisse`
--

CREATE TABLE IF NOT EXISTS `caisse` (
  `idCaisse` int(11) NOT NULL AUTO_INCREMENT,
  `montantCaisse` double NOT NULL,
  `seuil` double NOT NULL,
  PRIMARY KEY (`idCaisse`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `caisse`
--

INSERT INTO `caisse` (`idCaisse`, `montantCaisse`, `seuil`) VALUES
(1, 999000, 0);

-- --------------------------------------------------------

--
-- Structure de la table `catboiss`
--

CREATE TABLE IF NOT EXISTS `catboiss` (
  `idCatBoiss` smallint(2) NOT NULL AUTO_INCREMENT,
  `designCatBoiss` varchar(50) NOT NULL,
  PRIMARY KEY (`idCatBoiss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `catboiss`
--

INSERT INTO `catboiss` (`idCatBoiss`, `designCatBoiss`) VALUES
(1, 'BIERRE'),
(2, 'SUCRES'),
(3, 'EAU'),
(4, 'JUS');

-- --------------------------------------------------------

--
-- Structure de la table `categorieequip`
--

CREATE TABLE IF NOT EXISTS `categorieequip` (
  `idCatEq` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  PRIMARY KEY (`idCatEq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `charges`
--

CREATE TABLE IF NOT EXISTS `charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desgnCat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom_client` varchar(200) DEFAULT NULL,
  `sexe_client` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `etatCivil` varchar(20) DEFAULT NULL,
  `profession` varchar(100) DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  `telClient` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `provenance` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `destination` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `piece` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `numPiece` varchar(100) DEFAULT NULL,
  `lieuDel` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `dateDel` date DEFAULT NULL,
  `residence` varchar(200) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `comdivers`
--

CREATE TABLE IF NOT EXISTS `comdivers` (
  `idComDiv` int(11) NOT NULL AUTO_INCREMENT,
  `qteComDiv` int(11) NOT NULL,
  `dateComDiv` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statutComDiv` varchar(20) NOT NULL,
  `idDiv` int(11) NOT NULL,
  `poste` varchar(60) NOT NULL,
  PRIMARY KEY (`idComDiv`),
  KEY `idDiv` (`idDiv`),
  KEY `id_service` (`poste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `idCom` int(11) NOT NULL AUTO_INCREMENT,
  `qteCom` double NOT NULL,
  `dateCom` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statutCom` varchar(20) DEFAULT NULL,
  `idPv` int(11) NOT NULL,
  `idBoiss` int(11) NOT NULL,
  PRIMARY KEY (`idCom`),
  KEY `idBoiss` (`idBoiss`),
  KEY `idPv` (`idPv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `depensepdv`
--

CREATE TABLE IF NOT EXISTS `depensepdv` (
  `idDep` int(11) NOT NULL AUTO_INCREMENT,
  `montantDp` double NOT NULL,
  `motifDp` varchar(255) NOT NULL,
  `dateDp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `agentDp` varchar(50) NOT NULL,
  PRIMARY KEY (`idDep`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `depenses`
--

CREATE TABLE IF NOT EXISTS `depenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeDepense` varchar(255) NOT NULL,
  `motif` text NOT NULL,
  `montant` double NOT NULL,
  `dateDepense` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `depot`
--

CREATE TABLE IF NOT EXISTS `depot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `depot`
--

INSERT INTO `depot` (`id`, `designation`) VALUES
(1, 'Depot1'),
(2, 'Depot2');

-- --------------------------------------------------------

--
-- Structure de la table `dettefour`
--

CREATE TABLE IF NOT EXISTS `dettefour` (
  `idDetteF` int(11) NOT NULL AUTO_INCREMENT,
  `idFour` int(11) NOT NULL,
  `designProd` varchar(100) NOT NULL,
  `dateDette` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qteDette` int(11) NOT NULL,
  `puDette` double NOT NULL,
  `ptDette` double NOT NULL,
  `modePaieDette` varchar(20) NOT NULL,
  `idOperation` int(11) NOT NULL,
  `diffIndex` varchar(10) NOT NULL,
  `accompte` double NOT NULL,
  `reste` double NOT NULL,
  PRIMARY KEY (`idDetteF`),
  KEY `idFour` (`idFour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `devise`
--

CREATE TABLE IF NOT EXISTS `devise` (
  `idDevise` int(11) NOT NULL AUTO_INCREMENT,
  `devise` varchar(30) NOT NULL,
  `taux` double NOT NULL,
  PRIMARY KEY (`idDevise`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `devise`
--

INSERT INTO `devise` (`idDevise`, `devise`, `taux`) VALUES
(3, 'CDF', 2030);

-- --------------------------------------------------------

--
-- Structure de la table `entreecaisse`
--

CREATE TABLE IF NOT EXISTS `entreecaisse` (
  `idEntreeCaiss` int(11) NOT NULL AUTO_INCREMENT,
  `montantEntree` double NOT NULL,
  `motifEntree` varchar(255) NOT NULL,
  `dateEntree` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idEntreeCaiss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `entreecaisse`
--

INSERT INTO `entreecaisse` (`idEntreeCaiss`, `montantEntree`, `motifEntree`, `dateEntree`) VALUES
(1, 1000000, 'Capital', '2021-07-14 06:38:43');

-- --------------------------------------------------------

--
-- Structure de la table `etatbesoin`
--

CREATE TABLE IF NOT EXISTS `etatbesoin` (
  `idEtat` int(11) NOT NULL AUTO_INCREMENT,
  `article` varchar(150) NOT NULL,
  `qte` double NOT NULL,
  `pu` double NOT NULL,
  `pt` double NOT NULL,
  `stock` double NOT NULL,
  `dateDemande` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `etat` varchar(50) NOT NULL,
  PRIMARY KEY (`idEtat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `four`
--

CREATE TABLE IF NOT EXISTS `four` (
  `idFour` int(11) NOT NULL AUTO_INCREMENT,
  `nomFour` varchar(30) NOT NULL,
  `adresseFour` varchar(30) NOT NULL,
  `telFour` varchar(30) NOT NULL,
  PRIMARY KEY (`idFour`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `four`
--

INSERT INTO `four` (`idFour`, `nomFour`, `adresseFour`, `telFour`) VALUES
(8, 'BRALIMA', 'Bukavu', '0987890380');

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `idMat` int(11) NOT NULL AUTO_INCREMENT,
  `idCatEq` int(11) NOT NULL,
  `designMat` varchar(255) NOT NULL,
  `quantite` double NOT NULL,
  `prixAchat` double NOT NULL,
  `marque` varchar(255) NOT NULL,
  `dateAcqui` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idMat`),
  KEY `idCatEq` (`idCatEq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE IF NOT EXISTS `panier` (
  `idPanier` int(11) NOT NULL AUTO_INCREMENT,
  `datePanier` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `designation` varchar(50) NOT NULL,
  `qtePanier` double NOT NULL,
  `puPanier` double NOT NULL,
  `ptPanier` double NOT NULL,
  `etatPanier` varchar(25) DEFAULT NULL,
  `idTable` int(11) NOT NULL,
  `id_serveur` int(11) NOT NULL,
  `product` char(1) NOT NULL,
  `modePaie` varchar(10) NOT NULL,
  `accompte` double NOT NULL,
  `reste` double NOT NULL,
  `idPv` int(11) NOT NULL,
  `idBoiss` int(11) NOT NULL,
  PRIMARY KEY (`idPanier`),
  KEY `idTable` (`idTable`),
  KEY `id_serveur` (`id_serveur`),
  KEY `idPv` (`idPv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `panier`
--

INSERT INTO `panier` (`idPanier`, `datePanier`, `designation`, `qtePanier`, `puPanier`, `ptPanier`, `etatPanier`, `idTable`, `id_serveur`, `product`, `modePaie`, `accompte`, `reste`, `idPv`, `idBoiss`) VALUES
(5, '2021-08-15 11:09:46', 'PRIMUS', 2, 2500, 5000, 'close', 25, 5, 'B', 'Cash', 0, 0, 1, 109),
(6, '2021-08-15 11:12:43', 'PRIMUS', 1, 2500, 2500, 'close', 25, 5, 'B', 'Cash', 0, 0, 1, 109),
(7, '2021-08-15 11:15:39', 'PRIMUS', 1, 2500, 2500, 'close', 25, 5, 'B', 'Cash', 0, 0, 1, 109),
(8, '2021-08-15 11:16:07', 'PRIMUS', 2, 2500, 5000, 'close', 25, 5, 'B', 'Cash', 0, 0, 1, 109);

-- --------------------------------------------------------

--
-- Structure de la table `panier_dep`
--

CREATE TABLE IF NOT EXISTS `panier_dep` (
  `idPanier` int(11) NOT NULL AUTO_INCREMENT,
  `datePanier` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `designation` varchar(50) NOT NULL,
  `qtePanier` double NOT NULL,
  `puPanier` double NOT NULL,
  `ptPanier` double NOT NULL,
  `etatPanier` varchar(25) DEFAULT NULL,
  `idBoiss` int(11) NOT NULL,
  `idDepot` int(11) NOT NULL,
  PRIMARY KEY (`idPanier`),
  KEY `idDepor` (`idDepot`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Contenu de la table `panier_dep`
--

INSERT INTO `panier_dep` (`idPanier`, `datePanier`, `designation`, `qtePanier`, `puPanier`, `ptPanier`, `etatPanier`, `idBoiss`, `idDepot`) VALUES
(17, '2021-08-10 20:19:06', 'PRIMUS', 1, 24000, 24000, 'close', 108, 1),
(18, '2021-08-10 21:29:49', 'PRIMUS', 2, 24000, 48000, 'close', 108, 1),
(19, '2021-08-10 21:29:58', 'PRIMUS', 1, 24000, 24000, 'close', 108, 1),
(21, '2021-08-15 07:10:04', 'PRIMUS', 1, 24000, 24000, 'close', 108, 1),
(22, '2021-08-15 08:16:00', 'PRIMUS', 1, 24000, 24000, 'close', 108, 1),
(23, '2021-08-15 10:05:59', 'PRIMUS', 2, 24000, 48000, 'close', 109, 2);

-- --------------------------------------------------------

--
-- Structure de la table `pointvente`
--

CREATE TABLE IF NOT EXISTS `pointvente` (
  `idPv` int(11) NOT NULL AUTO_INCREMENT,
  `libPv` varchar(50) NOT NULL,
  PRIMARY KEY (`idPv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `pointvente`
--

INSERT INTO `pointvente` (`idPv`, `libPv`) VALUES
(1, 'Buvette');

-- --------------------------------------------------------

--
-- Structure de la table `prodboiss`
--

CREATE TABLE IF NOT EXISTS `prodboiss` (
  `idBoiss` int(11) NOT NULL AUTO_INCREMENT,
  `designBoiss` varchar(50) NOT NULL,
  `qnteBoiss` double NOT NULL,
  `nbUniteBoiss` double NOT NULL,
  `valUnitBoiss` int(11) NOT NULL,
  `paBoiss` double NOT NULL,
  `puBoiss` double NOT NULL,
  `paCasier` double NOT NULL,
  `pvCasier` double NOT NULL,
  `idCatBoiss` smallint(2) NOT NULL,
  `idDepot` int(11) NOT NULL,
  PRIMARY KEY (`idBoiss`),
  KEY `idCatBoiss` (`idCatBoiss`),
  KEY `idDepot` (`idDepot`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Contenu de la table `prodboiss`
--

INSERT INTO `prodboiss` (`idBoiss`, `designBoiss`, `qnteBoiss`, `nbUniteBoiss`, `valUnitBoiss`, `paBoiss`, `puBoiss`, `paCasier`, `pvCasier`, `idCatBoiss`, `idDepot`) VALUES
(108, 'PRIMUS', 20, 12, 240, 1666.6666666667, 2500, 20000, 24000, 1, 1),
(109, 'PRIMUS', 25, 12, 300, 1666.6666666667, 2500, 20000, 24000, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `serveur`
--

CREATE TABLE IF NOT EXISTS `serveur` (
  `id_serveur` int(11) NOT NULL AUTO_INCREMENT,
  `nom_serveur` varchar(200) DEFAULT NULL,
  `sexe_serveur` char(10) CHARACTER SET latin1 DEFAULT NULL,
  `etatCivil` varchar(20) DEFAULT NULL,
  `telServeur` varchar(50) DEFAULT NULL,
  `adresse` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `piece` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `numPiece` varchar(100) DEFAULT NULL,
  `lieuDel` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `dateDel` date DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_serveur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `serveur`
--

INSERT INTO `serveur` (`id_serveur`, `nom_serveur`, `sexe_serveur`, `etatCivil`, `telServeur`, `adresse`, `piece`, `numPiece`, `lieuDel`, `dateDel`, `photo`) VALUES
(5, 'Alexy', 'Masculin', 'CÃ©libataire', '0998989898', 'Av Baraka', 'Carte d''Ã©lecteur', '909878', 'Baraka', '2021-07-01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sortieboiss`
--

CREATE TABLE IF NOT EXISTS `sortieboiss` (
  `idSorBoiss` int(11) NOT NULL AUTO_INCREMENT,
  `qnteSort` int(11) NOT NULL,
  `dateSort` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idBoiss` int(11) NOT NULL,
  `idPv` int(11) NOT NULL,
  `idCom` int(11) NOT NULL,
  `idDepot` int(11) NOT NULL,
  PRIMARY KEY (`idSorBoiss`),
  KEY `idBoiss` (`idBoiss`),
  KEY `idPv` (`idPv`),
  KEY `idCom` (`idCom`),
  KEY `idDepot` (`idDepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sortiecaisse`
--

CREATE TABLE IF NOT EXISTS `sortiecaisse` (
  `idSortieCaiss` int(11) NOT NULL AUTO_INCREMENT,
  `montantSortie` double NOT NULL,
  `catCharge` varchar(255) NOT NULL,
  `motifSortie` varchar(255) NOT NULL,
  `dateSortie` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `agent` varchar(50) NOT NULL,
  PRIMARY KEY (`idSortieCaiss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `sortiecaisse`
--

INSERT INTO `sortiecaisse` (`idSortieCaiss`, `montantSortie`, `catCharge`, `motifSortie`, `dateSortie`, `agent`) VALUES
(1, 1000, 'Autres Charges', 'Transport gÃ©rant', '2021-07-14 06:43:17', 'Antoine');

-- --------------------------------------------------------

--
-- Structure de la table `sortiediv`
--

CREATE TABLE IF NOT EXISTS `sortiediv` (
  `idSortDiv` int(11) NOT NULL AUTO_INCREMENT,
  `idDiv` int(11) NOT NULL,
  `poste` varchar(60) NOT NULL,
  `qteSortDiv` int(11) NOT NULL,
  `ptSortDiv` double NOT NULL,
  `dateSortDiv` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idSortDiv`),
  KEY `idDiv` (`idDiv`),
  KEY `id_service` (`poste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `stock_init`
--

CREATE TABLE IF NOT EXISTS `stock_init` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateStock` date NOT NULL,
  `idBoiss` int(11) NOT NULL,
  `qnteSt` int(11) NOT NULL,
  `idDepot` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDepot` (`idDepot`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `stock_init`
--

INSERT INTO `stock_init` (`id`, `dateStock`, `idBoiss`, `qnteSt`, `idDepot`) VALUES
(5, '2021-08-03', 108, 0, 1),
(6, '2021-08-03', 109, 0, 2),
(7, '2021-08-09', 108, 10, 1),
(8, '2021-08-10', 108, 10, 1),
(9, '2021-08-15', 108, 6, 1),
(10, '2021-08-15', 109, 20, 2);

-- --------------------------------------------------------

--
-- Structure de la table `stock_init_buv`
--

CREATE TABLE IF NOT EXISTS `stock_init_buv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateStock` date NOT NULL,
  `idBoiss` int(11) NOT NULL,
  `qnteSt` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `stock_init_buv`
--

INSERT INTO `stock_init_buv` (`id`, `dateStock`, `idBoiss`, `qnteSt`) VALUES
(1, '2021-08-15', 109, 0);

-- --------------------------------------------------------

--
-- Structure de la table `stockdivers`
--

CREATE TABLE IF NOT EXISTS `stockdivers` (
  `idDiv` int(11) NOT NULL AUTO_INCREMENT,
  `qnteDiv` int(11) NOT NULL,
  `designation` varchar(60) NOT NULL,
  `pu` double NOT NULL,
  PRIMARY KEY (`idDiv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `stockpv`
--

CREATE TABLE IF NOT EXISTS `stockpv` (
  `idstock` int(11) NOT NULL AUTO_INCREMENT,
  `qtStock` int(11) NOT NULL,
  `prixdevente` double NOT NULL,
  `idPv` int(11) NOT NULL,
  `idBoiss` int(11) NOT NULL,
  PRIMARY KEY (`idstock`),
  KEY `idBoiss` (`idBoiss`),
  KEY `idPV` (`idPv`),
  KEY `idPV_2` (`idPv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `stockpv`
--

INSERT INTO `stockpv` (`idstock`, `qtStock`, `prixdevente`, `idPv`, `idBoiss`) VALUES
(4, 114, 0, 1, 109);

-- --------------------------------------------------------

--
-- Structure de la table `tablepv`
--

CREATE TABLE IF NOT EXISTS `tablepv` (
  `idTable` int(11) NOT NULL AUTO_INCREMENT,
  `designTable` varchar(10) DEFAULT NULL,
  `zone` varchar(50) NOT NULL,
  PRIMARY KEY (`idTable`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Contenu de la table `tablepv`
--

INSERT INTO `tablepv` (`idTable`, `designTable`, `zone`) VALUES
(25, 'T01', 'Buvette');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `idDepot` int(11) NOT NULL,
  `user_function` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `user_name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `user_sex` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `user_add_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_phone` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `user_address` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `mdp_user` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `idDepot` (`idDepot`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `idDepot`, `user_function`, `user_name`, `user_sex`, `user_add_date`, `user_phone`, `user_email`, `user_address`, `mdp_user`) VALUES
(6, 1, 'Gerant', 'Jean-Claude', 'Masculin', '2021-08-03 10:32:06', '0989877676', 'jean@gmail.com', 'Baraka', 'eco1234'),
(7, 1, 'Chef_Depot_Relais', 'Donatien', 'Masculin', '2021-08-03 10:33:17', '0987654320', 'donatien@gmail.com', 'Baraka', '1234'),
(8, 2, 'Chef_Depot_Relais', 'Pascal', 'Masculin', '2021-08-03 10:34:48', '0989098612', NULL, 'baraka', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `ventedepot`
--

CREATE TABLE IF NOT EXISTS `ventedepot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designBoiss` varchar(255) NOT NULL,
  `qteVendu` int(11) NOT NULL,
  `prixVente` double NOT NULL,
  `ptVente` double NOT NULL,
  `beneficeCasier` double NOT NULL,
  `idBoissVend` int(11) NOT NULL,
  `dateVente` date NOT NULL,
  `destination` varchar(50) NOT NULL,
  `idDepot` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDepot` (`idDepot`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `ventedepot`
--

INSERT INTO `ventedepot` (`id`, `designBoiss`, `qteVendu`, `prixVente`, `ptVente`, `beneficeCasier`, `idBoissVend`, `dateVente`, `destination`, `idDepot`) VALUES
(1, 'PRIMUS', 1, 24000, 24000, 4000, 108, '2021-08-10', 'CLIENT D''HONNEUR', 1),
(2, 'PRIMUS', 2, 24000, 48000, 8000, 108, '2021-08-10', 'BUVETTE', 1),
(3, 'PRIMUS', 1, 24000, 24000, 4000, 108, '2021-08-10', 'BUVETTE', 1),
(4, 'PRIMUS', 1, 24000, 24000, 4000, 108, '2021-08-15', '', 1),
(5, 'PRIMUS', 1, 24000, 24000, 4000, 108, '2021-08-15', 'CLIENT D''HONNEUR', 1),
(6, 'PRIMUS', 2, 24000, 48000, 8000, 109, '2021-08-15', 'CLIENT D''HONNEUR', 2);

-- --------------------------------------------------------

--
-- Structure de la table `ventepdv`
--

CREATE TABLE IF NOT EXISTS `ventepdv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designBoiss` varchar(255) NOT NULL,
  `qteVendu` int(11) NOT NULL,
  `prixVente` double NOT NULL,
  `ptVente` double NOT NULL,
  `beneficeBouteille` double NOT NULL,
  `idBoissVend` int(11) NOT NULL,
  `dateVente` date NOT NULL,
  `idPvente` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `ventepdv`
--

INSERT INTO `ventepdv` (`id`, `designBoiss`, `qteVendu`, `prixVente`, `ptVente`, `beneficeBouteille`, `idBoissVend`, `dateVente`, `idPvente`) VALUES
(1, 'PRIMUS', 2, 2500, 5000, 1666.6666666666, 109, '2021-08-15', 1),
(2, 'PRIMUS', 1, 2500, 2500, 833.3333333333, 109, '2021-08-15', 1),
(3, 'PRIMUS', 1, 2500, 2500, 833.3333333333, 109, '2021-08-15', 1),
(4, 'PRIMUS', 2, 2500, 5000, 1666.6666666666, 109, '2021-08-15', 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `approvboiss`
--
ALTER TABLE `approvboiss`
  ADD CONSTRAINT `approvboiss_ibfk_3` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`),
  ADD CONSTRAINT `approvboiss_ibfk_4` FOREIGN KEY (`idFour`) REFERENCES `four` (`idFour`),
  ADD CONSTRAINT `approvboiss_ibfk_5` FOREIGN KEY (`idDepot`) REFERENCES `depot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `approvboissbuv`
--
ALTER TABLE `approvboissbuv`
  ADD CONSTRAINT `approvboissbuv_ibfk_1` FOREIGN KEY (`idBoiss`) REFERENCES `stockpv` (`idBoiss`);

--
-- Contraintes pour la table `approvdiv`
--
ALTER TABLE `approvdiv`
  ADD CONSTRAINT `approvdiv_ibfk_1` FOREIGN KEY (`idDiv`) REFERENCES `stockdivers` (`idDiv`),
  ADD CONSTRAINT `approvdiv_ibfk_2` FOREIGN KEY (`idFour`) REFERENCES `four` (`idFour`);

--
-- Contraintes pour la table `avarieboiss`
--
ALTER TABLE `avarieboiss`
  ADD CONSTRAINT `avarieboiss_ibfk_1` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`);

--
-- Contraintes pour la table `avariedivers`
--
ALTER TABLE `avariedivers`
  ADD CONSTRAINT `avariedivers_ibfk_1` FOREIGN KEY (`idDiv`) REFERENCES `stockdivers` (`idDiv`);

--
-- Contraintes pour la table `barman`
--
ALTER TABLE `barman`
  ADD CONSTRAINT `barman_ibfk_1` FOREIGN KEY (`idPv`) REFERENCES `pointvente` (`idPv`);

--
-- Contraintes pour la table `comdivers`
--
ALTER TABLE `comdivers`
  ADD CONSTRAINT `comdivers_ibfk_1` FOREIGN KEY (`idDiv`) REFERENCES `stockdivers` (`idDiv`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`idPv`) REFERENCES `pointvente` (`idPv`);

--
-- Contraintes pour la table `dettefour`
--
ALTER TABLE `dettefour`
  ADD CONSTRAINT `dettefour_ibfk_1` FOREIGN KEY (`idFour`) REFERENCES `four` (`idFour`);

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `materiel_ibfk_1` FOREIGN KEY (`idCatEq`) REFERENCES `categorieequip` (`idCatEq`);

--
-- Contraintes pour la table `panier`
--
ALTER TABLE `panier`
  ADD CONSTRAINT `panier_ibfk_1` FOREIGN KEY (`idTable`) REFERENCES `tablepv` (`idTable`),
  ADD CONSTRAINT `panier_ibfk_3` FOREIGN KEY (`id_serveur`) REFERENCES `serveur` (`id_serveur`),
  ADD CONSTRAINT `panier_ibfk_4` FOREIGN KEY (`idPv`) REFERENCES `pointvente` (`idPv`);

--
-- Contraintes pour la table `panier_dep`
--
ALTER TABLE `panier_dep`
  ADD CONSTRAINT `panier_dep_ibfk_1` FOREIGN KEY (`idDepot`) REFERENCES `depot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `prodboiss`
--
ALTER TABLE `prodboiss`
  ADD CONSTRAINT `prodboiss_ibfk_1` FOREIGN KEY (`idDepot`) REFERENCES `depot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prodboiss_ibfk_2` FOREIGN KEY (`idCatBoiss`) REFERENCES `catboiss` (`idCatBoiss`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sortieboiss`
--
ALTER TABLE `sortieboiss`
  ADD CONSTRAINT `sortieboiss_ibfk_4` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`),
  ADD CONSTRAINT `sortieboiss_ibfk_5` FOREIGN KEY (`idPv`) REFERENCES `pointvente` (`idPv`),
  ADD CONSTRAINT `sortieboiss_ibfk_6` FOREIGN KEY (`idCom`) REFERENCES `commande` (`idCom`),
  ADD CONSTRAINT `sortieboiss_ibfk_7` FOREIGN KEY (`idDepot`) REFERENCES `depot` (`id`);

--
-- Contraintes pour la table `sortiediv`
--
ALTER TABLE `sortiediv`
  ADD CONSTRAINT `sortiediv_ibfk_1` FOREIGN KEY (`idDiv`) REFERENCES `stockdivers` (`idDiv`);

--
-- Contraintes pour la table `stock_init`
--
ALTER TABLE `stock_init`
  ADD CONSTRAINT `stock_init_ibfk_1` FOREIGN KEY (`idDepot`) REFERENCES `depot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stockpv`
--
ALTER TABLE `stockpv`
  ADD CONSTRAINT `stockpv_ibfk_1` FOREIGN KEY (`idPv`) REFERENCES `pointvente` (`idPv`),
  ADD CONSTRAINT `stockpv_ibfk_2` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idDepot`) REFERENCES `depot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ventedepot`
--
ALTER TABLE `ventedepot`
  ADD CONSTRAINT `ventedepot_ibfk_1` FOREIGN KEY (`idDepot`) REFERENCES `depot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
