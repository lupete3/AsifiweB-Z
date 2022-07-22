-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Jeu 25 Mars 2021 à 16:13
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `approvboiss`
--

INSERT INTO `approvboiss` (`idApprovBoiss`, `qnteApprov`, `puApprov`, `ptApprov`, `dateApprov`, `idBoiss`, `idFour`, `modeAchat`, `accompte`, `reste`) VALUES
(1, 2, 5, 10, '2021-03-03 08:21:06', 28, 1, 'Cash', 10, 0),
(2, 1, 9.4, 9.4, '2020-01-12 14:33:28', 23, 5, 'CrÃ©dit', 9.4, 0),
(3, 6, 12.5, 75, '2020-01-12 14:37:49', 29, 2, 'CrÃ©dit', 12.5, 62.5),
(4, 2, 9.4, 18.8, '2020-01-17 13:03:50', 23, 5, 'CrÃ©dit', 18.8, 0),
(5, 4, 3.52, 14.08, '2020-01-19 18:24:38', 33, 4, 'CrÃ©dit', 14.11, -0.029999999999999),
(6, 1, 9, 9, '2020-01-23 14:57:22', 98, 1, 'Cash', 9, 0),
(7, 4, 3.52, 14.08, '2020-01-23 14:56:20', 33, 1, 'CrÃ©dit', 14.08, 0),
(8, 1, 12, 12, '2020-01-23 14:46:14', 24, 5, 'Cash', 12, 0),
(9, 1, 9, 9, '2020-01-23 14:48:54', 2, 2, 'Cash', 9, 0),
(10, 12, 4, 48, '2021-01-07 17:19:14', 2, 1, 'CrÃ©dit', 25, 23),
(11, 100, 20, 2000, '2021-01-11 19:06:40', 22, 2, 'Cash', 2000, 0),
(12, 10, 20, 200, '2021-01-11 19:07:51', 22, 3, 'Cash', 200, 0),
(13, 50, 900, 45000, '2021-01-11 19:25:06', 23, 5, 'CrÃ©dit', 900, 44100),
(14, 3, 22, 66, '2021-01-28 11:28:40', 2, 5, 'Cash', 66, 0),
(15, 5, 21000, 105000, '2021-03-17 00:15:44', 45, 4, 'Cash', 105000, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `approvboissbuv`
--

INSERT INTO `approvboissbuv` (`idApprovBoiss`, `qnteApprov`, `puApprov`, `ptApprov`, `dateApprov`, `idBoiss`) VALUES
(1, 2, 24, 48, '2021-01-26 12:39:24', 1),
(2, 5, 0, 0, '2021-01-26 12:39:49', 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `approvdiv`
--

INSERT INTO `approvdiv` (`idApprovDiv`, `qnteApprovDiv`, `puApprovDiv`, `ptApprovDiv`, `dateApprovDiv`, `idDiv`, `modepaie`, `accompte`, `reste`, `idFour`) VALUES
(1, 10, 2, 20, '2020-01-13 08:53:07', 4, 'Cash', 20, 0, 1),
(2, 10, 1.6, 16, '2020-01-22 09:58:26', 4, 'CrÃ©dit', 16, 0, 1),
(3, 1, 8, 8, '2020-01-22 09:58:51', 21, 'Cash', 8, 0, 1),
(4, 1, 20, 20, '2020-01-22 09:59:23', 18, 'Cash', 20, 0, 1),
(5, 1, 6, 6, '2020-01-22 10:00:00', 29, 'Cash', 6, 0, 1),
(6, 2, 5, 10, '2020-01-22 10:00:28', 30, 'Cash', 10, 0, 1),
(7, 2, 2000, 4000, '2021-02-19 05:23:25', 1, 'Cash', 4000, 0, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `avarieboiss`
--

INSERT INTO `avarieboiss` (`idBoissAv`, `qteBoissAv`, `motif`, `dateBoissAv`, `postePvBoiss`, `idBoiss`) VALUES
(1, 1, 'Moisie', '2020-01-14 21:05:25', 'Buvette', 23),
(2, 1, 'casse', '2020-01-17 17:58:21', 'Buvette', 24),
(3, 1, 'moisie', '2020-01-18 19:48:48', 'Buvette', 24),
(4, 2, 'Casse', '2021-01-07 15:22:02', 'Gerant', 3);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `avariedivers`
--

INSERT INTO `avariedivers` (`idDivAvar`, `qteDivAvar`, `motifDivAvar`, `posteDivAvar`, `dateDivAvar`, `idDiv`) VALUES
(1, 1, 'EndommagÃ©', 'Gerant', '2021-01-07 15:27:29', 2);

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
  `brm_email` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `brm_address` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `mdp_brm` varchar(10) DEFAULT NULL,
  `idPv` int(11) NOT NULL,
  PRIMARY KEY (`id_brm`),
  KEY `idPv` (`idPv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `barman`
--

INSERT INTO `barman` (`id_brm`, `brm_name`, `brm_sex`, `brm_add_date`, `brm_phone`, `brm_email`, `brm_address`, `mdp_brm`, `idPv`) VALUES
(1, 'aristote', 'Masculin', '2021-01-07 12:19:47', '+243859345678', 'aristote@gmail.com', 'Uvira', 'brm1234', 1),
(2, 'Cibalonza', 'F', '2020-01-18 13:40:38', '+243855760003', 'cibalonza@gmail.com', 'Kavimvira, Uvira', 'ive1998', 1);

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
(1, 2215.1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `catboiss`
--

CREATE TABLE IF NOT EXISTS `catboiss` (
  `idCatBoiss` smallint(2) NOT NULL AUTO_INCREMENT,
  `designCatBoiss` varchar(50) NOT NULL,
  PRIMARY KEY (`idCatBoiss`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `catboiss`
--

INSERT INTO `catboiss` (`idCatBoiss`, `designCatBoiss`) VALUES
(1, 'BIERRES'),
(2, 'SUCRES'),
(3, 'BOISSONS ENERGISSANTES'),
(4, 'EAUX'),
(5, 'JUS FRAIS'),
(6, 'JUS PRESSE'),
(7, 'VINS ROSES'),
(8, 'VINS BLANCS'),
(9, 'VINS ROUGES'),
(10, 'VINS MOUSSEUX'),
(11, 'CHAMPAGNE AVEC ALCOOL'),
(12, 'LIQUEURS'),
(13, 'APPERITIFS'),
(14, 'BOISSONS CHAUDES'),
(15, 'Autre');

-- --------------------------------------------------------

--
-- Structure de la table `categorieequip`
--

CREATE TABLE IF NOT EXISTS `categorieequip` (
  `idCatEq` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  PRIMARY KEY (`idCatEq`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `categorieequip`
--

INSERT INTO `categorieequip` (`idCatEq`, `designation`) VALUES
(1, 'MatÃ©riel Informatique'),
(2, 'MatÃ©riel de bureau');

-- --------------------------------------------------------

--
-- Structure de la table `charges`
--

CREATE TABLE IF NOT EXISTS `charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desgnCat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `charges`
--

INSERT INTO `charges` (`id`, `desgnCat`) VALUES
(1, 'Eau'),
(2, 'Carburant');

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
  `idOrg` int(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  KEY `idOrg` (`idOrg`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id_client`, `nom_client`, `sexe_client`, `etatCivil`, `profession`, `pays`, `telClient`, `email`, `provenance`, `destination`, `piece`, `numPiece`, `lieuDel`, `dateDel`, `residence`, `photo`, `idOrg`) VALUES
(1, 'NSABIMANA MANASSE', 'M', 'MariÃ©', 'PETROLIER', 'Rwanda', '09999999999', 'nsabimana@gmail.com', 'BURUNDI', 'UVIRA', 'Passport', 'PC229527', 'KIGALI', '2015-06-01', 'KIGALI', 'NSABIMANA MANASSE.jpg', 1),
(2, 'KIZITO KABAMBA DIEUDONNE', 'M', 'MariÃ©', 'Liberale', 'Congo_democratique', '', '', 'Bukavu', 'Uvira', 'Permis de conduire', '00035359', 'Kinshasa', '2020-12-15', 'KINSHASA', 'KIZITO KABAMBA DIEUDONNE.jpg', 1),
(3, 'CLIENT DE PASSAGE', 'M', 'CÃ©libataire', 'Ambulant', 'Congo_democratique', '', '', 'Ambulant', 'Ambulant', 'Carte d''Ã©lecteur', '000000', 'Ambulan', '2020-01-04', 'Ambulant', '001.jpg', 1),
(4, 'THOMAS gstock_baraka', 'M', 'CÃ©libataire', 'Agent Laundry', 'Congo_democratique', '0', 'thomas@gmail.com', 'gstock_baraka', 'gstock_baraka', 'Carte d''Ã©lecteur', '1223', 'gstock_baraka', '2018-01-04', 'Congo_democratique', 'thomas.bmp', 6),
(5, 'Directeur G.', 'M', 'CÃ©libataire', 'DG', 'Congo_democratique', '0', 'moussa@gmail.com', 'gstock_baraka', 'gstock_baraka', 'Autre', '12345', 'gstock_baraka', '2018-01-05', 'gstock_baraka', 'DG.bmp', 6),
(6, 'LAMBERT CHAUF', 'M', 'MariÃ©', 'Chauffeur', 'Congo_democratique', '', '', 'gstock_baraka', 'gstock_baraka', 'Autre', '12345', 'gstock_baraka', '2019-01-05', 'gstock_baraka', 'Lambert.bmp', 6),
(7, 'KEVIN CUISINIER', 'M', 'MariÃ©', 'CUISINIER', 'Congo_democratique', '+243845888346', 'omarikevin@yahoo.fr', 'gstock_baraka', 'gstock_baraka', 'Autre', '12345', 'gstock_baraka', '2018-01-05', 'gstock_baraka', 'KEVIN.bmp', 6),
(8, 'OFFRE CHAMBRE', 'F', 'CÃ©libataire', 'OFFRE', 'France', '0855760003', 'G@gmail.com', 'gstock_baraka', 'gstock_baraka', 'Carte d''Ã©lecteur', '02525', 'BUKAVU', '2020-01-03', 'OFFRE', 'Carte.bmp', 6),
(9, 'ADJOR KOKOU', 'M', 'MariÃ©', 'EXPAT ONU', 'Etats_Unis', '', '', 'BARAKA', 'UVIRA', 'Passport', '272406', 'ETATS UNIS', '2018-02-01', 'USA', 'ADJOR KOKOU.jpg', 3),
(10, 'FALL SAMBA', NULL, 'MariÃ©', 'EXPAT ONU', 'Etats_Unis', '1', '', 'BARAKA', 'UVIRA', 'Passport', '272693', 'ETAS UNIS', '2018-02-20', 'SENEGAL', 'FALL SAMBA.jpg', 3),
(11, 'ALPHA LUMANDE', 'M', 'CÃ©libataire', 'IT', 'Congo_democratique', '+243971112080', 'alpha@gmail.com', 'UVIRA', 'gstock_baraka', 'Carte d''Ã©lecteur', '22429747113', 'UVIRA', '2017-07-12', 'UVIRA', 'FOFO_0002.jpg', 1),
(12, 'LIRON REBECCA', 'F', 'CÃ©libataire', 'HUMANITAIRE', 'Etats_Unis', '', '', 'BURUNDI', 'UVIRA', 'Passport', '494020216', 'FRANCE', '2012-05-22', 'ETATS UNIS', 'LIRON REBECCA.jpg', 3),
(13, 'LIRON REBECCA', 'F', 'CÃ©libataire', 'HUMANITAIRE', 'Etats_Unis', '', '', 'BURUNDI', 'UVIRA', 'Passport', '494020216', 'FRANCE', '2012-05-22', 'ETATS UNIS', 'LIRON REBECCA.jpg', 3),
(14, 'MOREIRA TALINI', 'F', 'MariÃ©', 'HUMANITAIRE', 'Etats_Unis', '', '', 'BUKAVU', 'UVIRA', 'Passport', '72635', 'ETATS UNIS', '2019-10-18', 'ETATS UNIS', 'MOREIRA TALINI.jpg', 5),
(15, 'MIKENYE MANEGABE', 'M', 'MariÃ©', 'HUMANITAIRE', 'Congo_democratique', '', '', 'BUKAVU', 'UVIRA', 'Passport', '0437567', 'RDC', '2019-09-20', 'BUKAVU', 'MIKENYE MANEGABE WILLY.jpg', 5),
(16, 'SORO KARNA', 'M', 'MariÃ©', 'HUMANITAIRE', 'Etats_Unis', '', '', 'BUKAVU', 'UVIRA', 'Passport', '246713', 'ETATS UNIS', '2015-10-25', 'ETATS UNIS', 'SORO KARNA.jpg', 5),
(17, 'MADILA TSHIBOLA', 'F', 'CÃ©libataire', 'HUMANITAIRE', 'Congo_democratique', '', '', 'BUKAVU', 'UVIRA', 'Passport', '0059539', 'KINSHASA', '2016-07-17', 'RDC', 'MADILA TSHIBOLA.jpg', 5),
(18, 'MAHESHE MAHI MUGALA', 'M', 'MariÃ©', 'AGENT BRALIMA', 'Congo_democratique', '0', '', 'BUKAVU', 'UVIRA', 'Passport', 'OP0403607', 'KINSHASA', '2018-01-10', 'BUKAVU', 'MAHESHE MAHI MUGALA.jpg', 2),
(19, 'KAKUMBWA FIDO', 'M', 'MariÃ©', 'LIBERALE', 'Congo_democratique', '', '', 'BUKAVU', 'UVIRA', 'Passport', 'OP0225112', 'KINSHASA', '2017-08-23', 'KINSHASA', 'KAKUMBWA MWENELWATA FIDO.jpg', 1),
(20, 'OMAR NASIBU', 'M', 'MariÃ©', 'INFORMATICIEN', 'Congo_democratique', '+243977777994', 'omarnasibu@gmail.com', 'LUBUMBASHI', 'UVIRA', 'Carte d''Ã©lecteur', '225468754', 'BUKAVU', '2017-01-04', 'LUBUMBASHI', 'Omar nas.bmp', 1),
(21, 'IBRAHIMA', 'M', 'MariÃ©', 'HUMANITAIRE', 'Etats_Unis', '', '', 'BUKAVU', 'BARAKA', 'Passport', '273596', 'ETATS UNIS', '2018-04-03', 'ETATS UNIS', 'IBRAHIMA ABDOU.jpg', 3),
(22, 'HCR', 'M', 'DivorcÃ©', 'REFUGE', 'Congo_democratique', '', '', 'UVIRA', 'UVIRA', '', '222', 'UVIRA', '0000-00-00', 'UVIRA', 'hcr.bmp', 3),
(23, 'VICKY LUNDULA', 'M', 'CÃ©libataire', 'CHAUMEUR', 'Republique_Dominicaine', '', '', 'BUKAVU', 'UVIRA', 'Carte d''Ã©lecteur', '22558732171', 'BUKAVU', '2018-12-21', 'BUKAVU', 'VICKY CHANDJO.jpg', 6),
(24, 'SHABANI SOLI', 'M', 'MariÃ©', 'CHAUMEUR', 'Republique_Dominicaine', '', '', 'BUKAVU', 'UVIRA', 'Carte d''Ã©lecteur', '22409736704', 'KIGOMA', '2017-03-15', 'UVIRA', 'SHABANI SOLI.jpg', 6),
(25, 'CHIBALONZA KAFOMERA', 'F', 'CÃ©libataire', 'CHAUMEUR', 'Qatar', '', '', 'UVIRA', 'UVIRA', 'Carte d''Ã©lecteur', '22406533781', 'KATALA', '2017-03-04', 'UVIRA', 'CHIBALONZA KAFOMERA.jpg', 6),
(26, 'BAHATI FABIANA', 'F', 'MariÃ©', 'CHAMEUR', 'Danemark', '', '', 'BUKAVU', 'UVIRA', 'Carte d''Ã©lecteur', '22406526119', 'KATALA', '2017-01-29', 'UVIRA', 'BAHATI FABIANA.jpg', 6),
(27, 'ALPHA MAJALIWA', 'M', 'CÃ©libataire', 'CHAUMEUR', 'Republique_Dominicaine', '', '', 'BUKAVU', 'UVIRA', 'Carte d''Ã©lecteur', '22575971815', 'KADUTU', '2017-03-03', 'BUKAVU', 'ALPHA MAJALIWA.jpg', 6),
(28, 'TERDIEU FRANCK', 'M', 'CÃ©libataire', 'HUMANITAIRE', 'France', '', '', 'FRANCE', 'UVIRA', 'Passport', '19A31330', 'PARIS', '2019-02-04', 'PARIS', 'TERDIEU FRANCK.jpg', 7),
(29, 'DUPRAY EMMANUEL', 'M', 'MariÃ©', 'HUMANITAIRE', 'France', '', '', 'PARIS', 'UVIRA', 'Passport', '18HA304430', 'PARIS', '2018-11-22', 'PARIS', 'DUPRAY EMMANUEL.jpg', 7),
(30, 'FAUSTIN KITOKO', 'M', 'MariÃ©', 'HUMANITAIRE', 'Congo_democratique', '', '', 'BUJUMBURA', 'UVIRA', 'Permis de conduire', 'AA0009513KIN', 'KINSHASA', '2017-01-20', 'UVIRA', 'KITOKO FAUSTIN.jpg', 3),
(31, 'FAUSTIN KITOKO', 'M', 'MariÃ©', 'HUMANITAIRE', 'Congo_democratique', '', '', 'BUJUMBURA', 'UVIRA', 'Permis de conduire', 'AA0009513KIN', 'KINSHASA', '2017-01-20', 'UVIRA', 'KITOKO FAUSTIN.jpg', 3),
(32, 'GENTIL MASHAGIRO', 'M', 'MariÃ©', 'HOTELLIER', 'Congo_democratique', '', '', 'GOMA', 'UVIRA', 'Carte d''Ã©lecteur', '24177437596', 'UVIRA', '2017-02-08', 'GOMA', 'CE Gentil.jpg', 1),
(33, 'RWIZA JASON', 'M', 'MariÃ©', 'INGENIEUR', 'Tanzanie', '0', '', 'TANZANIA', 'UVIRA', 'Passport', 'TAE135073', 'TANZANIE', '2019-07-04', 'TANZANIE', 'RWIZA JASON 20191215_11214909.jpg', 8),
(34, 'HUNT LESTER MITCHELL', 'M', 'MariÃ©', 'HUMANITAIRE', 'Etats_Unis', '', '', 'BUJUMBURA', 'UVIRA', 'Passport', '565786476', 'USA', '2018-04-25', 'USA', 'HUNT LESTER MITCHELL.jpg', 9),
(35, 'DURIEU DU PRADEL ARNAUD', 'M', 'MariÃ©', 'HUMANITAIRE', 'France', '', '', 'GOMA', 'UVIRA', 'Passport', 'C111514', 'FRANCE', '2019-10-03', 'FRANCE', 'DURIEU DU PRADEL ARNAUD.jpg', 5),
(36, 'GIEZENDANNER HARDY ROMAN', 'M', 'CÃ©libataire', 'HUMANITAIRE', 'Suisse', '', '', 'GOMA', 'UVIRA', 'Passport', 'X8773365', 'SUISSE', '2019-01-07', 'SUISSE', 'HARDY ROMAN.jpg', 5),
(37, 'HAGENIMANA PATRICE', 'M', 'CÃ©libataire', 'HUMANITAIRE', 'Rwanda', '', '', 'BUKAVU', 'UVIRA', 'Passport', '557984', 'RWANDA', '2020-01-14', 'BUKAVU', 'HAGENIMANA PATRICE.jpg', 11),
(38, 'MUSABYEMUNGU PASCASIE', 'F', 'MariÃ©', 'HUMANITAIRE', 'Rwanda', '', '', 'BUKAVU', 'UVIRA', 'Passport', '480532', 'RWANDA', '2019-02-14', 'UVIRA', 'MUSABYEMUNGU PASCASIE.jpg', 11),
(39, 'TALLA JEAN', 'M', 'MariÃ©', 'HUMANITAIRE', 'Cameroun', '', '', 'BUKAVU', 'UVIRA', 'Passport', '1042354', 'YAOUNDE', '2019-10-03', 'BUKAVU', 'TALLA JEAN.jpg', 11),
(40, 'JEROMINO ANA PATRICIA', 'F', 'CÃ©libataire', 'HUMANITAIRE', 'Portugal', '', '', 'BARAKA', 'UVIRA', 'Passport', 'SUNB78055', 'UN', '2019-08-05', 'PORTUGAL', 'JERONIMO ESTRADA ANA PATRICIA.jpg', 3),
(41, 'JEAN CLAUDE ILUNGA', 'M', 'MariÃ©', 'HOTELIER', 'Congo_democratique', '', '', 'UVIRA', 'UVIRA', 'Carte d''Ã©lecteur', '22428969156', 'UVIRA', '2017-02-23', 'UVIRA', 'JEAN CLAUDE ILUNGA_0001.jpg', 6),
(42, 'NGOY LEYA', 'M', 'MariÃ©', 'BUKAVU', 'Republique_Tcheque', '', '', 'BUKAVU', 'UVIRA', 'Passport', '0240005', 'KISHASA', '2017-09-26', 'BUKAVU', 'NGOY LEYA.jpg', 12),
(43, 'NGOY LEYA', 'M', 'MariÃ©', 'HUMANITAIRE', 'Congo_democratique', '', '', 'BUKAVU', 'UVIRA', 'Passport', '0240005', 'KISHASA', '2017-09-28', 'BUKAVU', 'NGOY LEYA.jpg', 12),
(44, 'TSHIBUNGU NTUMBA', 'F', 'MariÃ©', 'HUMANITAIRE', 'Congo_democratique', '', '', 'BUKAVU', 'UVIRA', 'Carte d''Ã©lecteur', '20015841850', 'KINTAMBO', '2017-07-26', 'BUKAVU', 'TSHIBUNGU NTUMBA.jpg', 12),
(45, 'PROSSANI USAID', 'M', 'MariÃ©', 'HUMANITAIRE', 'Congo_democratique', '', '', 'BUKAVU', 'UVIRA', 'Passport', '0558496', 'BUKAVU', '2019-11-12', 'BUKAVU', 'TSHIBUNGU NTUMBA.jpg', 12);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Contenu de la table `comdivers`
--

INSERT INTO `comdivers` (`idComDiv`, `qteComDiv`, `dateComDiv`, `statutComDiv`, `idDiv`, `poste`) VALUES
(12, 2, '2020-01-13 06:53:31', 'ValidÃ©', 4, 'Restaurant Bar'),
(13, 6, '2020-01-17 10:59:58', 'ValidÃ©', 14, 'House keeping'),
(14, 1, '2020-01-17 11:00:05', 'ValidÃ©', 4, 'House keeping'),
(15, 1, '2020-01-17 11:00:12', 'ValidÃ©', 17, 'House keeping'),
(18, 1, '2020-01-17 11:00:17', 'ValidÃ©', 17, 'House keeping'),
(19, 2, '2020-01-17 11:00:23', 'ValidÃ©', 14, 'House keeping'),
(20, 1, '2020-01-18 08:15:54', 'ValidÃ©', 10, 'House keeping'),
(21, 3, '2020-01-18 08:16:00', 'ValidÃ©', 17, 'House keeping'),
(22, 1, '2020-01-18 08:16:12', 'ValidÃ©', 14, 'House keeping'),
(23, 1, '2020-01-18 08:16:18', 'ValidÃ©', 21, 'House keeping'),
(24, 1, '2020-01-18 10:27:40', 'ValidÃ©', 13, 'House keeping'),
(25, 2, '2020-01-22 09:27:21', 'ValidÃ©', 4, 'Restaurant Bar'),
(26, 1, '2020-01-22 09:27:30', 'ValidÃ©', 4, 'house_keeping'),
(27, 2, '2020-01-22 09:27:42', 'ValidÃ©', 17, 'house_keeping'),
(29, 1, '2020-01-22 09:28:10', 'ValidÃ©', 16, 'house_keeping'),
(30, 5, '2020-01-22 09:28:16', 'ValidÃ©', 14, 'house_keeping'),
(31, 5, '2021-02-19 06:31:40', 'ValidÃ©', 14, 'house_keeping'),
(32, 3, '2021-02-19 06:39:52', 'ValidÃ©', 17, 'house_keeping'),
(33, 1, '2021-02-28 08:13:37', 'ValidÃ©', 30, 'house_keeping'),
(34, 2, '2020-01-22 15:00:01', 'Encours', 21, 'house_keeping'),
(36, 2, '2020-01-23 12:18:48', 'Encours', 4, 'Restaurant Bar'),
(37, 1, '2021-02-19 07:04:46', 'ValidÃ©', 23, 'receptionniste'),
(38, 9, '2020-01-23 15:08:38', 'Encours', 14, 'house_keeping'),
(39, 3, '2020-01-23 15:08:38', 'Encours', 17, 'house_keeping'),
(40, 2, '2020-01-23 15:08:38', 'Encours', 4, 'house_keeping'),
(41, 1, '2021-03-06 10:02:25', 'ValidÃ©', 9, 'house_keeping'),
(45, 2, '2021-02-19 07:46:58', 'ValidÃ©', 1, 'Depot Relais'),
(47, 2, '2021-03-09 05:11:03', 'encours', 1, 'Buvette');

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

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`idCom`, `qteCom`, `dateCom`, `statutCom`, `idPv`, `idBoiss`) VALUES
(1, 1, '2020-01-04 21:56:39', 'ValidÃ©', 1, 9),
(2, 1, '2020-01-04 21:57:29', 'ValidÃ©', 1, 23),
(3, 1, '2020-01-04 21:57:34', 'ValidÃ©', 1, 98),
(4, 1, '2020-01-04 21:57:39', 'ValidÃ©', 1, 97),
(5, 1, '2020-01-04 21:57:42', 'ValidÃ©', 1, 33),
(6, 1, '2020-01-05 16:53:38', 'ValidÃ©', 1, 23),
(7, 1, '2020-01-05 16:53:46', 'ValidÃ©', 1, 33),
(9, 1, '2020-01-12 14:33:59', 'ValidÃ©', 1, 23),
(10, 1, '2020-01-12 14:10:29', 'ValidÃ©', 1, 33),
(11, 1, '2020-01-12 14:38:25', 'ValidÃ©', 1, 29),
(12, 1, '2020-01-12 14:28:02', 'ValidÃ©', 1, 28),
(15, 1, '2020-01-13 08:04:29', 'ValidÃ©', 1, 10),
(16, 1, '2020-01-13 08:04:47', 'ValidÃ©', 1, 100),
(17, 1, '2020-01-13 08:05:17', 'ValidÃ©', 1, 24),
(18, 1, '2020-01-13 08:05:01', 'ValidÃ©', 1, 28),
(19, 1, '2020-01-13 08:05:10', 'ValidÃ©', 1, 8),
(20, 1, '2020-01-13 08:45:44', 'ValidÃ©', 1, 8),
(24, 2, '2020-01-13 09:05:13', 'ValidÃ©', 1, 33),
(31, 4, '2020-01-14 21:28:06', 'ValidÃ©', 1, 33),
(33, 1, '2020-01-17 13:57:00', 'ValidÃ©', 1, 23),
(34, 1, '2020-01-17 12:59:36', 'ValidÃ©', 1, 33),
(35, 1, '2020-01-17 12:59:28', 'ValidÃ©', 1, 34),
(38, 1, '2020-01-17 12:59:16', 'ValidÃ©', 1, 58),
(40, 2, '2020-01-18 10:14:32', 'ValidÃ©', 1, 33),
(41, 1, '2020-01-23 14:54:15', 'ValidÃ©', 1, 24),
(42, 1, '2020-01-23 14:54:23', 'ValidÃ©', 1, 2),
(45, 2, '2020-01-20 19:59:24', 'ValidÃ©', 1, 33),
(46, 1, '2020-01-21 17:20:27', 'ValidÃ©', 1, 2),
(47, 2, '2020-01-21 17:19:55', 'ValidÃ©', 1, 33),
(48, 1, '2020-01-21 17:20:19', 'ValidÃ©', 1, 23),
(52, 1, '2020-01-22 10:01:28', 'ValidÃ©', 1, 33),
(53, 2, '2020-01-23 15:11:09', 'ValidÃ©', 1, 33),
(55, 1, '2020-01-23 14:54:41', 'ValidÃ©', 1, 33),
(68, 1, '2020-01-23 14:58:13', 'ValidÃ©', 1, 98),
(69, 1, '2020-01-24 06:25:08', 'Encours', 1, 33),
(70, 10, '2021-01-11 19:29:07', 'Encours', 1, 12),
(71, 2, '2021-01-11 19:30:56', 'ValidÃ©', 1, 23),
(72, 10, '2021-01-11 19:40:11', 'ValidÃ©', 1, 22);

-- --------------------------------------------------------

--
-- Structure de la table `creance`
--

CREATE TABLE IF NOT EXISTS `creance` (
  `idCreance` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `montantCreance` double NOT NULL,
  `numFac` varchar(50) NOT NULL,
  PRIMARY KEY (`idCreance`),
  KEY `id_client` (`id_client`)
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `depensepdv`
--

INSERT INTO `depensepdv` (`idDep`, `montantDp`, `motifDp`, `dateDp`, `agentDp`) VALUES
(1, 0, 'o', '2020-01-02 16:13:36', ''),
(2, 2.12, 'Beignets pour le personnel', '2020-01-13 06:29:18', ''),
(3, 1.176, 'ACHAT UNITES RECEPTION', '2020-01-13 07:24:27', ''),
(4, 6.7, 'RATION PERSONNEL', '2020-01-13 07:26:50', ''),
(5, 6.7, 'RATION PERSONNEL', '2020-01-14 06:27:15', ''),
(6, 2.11, 'BEIGNET PERSONNEL', '2020-01-14 06:28:04', ''),
(7, 10, 'PAYEMENT DETTE HUILLE D''OLIVE', '2020-01-16 04:40:13', ''),
(8, 5.8, 'JEAN CLAUDE', '2020-01-16 04:40:59', ''),
(9, 6.7, 'RATION PERSONNEL', '2020-01-16 04:41:34', ''),
(10, 2.1, 'BEGNEIT PERSONNEL', '2020-01-16 04:42:15', ''),
(11, 1.18, 'transport (J.C)', '2020-01-17 20:18:58', 'aristote'),
(12, 1.7, 'JEAN CLAUDE', '2020-01-18 05:08:47', ''),
(13, 0.8, 'ACHAT PAIN', '2020-01-18 05:09:17', ''),
(14, 2.2, 'BEIGNET PERSONNEL', '2020-01-18 05:09:44', ''),
(15, 0.88, 'acha du pain', '2020-01-18 20:25:39', 'Cibalonza'),
(16, 0.8, 'ACHAT PAIN', '2020-01-20 04:54:26', ''),
(17, 0.8, 'ACHAT OEUF', '2020-01-20 04:54:56', ''),
(18, 2.2, 'BEIGNET PERSONNEL', '2020-01-20 04:55:28', ''),
(19, 6.7, 'RATIO PERSONNEL', '2020-01-22 04:39:51', ''),
(20, 1.7, 'UNITES RECEPTION', '2020-01-22 04:40:17', ''),
(21, 2.2, 'BEIGNET PERSONNEL', '2020-01-22 04:40:56', ''),
(22, 0.88, 'Achat pain', '2020-01-22 21:25:32', 'Restaurant Bar'),
(23, 0.29, 'Achat Sachets', '2020-01-23 20:26:09', 'Restaurant Bar'),
(24, 0.5, 'achat sachet pour emballage', '2020-01-24 04:57:42', ''),
(25, 0.8, 'achat pain', '2020-01-24 04:58:59', ''),
(26, 0.2, 'achat sachet vert', '2020-01-24 04:59:33', ''),
(27, 45, 'UNITE', '2021-01-07 17:47:30', 'Buvette'),
(28, 0.71, 'Paie UnitÃ©', '2021-01-08 06:00:22', 'Buvette'),
(29, 1.18, 'UnitÃ©s', '2021-01-22 14:50:50', 'Buvette');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `dettefour`
--

INSERT INTO `dettefour` (`idDetteF`, `idFour`, `designProd`, `dateDette`, `qteDette`, `puDette`, `ptDette`, `modePaieDette`, `idOperation`, `diffIndex`, `accompte`, `reste`) VALUES
(1, 2, 'KING FISH', '2020-01-12 14:37:49', 6, 12.5, 75, 'CrÃ©dit', 3, 'BS', 12.5, 62.5),
(2, 3, 'CITRONS', '2020-01-13 07:04:43', 3, 2.4, 8.16, 'CrÃ©dit', 4, 'SN', 7.2, 0.96),
(3, 3, 'ORANGE', '2020-01-13 07:17:22', 2, 4.1, 6.56, 'CrÃ©dit', 10, 'SN', 4.1, 2.46),
(4, 1, 'JAMBON DE BOEUF', '2020-01-22 09:45:56', 2, 7.5, 11.25, 'CrÃ©dit', 26, 'SN', 7.5, 3.75),
(5, 7, 'HUILE DE COUSINE COOKIE', '2020-01-22 09:47:20', 20, 27, 540, 'CrÃ©dit', 28, 'SN', 27, 513),
(6, 3, 'BANANE GROS MICHEL', '2020-01-22 09:50:34', 10, 0.17, 1.7, 'CrÃ©dit', 31, 'SN', 1.7, 2.2204460492503e-16),
(8, 3, 'TOMATES FRAICHE', '2020-01-22 10:07:43', 42, 0.17, 7.14, 'CrÃ©dit', 38, 'SN', 7.14, 8.8817841970013e-16),
(9, 1, 'AMSTEL BEER', '2021-01-07 17:19:14', 12, 4, 48, 'CrÃ©dit', 10, 'BS', 25, 23),
(10, 5, 'SUCRES PF', '2021-01-11 19:25:07', 50, 900, 45000, 'CrÃ©dit', 13, 'BS', 900, 44100);

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

--
-- Contenu de la table `devise`
--

INSERT INTO `devise` (`idDevise`, `devise`, `taux`) VALUES
(1, 'CDF', 2000),
(2, 'FBU', 2300);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `entreecaisse`
--

INSERT INTO `entreecaisse` (`idEntreeCaiss`, `montantEntree`, `motifEntree`, `dateEntree`) VALUES
(1, 287.94, 'Report du 19/01/2020', '2020-01-20 19:12:17'),
(2, 136.5, 'Vers recept 19/01/2020', '2020-01-20 19:13:59'),
(3, 200, 'ReÃ§u de la banque', '2020-01-20 19:14:38'),
(4, 36, 'vÃ©rs rÃ©cep du 20/01/2020', '2020-01-21 08:34:57'),
(5, 3000, 'RÃ©Ã§u de la Banque', '2020-01-21 16:07:12'),
(6, 653, 'Ver rÃ©cpt du 21/01/2020', '2020-01-22 08:28:40'),
(7, 211.5, 'VÃ©rs rÃ©cep du 22/01/2020', '2020-01-23 09:22:17'),
(8, 689.5, 'vers recept du 23/01/2020', '2020-01-24 06:49:25'),
(9, 10, 'vente depot du 29/01.2021', '2021-01-29 06:39:36'),
(10, 5, 'Ventes journaliÃ¨re', '2021-02-19 06:08:16');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=90 ;

--
-- Contenu de la table `etatbesoin`
--

INSERT INTO `etatbesoin` (`idEtat`, `article`, `qte`, `pu`, `pt`, `stock`, `dateDemande`, `etat`) VALUES
(9, 'SAUSSISSON', 3, 5.29, 15.87, 1.6, '2020-01-23 14:41:59', 'validÃ©'),
(10, 'POULLET', 5, 10.7, 53.5, 0.75, '2020-01-23 14:42:06', 'validÃ©'),
(11, 'POULLET', 5, 5, 25, 0.75, '2020-01-23 14:42:10', 'validÃ©'),
(12, 'TILAPIA 1000g', 3, 8.11, 24.33, 0, '2020-01-23 14:42:19', 'validÃ©'),
(13, 'KUHE 1000g', 3, 8.7, 26.1, 2, '2020-01-18 12:25:12', 'encours'),
(14, 'PASTEQUES', 2, 4.11, 8.22, 7, '2020-01-18 12:25:12', 'encours'),
(15, 'PASTEQUES', 2, 4.11, 8.22, 7, '2020-01-18 12:25:12', 'encours'),
(16, 'AVOCAT', 6, 0.41, 2.46, 14, '2020-01-18 12:25:12', 'encours'),
(17, 'ANANAS', 8, 0.9, 7.2, 4, '2020-01-18 12:25:12', 'encours'),
(18, 'MANGUE', 4, 0.58, 2.32, 0, '2020-01-18 12:25:12', 'encours'),
(19, 'LENGALENGA', 4, 0.58, 2.32, 0, '2020-01-18 12:25:12', 'encours'),
(20, 'SOMBE', 5, 0.58, 2.9, 0, '2020-01-18 12:25:12', 'encours'),
(21, 'EAU KINJU 0.6L', 10, 3.52, 35.2, 0, '2020-01-18 12:25:12', 'encours'),
(22, 'TRANSPORT', 1, 10, 10, 1, '2020-01-18 12:25:12', 'encours'),
(23, 'FILET DE BOEUF', 5, 5.89, 29.45, 3, '2020-01-20 06:32:18', 'encours'),
(24, 'JAMBON DE BOEUF', 3, 5, 15, 0, '2020-01-20 06:32:18', 'encours'),
(25, 'HUILE DE COUSINE COOKIE', 1, 25, 25, 10, '2020-01-20 06:32:18', 'encours'),
(26, 'CAFE DU BURUNDI', 3, 5.5, 16.5, 0, '2020-01-20 06:32:18', 'encours'),
(27, 'CITRONS', 50, 0.23, 11.5, 3.4, '2020-01-20 06:32:18', 'encours'),
(28, 'BANANE GROS MICHEL', 10, 0.17, 1.7, 10, '2020-01-20 06:32:18', 'encours'),
(29, 'OEUFS', 2, 3.82, 7.64, 3, '2020-01-20 06:32:18', 'encours'),
(30, 'SAVON ARIF', 1, 20, 20, 11, '2020-01-20 06:32:18', 'encours'),
(31, 'AVOCAT', 7, 0.41, 2.87, 14, '2020-01-20 06:32:18', 'encours'),
(32, 'ORANGE', 10, 0.35, 3.5, 10, '2020-01-20 06:32:18', 'encours'),
(33, 'MANGUE', 8, 0.58, 4.64, 0, '2020-01-20 06:32:18', 'encours'),
(34, 'PAPIER SERVIETTES', 10, 1.6, 16, 7, '2020-01-20 06:32:18', 'encours'),
(35, 'BLUE BAND', 2, 6, 12, 0, '2020-01-20 06:32:18', 'encours'),
(36, 'BANAME PLANTAIN', 15, 1.17, 17.55, 1.7, '2020-01-20 06:32:18', 'encours'),
(37, 'SAVONS MULTI USAGE', 1, 8, 8, 0, '2020-01-20 06:32:18', 'encours'),
(38, 'POUDRE A LESSIVE', 1, 20, 20, 0, '2020-01-20 06:32:18', 'encours'),
(40, 'TRANSPORT BUJA', 1, 15, 15, 1, '2020-01-20 06:32:18', 'encours'),
(43, 'TRANSPORT MULONGWE', 1, 4, 4, 1, '2020-01-20 06:32:18', 'encours'),
(44, 'TORCHONS', 10, 1.07, 10.7, 0, '2020-01-20 06:32:18', 'encours'),
(45, 'PAPIER SERVITTES VITRE', 1, 6, 6, 0, '2020-01-20 06:32:18', 'encours'),
(46, 'BROSS A TOILE D''AREIGNET', 4, 5, 20, 0, '2020-01-20 06:32:18', 'encours'),
(47, 'AMSTEL BEER', 1, 10.29, 10.29, 1, '2020-01-23 14:42:54', 'validÃ©'),
(48, 'SUCRES GF', 1, 10.76, 10.76, 0, '2020-01-23 14:42:41', 'validÃ©'),
(49, 'VIANDE HACHEE', 3, 9, 27, 0, '2020-01-22 10:13:43', 'wait'),
(50, 'CAFE DU BURUNDI', 2, 5.5, 11, 2, '2020-01-22 10:14:41', 'wait'),
(51, 'MOUTARD', 4, 5.29, 21.16, 0, '2020-01-22 10:18:09', 'wait'),
(52, 'LECTUS', 6, 3.52, 21.12, 0, '2020-01-22 10:30:00', 'wait'),
(53, 'SELERIS', 2, 2.35, 4.7, 0, '2020-01-22 10:30:43', 'wait'),
(54, 'PERSILES', 2, 2.35, 4.7, 0, '2020-01-22 10:31:31', 'wait'),
(55, 'PUMENTS', 1, 3.57, 3.57, 0, '2020-01-22 10:32:50', 'wait'),
(56, 'COURGETTE', 6, 1.5, 9, 0, '2020-01-22 10:34:41', 'wait'),
(57, 'AUBERGINE', 6, 0.5, 3, 0.8, '2020-01-22 10:36:25', 'wait'),
(58, 'POIRREAUX', 1, 3, 3, 0, '2020-01-22 10:37:38', 'wait'),
(59, 'POIVRONS', 4, 3.03, 12.12, 0.5, '2020-01-22 10:38:36', 'wait'),
(60, 'HARICOT VERT', 2, 4, 8, 0, '2020-01-22 10:39:12', 'wait'),
(61, 'HARICOT BLANC', 4, 4, 16, 0, '2020-01-22 10:39:39', 'wait'),
(62, 'MASALA BEEF', 1, 3, 3, 1, '2020-01-22 10:40:30', 'wait'),
(63, 'MASALA FISH', 2, 3, 6, 0, '2020-01-22 10:40:53', 'wait'),
(64, 'MASALA CHIKEN', 2, 3, 6, 0, '2020-01-22 10:41:19', 'wait'),
(65, 'PAPRICA', 1, 5, 5, 0, '2020-01-22 10:41:44', 'wait'),
(66, 'PETIT POIDS', 4, 4, 16, 1, '2020-01-22 10:42:21', 'wait'),
(68, 'SOMBE', 4, 1.47, 5.88, 0, '2020-01-22 10:44:29', 'wait'),
(69, 'LENGALENGA', 4, 1.47, 5.88, 0, '2020-01-22 10:44:50', 'wait'),
(70, 'EAU DE JAVEL', 1, 7.85, 7.85, 0, '2020-01-22 10:45:51', 'wait'),
(71, 'CREAM A RECURER', 2, 4.28, 8.56, 0, '2020-01-22 10:46:45', 'wait'),
(72, 'PAPIER HYGIENIENIQUE', 2, 7.35, 14.7, 15, '2020-01-22 10:47:54', 'wait'),
(73, 'KETCHUP', 2, 3.57, 7.14, 0, '2020-01-22 10:48:34', 'wait'),
(74, 'MAYONAISE', 3, 4, 12, 2, '2020-01-22 10:49:12', 'wait'),
(75, 'FROMAGE', 2, 5.9, 11.8, 0, '2020-01-22 10:49:58', 'wait'),
(76, 'CUBE MAGI', 3, 3.21, 9.63, 0, '2020-01-22 10:50:50', 'wait'),
(77, 'PASTEQUES', 2, 4.11, 8.22, 7, '2020-01-22 11:01:37', 'wait'),
(78, 'SAVON LIAUIDE DE VAISSELLE', 1, 8, 8, 5, '2020-01-22 11:03:24', 'wait'),
(79, 'DONGO DONGO', 2, 2, 4, 0, '2020-01-22 11:07:45', 'wait'),
(80, 'EPINARDS', 3, 2.5, 7.5, 0, '2020-01-22 11:08:06', 'wait'),
(81, 'PAPIER FILM', 1, 14.42, 14.42, 0, '2020-01-22 11:09:47', 'wait'),
(82, 'PAPIER ALUMINIUM', 1, 14.42, 14.42, 1, '2020-01-22 11:10:08', 'wait'),
(84, 'FILLET DE CAPITAINE', 3, 8.21, 24.63, 8, '2020-01-22 11:14:11', 'wait'),
(85, 'FARINE DE FROMENT', 1, 19.5, 19.5, 4, '2020-01-22 11:14:43', 'wait'),
(86, 'TRANSPORT BUJA', 1, 17.5, 17.5, 1, '2020-01-22 11:15:52', 'wait'),
(87, 'TRANSPORT MULONGWE', 1, 4, 4, 1, '2020-01-22 11:16:15', 'wait'),
(88, 'TAKE AWAY', 30, 1.7, 51, 15, '2020-01-22 11:20:39', 'wait'),
(89, 'CHOUX', 2, 1.07, 2.14, 0, '2020-01-22 11:25:27', 'wait');

-- --------------------------------------------------------

--
-- Structure de la table `facturation`
--

CREATE TABLE IF NOT EXISTS `facturation` (
  `idFact` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) DEFAULT NULL,
  `designActivite` varchar(100) NOT NULL,
  `dateFact` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qteFact` int(11) NOT NULL,
  `puFact` double NOT NULL,
  `ptFact` double NOT NULL,
  `modePaieFact` varchar(20) NOT NULL,
  `idOperation` int(11) NOT NULL,
  `diffIndex` varchar(10) NOT NULL,
  `accompte` double NOT NULL,
  `reste` double NOT NULL,
  `type` varchar(30) NOT NULL,
  `montantPaye` double NOT NULL,
  `etatFact` varchar(10) NOT NULL,
  PRIMARY KEY (`idFact`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=284 ;

--
-- Contenu de la table `facturation`
--

INSERT INTO `facturation` (`idFact`, `id_client`, `designActivite`, `dateFact`, `qteFact`, `puFact`, `ptFact`, `modePaieFact`, `idOperation`, `diffIndex`, `accompte`, `reste`, `type`, `montantPaye`, `etatFact`) VALUES
(1, 1, 'Logement (2020-01-02 2020-01-03)', '2020-01-02 15:02:49', 1, 100, 60, 'CrÃ©dit', 1, 'BO', 0, 60, '', 0, ''),
(2, 2, 'Logement (2020-01-04 2020-01-06)', '2020-01-04 14:55:39', 2, 100, 140, 'CrÃ©dit', 2, 'BO', 0, 140, '', 0, ''),
(3, 3, 'Restauration (04-01-2020)', '2020-01-04 22:18:18', 2, 3.5, 3.5, 'CrÃ©dit', 1, 'RE', 3.5, 0, 'EspÃ¨ces', 0, 'close'),
(4, 3, 'Restauration (04-01-2020)', '2020-01-04 22:32:57', 7, 5, 11, 'Cash', 7, 'RE', 11, 0, 'EspÃ¨ces', 0, 'close'),
(5, 3, 'Restauration (04-01-2020)', '2020-01-04 22:38:03', 3, 6, 6, 'Cash', 5, 'RE', 6, 0, 'EspÃ¨ces', 0, 'close'),
(6, 3, 'Restauration (04-01-2020)', '2020-01-04 22:45:31', 3, 9, 9, 'Cash', 10, 'RE', 9, 0, 'EspÃ¨ces', 0, 'close'),
(7, 3, 'Restauration (04-01-2020)', '2020-01-04 22:47:05', 4, 7.5, 10.5, 'CrÃ©dit', 3, 'RE', 10.5, 0, 'EspÃ¨ces', 0, 'close'),
(8, 2, 'Restauration (04-01-2020)', '2020-01-04 22:04:11', 1, 3, 3, 'CrÃ©dit', 6, 'RE', 0, 3, 'CrÃ©dit', 0, ''),
(9, 4, 'Restauration (04-01-2020)', '2020-01-04 23:08:25', 1, 1.5, 1.5, 'CrÃ©dit', 16, 'RE', 0, 1.5, 'CrÃ©dit', 0, 'wait'),
(10, 5, 'Restauration (04-01-2020)', '2020-01-04 23:21:08', 3, 6, 10.5, 'CrÃ©dit', 17, 'RE', 0, 10.5, 'CrÃ©dit', 0, 'wait'),
(11, 6, 'Restauration (04-01-2020)', '2020-01-04 23:22:20', 1, 2, 2, 'CrÃ©dit', 19, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(12, 7, 'Restauration (04-01-2020)', '2020-01-04 23:23:35', 1, 3, 3, 'CrÃ©dit', 20, 'RE', 0, 3, 'CrÃ©dit', 0, 'wait'),
(13, 8, 'Restauration (05-01-2020)', '2020-01-05 06:21:14', 9, 1.5, 13.5, 'CrÃ©dit', 21, 'RE', 0, 13.5, 'CrÃ©dit', 0, 'wait'),
(14, 9, 'Logement (2020-01-05 2020-01-06)', '2020-01-05 08:39:39', 1, 100, 60, 'CrÃ©dit', 3, 'BO', 0, 60, '', 0, ''),
(15, 10, 'Logement (2020-01-05 2020-01-07)', '2020-01-05 12:01:07', 2, 100, 110, 'CrÃ©dit', 4, 'BO', 0, 110, '', 0, ''),
(16, 3, 'Restauration (05-01-2020)', '2020-01-05 18:38:05', 5, 1.5, 7.5, 'CrÃ©dit', 24, 'RE', 7.5, 0, 'EspÃ¨ces', 0, 'close'),
(17, 3, 'Restauration (05-01-2020)', '2020-01-05 18:38:59', 2, 3.5, 3.5, 'CrÃ©dit', 22, 'RE', 3.5, 0, 'EspÃ¨ces', 0, 'close'),
(18, 3, 'Restauration (05-01-2020)', '2020-01-05 19:17:03', 2, 2, 4, 'CrÃ©dit', 25, 'RE', 0, 4, '', 0, ''),
(19, 3, 'Restauration (05-01-2020)', '2020-01-05 19:27:57', 2, 2, 4, 'Cash', 26, 'RE', 4, 0, 'EspÃ¨ces', 0, 'close'),
(20, 3, 'Restauration (05-01-2020)', '2020-01-05 19:46:42', 8, 4.5, 13.5, 'CrÃ©dit', 27, 'RE', 13.5, 0, 'EspÃ¨ces', 0, ''),
(24, 10, 'Restauration (05-01-2020)', '2020-01-05 20:13:47', 1, 1.5, 1.5, 'CrÃ©dit', 31, 'RE', 1.5, 0, 'CrÃ©dit', 0, ''),
(27, 3, 'Restauration (05-01-2020)', '2020-01-05 20:28:45', 1, 8, 8, 'Cash', 33, 'RE', 8, 0, 'EspÃ¨ces', 0, 'close'),
(28, 12, 'Logement (2020-01-09 2020-01-10)', '2020-01-09 11:20:21', 1, 100, 60, 'CrÃ©dit', 5, 'BO', 0, 60, 'CrÃ©dit', 0, ''),
(29, 14, 'Logement (2020-01-09 2020-01-10)', '2020-01-09 12:38:44', 1, 80, 65, 'Cash', 6, 'BO', 65, 0, 'EspÃ¨ces', 65, 'close'),
(30, 15, 'Logement (2020-01-09 2020-01-10)', '2020-01-09 14:32:09', 1, 100, 70, 'CrÃ©dit', 7, 'BO', 0, 70, 'CrÃ©dit', 0, ''),
(31, 16, 'Logement (2020-01-09 2020-01-10)', '2020-01-09 16:28:28', 1, 100, 80, 'CrÃ©dit', 8, 'BO', 0, 80, 'CrÃ©dit', 0, ''),
(32, 17, 'Logement (2020-01-09 2020-01-10)', '2020-01-09 16:37:30', 1, 80, 65, 'CrÃ©dit', 9, 'BO', 0, 65, 'CrÃ©dit', 0, ''),
(33, 18, 'Logement (2020-01-10 2020-01-14)', '2020-01-10 15:59:18', 3, 100, 195, 'CrÃ©dit', 10, 'BO', 0, 195, 'CrÃ©dit', 0, ''),
(34, 4, 'Restauration (11-01-2020)', '2020-01-11 20:16:07', 1, 2, 2, 'CrÃ©dit', 37, 'RE', 0, 2, 'CrÃ©dit', 0, ''),
(35, 6, 'Restauration (11-01-2020)', '2020-01-11 20:17:37', 1, 2, 2, 'CrÃ©dit', 39, 'RE', 0, 2, 'CrÃ©dit', 0, ''),
(36, 3, 'Restauration (11-01-2020)', '2020-01-11 20:54:09', 2, 6.5, 6.5, 'Cash', 54, 'RE', 6.5, 0, 'EspÃ¨ces', 6.5, 'close'),
(37, 18, 'Restauration (11-01-2020)', '2020-01-11 20:57:33', 5, 7, 13, 'CrÃ©dit', 55, 'RE', 0, 13, 'CrÃ©dit', 0, ''),
(38, 3, 'Restauration (11-01-2020)', '2020-01-11 20:59:55', 4, 5.5, 7.5, 'Cash', 52, 'RE', 7.5, 0, 'EspÃ¨ces', 7.5, 'close'),
(39, 3, 'Restauration (11-01-2020)', '2020-01-11 21:00:58', 2, 10, 20, 'Cash', 51, 'RE', 20, 0, 'EspÃ¨ces', 20, 'close'),
(40, 3, 'Restauration (11-01-2020)', '2020-01-11 21:02:07', 3, 46, 46, 'Cash', 48, 'RE', 46, 0, 'EspÃ¨ces', 46, 'close'),
(41, 3, 'Restauration (11-01-2020)', '2020-01-11 21:02:57', 7, 7.5, 13.5, 'Cash', 40, 'RE', 13.5, 0, 'EspÃ¨ces', 13.5, 'close'),
(42, 3, 'Restauration (11-01-2020)', '2020-01-11 21:04:02', 6, 21.5, 24.5, 'Cash', 44, 'RE', 24.5, 0, 'EspÃ¨ces', 24.5, 'close'),
(43, 18, 'Autres services (11-01-2020)', '2020-01-11 21:21:30', 1, 10, 10, 'CrÃ©dit', 1, 'SA', 0, 10, 'CrÃ©dit', 0, ''),
(44, 3, 'Autres services (11-01-2020)', '2020-01-11 21:22:57', 1, 8, 8, 'Cash', 2, 'SA', 8, 0, 'EspÃ¨ces', 8, 'close'),
(45, 3, 'Autres services (11-01-2020)', '2020-01-11 21:24:16', 1, 10, 10, 'Cash', 3, 'SA', 10, 0, 'EspÃ¨ces', 10, 'close'),
(46, 3, 'Restauration (11-01-2020)', '2020-01-11 22:27:53', 2, 1.5, 3, 'Cash', 60, 'RE', 3, 0, 'EspÃ¨ces', 3, 'close'),
(47, 5, 'Restauration (11-01-2020)', '2020-01-11 22:30:43', 1, 3, 3, 'CrÃ©dit', 61, 'RE', 0, 3, 'CrÃ©dit', 0, ''),
(48, 8, 'Restauration (11-01-2020)', '2020-01-11 22:33:04', 7, 1.5, 10.5, 'CrÃ©dit', 62, 'RE', 0, 10.5, 'CrÃ©dit', 0, 'wait'),
(49, 3, 'Restauration (12-01-2020)', '2020-01-12 13:31:01', 7, 10.5, 16.5, 'Cash', 65, 'RE', 16.5, 0, 'EspÃ¨ces', 16.5, 'close'),
(50, 3, 'Restauration (12-01-2020)', '2020-01-12 14:24:48', 2, 1.5, 3, 'Cash', 69, 'RE', 3, 0, 'EspÃ¨ces', 3, 'close'),
(51, 3, 'Autres services (12-01-2020)', '2020-01-12 14:36:56', 1, 10, 10, 'Cash', 4, 'SA', 10, 0, 'EspÃ¨ces', 10, 'close'),
(52, 19, 'Logement (2020-01-12 2020-01-13)', '2020-01-12 14:59:05', 1, 80, 70, 'CrÃ©dit', 11, 'BO', 0, 70, 'CrÃ©dit', 0, ''),
(53, 3, 'Restauration (12-01-2020)', '2020-01-12 16:31:16', 2, 3.5, 3.5, 'Cash', 76, 'RE', 3.5, 0, 'EspÃ¨ces', 3.5, 'close'),
(54, 3, 'Restauration (12-01-2020)', '2020-01-12 16:32:46', 1, 4, 4, 'Cash', 72, 'RE', 4, 0, 'EspÃ¨ces', 4, 'close'),
(55, 3, 'Autres services (12-01-2020)', '2020-01-12 16:33:27', 1, 10, 10, 'Cash', 5, 'SA', 10, 0, 'EspÃ¨ces', 10, 'close'),
(56, 3, 'Restauration (12-01-2020)', '2020-01-12 16:34:27', 3, 12, 14, 'Cash', 70, 'RE', 14, 0, 'EspÃ¨ces', 14, 'close'),
(57, 3, 'Restauration (12-01-2020)', '2020-01-12 16:46:06', 2, 7, 7, 'Cash', 78, 'RE', 7, 0, 'EspÃ¨ces', 7, 'close'),
(58, 18, 'Restauration (12-01-2020)', '2020-01-12 19:10:57', 4, 14, 17, 'Cash', 80, 'RE', 17, 0, 'Mobile money', 17, 'close'),
(59, 19, 'Restauration (12-01-2020)', '2020-01-12 19:13:00', 3, 17, 17, 'CrÃ©dit', 90, 'RE', 0, 17, 'CrÃ©dit', 0, ''),
(60, 5, 'Restauration (12-01-2020)', '2020-01-12 19:57:19', 4, 18, 18, 'CrÃ©dit', 97, 'RE', 0, 18, 'CrÃ©dit', 0, 'wait'),
(61, 3, 'Restauration (12-01-2020)', '2020-01-12 20:09:42', 8, 19, 21, 'Cash', 73, 'RE', 21, 0, 'EspÃ¨ces', 21, 'close'),
(62, 3, 'Restauration (12-01-2020)', '2020-01-12 20:12:56', 7, 28, 34, 'Cash', 82, 'RE', 34, 0, 'EspÃ¨ces', 34, 'close'),
(63, 8, 'Restauration (12-01-2020)', '2020-01-12 20:30:28', 3, 1.5, 3, 'CrÃ©dit', 103, 'RE', 0, 3, 'EspÃ¨ces', 0, 'wait'),
(64, 8, 'Restauration (12-01-2020)', '2020-01-12 20:31:48', 1, 7, 7, 'CrÃ©dit', 102, 'RE', 0, 7, 'CrÃ©dit', 0, 'wait'),
(65, 20, 'Restauration (12-01-2020)', '2020-01-12 20:52:37', 4, 8, 10, 'CrÃ©dit', 105, 'RE', 0, 10, 'CrÃ©dit', 0, 'wait'),
(66, 4, 'Restauration (12-01-2020)', '2020-01-12 22:11:03', 1, 2, 2, 'CrÃ©dit', 108, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(67, 3, 'Restauration (13-01-2020)', '2020-01-13 06:17:04', 4, 6.5, 8.5, 'Cash', 109, 'RE', 8.5, 0, 'EspÃ¨ces', 8.5, 'close'),
(68, 3, 'Restauration (13-01-2020)', '2020-01-13 09:53:58', 1, 2.5, 2.5, 'Cash', 112, 'RE', 2.5, 0, 'EspÃ¨ces', 2.5, 'close'),
(69, 8, 'Restauration (13-01-2020)', '2020-01-13 10:06:21', 1, 2, 2, 'CrÃ©dit', 113, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(70, 3, 'Restauration (13-01-2020)', '2020-01-13 12:24:32', 27, 51.5, 142.5, 'Cash', 114, 'RE', 142.5, 0, 'EspÃ¨ces', 142.5, 'close'),
(71, 8, 'Restauration (13-01-2020)', '2020-01-13 12:28:58', 4, 6.5, 13, 'CrÃ©dit', 120, 'RE', 0, 13, 'CrÃ©dit', 0, 'wait'),
(72, 8, 'Restauration (13-01-2020)', '2020-01-13 12:31:46', 6, 6.5, 19.5, 'CrÃ©dit', 119, 'RE', 0, 19.5, 'CrÃ©dit', 0, 'wait'),
(73, 21, 'Logement (2020-01-13 2020-01-15)', '2020-01-13 17:08:50', 2, 100, 120, 'CrÃ©dit', 12, 'BO', 0, 120, 'EspÃ¨ces', 0, 'wait'),
(74, 20, 'Restauration (13-01-2020)', '2020-01-13 18:59:42', 5, 5, 14, 'CrÃ©dit', 131, 'RE', 0, 14, 'CrÃ©dit', 0, 'wait'),
(75, 8, 'Restauration (13-01-2020)', '2020-01-13 19:20:41', 10, 1.5, 15, 'CrÃ©dit', 133, 'RE', 0, 15, 'CrÃ©dit', 0, 'wait'),
(76, 4, 'Restauration (14-01-2020)', '2020-01-14 09:10:02', 1, 2, 2, 'CrÃ©dit', 134, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(77, 3, 'Restauration (14-01-2020)', '2020-01-14 14:12:32', 3, 7.5, 7.5, 'Cash', 135, 'RE', 7.5, 0, 'EspÃ¨ces', 7.5, 'close'),
(78, 21, 'Restauration (14-01-2020)', '2020-01-14 18:22:27', 3, 19.5, 19.5, 'CrÃ©dit', 138, 'RE', 0, 19.5, 'EspÃ¨ces', 0, 'wait'),
(79, 3, 'Restauration (14-01-2020)', '2020-01-14 20:55:55', 8, 8.5, 17.5, 'Cash', 143, 'RE', 17.5, 0, 'EspÃ¨ces', 17.5, 'close'),
(80, 22, 'Restauration (14-01-2020)', '2020-01-14 21:49:45', 75, 23, 322.5, 'CrÃ©dit', 151, 'RE', 0, 322.5, 'CrÃ©dit', 0, 'wait'),
(81, 8, 'Restauration (15-01-2020)', '2020-01-15 08:47:54', 1, 4.5, 4.5, 'CrÃ©dit', 157, 'RE', 0, 4.5, 'CrÃ©dit', 0, 'wait'),
(82, 8, 'Restauration (15-01-2020)', '2020-01-15 08:50:22', 1, 2, 2, 'CrÃ©dit', 158, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(83, 3, 'Restauration (15-01-2020)', '2020-01-15 09:34:31', 3, 4, 6, 'Cash', 159, 'RE', 6, 0, 'EspÃ¨ces', 6, 'close'),
(84, 3, 'Restauration (15-01-2020)', '2020-01-15 11:41:20', 5, 5, 8.5, 'Cash', 166, 'RE', 8.5, 0, 'EspÃ¨ces', 8.5, 'close'),
(85, 26, 'Restauration (15-01-2020)', '2020-01-15 11:55:27', 2, 5, 5, 'CrÃ©dit', 165, 'RE', 0, 5, 'CrÃ©dit', 0, 'wait'),
(86, 3, 'Restauration (15-01-2020)', '2020-01-15 12:28:40', 14, 15.5, 49, 'Cash', 161, 'RE', 49, 0, 'EspÃ¨ces', 49, 'close'),
(87, 5, 'Restauration (15-01-2020)', '2020-01-15 18:46:38', 2, 2, 2, 'CrÃ©dit', 174, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(88, 27, 'Restauration (15-01-2020)', '2020-01-15 19:35:59', 6, 5, 14, 'CrÃ©dit', 176, 'RE', 0, 14, 'CrÃ©dit', 0, 'wait'),
(89, 3, 'Restauration (15-01-2020)', '2020-01-15 19:48:00', 2, 9, 9, 'Cash', 178, 'RE', 9, 0, 'EspÃ¨ces', 9, 'close'),
(90, 28, 'Logement (2020-01-16 2020-01-22)', '2020-01-16 14:43:42', 6, 100, 300, 'CrÃ©dit', 13, 'BO', 0, 300, '', 0, 'wait'),
(91, 29, 'Logement (2020-01-16 2020-01-22)', '2020-01-16 14:44:52', 6, 100, 300, 'CrÃ©dit', 14, 'BO', 0, 300, 'CrÃ©dit', 0, 'wait'),
(92, 3, 'Restauration (16-01-2020)', '2020-01-16 16:53:38', 2, 3.5, 3.5, 'Cash', 182, 'RE', 3.5, 0, 'EspÃ¨ces', 3.5, 'close'),
(93, 28, 'Restauration (16-01-2020)', '2020-01-16 18:16:38', 11, 16.5, 31, 'CrÃ©dit', 180, 'RE', 0, 31, '', 0, 'wait'),
(94, 3, 'Restauration (16-01-2020)', '2020-01-16 19:30:44', 8, 30.5, 33, 'Cash', 188, 'RE', 33, 0, 'EspÃ¨ces', 33, 'close'),
(95, 5, 'Restauration (16-01-2020)', '2020-01-16 20:05:16', 2, 1.5, 3, 'CrÃ©dit', 195, 'RE', 0, 3, 'CrÃ©dit', 0, 'wait'),
(96, 20, 'Restauration (16-01-2020)', '2020-01-16 20:06:09', 1, 2, 2, 'CrÃ©dit', 197, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(97, 4, 'Restauration (16-01-2020)', '2020-01-16 20:36:14', 1, 2, 2, 'CrÃ©dit', 198, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(98, 3, 'Restauration (17-01-2020)', '2020-01-17 13:02:36', 2, 1.5, 3, 'Cash', 203, 'RE', 3, 0, 'EspÃ¨ces', 3, 'close'),
(99, 8, 'Restauration (17-01-2020)', '2020-01-17 13:05:28', 10, 8, 16, 'CrÃ©dit', 199, 'RE', 0, 16, 'CrÃ©dit', 0, 'wait'),
(100, 3, 'Restauration (17-01-2020)', '2020-01-17 15:13:13', 4, 5, 7, 'Cash', 205, 'RE', 7, 0, 'EspÃ¨ces', 7, 'close'),
(101, 3, 'Restauration (17-01-2020)', '2020-01-17 18:09:27', 2, 2, 4, 'Cash', 216, 'RE', 4, 0, 'EspÃ¨ces', 4, 'close'),
(102, 4, 'Restauration (17-01-2020)', '2020-01-17 19:40:13', 1, 2, 2, 'CrÃ©dit', 225, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(103, 3, 'Restauration (17-01-2020)', '2020-01-17 19:53:54', 8, 17.5, 30, 'Cash', 226, 'RE', 30, 0, 'EspÃ¨ces', 30, 'close'),
(104, 3, 'Restauration (17-01-2020)', '2020-01-17 19:59:41', 11, 24.5, 42.5, 'Cash', 214, 'RE', 42.5, 0, 'EspÃ¨ces', 42.5, 'close'),
(105, 5, 'Restauration (17-01-2020)', '2020-01-17 20:04:38', 5, 16.5, 18, 'CrÃ©dit', 208, 'RE', 0, 18, 'CrÃ©dit', 0, 'wait'),
(106, 6, 'Restauration (18-01-2020)', '2020-01-18 07:44:58', 1, 2, 2, 'CrÃ©dit', 238, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(107, 30, 'Restauration (18-01-2020)', '2020-01-18 12:09:20', 9, 7, 22, 'CrÃ©dit', 247, 'RE', 0, 22, 'CrÃ©dit', 0, 'wait'),
(108, 8, 'Restauration (18-01-2020)', '2020-01-18 12:21:25', 8, 6.5, 13, 'CrÃ©dit', 243, 'RE', 0, 13, 'CrÃ©dit', 0, 'wait'),
(109, 8, 'Restauration (18-01-2020)', '2020-01-18 12:22:45', 8, 6.5, 13, 'CrÃ©dit', 239, 'RE', 0, 13, 'CrÃ©dit', 0, 'wait'),
(110, 3, 'Restauration (18-01-2020)', '2020-01-18 13:50:55', 4, 14.5, 14.5, 'Cash', 250, 'RE', 14.5, 0, 'EspÃ¨ces', 14.5, 'close'),
(111, 28, 'Restauration (18-01-2020)', '2020-01-18 15:26:44', 6, 10.5, 10.5, 'Cash', 254, 'RE', 10.5, 0, 'EspÃ¨ces', 10.5, 'close'),
(112, 3, 'Autres services (18-01-2020)', '2020-01-18 16:41:14', 1, 10, 10, 'Cash', 6, 'SA', 10, 0, 'EspÃ¨ces', 10, 'close'),
(113, 3, 'Restauration (18-01-2020)', '2020-01-18 17:37:37', 1, 2, 2, 'Cash', 276, 'RE', 2, 0, 'EspÃ¨ces', 2, 'close'),
(114, 3, 'Restauration (18-01-2020)', '2020-01-18 17:51:05', 15, 21, 38, 'Cash', 265, 'RE', 38, 0, 'EspÃ¨ces', 38, 'close'),
(115, 3, 'Restauration (18-01-2020)', '2020-01-18 18:22:42', 2, 7, 7, 'Cash', 279, 'RE', 7, 0, 'EspÃ¨ces', 7, 'close'),
(116, 28, 'Restauration (18-01-2020)', '2020-01-18 19:06:46', 4, 23.5, 25, 'Cash', 282, 'RE', 25, 0, 'EspÃ¨ces', 25, 'close'),
(117, 26, 'Restauration (18-01-2020)', '2020-01-18 19:17:00', 10, 43, 43, 'CrÃ©dit', 260, 'RE', 0, 43, 'CrÃ©dit', 0, 'wait'),
(118, 3, 'Restauration (18-01-2020)', '2020-01-18 19:18:36', 4, 5, 10, 'Cash', 288, 'RE', 10, 0, 'EspÃ¨ces', 10, 'close'),
(119, 28, 'Restauration (18-01-2020)', '2020-01-18 19:28:42', 4, 4, 8, 'CrÃ©dit', 291, 'RE', 0, 8, '', 0, 'wait'),
(120, 20, 'Restauration (18-01-2020)', '2020-01-18 20:13:32', 2, 2, 4, 'CrÃ©dit', 293, 'RE', 0, 4, 'CrÃ©dit', 0, 'wait'),
(121, 8, 'Restauration (18-01-2020)', '2020-01-18 20:16:54', 14, 3, 21, 'CrÃ©dit', 294, 'RE', 0, 21, 'CrÃ©dit', 0, 'wait'),
(122, 8, 'Restauration (19-01-2020)', '2020-01-19 10:36:16', 8, 6, 24, 'CrÃ©dit', 299, 'RE', 0, 24, 'CrÃ©dit', 0, 'wait'),
(123, 8, 'Restauration (19-01-2020)', '2020-01-19 10:39:29', 4, 2, 8, 'CrÃ©dit', 301, 'RE', 0, 8, 'CrÃ©dit', 0, 'wait'),
(124, 3, 'Restauration (19-01-2020)', '2020-01-19 10:43:25', 2, 6.5, 6.5, 'Cash', 297, 'RE', 6.5, 0, 'EspÃ¨ces', 6.5, 'close'),
(125, 3, 'Autres services (19-01-2020)', '2020-01-19 13:01:19', 1, 10, 10, 'Cash', 7, 'SA', 10, 0, 'EspÃ¨ces', 10, 'close'),
(126, 3, 'Restauration (19-01-2020)', '2020-01-19 13:15:09', 5, 22.5, 25, 'Cash', 302, 'RE', 25, 0, 'EspÃ¨ces', 25, 'close'),
(127, 3, 'Restauration (19-01-2020)', '2020-01-19 13:54:15', 3, 11.5, 11.5, 'Cash', 303, 'RE', 11.5, 0, 'EspÃ¨ces', 11.5, 'close'),
(128, 3, 'Restauration (19-01-2020)', '2020-01-19 14:30:48', 1, 2, 2, 'Cash', 317, 'RE', 2, 0, 'EspÃ¨ces', 2, 'close'),
(129, 23, 'Restauration (19-01-2020)', '2020-01-19 14:33:20', 1, 3, 3, 'CrÃ©dit', 318, 'RE', 0, 3, 'CrÃ©dit', 0, 'wait'),
(130, 3, 'Restauration (19-01-2020)', '2020-01-19 16:09:20', 11, 13, 23.5, 'Cash', 312, 'RE', 23.5, 0, 'EspÃ¨ces', 23.5, 'close'),
(131, 3, 'Restauration (19-01-2020)', '2020-01-19 16:54:41', 3, 4.5, 7, 'Cash', 308, 'RE', 7, 0, 'EspÃ¨ces', 7, 'close'),
(132, 3, 'Restauration (19-01-2020)', '2020-01-19 17:35:51', 10, 25, 27, 'Cash', 322, 'RE', 27, 0, 'EspÃ¨ces', 27, 'close'),
(133, 3, 'Restauration (19-01-2020)', '2020-01-19 18:00:43', 4, 7.5, 9, 'Cash', 328, 'RE', 9, 0, 'EspÃ¨ces', 9, 'close'),
(134, 24, 'Restauration (19-01-2020)', '2020-01-19 18:16:31', 1, 4, 4, 'CrÃ©dit', 337, 'RE', 0, 4, 'CrÃ©dit', 0, 'wait'),
(135, 20, 'Restauration (19-01-2020)', '2020-01-19 18:25:34', 1, 3, 3, 'CrÃ©dit', 339, 'RE', 0, 3, 'CrÃ©dit', 0, 'wait'),
(136, 24, 'Restauration (19-01-2020)', '2020-01-19 18:27:05', 1, 3, 3, 'CrÃ©dit', 340, 'RE', 0, 3, 'CrÃ©dit', 0, 'wait'),
(137, 3, 'Restauration (19-01-2020)', '2020-01-19 18:38:19', 5, 8.5, 15, 'Cash', 331, 'RE', 15, 0, 'EspÃ¨ces', 15, 'close'),
(138, 5, 'Restauration (19-01-2020)', '2020-01-19 19:54:38', 4, 22.5, 22.5, 'CrÃ©dit', 342, 'RE', 0, 22.5, 'CrÃ©dit', 0, 'wait'),
(139, 5, 'Restauration (19-01-2020)', '2020-01-19 19:55:28', 3, 9, 9, 'CrÃ©dit', 341, 'RE', 0, 9, 'CrÃ©dit', 0, 'wait'),
(140, 5, 'Restauration (19-01-2020)', '2020-01-19 19:56:04', 4, 2, 8, 'CrÃ©dit', 345, 'RE', 0, 8, 'CrÃ©dit', 0, 'wait'),
(142, 5, 'Restauration (19-01-2020)', '2020-01-19 19:59:42', 1, 0, 0, 'Cash', 346, 'RE', 0, 0, 'CrÃ©dit', 0, 'close'),
(143, 3, 'Restaurant Bar (20-01-2020)', '2020-01-20 07:14:35', 2, 6.5, 6.5, 'Cash', 348, 'RE', 6.5, 0, 'EspÃ¨ces', 6.5, 'close'),
(144, 8, 'Restaurant Bar (20-01-2020)', '2020-01-20 07:37:14', 6, 6.5, 19.5, 'CrÃ©dit', 350, 'RE', 0, 19.5, 'CrÃ©dit', 0, 'wait'),
(145, 33, 'Logement (2020-01-20 2020-01-25)', '2020-01-20 10:09:45', 5, 80, 350, 'CrÃ©dit', 16, 'BO', 0, 350, 'CrÃ©dit', 0, 'wait'),
(146, 6, 'Restaurant Bar (20-01-2020)', '2020-01-20 11:17:49', 1, 2, 2, 'CrÃ©dit', 352, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(147, 34, 'Logement (2020-01-20 2020-01-22)', '2020-01-20 14:34:53', 2, 100, 160, 'CrÃ©dit', 17, 'BO', 0, 160, '', 0, 'wait'),
(148, 35, 'Logement (2020-01-20 2020-01-24)', '2020-01-20 14:35:58', 4, 100, 320, 'CrÃ©dit', 18, 'BO', 0, 320, 'EspÃ¨ces', 0, 'wait'),
(149, 36, 'Logement (2020-01-20 2020-01-24)', '2020-01-20 14:36:58', 4, 100, 320, 'CrÃ©dit', 19, 'BO', 0, 320, 'EspÃ¨ces', 0, 'wait'),
(150, 34, 'Restaurant Bar (20-01-2020)', '2020-01-20 18:04:37', 4, 16, 16, 'CrÃ©dit', 361, 'RE', 0, 16, '', 0, 'wait'),
(151, 35, 'Restaurant Bar (20-01-2020)', '2020-01-20 18:15:07', 3, 10, 10, 'CrÃ©dit', 373, 'RE', 0, 10, 'EspÃ¨ces', 0, 'wait'),
(152, 36, 'Restaurant Bar (20-01-2020)', '2020-01-20 18:16:40', 4, 13.5, 13.5, 'CrÃ©dit', 368, 'RE', 0, 13.5, 'EspÃ¨ces', 0, 'wait'),
(153, 28, 'Restaurant Bar (20-01-2020)', '2020-01-20 18:26:50', 11, 30, 32, 'CrÃ©dit', 353, 'RE', 0, 32, '', 0, 'wait'),
(154, 33, 'Restaurant Bar (20-01-2020)', '2020-01-20 18:31:46', 1, 5, 5, 'CrÃ©dit', 357, 'RE', 0, 5, 'CrÃ©dit', 0, 'wait'),
(155, 5, 'Restaurant Bar (20-01-2020)', '2020-01-20 19:39:59', 5, 10.5, 12, 'CrÃ©dit', 380, 'RE', 0, 12, 'CrÃ©dit', 0, 'wait'),
(156, 20, 'Restaurant Bar (20-01-2020)', '2020-01-20 19:41:10', 2, 3, 6, 'CrÃ©dit', 379, 'RE', 0, 6, 'CrÃ©dit', 0, 'wait'),
(157, 8, 'Restaurant Bar (20-01-2020)', '2020-01-20 19:43:35', 1, 2, 2, 'CrÃ©dit', 378, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(158, 3, 'Restaurant Bar (20-01-2020)', '2020-01-20 20:42:57', 13, 4, 29.5, 'Cash', 384, 'RE', 29.5, 0, 'EspÃ¨ces', 29.5, 'close'),
(159, 8, 'Restaurant Bar (21-01-2020)', '2020-01-21 05:53:09', 13, 3, 19.5, 'CrÃ©dit', 386, 'RE', 0, 19.5, 'CrÃ©dit', 0, 'wait'),
(160, 8, 'Restaurant Bar (21-01-2020)', '2020-01-21 07:17:34', 2, 6.5, 6.5, 'CrÃ©dit', 391, 'RE', 0, 6.5, 'CrÃ©dit', 0, 'wait'),
(161, 8, 'Restaurant Bar (21-01-2020)', '2020-01-21 07:36:24', 2, 6.5, 6.5, 'CrÃ©dit', 393, 'RE', 0, 6.5, 'CrÃ©dit', 0, 'wait'),
(162, 8, 'Restaurant Bar (21-01-2020)', '2020-01-21 07:46:38', 4, 8.5, 13, 'CrÃ©dit', 388, 'RE', 0, 13, 'CrÃ©dit', 0, 'wait'),
(163, 3, 'Restaurant Bar (21-01-2020)', '2020-01-21 08:04:34', 2, 6.5, 6.5, 'Cash', 395, 'RE', 6.5, 0, 'EspÃ¨ces', 6.5, 'close'),
(164, 34, 'Restaurant Bar (21-01-2020)', '2020-01-21 08:26:31', 1, 1.5, 1.5, 'CrÃ©dit', 397, 'RE', 0, 1.5, '', 0, 'wait'),
(165, 35, 'Restaurant Bar (21-01-2020)', '2020-01-21 09:52:54', 2, 3.5, 3.5, 'CrÃ©dit', 398, 'RE', 0, 3.5, 'EspÃ¨ces', 0, 'wait'),
(166, 38, 'Logement (2020-01-21 2020-01-23)', '2020-01-21 10:27:05', 2, 100, 120, 'Cash', 20, 'BO', 0, 120, 'EspÃ¨ces', 0, 'close'),
(167, 37, 'Logement (2020-01-21 2020-01-23)', '2020-01-21 10:37:40', 2, 100, 120, 'Cash', 21, 'BO', 0, 120, 'EspÃ¨ces', 0, 'close'),
(168, 39, 'Logement (2020-01-21 2020-01-23)', '2020-01-21 10:51:28', 2, 100, 120, 'Cash', 22, 'BO', 0, 120, 'EspÃ¨ces', 0, 'close'),
(169, 6, 'Restaurant Bar (21-01-2020)', '2020-01-21 11:28:21', 2, 5, 5, 'CrÃ©dit', 411, 'RE', 0, 5, 'CrÃ©dit', 0, 'wait'),
(170, 39, 'Restaurant Bar (21-01-2020)', '2020-01-21 11:40:38', 4, 16.5, 16.5, 'Cash', 400, 'RE', 0, 16.5, 'EspÃ¨ces', 0, 'close'),
(171, 38, 'Restaurant Bar (21-01-2020)', '2020-01-21 11:41:38', 2, 4, 4, 'Cash', 406, 'RE', 0, 4, 'EspÃ¨ces', 0, 'close'),
(172, 37, 'Restaurant Bar (21-01-2020)', '2020-01-21 11:42:22', 2, 4, 4, 'Cash', 408, 'RE', 0, 4, 'EspÃ¨ces', 0, 'close'),
(173, 4, 'Restaurant Bar (21-01-2020)', '2020-01-21 12:02:06', 1, 2, 2, 'CrÃ©dit', 414, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(174, 8, 'Restaurant Bar (21-01-2020)', '2020-01-21 12:20:45', 9, 1.5, 13.5, 'CrÃ©dit', 416, 'RE', 0, 13.5, 'CrÃ©dit', 0, 'wait'),
(175, 8, 'Restaurant Bar (21-01-2020)', '2020-01-21 12:23:57', 1, 1.5, 1.5, 'CrÃ©dit', 417, 'RE', 0, 1.5, 'CrÃ©dit', 0, 'wait'),
(176, 23, 'Restaurant Bar (21-01-2020)', '2020-01-21 13:32:57', 1, 1.5, 1.5, 'CrÃ©dit', 421, 'RE', 0, 1.5, 'CrÃ©dit', 0, 'wait'),
(177, 34, 'Restaurant Bar (21-01-2020)', '2020-01-21 14:35:23', 5, 22, 22, 'CrÃ©dit', 418, 'RE', 0, 22, '', 0, 'wait'),
(178, 33, 'Restaurant Bar (21-01-2020)', '2020-01-21 15:15:27', 2, 30, 30, 'CrÃ©dit', 424, 'RE', 0, 30, 'CrÃ©dit', 0, 'wait'),
(179, 36, 'Restaurant Bar (21-01-2020)', '2020-01-21 16:20:00', 3, 9.5, 9.5, 'CrÃ©dit', 426, 'RE', 0, 9.5, 'EspÃ¨ces', 0, 'wait'),
(180, 3, 'Restaurant Bar (21-01-2020)', '2020-01-21 17:29:22', 3, 8.5, 8.5, 'Cash', 435, 'RE', 8.5, 0, 'EspÃ¨ces', 8.5, 'close'),
(181, 3, 'Restaurant Bar (21-01-2020)', '2020-01-21 17:40:04', 6, 26, 28, 'Cash', 429, 'RE', 28, 0, 'EspÃ¨ces', 28, 'close'),
(182, 37, 'Restaurant Bar (21-01-2020)', '2020-01-21 17:52:38', 1, 3, 3, 'Cash', 440, 'RE', 0, 3, 'EspÃ¨ces', 0, 'close'),
(183, 38, 'Restaurant Bar (21-01-2020)', '2020-01-21 17:53:51', 2, 15, 15, 'Cash', 433, 'RE', 0, 15, 'EspÃ¨ces', 0, 'close'),
(184, 8, 'Restaurant Bar (21-01-2020)', '2020-01-21 18:13:17', 11, 1.5, 16.5, 'CrÃ©dit', 443, 'RE', 0, 16.5, 'CrÃ©dit', 0, 'wait'),
(185, 35, 'Restaurant Bar (21-01-2020)', '2020-01-21 18:29:33', 2, 6, 6, 'CrÃ©dit', 445, 'RE', 0, 6, 'EspÃ¨ces', 0, 'wait'),
(186, 39, 'Restaurant Bar (21-01-2020)', '2020-01-21 18:56:35', 3, 5.5, 5.5, 'Cash', 441, 'RE', 0, 5.5, 'EspÃ¨ces', 0, 'close'),
(187, 5, 'Restaurant Bar (21-01-2020)', '2020-01-21 19:28:59', 2, 9, 9, 'CrÃ©dit', 448, 'RE', 0, 9, 'CrÃ©dit', 0, 'wait'),
(188, 3, 'Restaurant Bar (21-01-2020)', '2020-01-21 20:20:34', 5, 6, 10, 'Cash', 450, 'RE', 10, 0, 'EspÃ¨ces', 10, 'close'),
(189, 28, 'Logement (2020-01-22 2020-01-24)', '2020-01-22 09:46:54', 2, 100, 100, 'CrÃ©dit', 23, 'BO', 0, 100, 'CrÃ©dit', 0, 'wait'),
(190, 40, 'Logement (2020-01-22 2020-01-23)', '2020-01-22 09:52:49', 1, 100, 60, 'CrÃ©dit', 24, 'BO', 0, 60, 'EspÃ¨ces', 0, 'wait'),
(191, 34, 'Logement (2020-01-22 2020-01-23)', '2020-01-22 16:46:47', 1, 80, 80, 'CrÃ©dit', 25, 'BO', 0, 80, '', 0, 'wait'),
(192, 28, 'Restaurant Bar (22-01-2020)', '2020-01-22 18:21:09', 2, 7, 7, 'Cash', 460, 'RE', 7, 0, 'EspÃ¨ces', 7, 'close'),
(193, 3, 'Restaurant Bar (22-01-2020)', '2020-01-22 19:23:53', 4, 5, 5, 'Cash', 478, 'RE', 5, 0, 'EspÃ¨ces', 5, 'close'),
(194, 37, 'Restaurant Bar (22-01-2020)', '2020-01-22 19:47:34', 3, 23, 23, 'Cash', 488, 'RE', 0, 23, 'EspÃ¨ces', 0, 'close'),
(195, 35, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:04:52', 4, 15, 15, 'CrÃ©dit', 471, 'RE', 0, 15, 'EspÃ¨ces', 0, 'wait'),
(196, 40, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:24:18', 3, 15.5, 15.5, 'CrÃ©dit', 459, 'RE', 0, 15.5, 'EspÃ¨ces', 0, 'wait'),
(197, 33, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:26:05', 6, 18, 21, 'CrÃ©dit', 464, 'RE', 0, 21, 'CrÃ©dit', 0, 'wait'),
(198, 39, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:27:52', 3, 11, 11, 'Cash', 474, 'RE', 0, 11, 'EspÃ¨ces', 0, 'close'),
(199, 36, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:29:31', 5, 15.5, 15.5, 'CrÃ©dit', 470, 'RE', 0, 15.5, 'EspÃ¨ces', 0, 'wait'),
(200, 8, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:30:46', 18, 1.5, 27, 'CrÃ©dit', 490, 'RE', 0, 27, 'CrÃ©dit', 0, 'wait'),
(201, 5, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:31:46', 5, 11.5, 13, 'CrÃ©dit', 461, 'RE', 0, 13, 'CrÃ©dit', 0, 'wait'),
(202, 34, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:56:28', 3, 8.5, 8.5, 'CrÃ©dit', 498, 'RE', 0, 8.5, '', 0, 'wait'),
(203, 8, 'Restaurant Bar (22-01-2020)', '2020-01-22 20:58:14', 18, 12.5, 58.5, 'CrÃ©dit', 454, 'RE', 0, 58.5, 'CrÃ©dit', 0, 'wait'),
(204, 25, 'Restaurant Bar (23-01-2020)', '2020-01-23 07:04:45', 1, 3, 3, 'CrÃ©dit', 502, 'RE', 0, 3, 'CrÃ©dit', 0, 'wait'),
(205, 8, 'Restaurant Bar (23-01-2020)', '2020-01-23 07:37:38', 9, 4.5, 40.5, 'CrÃ©dit', 503, 'RE', 0, 40.5, 'CrÃ©dit', 0, 'wait'),
(206, 8, 'Restaurant Bar (23-01-2020)', '2020-01-23 07:41:03', 9, 2, 18, 'CrÃ©dit', 504, 'RE', 0, 18, 'CrÃ©dit', 0, 'wait'),
(207, 41, 'Restaurant Bar (23-01-2020)', '2020-01-23 08:01:34', 4, 4.5, 9, 'CrÃ©dit', 507, 'RE', 0, 9, 'CrÃ©dit', 0, 'wait'),
(208, 6, 'Restaurant Bar (23-01-2020)', '2020-01-23 08:04:04', 1, 2, 2, 'CrÃ©dit', 509, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(209, 8, 'Restaurant Bar (23-01-2020)', '2020-01-23 11:26:26', 2, 6.5, 6.5, 'CrÃ©dit', 513, 'RE', 0, 6.5, 'CrÃ©dit', 0, 'wait'),
(210, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 13:49:44', 1, 2, 2, 'Cash', 520, 'RE', 2, 0, 'EspÃ¨ces', 2, 'close'),
(211, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 14:16:22', 3, 9, 9, 'Cash', 516, 'RE', 9, 0, 'EspÃ¨ces', 9, 'close'),
(212, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 14:53:26', 2, 10, 20, 'Cash', 512, 'RE', 20, 0, 'EspÃ¨ces', 20, 'close'),
(213, 43, 'Logement (2020-01-23 2020-01-27)', '2020-01-23 14:55:56', 4, 100, 240, 'CrÃ©dit', 26, 'BO', 0, 240, 'CrÃ©dit', 0, 'wait'),
(214, 44, 'Logement (2020-01-23 2020-01-27)', '2020-01-23 14:57:04', 4, 100, 240, 'CrÃ©dit', 27, 'BO', 0, 240, 'CrÃ©dit', 0, 'wait'),
(215, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 15:02:43', 1, 2, 2, 'Cash', 523, 'RE', 2, 0, 'EspÃ¨ces', 2, 'close'),
(216, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 15:07:21', 2, 2, 4, 'Cash', 522, 'RE', 4, 0, 'EspÃ¨ces', 4, 'close'),
(217, 3, 'Autres services (23-01-2020)', '2020-01-23 16:01:12', 1, 15, 15, 'CrÃ©dit', 8, 'SA', 0, 15, 'EspÃ¨ces', 0, 'wait'),
(218, 3, 'Autres services (23-01-2020)', '2020-01-23 16:03:34', 1, 5, 5, 'CrÃ©dit', 9, 'SA', 0, 5, 'EspÃ¨ces', 0, 'wait'),
(219, 5, 'Restaurant Bar (23-01-2020)', '2020-01-23 16:38:56', 5, 8.5, 10, 'CrÃ©dit', 531, 'RE', 0, 10, 'CrÃ©dit', 0, 'wait'),
(220, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 16:59:10', 2, 2, 4, 'Cash', 530, 'RE', 4, 0, 'EspÃ¨ces', 4, 'close'),
(221, 45, 'Restaurant Bar (23-01-2020)', '2020-01-23 17:05:41', 26, 5, 65, 'CrÃ©dit', 535, 'RE', 0, 65, 'CrÃ©dit', 0, 'wait'),
(222, 3, 'Autres services (23-01-2020)', '2020-01-23 17:07:38', 1, 10, 10, 'Cash', 10, 'SA', 10, 0, 'EspÃ¨ces', 10, 'close'),
(223, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 17:26:43', 8, 14, 21.5, 'Cash', 528, 'RE', 21.5, 0, 'EspÃ¨ces', 21.5, 'close'),
(224, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 18:08:56', 3, 9, 9, 'Cash', 525, 'RE', 9, 0, 'EspÃ¨ces', 9, 'close'),
(225, 3, 'Restaurant Bar (23-01-2020)', '2020-01-23 18:10:07', 1, 2, 2, 'Cash', 521, 'RE', 2, 0, 'EspÃ¨ces', 2, 'close'),
(226, 36, 'Restaurant Bar (23-01-2020)', '2020-01-23 19:05:51', 2, 9, 9, 'CrÃ©dit', 542, 'RE', 0, 9, 'EspÃ¨ces', 0, 'wait'),
(227, 35, 'Restaurant Bar (23-01-2020)', '2020-01-23 19:08:18', 1, 3, 3, 'CrÃ©dit', 550, 'RE', 0, 3, 'EspÃ¨ces', 0, 'wait'),
(228, 33, 'Restaurant Bar (23-01-2020)', '2020-01-23 19:36:01', 7, 25, 28, 'CrÃ©dit', 546, 'RE', 0, 28, 'CrÃ©dit', 0, 'wait'),
(229, 24, 'Restaurant Bar (23-01-2020)', '2020-01-23 19:57:22', 1, 2, 2, 'CrÃ©dit', 553, 'RE', 0, 2, 'CrÃ©dit', 0, 'wait'),
(230, 5, 'Restaurant Bar (23-01-2020)', '2020-01-23 20:12:09', 6, 12.5, 14.5, 'CrÃ©dit', 554, 'RE', 0, 14.5, 'CrÃ©dit', 0, 'wait'),
(231, 8, 'Restaurant Bar (23-01-2020)', '2020-01-23 20:19:31', 15, 1.5, 22.5, 'CrÃ©dit', 561, 'RE', 0, 22.5, 'CrÃ©dit', 0, 'wait'),
(232, 5, 'Restaurant Bar (23-01-2020)', '2020-01-23 20:20:27', 2, 1.5, 3, 'CrÃ©dit', 562, 'RE', 0, 3, 'CrÃ©dit', 0, 'wait'),
(233, 8, 'Restaurant Bar (24-01-2020)', '2020-01-24 06:02:37', 6, 4.5, 27, 'CrÃ©dit', 563, 'RE', 0, 27, 'CrÃ©dit', 0, 'wait'),
(234, 8, 'Restaurant Bar (24-01-2020)', '2020-01-24 06:10:01', 12, 7.5, 21, 'CrÃ©dit', 565, 'RE', 0, 21, 'CrÃ©dit', 0, 'wait'),
(235, 3, 'Autres services (24-01-2020)', '2020-01-24 07:26:55', 1, 5, 5, 'Cash', 11, 'SA', 5, 0, 'EspÃ¨ces', 5, 'close'),
(236, 45, 'Logement (2020-02-03 2020-02-04)', '2020-02-03 13:21:23', 1, 80, 80, 'CrÃ©dit', 28, 'BO', 0, 80, 'CrÃ©dit', 0, 'wait'),
(237, 2, 'Blanchisserie (09-03-2020)', '2020-03-09 09:00:53', 1, 1, 1, 'CrÃ©dit', 2, 'BL', 0, 1, '', 0, 'wait'),
(238, 1, 'Autres services (09-03-2020)', '2020-03-09 09:01:54', 1, 5000, 5000, 'CrÃ©dit', 12, 'SA', 2000, 3000, 'EspÃ¨ces', 2000, 'wait'),
(239, 9, 'Autres services (09-03-2020)', '2020-03-09 09:06:51', 1, 3, 3, 'CrÃ©dit', 13, 'SA', 0, 3, 'CrÃ©dit', 0, 'wait'),
(240, 9, 'Buvette (07-01-2021)', '2021-01-07 17:42:13', 2, 3, 6, 'CrÃ©dit', 571, 'RE', 3, 3, 'EspÃ¨ces', 3, 'wait'),
(241, 3, 'Buvette (08-01-2021)', '2021-01-08 08:47:13', 1, 3, 3, 'Cash', 572, 'RE', 3, 0, 'EspÃ¨ces', 3, 'close'),
(242, 3, 'Buvette (08-01-2021)', '2021-01-08 08:53:59', 2, 1.5, 3, 'CrÃ©dit', 573, 'RE', 6, -3, 'EspÃ¨ces', 6, 'wait'),
(243, 2, 'Buvette (08-01-2021)', '2021-01-08 08:58:34', 2, 1.5, 3, 'Cash', 574, 'RE', 3, 0, 'EspÃ¨ces', 3, 'close'),
(244, 2, 'Buvette (08-01-2021)', '2021-01-08 08:59:46', 1, 1.5, 1.5, 'CrÃ©dit', 575, 'RE', 1, 0.5, 'EspÃ¨ces', 1, 'wait'),
(245, 13, 'Buvette (08-01-2021)', '2021-01-08 09:16:59', 1, 2, 2, 'CrÃ©dit', 576, 'RE', 1, 1, 'EspÃ¨ces', 1, 'wait'),
(246, 3, 'Buvette (08-01-2021)', '2021-01-08 10:50:11', 3, 6, 9, 'Cash', 577, 'RE', 9, 0, 'EspÃ¨ces', 9, 'close'),
(247, 3, 'Buvette (08-01-2021)', '2021-01-08 10:53:00', 3, 6, 9, 'Cash', 579, 'RE', 9, 0, 'EspÃ¨ces', 9, 'close'),
(248, 3, 'Buvette (08-01-2021)', '2021-01-08 10:53:54', 3, 6, 9, 'Cash', 579, 'RE', 9, 0, 'EspÃ¨ces', 9, 'close'),
(249, 7, 'Buvette (08-01-2021)', '2021-01-08 10:56:43', 2, 6, 6, 'Cash', 581, 'RE', 6, 0, 'EspÃ¨ces', 6, 'close'),
(250, 3, 'Buvette (08-01-2021)', '2021-01-08 11:01:03', 2, 6, 6, 'Cash', 583, 'RE', 6, 0, 'EspÃ¨ces', 6, 'close'),
(251, 3, 'Buvette (08-01-2021)', '2021-01-08 11:20:17', 2, 3, 3, 'Cash', 585, 'RE', 3, 0, 'EspÃ¨ces', 3, 'close'),
(252, 3, 'Buvette (08-01-2021)', '2021-01-08 11:24:43', 3, 4.5, 4.5, 'Cash', 587, 'RE', 4.5, 0, 'Mobile money', 4.5, 'close'),
(253, 2, 'Buvette (08-01-2021)', '2021-01-08 11:31:58', 2, 4, 4, 'Cash', 39, 'RE', 4, 0, 'EspÃ¨ces', 4, 'close'),
(254, 4, 'Buvette (08-01-2021)', '2021-01-08 11:49:52', 2, 3.5, 3.5, 'Cash', 589, 'RE', 3.5, 0, 'EspÃ¨ces', 3.5, 'close'),
(255, 10, 'Buvette (08-01-2021)', '2021-01-08 11:54:05', 2, 3.5, 3.5, 'Cash', 589, 'RE', 3.5, 0, 'EspÃ¨ces', 3.5, 'close'),
(256, 13, 'Buvette (08-01-2021)', '2021-01-08 11:57:11', 2, 3.5, 3.5, 'Cash', 589, 'RE', 3.5, 0, 'Mobile money', 3.5, 'close'),
(257, 10, 'Buvette (08-01-2021)', '2021-01-08 12:06:36', 2, 3.5, 3.5, 'Cash', 589, 'RE', 3.5, 0, 'EspÃ¨ces', 3.5, 'close'),
(258, 3, 'Buvette (08-01-2021)', '2021-01-08 12:07:31', 1, 2, 2, 'Cash', 37, 'RE', 2, 0, 'EspÃ¨ces', 2, 'close'),
(259, 3, 'Buvette (08-01-2021)', '2021-01-08 12:10:26', 3, 3.5, 5, 'Cash', 591, 'RE', 5, 0, 'Mobile money', 5, 'close'),
(260, 6, 'Buvette (10-01-2021)', '2021-01-10 01:52:00', 2, 1.5, 3, 'Cash', 593, 'RE', 3, 0, 'EspÃ¨ces', 3, 'close'),
(261, 10, 'Buvette (10-01-2021)', '2021-01-10 02:06:33', 3, 1.5, 4.5, 'Cash', 594, 'RE', 4.5, 0, 'EspÃ¨ces', 4.5, 'close'),
(262, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:03:13', 3, 5, 7, 'Cash', 1, 'DP', 7, 0, 'EspÃ¨ces', 7, 'close'),
(263, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:03:44', 3, 5, 7, 'Cash', 1, 'DP', 7, 0, 'EspÃ¨ces', 7, 'close'),
(264, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:04:43', 3, 5, 7, 'Cash', 1, 'DP', 7, 0, 'EspÃ¨ces', 7, 'close'),
(265, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:05:24', 3, 5, 7, 'Cash', 1, 'DP', 7, 0, 'EspÃ¨ces', 7, 'close'),
(266, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:07:49', 3, 5, 7, 'Cash', 1, 'DP', 7, 0, 'EspÃ¨ces', 7, 'close'),
(267, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:08:50', 3, 5, 7, 'Cash', 1, 'DP', 7, 0, 'EspÃ¨ces', 7, 'close'),
(268, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:09:22', 3, 5, 7, 'Cash', 1, 'DP', 7, 0, 'EspÃ¨ces', 7, 'close'),
(269, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:15:53', 3, 3.5, 5.5, 'CrÃ©dit', 1, 'DP', 5, 0.5, 'EspÃ¨ces', 5, 'wait'),
(270, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:21:45', 2, 5, 5, 'Cash', 3, 'DP', 5, 0, 'EspÃ¨ces', 5, 'close'),
(271, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:22:42', 2, 5, 5, 'Cash', 3, 'DP', 5, 0, 'EspÃ¨ces', 5, 'close'),
(272, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:29:35', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(273, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:31:50', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(274, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:33:07', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(275, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:38:19', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(276, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:39:35', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(277, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:41:15', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(278, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:42:22', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(279, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 11:43:49', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(280, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 12:13:30', 6, 5, 13, 'Cash', 1, 'DP', 13, 0, 'EspÃ¨ces', 13, 'close'),
(281, NULL, 'DÃ©pÃ´t (11-01-2021)', '2021-01-11 20:35:52', 5, 27, 135, 'Cash', 6, 'DP', 135, 0, 'EspÃ¨ces', 135, 'close'),
(282, 3, 'Buvette (22-01-2021)', '2021-01-22 14:31:12', 3, 3, 4.5, 'Cash', 595, 'RE', 4.5, 0, 'EspÃ¨ces', 4.5, 'close'),
(283, NULL, 'Buvette (06-03-2021)', '2021-03-06 09:36:12', 2, 2500, 5000, 'Cash', 600, 'RE', 5000, 0, 'Cash', 5000, 'close');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE IF NOT EXISTS `facture` (
  `idFacture` int(11) NOT NULL AUTO_INCREMENT,
  `dateFacture` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idFac` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `montantapayer` double NOT NULL,
  `montantpaye` double NOT NULL,
  `reste` double NOT NULL,
  `type` varchar(50) NOT NULL,
  `etat` varchar(15) NOT NULL,
  PRIMARY KEY (`idFacture`),
  KEY `id_client` (`id_client`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`idFacture`, `dateFacture`, `idFac`, `id_client`, `montantapayer`, `montantpaye`, `reste`, `type`, `etat`) VALUES
(1, '2020-01-03 11:33:19', 1, 1, 60, 60, 0, '', 'Cash'),
(2, '2020-01-06 04:39:19', 2, 2, 140, 140, 0, '', 'Cash'),
(3, '2020-01-09 12:40:48', 6, 14, 0, 0, 0, '', 'Cash'),
(4, '2020-01-10 05:44:28', 9, 17, 65, 0, 65, '', 'CrÃ©dit'),
(5, '2020-01-10 05:45:13', 8, 16, 80, 0, 80, '', 'CrÃ©dit'),
(6, '2020-01-10 05:45:58', 7, 15, 70, 0, 70, '', 'CrÃ©dit'),
(7, '2020-01-10 05:47:04', 6, 14, 0, 0, 0, '', 'Cash'),
(8, '2020-01-10 06:54:04', 5, 12, 60, 0, 60, '', 'CrÃ©dit'),
(9, '2020-01-12 11:06:02', 10, 18, 365, 0, 365, '', 'CrÃ©dit'),
(10, '2020-01-13 14:08:14', 11, 19, 87, 0, 87, '', 'CrÃ©dit'),
(11, '2020-01-13 14:11:38', 11, 19, 87, 87, 0, 'EspÃ¨ces', 'Cash'),
(12, '2020-01-15 07:36:58', 12, 21, 120, 0, 120, '', 'CrÃ©dit'),
(13, '2020-01-15 07:58:41', 12, 21, 120, 0, 120, '', 'CrÃ©dit'),
(14, '2020-01-15 08:47:12', 12, 21, 120, 0, 120, '', 'CrÃ©dit'),
(15, '2020-01-15 09:48:33', 12, 21, 139.5, 139.5, 0, 'EspÃ¨ces', 'CrÃ©dit'),
(16, '2020-01-21 19:04:12', 13, 28, 371, 0, 371, '', 'CrÃ©dit'),
(17, '2020-01-21 19:04:24', 13, 28, 300, 0, 300, '', 'CrÃ©dit'),
(18, '2020-01-21 19:07:44', 13, 28, 300, 300, 0, 'EspÃ¨ces', 'Cash'),
(19, '2020-01-21 19:08:51', 14, 29, 300, 0, 300, '', 'CrÃ©dit'),
(20, '2020-01-21 19:09:17', 14, 29, 300, 300, 0, 'EspÃ¨ces', 'Cash'),
(21, '2020-01-22 07:35:23', 17, 34, 199.5, 0, 199.5, '', 'CrÃ©dit'),
(22, '2020-01-22 07:38:30', 17, 34, 199.5, 199.5, 0, 'EspÃ¨ces', 'CrÃ©dit'),
(23, '2020-01-23 07:11:25', 25, 34, 88.5, 0, 88.5, '', 'CrÃ©dit'),
(26, '2020-01-23 07:32:50', 20, 38, 139, 139, 0, 'EspÃ¨ces', 'Cash'),
(27, '2020-01-23 07:33:26', 22, 39, 153, 153, 0, 'EspÃ¨ces', 'Cash'),
(28, '2020-01-23 07:34:37', 21, 37, 150, 150, 0, 'EspÃ¨ces', 'Cash'),
(29, '2020-01-23 13:04:53', 20, 38, 144, 144, 0, 'EspÃ¨ces', 'Cash'),
(30, '2020-01-23 08:10:02', 24, 40, 75.5, 20, 55.5, 'EspÃ¨ces', 'CrÃ©dit'),
(31, '2020-01-24 05:20:35', 18, 35, 357.5, 357.5, 0, 'EspÃ¨ces', 'CrÃ©dit'),
(32, '2020-01-24 05:23:58', 19, 36, 367.5, 367.5, 0, 'EspÃ¨ces', 'CrÃ©dit');

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

--
-- Contenu de la table `four`
--

INSERT INTO `four` (`idFour`, `nomFour`, `adresseFour`, `telFour`) VALUES
(1, 'Ets NANZIMBA', 'Bujumbura', '+2575267859'),
(2, 'YOMBA', 'MULONGWE', '+243976273603'),
(3, 'AMISSA', 'MULONGWE', '+243992066898'),
(4, 'ALBA', 'KALUNDU', '+24389894841'),
(5, 'BRALIMA', 'KAKUNGWE', '+243999905425'),
(6, 'MAPENDO', 'MULONGWE', '+243816818124'),
(7, 'RAFIKI', 'KAVIMVIRA', '+2438597664');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `materiel`
--

INSERT INTO `materiel` (`idMat`, `idCatEq`, `designMat`, `quantite`, `prixAchat`, `marque`, `dateAcqui`) VALUES
(1, 2, 'Boite Stylo', 2, 2000, 'Bic', '2021-03-06 13:02:46');

-- --------------------------------------------------------

--
-- Structure de la table `organisation`
--

CREATE TABLE IF NOT EXISTS `organisation` (
  `idOrg` int(11) NOT NULL AUTO_INCREMENT,
  `nomOrg` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `emailOrg` varchar(50) NOT NULL,
  PRIMARY KEY (`idOrg`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `organisation`
--

INSERT INTO `organisation` (`idOrg`, `nomOrg`, `adresse`, `tel`, `emailOrg`) VALUES
(1, 'PrivÃ©e', 'Ambulatoire', '+243895847738', 'prive@prive.com'),
(2, 'BRALIMA', 'UVIRA/SUD KIVU', '+243999306265', 'olivier@gmail.com'),
(3, 'HCR', 'UVIRA/SUD KIVU', '+243810084855', 'basinsua@unhcr.org'),
(4, 'PAM', 'UVIRA/SUD KIVU', '+243819700791', 'pam@gmail.com'),
(5, 'MONUSCO', 'KAMVIVIRA', '0990048512', 'monusco@gmail.com'),
(6, 'gstock_baraka', 'Uvira â€“ Sud-Kivu/ RDC', '+243978044578', 'baharibeach2017hotel@gmail.com'),
(7, 'ADEJIKA', 'UVIRA', '0', 'adejika@gmail.com'),
(8, 'CORRIDOR CENTRAL', 'TANZANIE', '+255682425612', 'corridor@gmail.com'),
(9, 'UNICEF', 'UVIRA', '0', 'unicef@gmail.com'),
(10, 'CDJP', 'UVIRA', '0', 'cdjp@gmail.com'),
(11, 'CRS', 'BUKAVU', '0', 'crs@gmail.com'),
(12, 'PROSANI USAID', 'BUKAVU', '1', 'VICKYLUNDULA@gmail.com');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=603 ;

--
-- Contenu de la table `panier`
--

INSERT INTO `panier` (`idPanier`, `datePanier`, `designation`, `qtePanier`, `puPanier`, `ptPanier`, `etatPanier`, `idTable`, `id_serveur`, `product`, `modePaie`, `accompte`, `reste`, `idPv`, `idBoiss`) VALUES
(2, '2020-01-04 22:18:18', 'ENERGY MALT', 1, 2, 2, 'close', 6, 2, 'B', '', 0, 0, 1, 0),
(3, '2020-01-04 22:47:05', 'MITZING GF', 2, 3, 6, 'close', 11, 2, 'B', '', 0, 0, 1, 0),
(4, '2020-01-04 22:47:05', 'AMSTEL BEER', 1, 3, 3, 'close', 11, 2, 'B', '', 0, 0, 1, 2),
(5, '2020-01-04 22:38:03', 'SUCRES PF', 1, 1.5, 1.5, 'close', 7, 2, 'B', '', 0, 0, 1, 0),
(6, '2020-01-04 23:04:11', 'SUPER BOCK', 1, 3, 3, 'close', 12, 2, 'B', '', 0, 0, 1, 0),
(7, '2020-01-04 22:32:57', 'SUCRES PF', 5, 1.5, 7.5, 'close', 5, 2, 'B', '', 0, 0, 1, 0),
(8, '2020-01-04 22:32:57', 'TANGAWIZI', 1, 2, 2, 'close', 5, 2, 'B', '', 0, 0, 1, 0),
(9, '2020-01-04 22:32:57', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 5, 2, 'B', '', 0, 0, 1, 0),
(10, '2020-01-05 07:04:00', 'MITZING GF', 2, 3, 6, 'close', 9, 2, 'B', '', 0, 0, 1, 0),
(11, '2020-01-04 22:38:03', 'AMSTEL BEER', 1, 3, 3, 'close', 7, 2, 'B', '', 0, 0, 1, 2),
(12, '2020-01-04 22:38:03', 'SUCRES PF', 1, 1.5, 1.5, 'close', 7, 2, 'B', '', 0, 0, 1, 0),
(13, '2020-01-04 22:45:31', 'MITZING GF', 2, 3, 6, 'close', 9, 2, 'B', '', 0, 0, 1, 0),
(14, '2020-01-04 22:45:31', 'AMSTEL BEER', 1, 3, 3, 'close', 9, 2, 'B', '', 0, 0, 1, 0),
(15, '2020-01-04 22:47:05', 'SUCRES PF', 1, 1.5, 1.5, 'close', 11, 2, 'B', '', 0, 0, 1, 0),
(16, '2020-01-04 23:08:25', 'SUCRES PF', 1, 1.5, 1.5, 'close', 1, 2, 'B', '', 0, 0, 1, 0),
(17, '2020-01-04 23:21:08', 'CHIVAS M', 2, 4.5, 9, 'close', 1, 2, 'B', '', 0, 0, 1, 0),
(18, '2020-01-04 23:21:08', 'SUCRES PF', 1, 1.5, 1.5, 'close', 1, 2, 'B', '', 0, 0, 1, 0),
(19, '2020-01-04 23:22:20', 'TURBO KING PF', 1, 2, 2, 'close', 1, 2, 'B', '', 0, 0, 1, 0),
(20, '2020-01-04 23:23:35', 'PRIMUS BURUNDI GF', 1, 3, 3, 'close', 1, 2, 'B', '', 0, 0, 1, 0),
(21, '2020-01-05 06:21:14', 'EAU KINJU 0.6L', 9, 1.5, 13.5, 'close', 1, 2, 'B', '', 0, 0, 1, 0),
(22, '2020-01-05 18:38:59', 'ENERGY MALT', 1, 2, 2, 'close', 14, 3, 'B', '', 0, 0, 1, 0),
(23, '2020-01-05 18:38:59', 'SUCRES PF', 1, 1.5, 1.5, 'close', 14, 3, 'B', '', 0, 0, 1, 0),
(24, '2020-01-05 18:38:05', 'SUCRES PF', 5, 1.5, 7.5, 'close', 16, 3, 'B', '', 0, 0, 1, 0),
(25, '2020-01-05 19:17:03', 'JUS AFIA', 2, 2, 4, 'close', 19, 3, 'B', '', 0, 0, 1, 0),
(26, '2020-01-05 19:27:57', 'JUS AFIA', 2, 2, 4, 'close', 19, 3, 'B', '', 0, 0, 1, 0),
(27, '2020-01-05 19:46:42', 'AMSTEL BEER', 1, 3, 3, 'close', 13, 3, 'B', '', 0, 0, 1, 2),
(28, '2020-01-05 19:46:42', 'SUCRES PF', 7, 1.5, 10.5, 'close', 13, 3, 'B', '', 0, 0, 1, 0),
(32, '2020-01-05 20:13:47', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 6, 3, 'B', '', 0, 0, 1, 0),
(37, '2020-01-11 20:16:07', 'SUCRES GF', 1, 2, 2, 'close', 1, 3, 'B', 'Cash', 0, 0, 1, 0),
(39, '2020-01-11 20:17:37', 'JUS AFIA', 1, 2, 2, 'close', 2, 3, 'B', 'Cash', 0, 0, 1, 0),
(40, '2020-01-11 21:02:57', 'SUCRES GF', 3, 2, 6, 'close', 17, 3, 'B', '', 0, 0, 1, 0),
(41, '2020-01-11 21:02:57', 'SUCRES PF', 1, 1.5, 1.5, 'close', 17, 3, 'B', '', 0, 0, 1, 0),
(42, '2020-01-11 21:02:57', 'TANGAWIZI', 2, 2, 4, 'close', 17, 3, 'B', '', 0, 0, 1, 0),
(43, '2020-01-11 21:02:57', 'CAFE NOIR ', 1, 2, 2, 'close', 17, 3, 'P', '', 0, 0, 1, 0),
(44, '2020-01-11 21:04:02', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 18, 3, 'P', '', 0, 0, 1, 0),
(45, '2020-01-11 21:04:02', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 18, 3, 'P', '', 0, 0, 1, 0),
(46, '2020-01-11 21:04:02', 'SUCRES PF', 3, 1.5, 4.5, 'close', 18, 3, 'B', '', 0, 0, 1, 0),
(47, '2020-01-11 21:04:02', 'SUCRES GF', 1, 2, 2, 'close', 18, 3, 'B', '', 0, 0, 1, 0),
(48, '2020-01-11 21:02:07', 'FILET DE CAPITAINNE GRAND-MERE', 1, 11, 11, 'close', 16, 3, 'P', '', 0, 0, 1, 0),
(49, '2020-01-11 21:02:07', 'TILAPIA A LA CREME DE POIREAUX 15', 1, 15, 15, 'close', 16, 3, 'P', '', 0, 0, 1, 0),
(50, '2020-01-11 21:02:07', 'AMARULA PF', 1, 20, 20, 'close', 16, 3, 'B', '', 0, 0, 1, 0),
(51, '2020-01-11 21:00:59', 'MARGUERITTE', 2, 10, 20, 'close', 15, 3, 'P', '', 0, 0, 1, 0),
(52, '2020-01-11 20:59:55', 'SUCRES GF', 2, 2, 4, 'close', 14, 3, 'B', '', 0, 0, 1, 0),
(53, '2020-01-11 20:59:55', 'SUCRES PF', 1, 1.5, 1.5, 'close', 14, 3, 'B', '', 0, 0, 1, 0),
(54, '2020-01-11 20:54:09', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 7, 3, 'P', '', 0, 0, 1, 0),
(55, '2020-01-11 20:57:33', 'ENERGY MALT', 1, 2, 2, 'close', 12, 3, 'B', '', 0, 0, 1, 0),
(56, '2020-01-11 20:57:33', 'SUPER BOCK', 3, 3, 9, 'close', 12, 3, 'B', '', 0, 0, 1, 0),
(57, '2020-01-11 20:57:33', 'SUCRES GF', 1, 2, 2, 'close', 12, 3, 'B', '', 0, 0, 1, 0),
(58, '2020-01-11 20:54:09', 'CAFE AU LAIT', 1, 2, 2, 'close', 7, 3, 'P', '', 0, 0, 1, 0),
(59, '2020-01-11 20:59:55', 'SUCRES GF', 1, 2, 2, 'close', 14, 3, 'B', '', 0, 0, 1, 0),
(60, '2020-01-11 22:27:54', 'SUCRES PF', 2, 1.5, 3, 'close', 3, 3, 'B', '', 0, 0, 1, 0),
(61, '2020-01-11 22:30:43', 'ROYAL BURUNDI', 1, 3, 3, 'close', 4, 3, 'B', '', 0, 0, 1, 0),
(62, '2020-01-11 22:33:04', 'EAU KINJU 0.6L', 7, 1.5, 10.5, 'close', 5, 3, 'B', '', 0, 0, 1, 0),
(65, '2020-01-12 13:31:01', 'AMSTEL BEER', 1, 3, 3, 'close', 19, 2, 'B', '', 0, 0, 1, 0),
(66, '2020-01-12 13:31:01', 'PRIMUS BURUNDI GF', 1, 3, 3, 'close', 19, 2, 'B', '', 0, 0, 1, 0),
(67, '2020-01-12 13:31:01', 'ROYAL BURUNDI', 2, 3, 6, 'close', 19, 2, 'B', '', 0, 0, 1, 0),
(68, '2020-01-12 13:31:01', 'SUCRES PF', 3, 1.5, 4.5, 'close', 19, 2, 'B', '', 0, 0, 1, 0),
(69, '2020-01-12 14:24:48', 'SUCRES PF', 2, 1.5, 3, 'close', 4, 2, 'B', '', 0, 0, 1, 0),
(70, '2020-01-12 16:34:27', 'MAFIOZA', 1, 10, 10, 'close', 18, 2, 'P', '', 0, 0, 1, 0),
(71, '2020-01-12 16:34:27', 'AMSTEL BOCK', 2, 2, 4, 'close', 18, 2, 'B', '', 0, 0, 1, 0),
(72, '2020-01-12 16:32:46', 'SAVANA', 1, 4, 4, 'close', 20, 2, 'B', '', 0, 0, 1, 0),
(73, '2020-01-12 20:09:42', '1/4POULET MOZAMBICAINE', 1, 9, 9, 'close', 11, 2, 'P', '', 0, 0, 1, 0),
(74, '2020-01-12 20:09:42', 'ACCO BANANE P', 1, 0, 0, 'close', 11, 2, 'P', '', 0, 0, 1, 0),
(75, '2020-01-12 20:09:42', 'FRITE BANANES PLANTAIN', 1, 2, 2, 'close', 11, 2, 'P', '', 0, 0, 1, 0),
(76, '2020-01-12 16:31:16', 'SUCRES GF', 1, 2, 2, 'close', 22, 2, 'B', '', 0, 0, 1, 0),
(77, '2020-01-12 16:31:16', 'SUCRES PF', 1, 1.5, 1.5, 'close', 22, 2, 'B', '', 0, 0, 1, 0),
(78, '2020-01-12 16:46:06', 'STEAK GRILLE', 1, 7, 7, 'close', 1, 2, 'P', '', 0, 0, 1, 0),
(79, '2020-01-12 16:46:06', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 1, 2, 'P', '', 0, 0, 1, 0),
(80, '2020-01-12 19:10:58', '1/4POULET MOZAMBICAINE', 1, 9, 9, 'close', 2, 2, 'P', '', 0, 0, 1, 0),
(82, '2020-01-12 20:12:56', 'VEGETARIENNE', 1, 10, 10, 'close', 21, 2, 'P', '', 0, 0, 1, 0),
(83, '2020-01-12 20:12:56', 'AMSTEL BEER', 2, 3, 6, 'close', 21, 2, 'B', '', 0, 0, 1, 0),
(84, '2020-01-12 20:12:56', 'SUCRES GF', 1, 2, 2, 'close', 21, 2, 'B', '', 0, 0, 1, 0),
(85, '2020-01-12 20:12:56', 'AMSTEL BEER', 2, 3, 6, 'close', 21, 2, 'B', '', 0, 0, 1, 0),
(86, '2020-01-12 20:12:56', 'VEGETARIENNE', 1, 10, 10, 'close', 21, 2, 'P', '', 0, 0, 1, 0),
(88, '2020-01-12 20:09:42', 'SUCRES GF', 2, 2, 4, 'close', 11, 2, 'B', '', 0, 0, 1, 0),
(89, '2020-01-12 20:09:42', 'SALADES MIXTES', 1, 2.5, 2.5, 'close', 11, 2, 'P', '', 0, 0, 1, 0),
(90, '2020-01-12 19:13:00', 'TILAPIA A LA SAUCE SALSA CRUDA 15', 1, 15, 15, 'close', 3, 2, 'P', '', 0, 0, 1, 0),
(91, '2020-01-12 19:13:00', 'ACCO FUFU', 1, 0, 0, 'close', 3, 2, 'P', '', 0, 0, 1, 0),
(93, '2020-01-12 19:10:58', 'SUCRES GF', 1, 2, 2, 'close', 2, 2, 'B', '', 0, 0, 1, 0),
(94, '2020-01-12 19:10:58', 'SUPER BOCK', 2, 3, 6, 'close', 2, 2, 'B', '', 0, 0, 1, 0),
(95, '2020-01-12 19:13:00', 'FOUFOU', 1, 2, 2, 'close', 3, 2, 'P', '', 0, 0, 1, 0),
(96, '2020-01-12 20:09:42', 'SUCRES PF', 1, 1.5, 1.5, 'close', 11, 2, 'B', '', 0, 0, 1, 0),
(97, '2020-01-12 19:57:19', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 24, 2, 'B', '', 0, 0, 1, 0),
(98, '2020-01-12 19:57:19', '1/4POULET MOZAMBICAINE', 1, 9, 9, 'close', 24, 2, 'P', '', 0, 0, 1, 0),
(99, '2020-01-12 19:57:19', 'SANDWICH BAHARI HOTEL', 1, 7.5, 7.5, 'close', 24, 2, 'P', '', 0, 0, 1, 0),
(100, '2020-01-12 19:57:19', 'ACCO BANANE P', 1, 0, 0, 'close', 24, 2, 'P', '', 0, 0, 1, 0),
(101, '2020-01-12 20:09:42', 'SUCRES GF', 1, 2, 2, 'close', 11, 2, 'B', '', 0, 0, 1, 0),
(102, '2020-01-12 20:31:48', 'STEAK GRILLE', 1, 7, 7, 'close', 6, 2, 'P', '', 0, 0, 1, 0),
(103, '2020-01-12 20:30:28', 'ACCO FUFU', 1, 0, 0, 'close', 1, 2, 'P', '', 0, 0, 1, 0),
(104, '2020-01-12 20:30:28', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 1, 2, 'B', '', 0, 0, 1, 0),
(105, '2020-01-12 20:52:37', 'AMSTEL BOCK', 2, 2, 4, 'close', 19, 2, 'B', '', 0, 0, 1, 0),
(106, '2020-01-12 20:52:37', 'SAVANA', 1, 4, 4, 'close', 19, 2, 'B', '', 0, 0, 1, 0),
(107, '2020-01-12 20:52:37', 'SUCRES GF', 1, 2, 2, 'close', 19, 2, 'B', '', 0, 0, 1, 0),
(108, '2020-01-12 22:11:03', 'COCA ZERO GF', 1, 2, 2, 'close', 5, 2, 'B', '', 0, 0, 1, 0),
(109, '2020-01-13 10:53:54', 'ROYAL BURUNDI', 1, 3, 3, 'close', 1, 2, 'B', 'Cash', 0, 0, 1, 0),
(110, '2020-01-13 10:54:01', 'SUCRES GF', 2, 2, 4, 'close', 1, 2, 'B', 'Cash', 0, 0, 1, 0),
(111, '2020-01-13 10:54:06', 'SUCRES PF', 1, 1.5, 1.5, 'close', 1, 2, 'B', 'Cash', 0, 0, 1, 0),
(112, '2020-01-13 21:05:55', 'OMELETTE NATURE', 1, 2.5, 2.5, 'close', 2, 3, 'P', 'Cash', 0, 0, 1, 0),
(113, '2020-01-13 10:06:21', 'THE NOIR', 1, 2, 2, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(114, '2020-01-13 12:24:32', 'KUHE A LA CREME DE POIREAUX 40', 3, 40, 120, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(116, '2020-01-13 12:24:32', 'ACCO BANANE P', 2, 0, 0, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(117, '2020-01-13 12:24:32', 'ACCO RIZ', 1, 0, 0, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(118, '2020-01-13 12:24:32', 'SAUCE PROVENCALE ', 1, 2, 2, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(119, '2020-01-13 12:31:46', 'PETIT DEJEUNER CONTINENTAL', 3, 4.5, 13.5, 'close', 10, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(120, '2020-01-13 12:28:58', 'PETIT DEJEUNER CONTINENTAL', 2, 4.5, 9, 'close', 4, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(121, '2020-01-13 12:24:32', 'ACCO FUFU', 4, 0, 0, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(122, '2020-01-13 12:24:32', 'ACCO SOMBE', 4, 0, 0, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(123, '2020-01-13 12:24:32', 'ACCO SAUCE PROVINCIALE', 1, 0, 0, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(124, '2020-01-13 12:24:32', 'SUCRES GF', 5, 2, 10, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 0),
(125, '2020-01-13 12:24:32', 'SUCRES PF', 2, 1.5, 3, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 0),
(126, '2020-01-13 12:24:32', 'EAU GAZEUSE 0.5L', 2, 1.5, 3, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 0),
(127, '2020-01-13 12:24:32', 'ROYAL BURUNDI', 1, 3, 3, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 0),
(128, '2020-01-13 12:24:32', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 0),
(129, '2020-01-13 12:28:58', 'THE NOIR', 2, 2, 4, 'close', 4, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(130, '2020-01-13 12:31:46', 'THE NOIR', 3, 2, 6, 'close', 10, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(131, '2020-01-13 18:59:42', 'KING FISH', 4, 3, 12, 'close', 14, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(132, '2020-01-13 18:59:42', 'SUCRES GF', 1, 2, 2, 'close', 14, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(133, '2020-01-13 19:20:41', 'EAU KINJU 0.6L', 10, 1.5, 15, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(134, '2020-01-14 09:10:02', 'COCA ZERO GF', 1, 2, 2, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(135, '2020-01-14 14:12:32', 'MACEDOINE FRUITS ', 1, 2.5, 2.5, 'close', 6, 2, 'P', 'Cash', 0, 0, 1, 0),
(136, '2020-01-14 14:12:32', 'CROQUE-MONSIEUR', 1, 3.5, 3.5, 'close', 6, 2, 'P', 'Cash', 0, 0, 1, 0),
(137, '2020-01-14 14:12:32', 'SUCRES PF', 1, 1.5, 1.5, 'close', 6, 2, 'B', 'Cash', 0, 0, 1, 0),
(138, '2020-01-14 22:04:37', 'KUHE A LA SAUCE BOUILLONS 18', 1, 18, 18, 'close', 2, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(140, '2020-01-14 22:07:02', 'SUCRES PF', 1, 1.5, 1.5, 'close', 2, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(141, '2020-01-14 18:22:27', 'ACCO FUFU', 1, 0, 0, 'close', 2, 2, 'P', 'Cash', 0, 0, 1, 0),
(143, '2020-01-14 20:55:55', 'SUCRES PF', 2, 1.5, 3, 'close', 18, 2, 'B', 'Cash', 0, 0, 1, 0),
(146, '2020-01-14 20:55:55', 'J&B M', 1, 2.5, 2.5, 'close', 18, 2, 'B', 'Cash', 0, 0, 1, 0),
(147, '2020-01-14 20:55:55', 'J&B M', 4, 2.5, 10, 'close', 18, 2, 'B', 'Cash', 0, 0, 1, 0),
(148, '2020-01-14 20:55:55', 'POMME DE TERRE FRITES ', 1, 2, 2, 'close', 18, 2, 'P', 'Cash', 0, 0, 1, 0),
(151, '2020-01-14 21:49:45', 'EAU KINJU 0.6L', 15, 1.5, 22.5, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(152, '2020-01-14 21:49:45', 'BUFFET', 15, 13.5, 202.5, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(153, '2020-01-14 21:49:45', 'PAUSE CAFE', 15, 3.5, 52.5, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(154, '2020-01-14 21:49:45', 'SUCRES PF', 9, 1.5, 13.5, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(155, '2020-01-14 21:49:45', 'EAU KINJU 0.6L', 6, 1.5, 9, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(156, '2020-01-14 21:49:45', 'EAU KINJU 0.6L', 15, 1.5, 22.5, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(157, '2020-01-15 08:47:54', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(158, '2020-01-15 08:50:22', 'THE NOIR', 1, 2, 2, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(159, '2020-01-15 09:34:31', 'ENERGY MALT', 1, 2, 2, 'close', 12, 3, 'B', 'Cash', 0, 0, 1, 0),
(160, '2020-01-15 09:34:31', 'JUS AFIA', 2, 2, 4, 'close', 12, 3, 'B', 'Cash', 0, 0, 1, 0),
(161, '2020-01-15 12:28:40', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 4, 9, 36, 'close', 18, 3, 'P', 'Cash', 0, 0, 1, 0),
(162, '2020-01-15 12:28:40', 'ACCO POMMES DE T.', 2, 0, 0, 'close', 18, 3, 'P', 'Cash', 0, 0, 1, 0),
(163, '2020-01-15 12:28:40', 'ACCO FUFU', 1, 0, 0, 'close', 18, 3, 'P', 'Cash', 0, 0, 1, 0),
(164, '2020-01-15 12:28:40', 'ACCO BANANE P', 1, 0, 0, 'close', 18, 3, 'P', 'Cash', 0, 0, 1, 0),
(165, '2020-01-15 11:55:27', 'SUCRES GF', 1, 2, 2, 'close', 3, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(166, '2020-01-15 11:41:20', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 11, 3, 'B', 'Cash', 0, 0, 1, 0),
(167, '2020-01-15 11:55:27', 'SAUCISSE', 1, 3, 3, 'close', 3, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(168, '2020-01-15 11:41:20', 'JUS AFIA', 2, 2, 4, 'close', 11, 3, 'B', 'Cash', 0, 0, 1, 0),
(169, '2020-01-15 11:41:20', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 11, 3, 'B', 'Cash', 0, 0, 1, 0),
(170, '2020-01-15 12:28:40', 'EAU GAZEUSE 0.5L', 2, 1.5, 3, 'close', 18, 3, 'B', 'Cash', 0, 0, 1, 0),
(171, '2020-01-15 12:28:40', 'HEINEKEN', 2, 3, 6, 'close', 18, 3, 'B', 'Cash', 0, 0, 1, 0),
(172, '2020-01-15 12:28:40', 'JUS AFIA', 2, 2, 4, 'close', 18, 3, 'B', 'Cash', 0, 0, 1, 0),
(174, '2020-01-15 18:46:38', 'ACCO BANANE P', 1, 0, 0, 'close', 5, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(175, '2020-01-15 18:46:38', 'JUS AFIA', 1, 2, 2, 'close', 5, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(176, '2020-01-15 19:35:59', 'SAUCISSE', 2, 3, 6, 'close', 7, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(177, '2020-01-15 19:35:59', 'FOUFOU', 4, 2, 8, 'close', 7, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(178, '2020-01-15 19:48:00', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 6, 3, 'P', 'Cash', 0, 0, 1, 0),
(179, '2020-01-15 19:48:00', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 6, 3, 'P', 'Cash', 0, 0, 1, 0),
(180, '2020-01-16 18:16:38', 'POULET AU CURRY', 2, 9, 18, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(181, '2020-01-16 18:16:38', 'ACCO RIZ', 2, 0, 0, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(182, '2020-01-16 16:53:38', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 2, 2, 'B', 'Cash', 0, 0, 1, 0),
(183, '2020-01-16 16:53:38', 'JUS AFIA', 1, 2, 2, 'close', 2, 2, 'B', 'Cash', 0, 0, 1, 0),
(184, '2020-01-16 18:16:38', 'PRIMUS PF', 2, 2, 4, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(185, '2020-01-16 18:16:38', 'SUCRES GF', 1, 2, 2, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(186, '2020-01-16 18:16:38', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(187, '2020-01-16 18:16:38', 'THE CITRONNEL', 2, 2, 4, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(188, '2020-01-16 19:30:44', 'TILAPIA A LA SAUCE SALSA CRUDA 15', 1, 15, 15, 'close', 17, 2, 'P', 'Cash', 0, 0, 1, 0),
(189, '2020-01-16 19:30:44', 'MAFIOZA', 1, 10, 10, 'close', 17, 2, 'P', 'Cash', 0, 0, 1, 0),
(190, '2020-01-16 19:30:44', 'SUCRES PF', 1, 1.5, 1.5, 'close', 17, 2, 'B', 'Cash', 0, 0, 1, 0),
(191, '2020-01-16 19:30:44', 'SUCRES PF', 1, 1.5, 1.5, 'close', 17, 2, 'B', 'Cash', 0, 0, 1, 0),
(192, '2020-01-16 19:30:44', 'RED BULL', 2, 2.5, 5, 'close', 17, 2, 'B', 'Cash', 0, 0, 1, 0),
(193, '2020-01-16 19:30:44', 'ACCO SAUCE PROVINCIALE', 1, 0, 0, 'close', 17, 2, 'P', 'Cash', 0, 0, 1, 0),
(194, '2020-01-16 19:30:44', 'ACCO RIZ', 1, 0, 0, 'close', 17, 2, 'P', 'Cash', 0, 0, 1, 0),
(195, '2020-01-16 20:05:16', 'SUCRES PF', 2, 1.5, 3, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(197, '2020-01-16 20:06:09', 'JUS AFIA', 1, 2, 2, 'close', 16, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(198, '2020-01-16 20:36:14', 'COCA ZERO GF', 1, 2, 2, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(199, '2020-01-17 13:05:28', 'CAFE AU LAIT', 2, 2, 4, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(200, '2020-01-17 13:05:28', 'CREPE SUCREE(deux piÃ¨ce)', 2, 2, 4, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(201, '2020-01-17 13:05:28', 'OMELETTES AUX OIGNONS', 2, 2.5, 5, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(202, '2020-01-17 13:05:28', 'ACCO PAIN', 2, 0, 0, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(203, '2020-01-17 13:02:36', 'SUCRES PF', 2, 1.5, 3, 'close', 1, 3, 'B', 'Cash', 0, 0, 1, 0),
(204, '2020-01-17 13:05:28', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 8, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(205, '2020-01-17 15:13:13', 'SUCRES GF', 2, 2, 4, 'close', 18, 3, 'B', 'Cash', 0, 0, 1, 0),
(206, '2020-01-17 15:13:13', 'SUCRES PF', 1, 1.5, 1.5, 'close', 18, 3, 'B', 'Cash', 0, 0, 1, 0),
(207, '2020-01-17 15:13:13', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 18, 3, 'B', 'Cash', 0, 0, 1, 0),
(208, '2020-01-17 20:04:38', 'TILAPIA A LA CREME DE POIREAUX 15', 1, 15, 15, 'close', 5, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(209, '2020-01-17 20:04:38', 'ACCO FUFU', 1, 0, 0, 'close', 5, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(214, '2020-01-17 19:59:41', 'FILET DE CAPITAINE GRILLE', 1, 9, 9, 'close', 19, 3, 'P', 'Cash', 0, 0, 1, 0),
(215, '2020-01-17 19:59:41', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 19, 3, 'P', 'Cash', 0, 0, 1, 0),
(216, '2020-01-17 18:09:27', 'SUCRES GF', 2, 2, 4, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 0),
(217, '2020-01-17 19:59:41', 'KUHE A LA SAUCE SALSA CRUDA 25/12.5', 1, 12.5, 12.5, 'close', 19, 3, 'P', 'Cash', 0, 0, 1, 0),
(218, '2020-01-17 19:59:41', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 19, 3, 'P', 'Cash', 0, 0, 1, 0),
(225, '2020-01-17 19:40:13', 'COCA ZERO GF', 1, 2, 2, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(226, '2020-01-17 19:53:54', 'POULET AU CURRY', 2, 9, 18, 'close', 1, 3, 'P', 'Cash', 0, 0, 1, 0),
(228, '2020-01-17 19:53:54', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 1, 3, 'B', 'Cash', 0, 0, 1, 0),
(229, '2020-01-17 19:53:54', 'RED BULL', 1, 2.5, 2.5, 'close', 1, 3, 'B', 'Cash', 0, 0, 1, 0),
(230, '2020-01-17 19:53:54', 'Jus Maison Mixte', 1, 2.5, 2.5, 'close', 1, 3, 'P', 'Cash', 0, 0, 1, 0),
(231, '2020-01-17 19:53:54', 'THE NOIR', 2, 2, 4, 'close', 1, 3, 'P', 'Cash', 0, 0, 1, 0),
(232, '2020-01-17 19:59:41', 'MITZING GF', 7, 3, 21, 'close', 19, 3, 'B', 'Cash', 0, 0, 1, 0),
(233, '2020-01-17 20:04:38', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 5, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(234, '2020-01-17 20:04:38', 'ACCO SOMBE', 1, 0, 0, 'close', 5, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(238, '2020-01-18 07:44:58', 'JUS AFIA', 1, 2, 2, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(239, '2020-01-18 12:22:45', 'OMELETTES AUX OIGNONS', 2, 2.5, 5, 'close', 21, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(240, '2020-01-18 12:22:45', 'CAFE AU LAIT', 2, 2, 4, 'close', 21, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(241, '2020-01-18 12:22:45', 'ASSIETTES DE FRUIT NATURE', 2, 2, 4, 'close', 21, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(242, '2020-01-18 12:22:45', 'ACCO PAIN', 2, 0, 0, 'close', 21, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(243, '2020-01-18 12:21:26', 'THE GINGEMBRE', 2, 2, 4, 'close', 7, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(244, '2020-01-18 12:21:26', 'OMELETTES AUX OIGNONS', 2, 2.5, 5, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(245, '2020-01-18 12:21:26', 'ASSIETTES DE FRUIT NATURE', 2, 2, 4, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(246, '2020-01-18 12:21:26', 'ACCO PAIN', 2, 0, 0, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(247, '2020-01-18 12:09:20', 'AMSTEL BEER', 4, 3, 12, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(248, '2020-01-18 12:09:20', 'SUCRES GF', 1, 2, 2, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(249, '2020-01-18 12:09:20', 'SUCRES GF', 4, 2, 8, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(250, '2020-01-18 13:50:55', 'KUHE A LA CREME DE POIREAUX 25/12.5', 1, 12.5, 12.5, 'close', 2, 2, 'P', 'Cash', 0, 0, 1, 0),
(251, '2020-01-18 13:50:55', 'ACCO FUFU', 1, 0, 0, 'close', 2, 2, 'P', 'Cash', 0, 0, 1, 0),
(252, '2020-01-18 13:50:55', 'ACCO LENGA-LENGA', 1, 0, 0, 'close', 2, 2, 'P', 'Cash', 0, 0, 1, 0),
(253, '2020-01-18 13:50:55', 'LEGENDE', 1, 2, 2, 'close', 2, 2, 'B', 'Cash', 0, 0, 1, 0),
(254, '2020-01-18 15:26:44', 'CREPE NATURE', 1, 2, 2, 'close', 18, 2, 'P', 'Cash', 0, 0, 1, 0),
(255, '2020-01-18 15:26:44', 'ASSIETTES DE FRUIT NATURE', 1, 2, 2, 'close', 18, 2, 'P', 'Cash', 0, 0, 1, 0),
(256, '2020-01-18 15:26:44', 'Jus Maison', 1, 2.5, 2.5, 'close', 18, 2, 'P', 'Cash', 0, 0, 1, 0),
(257, '2020-01-18 15:26:44', 'Jus Maison', 1, 2.5, 2.5, 'close', 18, 2, 'P', 'Cash', 0, 0, 1, 0),
(258, '2020-01-18 15:26:44', 'ACCO PAIN', 1, 0, 0, 'close', 18, 2, 'P', 'Cash', 0, 0, 1, 0),
(259, '2020-01-18 15:26:44', 'SUCRES PF', 1, 1.5, 1.5, 'close', 18, 2, 'B', 'Cash', 0, 0, 1, 0),
(260, '2020-01-18 19:17:00', 'MAFIOZA', 1, 10, 10, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(261, '2020-01-18 19:17:00', 'KUHE A LA SAUCE SALSA CRUDA 18', 1, 18, 18, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(262, '2020-01-18 19:17:00', 'ACCO FUFU', 1, 0, 0, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(263, '2020-01-18 19:17:00', 'POMME DE TERRE FRITES ', 1, 2, 2, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(264, '2020-01-18 19:17:00', 'ASSIETTES DE FRUIT NATURE', 1, 2, 2, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(265, '2020-01-18 17:51:05', 'ACCO FUFU', 1, 0, 0, 'close', 4, 2, 'P', 'Cash', 0, 0, 1, 0),
(266, '2020-01-18 17:51:05', 'EMINCE DE VEAU AUX OIGNONS', 1, 7, 7, 'close', 4, 2, 'P', 'Cash', 0, 0, 1, 0),
(267, '2020-01-18 17:51:05', 'ACCO SOMBE', 1, 0, 0, 'close', 4, 2, 'P', 'Cash', 0, 0, 1, 0),
(268, '2020-01-18 19:17:00', 'ACCO SOMBE', 1, 0, 0, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(269, '2020-01-18 17:51:05', 'ROYAL BURUNDI', 6, 3, 18, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 0),
(272, '2020-01-18 17:51:05', 'PRIMUS GF', 1, 3, 3, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 0),
(273, '2020-01-18 17:51:05', 'SUCRES PF', 1, 1.5, 1.5, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 0),
(274, '2020-01-18 17:51:05', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 0),
(276, '2020-01-18 17:37:37', 'MITZING PF', 1, 2, 2, 'close', 20, 2, 'B', 'Cash', 0, 0, 1, 0),
(277, '2020-01-18 17:51:05', 'SUCRES GF', 2, 2, 4, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 0),
(278, '2020-01-18 17:51:05', 'AMSTEL BEER', 1, 3, 3, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 0),
(279, '2020-01-18 18:22:42', 'EMINCE DE VEAU AUX OIGNONS', 1, 7, 7, 'close', 1, 2, 'P', 'Cash', 0, 0, 1, 0),
(281, '2020-01-18 18:22:42', 'ACCO FUFU', 1, 0, 0, 'close', 1, 2, 'P', 'Cash', 0, 0, 1, 0),
(282, '2020-01-18 19:06:46', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 8, 2, 'B', 'Cash', 0, 0, 1, 0),
(283, '2020-01-18 19:06:46', 'DIAMBINO', 1, 12, 12, 'close', 8, 2, 'P', 'Cash', 0, 0, 1, 0),
(284, '2020-01-18 19:06:46', 'FANTAISIE', 1, 10, 10, 'close', 8, 2, 'P', 'Cash', 0, 0, 1, 0),
(285, '2020-01-18 19:17:00', 'AMSTEL BEER', 1, 3, 3, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(286, '2020-01-18 19:17:00', 'ROYAL BURUNDI', 1, 3, 3, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(287, '2020-01-18 19:17:00', 'SUCRES GF', 1, 2, 2, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(288, '2020-01-18 19:18:36', 'AMSTEL BEER', 2, 3, 6, 'close', 5, 2, 'B', 'Cash', 0, 0, 1, 0),
(289, '2020-01-18 19:18:36', 'SUCRES GF', 2, 2, 4, 'close', 5, 2, 'B', 'Cash', 0, 0, 1, 0),
(290, '2020-01-18 19:17:00', 'ROYAL BURUNDI', 1, 3, 3, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(291, '2020-01-18 19:28:42', 'CAFE NOIR ', 2, 2, 4, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(292, '2020-01-18 19:28:42', 'THE CITRONNEL', 2, 2, 4, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(293, '2020-01-18 20:13:32', 'SUCRES GF', 2, 2, 4, 'close', 2, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(294, '2020-01-18 20:16:54', 'EAU KINJU 0.6L', 12, 1.5, 18, 'close', 24, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(295, '2020-01-18 20:16:54', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 24, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(297, '2020-01-19 10:43:26', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 1, 3, 'P', 'Cash', 0, 0, 1, 0),
(298, '2020-01-19 10:43:26', 'CAFE AU LAIT', 1, 2, 2, 'close', 1, 3, 'P', 'Cash', 0, 0, 1, 0),
(299, '2020-01-19 10:36:16', 'PETIT DEJEUNER CONTINENTAL', 4, 4.5, 18, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(300, '2020-01-19 10:36:16', 'EAU KINJU 0.6L', 4, 1.5, 6, 'close', 2, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(301, '2020-01-19 10:39:29', 'THE NOIR', 4, 2, 8, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(302, '2020-01-19 13:15:09', 'Jus Maison Mixte', 2, 2.5, 5, 'close', 17, 3, 'P', 'Cash', 0, 0, 1, 0),
(303, '2020-01-19 13:54:15', '1/4POULET MOZAMBICAINE', 1, 9, 9, 'close', 21, 3, 'P', 'Cash', 0, 0, 1, 0),
(304, '2020-01-19 13:54:15', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 21, 3, 'P', 'Cash', 0, 0, 1, 0),
(305, '2020-01-19 13:54:15', 'Jus Maison Mixte', 1, 2.5, 2.5, 'close', 21, 3, 'P', 'Cash', 0, 0, 1, 0),
(306, '2020-01-19 13:15:09', 'TILAPIA A LA CREME DE POIREAUX 15', 1, 15, 15, 'close', 17, 3, 'P', 'Cash', 0, 0, 1, 0),
(307, '2020-01-19 13:15:09', 'ACCO BANANE P', 1, 0, 0, 'close', 17, 3, 'P', 'Cash', 0, 0, 1, 0),
(308, '2020-01-19 16:54:41', 'THE CITRONNEL', 1, 2, 2, 'close', 18, 3, 'P', 'Cash', 0, 0, 1, 0),
(309, '2020-01-19 16:54:41', 'Jus Maison Mixte', 2, 2.5, 5, 'close', 18, 3, 'P', 'Cash', 0, 0, 1, 0),
(311, '2020-01-19 13:15:09', 'SPAGHETTI BOLOGNAISE', 1, 5, 5, 'close', 17, 3, 'P', 'Cash', 0, 0, 1, 0),
(312, '2020-01-19 16:09:20', 'SAUCISSE', 2, 3, 6, 'close', 6, 3, 'P', 'Cash', 0, 0, 1, 0),
(313, '2020-01-19 16:09:20', 'POMME DE TERRE FRITES ', 2, 2, 4, 'close', 6, 3, 'P', 'Cash', 0, 0, 1, 0),
(314, '2020-01-19 16:09:20', 'SALADES MIXTES', 1, 2.5, 2.5, 'close', 6, 3, 'P', 'Cash', 0, 0, 1, 0),
(315, '2020-01-19 16:09:20', 'POMME DE TERRE FRITES ', 1, 2, 2, 'close', 6, 3, 'P', 'Cash', 0, 0, 1, 0),
(317, '2020-01-19 14:30:48', 'TURBO KING PF', 1, 2, 2, 'close', 1, 3, 'B', 'Cash', 0, 0, 1, 0),
(318, '2020-01-19 14:33:20', 'TURBO KING GF', 1, 3, 3, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(319, '2020-01-19 16:09:20', 'SUCRES GF', 3, 2, 6, 'close', 6, 3, 'B', 'Cash', 0, 0, 1, 0),
(320, '2020-01-19 16:09:20', 'SUCRES PF', 2, 1.5, 3, 'close', 6, 3, 'B', 'Cash', 0, 0, 1, 0),
(322, '2020-01-19 17:35:51', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 16, 3, 'P', 'Cash', 0, 0, 1, 0),
(323, '2020-01-19 17:35:51', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 16, 3, 'P', 'Cash', 0, 0, 1, 0),
(324, '2020-01-19 17:35:51', 'STEAK GRILLE', 1, 7, 7, 'close', 16, 3, 'P', 'Cash', 0, 0, 1, 0),
(325, '2020-01-19 17:35:51', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 16, 3, 'P', 'Cash', 0, 0, 1, 0),
(326, '2020-01-19 17:35:51', 'SAUCISSE', 1, 3, 3, 'close', 16, 3, 'P', 'Cash', 0, 0, 1, 0),
(327, '2020-01-19 17:35:51', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 16, 3, 'P', 'Cash', 0, 0, 1, 0),
(328, '2020-01-19 18:00:43', 'AMSTEL BEER', 1, 3, 3, 'close', 13, 3, 'B', 'Cash', 0, 0, 1, 0),
(329, '2020-01-19 18:00:43', 'PRIMUS BURUNDI GF', 1, 3, 3, 'close', 13, 3, 'B', 'Cash', 0, 0, 1, 0),
(330, '2020-01-19 18:00:43', 'SUCRES PF', 2, 1.5, 3, 'close', 13, 3, 'B', 'Cash', 0, 0, 1, 0),
(331, '2020-01-19 18:38:19', 'SPAGHETTI BOLOGNAISE', 2, 5, 10, 'close', 8, 3, 'P', 'Cash', 0, 0, 1, 0),
(332, '2020-01-19 17:35:51', 'TANGAWIZI', 2, 2, 4, 'close', 16, 3, 'B', 'Cash', 0, 0, 1, 0),
(333, '2020-01-19 17:35:51', 'SUCRES GF', 1, 2, 2, 'close', 16, 3, 'B', 'Cash', 0, 0, 1, 0),
(334, '2020-01-19 17:35:51', 'POMME DE TERRE FRITES ', 1, 2, 2, 'close', 16, 3, 'P', 'Cash', 0, 0, 1, 0),
(336, '2020-01-19 18:38:19', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 8, 3, 'B', 'Cash', 0, 0, 1, 0),
(337, '2020-01-19 18:16:31', 'SAVANA', 1, 4, 4, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(338, '2020-01-19 18:38:19', 'THE CITRONNEL', 1, 2, 2, 'close', 8, 2, 'P', 'Cash', 0, 0, 1, 0),
(339, '2020-01-19 18:25:34', 'KING FISH', 1, 3, 3, 'close', 3, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(340, '2020-01-19 18:27:05', 'KING FISH', 1, 3, 3, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(341, '2020-01-19 19:55:28', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(342, '2020-01-19 19:54:38', 'KUHE A LA SAUCE BOUILLONS 20', 1, 20, 20, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(343, '2020-01-19 19:55:28', 'ACCO FUFU', 2, 0, 0, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(344, '2020-01-19 19:54:38', 'ACCO FUFU', 2, 0, 0, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(345, '2020-01-19 19:56:04', 'FOUFOU', 4, 2, 8, 'close', 4, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(346, '2020-01-19 19:59:42', 'ACCO FUFU', 1, 0, 0, 'close', 5, 3, 'P', 'Cash', 0, 0, 1, 0),
(347, '2020-01-19 19:54:38', 'Jus Maison Mixte', 1, 2.5, 2.5, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(348, '2020-01-20 07:12:00', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 1, 2, 'P', 'Cash', 0, 0, 1, 0),
(349, '2020-01-20 07:13:14', 'CAFE AU LAIT', 1, 2, 2, 'close', 1, 3, 'P', 'Cash', 0, 0, 1, 0),
(350, '2020-01-20 07:35:07', 'PETIT DEJEUNER CONTINENTAL', 3, 4.5, 13.5, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(351, '2020-01-20 07:35:40', 'THE NOIR', 3, 2, 6, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(352, '2020-01-20 11:17:03', 'TURBO KING PF', 1, 2, 2, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(353, '2020-01-20 13:00:40', 'THE CITRONNEL', 1, 2, 2, 'close', 19, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(354, '2020-01-20 13:01:24', 'SUCRES PF', 1, 1.5, 1.5, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(355, '2020-01-20 13:02:10', 'COCA ZERO GF', 1, 2, 2, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(356, '2020-01-20 13:03:06', 'RED BULL', 1, 2.5, 2.5, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(357, '2020-01-20 13:07:43', 'SPAGHETTI VEGETAL', 1, 5, 5, 'close', 9, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(358, '2020-01-20 16:40:01', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 19, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(359, '2020-01-20 16:41:09', 'SPAGHETTI BOLOGNAISE', 1, 5, 5, 'close', 19, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(360, '2020-01-20 16:42:01', 'MITZING PF', 2, 2, 4, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(361, '2020-01-20 16:51:35', 'POULET MOZAMBICAIN', 1, 9, 9, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(362, '2020-01-20 16:56:04', 'ACCO FUFU', 1, 0, 0, 'close', 19, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(363, '2020-01-20 16:56:34', 'RIZ MAMA AFRIKA', 1, 2, 2, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(364, '2020-01-20 16:59:53', 'TANGAWIZI', 1, 2, 2, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(367, '2020-01-20 18:02:13', 'HEINEKEN', 1, 3, 3, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(368, '2020-01-20 18:02:50', 'SAVANA', 1, 4, 4, 'close', 7, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(370, '2020-01-20 18:06:47', 'BROCHETTE DE BOEUF MARINE', 1, 8, 8, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(371, '2020-01-20 18:07:57', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(372, '2020-01-20 18:09:20', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 7, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(373, '2020-01-20 18:10:41', 'MITZING PF', 1, 2, 2, 'close', 8, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(374, '2020-01-20 18:11:06', 'BROCHETTE DE BOEUF MARINE', 1, 8, 8, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(375, '2020-01-20 18:11:30', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(376, '2020-01-20 18:17:57', 'SAVANA', 1, 4, 4, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(377, '2020-01-20 18:18:25', 'MITZING PF', 1, 2, 2, 'close', 19, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(378, '2020-01-20 19:16:50', 'SUCRES GF', 1, 2, 2, 'close', 1, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(379, '2020-01-20 19:30:00', 'ROYAL BURUNDI', 2, 3, 6, 'close', 2, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(380, '2020-01-20 19:30:52', 'SUCRES PF', 2, 1.5, 3, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(381, '2020-01-20 19:36:57', 'POULET MOZAMBICAIN', 1, 9, 9, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(382, '2020-01-20 19:38:36', 'ACCO FUFU', 1, 0, 0, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(383, '2020-01-20 19:39:11', 'ACCO SOMBE', 1, 0, 0, 'close', 3, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(384, '2020-01-20 20:40:42', 'J&B M', 10, 2.5, 25, 'close', 5, 2, 'B', 'Cash', 0, 0, 1, 0),
(385, '2020-01-20 20:41:30', 'SUCRES PF', 3, 1.5, 4.5, 'close', 5, 2, 'B', 'Cash', 0, 0, 1, 0),
(386, '2020-01-21 05:49:00', 'EAU KINJU 0.6L', 8, 1.5, 12, 'close', 24, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(387, '2020-01-21 05:50:27', 'EAU KINJU 0.6L', 5, 1.5, 7.5, 'close', 24, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(388, '2020-01-21 06:09:19', 'PETIT DEJEUNER CONTINENTAL', 2, 4.5, 9, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(389, '2020-01-21 06:09:48', 'THE AU LAIT', 1, 2, 2, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(390, '2020-01-21 06:22:31', 'CAFE NOIR ', 1, 2, 2, 'close', 8, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(391, '2020-01-21 07:14:30', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(392, '2020-01-21 07:15:19', 'THE NOIR', 1, 2, 2, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(393, '2020-01-21 07:34:22', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(394, '2020-01-21 07:34:47', 'CAFE AU LAIT', 1, 2, 2, 'close', 2, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(395, '2020-01-21 08:02:56', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 3, 3, 'P', 'Cash', 0, 0, 1, 0),
(396, '2020-01-21 08:03:25', 'CAFE AU LAIT', 1, 2, 2, 'close', 3, 3, 'P', 'Cash', 0, 0, 1, 0),
(397, '2020-01-21 08:13:56', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 2, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(398, '2020-01-21 09:07:39', 'COCA ZERO GF', 1, 2, 2, 'close', 19, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(399, '2020-01-21 09:08:15', 'SUCRES PF', 1, 1.5, 1.5, 'close', 19, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(400, '2020-01-21 10:39:23', 'TILAPIA A LA CREME DE POIREAUX 15', 1, 15, 15, 'close', 8, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(401, '2020-01-21 10:42:26', 'ACCO RIZ', 1, 0, 0, 'close', 8, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(406, '2020-01-21 11:17:16', 'LENGA-LENGA', 1, 2, 2, 'close', 9, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(407, '2020-01-21 11:17:50', 'RIZ MAMA AFRIKA', 1, 2, 2, 'close', 9, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(408, '2020-01-21 11:19:43', 'POMME DE TERRE FRITES ', 1, 2, 2, 'close', 10, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(409, '2020-01-21 11:20:30', 'LENGA-LENGA', 1, 2, 2, 'close', 10, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(410, '2020-01-21 11:21:56', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 8, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(411, '2020-01-21 11:26:16', 'AMSTEL BEER', 1, 3, 3, 'close', 3, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(412, '2020-01-21 11:26:47', 'TANGAWIZI', 1, 2, 2, 'close', 3, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(413, '2020-01-21 11:37:47', 'ACCO SAUCE PROVINCIALE', 1, 0, 0, 'close', 8, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(414, '2020-01-21 12:00:33', 'COCA ZERO GF', 1, 2, 2, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(416, '2020-01-21 12:19:37', 'EAU KINJU 0.6L', 9, 1.5, 13.5, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(417, '2020-01-21 12:23:19', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(418, '2020-01-21 13:11:48', 'KUHE A LA SAUCE SALSA CRUDA 15', 1, 15, 15, 'close', 4, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(419, '2020-01-21 13:12:49', 'ACCO RIZ', 1, 0, 0, 'close', 4, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(420, '2020-01-21 13:13:16', 'CHAMPINIONS A LA CREME ', 1, 3, 3, 'close', 4, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(421, '2020-01-21 13:30:57', 'SUCRES PF', 1, 1.5, 1.5, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(422, '2020-01-21 13:56:51', 'CAFE AU LAIT', 1, 2, 2, 'close', 4, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(423, '2020-01-21 14:32:53', 'TANGAWIZI', 1, 2, 2, 'close', 4, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(424, '2020-01-21 15:10:31', 'TILAPIA A LA SAUCE PROVENCALE', 1, 30, 30, 'close', 9, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(425, '2020-01-21 15:11:31', 'ACCO RIZ', 1, 0, 0, 'close', 9, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(426, '2020-01-21 15:25:37', 'BROCHETTE DE BOEUF MARINE', 1, 8, 8, 'close', 6, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(427, '2020-01-21 15:26:10', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 6, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(428, '2020-01-21 15:38:10', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 6, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(429, '2020-01-21 16:02:28', 'POULET AU CURRY', 1, 9, 9, 'close', 9, 3, 'P', 'Cash', 0, 0, 1, 0),
(430, '2020-01-21 16:03:03', 'ACCO RIZ', 1, 0, 0, 'close', 9, 3, 'P', 'Cash', 0, 0, 1, 0),
(431, '2020-01-21 16:04:22', 'TILAPIA A LA SAUCE SALSA CRUDA 15', 1, 15, 15, 'close', 9, 3, 'P', 'Cash', 0, 0, 1, 0),
(432, '2020-01-21 16:04:49', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 9, 3, 'P', 'Cash', 0, 0, 1, 0),
(433, '2020-01-21 16:15:08', 'TILAPIA A LA SAUCE SALSA CRUDA 15', 1, 15, 15, 'close', 12, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(434, '2020-01-21 16:15:52', 'ACCO Banane Verte', 1, 0, 0, 'close', 12, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(435, '2020-01-21 16:56:28', 'STEAK GRILLE', 1, 7, 7, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(436, '2020-01-21 16:57:13', 'ACCO BANANE P', 1, 0, 0, 'close', 7, 3, 'P', 'Cash', 0, 0, 1, 0),
(438, '2020-01-21 17:00:31', 'MITZING PF', 2, 2, 4, 'close', 9, 3, 'B', 'Cash', 0, 0, 1, 0),
(439, '2020-01-21 17:25:59', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 0),
(440, '2020-01-21 17:51:22', 'AMSTEL BEER', 1, 3, 3, 'close', 11, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(441, '2020-01-21 17:54:26', 'BANANES VERTES', 1, 2, 2, 'close', 13, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(442, '2020-01-21 17:54:55', 'LENGA-LENGA', 1, 2, 2, 'close', 13, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(443, '2020-01-21 18:12:46', 'EAU KINJU 0.6L', 11, 1.5, 16.5, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(445, '2020-01-21 18:21:57', 'POTAGE AUX LEGUMES', 1, 3, 3, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(446, '2020-01-21 18:22:33', 'HEINEKEN', 1, 3, 3, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(447, '2020-01-21 18:50:59', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 13, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(448, '2020-01-21 19:27:13', '1/4POULET YASSA A LA SENEGALAISE', 1, 9, 9, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(449, '2020-01-21 19:27:50', 'ACCO FUFU', 1, 0, 0, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(450, '2020-01-21 19:30:42', 'POMME DE TERRE FRITES ', 1, 2, 2, 'close', 21, 3, 'P', 'Cash', 0, 0, 1, 0),
(451, '2020-01-21 19:56:02', 'J&B M', 2, 2.5, 5, 'close', 21, 3, 'B', 'Cash', 0, 0, 1, 0),
(452, '2020-01-21 20:00:18', 'SUCRES PF', 2, 1.5, 3, 'close', 21, 3, 'B', 'Cash', 0, 0, 1, 0),
(454, '2020-01-22 08:25:57', 'PETIT DEJEUNER CONTINENTAL', 9, 4.5, 40.5, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(455, '2020-01-22 08:27:06', 'CAFE NOIR ', 3, 2, 6, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(456, '2020-01-22 08:27:34', 'CAFE AU LAIT', 2, 2, 4, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(457, '2020-01-22 08:28:26', 'THE GINGEMBRE', 3, 2, 6, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(458, '2020-01-22 08:29:03', 'THE CITRONNEL', 1, 2, 2, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(459, '2020-01-22 09:28:47', 'SALADES D''AVOCAT A LA FACON DU CHEF', 1, 3.5, 3.5, 'close', 2, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(460, '2020-01-22 14:50:10', 'ASSIETTES DE FRUIT NATURE', 1, 2, 2, 'close', 3, 2, 'P', 'Cash', 0, 0, 1, 0),
(461, '2020-01-22 14:59:36', 'TILAPIA A LA SAUCE BOUILLONS 10', 1, 10, 10, 'close', 18, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(462, '2020-01-22 15:00:05', 'ACCO FUFU', 1, 0, 0, 'close', 18, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(463, '2020-01-22 15:01:02', 'ACCO LENGA-LENGA', 1, 0, 0, 'close', 18, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(464, '2020-01-22 15:33:32', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 11, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(465, '2020-01-22 15:34:49', 'FRITE BANANES PLANTAIN', 1, 2, 2, 'close', 11, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(467, '2020-01-22 16:12:18', 'SPAGHETTI BOLOGNAISE', 1, 5, 5, 'close', 3, 2, 'P', 'Cash', 0, 0, 1, 0),
(468, '2020-01-22 16:51:56', 'PIZZA MARGUERITTE', 1, 10, 10, 'close', 2, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(470, '2020-01-22 18:00:02', 'BROCHETTE DE BOEUF MARINE', 1, 8, 8, 'close', 6, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(471, '2020-01-22 18:01:57', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 4, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(472, '2020-01-22 18:02:36', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 4, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(473, '2020-01-22 18:02:58', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 6, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(474, '2020-01-22 18:05:47', '1/4POULET MOZAMBICAINE', 1, 9, 9, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(475, '2020-01-22 18:10:10', 'ACCO PETIT POIDS', 1, 0, 0, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(476, '2020-01-22 18:28:15', 'PRIMUS PF', 1, 2, 2, 'close', 2, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(478, '2020-01-22 18:31:13', 'ACCO PAIN', 2, 0, 0, 'close', 8, 2, 'P', 'Cash', 0, 0, 1, 0),
(479, '2020-01-22 18:39:58', 'SUCRES GF', 1, 2, 2, 'close', 11, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(480, '2020-01-22 18:40:20', 'ROYAL BURUNDI', 2, 3, 6, 'close', 11, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(481, '2020-01-22 18:41:14', 'FRITE BANANES PLANTAIN', 1, 2, 2, 'close', 11, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(482, '2020-01-22 18:58:05', 'LENGA-LENGA', 1, 2, 2, 'close', 7, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(484, '2020-01-22 19:14:50', 'HEINEKEN', 1, 3, 3, 'close', 4, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(485, '2020-01-22 19:16:02', 'HEINEKEN', 1, 3, 3, 'close', 6, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(486, '2020-01-22 19:16:49', 'HEINEKEN', 1, 3, 3, 'close', 4, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(487, '2020-01-22 19:19:29', 'SUCRES GF', 1, 2, 2, 'close', 8, 2, 'B', 'Cash', 0, 0, 1, 0),
(488, '2020-01-22 19:20:03', 'POTAGE AUX LEGUMES', 1, 3, 3, 'close', 16, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(489, '2020-01-22 19:21:44', 'POTAGE AUX LEGUMES', 1, 3, 3, 'close', 8, 2, 'P', 'Cash', 0, 0, 1, 0),
(490, '2020-01-22 19:25:11', 'EAU KINJU 0.6L', 18, 1.5, 27, 'close', 24, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(491, '2020-01-22 19:28:21', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 18, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(492, '2020-01-22 19:30:34', 'TILAPIA A LA CREME DE POIREAUX 20', 1, 20, 20, 'close', 16, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(493, '2020-01-22 19:32:44', 'ACCO RIZ', 1, 0, 0, 'close', 16, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(494, '2020-01-22 19:50:11', 'HEINEKEN', 1, 3, 3, 'close', 6, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(495, '2020-01-22 19:50:57', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 6, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(498, '2020-01-22 20:33:33', 'CROQUE-MONSIEUR', 1, 3.5, 3.5, 'close', 2, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(499, '2020-01-22 20:34:02', 'POTAGE AUX LEGUMES', 1, 3, 3, 'close', 2, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(500, '2020-01-22 20:34:27', 'TANGAWIZI', 1, 2, 2, 'close', 2, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(502, '2020-01-23 07:03:11', 'ROYAL BURUNDI', 1, 3, 3, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(503, '2020-01-23 07:35:47', 'PETIT DEJEUNER CONTINENTAL', 9, 4.5, 40.5, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(504, '2020-01-23 07:38:23', 'THE AU LAIT', 9, 2, 18, 'close', 1, 2, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(507, '2020-01-23 07:58:56', 'AMSTEL BEER', 2, 3, 6, 'close', 2, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(508, '2020-01-23 07:59:24', 'SUCRES PF', 2, 1.5, 3, 'close', 2, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(509, '2020-01-23 08:03:09', 'TURBO KING PF', 1, 2, 2, 'close', 3, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(512, '2020-01-23 10:48:29', 'PIZZA MAFIOZA', 2, 10, 20, 'close', 1, 3, 'P', 'Cash', 0, 0, 1, 0),
(513, '2020-01-23 11:23:39', 'PETIT DEJEUNER CONTINENTAL', 1, 4.5, 4.5, 'close', 3, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(514, '2020-01-23 11:24:25', 'THE AU LAIT', 1, 2, 2, 'close', 3, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(516, '2020-01-23 13:17:11', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 4, 3, 'P', 'Cash', 0, 0, 1, 0),
(517, '2020-01-23 13:17:35', 'ACCO RIZ', 1, 0, 0, 'close', 4, 3, 'P', 'Cash', 0, 0, 1, 0),
(518, '2020-01-23 13:19:25', 'ACCO SAUCE PROVINCIALE', 1, 0, 0, 'close', 4, 3, 'P', 'Cash', 0, 0, 1, 0),
(520, '2020-01-23 13:36:12', 'SUCRES GF', 1, 2, 2, 'close', 5, 3, 'B', 'Cash', 0, 0, 1, 0),
(521, '2020-01-23 13:58:39', 'ASSIETTES DE FRUIT NATURE', 1, 2, 2, 'close', 3, 3, 'P', 'Cash', 0, 0, 1, 0),
(522, '2020-01-23 14:59:41', 'SUCRES GF', 2, 2, 4, 'close', 13, 3, 'B', 'Cash', 0, 0, 1, 0),
(523, '2020-01-23 15:00:46', 'JUS AFIA', 1, 2, 2, 'close', 4, 3, 'B', 'Cash', 0, 0, 1, 0),
(525, '2020-01-23 16:18:06', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 10, 3, 'P', 'Cash', 0, 0, 1, 0),
(526, '2020-01-23 16:18:34', 'ACCO RIZ', 1, 0, 0, 'close', 10, 3, 'P', 'Cash', 0, 0, 1, 0),
(527, '2020-01-23 16:19:13', 'ACCO SAUCE PROVINCIALE', 1, 0, 0, 'close', 10, 3, 'P', 'Cash', 0, 0, 1, 0),
(528, '2020-01-23 16:20:10', 'THE GINGEMBRE', 3, 2, 6, 'close', 11, 3, 'P', 'Cash', 0, 0, 1, 0),
(529, '2020-01-23 16:20:56', 'CROQUE-MONSIEUR', 2, 3.5, 7, 'close', 11, 3, 'P', 'Cash', 0, 0, 1, 0),
(530, '2020-01-23 16:30:58', 'POMME DE TERRE FRITES ', 2, 2, 4, 'close', 13, 3, 'P', 'Cash', 0, 0, 1, 0),
(531, '2020-01-23 16:34:31', 'EMINCE DE BOEUF A LA SAUCE', 1, 7, 7, 'close', 8, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(532, '2020-01-23 16:34:57', 'ACCO FUFU', 1, 0, 0, 'close', 8, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(533, '2020-01-23 16:35:40', 'ACCO LENGA-LENGA', 1, 0, 0, 'close', 8, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(534, '2020-01-23 16:38:11', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 8, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(535, '2020-01-23 16:41:31', 'PAUSE CAFE', 13, 3.5, 45.5, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(536, '2020-01-23 16:42:40', 'EAU KINJU 0.6L', 13, 1.5, 19.5, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(537, '2020-01-23 16:50:49', 'STEAK GRILLE', 1, 7, 7, 'close', 11, 3, 'P', 'Cash', 0, 0, 1, 0),
(538, '2020-01-23 16:51:27', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 11, 3, 'P', 'Cash', 0, 0, 1, 0),
(541, '2020-01-23 17:20:05', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 11, 3, 'B', 'Cash', 0, 0, 1, 0),
(542, '2020-01-23 17:43:46', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 7, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(543, '2020-01-23 17:44:16', 'ACCO POMMES DE T.', 1, 0, 0, 'close', 7, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(546, '2020-01-23 18:12:16', 'KUHE A LA SAUCE SALSA CRUDA 20', 1, 20, 20, 'close', 6, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(547, '2020-01-23 18:12:39', 'ACCO FUFU', 1, 0, 0, 'close', 6, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(548, '2020-01-23 18:13:22', 'ACCO BANANE P', 1, 0, 0, 'close', 6, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(549, '2020-01-23 18:13:58', 'ACCO SOMBE', 1, 0, 0, 'close', 6, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(550, '2020-01-23 18:46:06', 'POTAGE AUX LEGUMES', 1, 3, 3, 'close', 8, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(551, '2020-01-23 19:12:14', 'ROYAL BURUNDI', 2, 3, 6, 'close', 6, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(552, '2020-01-23 19:12:42', 'SUCRES GF', 1, 2, 2, 'close', 6, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(553, '2020-01-23 19:56:11', 'SUCRES GF', 1, 2, 2, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(554, '2020-01-23 20:07:15', '1/4POULET GRILLE A LA SAUCE SALSA CRUDA', 1, 9, 9, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(555, '2020-01-23 20:07:39', 'ACCO FUFU', 1, 0, 0, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(556, '2020-01-23 20:08:05', 'ACCO SOMBE', 1, 0, 0, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(557, '2020-01-23 20:09:51', 'COCA ZERO GF', 2, 2, 4, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(558, '2020-01-23 20:10:47', 'EAU KINJU 0.6L', 1, 1.5, 1.5, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(561, '2020-01-23 20:17:54', 'EAU KINJU 0.6L', 15, 1.5, 22.5, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(562, '2020-01-23 20:19:51', 'EAU KINJU 0.6L', 2, 1.5, 3, 'close', 2, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(563, '2020-01-24 06:01:58', 'PETIT DEJEUNER CONTINENTAL', 6, 4.5, 27, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(565, '2020-01-24 06:04:21', 'THE AU LAIT', 2, 2, 4, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(566, '2020-01-24 06:05:51', 'CAFE AU LAIT', 2, 2, 4, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(567, '2020-01-24 06:06:24', 'THE CITRONNEL', 2, 2, 4, 'close', 1, 3, 'P', 'CrÃ©dit', 0, 0, 1, 0),
(568, '2020-01-24 06:09:19', 'EAU KINJU 0.6L', 6, 1.5, 9, 'close', 1, 3, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(571, '2021-01-07 17:38:23', 'AMSTEL BEER', 2, 3, 6, 'close', 7, 2, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(572, '2021-01-08 05:51:50', 'AMSTEL BEER', 1, 3, 3, 'close', 1, 2, 'B', 'Cash', 0, 0, 1, 0),
(573, '2021-01-08 08:53:20', 'SUCRES PF', 2, 1.5, 3, 'close', 6, 4, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(574, '2021-01-08 08:56:31', 'SUCRES PF', 2, 1.5, 3, 'close', 6, 4, 'B', 'Cash', 0, 0, 1, 0),
(575, '2021-01-08 08:59:18', 'SUCRES PF', 1, 1.5, 1.5, 'close', 8, 4, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(576, '2021-01-08 09:01:18', 'JUS AFIA', 1, 2, 2, 'close', 13, 4, 'B', 'CrÃ©dit', 0, 0, 1, 0),
(577, '2021-01-08 09:50:16', 'PRIMUS BURUNDI GF', 2, 3, 6, 'close', 4, 4, 'B', 'Cash', 0, 0, 1, 12),
(578, '2021-01-08 10:03:10', 'SUPER BOCK', 1, 3, 3, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 15),
(579, '2021-01-08 10:51:55', 'PRIMUS BURUNDI GF', 2, 3, 6, 'close', 6, 3, 'B', 'Cash', 0, 0, 1, 12),
(580, '2021-01-08 10:52:29', 'AMSTEL BOCK', 1, 3, 3, 'close', 6, 2, 'B', 'Cash', 0, 0, 1, 1),
(581, '2021-01-08 10:55:27', 'EAU GAZEUSE 0.5L', 1, 1.5, 1.5, 'close', 3, 2, 'B', 'Cash', 0, 0, 1, 34),
(582, '2021-01-08 10:56:18', 'DOUBLE BLACK M', 1, 4.5, 4.5, 'close', 3, 3, 'B', 'Cash', 0, 0, 1, 77),
(583, '2021-01-08 10:58:34', 'PRIMUS BURUNDI GF', 1, 3, 3, 'close', 7, 2, 'B', 'Cash', 0, 0, 1, 12),
(584, '2021-01-08 10:59:03', 'AMSTEL BEER', 1, 3, 3, 'close', 7, 3, 'B', 'Cash', 0, 0, 1, 2),
(585, '2021-01-08 11:11:53', 'SUCRES PF', 1, 1.5, 1.5, 'close', 4, 2, 'B', 'Cash', 0, 0, 1, 23),
(586, '2021-01-08 11:12:09', 'SUCRES PF', 1, 1.5, 1.5, 'close', 4, 3, 'B', 'Cash', 0, 0, 1, 23);
INSERT INTO `panier` (`idPanier`, `datePanier`, `designation`, `qtePanier`, `puPanier`, `ptPanier`, `etatPanier`, `idTable`, `id_serveur`, `product`, `modePaie`, `accompte`, `reste`, `idPv`, `idBoiss`) VALUES
(587, '2021-01-08 11:23:33', 'SUCRES PF', 1, 1.5, 1.5, 'close', 8, 2, 'B', 'Cash', 0, 0, 1, 23),
(588, '2021-01-08 11:23:54', 'SUCRES PF', 1, 1.5, 1.5, 'close', 8, 2, 'B', 'Cash', 0, 0, 1, 23),
(589, '2021-01-08 11:23:55', 'SUCRES PF', 1, 1.5, 1.5, 'close', 8, 2, 'B', 'Cash', 0, 0, 1, 23),
(590, '2020-01-11 20:16:07', 'SUCRES GF', 1, 2, 2, 'close', 8, 3, 'B', 'Cash', 0, 0, 1, 1),
(591, '2021-01-08 12:08:25', 'SUCRES GF', 1, 2, 2, 'close', 2, 2, 'B', 'Cash', 0, 0, 1, 24),
(592, '2021-01-08 12:09:42', 'SUCRES PF', 2, 1.5, 3, 'close', 2, 3, 'B', 'Cash', 0, 0, 1, 23),
(593, '2021-01-10 01:49:32', 'SUCRES PF', 2, 1.5, 3, 'close', 3, 2, 'B', 'Cash', 0, 0, 1, 23),
(594, '2021-01-10 02:06:08', 'SUCRES PF', 3, 1.5, 4.5, 'close', 2, 3, 'B', 'Cash', 0, 0, 1, 23),
(595, '2021-01-22 14:22:33', 'COCA ZERO PF', 2, 1.5, 3, 'close', 2, 2, 'B', 'Cash', 0, 0, 1, 22),
(597, '2021-01-22 14:23:40', 'SUCRES PF', 1, 1.5, 1.5, 'close', 2, 3, 'B', 'Cash', 0, 0, 1, 23),
(600, '2021-03-03 09:44:09', 'AMSTEL BOCK', 2, 2500, 5000, 'close', 6, 2, 'B', 'Cash', 0, 0, 1, 1),
(601, '2021-03-09 11:17:46', 'MARTINI BLANC M', 1, 2.5, 2.5, 'wait', 2, 2, 'B', '', 0, 0, 1, 92),
(602, '2021-03-24 14:40:02', 'AMSTEL BOCK', 1, 2500, 2500, 'wait', 5, 2, 'B', '', 0, 0, 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Contenu de la table `panier_dep`
--

INSERT INTO `panier_dep` (`idPanier`, `datePanier`, `designation`, `qtePanier`, `puPanier`, `ptPanier`, `etatPanier`, `idBoiss`) VALUES
(1, '2021-01-11 11:28:49', 'AMSTEL BOCK', 5, 2, 10, 'close', 1),
(2, '2021-01-11 11:29:04', 'AMSTEL BEER', 1, 3, 3, 'close', 2),
(3, '2021-01-11 19:14:03', 'AMSTEL BOCK', 2, 2, 4, 'close', 1),
(4, '2021-01-11 19:14:37', 'AMSTEL BOCK', 1, 2, 2, 'close', 1),
(5, '2021-01-11 19:17:38', 'AMSTEL BOCK', 1, 2, 2, 'close', 1),
(6, '2021-01-11 20:18:38', 'COCA ZERO PF', 5, 27, 135, 'close', 22),
(7, '2021-01-25 20:15:11', 'COCA ZERO PF', 12, 27, 324, 'close', 22),
(8, '2021-02-01 07:44:20', 'AMSTEL BOCK', 2, 24, 48, 'close', 1),
(9, '2021-02-25 09:29:16', 'COCA ZERO PF', 2, 27, 54, 'close', 22),
(10, '2021-02-25 09:32:27', 'COCA ZERO PF', 2, 27, 54, 'close', 22),
(13, '2021-03-03 07:34:20', 'AMSTEL BOCK', 2, 24000, 48000, 'close', 1),
(14, '2021-03-09 05:43:11', 'CELAR COSK PF', 1, 0, 0, 'close', 46),
(15, '2021-03-11 20:09:02', 'AMSTEL BOCK', 2, 24000, 48000, 'close', 1),
(17, '2021-03-17 00:07:48', 'CELAR COSK GF', 1, 26000, 26000, 'close', 45),
(18, '2021-03-17 16:43:23', 'MUSCADOR', 1, 0, 0, 'close', 38),
(19, '2021-03-17 16:45:49', 'COCA ZERO PF', 3, 27, 81, 'close', 22),
(20, '2021-03-17 16:47:35', 'COCA ZERO PF', 1, 27, 27, 'close', 22),
(21, '2021-03-17 16:49:33', 'COCA ZERO PF', 2, 27, 54, 'close', 22),
(22, '2021-03-17 16:50:15', 'SUCRES PF', 3, 0, 0, 'close', 23),
(23, '2021-03-17 16:51:02', 'CELAR COSK GF', 2, 26000, 52000, 'close', 45),
(24, '2021-03-17 17:06:07', 'KING FISH', 1, 0, 0, 'close', 29);

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
(1, 'Buvette'),
(2, 'Night Club');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Contenu de la table `prodboiss`
--

INSERT INTO `prodboiss` (`idBoiss`, `designBoiss`, `qnteBoiss`, `nbUniteBoiss`, `valUnitBoiss`, `paBoiss`, `puBoiss`, `paCasier`, `pvCasier`, `idCatBoiss`) VALUES
(1, 'AMSTEL BOCK', 20, 12, 204, 2000, 2500, 20000, 24000, 1),
(2, 'AMSTEL BEER', 13, 12, 156, 2.5, 3, 30, 34, 1),
(3, 'CASTEL BEER', 0, 12, 0, 2, 3, 0, 0, 1),
(4, 'DOPEL', 0, 12, 0, 2, 3, 0, 0, 1),
(5, 'GUINESS', 0, 6, 0, 3, 4, 0, 0, 1),
(6, 'LEGENDE', 1, 20, 20, 1.5, 2, 0, 0, 1),
(7, 'BAVARIA', 0, 6, 0, 2, 3, 0, 0, 1),
(8, 'ROYAL BURUNDI', 0, 20, 0, 2, 3, 0, 0, 1),
(9, 'HEINEKEN', 0, 24, 0, 2, 3, 0, 0, 1),
(10, 'MITZING GF', 0, 12, 0, 2, 3, 0, 0, 1),
(11, 'PRIMUS BURUNDI PF', 0, 12, 0, 1.5, 2, 0, 0, 1),
(12, 'PRIMUS BURUNDI GF', 1, 20, 20, 2, 3, 0, 0, 1),
(13, 'SIMBA', 0, 12, 0, 2, 3, 0, 0, 1),
(14, 'SKOL', 0, 12, 0, 2, 3, 0, 0, 1),
(15, 'SUPER BOCK', 0, 12, 0, 2, 3, 0, 0, 1),
(16, 'TEMBO', 0, 12, 0, 2, 3, 0, 0, 1),
(17, 'TURBO KING GF', 1, 12, 12, 2, 3, 0, 0, 1),
(18, 'TURBO KING PF', 1, 20, 20, 1.5, 2, 0, 0, 1),
(22, 'COCA ZERO PF', 73, 24, 1752, 1, 1.5, 24, 27, 2),
(23, 'SUCRES PF', 45, 24, 1080, 1, 1.5, 0, 0, 2),
(24, 'SUCRES GF', 0, 20, 0, 1.5, 2, 0, 0, 2),
(28, 'RED BULL', 0, 4, 0, 2, 2.5, 0, 0, 3),
(29, 'KING FISH', 3, 6, 18, 2, 3, 0, 0, 3),
(30, 'TANGAWIZI', 4, 20, 80, 1.5, 2, 0, 0, 3),
(31, 'ENERGY MALT', 2, 20, 40, 1.5, 2, 0, 0, 3),
(32, 'LAIT YAOURT', 0, 6, 0, 1, 1.5, 0, 0, 3),
(33, 'EAU KINJU 0.6L', 0, 12, 0, 1, 1.5, 0, 0, 4),
(34, 'EAU GAZEUSE 0.5L', 0, 12, 0, 1, 1.5, 0, 0, 4),
(35, 'JUS DE FRUIT ', 0, 0, 0, 2, 2.5, 0, 0, 5),
(36, 'NEDERBURG ROSE', 0, 4, 0, 25, 30, 0, 0, 7),
(37, 'ROSE D''ANJOU', 0, 4, 0, 25, 30, 0, 0, 7),
(38, 'MUSCADOR', 1, 1, 1, 23, 25, 0, 0, 7),
(39, 'CHANDOR', 1, 1, 1, 23, 25, 0, 0, 7),
(40, 'NEDERBURG CHARDON', 0, 4, 0, 25, 30, 0, 0, 8),
(41, 'BARON D''AROGNAC', 1, 1, 1, 32, 35, 0, 0, 8),
(42, 'MARTINI BLANC', 1, 1, 1, 25, 30, 0, 0, 8),
(43, 'DROSDY GF', 2, 2, 4, 17, 20, 0, 0, 9),
(44, 'DROSDY PF', 3, 2, 6, 8, 10, 0, 0, 9),
(45, 'CELAR COSK GF', 13, 1, 13, 2000, 2600, 20000, 26000, 9),
(46, 'CELAR COSK PF', 2, 1, 2, 8, 10, 0, 0, 9),
(47, 'VIN DE MESSE', 0, 1, 0, 25, 30, 0, 0, 9),
(48, 'NEDERBURG CABERNET ', 0, 1, 0, 32, 35, 0, 0, 9),
(49, 'VIN CARNIS', 0, 1, 0, 32, 35, 0, 0, 9),
(50, 'FOUR COUSINS', 0, 1, 0, 30, 40, 0, 0, 9),
(51, 'MARTINI ROUGE', 0, 1, 0, 25, 30, 0, 0, 9),
(52, 'CHAMPAGNE AVEC ALCOOL', 0, 1, 0, 25, 30, 0, 0, 10),
(53, 'JC LE ROUX BRUN GRD', 0, 1, 0, 25, 30, 0, 0, 10),
(54, 'JC LE ROUX ROSE', 0, 1, 0, 25, 30, 0, 0, 10),
(55, 'LAURENT PERRIER BRUT', 0, 1, 0, 100, 120, 0, 0, 11),
(56, 'MOET ET CHANDON BRUT', 0, 1, 0, 100, 120, 0, 0, 11),
(57, 'AMARULA GF', 1, 1, 1, 30, 40, 0, 0, 12),
(58, 'AMARULA PF', 0, 1, 0, 17, 20, 0, 0, 12),
(59, 'RED LABEL', 0, 1, 0, 46, 50, 0, 0, 12),
(60, 'BLACK LABEL', 0, 1, 0, 0, 70, 0, 0, 12),
(61, 'DOUBLE BLACK ', 0, 1, 0, 0, 90, 0, 0, 12),
(62, 'JACK DANIEL', 0, 1, 0, 3, 4.5, 0, 0, 12),
(63, 'CHIVAS', 1, 1, 1, 3, 4.5, 0, 0, 12),
(64, 'KWV', 0, 1, 0, 3, 4.5, 0, 0, 12),
(65, 'GIN GORDON', 0, 1, 0, 2, 2.5, 0, 0, 12),
(66, 'KING ROBERT', 0, 1, 0, 2, 2.5, 0, 0, 12),
(67, 'HUNTERS CHOICE', 0, 1, 0, 1.5, 2, 0, 0, 12),
(68, 'J&B', 0, 1, 0, 2, 2.5, 0, 0, 12),
(69, 'VODKA', 0, 1, 0, 2, 3, 0, 0, 12),
(70, 'RICHARD', 0, 1, 0, 2, 3, 0, 0, 12),
(71, 'COGNAC', 0, 1, 0, 2, 3, 0, 0, 13),
(72, 'KAVALDOR', 0, 1, 0, 2, 3, 0, 0, 13),
(73, 'CAPPUCCINNO', 0, 1, 0, 2, 3, 0, 0, 14),
(74, 'CAFFE EXPRESSO', 0, 1, 0, 2, 3, 0, 0, 14),
(75, 'CHOCOLAT CHAUD', 0, 1, 0, 2, 3, 0, 0, 14),
(76, 'BLACK LABEL M', 1, 25, 25, 3, 4, 0, 0, 12),
(77, 'DOUBLE BLACK M', 0, 25, 0, 3, 4.5, 0, 0, 12),
(78, 'JACK DANIEL M', 0, 25, 0, 3, 4.5, 0, 0, 12),
(79, 'CHIVAS M', 1, 25, 25, 3, 4.5, 0, 0, 12),
(80, 'KWV M', 0, 25, 0, 3, 4.5, 0, 0, 12),
(81, 'GIN GORDON M', 0, 25, 0, 2, 2.5, 0, 0, 12),
(82, 'KING ROBERT M', 0, 25, 0, 2, 2.5, 0, 0, 12),
(83, 'HUNTERS CHOICE M ', 0, 25, 0, 1.5, 2, 0, 0, 12),
(84, 'J&B M', 0, 25, 0, 2, 2.5, 0, 0, 12),
(85, 'VODKA M', 0, 25, 0, 2, 3, 0, 0, 12),
(86, 'RICHARD M', 0, 25, 0, 2, 3, 0, 0, 12),
(87, 'COGNAC M', 0, 25, 0, 2, 3, 0, 0, 13),
(88, 'KAVALDOR M', 0, 25, 0, 2, 3, 0, 0, 13),
(89, 'PRIMUS GF', 0, 12, 0, 2, 3, 0, 0, 1),
(90, 'PRIMUS PF', 1, 20, 20, 1.5, 2, 0, 0, 1),
(91, 'MOUTON CADET BLANC', 0, 1, 0, 32, 35, 0, 0, 12),
(92, 'MARTINI BLANC M', 0, 25, 0, 2, 2.5, 0, 0, 8),
(93, 'RED LABEL M', 0, 25, 0, 2, 2.5, 0, 0, 12),
(94, 'ABSOLUTE CITRON', 0, 1, 0, 30, 40, 0, 0, 12),
(95, 'ABSOLUTE VODKA M', 0, 25, 0, 2, 3, 0, 0, 12),
(96, 'MITZING PF', 0, 24, 0, 1.5, 2, 0, 0, 1),
(97, 'COCA ZERO GF', 0, 12, 0, 1.5, 2, 0, 0, 2),
(98, 'JUS AFIA', 0, 12, 0, 1.5, 2, 0, 0, 6),
(99, 'ABSOLUTE CITRON M', 0, 25, 0, 2, 3, 0, 0, 12),
(100, 'SAVANA', 0, 6, 0, 3, 4, 0, 0, 1),
(101, 'ALTER WINE', 2, 1, 2, 25, 30, 0, 0, 9),
(102, 'CLASS', 10, 20, 200, 1.25, 1.5, 25, 28, 1);

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

--
-- Contenu de la table `serveur`
--

INSERT INTO `serveur` (`id_serveur`, `nom_serveur`, `sexe_serveur`, `etatCivil`, `telServeur`, `adresse`, `piece`, `numPiece`, `lieuDel`, `dateDel`, `photo`) VALUES
(2, 'Alexy', 'Masculin', 'MariÃ©', '+2430989876763', 'Burundi', 'Autre', '0210/55.413', 'Bujumbura', '2012-02-24', 'ALEXIS RESTO.jpg'),
(3, 'CLAUDE LUHUTA', 'Masculin', 'CÃ©libataire', '9098989887', 'Baraka', 'Carte d''Ã©lecteur', '620121', 'Uvira', '2017-02-26', 'CLAUDE LUHUTA.jpg'),
(4, 'Jules kamanda', 'Masculin', 'CÃ©libataire', '0989673213', 'Baraka', 'Carte d''Ã©lecteur', '097234', 'Baraka', '2021-01-04', NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Contenu de la table `sortieboiss`
--

INSERT INTO `sortieboiss` (`idSorBoiss`, `qnteSort`, `dateSort`, `idBoiss`, `idPv`, `idCom`) VALUES
(1, 1, '2020-01-04 21:56:39', 9, 1, 1),
(2, 1, '2020-01-04 21:57:29', 23, 1, 2),
(3, 1, '2020-01-04 21:57:34', 98, 1, 3),
(4, 1, '2020-01-04 21:57:39', 97, 1, 4),
(5, 1, '2020-01-04 21:57:42', 33, 1, 5),
(6, 1, '2020-01-05 16:53:37', 23, 1, 6),
(7, 1, '2020-01-05 16:53:46', 33, 1, 7),
(8, 1, '2020-01-12 14:10:29', 33, 1, 10),
(9, 1, '2020-01-12 14:28:02', 28, 1, 12),
(10, 1, '2020-01-12 14:33:59', 23, 1, 9),
(11, 1, '2020-01-12 14:38:25', 29, 1, 11),
(12, 1, '2020-01-13 08:04:29', 10, 1, 15),
(13, 1, '2020-01-13 08:04:47', 100, 1, 16),
(14, 1, '2020-01-13 08:05:01', 28, 1, 18),
(15, 1, '2020-01-13 08:05:10', 8, 1, 19),
(16, 1, '2020-01-13 08:05:17', 24, 1, 17),
(17, 1, '2020-01-13 08:45:44', 8, 1, 20),
(18, 2, '2020-01-13 09:05:12', 33, 1, 24),
(19, 4, '2020-01-14 21:28:06', 33, 1, 31),
(20, 1, '2020-01-17 12:59:16', 58, 1, 38),
(21, 1, '2020-01-17 12:59:28', 34, 1, 35),
(22, 1, '2020-01-17 12:59:36', 33, 1, 34),
(23, 1, '2020-01-17 13:57:00', 23, 1, 33),
(24, 2, '2020-01-18 10:14:32', 33, 1, 40),
(25, 2, '2020-01-20 19:59:24', 33, 1, 45),
(26, 2, '2020-01-21 17:19:55', 33, 1, 47),
(27, 1, '2020-01-21 17:20:19', 23, 1, 48),
(28, 1, '2020-01-21 17:20:27', 2, 1, 46),
(29, 1, '2020-01-22 10:01:28', 33, 1, 52),
(30, 1, '2020-01-23 14:54:15', 24, 1, 41),
(31, 1, '2020-01-23 14:54:23', 2, 1, 42),
(32, 1, '2020-01-23 14:54:41', 33, 1, 55),
(33, 1, '2020-01-23 14:58:13', 98, 1, 68),
(34, 2, '2020-01-23 15:11:09', 33, 1, 53),
(35, 2, '2021-01-11 19:30:56', 23, 1, 71),
(36, 10, '2021-01-11 19:40:11', 22, 1, 72);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `sortiecaisse`
--

INSERT INTO `sortiecaisse` (`idSortieCaiss`, `montantSortie`, `catCharge`, `motifSortie`, `dateSortie`, `agent`) VALUES
(1, 50, ' Eau', ' Eau', '2021-01-20 07:08:32', 'Antoine'),
(2, 22, ' Carburant', ' Carburant', '2021-01-20 07:28:47', 'Placide'),
(3, 40, 'Autres Charges', 'Transfert Admin', '2021-01-22 15:08:10', 'Antoine'),
(4, 500, 'Autres Charges', 'Transport Gerant', '2021-03-06 12:53:10', 'Jules');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `stock_init`
--

INSERT INTO `stock_init` (`id`, `dateStock`, `idBoiss`, `qnteSt`) VALUES
(1, '2021-01-11', 22, 0),
(2, '2021-01-11', 1, 30),
(4, '2021-01-11', 23, 0),
(6, '2021-01-25', 22, 95),
(7, '2021-01-28', 2, 10),
(8, '2021-02-01', 1, 26),
(9, '2021-02-25', 22, 83),
(10, '2021-03-03', 1, 24),
(11, '2021-03-09', 46, 3),
(12, '2021-03-11', 1, 22),
(13, '2021-03-16', 52, 0),
(14, '2021-03-16', 45, 2),
(15, '2021-03-17', 45, 11),
(16, '2021-03-17', 38, 2),
(17, '2021-03-17', 22, 79),
(18, '2021-03-17', 23, 48),
(19, '2021-03-17', 29, 4);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `stock_init_buv`
--

INSERT INTO `stock_init_buv` (`id`, `dateStock`, `idBoiss`, `qnteSt`) VALUES
(1, '2021-01-26', 1, 13),
(2, '2021-01-26', 3, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Contenu de la table `stockpv`
--

INSERT INTO `stockpv` (`idstock`, `qtStock`, `prixdevente`, `idPv`, `idBoiss`) VALUES
(1, 12, 0, 1, 1),
(2, 10, 0, 1, 2),
(3, 5, 0, 1, 3),
(4, 0, 0, 1, 4),
(5, 0, 0, 1, 5),
(6, 6, 0, 1, 6),
(7, 6, 0, 1, 7),
(8, 9, 0, 1, 8),
(9, 19, 0, 1, 9),
(10, 9, 0, 1, 10),
(11, 0, 0, 1, 11),
(12, 17, 0, 1, 12),
(13, 0, 0, 1, 13),
(14, 0, 0, 1, 14),
(15, 9, 0, 1, 15),
(16, 0, 0, 1, 16),
(17, 3, 0, 1, 17),
(18, 9, 0, 1, 18),
(22, 238, 0, 1, 22),
(23, 65, 0, 1, 23),
(24, 15, 0, 1, 24),
(28, 4, 0, 1, 28),
(29, 0, 0, 1, 29),
(30, 15, 0, 1, 30),
(31, 24, 0, 1, 31),
(32, 0, 0, 1, 32),
(33, 0, 0, 1, 33),
(34, 9, 0, 1, 34),
(35, 0, 0, 1, 35),
(36, 0, 0, 1, 36),
(37, 0, 0, 1, 37),
(38, 0, 0, 1, 38),
(39, 1, 0, 1, 39),
(40, 0, 0, 1, 40),
(41, 1, 0, 1, 41),
(42, 0, 0, 1, 42),
(43, 1, 0, 1, 43),
(44, 1, 0, 1, 44),
(45, 2, 0, 1, 45),
(46, 2, 0, 1, 46),
(47, 0, 0, 1, 47),
(48, 0, 0, 1, 48),
(49, 0, 0, 1, 49),
(50, 0, 0, 1, 50),
(51, 0, 0, 1, 51),
(52, 0, 0, 1, 52),
(53, 0, 0, 1, 53),
(54, 0, 0, 1, 54),
(55, 0, 0, 1, 55),
(56, 1, 0, 1, 56),
(57, 1, 0, 1, 57),
(58, 1, 0, 1, 58),
(59, 0, 0, 1, 59),
(60, 0, 0, 1, 60),
(61, 0, 0, 1, 61),
(62, 0, 0, 1, 62),
(63, 0, 0, 1, 63),
(64, 0, 0, 1, 64),
(65, 0, 0, 1, 65),
(66, 0, 0, 1, 66),
(67, 0, 0, 1, 67),
(68, 0, 0, 1, 68),
(69, 0, 0, 1, 69),
(70, 0, 0, 1, 70),
(71, 24, 0, 1, 76),
(72, 18, 0, 1, 77),
(73, 18, 0, 1, 78),
(74, 13, 0, 1, 79),
(75, 15, 0, 1, 80),
(76, 19, 0, 1, 81),
(77, 0, 0, 1, 82),
(78, 0, 0, 1, 83),
(79, 2, 0, 1, 84),
(80, 0, 0, 1, 85),
(81, 0, 0, 1, 86),
(82, 0, 0, 1, 71),
(83, 0, 0, 1, 72),
(84, 0, 0, 1, 87),
(85, 0, 0, 1, 88),
(86, 0, 0, 1, 73),
(87, 0, 0, 1, 74),
(88, 0, 0, 1, 75),
(89, 7, 0, 1, 89),
(90, 17, 0, 1, 90),
(91, 1, 0, 1, 91),
(92, 16, 0, 1, 92),
(93, 1, 0, 1, 94),
(94, 0, 0, 1, 93),
(95, 7, 0, 1, 95),
(96, 0, 0, 1, 99),
(97, 9, 0, 1, 98),
(98, 4, 0, 1, 97),
(99, 13, 0, 1, 96),
(100, 5, 0, 1, 100),
(101, 1, 0, 1, 101),
(102, 15, 0, 2, 1);

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

--
-- Contenu de la table `tablepv`
--

INSERT INTO `tablepv` (`idTable`, `designTable`, `zone`) VALUES
(1, 'T01', 'droite du resto'),
(2, ' T02', 'Gauche'),
(3, 'T03', 'Gauche'),
(4, 'T04', 'droite du resto'),
(5, 'T05', 'droite du resto'),
(6, 'T06', 'droite du resto'),
(7, 'T07', 'droite du resto'),
(8, 'T08', 'droite du resto'),
(9, 'T09', 'droite du resto'),
(10, 'T10', 'Terrasse'),
(11, 'T11', 'Terrasse'),
(12, 'T12', 'Terrasse'),
(13, 'T13', 'Terrasse'),
(14, 'T14', 'Terrasse'),
(15, 'T15', 'Terrasse'),
(16, 'T16', 'Terrasse'),
(17, 'T17', 'Terrasse'),
(18, 'T18', 'Terrasse'),
(19, 'T19', 'Terrasse'),
(20, 'T20', 'Terrasse'),
(21, 'T21', 'Paillote'),
(22, 'T22', 'Paillote'),
(23, 'T24', 'Paillote'),
(24, 'T23', 'Paillote');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `user_function`, `user_name`, `user_sex`, `user_add_date`, `user_phone`, `user_email`, `user_address`, `mdp_user`) VALUES
(1, 'Chef_Depot_Relais', 'donatien', 'Masculin', '2019-12-13 23:00:00', '0974042469', NULL, 'Kavinvira', 'cpt1234'),
(2, 'Admin', 'Moussa', 'm', '2019-12-13 23:00:00', NULL, NULL, NULL, 'admin'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `ventedepot`
--

INSERT INTO `ventedepot` (`id`, `designBoiss`, `qteVendu`, `prixVente`, `ptVente`, `beneficeCasier`, `idBoissVend`, `dateVente`, `destination`) VALUES
(1, 'AMSTEL BOCK', 5, 2, 10, 1.6666666666665, 1, '2021-02-10', ''),
(2, 'AMSTEL BEER', 1, 3, 3, 0.5, 2, '2021-01-11', ''),
(3, 'COCA ZERO PF', 5, 27, 135, 130, 22, '2021-01-11', ''),
(4, 'COCA ZERO PF', 12, 27, 324, 312, 22, '2021-02-01', ''),
(5, 'AMSTEL BOCK', 2, 24, 48, 44.666666666667, 1, '2021-02-01', ''),
(6, 'COCA ZERO PF', 2, 27, 54, 52, 22, '2021-02-25', ''),
(7, 'COCA ZERO PF', 2, 27, 54, 6, 22, '2021-02-25', ''),
(8, 'AMSTEL BOCK', 2, 24000, 48000, 8000, 1, '2021-03-06', ''),
(9, 'CELAR COSK PF', 1, 0, 0, 0, 46, '2021-03-09', ''),
(10, 'AMSTEL BOCK', 2, 24000, 48000, 8000, 1, '2021-03-14', ''),
(11, 'CELAR COSK GF', 1, 26000, 26000, 6000, 45, '2021-03-17', ''),
(12, 'COCA ZERO PF', 2, 27, 54, 6, 22, '2021-03-17', 'CLIENT D''HONNEUR'),
(13, 'SUCRES PF', 3, 0, 0, 0, 23, '2021-03-17', 'DEPOT RELAIS'),
(14, 'CELAR COSK GF', 2, 26000, 52000, 12000, 45, '2021-03-17', 'DEPOT RELAIS'),
(15, 'KING FISH', 1, 0, 0, 0, 29, '2021-03-17', 'BUVETTE');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `ventepdv`
--

INSERT INTO `ventepdv` (`id`, `designBoiss`, `qteVendu`, `prixVente`, `ptVente`, `beneficeBouteille`, `idBoissVend`, `dateVente`, `idPvente`) VALUES
(1, 'COCA ZERO PF', 2, 1.5, 3, 1, 22, '2021-02-03', 1),
(2, 'SUCRES PF', 1, 1.5, 1.5, 0.5, 23, '2021-01-22', 1),
(3, 'AMSTEL BOCK', 2, 2500, 5000, 1000, 1, '2021-03-06', 1);

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
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idOrg`) REFERENCES `organisation` (`idOrg`);

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
-- Contraintes pour la table `creance`
--
ALTER TABLE `creance`
  ADD CONSTRAINT `creance_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `dettefour`
--
ALTER TABLE `dettefour`
  ADD CONSTRAINT `dettefour_ibfk_1` FOREIGN KEY (`idFour`) REFERENCES `four` (`idFour`);

--
-- Contraintes pour la table `facturation`
--
ALTER TABLE `facturation`
  ADD CONSTRAINT `facturation_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

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
  ADD CONSTRAINT `prodboiss_ibfk_1` FOREIGN KEY (`idCatBoiss`) REFERENCES `catboiss` (`idCatBoiss`);

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
