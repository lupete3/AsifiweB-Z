-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Sam 10 Juillet 2021 à 09:14
-- Version du serveur: 5.5.16
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gstock_baraka`
--
CREATE DATABASE `gstock_baraka` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gstock_baraka`;

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
  PRIMARY KEY (`idApprovBoiss`),
  KEY `idBoiss` (`idBoiss`),
  KEY `idFour` (`idFour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `barman`
--

INSERT INTO `barman` (`id_brm`, `brm_name`, `brm_sex`, `brm_add_date`, `brm_phone`, `brm_address`, `mdp_brm`, `idPv`) VALUES
(2, 'Aristote Koko', 'Masculin', '2021-07-09 14:23:43', '0987890984', 'Av Baraka', 'brm1234', 1);

-- --------------------------------------------------------

--
-- Structure de la table `caisse`
--

CREATE TABLE IF NOT EXISTS `caisse` (
  `idCaisse` int(11) NOT NULL AUTO_INCREMENT,
  `montantCaisse` double NOT NULL,
  `seuil` double NOT NULL,
  PRIMARY KEY (`idCaisse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `catboiss`
--

CREATE TABLE IF NOT EXISTS `catboiss` (
  `idCatBoiss` smallint(2) NOT NULL AUTO_INCREMENT,
  `designCatBoiss` varchar(50) NOT NULL,
  PRIMARY KEY (`idCatBoiss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Structure de la table `categorieequip`
--

CREATE TABLE IF NOT EXISTS `categorieequip` (
  `idCatEq` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  PRIMARY KEY (`idCatEq`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  PRIMARY KEY (`idPanier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `pointvente`
--

CREATE TABLE IF NOT EXISTS `pointvente` (
  `idPv` int(11) NOT NULL AUTO_INCREMENT,
  `libPv` varchar(50) NOT NULL,
  PRIMARY KEY (`idPv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
  PRIMARY KEY (`idBoiss`),
  KEY `idCatBoiss` (`idCatBoiss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

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
  PRIMARY KEY (`idSorBoiss`),
  KEY `idBoiss` (`idBoiss`),
  KEY `idPv` (`idPv`),
  KEY `idCom` (`idCom`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `sortiediv`
--

INSERT INTO `sortiediv` (`idSortDiv`, `idDiv`, `poste`, `qteSortDiv`, `ptSortDiv`, `dateSortDiv`) VALUES
(1, 4, 'Restaurant Bar', 2, 8.24, '2020-01-13 06:53:31'),
(2, 14, 'House keeping', 6, 2.94, '2020-01-17 10:59:58'),
(3, 4, 'House keeping', 1, 7.21, '2020-01-17 11:00:05'),
(4, 17, 'House keeping', 1, 10.5, '2020-01-17 11:00:12'),
(5, 17, 'House keeping', 1, 10, '2020-01-17 11:00:17'),
(6, 14, 'House keeping', 2, 2.52, '2020-01-17 11:00:23'),
(7, 10, 'House keeping', 1, 0, '2020-01-18 08:15:54'),
(8, 17, 'House keeping', 3, 8.5, '2020-01-18 08:16:00'),
(9, 14, 'House keeping', 1, 2.31, '2020-01-18 08:16:12'),
(10, 21, 'House keeping', 1, 0, '2020-01-18 08:16:18'),
(11, 13, 'House keeping', 1, 0, '2020-01-18 10:27:40'),
(12, 4, 'Restaurant Bar', 2, 5.15, '2020-01-22 09:27:21'),
(13, 4, 'house_keeping', 1, 4.12, '2020-01-22 09:27:30'),
(14, 17, 'house_keeping', 2, 7.5, '2020-01-22 09:27:42'),
(15, 16, 'house_keeping', 1, 0, '2020-01-22 09:28:10'),
(16, 14, 'house_keeping', 5, 1.26, '2020-01-22 09:28:16'),
(17, 14, 'house_keeping', 5, 0.21, '2021-02-19 06:31:40'),
(18, 17, 'house_keeping', 3, 6, '2021-02-19 06:39:52'),
(19, 23, 'receptionniste', 1, 0, '2021-02-19 07:04:46'),
(20, 1, 'Depot Relais', 2, 15.45, '2021-02-19 07:46:58'),
(21, 30, 'house_keeping', 1, 5, '2021-02-28 08:13:37'),
(22, 9, 'house_keeping', 1, 8.82, '2021-03-06 10:02:25');

-- --------------------------------------------------------

--
-- Structure de la table `stock_init`
--

CREATE TABLE IF NOT EXISTS `stock_init` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateStock` date NOT NULL,
  `idBoiss` int(11) NOT NULL,
  `qnteSt` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `stockdivers`
--

INSERT INTO `stockdivers` (`idDiv`, `qnteDiv`, `designation`, `pu`) VALUES
(1, 15, 'TAKE AWAY', 1.03),
(2, 1, 'PAPIER ALUMINIUM', 12.35),
(3, 0, 'PAPIER FILM', 12.35),
(4, 14, 'PAPIER SERVIETTES', 1.03),
(5, 7, 'PAPIER DE DECOR', 1.47),
(6, 8, 'CURE-DENT', 0.29),
(7, 10, 'PAILLES', 3),
(8, 2, 'ESSUIE ASSIETTE', 1.47),
(9, 3, 'AIR FRESH', 2.94),
(10, 0, 'CREAM A RECURER', 8.53),
(11, 4, 'INSECTICIDES', 3.53),
(12, 16, 'CHAMPOON PETIT FORMA', 0.71),
(13, 0, 'SAVONS LIQUIDE A MAINS', 1.76),
(14, 1, 'SAVON ARIF', 0.21),
(15, 5, 'EPONGE A RECURER', 2.94),
(16, 0, 'LAVE VITRE', 10.29),
(17, 12, 'PAPIER HYGIENIENIQUE', 0.5),
(18, 1, 'POUDRE A LESSIVE', 15),
(19, 0, 'EAU DE JAVEL', 7.5),
(20, 5, 'SAVON LIAUIDE DE VAISSELLE', 2.35),
(21, 1, 'SAVONS MULTI USAGE', 2.35),
(22, 0, 'OMO', 14.71),
(23, 0, 'PAPIER DUPLICATEUR', 6.47),
(24, 0, 'ENCRE CORRECTRICE', 1.06),
(25, 0, 'BROSSE DE TOILETTE', 2.06),
(26, 1, 'TRANSPORT BUJA', 10),
(27, 1, 'TRANSPORT MULONGWE', 10),
(28, 0, 'TORCHONS', 1.07),
(29, 1, 'PAPIER SERVITTES VITRE', 6),
(30, 1, 'BROSS A TOILE D''AREIGNET', 5);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

-- --------------------------------------------------------

--
-- Structure de la table `tablepv`
--

CREATE TABLE IF NOT EXISTS `tablepv` (
  `idTable` int(11) NOT NULL AUTO_INCREMENT,
  `designTable` varchar(10) DEFAULT NULL,
  `zone` varchar(50) NOT NULL,
  PRIMARY KEY (`idTable`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `user_function` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `user_name` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `user_sex` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `user_add_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_phone` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `user_email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `user_address` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `mdp_user` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `user_function`, `user_name`, `user_sex`, `user_add_date`, `user_phone`, `user_email`, `user_address`, `mdp_user`) VALUES
(1, 'Chef_Depot_Relais', 'donatien', 'Masculin', '2019-12-13 23:00:00', '0974042469', NULL, 'Kavinvira', 'cpt1234'),
(3, 'Gerant', 'Jean-Claude', 'FÃ©minin', '2019-12-13 23:00:00', '+243976373602', NULL, 'Kalundu-Uvira', 'eco1234');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `approvboiss`
--
ALTER TABLE `approvboiss`
  ADD CONSTRAINT `approvboiss_ibfk_1` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`),
  ADD CONSTRAINT `approvboiss_ibfk_2` FOREIGN KEY (`idFour`) REFERENCES `four` (`idFour`);

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
-- Contraintes pour la table `prodboiss`
--
ALTER TABLE `prodboiss`
  ADD CONSTRAINT `prodboiss_ibfk_1` FOREIGN KEY (`idCatBoiss`) REFERENCES `catboiss` (`idCatBoiss`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `sortieboiss`
--
ALTER TABLE `sortieboiss`
  ADD CONSTRAINT `sortieboiss_ibfk_1` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`),
  ADD CONSTRAINT `sortieboiss_ibfk_2` FOREIGN KEY (`idPv`) REFERENCES `pointvente` (`idPv`),
  ADD CONSTRAINT `sortieboiss_ibfk_3` FOREIGN KEY (`idCom`) REFERENCES `commande` (`idCom`);

--
-- Contraintes pour la table `sortiediv`
--
ALTER TABLE `sortiediv`
  ADD CONSTRAINT `sortiediv_ibfk_1` FOREIGN KEY (`idDiv`) REFERENCES `stockdivers` (`idDiv`);

--
-- Contraintes pour la table `stockpv`
--
ALTER TABLE `stockpv`
  ADD CONSTRAINT `stockpv_ibfk_1` FOREIGN KEY (`idPv`) REFERENCES `pointvente` (`idPv`),
  ADD CONSTRAINT `stockpv_ibfk_2` FOREIGN KEY (`idBoiss`) REFERENCES `prodboiss` (`idBoiss`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
