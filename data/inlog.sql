-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 18 mei 2022 om 22:44
-- Serverversie: 10.4.21-MariaDB
-- PHP-versie: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inlog`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `assets`
--

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `uploaderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(9, 1, 4, NULL, 'Schermafbeelding-2021-09-08-om-09.29.27.png', 'image', 611, 765, 595597, NULL, NULL, NULL, '2021-09-21 10:13:42', '2021-09-21 10:13:42', '2021-09-21 10:13:42', 'e3a9fcaf-2795-4209-bd57-40d511ea5d8b'),
(12, 1, 4, 1, 'xp.jpeg', 'image', 3840, 2160, 708738, NULL, NULL, NULL, '2021-09-21 14:16:20', '2021-09-21 13:23:20', '2021-09-21 14:16:20', '55ad1fda-4c50-41cc-9bbe-a0495bff651e');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `assettransformindex`
--

INSERT INTO `assettransformindex` (`id`, `assetId`, `filename`, `format`, `location`, `volumeId`, `fileExists`, `inProgress`, `error`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 9, 'Schermafbeelding-2021-09-08-om-09.29.27.png', NULL, '_150x150_crop_center-center_none', 1, 1, 0, 0, '2021-09-21 10:13:44', '2021-09-21 10:13:44', '2021-09-21 10:13:44', 'ec31a262-696f-4d3a-aa2c-3f56b9c58f8c'),
(2, 9, 'Schermafbeelding-2021-09-08-om-09.29.27.png', NULL, '_100x150_crop_center-center_none', 1, 1, 0, 0, '2021-09-21 12:20:37', '2021-09-21 12:20:37', '2021-09-21 12:20:38', '0a2bb2cd-2ab9-4511-bf5f-69f07ad224b9'),
(3, 9, 'Schermafbeelding-2021-09-08-om-09.29.27.png', NULL, '_100xAUTO_crop_center-center_none', 1, 1, 0, 0, '2021-09-21 12:25:51', '2021-09-21 12:25:51', '2021-09-21 12:25:52', '1c8221d0-f449-4a3e-89c1-ea1cdb4bef8d'),
(4, 9, 'Schermafbeelding-2021-09-08-om-09.29.27.png', NULL, '_200xAUTO_crop_center-center_none', 1, 1, 0, 0, '2021-09-21 12:27:05', '2021-09-21 12:27:05', '2021-09-21 12:27:05', 'bf6c1508-abad-4e07-8127-193cf530b86b'),
(7, 12, 'xp.jpeg', NULL, '_200xAUTO_crop_center-center_none', 1, 1, 0, 0, '2021-09-21 14:16:26', '2021-09-21 14:16:26', '2021-09-21 14:16:27', '269863d3-78bd-4fac-8aba-800a6e082ef7');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `changedattributes`
--

INSERT INTO `changedattributes` (`elementId`, `siteId`, `attribute`, `dateUpdated`, `propagated`, `userId`) VALUES
(1, 1, 'fieldLayoutId', '2021-09-21 13:23:18', 0, 1),
(1, 1, 'firstName', '2021-09-21 13:23:18', 0, 1),
(1, 1, 'lastName', '2021-09-21 13:23:18', 0, 1),
(1, 1, 'photoId', '2021-09-21 13:23:20', 0, 1),
(4, 1, 'firstName', '2021-09-20 14:57:59', 0, 1),
(8, 1, 'lastName', '2021-09-21 14:49:48', 0, 8),
(8, 1, 'lastPasswordChangeDate', '2021-09-21 09:25:51', 0, 8),
(8, 1, 'password', '2021-09-21 09:25:51', 0, 8),
(8, 1, 'photoId', '2021-09-21 10:13:42', 0, 8),
(8, 1, 'username', '2021-09-21 14:28:54', 0, 8),
(8, 1, 'verificationCode', '2021-09-21 09:25:51', 0, 8),
(8, 1, 'verificationCodeIssuedDate', '2021-09-21 09:25:51', 0, 8),
(10, 1, 'slug', '2021-09-21 11:26:08', 0, 1),
(10, 1, 'title', '2021-09-21 11:26:08', 0, 1),
(10, 1, 'uri', '2021-09-21 11:26:08', 0, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `changedfields`
--

INSERT INTO `changedfields` (`elementId`, `siteId`, `fieldId`, `dateUpdated`, `propagated`, `userId`) VALUES
(1, 1, 7, '2021-09-21 14:16:16', 0, 1),
(8, 1, 7, '2021-09-21 14:49:48', 0, 8),
(10, 1, 7, '2021-09-21 11:26:10', 0, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_text_dpxzvzre` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_video_judhyjmq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_bio_ppdudzrb` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_text_dpxzvzre`, `field_video_judhyjmq`, `field_bio_ppdudzrb`) VALUES
(1, 1, 1, NULL, '2021-09-17 14:43:43', '2021-09-21 14:16:16', 'aff5ef6b-3194-4ab5-ab6a-3fd6aa5bc653', NULL, NULL, NULL),
(2, 2, 1, NULL, '2021-09-20 14:07:46', '2021-09-20 14:10:01', 'cb8859b0-fb69-49b6-8c6b-a1a5b425eb2d', NULL, NULL, NULL),
(3, 3, 1, NULL, '2021-09-20 14:35:34', '2021-09-20 14:36:03', 'b7b57a7a-597c-4f86-ba27-ee26eabae561', NULL, NULL, NULL),
(4, 4, 1, NULL, '2021-09-20 14:57:27', '2021-09-20 14:59:54', 'f3eba040-620b-43f9-bd3f-2a08a02d7b6a', NULL, NULL, NULL),
(5, 5, 1, NULL, '2021-09-20 15:20:40', '2021-09-20 15:24:22', '3baa2d8f-33d1-40ea-8147-8428dd2c93eb', NULL, NULL, NULL),
(6, 6, 1, NULL, '2021-09-20 15:25:55', '2021-09-20 15:25:55', '450683b7-4e1e-40c9-a4a2-3038ed2526c6', NULL, NULL, NULL),
(7, 7, 1, NULL, '2021-09-20 15:26:35', '2021-09-20 15:26:35', '4aab87cb-e4c8-40eb-aef1-098dc09f5521', NULL, NULL, NULL),
(8, 8, 1, NULL, '2021-09-21 07:30:26', '2021-09-21 14:49:47', 'fb8cf3ac-0950-4672-834a-7517e4360e75', NULL, NULL, NULL),
(9, 9, 1, 'Schermafbeelding 2021 09 08 om 09 29 27', '2021-09-21 10:13:41', '2021-09-21 10:13:41', '697afcc0-90b9-4c14-b96a-62efb23c06c6', NULL, NULL, NULL),
(10, 10, 1, 'Bob', '2021-09-21 11:26:03', '2021-09-21 11:26:11', '7bd99af6-4b66-4fe5-a2e6-3a006d0461b2', NULL, NULL, '<p>fff</p>'),
(11, 11, 1, 'Bob', '2021-09-21 11:26:11', '2021-09-21 11:26:11', '7275e9df-b2ca-484d-80da-494f894edf0c', NULL, NULL, '<p>fff</p>'),
(12, 12, 1, 'Kiryu Chan', '2021-09-21 13:23:18', '2021-09-21 14:16:16', 'fb9aa23a-0852-4512-8826-15dc30c5db22', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elementindexsettings`
--

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft\\elements\\User', '{\"sources\":{\"group:d3315dc2-f048-4bbf-be48-94be8ea6f29d\":{\"tableAttributes\":{\"1\":\"fullName\",\"2\":\"email\",\"3\":\"dateCreated\",\"4\":\"username\",\"5\":\"lastLoginDate\"}}}}', '2021-09-20 15:03:49', '2021-09-20 15:03:49', '32ed712b-6271-4543-9820-adaee658885c');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 4, 'craft\\elements\\User', 1, 0, '2021-09-17 14:43:43', '2021-09-21 14:16:16', NULL, NULL, '2f2a528a-a3a4-41e6-9a4b-9bebc618cd8a'),
(2, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-09-20 14:07:46', '2021-09-20 14:10:01', NULL, '2021-09-20 14:32:54', '2cda084d-a95a-4a1c-9a37-b46fdd10de98'),
(3, NULL, NULL, NULL, 4, 'craft\\elements\\User', 1, 0, '2021-09-20 14:35:34', '2021-09-20 14:36:03', NULL, '2021-09-20 14:56:53', '9b2518d0-9cb5-4b60-825e-a5f910298ff8'),
(4, NULL, NULL, NULL, 4, 'craft\\elements\\User', 1, 0, '2021-09-20 14:57:27', '2021-09-20 14:59:54', NULL, '2021-09-20 15:15:59', 'b7b0c6ae-5682-4729-8734-db1ca1279ceb'),
(5, NULL, NULL, NULL, 4, 'craft\\elements\\User', 1, 0, '2021-09-20 15:20:40', '2021-09-20 15:24:22', NULL, '2021-09-20 15:25:10', '9cfe015a-059e-4969-8f0b-0966eb6a26e8'),
(6, NULL, NULL, NULL, 4, 'craft\\elements\\User', 1, 0, '2021-09-20 15:25:55', '2021-09-20 15:25:55', NULL, '2021-09-20 15:26:24', '2a254b68-8f69-4992-a646-2b95a4967290'),
(7, NULL, NULL, NULL, 4, 'craft\\elements\\User', 1, 0, '2021-09-20 15:26:35', '2021-09-20 15:26:35', NULL, '2021-09-21 07:27:47', '167038a0-b74e-45eb-a75f-e6482af13c50'),
(8, NULL, NULL, NULL, 4, 'craft\\elements\\User', 1, 0, '2021-09-21 07:30:26', '2021-09-21 14:49:47', NULL, NULL, '59f02359-0d63-412a-b1ee-0a146bb2f801'),
(9, NULL, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2021-09-21 10:13:41', '2021-09-21 10:13:41', NULL, NULL, 'fc17c330-787a-4f32-b490-2d45d512949a'),
(10, NULL, NULL, NULL, 3, 'craft\\elements\\Entry', 1, 0, '2021-09-21 11:26:03', '2021-09-21 11:26:11', NULL, '2021-09-21 11:26:50', 'f36a38b3-d9bd-4be2-8009-7ae044f0b0b7'),
(11, 10, NULL, 1, 3, 'craft\\elements\\Entry', 1, 0, '2021-09-21 11:26:11', '2021-09-21 11:26:11', NULL, '2021-09-21 11:26:50', '55a5544c-22ae-4959-9c34-1787f499bdcf'),
(12, NULL, NULL, NULL, 1, 'craft\\elements\\Asset', 1, 0, '2021-09-21 13:23:18', '2021-09-21 14:16:16', NULL, NULL, '972ae395-3355-4050-a466-57cd6aca7456');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-09-17 14:43:43', '2021-09-17 14:43:43', '3fa2cdad-e534-474f-b20c-5af379d2154e'),
(2, 2, 1, NULL, NULL, 1, '2021-09-20 14:07:46', '2021-09-20 14:07:46', '03eaae98-f5cd-4db1-9ed7-4142de52d07a'),
(3, 3, 1, NULL, NULL, 1, '2021-09-20 14:35:34', '2021-09-20 14:35:34', '66ccdd71-30dd-4e27-b5ca-ea95ed84da7e'),
(4, 4, 1, NULL, NULL, 1, '2021-09-20 14:57:27', '2021-09-20 14:57:27', '81fa189d-79ef-4aeb-bbb4-5d6ad63db6c5'),
(5, 5, 1, NULL, NULL, 1, '2021-09-20 15:20:40', '2021-09-20 15:20:40', 'cd476d5b-3a8f-458d-b6d3-7af77cd2ca83'),
(6, 6, 1, NULL, NULL, 1, '2021-09-20 15:25:55', '2021-09-20 15:25:55', '61f0d95d-93f7-4e44-94d2-c63affbba5c6'),
(7, 7, 1, NULL, NULL, 1, '2021-09-20 15:26:35', '2021-09-20 15:26:35', '82d02451-7b20-40dc-93e7-98d2bac6ff72'),
(8, 8, 1, NULL, NULL, 1, '2021-09-21 07:30:26', '2021-09-21 07:30:26', '489a09db-6c9d-4a00-8344-9da978b54cff'),
(9, 9, 1, NULL, NULL, 1, '2021-09-21 10:13:41', '2021-09-21 10:13:41', '3e559ef6-cecd-4e1b-b7db-ada1ba8988a5'),
(10, 10, 1, 'bob', 'users/bob', 1, '2021-09-21 11:26:03', '2021-09-21 11:26:08', 'a2c85c31-72a1-44a5-ad9e-231c014e2cc5'),
(11, 11, 1, 'bob', 'users/bob', 1, '2021-09-21 11:26:11', '2021-09-21 11:26:11', '549af377-46d9-44d4-9510-5dc577eebd45'),
(12, 12, 1, NULL, NULL, 1, '2021-09-21 13:23:18', '2021-09-21 13:23:18', 'fdff7695-2f2d-4fe4-952d-4d07e5960da4');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entries`
--

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(10, 2, NULL, 2, 1, '2021-09-21 11:26:00', NULL, 0, '2021-09-21 11:26:03', '2021-09-21 11:26:03', '4538ff3d-cc3a-41aa-9174-6772155bf74d'),
(11, 2, NULL, 2, 1, '2021-09-21 11:26:00', NULL, NULL, '2021-09-21 11:26:11', '2021-09-21 11:26:11', '2ed65f14-9b0e-44dd-9ac9-b7485b2196b8');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `entrytypes`
--

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 2, 'Standaard', 'default', 1, 'site', NULL, NULL, 1, '2021-09-17 15:00:40', '2021-09-17 15:00:40', NULL, '8162203a-8882-4748-9e2a-642a0b8870df'),
(2, 2, 3, 'Standaard', 'default', 1, 'site', NULL, NULL, 1, '2021-09-20 07:32:27', '2021-09-20 07:32:27', NULL, '57ad1d88-5e68-4049-ad0d-5b79454b07d1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-09-17 14:43:42', '2021-09-17 14:43:42', NULL, 'c3f14eba-924f-40e8-bd6f-75ee2f3e46a2'),
(2, 'user', '2021-09-20 07:32:54', '2021-09-20 07:32:54', NULL, 'c8db6649-4212-42fa-9616-5358a9574856'),
(3, 'blogpost', '2021-09-20 07:32:58', '2021-09-20 07:32:58', NULL, 'acdcf546-192b-4c80-8385-2b814525e484');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fieldlayoutfields`
--

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 2, 8, 3, 0, 1, '2021-09-20 08:37:34', '2021-09-20 08:37:34', 'dfb48f8a-5323-482e-b2aa-ef54983d68f8'),
(4, 2, 8, 4, 0, 2, '2021-09-20 08:37:34', '2021-09-20 08:37:34', '3189f622-9a3e-479b-bf89-12d05e7db3c0'),
(22, 3, 12, 7, 0, 3, '2021-09-20 14:45:39', '2021-09-20 14:45:39', '75a62506-ed18-4739-a2e7-1145dde5485d'),
(29, 4, 16, 7, 0, 1, '2021-09-21 08:21:51', '2021-09-21 08:21:51', '1a5be1ad-aba4-4a39-8db5-e2655273ab5d');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fieldlayouts`
--

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft\\elements\\Asset', '2021-09-17 14:58:25', '2021-09-17 14:58:25', NULL, '71d4a218-181e-495f-a0c2-ff4dd2879264'),
(2, 'craft\\elements\\Entry', '2021-09-17 15:00:40', '2021-09-17 15:00:40', NULL, 'a7d3c70a-d36a-40aa-ba51-637f9a28ef26'),
(3, 'craft\\elements\\Entry', '2021-09-20 07:32:27', '2021-09-20 07:32:27', NULL, 'de734b26-0d2c-49af-8fa2-d521e4ff4504'),
(4, 'craft\\elements\\User', '2021-09-20 14:12:00', '2021-09-21 08:21:51', NULL, '081a596c-dd22-4fba-8b1f-0a95389011b9');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fieldlayouttabs`
--

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `elements`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(6, 1, 'Inhoud', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]', 1, '2021-09-20 08:12:40', '2021-09-20 08:12:40', 'b830c602-14fc-4b20-a583-98abfc066716'),
(8, 2, 'Inhoud', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"04302099-b1f0-4a25-8180-b8936ac35b7d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c8554b26-1fbb-4154-8f31-8ea9da472549\"}]', 1, '2021-09-20 08:37:34', '2021-09-20 08:37:34', 'b97c9108-4d4f-416d-805d-f2794c7d7d38'),
(12, 3, 'Inhoud', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":\"Titel\",\"instructions\":\"\",\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f8b6646a-dd2d-476e-917f-97b44bfcc712\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"fae7db13-6e00-4668-99bb-9afc3ac2e5a2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7\"}]', 1, '2021-09-20 14:45:39', '2021-09-20 14:45:39', 'a6ac7201-d514-42aa-b57b-cc0b85a34eb4'),
(16, 4, 'UserInfo', '[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"84b801b8-940b-4cee-b604-71342dea325d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7\"}]', 1, '2021-09-21 08:21:51', '2021-09-21 08:21:51', '53bcc722-8ba1-40bd-b876-8cac27d1b92d');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `fields`
--

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `columnSuffix`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(3, 3, 'text', 'text', 'global', 'dpxzvzre', '', 0, 'none', NULL, 'craft\\ckeditor\\Field', '{\"columnType\":\"mediumtext\",\"initJs\":null,\"purifierConfig\":\"\",\"purifyHtml\":\"1\"}', '2021-09-20 08:35:50', '2021-09-20 08:35:50', '04302099-b1f0-4a25-8180-b8936ac35b7d'),
(4, 3, 'video', 'video', 'global', 'judhyjmq', '', 0, 'none', NULL, 'craft\\fields\\Url', '{\"maxLength\":\"255\",\"placeholder\":null,\"types\":[\"url\"]}', '2021-09-20 08:36:22', '2021-09-20 08:36:22', 'c8554b26-1fbb-4154-8f31-8ea9da472549'),
(7, 2, 'bio', 'bio', 'global', 'ppdudzrb', '', 0, 'none', NULL, 'craft\\ckeditor\\Field', '{\"columnType\":\"mediumtext\",\"initJs\":null,\"purifierConfig\":\"\",\"purifyHtml\":\"1\"}', '2021-09-20 10:00:17', '2021-09-20 10:00:17', 'f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gqlschemas`
--

INSERT INTO `gqlschemas` (`id`, `name`, `scope`, `isPublic`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Schema', '[]', 1, '2021-09-17 15:04:19', '2021-09-17 15:04:19', '7e891c5b-79d1-49c9-988f-150aaa748c4d');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `gqltokens`
--

INSERT INTO `gqltokens` (`id`, `name`, `accessToken`, `enabled`, `expiryDate`, `lastUsed`, `schemaId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Public Token', '__PUBLIC__', 1, NULL, NULL, 1, '2021-09-17 15:04:19', '2021-09-17 15:04:19', '57fcb279-a217-4eff-9a90-f5f5dd55334f');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.16', '3.7.8', 0, 'faykuoqrodap', 'rgchhbdkrlct', '2021-09-17 14:43:42', '2021-10-12 09:41:29', '580fce33-d1d8-4d72-a46a-4536b0d0f93d');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '308b9930-c241-460c-b27f-cd8c4162380b'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '5a9ec5f3-e618-4cee-b7ef-f564a7cb0c11'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c2664348-48b3-453a-9b01-94b339390292'),
(4, 'craft', 'm150403_184533_field_version', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3985a12d-2420-416c-b622-59ff911a3ed4'),
(5, 'craft', 'm150403_184729_type_columns', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '4c5c7beb-4f93-407b-adc0-348dc65ac5b1'),
(6, 'craft', 'm150403_185142_volumes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '0cca2e6b-8234-47b4-a83c-8114d6605918'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '8e4b98fb-f332-4eaf-9560-c33d1b9bae5b'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd9102aa3-41da-43ee-a396-0c7f67dddd03'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b31a1410-871a-42e0-bd42-bf29a3429db5'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '72d64440-8db3-4883-8315-ad5dd99229aa'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '102fc21f-1668-46b5-936e-872c2631d17a'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b40531fd-f649-495b-b3b7-945f8f315d88'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '818d298c-87f1-4f6f-9821-b9c185aadaad'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'eb79597d-10fa-4df2-8fec-fe88a58d6959'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e77707f0-8e5c-451f-a5d4-2b46a7680c64'),
(16, 'craft', 'm151209_000000_move_logo', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e8c188d7-af7b-4d08-9f08-353ffec4f3aa'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '88fff02d-3637-4e64-9f2b-15a5c01cf2df'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3226148a-51e6-4113-8caa-c1f47800144c'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c6538385-f5c9-4b6a-9af4-c82867d336f1'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e35d400c-98a9-4ff8-bcbd-3565f588ace0'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '83c6feff-dcc9-4988-bc76-9e34f4340200'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '51af7f85-73f6-4e88-bdac-0de305cc5ba6'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ea90854a-fd7e-4205-9330-d3744e981d2b'),
(24, 'craft', 'm160807_144858_sites', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '64f2d81b-aee8-4e13-a004-12c88dcfdcce'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '61e1cb0e-57e2-4757-8d8d-4ac22be33808'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '8ad6c50c-dfab-4dd3-86a4-6024c463c7ce'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'f95b9954-4949-4f69-a63e-350cb080283d'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '13f973fd-5681-4b9a-a8df-21f83bfac3ad'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ac0a796d-164f-45e2-b6a8-a6b912773bc6'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c6344009-060f-4d5e-af84-9879dd9c3391'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '42697ae2-cbb2-4161-9e92-dea41f79e63f'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd30fbf6c-9155-4184-a2b1-ac1a6061952d'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '71582393-917e-4355-8517-843f03933b13'),
(34, 'craft', 'm161013_175052_newParentId', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3428879c-3cd0-4423-a781-1a990fcd991b'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd1eb3b03-e4c6-444c-9436-04cca31e1eb0'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '97e3bae9-698e-4108-9dbf-0ee39032d868'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '5627fad0-e2ee-4d3e-9a54-6e5b952534b2'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'feb4bbc8-df73-4279-8582-a4fbbf6d8180'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '393a1044-f331-485d-97e6-9b42ce2a0f2b'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '40783f8d-12f0-4aff-8852-8764e01a7df8'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '5e95b625-4ea7-4080-8926-839e2e47a041'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '9b7dc9d6-5cfe-415e-b44c-f1983d798d98'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '8af20971-420d-470f-ab73-4b5cb28f53b0'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ce6bf1ef-2b50-46ba-900f-9d46cd769d91'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'a895658c-31a7-43ce-add1-448941d5d362'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b4ec770d-27e5-4b56-8bad-6332cd89eeb8'),
(47, 'craft', 'm170206_142126_system_name', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3548602b-3391-44fa-9ce0-8e369a953552'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '8a9c5001-4c21-4d77-9691-056d45743097'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '0fa1ce94-9eee-4e39-a528-79609c44b63b'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '4acf89f1-a1b3-4894-b747-06e28d76149b'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd25d0519-6c60-40cc-83f2-9b2bf8cc2922'),
(52, 'craft', 'm170228_171113_system_messages', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2fbdc698-0efa-4458-b659-7e1905d62a29'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b59fd837-0d5d-4ec5-af6d-37fa6ffb0028'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '63a08649-081b-40c4-b83c-9b3c3742db78'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '073cc510-0a28-4dc3-862e-181624ae5754'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '508322f0-234b-4300-8ede-32f62ea0dedc'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e9f48738-8d98-48a3-81a5-d886c716e279'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ca39bd78-f176-4878-b077-7b9a2cc6d393'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'f23fc24a-76a0-47cd-b5b9-220f9aaa4ea4'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'cfc528dc-dad0-4a2a-9d8a-b6972d470770'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '01c89f86-759b-48de-8f98-7c48a01cfdf9'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '94dd1fa2-0b7c-4beb-8b4a-a2517db0444f'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'be026dcb-deeb-4c41-9426-047ff140f3d2'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '87c1dc52-2769-4edb-aeb5-3ebb71015bf0'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '25811867-cccc-4449-9f85-d0c61eda4bfa'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'bc8dd4c7-95c5-47e0-8039-6ea117efe973'),
(67, 'craft', 'm171011_214115_site_groups', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3fb76f19-3fd1-49a0-91ae-71af20cf19c3'),
(68, 'craft', 'm171012_151440_primary_site', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'bda9c06f-12dd-4aca-8e69-65ba8be9f0a0'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '8a1585d9-1ee0-4c89-b55c-762a33649270'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '826ca439-830f-4ca4-99a4-a029593bbe2a'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '28e3c155-43c5-432d-b341-8862e8f45935'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3da74ab3-b1e8-48c7-abec-a10e1a2088f6'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '7da3b5f1-6541-4470-8a40-80fefa346670'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '497011f3-8f65-4ac4-9a13-b200d3760689'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '394cb853-adca-4e2a-8dd6-042165d3e63d'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '1bdddc76-f834-4df3-a6aa-5be708610e23'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '9c1266af-81c1-42b4-b7f5-f4c7866551be'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3a0c285f-92a3-436e-b01d-76cdcf980779'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c0553eca-9fdb-43fd-8ef7-43eabf2273e7'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '51480253-a996-4503-89a2-5bdc39782d61'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '538bdbe3-00a0-4660-b135-7721f6be8a42'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '889ee6bc-86e3-418a-a7aa-0fdf14c2f42d'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ed8f02b5-38b8-4374-a6b2-9fb9c52fd6fa'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '28edd502-9ba5-4f63-9f3a-76b356faa151'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'f89253ec-f326-43c6-8ba3-0783ff72f392'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '9176926f-e1da-4517-95db-5aa97062a21d'),
(87, 'craft', 'm180321_233505_small_ints', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '01a82ed4-e767-499a-9f74-7666518313ff'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '936ee019-9ca9-49c5-bee8-8804d62b4bcd'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ee6695bf-d055-4ed9-acb8-5039e323e1ff'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '99a3e682-6507-4142-bae9-c2b08822f0e4'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '0074da65-6de9-476e-902a-51ac000e8b00'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '47ae65d8-37c2-4171-9ead-9d0921b7e1a1'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '47aa3662-2a03-45b0-9d1b-fe903affc80f'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '9d87f31a-9c37-4c6f-a6bc-d1c304e41359'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '044d5706-992e-4822-8782-d43ac8025999'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '0da95dd2-b7fa-4797-9930-2e02a03573f1'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'fc770e12-882f-422e-8689-10355cc67c57'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '1f641063-a16b-4b25-a9bc-380fef887db8'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '523dcf00-859f-4328-bb8b-08348ff9dcfc'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '8bc26b30-0270-48b9-a65f-ea7608cf8591'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '94288709-ae7d-4151-a793-197afd87594b'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd5a40689-e504-457b-9e85-5ab5ecbc363b'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '86a79508-5743-443b-9b31-c2f23fcfe899'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '40a63eee-f42a-4f51-a15f-2cba5daca534'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '621d0642-60de-4750-88bd-1c1e992a49de'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '283231c6-2e4e-4709-a0a2-32332b41fdfd'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'aa18dee1-dbbb-48e2-b303-a3d6b0881382'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'f10465e8-5436-4072-8439-b0ab9ccdaf41'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '37da8a43-ee2c-47a4-a2ed-f0e903b6732f'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '69972f4d-19d0-46e2-a623-11a37c7275a7'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ec9a2634-759a-47c0-97fa-3ecad70a388c'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'f391f670-6f04-4bc3-9872-0de91e5c5ae1'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'a2a2beaf-b58d-411b-a378-d3137bc9bebc'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '4713b1da-e58c-413a-b59a-6b75ff3d3bfb'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '94151a8d-a5b4-40c2-b3aa-af288fe4d971'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'a76ddd71-61dc-42fa-86bd-2462b7173662'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '4547038e-d651-4d54-81b2-f52fa59979d4'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '30a15322-6d45-4b02-816c-011725f880b6'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd344b7af-c61a-46a7-b397-e040d5ee2d29'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '9c3a411d-80b2-4187-8c29-e37ed776819a'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'be308fb3-f135-4091-8f2b-8b25a8cc4997'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '5b0885a3-4f6a-47da-9e0a-a99a17d1b824'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e18de88b-465f-4018-bef3-d354cf4307f6'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '048093a3-ff5a-441f-a580-8f8fd1d5471f'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '67763c47-2f0a-4e79-8787-01700eacb3d3'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'a72d5fda-7be0-48c1-b4d9-26387313a1c2'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2f08ecd8-8d32-41e6-8633-3a79c9bd70ab'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '3d608b96-84a9-4c07-b327-d09deb1607d3'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c7375715-3e3c-41df-b58d-421078759357'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '33bc801a-0f78-4fe5-b749-33cd474f16eb'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '6c36ae12-6e05-4d72-8fc8-4abbb9199589'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '0259947f-d02f-4547-8427-07e53d4ef386'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'de3d6960-0de1-4da2-9b6a-65757b645273'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2d19604a-2473-48cf-834a-1011d990934a'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b2516e8b-b592-4f7a-b5a4-04404f425b59'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2c7e45d6-5a9a-43bd-820b-20bc228b2b7a'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '1f55de82-9a01-4025-9e14-27309ef063b8'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c76a9938-7a9d-4af4-b199-c36d8889ca48'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '0a8bf0ae-eedd-4d8a-9fcb-29865be61626'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '21fa6367-229c-43af-ad96-8b555a943f79'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e7d8416a-149c-4163-b02e-66aa693a1f68'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '9bf6a5a8-8909-4943-b660-d09a152be5bf'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '50921e7e-10eb-482c-8c15-59417d78b691'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2480b5d2-94d8-42d4-9ed0-717d85a81337'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e7e0391d-b869-461d-846b-857d3a4cd2e6'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '94ae15a9-2a52-4ca1-b8fc-0bf4a242d280'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'bd11f18f-3c16-491b-9ceb-96d144f2b5d9'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '29d9be17-1c25-4b1c-a3be-134765c7dd6c'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '15f1acd3-3187-40b9-b699-41a6ca65fb5d'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '566d96bd-4c7e-452e-a2b1-6dfa77d9e8bb'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'bc77935c-946a-47da-bfa1-a91d7ac11dbb'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '64738222-e17c-4081-9236-39da08165369'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b1f07afa-1454-4d91-a81a-3a9f3c1f71b4'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ae1435fd-993e-44d6-8e49-3dab1761bdb8'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '7719d448-7e80-4faf-b2cf-555eed176047'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '96b3d452-f19d-4064-ab89-fad9ddc88fe8'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '41443b13-1687-4ab8-ba63-09aabc02a168'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b5226380-d0bb-4b21-ad84-64f21a7d40e0'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '8dda96e4-66c6-4a1e-bfed-d68c430c6adf'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c662a9dd-538e-45e3-9a44-afef151c885b'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ab530102-ed3c-4404-b4d1-98ba6dc12726'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'a091584a-e3ab-49fe-9eb4-9eed127b3356'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ca2f520e-db6e-45a8-8a65-fa2cd845eb67'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '5a710361-0e22-4087-89b6-c955c30d370f'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '25a97d95-8d4e-4afc-b8de-94d87574b6e0'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ec2cc1cd-fc97-4357-a326-c49e7ae381d6'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'ed173319-8694-460d-8a66-3c1ff0b1e11f'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '80b4ac80-528d-46da-9974-bb9443ba5045'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '5c11fdf0-577e-4557-805e-744e42409a38'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '93a046d9-170d-425b-b8a4-befbf8d1e04a'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '25427b48-1116-49a4-9b05-dd67dba042eb'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'dce3904c-45bc-4507-991d-ffe5d4a9ee0f'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '21b7da2a-8dc4-4c14-ac8c-7b94b8c361c5'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '21287f47-f89a-4721-adf3-1377c11ea705'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b0da2feb-3d1d-4452-b1c6-cef10844c2fd'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c64aba25-5254-4fcd-b900-077542e50f37'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd47a7c84-dc54-49c5-8d0d-dd3911175db2'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd2df5731-8df9-40a8-ba49-e2f4fb1e9be3'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'f9b5a69a-6957-46ca-b2da-4b4c2e1ba6cf'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'c5b21aed-1b92-48fd-aa39-6766b95ecb3a'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '4d54292e-582a-4162-a874-9437691dddde'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2330b005-a742-4e6f-b43b-ecb1ca64ce2e'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'e25fe271-1f06-40a0-acdb-1090238cd54b'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '95460617-86c9-4629-918e-419ec6aee97e'),
(185, 'craft', 'm210331_220322_null_author', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '09170dec-caf7-4848-a672-e702e2890662'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'f0bc1d6c-4aee-4ed7-a782-a3cac82a0a95'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'b2e0a4b2-b1cb-4113-8dd0-8b7dbb77a6f4'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '4a27d5a5-60a9-4841-be4c-c237d2d1caca'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'acc632c3-8d62-437f-b626-73acdbd833d5'),
(190, 'craft', 'm210613_184103_announcements', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '7251a96a-9e16-4e89-9bbb-1f491908159d'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-17 14:43:45', 'd8fbe972-053c-4104-9058-752d707262d6'),
(192, 'plugin:seo', 'Install', '2021-09-17 15:15:20', '2021-09-17 15:15:20', '2021-09-17 15:15:20', 'd4f61c63-cf5b-4a16-abd6-c12ecca2eaf9'),
(193, 'plugin:seo', 'm180906_152947_add_site_id_to_redirects', '2021-09-17 15:15:20', '2021-09-17 15:15:20', '2021-09-17 15:15:20', '279d02df-402a-4087-b121-4533ff797d42'),
(194, 'plugin:seo', 'm190114_152300_upgrade_to_new_data_format', '2021-09-17 15:15:20', '2021-09-17 15:15:20', '2021-09-17 15:15:20', 'b73b9157-1c83-41e8-a52b-455a0101a00c'),
(195, 'plugin:seo', 'm200518_110721_add_order_to_redirects', '2021-09-17 15:15:20', '2021-09-17 15:15:20', '2021-09-17 15:15:20', 'a5d01bf8-dcc6-4bf2-bdd2-3a3ce3e646c7'),
(196, 'plugin:seo', 'm201207_124200_add_product_types_to_sitemap', '2021-09-17 15:15:20', '2021-09-17 15:15:20', '2021-09-17 15:15:20', '2d61eb56-ba39-4931-8e7b-940526e49e62'),
(197, 'plugin:redactor', 'm180430_204710_remove_old_plugins', '2021-09-20 10:01:27', '2021-09-20 10:01:27', '2021-09-20 10:01:27', '06a34b44-2dae-442e-8b39-1d104ba20926'),
(198, 'plugin:redactor', 'Install', '2021-09-20 10:01:27', '2021-09-20 10:01:27', '2021-09-20 10:01:27', 'd72c2526-332b-4a5b-83a4-bb0c8424cb37'),
(199, 'plugin:redactor', 'm190225_003922_split_cleanup_html_settings', '2021-09-20 10:01:27', '2021-09-20 10:01:27', '2021-09-20 10:01:27', 'd0155633-9c63-4dfc-a1d2-e6696eae93a9');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `plugins`
--

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'seo', '3.7.4', '3.2.0', 'unknown', NULL, '2021-09-17 15:15:19', '2021-09-17 15:15:19', '2021-09-23 09:46:49', '491433ec-f7ea-4421-810e-deb1b9e947dc'),
(2, 'contact-form', '2.2.7', '1.0.0', 'unknown', NULL, '2021-09-17 15:15:39', '2021-09-17 15:15:39', '2021-09-23 09:46:49', 'f048d146-7773-44fc-8ecf-3a18b2f51183'),
(3, 'ckeditor', '1.1.2', '1.0.0', 'unknown', NULL, '2021-09-17 15:15:56', '2021-09-17 15:15:56', '2021-09-23 09:46:49', 'bab1be24-f7ba-4d35-be02-e4e8b68a2477'),
(4, 'redactor', '2.8.8', '2.3.0', 'unknown', NULL, '2021-09-20 10:01:27', '2021-09-20 10:01:27', '2021-09-23 09:46:49', '3b08584b-5ff0-4431-9129-5283c043a232'),
(5, 'cp-css', '2.4.0', '2.0.0', 'unknown', NULL, '2021-09-23 09:46:14', '2021-09-23 09:46:15', '2021-09-23 09:46:49', 'eaee23e0-3c5d-4fcd-9574-fe0eae81b3fe');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1632390375'),
('email.fromEmail', '\"pjotr@pixeldeluxe.nl\"'),
('email.fromName', '\"Inlog\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.class', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.disabled', 'false'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.id', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.instructions', '\"\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.label', '\"Titel\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.max', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.min', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.name', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.orientation', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.readonly', 'false'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.requirable', 'false'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.size', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.step', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.tip', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.title', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.warning', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.0.width', '100'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.fieldUid', '\"f8b6646a-dd2d-476e-917f-97b44bfcc712\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.instructions', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.label', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.required', 'false'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.tip', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.warning', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.1.width', '100'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.fieldUid', '\"fae7db13-6e00-4668-99bb-9afc3ac2e5a2\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.instructions', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.label', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.required', 'false'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.tip', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.warning', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.2.width', '100'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.fieldUid', '\"f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.instructions', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.label', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.required', 'false'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.tip', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.warning', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.elements.3.width', '100'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.name', '\"Inhoud\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.fieldLayouts.de734b26-0d2c-49af-8fa2-d521e4ff4504.tabs.0.sortOrder', '1'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.handle', '\"default\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.hasTitleField', 'true'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.name', '\"Standaard\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.section', '\"84a11e7d-9e21-46f9-8b24-7290df208456\"'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.sortOrder', '1'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.titleFormat', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.titleTranslationKeyFormat', 'null'),
('entryTypes.57ad1d88-5e68-4049-ad0d-5b79454b07d1.titleTranslationMethod', '\"site\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.autocapitalize', 'true'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.autocomplete', 'false'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.autocorrect', 'true'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.class', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.disabled', 'false'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.id', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.instructions', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.label', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.max', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.min', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.name', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.orientation', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.placeholder', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.readonly', 'false'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.requirable', 'false'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.size', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.step', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.tip', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.title', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.warning', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.0.width', '100'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.fieldUid', '\"04302099-b1f0-4a25-8180-b8936ac35b7d\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.instructions', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.label', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.required', 'false'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.tip', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.warning', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.1.width', '100'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.fieldUid', '\"c8554b26-1fbb-4154-8f31-8ea9da472549\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.instructions', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.label', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.required', 'false'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.tip', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.warning', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.elements.2.width', '100'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.name', '\"Inhoud\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.fieldLayouts.a7d3c70a-d36a-40aa-ba51-637f9a28ef26.tabs.0.sortOrder', '1'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.handle', '\"default\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.hasTitleField', 'true'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.name', '\"Standaard\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.section', '\"32efab90-8c84-4627-bc29-0cafb97a65bc\"'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.sortOrder', '1'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.titleFormat', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.titleTranslationKeyFormat', 'null'),
('entryTypes.8162203a-8882-4748-9e2a-642a0b8870df.titleTranslationMethod', '\"site\"'),
('fieldGroups.acdcf546-192b-4c80-8385-2b814525e484.name', '\"blogpost\"'),
('fieldGroups.c3f14eba-924f-40e8-bd6f-75ee2f3e46a2.name', '\"Common\"'),
('fieldGroups.c8db6649-4212-42fa-9616-5358a9574856.name', '\"user\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.columnSuffix', '\"dpxzvzre\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.contentColumnType', '\"mediumtext\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.fieldGroup', '\"acdcf546-192b-4c80-8385-2b814525e484\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.handle', '\"text\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.instructions', '\"\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.name', '\"text\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.searchable', 'false'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.settings.columnType', '\"mediumtext\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.settings.initJs', 'null'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.settings.purifierConfig', '\"\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.settings.purifyHtml', '\"1\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.translationKeyFormat', 'null'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.translationMethod', '\"none\"'),
('fields.04302099-b1f0-4a25-8180-b8936ac35b7d.type', '\"craft\\\\ckeditor\\\\Field\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.columnSuffix', '\"judhyjmq\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.contentColumnType', '\"string(255)\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.fieldGroup', '\"acdcf546-192b-4c80-8385-2b814525e484\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.handle', '\"video\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.instructions', '\"\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.name', '\"video\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.searchable', 'false'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.settings.maxLength', '\"255\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.settings.placeholder', 'null'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.settings.types.0', '\"url\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.translationKeyFormat', 'null'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.translationMethod', '\"none\"'),
('fields.c8554b26-1fbb-4154-8f31-8ea9da472549.type', '\"craft\\\\fields\\\\Url\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.columnSuffix', '\"ppdudzrb\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.contentColumnType', '\"mediumtext\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.fieldGroup', '\"c8db6649-4212-42fa-9616-5358a9574856\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.handle', '\"bio\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.instructions', '\"\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.name', '\"bio\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.searchable', 'false'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.settings.columnType', '\"mediumtext\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.settings.initJs', 'null'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.settings.purifierConfig', '\"\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.settings.purifyHtml', '\"1\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.translationKeyFormat', 'null'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.translationMethod', '\"none\"'),
('fields.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7.type', '\"craft\\\\ckeditor\\\\Field\"'),
('graphql.publicToken.enabled', 'true'),
('graphql.publicToken.expiryDate', 'null'),
('graphql.schemas.7e891c5b-79d1-49c9-988f-150aaa748c4d.isPublic', 'true'),
('graphql.schemas.7e891c5b-79d1-49c9-988f-150aaa748c4d.name', '\"Public Schema\"'),
('meta.__names__.04302099-b1f0-4a25-8180-b8936ac35b7d', '\"text\"'),
('meta.__names__.32efab90-8c84-4627-bc29-0cafb97a65bc', '\"blogpost\"'),
('meta.__names__.341c12ec-dfad-49a9-a1d0-8a10df36b6df', '\"Inlog\"'),
('meta.__names__.57ad1d88-5e68-4049-ad0d-5b79454b07d1', '\"Standaard\"'),
('meta.__names__.77c06f40-3897-4d03-9b55-f5429485c835', '\"Inlog\"'),
('meta.__names__.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9', '\"images\"'),
('meta.__names__.7e891c5b-79d1-49c9-988f-150aaa748c4d', '\"Public Schema\"'),
('meta.__names__.8162203a-8882-4748-9e2a-642a0b8870df', '\"Standaard\"'),
('meta.__names__.84a11e7d-9e21-46f9-8b24-7290df208456', '\"users\"'),
('meta.__names__.acdcf546-192b-4c80-8385-2b814525e484', '\"blogpost\"'),
('meta.__names__.c3f14eba-924f-40e8-bd6f-75ee2f3e46a2', '\"Common\"'),
('meta.__names__.c8554b26-1fbb-4154-8f31-8ea9da472549', '\"video\"'),
('meta.__names__.c8db6649-4212-42fa-9616-5358a9574856', '\"user\"'),
('meta.__names__.d3315dc2-f048-4bbf-be48-94be8ea6f29d', '\"indelingen\"'),
('meta.__names__.f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7', '\"bio\"'),
('plugins.ckeditor.edition', '\"standard\"'),
('plugins.ckeditor.enabled', 'true'),
('plugins.ckeditor.schemaVersion', '\"1.0.0\"'),
('plugins.contact-form.edition', '\"standard\"'),
('plugins.contact-form.enabled', 'true'),
('plugins.contact-form.schemaVersion', '\"1.0.0\"'),
('plugins.contact-form.settings.allowAttachments', '\"\"'),
('plugins.contact-form.settings.prependSender', '\"Namens\"'),
('plugins.contact-form.settings.prependSubject', '\"New message from Inlog\"'),
('plugins.contact-form.settings.successFlashMessage', '\"Jouw bericht is verstuurd.\"'),
('plugins.contact-form.settings.toEmail', '\"pjotr@pixeldeluxe.nl\"'),
('plugins.cp-css.edition', '\"standard\"'),
('plugins.cp-css.enabled', 'true'),
('plugins.cp-css.schemaVersion', '\"2.0.0\"'),
('plugins.redactor.edition', '\"standard\"'),
('plugins.redactor.enabled', 'true'),
('plugins.redactor.schemaVersion', '\"2.3.0\"'),
('plugins.seo.edition', '\"standard\"'),
('plugins.seo.enabled', 'true'),
('plugins.seo.schemaVersion', '\"3.2.0\"'),
('routes.2c466fcc-90b5-4843-9204-613c485c5aa6.siteUid', 'null'),
('routes.2c466fcc-90b5-4843-9204-613c485c5aa6.sortOrder', '3'),
('routes.2c466fcc-90b5-4843-9204-613c485c5aa6.template', '\"/users/account/register\"'),
('routes.2c466fcc-90b5-4843-9204-613c485c5aa6.uriParts.0', '\"register\"'),
('routes.2c466fcc-90b5-4843-9204-613c485c5aa6.uriPattern', '\"register\"'),
('routes.61db4bd5-fcb9-4f74-9c2e-d7dfacc65453.siteUid', 'null'),
('routes.61db4bd5-fcb9-4f74-9c2e-d7dfacc65453.sortOrder', '1'),
('routes.61db4bd5-fcb9-4f74-9c2e-d7dfacc65453.template', '\"/users/account/login\"'),
('routes.61db4bd5-fcb9-4f74-9c2e-d7dfacc65453.uriParts.0', '\"login\"'),
('routes.61db4bd5-fcb9-4f74-9c2e-d7dfacc65453.uriPattern', '\"login\"'),
('routes.6b8c2dd2-32cc-4f7e-a0a1-c53e035b5bba.siteUid', 'null'),
('routes.6b8c2dd2-32cc-4f7e-a0a1-c53e035b5bba.sortOrder', '6'),
('routes.6b8c2dd2-32cc-4f7e-a0a1-c53e035b5bba.template', '\"/users/index\"'),
('routes.6b8c2dd2-32cc-4f7e-a0a1-c53e035b5bba.uriParts.0', '\"account\"'),
('routes.6b8c2dd2-32cc-4f7e-a0a1-c53e035b5bba.uriPattern', '\"account\"'),
('routes.8b83f121-f4ae-4f9e-bb94-fc30abb4fc8b.siteUid', 'null'),
('routes.8b83f121-f4ae-4f9e-bb94-fc30abb4fc8b.sortOrder', '5'),
('routes.8b83f121-f4ae-4f9e-bb94-fc30abb4fc8b.template', '\"/users/account/setpassword\"'),
('routes.8b83f121-f4ae-4f9e-bb94-fc30abb4fc8b.uriParts.0', '\"new-password\"'),
('routes.8b83f121-f4ae-4f9e-bb94-fc30abb4fc8b.uriPattern', '\"new-password\"'),
('routes.b3195122-d4d0-4c02-b52b-b75c9528d3fc.siteUid', 'null'),
('routes.b3195122-d4d0-4c02-b52b-b75c9528d3fc.sortOrder', '2'),
('routes.b3195122-d4d0-4c02-b52b-b75c9528d3fc.template', '\"/users/account/profile\"'),
('routes.b3195122-d4d0-4c02-b52b-b75c9528d3fc.uriParts.0', '\"profile\"'),
('routes.b3195122-d4d0-4c02-b52b-b75c9528d3fc.uriPattern', '\"profile\"'),
('routes.efb556d4-447f-4411-9744-eaeb08984497.siteUid', 'null'),
('routes.efb556d4-447f-4411-9744-eaeb08984497.sortOrder', '4'),
('routes.efb556d4-447f-4411-9744-eaeb08984497.template', '\"/users/account/reset-password\"'),
('routes.efb556d4-447f-4411-9744-eaeb08984497.uriParts.0', '\"reset-password\"'),
('routes.efb556d4-447f-4411-9744-eaeb08984497.uriPattern', '\"reset-password\"'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.defaultPlacement', '\"end\"'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.enableVersioning', 'true'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.handle', '\"blogpost\"'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.name', '\"blogpost\"'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.propagationMethod', '\"all\"'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.enabledByDefault', 'true'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.hasUrls', 'true'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.template', '\"blogpost/_entry\"'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.uriFormat', '\"blogpost/{slug}\"'),
('sections.32efab90-8c84-4627-bc29-0cafb97a65bc.type', '\"channel\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.defaultPlacement', '\"end\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.enableVersioning', 'true'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.handle', '\"users\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.name', '\"users\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.previewTargets.0.__assoc__.0.0', '\"label\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.previewTargets.0.__assoc__.0.1', '\"Primaire invoer-pagina\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.previewTargets.0.__assoc__.1.0', '\"urlFormat\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.previewTargets.0.__assoc__.1.1', '\"{url}\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.previewTargets.0.__assoc__.2.0', '\"refresh\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.previewTargets.0.__assoc__.2.1', '\"1\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.propagationMethod', '\"all\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.enabledByDefault', 'true'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.hasUrls', 'true'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.template', '\"users/_entry\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.siteSettings.341c12ec-dfad-49a9-a1d0-8a10df36b6df.uriFormat', '\"users/{slug}\"'),
('sections.84a11e7d-9e21-46f9-8b24-7290df208456.type', '\"channel\"'),
('siteGroups.77c06f40-3897-4d03-9b55-f5429485c835.name', '\"Inlog\"'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.handle', '\"default\"'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.hasUrls', 'true'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.language', '\"nl\"'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.name', '\"Inlog\"'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.primary', 'true'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.siteGroup', '\"77c06f40-3897-4d03-9b55-f5429485c835\"'),
('sites.341c12ec-dfad-49a9-a1d0-8a10df36b6df.sortOrder', '1'),
('system.edition', '\"pro\"'),
('system.live', 'true'),
('system.name', '\"Inlog\"'),
('system.retryDuration', 'null'),
('system.schemaVersion', '\"3.7.8\"'),
('system.timeZone', '\"Europe/Amsterdam\"'),
('users.allowPublicRegistration', 'true'),
('users.defaultGroup', '\"d3315dc2-f048-4bbf-be48-94be8ea6f29d\"'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.fieldUid', '\"84b801b8-940b-4cee-b604-71342dea325d\"'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.instructions', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.label', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.required', 'false'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.tip', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.warning', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.0.width', '100'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.fieldUid', '\"f1497bca-02b2-4c0d-b9b6-1a18b4d49cf7\"'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.instructions', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.label', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.required', 'false'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.tip', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.type', '\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.warning', 'null'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.elements.1.width', '100'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.name', '\"UserInfo\"'),
('users.fieldLayouts.081a596c-dd22-4fba-8b1f-0a95389011b9.tabs.0.sortOrder', '1'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.description', '\"\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.handle', '\"indelingen\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.name', '\"indelingen\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.0', '\"createentries:32efab90-8c84-4627-bc29-0cafb97a65bc\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.1', '\"publishentries:32efab90-8c84-4627-bc29-0cafb97a65bc\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.10', '\"viewvolume:7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.2', '\"deleteentries:32efab90-8c84-4627-bc29-0cafb97a65bc\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.3', '\"editentries:32efab90-8c84-4627-bc29-0cafb97a65bc\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.4', '\"createentries:84a11e7d-9e21-46f9-8b24-7290df208456\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.5', '\"publishentries:84a11e7d-9e21-46f9-8b24-7290df208456\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.6', '\"deleteentries:84a11e7d-9e21-46f9-8b24-7290df208456\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.7', '\"editentries:84a11e7d-9e21-46f9-8b24-7290df208456\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.8', '\"saveassetinvolume:7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9\"'),
('users.groups.d3315dc2-f048-4bbf-be48-94be8ea6f29d.permissions.9', '\"replacefilesinvolume:7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9\"'),
('users.photoSubpath', '\"profile\"'),
('users.photoVolumeUid', '\"7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9\"'),
('users.requireEmailVerification', 'true'),
('users.suspendByDefault', 'false'),
('users.validateOnPublicRegistration', 'false'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.autocapitalize', 'true'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.autocomplete', 'false'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.autocorrect', 'true'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.class', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.disabled', 'false'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.id', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.instructions', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.label', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.max', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.min', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.name', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.orientation', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.placeholder', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.readonly', 'false'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.requirable', 'false'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.size', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.step', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.tip', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.title', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.type', '\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.warning', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.elements.0.width', '100'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.name', '\"Inhoud\"'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.fieldLayouts.71d4a218-181e-495f-a0c2-ff4dd2879264.tabs.0.sortOrder', '1'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.handle', '\"images\"'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.hasUrls', 'true'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.name', '\"images\"'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.settings.path', '\"/Users/pjotr/Sites/inlog/web/images\"'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.sortOrder', '1'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.titleTranslationKeyFormat', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.titleTranslationMethod', 'null'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.type', '\"craft\\\\volumes\\\\Local\"'),
('volumes.7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9.url', '\"//inlog.local/images/\"');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('10c67817', '@app/web/assets/edituser/dist'),
('1357825', '@craft/web/assets/cp/dist'),
('1b4ba1b4', '@craft/web/assets/updateswidget/dist'),
('1eb9fa70', '@lib/datepicker-i18n'),
('25f1e3da', '@craft/web/assets/recententries/dist'),
('268d0c94', '@app/web/assets/admintable/dist'),
('2bd8297a', '@app/web/assets/clearcaches/dist'),
('2c32a585', '@craft/web/assets/updater/dist'),
('30bc4eef', '@app/web/assets/editsection/dist'),
('32894193', '@lib/timepicker'),
('3a8385d7', '@app/web/assets/plugins/dist'),
('470047e7', '@app/web/assets/dbbackup/dist'),
('472f4e01', '@lib/iframe-resizer'),
('4b8c7116', '@lib/fileupload'),
('4e85a14a', '@app/web/assets/sites/dist'),
('536470e8', '@lib/picturefill'),
('54c04c2a', '@lib/jquery-touch-events'),
('564646a3', '@lib/prismjs'),
('58ee0ac4', '@app/web/assets/editentry/dist'),
('59a896a5', '@craft/web/assets/userpermissions/dist'),
('5bc740ef', '@craft/web/assets/utilities/dist'),
('5dc150b9', '@lib/d3'),
('67b507b5', '@app/web/assets/updates/dist'),
('6e7c473f', '@lib/garnishjs'),
('71a5d6c', '@lib/selectize'),
('72d1a239', '@craft/web/assets/admintable/dist'),
('76e3a2d8', '@app/web/assets/queuemanager/dist'),
('7848c8c4', '@app/web/assets/dashboard/dist'),
('79d4dac1', '@app/web/assets/deprecationerrors/dist'),
('7b3a9301', '@lib/fabric'),
('7ea3f898', '@doublesecretagency/cpcss/resources'),
('7f2fe68a', '@app/web/assets/fields/dist'),
('80809f09', '@app/web/assets/findreplace/dist'),
('80e820b7', '@lib/jquery-ui'),
('83f26af9', '@craft/web/assets/feed/dist'),
('83fd8942', '@craft/web/assets/edittransform/dist'),
('84e4858', '@craft/web/assets/pluginstore/dist'),
('88e7b154', '@app/web/assets/updater/dist'),
('8a3f60fe', '@lib/axios'),
('8c168f7a', '@app/web/assets/generalsettings/dist'),
('8eb0a705', '@app/web/assets/installer/dist'),
('92804fcb', '@app/web/assets/systemmessages/dist'),
('95f1c032', '@app/web/assets/fieldsettings/dist'),
('96204faa', '@app/web/assets/craftsupport/dist'),
('988fcd14', '@craft/web/assets/editsection/dist'),
('98b2e36b', '@app/web/assets/updateswidget/dist'),
('a07dcba3', '@app/web/assets/pluginstore/dist'),
('a608a105', '@app/web/assets/recententries/dist'),
('a7d4c38b', '@lib/vue'),
('a993f810', '@app/web/assets/assetindexes/dist'),
('bb458688', '@app/web/assets/cp/dist'),
('bce757bd', '@craft/web/assets/craftsupport/dist'),
('bf7b93f6', '@app/web/assets/login/dist'),
('c25ecd36', '@app/web/assets/feed/dist'),
('c7daec30', '@app/web/assets/userpermissions/dist'),
('cb60887d', '@ether/seo/web/assets'),
('ce41bb12', '@lib/velocity'),
('d26614fa', '@lib/jquery.payment'),
('d7619e6', '@lib/xregexp'),
('d93ec419', '@app/web/assets/utilities/dist'),
('d9ff6a97', '@craft/ckeditor/assets/field/dist'),
('dfce4c6f', '@bower/jquery/dist'),
('edeb74f6', '@app/web/assets/routes/dist'),
('f05ee79a', '@lib/element-resize-detector'),
('f71b73d2', '@app/web/assets/quickpost/dist'),
('fab14c32', '@craft/web/assets/dashboard/dist');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `revisions`
--

INSERT INTO `revisions` (`id`, `sourceId`, `creatorId`, `num`, `notes`) VALUES
(1, 10, 1, 1, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' paniek '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(2, 'email', 0, 1, ' pjotrw15 gmail com '),
(2, 'fullname', 0, 1, ' pjotr wisse '),
(2, 'lastname', 0, 1, ' wisse '),
(2, 'username', 0, 1, ' yesman '),
(2, 'firstname', 0, 1, ' pjotr '),
(2, 'slug', 0, 1, ''),
(3, 'fullname', 0, 1, ' pjotr wisse '),
(3, 'lastname', 0, 1, ' wisse '),
(3, 'firstname', 0, 1, ' pjotr '),
(3, 'username', 0, 1, ' yesman '),
(3, 'email', 0, 1, ' pjotrw15 gmail com '),
(3, 'slug', 0, 1, ''),
(4, 'username', 0, 1, ' yesman '),
(4, 'firstname', 0, 1, ' pjotr '),
(4, 'lastname', 0, 1, ' wisse '),
(4, 'fullname', 0, 1, ' pjotr wisse '),
(4, 'email', 0, 1, ' pjotrw15 gmail com '),
(4, 'slug', 0, 1, ''),
(5, 'username', 0, 1, ' yesman '),
(5, 'lastname', 0, 1, ' wisse '),
(5, 'firstname', 0, 1, ' pjotr '),
(5, 'fullname', 0, 1, ' pjotr wisse '),
(5, 'email', 0, 1, ' pjotrw15 gmail com '),
(5, 'slug', 0, 1, ''),
(6, 'username', 0, 1, ' yesman '),
(6, 'firstname', 0, 1, ' pjotr '),
(6, 'lastname', 0, 1, ' wisse '),
(6, 'fullname', 0, 1, ' pjotr wisse '),
(6, 'email', 0, 1, ' kipopi7622 tst999 com '),
(6, 'slug', 0, 1, ''),
(7, 'username', 0, 1, ' yesman '),
(7, 'firstname', 0, 1, ' pjotr '),
(7, 'lastname', 0, 1, ' wisse '),
(7, 'fullname', 0, 1, ' pjotr wisse '),
(7, 'email', 0, 1, ' kipopi7622 tst999 com '),
(7, 'slug', 0, 1, ''),
(8, 'email', 0, 1, ' sogac51771 tst999 com '),
(9, 'filename', 0, 1, ' schermafbeelding 2021 09 08 om 09 29 27 png '),
(8, 'username', 0, 1, ' dude '),
(8, 'firstname', 0, 1, ' pjotr '),
(8, 'lastname', 0, 1, ' wisse '),
(8, 'fullname', 0, 1, ' pjotr wisse '),
(9, 'extension', 0, 1, ' png '),
(9, 'kind', 0, 1, ' image '),
(9, 'slug', 0, 1, ''),
(9, 'title', 0, 1, ' schermafbeelding 2021 09 08 om 09 29 27 '),
(8, 'slug', 0, 1, ''),
(10, 'title', 0, 1, ' bob '),
(10, 'slug', 0, 1, ' bob '),
(1, 'slug', 0, 1, ''),
(12, 'kind', 0, 1, ' image '),
(12, 'slug', 0, 1, ''),
(12, 'extension', 0, 1, ' jpeg '),
(12, 'filename', 0, 1, ' xp jpeg '),
(1, 'email', 0, 1, ' pjotr pixeldeluxe nl '),
(12, 'title', 0, 1, ' kiryu chan ');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections`
--

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagationMethod`, `defaultPlacement`, `previewTargets`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'blogpost', 'blogpost', 'channel', 1, 'all', 'end', NULL, '2021-09-17 15:00:40', '2021-09-17 15:00:40', NULL, '32efab90-8c84-4627-bc29-0cafb97a65bc'),
(2, NULL, 'users', 'users', 'channel', 1, 'all', 'end', '[{\"label\":\"Primaire invoer-pagina\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]', '2021-09-20 07:32:26', '2021-09-21 10:29:15', NULL, '84a11e7d-9e21-46f9-8b24-7290df208456');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sections_sites`
--

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, 1, 'blogpost/{slug}', 'blogpost/_entry', 1, '2021-09-17 15:00:40', '2021-09-17 15:00:40', '7f586f65-570c-4995-a64d-53f9abbe91bc'),
(2, 2, 1, 1, 'users/{slug}', 'users/_entry', 1, '2021-09-20 07:32:26', '2021-09-21 10:29:15', '0a17a8ac-24db-414e-99e8-157ec9bdbdb1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `seo_redirects`
--

CREATE TABLE `seo_redirects` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('301','302') COLLATE utf8_unicode_ci NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `seo_sitemap`
--

CREATE TABLE `seo_sitemap` (
  `id` int(11) NOT NULL,
  `group` enum('sections','categories','productTypes','customUrls') COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` enum('always','hourly','daily','weekly','monthly','yearly','never') COLLATE utf8_unicode_ci NOT NULL,
  `priority` float NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'nq_66rol0zz7U5uL9lAAkQuKOmvMGvmkBVPp-v0LNczYXfd-d76-Cbu6zRg1eNYoIJT8Zl5qdpWg_jnGVRIYGYc8RGzi_r4_JoQw', '2021-09-17 14:43:45', '2021-09-17 15:20:02', '0ce55634-232a-4b12-9a77-05a8cc880d29'),
(2, 1, 'bomHmh6ZHabK6DoJoYZ19NNQrhSu3jiuxSL3-CNg5kSmqG9rzTaR0v17PVqBIzYIpod_in3oMxdzZUksSWen3LPyv1YLiSkhW_jO', '2021-09-20 07:12:42', '2021-09-20 13:18:23', 'd86989b0-474f-4bbd-9085-2c56764913ed'),
(11, 7, '_1KqwuVCLzZ3RtjsHqio1eYc27j1xLostmwUEx7W7owZeIG8QPa1ptozRCsb7PYKUtDPtZle50SqXja9XwVcKjMtQlw00fJBCwop', '2021-09-20 15:29:02', '2021-09-20 15:29:02', '30939156-a38a-409c-84c9-e9bbb01853ed'),
(12, 1, 'MiXy_ryNXSG7Y_SNHEBVSsBGbMQtH49Z-9gikAVUBdFt5UvZi9d5WKe6Bsej6NeD3aWvxpMDEC340R3hb8yzV7r3YKO_xrPdv8cH', '2021-09-21 07:13:35', '2021-09-21 07:13:57', '1817d5fb-043a-4e85-a6f2-68f86b8e5bb9'),
(27, 8, '5Oxnp0by6-F0c8umgctHPwQPJOtSebKWbkOkWsdDqQI0kzC50wza3kS5UwunJ_bZaBdjWiLNlLfsujoqsEZImdSuEiz62l-QvHoo', '2021-09-21 14:28:05', '2021-09-21 15:29:42', 'b5b82b9d-201c-4375-a8aa-a09c417d3691');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Inlog', '2021-09-17 14:43:42', '2021-09-17 14:43:42', NULL, '77c06f40-3897-4d03-9b55-f5429485c835');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Inlog', 'default', 'nl', 1, '$PRIMARY_SITE_URL', 1, '2021-09-17 14:43:42', '2021-09-17 14:43:42', NULL, '341c12ec-dfad-49a9-a1d0-8a10df36b6df');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `route`, `usageLimit`, `usageCount`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '2BoHc3qkTLqUQl3MKEtjGmB9xd-FN53D', '[\"users/impersonate-with-token\",{\"userId\":\"7\",\"prevUserId\":1}]', 1, 0, '2021-09-21 08:13:53', '2021-09-21 07:13:54', '2021-09-21 07:13:54', '2d4d59b2-f7f3-4dd5-a40b-5de16002d3f9');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `usergroups`
--

INSERT INTO `usergroups` (`id`, `name`, `handle`, `description`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'indelingen', 'indelingen', '', '2021-09-17 15:14:29', '2021-09-20 15:11:31', 'd3315dc2-f048-4bbf-be48-94be8ea6f29d');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `usergroups_users`
--

INSERT INTO `usergroups_users` (`id`, `groupId`, `userId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 2, '2021-09-20 14:10:00', '2021-09-20 14:10:00', '66a456ea-f58b-41e1-a245-a17a2524c16e'),
(2, 1, 3, '2021-09-20 14:36:03', '2021-09-20 14:36:03', '3a667f58-5220-4922-9be6-02c93d63724b'),
(3, 1, 4, '2021-09-20 14:59:54', '2021-09-20 14:59:54', '3f28f219-7a12-4aaa-9ec1-748dd54a7445'),
(4, 1, 5, '2021-09-20 15:20:42', '2021-09-20 15:20:42', '36d40d14-d3e4-49bd-87e0-1e6891d75aa2'),
(5, 1, 6, '2021-09-20 15:25:57', '2021-09-20 15:25:57', 'b446b524-bcfa-4b7a-b49c-59d3bc6dcd67'),
(6, 1, 7, '2021-09-20 15:26:37', '2021-09-20 15:26:37', 'fa3fd7b2-cec8-4030-b7a2-30ec0deb10b4'),
(7, 1, 8, '2021-09-21 07:30:28', '2021-09-21 07:30:28', '3d9584d1-ae4f-4df7-9784-c553b1012a12');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `userpermissions`
--

INSERT INTO `userpermissions` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'saveassetinvolume:7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9', '2021-09-17 15:14:29', '2021-09-17 15:14:29', 'b6e143b9-0df3-498a-a95d-5437fb9e5f14'),
(2, 'viewvolume:7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9', '2021-09-17 15:14:29', '2021-09-17 15:14:29', '3e40a4d2-d26f-47a3-8fd2-701c2fa46bd4'),
(3, 'createentries:32efab90-8c84-4627-bc29-0cafb97a65bc', '2021-09-20 08:31:14', '2021-09-20 08:31:14', 'f146d743-fcab-4d09-9389-cec043d92425'),
(4, 'publishentries:32efab90-8c84-4627-bc29-0cafb97a65bc', '2021-09-20 08:31:14', '2021-09-20 08:31:14', '7ec70b24-c578-4ddd-a16b-e0af3da2bfdd'),
(5, 'deleteentries:32efab90-8c84-4627-bc29-0cafb97a65bc', '2021-09-20 08:31:14', '2021-09-20 08:31:14', '3cfcffba-832f-434b-ae5d-2d7dca43a60a'),
(6, 'editentries:32efab90-8c84-4627-bc29-0cafb97a65bc', '2021-09-20 08:31:14', '2021-09-20 08:31:14', 'd6d02573-9f6a-4d56-81e0-ecc5c828e3b3'),
(7, 'createentries:84a11e7d-9e21-46f9-8b24-7290df208456', '2021-09-20 08:31:14', '2021-09-20 08:31:14', '3805b3d6-08ef-4036-b42c-6011f49c6fc4'),
(8, 'publishentries:84a11e7d-9e21-46f9-8b24-7290df208456', '2021-09-20 08:31:14', '2021-09-20 08:31:14', '58005921-b168-4485-9ba3-3b688d0869ca'),
(9, 'deleteentries:84a11e7d-9e21-46f9-8b24-7290df208456', '2021-09-20 08:31:14', '2021-09-20 08:31:14', 'd8553f48-578b-43ad-9c17-3107c108125b'),
(10, 'editentries:84a11e7d-9e21-46f9-8b24-7290df208456', '2021-09-20 08:31:14', '2021-09-20 08:31:14', '82c96131-4a87-488a-bb14-92d92656383e'),
(11, 'replacefilesinvolume:7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9', '2021-09-20 08:31:14', '2021-09-20 08:31:14', '6f3eb067-c0e9-41ac-879f-46ebce18fc4b');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `userpermissions_usergroups`
--

INSERT INTO `userpermissions_usergroups` (`id`, `permissionId`, `groupId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(27, 3, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', 'ef1821ef-4f65-4cdd-97f4-51b7cc755f59'),
(28, 4, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', '3e9d4844-5f4d-42f2-a490-c62d68f082d5'),
(29, 5, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', '78e979ed-e741-4a59-bbd4-670c7d62351f'),
(30, 6, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', 'cfc837e1-cf5d-4818-900c-386c4e6570bb'),
(31, 7, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', '6ce708cc-c130-4fec-a95c-f0fedfa3a280'),
(32, 8, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', 'a2a11330-2c64-4edd-b21f-7cdcc4aa0b59'),
(33, 9, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', '0f4d1266-2f7f-4305-ae0a-5b38bbe2f3c2'),
(34, 10, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', 'fe74bab0-39cc-4a1e-ba36-ad2027744c0f'),
(35, 1, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', 'b7161a4e-6a10-4026-8997-219d4d68a0ec'),
(36, 11, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', '321b42cb-4293-4dfa-96d2-f71866f53f3c'),
(37, 2, 1, '2021-09-20 15:18:58', '2021-09-20 15:18:58', '63c51105-190e-4908-9476-cbc8a4f4a1c1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"nl\",\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}'),
(2, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(3, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(4, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(5, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(6, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(7, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}'),
(8, '{\"language\":null,\"locale\":null,\"weekStartDay\":null,\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false}');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Paniek', 12, '', '', 'PjotrW15@Gmail.com', '$2y$13$CVycCTH8P62k.zejyaEbXO8RZd1UV1lBIlhvgCpPuf3HcMS4gyMca', 1, 0, 0, 0, '2021-09-23 09:45:36', NULL, NULL, NULL, '2021-09-21 12:37:16', NULL, 1, '$2y$13$bfSLMizsiezXfHCx/b1nrOgss77AHI/qE6FFC/Enr6R.ymbHO6YlC', '2021-09-20 14:24:58', NULL, 0, '2021-09-17 14:43:45', '2021-09-17 14:43:45', '2021-09-23 09:45:36', '77e0bdca-855a-4a1d-9ee8-7a96f04e3dfd'),
(2, 'Yesman', NULL, 'Pjotr', 'Wisse', 'PjotrW15@Gmail.com', NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, '$2y$13$DrjDZXCSY8eUVi0DCwKjI.638Nto/8uH2Ai6zeC9AMJV0gb.hIqBi', '2021-09-20 14:10:20', NULL, 0, NULL, '2021-09-20 14:07:46', '2021-09-20 14:10:20', '54640130-442e-4b4d-ae69-635f6a00340b'),
(3, 'Yesman', NULL, 'Pjotr', 'Wisse', 'PjotrW15@Gmail.com', NULL, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, '2021-09-20 14:35:34', '2021-09-20 14:35:34', '104f86fe-7fe7-4a23-9ada-f55318570128'),
(4, 'Yesman', NULL, 'Pjotr', 'Wisse', 'PjotrW15@Gmail.com', NULL, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, '2021-09-20 14:57:27', '2021-09-20 15:01:49', 'a2dfd2f5-abdd-4f6a-a1df-82b20fa0e569'),
(5, 'Yesman', NULL, 'Pjotr', 'Wisse', 'PjotrW15@Gmail.com', '$2y$13$3Sa7ru4YjxTuF4Af6bsOH.ljrVwy8CSlgOYi5vk0UVoaNJgI2WTYS', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-09-20 15:20:42', '2021-09-20 15:20:42', '2021-09-20 15:24:16', 'c57e2377-64c5-4eab-9b3b-706470f260ae'),
(6, 'Yesman', NULL, 'Pjotr', 'Wisse', 'kipopi7622@tst999.com', '$2y$13$put6ZmEWZ4B/1mCYl9LSBesVmv6l3InaUYdc/R7PgodNAYyHx8grC', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-09-20 15:25:57', '2021-09-20 15:25:57', '2021-09-20 15:25:57', 'd14365a3-b951-4738-aa5f-5d7f1c17c370'),
(7, 'Yesman', NULL, 'Pjotr', 'Wisse', 'kipopi7622@tst999.com', '$2y$13$sB2lc6CYiho2yPFG8GRMwO5YJO7VJ6oy1/6WGOX.p93zEA1yPUMuu', 0, 0, 0, 0, '2021-09-20 15:29:02', NULL, '2021-09-21 07:24:52', 1, '2021-09-21 07:24:52', NULL, 0, NULL, NULL, NULL, 0, '2021-09-20 15:26:37', '2021-09-20 15:26:37', '2021-09-21 07:24:52', '12b6f5c7-2cf2-4d30-8ed7-622be051e944'),
(8, 'Dude', 9, 'Pjotr', 'Wisse', 'sogac51771@tst999.com', '$2y$13$WTj5xZXFuBLhw5mswhFtVuH9.tznuzE0T3MTDWK7Bf5zRw2RnWpFq', 0, 0, 0, 0, '2021-09-21 14:28:05', NULL, NULL, NULL, '2021-09-21 14:14:58', NULL, 0, NULL, NULL, NULL, 0, '2021-09-21 09:25:51', '2021-09-21 07:30:28', '2021-09-21 14:49:47', 'a25a9dd0-b5d9-499c-b79c-bc9ef4e078c7');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `volumefolders`
--

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 1, 'images', '', '2021-09-17 14:58:25', '2021-09-17 14:58:25', '94cf20cc-6898-45ec-839e-d123921bfbb7'),
(2, NULL, NULL, 'Tijdelijke bron', NULL, '2021-09-17 15:16:45', '2021-09-17 15:16:45', 'd9ae2d34-3fe8-4c53-8250-53746f1afb15'),
(3, 2, NULL, 'user_1', 'user_1/', '2021-09-17 15:16:45', '2021-09-17 15:16:45', '24dd18ef-e7d7-47c7-9d8a-3d1221a481f3'),
(4, 1, 1, 'profile', 'profile/', '2021-09-21 10:13:40', '2021-09-21 10:13:40', '72df2a4d-355a-492b-8a67-0249311edd47');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `volumes`
--

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `titleTranslationMethod`, `titleTranslationKeyFormat`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 'images', 'images', 'craft\\volumes\\Local', 1, '//inlog.local/images/', 'site', NULL, '{\"path\":\"/Users/pjotr/Sites/inlog/web/images\"}', 1, '2021-09-17 14:58:25', '2021-09-17 14:58:25', NULL, '7dea6ad5-11b2-4d55-b238-8ffe0aa1afe9');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"siteId\":1,\"section\":\"*\",\"limit\":10}', 1, '2021-09-17 14:43:46', '2021-09-17 14:43:46', '4d624ecf-b828-4bea-bb20-ceefdb62a5b0'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-09-17 14:43:46', '2021-09-17 14:43:46', '41aa4297-d375-4261-aa7e-1df07df9ba41'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-09-17 14:43:46', '2021-09-17 14:43:46', '96d5c17b-815f-4bd3-933a-205ed959f643'),
(4, 1, 'craft\\widgets\\Feed', 4, 1, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-09-17 14:43:46', '2021-09-20 10:25:59', '5318db70-c686-4e8c-acf7-b74e1860b820');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ucmntvwqyuyvbxdihslbviyfzonwvfrdwuss` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_idyarwjpzdelqxhmlwhrzvmyxgifazylgqnv` (`dateRead`),
  ADD KEY `fk_lgghgulrvprvlkqfqayhgkfwxnujzfzajryk` (`pluginId`);

--
-- Indexen voor tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zjmpuetxairqsfgrzyqabticcbxkivqczykh` (`sessionId`,`volumeId`),
  ADD KEY `idx_cxsxvxhkdhcfphihdafuwxvvnhtgmpwbqeex` (`volumeId`);

--
-- Indexen voor tabel `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xmgpebemkolfdcnfxzrsbmhebmfzbdyuroza` (`filename`,`folderId`),
  ADD KEY `idx_rdprcsqnffugahpoafsweneecvxvfhyezmxl` (`folderId`),
  ADD KEY `idx_vubsjpjkdhxxuwocnejtmkvouihxvhohmrvt` (`volumeId`),
  ADD KEY `fk_jrtqktkzqmrkymczcaqhwbiyrkbfnrxvyntb` (`uploaderId`);

--
-- Indexen voor tabel `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_mecclskbyjvqeuwdrgtazooxyefucrzyouac` (`volumeId`,`assetId`,`location`);

--
-- Indexen voor tabel `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_saplqefokradihmxtyhwtemsfsgpiiamuvuu` (`name`),
  ADD KEY `idx_ygrvkelpothxpbjxitvrphedmgqenoljtcdj` (`handle`);

--
-- Indexen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zvpmduqddnwqcpfmmtpjmywthlbymvwoqrff` (`groupId`),
  ADD KEY `fk_lfvqlbasmelmmkseydyldbxoyawhjneumayh` (`parentId`);

--
-- Indexen voor tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wfwjturvkaskyszxjkfgrfzfdbsuvkfkoclf` (`name`),
  ADD KEY `idx_gcgyjapkcoviouzsestscalgawnoxvitbygp` (`handle`),
  ADD KEY `idx_vzbrkogytvyiglmcmtodwqslrgdtjwetokoi` (`structureId`),
  ADD KEY `idx_rrkrpjptkfsdyoklnsmicgjhfmrjotcfsloz` (`fieldLayoutId`),
  ADD KEY `idx_etuqobjcdkkgkyduaxzvdvezbhfmcixmncxk` (`dateDeleted`);

--
-- Indexen voor tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ajswfoumnzuhpprdjytwxlaaxhrppmnnlvjh` (`groupId`,`siteId`),
  ADD KEY `idx_rfxpofnauvmiedsmirgoyslyezyhggnlbthk` (`siteId`);

--
-- Indexen voor tabel `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_xhkxsmeqrxkxmyrstavjxqsrskevegcvetri` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_hlvattcixcxkyhqysbqmxuxiqozkznquomjl` (`siteId`),
  ADD KEY `fk_yuhvgvlfnawdeimpsfsqarxjxmhhhuicahgr` (`userId`);

--
-- Indexen voor tabel `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_tjtaxujwxdgibdaeknbyzjcazojgzgiujxbx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_yovdvsqkbrwaczyvpdqfwjrnjmwviglrmilf` (`siteId`),
  ADD KEY `fk_fpgzncevqxgsghbavtztyuysrnjdfyfnetrw` (`fieldId`),
  ADD KEY `fk_hdtybddashodqiqffrpgakbiimnmrjfqvcoq` (`userId`);

--
-- Indexen voor tabel `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_oxladswpvapgjzlqtjqwurczutardbohbswh` (`elementId`,`siteId`),
  ADD KEY `idx_tmggjhtqplyvlxfdehmxcvjzjadwaabrbddq` (`siteId`),
  ADD KEY `idx_fcimfchmbxkggyhfhrwjdyzqqsmtxsbdhwqs` (`title`);

--
-- Indexen voor tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_zrzficrmolktsnxaiwfkmuvcgjeorjeghbvp` (`userId`);

--
-- Indexen voor tabel `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_mufhcvkmkxweoaavkifohaybmmheuwspmhfs` (`key`,`fingerprint`);

--
-- Indexen voor tabel `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_tbdehbvaxyynfvnupgbhfxbmdmwyzrrhtryo` (`creatorId`,`provisional`),
  ADD KEY `idx_lvfhgmeoncsajptnfxjuylhtnlnlmrohekmx` (`saved`),
  ADD KEY `fk_toovrktkkrzsjhbbfxdwwhidjhauxzxrypsc` (`sourceId`);

--
-- Indexen voor tabel `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_rjgzbmolitaqmcikbkcrmizshgewprimakpb` (`type`);

--
-- Indexen voor tabel `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xkfchejpyakzfbyymdnsqekavegxeiebmbny` (`dateDeleted`),
  ADD KEY `idx_pwrmslsudqhcnxhdnizfyqlftskznjzawwdf` (`fieldLayoutId`),
  ADD KEY `idx_zvjyrjowgyyvqpixkebihrfuweitqxvqegvs` (`type`),
  ADD KEY `idx_widyvtqsqktkmhescuxojpyuwlcgfhureajg` (`enabled`),
  ADD KEY `idx_kuzgsnbridxglbkdmsplccafzkuqxwtlkblc` (`archived`,`dateCreated`),
  ADD KEY `idx_zphdbaqcjtqoiwllqwzrxqjngpmmmjuvjjmd` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `fk_gvhqxxxbqllitynsatibwhjadaacuemrpzwv` (`canonicalId`),
  ADD KEY `fk_smsldpdgrxgrgtwbhmfuiutufrqvlzwcugnr` (`draftId`),
  ADD KEY `fk_cyseqktkknzhcljweyqbynqmewgcibeivitx` (`revisionId`);

--
-- Indexen voor tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_kttprdduxpbdjetfxvjfohpjrcdigvhctyez` (`elementId`,`siteId`),
  ADD KEY `idx_zlcunbximqdtljushicmzzuxlahghhjjgbve` (`siteId`),
  ADD KEY `idx_qxudrsqsjayqpgaczcoyfvqbtvoawddnuasi` (`slug`,`siteId`),
  ADD KEY `idx_ndjfvjxkfhargfjehavvsmwufrubfeaaurku` (`enabled`),
  ADD KEY `idx_rksjnmyalujdmodlqkyiwxzqhrxdgjijgqcu` (`uri`,`siteId`);

--
-- Indexen voor tabel `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_awhevfzbgnwxwvyuubiivdhogsqexewtxvud` (`postDate`),
  ADD KEY `idx_uaauwcrgrxacncytfjjrhosyrwzkrplfjuwz` (`expiryDate`),
  ADD KEY `idx_wxtzrcnnzbjtltthmukbpywijxkzodcrxpcf` (`authorId`),
  ADD KEY `idx_czfjtpzfoxyhuqrcprbfucqxiduybdyasnif` (`sectionId`),
  ADD KEY `idx_xdwfnjhmkmjsstckgulgbwkxerbhrtethwew` (`typeId`),
  ADD KEY `fk_onuvzlvyasbtpdjsbosowqnhgbjmukmctoic` (`parentId`);

--
-- Indexen voor tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lmjyiwpzauzhouepkllwfleehmlrueipzhio` (`name`,`sectionId`),
  ADD KEY `idx_oyrupntvjhsoizazrqpgfqiilqnfkfvqxscd` (`handle`,`sectionId`),
  ADD KEY `idx_wkwklwbzklfhuvjdmiftdsxrjyahctfpvsqb` (`sectionId`),
  ADD KEY `idx_zdjvcyjpmuwywocaznjogkmnicpnfpkgzlmv` (`fieldLayoutId`),
  ADD KEY `idx_stqvbegrguqxutwjbbzukcrsmylkutmvwebu` (`dateDeleted`);

--
-- Indexen voor tabel `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_somybfrjyikjheoayboyzraypmhblgzbfjvt` (`name`),
  ADD KEY `idx_tfovgwaufrcvdetbsfphwfhxeotwhhupntex` (`dateDeleted`,`name`);

--
-- Indexen voor tabel `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_zigiaokwcscofhpmlfiwcxdsjxnmvygfeppi` (`layoutId`,`fieldId`),
  ADD KEY `idx_wxyxfmvvpjkrynrkxunwxoiwxrjhbhiltgcs` (`sortOrder`),
  ADD KEY `idx_hrakudciacbcofwfixymzpqqmewfcxarbjdd` (`tabId`),
  ADD KEY `idx_emrudapsjpuanopdsobbupkozbrmvsdtbwuf` (`fieldId`);

--
-- Indexen voor tabel `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fqjjcgokvizvryaujgztljtuixdpszjipuyx` (`dateDeleted`),
  ADD KEY `idx_mujkjurijapvysokfiludhyvzwrjxjpsqbdk` (`type`);

--
-- Indexen voor tabel `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_usltmpuiexateexddvuolvndmijbavnrbfzu` (`sortOrder`),
  ADD KEY `idx_yjbgovqwbuqvshjkcovbyeahhymzawpwkcah` (`layoutId`);

--
-- Indexen voor tabel `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vbqmbwppmctxehqmaxvjxogrowjucqxyfxfp` (`handle`,`context`),
  ADD KEY `idx_abflkigehvmktldncoogylvicequfzwkdmgc` (`groupId`),
  ADD KEY `idx_vajardxycdlitsoyxyxleyglaomugrxufztr` (`context`);

--
-- Indexen voor tabel `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_daaowrjaqgxbufipkfhnadfevxgvyjuulvzv` (`name`),
  ADD KEY `idx_fknznpkvjebaofbpquzqqykosemhcoinhsev` (`handle`),
  ADD KEY `idx_mfoimtyqxqpiabkywpkrxndndvrvwfvfywvw` (`fieldLayoutId`),
  ADD KEY `idx_beevzdpoapxojtostkdhmjjrrvqwvhdgppvy` (`sortOrder`);

--
-- Indexen voor tabel `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ksnarsnyszxzevatavpsidrtinvnorxlmbti` (`accessToken`),
  ADD UNIQUE KEY `idx_mucdldgwrjxjmnqbpfsncgfbztcldslcdckc` (`name`),
  ADD KEY `fk_nrvbexfkwcuqglqdepsekopxirzmtsttdbra` (`schemaId`);

--
-- Indexen voor tabel `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ckpnztusfeqoekmxhrxurqnwyzfdngrjjkym` (`ownerId`),
  ADD KEY `idx_aznhjtjhqxxavtrdrrzvzgsrdwvhhteupkah` (`fieldId`),
  ADD KEY `idx_bfxxqrdqbuicnlbokfppuqzxwxvfndbdodul` (`typeId`),
  ADD KEY `idx_xantwbtnbzelwvqgbirajhdozdmvorpfnyqv` (`sortOrder`);

--
-- Indexen voor tabel `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ktyhihlzyejlxjflqljvulkddxmzgnzbbpmp` (`name`,`fieldId`),
  ADD KEY `idx_yyssdeargqmchuxqxcnxrjzyigowraehyvcj` (`handle`,`fieldId`),
  ADD KEY `idx_wogosziztfhngmptrovytesmgzgdqlittdxv` (`fieldId`),
  ADD KEY `idx_lyrqnhszdvcquwamsxpxgowwwficdiointrj` (`fieldLayoutId`);

--
-- Indexen voor tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dwopqmlynplsppqmislpapoouhgxbmsglnvw` (`track`,`name`);

--
-- Indexen voor tabel `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hqcfplvvzvbgarngbtwuhuhrdpafmwkyomzp` (`handle`);

--
-- Indexen voor tabel `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexen voor tabel `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jjjhhyegdeiulwcxrpnqaparhzahdbitijjp` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_cbhxfuszfpmxuwpbcdpsyigtyigvptxtpjjz` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexen voor tabel `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_jhqulervgbhmjkwukedupnpbablzggibrjoj` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_onmndnqenwzvuiqvpntuwqjdebofeebrjqxz` (`sourceId`),
  ADD KEY `idx_ennrajwammifywdukaakjkdjznbdgewjjtkx` (`targetId`),
  ADD KEY `idx_tojatbccpxbranjzcdphrekgvizfnuonebjh` (`sourceSiteId`);

--
-- Indexen voor tabel `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexen voor tabel `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_sxdxnszlmdrmedrvljhjfynwknmodvpmyese` (`sourceId`,`num`),
  ADD KEY `fk_jovmozeinamjsljbjewokvuvqqbwkliemomv` (`creatorId`);

--
-- Indexen voor tabel `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_dlbocmldzsfoxmifiiwsmapslpqknqmaluob` (`keywords`);

--
-- Indexen voor tabel `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fvzhkdoprfbnxzoakjwrctydauzxgggzsrvh` (`handle`),
  ADD KEY `idx_ezmnsjfduhnojpugzkaudmtbjewebcnfruvo` (`name`),
  ADD KEY `idx_sxyqmacqodtclbprkrrylfdmrahcltokpcbw` (`structureId`),
  ADD KEY `idx_wqmlfntniboeibszkwecbyourqiwekegkyiy` (`dateDeleted`);

--
-- Indexen voor tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_veuyyscvatgvseliifcufhgcgoepammyhvxc` (`sectionId`,`siteId`),
  ADD KEY `idx_rubbfodjgaoauyiccojdrfwtdyfvlbghcgjo` (`siteId`);

--
-- Indexen voor tabel `seo_redirects`
--
ALTER TABLE `seo_redirects`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `seo_sitemap`
--
ALTER TABLE `seo_sitemap`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jtzadkwaplytjjyjgyrtxphtkshfvdhqdyld` (`uid`),
  ADD KEY `idx_mvzaetjdrrhpxklzsijawzgmwozcyesdgdyw` (`token`),
  ADD KEY `idx_gvaugvstpajsfufxbhzkbrmhfumepkaibupf` (`dateUpdated`),
  ADD KEY `idx_ysafohjbyymolmvdhupxzegfeqjolraikceh` (`userId`);

--
-- Indexen voor tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_isjsqdywrdzlnxrzeapwspioqldagwcoplja` (`userId`,`message`);

--
-- Indexen voor tabel `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_bunxzflzvexdvvbajwcxadwokyyfnmkqzngr` (`name`);

--
-- Indexen voor tabel `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jaliqniirbqtpoyifaydhxhpyxclwzbdwmll` (`dateDeleted`),
  ADD KEY `idx_gbbtxlszskrjiblpkbouqkokzxitawuemqlq` (`handle`),
  ADD KEY `idx_tvilekpefbxytnovbyiwacamxbadmamqyobh` (`sortOrder`),
  ADD KEY `fk_ysiupnthlishfzqdqlsttcpcowmcdoxlfptb` (`groupId`);

--
-- Indexen voor tabel `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ruaqkvqtevdzbkdmaeikpupqolnrhtuaqood` (`structureId`,`elementId`),
  ADD KEY `idx_xjbxithylvtdeqpsdvwoesrcbfzhypmbqsjs` (`root`),
  ADD KEY `idx_gqjjgsnlockleinzbmvkhofcjawkswansycz` (`lft`),
  ADD KEY `idx_xxnoegsklzqtuokcypresvdgxcfejqxabkqv` (`rgt`),
  ADD KEY `idx_slrftbdbmqysxjdeprubzylgqcgztkkoxtru` (`level`),
  ADD KEY `idx_tewaoazypmahwkkwgvgsrfnjfwpadoijahpe` (`elementId`);

--
-- Indexen voor tabel `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gctieqljpgiumiseygkxkwjakbocffyvfhrx` (`dateDeleted`);

--
-- Indexen voor tabel `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_vtayalgpzypjyjsyxmwihgjysyxfoocahdiz` (`key`,`language`),
  ADD KEY `idx_boahfpvcnmxpkngwdovtrtrkubisqmjgjvrg` (`language`);

--
-- Indexen voor tabel `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ekxnqdtzhkwmchtpfnmpyrecjuqzagqukczb` (`name`),
  ADD KEY `idx_oplrwzggqhorgjgitvnojbluantiwbziangr` (`handle`),
  ADD KEY `idx_imrxhdrpnzawyumnzqpluofuiywmgvnlikpd` (`dateDeleted`),
  ADD KEY `fk_swjlvkjjmrcszhbxbsoitidfzajbgsdlfxzk` (`fieldLayoutId`);

--
-- Indexen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cputgaybwmhloupsouczrnraabdaftjyepjc` (`groupId`);

--
-- Indexen voor tabel `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_grxtjyrrpkrvghyyhhrxvjaqfctcoyphxvwu` (`cacheId`),
  ADD KEY `idx_hzestmvlykpmjmdatgejvyjlyvccigdslhqd` (`elementId`);

--
-- Indexen voor tabel `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ptykfkrdbufjbnfgefiawyxlihilgjxjjrli` (`cacheId`),
  ADD KEY `idx_owrdhmguiumyltrbyionoejogfpihdutresf` (`type`);

--
-- Indexen voor tabel `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wxazagfwazoydalqparvohsrxxskhrubjbdu` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `idx_zrvongvdckmenicnaipnqbmogzstcmkfseuk` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `idx_xtkalylvbcdftdafrwtisniklusmiivmaahd` (`siteId`);

--
-- Indexen voor tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_fldpmotwdxlxfcdqgyinjwzqgqkekpcvyocp` (`token`),
  ADD KEY `idx_feifnrlkadtslukcocwxkgdqnfuavhdjunhm` (`expiryDate`);

--
-- Indexen voor tabel `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pejugfsujvapzzawnesiofhdiogvbkfrskvs` (`handle`),
  ADD KEY `idx_ucvhmflejmwndpbiyimfwdjmmowlnapfmlgw` (`name`);

--
-- Indexen voor tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_admkkfzzmxtktodxxsbzmsqxnthwgrkndbnk` (`groupId`,`userId`),
  ADD KEY `idx_edfftwqevejzmngmjjdwfccoorepwappemci` (`userId`);

--
-- Indexen voor tabel `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_lfjyqkxjmzdmlvtfcbsgckvnimxmwtnkhbcu` (`name`);

--
-- Indexen voor tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_equfzatpietwzonpgvxpnuzjvekerjtosbdv` (`permissionId`,`groupId`),
  ADD KEY `idx_wumdqpcfthcwuyvqydojuwacjjasdlfzajjc` (`groupId`);

--
-- Indexen voor tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_yhxgzwcsghwoiykueqtkztmejqcukdupqmhq` (`permissionId`,`userId`),
  ADD KEY `idx_dwvgfhndzluxcvjtsmrcrydykppjuhzxmsvn` (`userId`);

--
-- Indexen voor tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vdkncqcmeaewiyiuexugthkdpgylvgaomzdf` (`uid`),
  ADD KEY `idx_agkfclbyyecmxkykdocehchbncgaiqmegkbt` (`verificationCode`),
  ADD KEY `idx_muarbvbafwonsohnafqawdhhpzwinzbbmdxl` (`email`),
  ADD KEY `idx_adidqewcnorgfohvjiddxbwghhiwqjuejhbq` (`username`),
  ADD KEY `fk_ydwebvvwvpwgluzwxsxucoquqwqbmcqskpns` (`photoId`);

--
-- Indexen voor tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_pzxrmdhkgokometdrvxorieygjczalnugkqb` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_ekoawcuprpelljgrdnrapzsbscxxbzzfrnep` (`parentId`),
  ADD KEY `idx_wdhavxspsdfspuqmfbjofhmqjzrcpcgkzpxy` (`volumeId`);

--
-- Indexen voor tabel `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_spmvrkjekdehivngextrnyeuwzwhtaijvvsy` (`name`),
  ADD KEY `idx_hhcusmlnmeruvirwnxswxtsyrfvixzvmafkj` (`handle`),
  ADD KEY `idx_rbbdfziosbkfhkxriixfxwjxneszpkswudlt` (`fieldLayoutId`),
  ADD KEY `idx_qjuoyjrhsperpxxaqhyrkjxjmiocpugptjcx` (`dateDeleted`);

--
-- Indexen voor tabel `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iheszqgetmwmjmwcyzqemijmlblebuvfxheg` (`userId`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT voor een tabel `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT voor een tabel `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT voor een tabel `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `seo_redirects`
--
ALTER TABLE `seo_redirects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `seo_sitemap`
--
ALTER TABLE `seo_sitemap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT voor een tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT voor een tabel `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT voor een tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_codbxjvtxabzfitdqcmwxjdbfcudrjkrmqyh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lgghgulrvprvlkqfqayhgkfwxnujzfzajryk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_hkbfpkvzwornrwinjrinmgeswntqwbukpexb` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_jrtqktkzqmrkymczcaqhwbiyrkbfnrxvyntb` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_twcmrrflcrwycowwjoxaltltrudxudtabfcx` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xkylaulnrevegztumqecdqjgsyjrjpkuzfvi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zmrysvadauexmagkrafqpnwzhvheqvjoejms` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_fqjupgjasdmqkcymsngsgaifbezkzcqwnyud` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lfvqlbasmelmmkseydyldbxoyawhjneumayh` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_yftrxaocxcmkojexhbztbgcepfyjebyujgds` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_pgkeowwnvkxrbvwmcjnlhwajbrgsmwjafxtf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vptllmcgvatzufztgsbfiymmwxlhagzcmuzn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_bftbbzuuezfxycpjnhviwzgradhngmpbnoyh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ebhyxkltsjrluveumkyztxbcaxlsstkozstb` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_hlvattcixcxkyhqysbqmxuxiqozkznquomjl` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rgrwjlwxrzoptfijbnzdxhmaopdjnlrntghf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yuhvgvlfnawdeimpsfsqarxjxmhhhuicahgr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_fpgzncevqxgsghbavtztyuysrnjdfyfnetrw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hdtybddashodqiqffrpgakbiimnmrjfqvcoq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_yovdvsqkbrwaczyvpdqfwjrnjmwviglrmilf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zekcvgpikpezlqlgkegyrfzfuafqnyztidxt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_irciossmrjltocgtprdlcjhxdtbjkkzxbfta` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jrakhcveygkgzhjxycsiyfymfckvlzbtdvrb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_zrzficrmolktsnxaiwfkmuvcgjeorjeghbvp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_nibafjyakiubngpinyxuhnyeknlccymesqky` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_toovrktkkrzsjhbbfxdwwhidjhauxzxrypsc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_cyseqktkknzhcljweyqbynqmewgcibeivitx` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gvhqxxxbqllitynsatibwhjadaacuemrpzwv` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_hfwelqjawbcbetlpuxwuwkiekvtzpzdhxklj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_smsldpdgrxgrgtwbhmfuiutufrqvlzwcugnr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_imyvywoinrlxwnvvihulihwnymcarpgqsuqw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vtsptrktgedtdcfpgxrjeboestmgwepiqzml` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_geqsxptioocxkfsgrcfgqendzjpjfgnnezfp` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_onuvzlvyasbtpdjsbosowqnhgbjmukmctoic` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pwpyfokopapyfbgctlktkycvgzuuqbowigpz` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_qkorgshntrvmctuhxfymxheaipzteplqxcjn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vcqvgtlgiszxinstkwskuhqesahiwtzgdivl` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_amwnhgrdzkfxcuaguxnaxlcwonlmudgllypu` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_hnpfnfenddsqjuayrpgvqawbnpbombixfjbz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_hfbooxrckiugyvqffxjtlugkosaxsznqaoua` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qrituxpfromtefpfbfnmsihthpkcubcapoly` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yvwuhajhnvyxaxwwsbsxfusrfjooocepttqr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_hxmrjufuhyygkpotogkvfpfnynrynakuteah` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_wcxxwkolvokxmnqwpqkmfxkefqkfygolkmuh` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_ujcdnzipyvefxgeypfvbpqhcrbjuotunlwmr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xdllicrieppzernmxitmoqwcfnzuuonvkeia` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_nrvbexfkwcuqglqdepsekopxirzmtsttdbra` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_bvwtttaafvectsdjfgzbnvhlwsogpjycrbnc` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_euksmvadzcqjnwctlseuoylefgszssntmyaw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vitdzwxjxiiiufmlvdblfzicdmiyiuvssfio` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_yulsmsimzirducfpufrxntgnnpvrktfahmhv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_fkkomsoxyjbebbwxryafksorpgzbfbvqxgkn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gcrmncbngagbrlpoozetikwgddgehbaerrki` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_awfavjchxvfzdrirbacbytekemmalajvckvg` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cahxlzpkxogrockyvzzowzkkjnzzmibjktgc` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kyrbpwzqfhtjttixxievvrtvajlgrnqlcauo` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_lldafxgiiduvsfpknfbtlsyhzeuxywurrtem` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_jovmozeinamjsljbjewokvuvqqbwkliemomv` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_qnrnmcksymfknmesippaoabzymrepdpgspvy` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_cvmjpstzorfeusckvgdayhgyaawfmupgttye` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_fjtrzdxnvjrkqkydbrckjdxgzhzewgpedvgr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jfgxwrqxkusbqypbqhddhfyplhblahwahxnu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_ojqlmtbngcwvzzfutzrhwctsmcpmndunxioa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_jdrvdiqlrrynsnbvulzkdddusggavdwcszat` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_ysiupnthlishfzqdqlsttcpcowmcdoxlfptb` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_licoulvxujcttesndlqqpfpgxfbstgnlvgua` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_vealrdquktbomraidxztszwdwyrydkdjzpif` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_swjlvkjjmrcszhbxbsoitidfzajbgsdlfxzk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_hdgzumsxvkfijietqeobbakyejtmmypzvxbn` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_nbrlhxeswuskkcrnwcrjwlvepuqgirkbxhad` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `fk_itgbjwrkpjzlgiswsifkgbtewnvvobtnjmdo` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iwooiqhtumonrakjixfkexdczdizhjebpbme` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `fk_vnmlmwykrutfqkeekdyvwqlktnxsfpmqzbbh` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `fk_rwliethyaugpziolnvehxmzdgnlzslcvqvsx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_ggidpaohksjfeespbsvbgcqjgwzcaxkqirkx` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zrvwuoeatiogkxxymvugsdpicqmqvqbgstxz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_zcutopiabqckptriwluidhldsvconpyjekib` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zyjpbumppucomzkwmvrsrcivwxcqxmfkgcjx` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_lrvelnlgwveuucrndkazinxfvveqtwufqrtc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_matxlcegeknouqiabiooulrqtcibkjuyogzx` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_uvjpfhunfoydqecglwaxtbbdvxhionsayxgh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_rkqqcydlgtmufttpxfahiggbysgnzjwpqnht` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ydwebvvwvpwgluzwxsxucoquqwqbmcqskpns` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_cvedpxzvbidcazxeyeukogckayqehjnnumdj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_szmrfzaqvkqwydllpqhhbxbtbjbjvmcyhion` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Beperkingen voor tabel `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_nctjxsdhfahppafaagsvxrmcnpobnxutbawp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Beperkingen voor tabel `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_dkmjqmopvuzzacrywfijpmebvcqcgkgzfvjl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
