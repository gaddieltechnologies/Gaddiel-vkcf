-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2016 at 07:21 AM
-- Server version: 5.6.15-log
-- PHP Version: 5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `vkcf_joomla_344`
--

-- --------------------------------------------------------

--
-- Table structure for table `jos_akeeba_common`
--

CREATE TABLE IF NOT EXISTS `jos_akeeba_common` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_akeeba_common`
--

INSERT INTO `jos_akeeba_common` (`key`, `value`) VALUES
('stats_siteurl', 'a1e5b38ea6859ba4e1dc526e8386cb89'),
('stats_siteid', '9038f53e8ae091089f5d6554216dd982cfb61acf'),
('stats_lastrun', '1442684903');

-- --------------------------------------------------------

--
-- Table structure for table `jos_ak_profiles`
--

CREATE TABLE IF NOT EXISTS `jos_ak_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_ak_profiles`
--

INSERT INTO `jos_ak_profiles` (`id`, `description`, `configuration`, `filters`) VALUES
(1, 'Default Backup Profile', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_ak_stats`
--

CREATE TABLE IF NOT EXISTS `jos_ak_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') NOT NULL DEFAULT 'run',
  `origin` varchar(30) NOT NULL DEFAULT 'backend',
  `type` varchar(30) NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `backupid` varchar(255) DEFAULT NULL,
  `filesexist` tinyint(3) NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) DEFAULT NULL,
  `total_size` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fullstatus` (`filesexist`,`status`),
  KEY `idx_stale` (`status`,`origin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_ak_storage`
--

CREATE TABLE IF NOT EXISTS `jos_ak_storage` (
  `tag` varchar(255) NOT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` longtext,
  PRIMARY KEY (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_assets`
--

CREATE TABLE IF NOT EXISTS `jos_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `jos_assets`
--

INSERT INTO `jos_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 199, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 74, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 75, 76, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 77, 78, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 79, 80, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 81, 82, 1, 'com_login', 'com_login', '{}'),
(13, 1, 83, 84, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 85, 86, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 87, 88, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 89, 90, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 91, 92, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 93, 162, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 163, 166, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 167, 168, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 169, 170, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 171, 172, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 173, 174, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 175, 178, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(26, 1, 179, 180, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 164, 165, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 176, 177, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 181, 182, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 183, 184, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 185, 186, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 187, 188, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 189, 190, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 191, 192, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 94, 95, 2, 'com_modules.module.1', 'Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(40, 18, 96, 97, 2, 'com_modules.module.2', 'Login', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 18, 98, 99, 2, 'com_modules.module.3', 'Popular Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 18, 100, 101, 2, 'com_modules.module.4', 'Recently Added Articles', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 18, 102, 103, 2, 'com_modules.module.8', 'Toolbar', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(44, 18, 104, 105, 2, 'com_modules.module.9', 'Quick Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(45, 18, 106, 107, 2, 'com_modules.module.10', 'Logged-in Users', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(46, 18, 108, 109, 2, 'com_modules.module.12', 'Admin Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(47, 18, 110, 111, 2, 'com_modules.module.13', 'Admin Submenu', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(48, 18, 112, 113, 2, 'com_modules.module.14', 'User Status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(49, 18, 114, 115, 2, 'com_modules.module.15', 'Title', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(50, 18, 116, 117, 2, 'com_modules.module.16', 'Login Form', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(51, 18, 118, 119, 2, 'com_modules.module.17', 'Breadcrumbs', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(52, 18, 120, 121, 2, 'com_modules.module.79', 'Multilanguage status', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(53, 18, 122, 123, 2, 'com_modules.module.86', 'Joomla Version', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(54, 18, 124, 125, 2, 'com_modules.module.87', 'Popular Tags', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(55, 18, 126, 127, 2, 'com_modules.module.88', 'Site Information', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(56, 18, 128, 129, 2, 'com_modules.module.89', 'Release News', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(57, 18, 130, 131, 2, 'com_modules.module.90', 'Latest Articles', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(58, 18, 132, 133, 2, 'com_modules.module.91', 'User Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(59, 18, 134, 135, 2, 'com_modules.module.92', 'Image Module', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(60, 18, 136, 137, 2, 'com_modules.module.93', 'Search', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(61, 27, 19, 20, 3, 'com_content.article.1', 'Getting Started', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(62, 1, 193, 194, 1, 'jos_ucm_content.1', 'jos_ucm_content.1', '[]'),
(63, 1, 195, 196, 1, 'com_extplorer', 'eXtplorer', '{}'),
(64, 1, 197, 198, 1, 'com_akeeba', 'Akeeba', '{}'),
(65, 18, 138, 139, 2, 'com_modules.module.94', 'JJ Social Slider', '{}'),
(66, 18, 140, 141, 2, 'com_modules.module.95', 'Slideshow CK', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(67, 18, 142, 143, 2, 'com_modules.module.96', 'Art Universal Lightbox', '{}'),
(68, 8, 22, 25, 2, 'com_content.category.8', 'About Us', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(69, 8, 26, 29, 2, 'com_content.category.9', 'Our Work', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(70, 8, 30, 33, 2, 'com_content.category.10', 'Contact Us', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(71, 8, 34, 37, 2, 'com_content.category.11', 'Video', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(72, 8, 38, 39, 2, 'com_content.category.12', 'Blog', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(73, 8, 40, 43, 2, 'com_content.category.13', 'Volunteer', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(74, 8, 44, 47, 2, 'com_content.category.14', 'Donate', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(75, 8, 48, 51, 2, 'com_content.category.15', 'Share Stories', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(76, 8, 52, 55, 2, 'com_content.category.16', 'Advocacy', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(77, 8, 56, 59, 2, 'com_content.category.17', 'Public Policy', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(78, 8, 60, 73, 2, 'com_content.category.18', 'Approvals', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(79, 68, 23, 24, 3, 'com_content.article.2', 'About Us', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(80, 77, 57, 58, 3, 'com_content.article.3', 'Privacy Policy', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(81, 78, 71, 72, 3, 'com_content.article.4', '12A Registration# of IT Act', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(82, 76, 53, 54, 3, 'com_content.article.5', 'Advocacy', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(83, 78, 61, 62, 3, 'com_content.article.6', 'Approvals', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(84, 78, 63, 64, 3, 'com_content.article.7', 'Certificate U/S 80G of IT Act', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(85, 70, 31, 32, 3, 'com_content.article.8', 'Contact Us', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(86, 78, 65, 66, 3, 'com_content.article.9', 'Corporate Identity Number', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(87, 74, 45, 46, 3, 'com_content.article.10', 'Donate', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(88, 78, 67, 68, 3, 'com_content.article.11', 'Licence U/S 25 of ICA 1956', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(89, 69, 27, 28, 3, 'com_content.article.12', 'Our Work', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(90, 78, 69, 70, 3, 'com_content.article.13', 'Permanent Account Number', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(91, 71, 35, 36, 3, 'com_content.article.14', 'Video', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(92, 73, 41, 42, 3, 'com_content.article.15', 'Volunteer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(93, 75, 49, 50, 3, 'com_content.article.16', 'World class dialysis facility. Now available in Nagpur', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(94, 18, 144, 145, 2, 'com_modules.module.97', 'Bottom Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}'),
(95, 18, 146, 147, 2, 'com_modules.module.98', 'Lady pic', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(96, 18, 148, 149, 2, 'com_modules.module.99', 'Lady pic', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(97, 18, 150, 151, 2, 'com_modules.module.100', 'About Us', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(98, 18, 152, 153, 2, 'com_modules.module.101', 'Our Work', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(99, 18, 154, 155, 2, 'com_modules.module.102', 'Slabs for Donation', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(100, 18, 156, 157, 2, 'com_modules.module.103', 'Volunteer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(101, 18, 158, 159, 2, 'com_modules.module.104', '80 G Approvals', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"module.edit.frontend":[]}'),
(102, 18, 160, 161, 2, 'com_modules.module.105', 'Left Main Menu', '{"core.delete":[],"core.edit":[],"core.edit.state":[],"module.edit.frontend":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_associations`
--

CREATE TABLE IF NOT EXISTS `jos_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_banners`
--

CREATE TABLE IF NOT EXISTS `jos_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner_clients`
--

CREATE TABLE IF NOT EXISTS `jos_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `jos_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the jos_assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 33, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '{}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 9, 10, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 68, 1, 11, 12, 1, 'about-us-vivo-kidney-care-foundation', 'com_content', 'About Us', 'about-us-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:22:17', 0, '2015-09-19 18:22:17', 0, '*', 1),
(9, 69, 1, 13, 14, 1, 'our-work-vivo-kidney-care-foundation', 'com_content', 'Our Work', 'our-work-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:23:47', 0, '2015-09-19 18:23:47', 0, '*', 1),
(10, 70, 1, 15, 16, 1, 'contact-us-vivo-kidney-care-foundation', 'com_content', 'Contact Us', 'contact-us-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:24:49', 0, '2015-09-19 18:24:49', 0, '*', 1),
(11, 71, 1, 17, 18, 1, 'video-vivo-kidney-care-foundation', 'com_content', 'Video', 'video-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:25:37', 0, '2015-09-19 18:25:37', 0, '*', 1),
(12, 72, 1, 19, 20, 1, 'blog-vivo-kidney-care-foundation', 'com_content', 'Blog', 'blog-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:26:15', 0, '2015-09-19 18:26:15', 0, '*', 1),
(13, 73, 1, 21, 22, 1, 'volunteer-vivo-kidney-care-foundation', 'com_content', 'Volunteer', 'volunteer-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:26:52', 0, '2015-09-19 18:26:52', 0, '*', 1),
(14, 74, 1, 23, 24, 1, 'donate-vivo-kidney-care-foundation', 'com_content', 'Donate', 'donate-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:27:25', 0, '2015-09-19 18:27:25', 0, '*', 1),
(15, 75, 1, 25, 26, 1, 'latest-news', 'com_content', 'Share Stories', 'latest-news', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:27:54', 0, '2015-09-19 18:27:54', 0, '*', 1),
(16, 76, 1, 27, 28, 1, 'advocacy-vivo-kidney-care-foundation', 'com_content', 'Advocacy', 'advocacy-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:29:29', 0, '2015-09-19 18:29:29', 0, '*', 1),
(17, 77, 1, 29, 30, 1, 'public-policy-vivo-kidney-care-foundation', 'com_content', 'Public Policy', 'public-policy-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:30:01', 0, '2015-09-19 18:30:01', 0, '*', 1),
(18, 78, 1, 31, 32, 1, 'approvals-vivo-kidney-care-foundation', 'com_content', 'Approvals', 'approvals-vivo-kidney-care-foundation', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":"","image_alt":""}', '', '', '{"author":"","robots":""}', 62, '2015-09-19 18:30:30', 0, '2015-09-19 18:30:30', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the jos_assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 61, 'Getting Started', 'getting-started', '<p>It''s easy to get started creating your website. Knowing some of the basics will help.</p><h3>What is a Content Management System?</h3><p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.</p><p>In this site, the content is stored in a <em>database</em>. The look and feel are created by a <em>template</em>. Joomla! brings together the template and your content to create web pages.</p><h3>Logging in</h3><p>To login to your site use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles and modify some settings.</p><h3>Creating an article</h3><p>Once you are logged-in, a new menu will be visible. To create a new article, click on the "Submit Article" link on that menu.</p><p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.</p><div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).</div><h3>Template, site settings, and modules</h3><p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template settings. Click the "Template Settings" in the user menu.</p><p>The boxes around the main content of the site are called modules. You can modify modules on the current page by moving your cursor to the module and clicking the edit link. Always be sure to save and close any module you edit.</p><p>You can change some site settings such as the site name and description by clicking on the "Site Settings" link.</p><p>More advanced options for templates, site settings, modules, and more are available in the site administrator.</p><h3>Site and Administrator</h3><p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the "Site Administrator" link on the "User Menu" menu (visible once you login) or by adding /administrator to the end of your domain name. The same user name and password are used for both sites.</p><h3>Learn more</h3><p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href="https://docs.joomla.org" target="_blank">Joomla! documentation site</a> and on the<a href="http://forum.joomla.org" target="_blank"> Joomla! forums</a>.</p>', '', 1, 2, '2013-11-16 00:00:00', 849, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-11-16 00:00:00', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 19, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 79, 'About Us', 'about-vivo-kidney-care-foundation', '<p><img class="imgalignleft" style="padding: 0px 15px 15px 0px;" src="images/about_pic.jpg" alt="" width="265" height="183" align="left" border="0" />Vivo Kidney Care Foundation (VKCF) is a national not-for-profit organization dedicated to helping people with kidney and urologic diseases and individuals waiting for organ and tissue transplants.</p>\r\n<p>Kidney diseases affect millions of Indians, and it is reaching epidemic proportions due to an increase in diabetes, hypertensive disease, and obesity.</p>\r\n<p>We work on improving the methods of diagnosis, evaluation, treatment and care of childhood and adult kidney disease. The foundation partners with educational organizations, hospitals, and advocacy and membership groups to achieve our goals and to reach the broadest range of individuals across pan-India.</p>\r\n<h4>What Sets Us Apart?</h4>\r\n<p><img class="imgalignright" style="padding: 0px 15px 0px 15px;" src="images/about_pic2.jpg" alt="" width="235" height="157" align="right" border="0" />VKCF comprises a dedicated Executive Board, medical advisors, educated staff and volunteers who provide individualized support to patients and their families. Experienced nephrologists and transplant physicians constitute our Medical Advisory Board across various States.</p>\r\n<p>We are a phone call or e-mail click away from getting you the help you need to cope with a new diagnosis, a resource for valuable information on kidney or a window into current research treatment options or a link to a physician should you need one.</p>\r\n<p>The measure our success is based on our ability to respond meaningfully and personally to the public that includes you, a family member or a friend.</p>', '', 1, 8, '2015-09-19 18:44:29', 62, '', '2015-09-19 18:44:29', 0, 0, '0000-00-00 00:00:00', '2015-09-19 18:44:29', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 151, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 80, 'Privacy Policy', 'privacypolicy', '<h3><span style="text-decoration: underline;">Privacy Policy</span><br /><span style="text-decoration: underline;">July 1, 2015 – Version 1.01</span></h3>\r\n<p><strong>Purpose:</strong><br /> This Privacy Policy (the “Policy”) governs all aspects of how vkcf.org (“We”, “Us” and “Our”) collects, uses, maintains and discloses Personal Information from users (“Users”, “You” and “Your”) through their website, <a href="http://www.vkcf.org" target="_blank">http://www.vkcf.org</a> (“Site”) and through other Services (“Services”) offered by vkcf.org. vkcf.org is owned and operated by Vivo Kidney Care Foundation (VKCF) a national not-for-profit organization dedicated to helping people with kidney and urologic diseases.</p>\r\n<p><strong>Information we gather from you:</strong><br /> We may from time-to-time gather your personal information, either online or in person or through social media or other electronic modes of communication, during the course when you donate, or enter a request, sign up to our information sheet or register your interest as a potential volunteer .</p>\r\n<p>The personal information we gather consist of your name, address, e-mail, PAN#, Date of Birth, Telephone numbers, donations you make or voluntary services you offer or Credit or Debit Card, Net Banking details as minimum required.</p>\r\n<p><strong>Privacy of Personal Information:</strong><br /> The personal information is not distributed, shared, rented or given to companies or organizations that are not part of the Vivo Kidney Care Foundation or its sister organizations. Authorized employees within the company on a need to know basis only use any information collected from you.</p>\r\n<p>However, we may disclose your personal information</p>\r\n<ul>\r\n<li>as required by law, only to such legally authorized personal</li>\r\n<li>when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request,</li>\r\n<li>to any other third party as required by you or with your prior consent to do so.</li>\r\n</ul>\r\n<p><strong>Your right:</strong><br /> You have the right to request for a copy of the personal information we have of you on the proviso that we are given reasonable notice of such a request through email on <a href="mailto:contactus@vkcf.org">contactus@vkcf.org</a></p>\r\n<p>You are requested to retain copies of any literature issued in relation to the provision of our services.</p>\r\n<p><strong>Our Commitment:</strong><br /> We are committed to protecting your privacy and adhere to the laws as passed by Indian Parliament from time to time.</p>\r\n<p>All content contained on the vkcf.org website is intended only for people 18 years of age and over and we do not knowingly collect or use Personal Information from anyone under the age of 18.</p>\r\n<p>We will not sell, share, or rent your personal information to any third party or use your e-mail address for unsolicited mail. Any emails sent by us will only be in connection with the provision of agreed services and products.</p>\r\n<p><strong>Questions:</strong><br /> Please also refer to our Terms &amp; Conditions for the contractual relationships and usage of our site and services.</p>\r\n<p>If you have any questions further about our privacy practices or you wish to access your personal information, please send us an email to <a href="mailto:contactus@vkcf.org">contactus@vkcf.org</a></p>', '', 1, 17, '2015-09-19 18:46:08', 62, '', '2015-09-19 18:46:08', 0, 0, '0000-00-00 00:00:00', '2015-09-19 18:46:08', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 149, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 81, '12A Registration# of IT Act', '12a-registration-of-it-act', '<p><a href="index.php/approvals"><strong>Back</strong></a></p>\r\n<p><img src="images/12a-registration-of-it-act.jpg" alt="" width="550" height="900" border="0" /></p>', '', 1, 18, '2015-09-19 18:47:26', 62, '', '2015-09-19 21:22:38', 62, 0, '0000-00-00 00:00:00', '2015-09-19 18:47:26', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 51, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 82, 'Advocacy', 'advocacy-vivo-kidney-care-foundation', '<p><img class="imgalignright" style="padding: 0px 15px 0px 15px; border: 0; float: right;" src="images/advocacy.jpg" alt="" width="233" height="164" border="0" /><strong>What is Advocacy?</strong><br />Advocacy is the act of supporting a cause, idea or position that you are passionate about.</p>\r\n<p><strong>Who are VKCF Advocates?</strong><br />A VKCF Advocate is someone who has been affected by kidney disease, donation or transplant in some way - people with chronic kidney disease, dialysis patients, transplant recipients, living donors, donor family members, caregivers, friends and family members - and who wants to empower and educate others.</p>\r\n<p><strong>Why become an VKCF Advocate?</strong></p>\r\n<p>Advocacy plays an integral role in our mission. You can make a significant difference in the lives of kidney patients by representing the VKCF so that patients voices can be heard.</p>\r\n<p><strong>How can I Participate ?</strong></p>\r\n<p><img class="imgalignright" style="padding: 0px 15px 0px 15px;" src="images/advocacy2.jpg" alt="" align="right" border="0" />Here are some of the ways you can be an advocate for those affected by kidney disease, donation and transplantation:</p>\r\n<ul>\r\n<li>\r\n<p>Join our VKCF Group sessions to learn about how to use your voice on public policy issues relating to donation, transplantation and kidney disease. You will receive email alerts and guidance for contacting your elected officials. It''s quick and easy to make a difference!</p>\r\n</li>\r\n<li>\r\n<p>Share your personal story. You never know who you will connect with or impact! Speak at local community events; share your story with the VKCF for possible inclusion on our web site or in our newsletter; connect with others on VKCF Facebook page.</p>\r\n</li>\r\n<li>\r\n<p>Volunteer with your local VKCF office.</p>\r\n</li>\r\n<li>\r\n<p>Write a Letter to the Editor of your local newspaper about an VKCF event coming up that you are participating in, or about specific legislation in Parliament that is really important to you as a kidney patient.</p>\r\n</li>\r\n<li>\r\n<p>Attend VKCF events.</p>\r\n</li>\r\n<li>\r\n<p>Invite your local Government officials to attend a local event or program when they are available.</p>\r\n</li>\r\n<li>\r\n<p>Raise awareness about the importance of kidneys, risk factors for kidney disease, and steps to take to keep kidneys healthy by presenting VKCFs Awareness Program.</p>\r\n</li>\r\n<li>\r\n<p>Sign up as an organ and tissue donor through available registry.</p>\r\n</li>\r\n<li>\r\n<p>It is also very important to tell your family of your wishes. You can also find information about living kidney donation on our website shortly.</p>\r\n</li>\r\n<li>\r\n<p>Help VCKF programs by making a financial contribution.</p>\r\n</li>\r\n</ul>', '', 1, 16, '2015-09-19 18:48:34', 62, '', '2015-09-19 18:48:34', 0, 0, '0000-00-00 00:00:00', '2015-09-19 18:48:34', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 100, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 83, 'Approvals', 'approvals-vivo-kidney-care-foundation', '<p><strong>Please click on the relevant approval number to view the document</strong></p>\r\n<table border="0" width="700">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<p><strong>Corporate Identity Number </strong></p>\r\n</td>\r\n<td> </td>\r\n<td>\r\n<p><a href="index.php/corporate-identity-number">U85300MH2013NPL249125(Mumbai), dated 11 Oct 2013</a></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>Permanent Account Number </strong></p>\r\n</td>\r\n<td> </td>\r\n<td>\r\n<p><a href="index.php/permanent-account-number">AAECV6262A</a></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>Licence U/S 25 of ICA 1956</strong></p>\r\n</td>\r\n<td> </td>\r\n<td>\r\n<p><a href="index.php/licence-u-s-25-of-ica-1956">ROC25(1)/SRNB78629052/86/9/2013/4224, dated 12 Sep 2013</a></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>12A Registration# of IT Act</strong></p>\r\n</td>\r\n<td> </td>\r\n<td>\r\n<p><a href="index.php/12a-registration-of-it-act">46870, dated 27 Aug 2015</a></p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p><strong>Certificate U/S 80G of IT Act</strong></p>\r\n</td>\r\n<td> </td>\r\n<td>\r\n<p><a href="index.php/certificate-u-s-80g-of-it-act">DIT(E)/80G/498/2014-15, dated 12 Sep 2014</a></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '', 1, 18, '2015-09-19 18:50:05', 62, '', '2015-09-19 21:19:38', 62, 0, '0000-00-00 00:00:00', '2015-09-19 18:50:05', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 4, '', '', 1, 154, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 84, 'Certificate U/S 80G of IT Act', 'certificate-u-s-80g-of-it-act', '<p><a href="index.php/approvals"><strong>Back</strong></a></p>\r\n<p><img src="images/certificate-us-80g-of-it-act.jpg" alt="" width="550" height="900" border="0" /></p>', '', 1, 18, '2015-09-19 18:51:41', 62, '', '2015-09-19 21:24:37', 62, 0, '0000-00-00 00:00:00', '2015-09-19 18:51:41', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 3, '', '', 1, 66, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 85, 'Contact Us', 'contact-us', '<table width="550px" cellspacing="0" cellpadding="5">\r\n<tbody>\r\n<tr>\r\n<td width="130px">\r\n<p>Contact Person</p>\r\n</td>\r\n<td>\r\n<p>D.Shaikh</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Registered Address</p>\r\n</td>\r\n<td>\r\n<p>Vivo Kidney Care Foundation,<br /> 23 Rainbow, Vidyanagari,<br /> Santacruz (East),<br /> Mumbai – 400 098.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Operating Address</p>\r\n</td>\r\n<td>\r\n<p>Vivo Kidney Care Foundation,<br /> 5,Creative Industries Building, <br /> Sunder Nagar Road No.2,<br /> Off CST Road, Kalina, Santacruz (East),<br /> Mumbai – 400 098.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Hours of operation</p>\r\n</td>\r\n<td>\r\n<p>10 a.m. to 6 p.m.</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Mobile #</p>\r\n</td>\r\n<td>\r\n<p>+91-9820925470</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Landline #</p>\r\n</td>\r\n<td>\r\n<p>+91-22-26652024</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p>Email Id</p>\r\n</td>\r\n<td>\r\n<p><span style="text-decoration: underline;">contactus@vkcf.org</span></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p> </p>', '', 1, 10, '2015-09-19 18:52:28', 62, '', '2015-09-19 18:52:28', 0, 0, '0000-00-00 00:00:00', '2015-09-19 18:52:28', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 115, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(9, 86, 'Corporate Identity Number', 'corporate-identity-number', '<p><a href="index.php/approvals"><strong>Back</strong></a></p>\r\n<p><img src="images/corporate-identity-number.jpg" alt="" width="550" height="900" border="0" /></p>', '', 1, 18, '2015-09-19 18:53:34', 62, '', '2015-09-21 10:40:28', 62, 0, '0000-00-00 00:00:00', '2015-09-19 18:53:34', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 2, '', '', 1, 49, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(10, 87, 'Donate', 'donate-vivo-kidney-care-foundation', '<p><img class="imgalignright" src="images/donate.jpg" alt="" width="190" height="137" align="right" border="0" />The Vivo Kidney Care Foundation sustains its programs with the help and support of many people. As a non profit organization that receives no government funding, we rely on your contribution and partnerships with corporations who have CSR(Corporate Social Responsibility) Programs.</p>\r\n<p>We plan to run a number of Fund Raising Campaigns throughout the year, such as:</p>\r\n<ul>\r\n<li>\r\n<p><strong>Kidney Awareness Walk Programs <br /></strong>With these events we bring together the patient and professional communities while promoting public awareness and raising much needed contributions to continue our work.</p>\r\n</li>\r\n<li>\r\n<p><strong>Musical Events<br /></strong>A few high profile performers have committed to being a part of our initiative and help raise monies for identified causes.</p>\r\n</li>\r\n<li>\r\n<p><strong>Corporate Golf Event</strong><br />We are currently in talks with a some large corporate houses to jointly create awareness about kidney disease and support the foundation.</p>\r\n</li>\r\n<li>\r\n<p><strong>Individual Donations</strong><br />We believe every little contribution counts. We constantly endeavor to get global donors sponsor less-privileged patients for renal care. Vivo Kidney Care Foundation has obtained Section 80 G approval from Government of India, thus making the donations eligible for tax-deductions.</p>\r\n</li>\r\n</ul>', '', 1, 14, '2015-09-19 18:54:47', 62, '', '2016-03-15 05:51:17', 62, 0, '0000-00-00 00:00:00', '2015-09-19 18:54:47', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 103, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(11, 88, 'Licence U/S 25 of ICA 1956', 'licence-u-s-25-of-ica-1956', '<p><a href="index.php/approvals"><strong>Back</strong></a></p>\r\n<p><img src="images/licence-us-25-of-ica-1956.jpg" alt="" border="0" /></p>', '', 1, 18, '2015-09-19 18:55:58', 62, '', '2015-09-19 21:25:37', 62, 0, '0000-00-00 00:00:00', '2015-09-19 18:55:58', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 1, '', '', 1, 49, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(12, 89, 'Our Work', 'our-work-vivo-kidney-care-foundation', '<p>The Vivo Kidney Care Foundation is actively involved in a wide range of activities from education and awareness to diagnosis and treatment.</p>\r\n<p><img class="imgalignright" style="padding: 0px 15px 0px 15px;" src="images/ourwork.jpg" alt="" align="right" border="0" /></p>\r\n<ul>\r\n<li>\r\n<p><strong>Quality Educational Conferences<br /></strong>Vivo Kidney Care Foundation (VKCF) organises significant conferences for physicians and other medical professionals in the nephrology, urology and transplant communities. The purpose of this is to foster discussions on issues of concern in the renal, transplant communities. <br />The planning of these conferences is driven by prominent physicians, allied medical professionals and thought leaders. These experts in their respective fields help create a rich and focused curriculum for medical caregivers, facilitate discussion, and promote professional networking. The ultimate goal of our continuing education programs is to provide the information and tools that can lead to improved patient outcomes.</p>\r\n</li>\r\n<li>\r\n<p><strong>The Vivo Kidney Care Foundation (VKCF) Data Institute<br /></strong>The institute maintains a registry of Patient Information on the diagnoses and demographics of kidney patients being screened for renal diseases. This information provides physicians with baseline data to better understand the prevalence and impact of kidney disease among Indian patients and the results of the Patient Registry can be used to work with Ministry of Health in India for grants to help treatment in rural areas.</p>\r\n</li>\r\n<li>\r\n<p><strong>Sponsoring Education Programs<br /></strong>We provide subsidized training programs to dialysis technicians and nurses from weaker sections of the society and get them employed with healthcare institutions.</p>\r\n</li>\r\n<li>\r\n<p><strong><img class="imgalignright" style="padding: 0px 15px 0px 15px;" src="images/ourwrk2.jpg" alt="" align="right" border="0" />Supporting Renal Care Needs<br /></strong>VKCF treats people with renal and urological disease from lesser privileged sections of society by working with social organizations and individual donors worldwide.</p>\r\n</li>\r\n<li>\r\n<p><strong>Maintaining Donor Organ Registry <br /></strong>We work closely with Health care local administration of helping needy patients get donors.</p>\r\n</li>\r\n<li><strong>Organising Corporate Screening Camps <br /></strong>In association with corporate houses, VKCF regularly holds preventive kidney care checkups and knowledge sharing workshops on precautions to be taken.</li>\r\n<li>\r\n<p><strong>Working with Social Organizations</strong><br />VCKF collaborates closely with Rotary, Lions, Jaycees and other charitable foundations to support Mobile Dialysis care in rural areas.</p>\r\n</li>\r\n</ul>', '', 1, 9, '2015-09-19 18:56:56', 62, '', '2015-09-19 18:56:56', 0, 0, '0000-00-00 00:00:00', '2015-09-19 18:56:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 116, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(13, 90, 'Permanent Account Number', 'permanent-account-number', '<p><a href="index.php/approvals"><strong>Back</strong></a></p>\r\n<p><img src="images/pan.jpg" alt="" width="550" height="900" border="0" /></p>', '', 1, 18, '2015-09-19 18:58:01', 62, '', '2015-09-19 21:26:32', 62, 0, '0000-00-00 00:00:00', '2015-09-19 18:58:01', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 46, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(14, 91, 'Video', 'video-vivo-kidney-care-foundation', '<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis Center - Akola - Vivo Kidney Care</strong></p>\r\n<p style="text-align: justify;">With Fresenius dialysis machines, a world famous Gambro RO water purification system and state of the art US clinical procedures and protocols followed by our staff, all kidney patients can now access world class facilities at our dialysis center at Akola.</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/z8E_rquBRLU" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis Center - Nagpur - Vivo Kidney Care </strong></p>\r\n<p style="text-align: justify;">With Fresenius dialysis machines, a world famous Gambro RO water purification system and state of the art US clinical procedures and protocols followed by our staff, all kidney patients can now access world class facilities at our dialysis center at Akola.</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/sAY0tN7wxTw" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Sanjay Bhoyar at Nagpur </strong></p>\r\n<p style="text-align: justify;">Watch Sanjay speak about Vivo Kidney Care''s kidney dialysis center at Nagpur. Sanjay is being treated for past 6-7 months at our world class facilities and has seen an improvement in his health. You can contribute to our non-profit, Vivo Kidney Care Foundation at vkcf.org or visit our website vivokidneycare.com to help patients like Sanjay get back to a normal life.</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/kjZooaEdaWc" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Certificate Course in Dialysis Technology - Vivo Kidney Care</strong></p>\r\n<p style="text-align: justify;">The primary focus of the certified hemodialysis technologist is to undertake hemodialysis treatment for patients with acute and end stage renal failure and to provide technical expertise, equipment monitoring and machine maintenance.</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/-TnGgoHg50Q" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Swapnil Jiwane at Nagpur </strong></p>\r\n<p style="text-align: justify;">Watch Swapnil speak about lack of medical facilities for kidney care in Nagpur and his experience with Vivo Kidney Care''s dialysis center. He started dialysis due to overdose of creatine (as recommended by his gym instructor). You can contribute to our non-profit, Vivo Kidney Care Foundation at vkcf.org or visit our website vivokidneycare.com to help patients like Swapnil get back to a normal life.</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/Z9di4JVhkhs" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Prahlad Chaudhari at Nagpur </strong></p>\r\n<p style="text-align: justify;">Watch Prahlad speak about his financial difficulties in availing quality kidney dialysis services in Nagpur. You can contribute to our non-profit, Vivo Kidney Care Foundation at vkcf.org or visit our website vivokidneycare.com to help patients like Prahlad lead a normal life.</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/KG0XmIj03B4" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Aruna Shrirame at Nagpur </strong></p>\r\n<p style="text-align: justify;">Watch Arun speak about difficulties in availing quality kidney dialysis services for his wife Aruna in Nagpur and how Vivo Kidney Care has improved her health. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/FnohZ1YEUJA" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Rani Khobragade at Nagpur </strong></p>\r\n<p style="text-align: justify;">Watch Rani speak about her difficulties in availing quality kidney dialysis services in Nagpur and how Vivo Kidney Care has come to help. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/ShuH5uDMHzg" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Ganesh Kanojia at Nagpur </strong></p>\r\n<p style="text-align: justify;">Watch Ganesh speak about his difficulties in availing quality kidney dialysis services in Nagpur and how Vivo Kidney Care has come to help. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/U5q1wrM7aTs" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Ashish Gaikwad at Nagpur </strong></p>\r\n<p style="text-align: justify;">Watch Ashish speak about his difficulties in availing quality kidney dialysis services in Nagpur and how Vivo Kidney care has come to help. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/KnMELpFdRss" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<hr />\r\n<table>\r\n<tbody>\r\n<tr>\r\n<td width="60%">\r\n<p><strong>Patients speak about Vivo Kidney Care </strong></p>\r\n<p style="text-align: justify;">Watch different patients speak about Vivo Kidney Care.You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com</p>\r\n</td>\r\n<td>\r\n<p> </p>\r\n<center><object data="http://www.youtube.com/embed/ASuyCqIK-qU" width="200" height="100"></object></center></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p> </p>', '', 1, 11, '2015-09-19 18:59:19', 62, '', '2015-09-19 18:59:19', 0, 0, '0000-00-00 00:00:00', '2015-09-19 18:59:19', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 126, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(15, 92, 'Volunteer', 'volunteer-vivo-kidney-care-foundation', '<p><img class="imgalignright" style="padding: 0px 15px 0px 15px;" src="images/volunteer.jpg" alt="" width="179" height="120" align="right" border="0" />By giving some of your time, you can actually help improve the quality of life a kidney patient in India.</p>\r\n<p>Whether you volunteer on a regular basis or just occasionally, making the difference begins with you, and your involvement will be appreciated.</p>\r\n<p>Here''s what you can do with these <strong>Volunteer Opportunities</strong></p>\r\n<ul>\r\n<li>\r\n<p>Participate in the annual Walk-A-Thon as an Individual Walker, Team Captain, or as a volunteer on walk day.</p>\r\n</li>\r\n<li>\r\n<p>Help us brighten the holidays for many local dialysis patients by preparing to spend time with them during festivals.</p>\r\n</li>\r\n<li>\r\n<p>Volunteer at a Patient Education Conference where patients gather free-of-charge for a full day of instruction on a variety of kidney disease subjects.</p>\r\n</li>\r\n<li>\r\n<p>Help with office assistance for seasonal mailings.</p>\r\n</li>\r\n<li>\r\n<p>Serve as a peer counselor for newly diagnosed patients and/or transplant recipients.</p>\r\n</li>\r\n</ul>\r\n<p>Come Volunteer today!</p>', '', 1, 13, '2015-09-19 19:00:41', 62, '', '2015-09-21 13:14:15', 62, 0, '0000-00-00 00:00:00', '2015-09-19 19:00:41', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 3, 0, '', '', 1, 130, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(16, 93, 'World class dialysis facility. Now available in Nagpur', 'world-class-dialysis-facility-available-now-at-nagpur', '<p><img class="imgalignleft" style="padding: 0px 15px 15px 0px;" src="images/vivo-pc-photo.jpg" alt="" width="265" height="183" align="left" border="0" />Swapnil is a poor patient who cannot afford, leave alone the prescribed <span style="line-height: 1.3em;">3 dialysis sessions, even a single</span><span style="line-height: 1.3em;"> one in</span><span style="line-height: 1.3em;"> a week. When he first came to us, he was wheelchair bound. Without proper treatment, his life would be cut short. Seeing his condition VKCF intervened, and since then Swapnil has shown amazing progress. As a bicycling patient today, he validates our quality of kidney care treatment.The Vivo clinic is rated as the best dialysis center in Nagpur.</span></p>', '', 1, 15, '2015-09-19 19:02:09', 62, '', '2015-09-19 21:27:44', 62, 0, '0000-00-00 00:00:00', '2015-09-19 19:02:09', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 47, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_contentitem_tag_map`
--

CREATE TABLE IF NOT EXISTS `jos_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

--
-- Dumping data for table `jos_contentitem_tag_map`
--

INSERT INTO `jos_contentitem_tag_map` (`type_alias`, `core_content_id`, `content_item_id`, `tag_id`, `tag_date`, `type_id`) VALUES
('com_content.article', 1, 1, 2, '2013-11-16 06:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_types`
--

CREATE TABLE IF NOT EXISTS `jos_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `jos_content_types`
--

INSERT INTO `jos_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"jos_content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"jos_contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"jos_newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"} ]}'),
(4, 'User', 'com_users.user', '{"special":{"dbtable":"jos_users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(5, 'Article Category', 'com_content.category', '{"special":{"dbtable":"jos_categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"}]}'),
(6, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"jos_categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"jos_categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"jos_tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"}]}'),
(9, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"jos_banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"jos_banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"jos_categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"}]}'),
(11, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"jos_banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(12, 'User Notes', 'com_users.note', '{"special":{"dbtable":"jos_user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"}]}'),
(13, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"jos_categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"jos_ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"jos_viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"jos_users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"jos_categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_extensions`
--

CREATE TABLE IF NOT EXISTS `jos_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10010 ;

--
-- Dumping data for table `jos_extensions`
--

INSERT INTO `jos_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":"","save_history":"1","history_limit":10}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '', '{"show_contact_category":"hide","save_history":"1","history_limit":10,"show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '', '{"newsfeed_layout":"_:default","save_history":"1","history_limit":5,"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_character_count":"0","feed_display_order":"des","float_first":"right","float_second":"right","show_tags":"1","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_cat_tags":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","filter_field":"1","show_pagination_limit":"1","show_headings":"1","show_articles":"0","show_link":"1","show_pagination":"1","show_pagination_results":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '', '{"template_positions_display":"0","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","save_history":"1","history_limit":10,"show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '', '{"allowUserRegistration":"0","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"1","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '', '{"tag_layout":"_:default","save_history":"1","history_limit":5,"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '', '{"mediaversion":"490253dfa81da07c79b6f25ae0c542cf"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '', '{"mode":"1","skin":"0","mobile":"0","entity_encoding":"raw","lang_mode":"1","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","html_height":"550","html_width":"750","resizing":"1","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","colors":"1","table":"1","smilies":"1","hr":"1","link":"1","media":"1","print":"1","directionality":"1","fullscreen":"1","alignment":"1","visualchars":"1","visualblocks":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 0, 1, 0, '', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '', '{"autoregister":"1","mail_to_user":"1","forceLogout":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(451, 'plg_search_tags', 'plugin', 'tags', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","show_tagged_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'eXtplorer', 'component', 'com_extplorer', '', 1, 1, 0, 0, '{"name":"eXtplorer","type":"component","creationDate":"22.01.2015","author":"soeren, QuiX Project","copyright":"Soeren Eberhardt-Biermann, QuiX Project","authorEmail":"info|-at|-extplorer.net","authorUrl":"http:\\/\\/extplorer.net\\/","version":"2.1.7","description":"\\n\\t<div align=\\"left\\"><img src=\\"components\\/com_extplorer\\/images\\/eXtplorer_logo.png\\" alt=\\"eXtplorer Logo\\" \\/><\\/div>\\n\\t<h2>Successfully installed eXtplorer&nbsp;<\\/h2>\\n\\teXtplorer is a powerful File- and FTP\\/WebDAV Manager script. \\n\\t<br\\/>It allows \\n\\t  <ul><li>Browsing Directories & Files,<\\/li>\\n\\t  <li>Editing, Copying, Moving and Deleting files,<\\/li>\\n\\t  <li>Searching, Uploading and Downloading files,<\\/li>\\n\\t  <li>Creating new Files and Directories,<\\/li>\\n\\t  <li>Creating and Extracting Archives with Files and Directories,<\\/li>\\n\\t  <li>Changing file permissions (chmod)<\\/li><\\/ul><br\\/>and much more.<br\\/><br\\/>\\n\\t  <strong>By default restricted to Superadministrators!<\\/strong>\\n\\t","group":"","filename":"extplorer"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'Akeeba', 'component', 'com_akeeba', '', 1, 1, 0, 0, '{"name":"Akeeba","type":"component","creationDate":"2015-08-06","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2006-2014 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"4.3.1","description":"Akeeba Backup Core - Full Joomla! site backup solution, Core Edition.","group":"","filename":"akeeba"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'F0F (NEW) DO NOT REMOVE', 'library', 'lib_f0f', '', 0, 1, 1, 0, '{"name":"F0F (NEW) DO NOT REMOVE","type":"library","creationDate":"2015-07-20 16:28:08","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2014 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"rev8F10700-1437402488","description":"Framework-on-Framework (FOF) newer version - DO NOT REMOVE - The rapid component development framework for Joomla!. This package is the newer version of FOF, not the one shipped with Joomla! as the official Joomla! RAD Layer. The Joomla! RAD Layer has ceased development in March 2014. DO NOT UNINSTALL THIS PACKAGE, IT IS *** N O T *** A DUPLICATE OF THE ''FOF'' PACKAGE. REMOVING EITHER FOF PACKAGE WILL BREAK YOUR SITE.","group":"","filename":"lib_f0f"}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'AkeebaStrapper', 'file', 'AkeebaStrapper', '', 0, 1, 0, 0, '{"name":"AkeebaStrapper","type":"file","creationDate":"2015-07-20 16:28:08","author":"Nicholas K. Dionysopoulos","copyright":"(C) 2012-2013 Akeeba Ltd.","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"rev8F10700-1437402488","description":"Namespaced jQuery, jQuery UI and Bootstrap for Akeeba products.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'System - Google Maps', 'plugin', 'plugin_googlemap3', 'system', 0, 0, 1, 0, '{"name":"System - Google Maps","type":"plugin","creationDate":"July 2014","author":"Mike Reumer","copyright":"(C) 2014 Reumer","authorEmail":"tech@reumer.net","authorUrl":"tech.reumer.net","version":"3.3","description":"PLUGIN_GOOGLE_MAP3_INSTALLATION","group":"","filename":"plugin_googlemap3"}', '{"publ":"","debug":"0","plugincode":"mosmap","brackets":"{","Google_API_version":"3","visualrefresh":"0","signedin":"0","show":"1","mapclass":"","mapprint":"icon","mapcss":"\\/* For img in the map remove borders, shadow, no margin and no max-width\\r*\\/\\r.map img, .svPanel img {\\r    border: 0px;\\r    box-shadow: none;\\r    margin: 0px !important;\\r    padding: 0px !important;\\r    max-width: none !important;\\r    background: none !important;\\r}\\r\\r\\/* Make sure the directions are below the map\\r*\\/\\r.directions {\\r    clear: left;\\r}\\r\\r.adp-directions {\\r    width: 100%;\\r}\\r\\r\\/* Solve problems in chrome with the show of the direction steps in full width\\r*\\/\\r.adp-placemark {\\r    width : 100%;\\r}\\r\\r\\/* Padding for image overlay\\r*\\/\\r.controlDiv {\\r    padding : 5px;\\r}\\r","loadmootools":"1","timeinterval":"500","Google_API_key":"","Google_Multi_API_key":"","urlsetting":"http_host","googlewebsite":"maps.google.com","styledmap":"","align":"center","langtype":"site","lang":"","width":"500","height":"400","effect":"none","lat":"52.075581","lon":"4.541513","centerlat":"","centerlon":"","address":"","geoloc":"0","geocenter":"0","controltype":"UI","zoomType":"3D-large","svcontrol":"1","returncontrol":"1","zoom":"10","corzoom":"0","minzoom":"0","maxzoom":"19","rotation":"1","zoomnew":"0","zoomWheel":"0","keyboard":"0","mapType":"Normal","showmaptype":"1","showNormalMaptype":"1","showSatelliteMaptype":"1","showHybridMaptype":"1","showTerrainMaptype":"1","showscale":"0","overview":"0","dragging":"1","marker":"1","icon":"","iconwidth":"","iconheight":"","iconanchorx":"","iconanchory":"","iconshadow":"","iconshadowwidth":"","iconshadowheight":"","iconimagemap":"","traffic":"0","transit":"0","bicycle":"0","panoramio":"0","panominzoom":"none","panomaxzoom":"none","pano_userid":"","pano_tag":"","weather":"0","weathercloud":"0","weatherinfo":"1","weathertempunit":"celsius","weatherwindunit":"km","dir":"0","dirtype":"D","formdirtype":"1","avoidhighways":"0","avoidtoll":"0","diroptimize":"0","diralternatives":"0","showdir":"1","animdir":"0","animspeed":"1","animautostart":"0","animunit":"kilometers","formspeed":"0","formaddress":"0","formdir":"0","autocompl":"both","langanim":"en-GB;The requested panorama could not be displayed|Could not generate a route for the current start and end addresses|Street View coverage is not available for this route|You have reached your destination|miles|miles|ft|kilometers|kilometer|meters|In|You will reach your destination|Stop|Drive|Press Drive to follow your route|Route|Speed|Fast|Medium|Slow","txtdir":"Directions: ","txtgetdir":"Get Directions","txtfrom":"From here","txtto":"To here","txtdiraddr":"Address: ","txt_driving":"","txt_avhighways":"","txt_avtoll":"","txt_walking":"","txt_bicycle":"","txt_transit":"","txt_optimize":"","txt_alternatives":"","inputsize":"25","dirdefault":"0","gotoaddr":"0","gotoaddrzoom":"0","gotoaddrtimeout":"5000","txtaddr":"Address: ##","erraddr":"Address ## not found!","txtgotoaddr":"Goto","clientgeotype":"google","lightbox":"0","txtlightbox":"Open lightbox","lbxcaption":"","lbxwidth":"500","lbxheight":"700","lbxcenterlat":"","lbxcenterlon":"","lbxzoom":"","sv":"none","svpano":"","svwidth":"100%","svheight":"300","svyaw":"0","svpitch":"0","svzoom":"","svautorotate":"0","svaddress":"1","kmlrenderer":"google","kmlsidebar":"none","kmlsbwidth":"200","kmlfoldersopen":"0","kmlhide":"0","kmlscale":"0","kmlopenmethod":"click","kmlsbsort":"none","kmllightbox":"0","kmlmessshow":"0","kmlclickablemarkers":"1","kmlzoommarkers":"0","kmlopendivmarkers":"","kmlcontentlinkmarkers":"0","kmllinkablemarkers":"0","kmllinktarget":"_self","kmllinkmethod":"dblclick","kmlhighlite":"{ ''color'': ''#aaffff'', ''opacity'': 0.3,  ''textcolor'': ''#000000'' }","kmlmarkerlabel":"100","kmlmarkerlabelclass":"","kmlpolylabel":"100","kmlpolylabelclass":"","proxy":"0","txtsrchnrby":"Search nearby","txtzoomhere":"Zoom Here","txtaddrstart":"Start address:","txtkmlgetdir":"Go","txtback":"\\u00ab Back","txtsearchnearby":"Search nearby: e.g. pizza","txtsearch":"Go","maxcluster":"","clustericonurl":"\\/media\\/plugin_googlemap3\\/site\\/geoxmlv3\\/images\\/m","gridsize":"","minmarkerscluster":"","maxlinesinfocluster":"","clusterinfowindow":"click","clusterzoom":"dblclick","clustermarkerzoom":"16","txtzoomin":"Zoom in to show more","txtclustercount1":"...and","txtclustercount2":"more","tilelayer":"","tilemethod":"","tileopacity":"1","tilebounds":"","tileminzoom":"0","tilemaxzoom":"19","imageurl":"","imageposition":"RIGHT_TOP","imageindex":"1","imagewidth":"","imageheight":"","twittername":"","twittertweets":"15","twittericon":"\\/media\\/plugin_googlemap3\\/site\\/Twitter\\/twitter_map_icon.png","twitterline":"#ff0000ff","twitterlinewidth":"4","twitterstartloc":"0,0,0","twitterconsumerkey":"","twitterconsumersecret":"","twitteraccesstoken":"","twitteraccesstokensecret":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'System - Autologin', 'plugin', 'autologin', 'system', 0, 1, 1, 0, '{"name":"System - Autologin","type":"plugin","creationDate":"01 August 2013","author":"Andrea Parmeggiani","copyright":"(C) 2013 Andrea Parmeggiani","authorEmail":"info@textarea.it","authorUrl":"http:\\/\\/www.textarea.it\\/","version":"2.5.2","description":"Autologin allows to auto login a user by only passing username and password thru request variables (user and passw)","group":"","filename":"autologin"}', '{"urlredirect":"","authmethod":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'it_zen', 'template', 'it_zen', '', 0, 1, 1, 0, '{"name":"it_zen","type":"template","creationDate":"May 2015","author":"IceTheme","copyright":"Copyright (C) 2008 - 2015 IceTheme.com","authorEmail":"info@icetheme.com","authorUrl":"","version":"1.0","description":"\\n\\t\\n\\t<p class=\\"alert alert-info lead\\">Calming and tranquil with an emphasis on whitespace and open design. The perfect Joomla Template in case you want to finish your next website with ease, plus its FREE!<\\/p>\\n\\t<ul class=\\"nav nav-tabs nav-stacked\\">\\n\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/www.icetheme.com\\/themes\\/it-zen\\">Template Page<\\/a><\\/li>\\n\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/demo.icetheme.com\\/?template=it_zen\\">View Demo<\\/a><\\/li>\\n\\t\\t<li><a target=\\"_blank\\" href=\\"http:\\/\\/icetheme.com\\/forums\\">Get Support<\\/a><\\/li>\\n\\t<\\/ul>\\n\\t","group":"","filename":"templateDetails"}', '{"TemplateStyle":"style1","TemplateCustomColor":"#48D1CC","":"","logo":"","responsivebarlogo":"","sidebar_position":"right","sidebar_span":"normal","go2top":"1","hidefrontpage":"1","it_params_welcome":"1","it_params_equalcols":"1","showcase_image":"","responsive_template":"1","advanced_bootstrap":"1","advanced_animations":"1","icelogo":"1","offline_h2":"Our Website is Coming Soon!","offline_p":"","offline_form":"1","offline_count":"1","offline_count_time":"31 December 2013 12:00:00","offline_newsletter":"","offline_social":"","custom_css_code":"\\/* Enter Your CSS Code below  *\\/"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'JJ Social Slider', 'module', 'mod_social_slider', '', 0, 1, 0, 0, '{"name":"JJ Social Slider","type":"module","creationDate":"7th Dec 2012","author":"JoomJunk","copyright":"Copyright (C) 2014 JoomJunk","authorEmail":"admin@joomjunk.co.uk","authorUrl":"http:\\/\\/www.joomjunk.co.uk","version":"1.6.0","description":"JJ_SOCIAL_SLIDER_DESC","group":"","filename":"mod_social_slider"}', '{"facebook":"1","facebook_link":"http:\\/\\/facebook.com","twitter":"1","twitter_link":"http:\\/\\/twitter.com","google":"1","google_link":"http:\\/\\/plus.google.com","myspace":"1","myspace_link":"http:\\/\\/myspace.com","youtube":"1","youtube_link":"http:\\/\\/youtube.com","linkedin":"1","linkedin_link":"http:\\/\\/linkedin.com","steam":"1","steam_link":"http:\\/\\/steampowered.com","lastfm":"1","lastfm_link":"http:\\/\\/last.fm","pinterest":"1","pinterest_link":"http:\\/\\/pinterest.com","soundcloud":"1","soundcloud_link":"http:\\/\\/soundcloud.com","tumblr":"1","tumblr_link":"http:\\/\\/tumblr.com","github":"1","github_link":"http:\\/\\/github.com","flickr":"1","flickr_link":"http:\\/\\/flickr.com","rss":"1","rss_link":"http:\\/\\/link-to-rss-feed.com","vimeo":"1","vimeo_link":"http:\\/\\/vimeo.com","custom1":"0","custom1_text":"Follow via Custom 1","custom1_colour":"#000000","custom1_link":"http:\\/\\/example.com","custom1_image":"icon.png","custom2":"0","custom2_text":"Follow via Custom 2","custom2_colour":"#000000","custom2_link":"http:\\/\\/example.com","custom2_image":"icon.png","custom3":"0","custom3_text":"Follow via Custom 3","custom3_colour":"#000000","custom3_link":"http:\\/\\/example.com","custom3_image":"icon.png","custom4":"0","custom4_text":"Follow via Custom 4","custom4_colour":"#000000","custom4_link":"http:\\/\\/example.com","custom4_image":"icon.png","custom5":"0","custom5_text":"Follow via Custom 5","custom5_colour":"#000000","custom5_link":"http:\\/\\/example.com","custom5_image":"icon.png","slide_colour":"#33353B","text_colour":"#FFFFFF","position":"left","top_bottom":"top","top":"10","disable":"0","tablet_width":"768px","mobile_width":"480px","icon_colour":"white","tab":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'Slideshow CK', 'module', 'mod_slideshowck', '', 0, 1, 0, 0, '{"name":"Slideshow CK","type":"module","creationDate":"Avril 2012","author":"C\\u00e9dric KEIFLIN","copyright":"C\\u00e9dric KEIFLIN","authorEmail":"ced1870@gmail.com","authorUrl":"http:\\/\\/www.joomlack.fr","version":"1.4.12","description":"MOD_SLIDESHOWCK_XML_DESCRIPTION","group":"","filename":"mod_slideshowck"}', '{"slidesssource":"slidesmanager","slides":"[{|qq|imgname|qq|:|qq|modules\\/mod_slideshowck\\/images\\/slides\\/bridge.jpg|qq|,|qq|imgcaption|qq|:|qq|This bridge is very long|qq|,|qq|imgtitle|qq|:|qq|This is a bridge|qq|,|qq|imgthumb|qq|:|qq|..\\/modules\\/mod_slideshowck\\/images\\/slides\\/bridge.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|modules\\/mod_slideshowck\\/images\\/slides\\/road.jpg|qq|,|qq|imgcaption|qq|:|qq|This slideshow uses a JQuery script adapted from <a href=|dq|http:\\/\\/www.pixedelic.com\\/plugins\\/camera\\/|dq|>Pixedelic<\\/a>|qq|,|qq|imgtitle|qq|:|qq|On the road again|qq|,|qq|imgthumb|qq|:|qq|..\\/modules\\/mod_slideshowck\\/images\\/slides\\/road.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|modules\\/mod_slideshowck\\/images\\/slides\\/big_bunny_fake.jpg|qq|,|qq|imgcaption|qq|:|qq||qq|,|qq|imgtitle|qq|:|qq||qq|,|qq|imgthumb|qq|:|qq|..\\/modules\\/mod_slideshowck\\/images\\/slides\\/big_bunny_fake.jpg|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq|http:\\/\\/player.vimeo.com\\/video\\/2203727|qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|}]","skin":"camera_amber_skin","alignment":"center","loader":"pie","width":"auto","height":"62%","navigation":"2","thumbnails":"1","thumbnailwidth":"100","thumbnailheight":"75","pagination":"1","effect":"random","time":"7000","transperiod":"1500","captioneffect":"random","portrait":"0","autoAdvance":"1","hover":"1","displayorder":"normal","limitslides":"","fullpage":"0","imagetarget":"_parent","container":"","usemobileimage":"0","mobileimageresolution":"640","loadjquery":"1","loadjqueryeasing":"1","loadjquerymobile":"1","autocreatethumbs":"1","cache":"1","cache_time":"900","cachemode":"itemid","articlelength":"150","articlelink":"readmore","articletitle":"h3","showarticletitle":"1","captionstylesusefont":"1","captionstylestextgfont":"Droid Sans","captionstylesfontsize":"12px","captionstylesfontcolor":"","captionstylesfontweight":"normal","captionstylesdescfontsize":"10px","captionstylesdescfontcolor":"","captionstylesusemargin":"1","captionstylesmargintop":"0","captionstylesmarginright":"0","captionstylesmarginbottom":"0","captionstylesmarginleft":"0","captionstylespaddingtop":"0","captionstylespaddingright":"0","captionstylespaddingbottom":"0","captionstylespaddingleft":"0","captionstylesusebackground":"1","captionstylesbgcolor1":"","captionstylesbgopacity":"0.6","captionstylesbgpositionx":"left","captionstylesbgpositiony":"top","captionstylesbgimagerepeat":"repeat","captionstylesusegradient":"1","captionstylesbgcolor2":"","captionstylesuseroundedcorners":"1","captionstylesroundedcornerstl":"5","captionstylesroundedcornerstr":"5","captionstylesroundedcornersbr":"5","captionstylesroundedcornersbl":"5","captionstylesuseshadow":"1","captionstylesshadowcolor":"","captionstylesshadowblur":"3","captionstylesshadowspread":"0","captionstylesshadowoffsetx":"0","captionstylesshadowoffsety":"0","captionstylesshadowinset":"0","captionstylesuseborders":"1","captionstylesbordercolor":"","captionstylesborderwidth":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'Art Universal Lightbox', 'module', 'mod_artuniversallightbox', '', 0, 1, 0, 0, '{"name":"Art Universal Lightbox","type":"module","creationDate":"August 2010","author":"Artetics","copyright":"Copyright (C) 2010 artetics.com. All rights reserved.","authorEmail":"info@artetics.com","authorUrl":"www.artetics.com","version":"1.5.3","description":"Art Universal Lightbox: module to show image gallery with lightbox effect: sexy lightbox, colobox or pretty photo.<br \\/><br \\/><br \\/>&copy;&nbsp;<a href=\\"http:\\/\\/www.artetics.com\\">Artetics.com<\\/a> - Start Point For Your Website.","group":"","filename":"mod_artuniversallightbox"}', '{"path":"","thumbnailPath":"","@spacer":"<br \\/><b>Thumbnail options <\\/b><hr \\/>","lightbox":"0","loadJQuery":"0","previewWidth":"","previewHeight":"","autoGenerateThumbs":"0","convertImageOption":"0","arotate":"","numberOfImages":"","caption":"0","singleOption":"0","singleContent":"","altTag":"","sort":"asc"}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_filters`
--

CREATE TABLE IF NOT EXISTS `jos_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `jos_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `jos_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_finder_taxonomy`
--

INSERT INTO `jos_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `jos_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_terms`
--

CREATE TABLE IF NOT EXISTS `jos_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `jos_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_finder_terms_common`
--

INSERT INTO `jos_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `jos_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `jos_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_finder_types`
--

CREATE TABLE IF NOT EXISTS `jos_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_languages`
--

CREATE TABLE IF NOT EXISTS `jos_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_languages`
--

INSERT INTO `jos_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to jos_menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to jos_extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to jos_users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=127 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 89, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 21, 26, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 22, 23, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 24, 25, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 27, 32, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 28, 29, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 30, 31, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 33, 38, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 34, 35, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 36, 37, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 39, 40, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 41, 42, 0, '*', 1),
(18, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 43, 44, 0, '*', 1),
(19, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 1, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 45, 46, 0, '*', 1),
(20, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 47, 48, 0, '', 1),
(21, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 49, 50, 0, '*', 1),
(101, 'mainmenu', 'Home', 'homepage', '', 'homepage', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"1","link_titles":"","show_intro":"","info_block_position":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"0","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 51, 52, 1, '*', 0),
(102, 'usermenu', 'Your Profile', 'your-profile', '', 'your-profile', 'index.php?option=com_users&view=profile&layout=edit', 'component', 1, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 11, 12, 0, '*', 0),
(103, 'usermenu', 'Site Administrator', '2013-11-16-23-26-41', '', '2013-11-16-23-26-41', 'administrator', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 6, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 15, 16, 0, '*', 0),
(104, 'usermenu', 'Submit an Article', 'submit-an-article', '', 'submit-an-article', 'index.php?option=com_content&view=form&layout=edit', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 3, '', 0, '{"enable_category":"0","catid":"2","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 14, 0, '*', 0),
(106, 'usermenu', 'Template Settings', 'template-settings', '', 'template-settings', 'index.php?option=com_config&view=templates&controller=config.display.templates', 'component', 1, 1, 1, 23, 0, '0000-00-00 00:00:00', 0, 6, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 17, 18, 0, '*', 0),
(107, 'usermenu', 'Site Settings', 'site-settings', '', 'site-settings', 'index.php?option=com_config&view=config&controller=config.display.config', 'component', 1, 1, 1, 23, 0, '0000-00-00 00:00:00', 0, 6, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 19, 20, 0, '*', 0),
(108, 'main', 'eXtplorer', 'extplorer', '', 'extplorer', 'index.php?option=com_extplorer&tmpl=component', 'component', 0, 1, 1, 10000, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '{}', 53, 54, 0, '', 1),
(110, 'main', 'COM_AKEEBA', 'com-akeeba', '', 'com-akeeba', 'index.php?option=com_akeeba', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_akeeba/icons/akeeba-16.png', 0, '{}', 55, 56, 0, '', 1),
(111, 'bottom', 'About Us', 'about-us', '', 'about-us', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 58, 0, '*', 0),
(112, 'bottom', 'Our Work', 'our-work', '', 'our-work', 'index.php?option=com_content&view=article&id=12', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 59, 60, 0, '*', 0),
(113, 'bottom', 'Volunteer', 'volunteer', '', 'volunteer', 'index.php?option=com_content&view=article&id=15', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 61, 62, 0, '*', 0),
(114, 'bottom', 'Share Stories', 'sharestories', '', 'sharestories', 'index.php?option=com_content&view=category&layout=blog&id=15', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"layout_type":"blog","show_category_heading_title_text":"0","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"0","show_cat_num_articles":"0","show_cat_tags":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_featured":"","show_title":"1","link_titles":"1","show_intro":"","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"","show_readmore_title":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 63, 64, 0, '*', 0),
(115, 'bottom', 'Donate', 'donate', '', 'donate', 'index.php?option=com_content&view=article&id=10', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 65, 66, 0, '*', 0),
(116, 'bottom', 'Approvals', 'approvals', '', 'approvals', 'index.php?option=com_content&view=article&id=6', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 68, 0, '*', 0),
(117, 'bottom', 'Privacy', 'privacy', '', 'privacy', 'index.php?option=com_content&view=article&id=3', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 69, 70, 0, '*', 0),
(118, 'bottom', 'Video', 'video', '', 'video', 'index.php?option=com_content&view=article&id=14', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 71, 72, 0, '*', 0),
(119, 'bottom', 'Advocacy', 'advocacy', '', 'advocacy', 'index.php?option=com_content&view=article&id=5', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 73, 74, 0, '*', 0),
(120, 'bottom', 'Contact', 'contact-us', '', 'contact-us', 'index.php?option=com_content&view=article&id=8', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 75, 76, 0, '*', 0),
(121, 'scan', 'Corporate Identity Number', 'corporate-identity-number', '', 'corporate-identity-number', 'index.php?option=com_content&view=article&id=9', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 77, 78, 0, '*', 0),
(122, 'scan', 'Permanent Account Number', 'permanent-account-number', '', 'permanent-account-number', 'index.php?option=com_content&view=article&id=13', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 79, 80, 0, '*', 0),
(123, 'scan', 'Licence U/S 25 of ICA 1956', 'licence-u-s-25-of-ica-1956', '', 'licence-u-s-25-of-ica-1956', 'index.php?option=com_content&view=article&id=11', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 81, 82, 0, '*', 0),
(124, 'scan', '12A Registration# of IT Act', '12a-registration-of-it-act', '', '12a-registration-of-it-act', 'index.php?option=com_content&view=article&id=4', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 83, 84, 0, '*', 0),
(125, 'scan', 'Certificate U/S 80G of IT Act', 'certificate-u-s-80g-of-it-act', '', 'certificate-u-s-80g-of-it-act', 'index.php?option=com_content&view=article&id=7', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"show_title":"1","link_titles":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_tags":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 85, 86, 0, '*', 0),
(126, 'top', 'Donate Now', 'donate-now', '', 'donate-now', 'index.php?option=com_wrapper&view=wrapper', 'component', 1, 1, 1, 2, 0, '0000-00-00 00:00:00', 0, 1, ' ', 9, '{"url":"http:\\/\\/vkcf.org\\/gateway\\/donation.php","scrolling":"no","width":"100%","height":"700","height_auto":"1","add_scheme":"1","frameborder":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 87, 88, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged-in Users'),
(3, 'bottom', 'Bottom Menu', ''),
(4, 'top', 'Top Menu', ''),
(5, 'scan', 'Scan', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the jos_assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'mainmenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"bottom","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 47, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 48, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 0, '{"showHere":"1","showHome":"1","homeText":"","showLast":"1","separator":"\\/","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 54, 'Popular Tags', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_tags_popular', 1, 1, '{"maximum":"10","timeframe":"alltime","order_value":"count","order_direction":"1","display_count":0,"no_results_text":"0","minsize":1,"maxsize":2,"layout":"_:default","moduleclass_sfx":"","owncache":"1","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(88, 55, 'Site Information', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_stats_admin', 3, 1, '{"serverinfo":"1","siteinfo":"1","counter":"0","increase":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(89, 56, 'Release News', '', '', 0, 'postinstall', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_feed', 1, 1, '{"rssurl":"http:\\/\\/www.joomla.org\\/announcements\\/release-news.feed","rssrtl":"0","rsstitle":"1","rssdesc":"1","rssimage":"1","rssitems":"3","rssitemdesc":"1","word_count":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(90, 57, 'Latest Articles', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_articles_latest', 1, 1, '{"catid":[""],"count":"5","show_featured":"","ordering":"c_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(91, 58, 'User Menu', '', '', 3, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"usermenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(92, 59, 'Image Module', '', '<p><img src="images/headers/blue-flower.jpg" alt="Blue Flower" /></p>', 0, 'position-3', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(93, 60, 'Search', '', '', 1, 'mainmenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_search', 1, 0, '{"label":"","width":"20","text":"","button":"0","button_pos":"right","imagebutton":"1","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(94, 65, 'JJ Social Slider', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_social_slider', 1, 1, '', 0, '*'),
(95, 66, 'Slideshow CK', '', '', 1, 'slideshow', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_slideshowck', 1, 0, '{"slidesssource":"slidesmanager","slides":"[{|qq|imgname|qq|:|qq|images\\/banner.png|qq|,|qq|imgcaption|qq|:|qq||qq|,|qq|imgtitle|qq|:|qq||qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/demo.vkcf.org\\/joomla\\/images\\/banner.png|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|_parent|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|},{|qq|imgname|qq|:|qq|images\\/banner.png|qq|,|qq|imgcaption|qq|:|qq||qq|,|qq|imgtitle|qq|:|qq||qq|,|qq|imgthumb|qq|:|qq|http:\\/\\/demo.vkcf.org\\/joomla\\/images\\/banner.png|qq|,|qq|imglink|qq|:|qq||qq|,|qq|imgtarget|qq|:|qq|default|qq|,|qq|imgalignment|qq|:|qq|default|qq|,|qq|imgvideo|qq|:|qq||qq|,|qq|slidearticleid|qq|:|qq||qq|,|qq|slidearticlename|qq|:|qq||qq|,|qq|imgtime|qq|:|qq||qq|}]","theme":"default","skin":"camera_amber_skin","alignment":"center","loader":"pie","width":"auto","height":"20%","navigation":"2","thumbnails":"1","thumbnailwidth":"100","thumbnailheight":"75","pagination":"1","effect":["random"],"time":"7000","transperiod":"1500","captioneffect":"moveFromLeft","portrait":"0","autoAdvance":"1","hover":"1","displayorder":"normal","limitslides":"","fullpage":"0","imagetarget":"_parent","container":"","usemobileimage":"0","mobileimageresolution":"640","loadjquery":"1","loadjqueryeasing":"1","loadjquerymobile":"1","autocreatethumbs":"1","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","articlelength":"150","articlelink":"readmore","articletitle":"h3","showarticletitle":"1","captionstylesusefont":"1","captionstylestextgfont":"Droid Sans","captionstylesfontsize":"12px","captionstylesfontcolor":"","captionstylesfontweight":"normal","captionstylesdescfontsize":"10px","captionstylesdescfontcolor":"","captionstylesusemargin":"1","captionstylesmargintop":"0","captionstylesmarginright":"0","captionstylesmarginbottom":"0","captionstylesmarginleft":"0","captionstylespaddingtop":"0","captionstylespaddingright":"0","captionstylespaddingbottom":"0","captionstylespaddingleft":"0","captionstylesusebackground":"1","captionstylesbgcolor1":"","captionstylesbgopacity":"0.6","captionstylesbgimage":"","captionstylesbgpositionx":"left","captionstylesbgpositiony":"top","captionstylesbgimagerepeat":"repeat","captionstylesusegradient":"1","captionstylesbgcolor2":"","captionstylesuseroundedcorners":"1","captionstylesroundedcornerstl":"5","captionstylesroundedcornerstr":"5","captionstylesroundedcornersbr":"5","captionstylesroundedcornersbl":"5","captionstylesuseshadow":"1","captionstylesshadowcolor":"","captionstylesshadowblur":"3","captionstylesshadowspread":"0","captionstylesshadowoffsetx":"0","captionstylesshadowoffsety":"0","captionstylesshadowinset":"0","captionstylesuseborders":"1","captionstylesbordercolor":"","captionstylesborderwidth":"1","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(96, 67, 'Art Universal Lightbox', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_artuniversallightbox', 1, 1, '', 0, '*'),
(97, 94, 'Bottom Menu', '', '', 1, 'footermenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"bottom","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(98, 95, 'Lady pic', '', '<p><a href="index.php/donate-now" target="_self"><img style="float: left;" src="images/lady.png" alt="" border="0" /></a></p>', 1, 'testimonial', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(99, 96, 'Lady pic', '', '<p><a href="#" target="_self"><img style="float: left;" src="images/lady.png" alt="" border="0" /></a></p>', 1, 'testimonial', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(100, 97, 'About Us', '', '<p><img style="border: 0;" src="images/firstmod1.png" alt="" border="0" /></p>\r\n<p>Vivo Kidney Care Foundation is a national not-for-profit organization dedicated to helping people with kidney and urologic diseases and individuals waiting for organ and tissue transplants. <a title="about-us" href="index.php/about-us">Read More</a></p>', 1, 'promo', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(101, 98, 'Our Work', '', '<p><img style="border: 0;" src="images/secondmod1.png" alt="" border="0" /></p>\r\n<p>The Vivo Kidney Care Foundation is actively involved in a wide range of activities from education and awareness to diagnosis and treatment.<a title="our-work" href="index.php/our-work">Read More</a></p>', 1, 'promo', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(102, 99, 'Slabs for Donation', '', '<p style="text-align: left;"><strong>Rs 500/-</strong> <br /> Medicines for 1 treatment<br /><br /> <strong>Rs 1,500/-</strong><br /> Pays for 1 Dialysis treatment<br /><br /> <strong>Rs 18,000/- </strong> <br /> Pays a month''s dialysis treatments and medicines for a patient<br /><br /> <strong>Rs 2,00,000/-</strong> <br />Pays an year''s dialysis treatments and medicines for a patient</p>\r\n<p style="text-align: left;"><a href="index.php/donate-now"><img src="images/donate-now-btn.png" alt="" border="0" /></a></p>', 1, 'sidebar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 100, 'Volunteer', '', '<p><strong><img style="border: 0;" src="images/fourth1.png" alt="" border="0" /></strong></p>\r\n<p>Whether volunteering on a regular basis or just occasionally, you can make the difference, and your involvement will be appreciated. To know what you can do with these <strong>Volunteer Opportunities.</strong> <a title="volunteer" href="index.php/volunteer"> Read More</a></p>', 1, 'promo', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(104, 101, '80 G Approvals', '', '<p><strong><img style="border: 0;" src="images/80g.png" alt="" border="0" /></strong></p>\r\n<p>Vivo Kidney Care Foundation has obtained Section 80 G approval from Government of India, thus making the donations eligible for tax-deductions.</p>', 1, 'promo', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 102, 'Left Main Menu', '', '', 1, 'responsivebar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"bottom","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":" nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 111),
(17, 112),
(17, 113),
(17, 114),
(17, 115),
(17, 116),
(17, 117),
(17, 118),
(17, 119),
(17, 120),
(17, 121),
(17, 122),
(17, 123),
(17, 124),
(17, 125),
(17, 126),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(95, 101),
(97, 0),
(98, 101),
(99, 111),
(99, 112),
(99, 113),
(99, 114),
(99, 115),
(99, 116),
(99, 117),
(99, 118),
(99, 119),
(99, 120),
(99, 121),
(99, 122),
(99, 123),
(99, 124),
(99, 125),
(100, 101),
(101, 101),
(102, 111),
(102, 112),
(102, 113),
(102, 114),
(102, 115),
(102, 116),
(102, 117),
(102, 118),
(102, 119),
(102, 120),
(102, 121),
(102, 122),
(102, 123),
(102, 124),
(102, 125),
(103, 101),
(104, 101),
(105, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_overrider`
--

CREATE TABLE IF NOT EXISTS `jos_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_postinstall_messages`
--

CREATE TABLE IF NOT EXISTS `jos_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to jos_extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_postinstall_messages`
--

INSERT INTO `jos_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(3, 10001, 'AKEEBA_POSTSETUP_LBL_CONFWIZ', 'AKEEBA_POSTSETUP_DESC_CONFWIZ', 'AKEEBA_POSTSETUP_BTN_RUN_CONFWIZ', 'com_akeeba', 1, 'action', 'admin://components/com_akeeba/helpers/postinstall.php', 'com_akeeba_postinstall_confwiz_action', 'admin://components/com_akeeba/helpers/postinstall.php', 'com_akeeba_postinstall_confwiz_condition', '4.0.0', 1),
(4, 10001, 'AKEEBA_POSTSETUP_LBL_ACCEPTLICENSE', 'AKEEBA_POSTSETUP_DESC_ACCEPTLICENSE', 'AKEEBA_POSTSETUP_BTN_I_CONFIRM_THIS', 'com_akeeba', 1, 'message', '', '', '', '', '4.0.0', 1),
(5, 10001, 'AKEEBA_POSTSETUP_LBL_ACCEPTSUPPORT', 'AKEEBA_POSTSETUP_DESC_ACCEPTSUPPORT', 'AKEEBA_POSTSETUP_BTN_I_CONFIRM_THIS', 'com_akeeba', 1, 'message', '', '', '', '', '4.0.0', 1),
(6, 10001, 'AKEEBA_POSTSETUP_LBL_ACCEPTBACKUPTEST', 'AKEEBA_POSTSETUP_DESC_ACCEPTBACKUPTEST', 'AKEEBA_POSTSETUP_BTN_I_CONFIRM_THIS', 'com_akeeba', 1, 'message', '', '', '', '', '4.0.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_redirect_links`
--

CREATE TABLE IF NOT EXISTS `jos_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) DEFAULT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_schemas`
--

CREATE TABLE IF NOT EXISTS `jos_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_schemas`
--

INSERT INTO `jos_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.4.0-2015-02-26');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('jd9dil19v4th4g7vb2lm1jdk85', 0, 1, '1458021515', '__default|a:7:{s:15:"session.counter";i:4;s:19:"session.timer.start";i:1458021348;s:18:"session.timer.last";i:1458021368;s:17:"session.timer.now";i:1458021514;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.2; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0";s:8:"registry";O:24:"Joomla\\Registry\\Registry":2:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}s:9:"separator";s:1:".";}s:4:"user";O:5:"JUser":26:{s:9:"\\0\\0\\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:1:{i:0;s:1:"9";}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:12:"requireReset";N;s:10:"\\0\\0\\0_params";O:24:"Joomla\\Registry\\Registry":2:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}s:9:"separator";s:1:".";}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:9;}s:14:"\\0\\0\\0_authLevels";a:3:{i:0;i:1;i:1;i:1;i:2;i:5;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:13:"\\0\\0\\0userHelper";O:18:"JUserWrapperHelper":0:{}s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}}', 0, ''),
('s0djs43cjstn3smis1jm3vssm7', 1, 0, '1458021969', '__default|a:8:{s:15:"session.counter";i:40;s:19:"session.timer.start";i:1458020803;s:18:"session.timer.last";i:1458021958;s:17:"session.timer.now";i:1458021961;s:22:"session.client.browser";s:72:"Mozilla/5.0 (Windows NT 6.2; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0";s:8:"registry";O:24:"Joomla\\Registry\\Registry":2:{s:7:"\\0\\0\\0data";O:8:"stdClass":7:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:5:"en-GB";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}s:11:"com_content";O:8:"stdClass":1:{s:4:"edit";O:8:"stdClass":1:{s:7:"article";O:8:"stdClass":2:{s:2:"id";a:1:{i:0;i:13;}s:4:"data";N;}}}s:11:"com_modules";O:8:"stdClass":3:{s:7:"modules";O:8:"stdClass":1:{s:6:"filter";O:8:"stdClass":1:{s:18:"client_id_previous";i:0;}}s:4:"edit";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:2:"id";a:0:{}s:4:"data";N;}}s:3:"add";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:12:"extension_id";N;s:6:"params";N;}}}s:9:"com_menus";O:8:"stdClass":3:{s:5:"items";O:8:"stdClass":3:{s:8:"menutype";s:6:"bottom";s:10:"limitstart";i:0;s:4:"list";a:4:{s:9:"direction";s:3:"asc";s:5:"limit";s:2:"20";s:8:"ordering";s:5:"a.lft";s:5:"start";d:0;}}s:4:"edit";O:8:"stdClass":1:{s:4:"item";O:8:"stdClass":4:{s:2:"id";a:0:{}s:4:"data";N;s:4:"type";N;s:4:"link";N;}}s:5:"menus";O:8:"stdClass":4:{s:6:"search";s:12:" Donate Now ";s:8:"ordercol";s:7:"a.title";s:9:"orderdirn";s:3:"asc";s:10:"limitstart";i:0;}}s:6:"global";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";i:20;}}s:10:"com_search";O:8:"stdClass":1:{s:8:"searches";O:8:"stdClass":3:{s:6:"filter";O:8:"stdClass":1:{s:6:"search";s:12:" Donate Now ";}s:8:"ordercol";s:6:"a.hits";s:9:"orderdirn";s:3:"asc";}}}s:9:"separator";s:1:".";}s:4:"user";O:5:"JUser":28:{s:9:"\\0\\0\\0isRoot";b:1;s:2:"id";s:2:"62";s:4:"name";s:10:"Super User";s:8:"username";s:22:"gaddielsattva_h64ks440";s:5:"email";s:24:"gaddiel.sattva@gmail.com";s:8:"password";s:60:"$2y$10$8j96HDzLNB3BrhbvgzGNtuAuJjUMpCb0y578uEZYBArHR2boAQyby";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2015-09-19 17:47:45";s:13:"lastvisitDate";s:19:"2015-11-26 09:21:58";s:10:"activation";s:1:"0";s:6:"params";s:2:"{}";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:12:"requireReset";s:1:"0";s:10:"\\0\\0\\0_params";O:24:"Joomla\\Registry\\Registry":2:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}s:9:"separator";s:1:".";}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\\0\\0\\0_authLevels";a:5:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:6;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:13:"\\0\\0\\0userHelper";O:18:"JUserWrapperHelper":0:{}s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;s:6:"otpKey";s:0:"";s:4:"otep";s:0:"";}s:13:"session.token";s:32:"4a9a4e206177f506b05669900cd74246";}', 62, 'gaddielsattva_h64ks440');

-- --------------------------------------------------------

--
-- Table structure for table `jos_tags`
--

CREATE TABLE IF NOT EXISTS `jos_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_tags`
--

INSERT INTO `jos_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 3, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 1, 2, 1, 'joomla', 'Joomla', 'joomla', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"tag_layout":"","tag_link_class":"label label-info","image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '', '', '{"author":"","robots":""}', 849, '2013-11-16 00:00:00', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `jos_template_styles`
--

CREATE TABLE IF NOT EXISTS `jos_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jos_template_styles`
--

INSERT INTO `jos_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.png","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'it_zen', 0, '1', 'it_zen - Default', '{"TemplateStyle":"style5","TemplateCustomColor":"#9a47d1","logo":"images\\/logo.png","responsivebarlogo":"images\\/logo.png","sidebar_position":"right","sidebar_span":"normal","go2top":1,"hidefrontpage":1,"it_params_welcome":1,"it_params_equalcols":"1","showcase_image":"","responsive_template":1,"advanced_bootstrap":1,"advanced_animations":1,"icelogo":0,"offline_h2":"Our Website is Coming Soon!","offline_p":"","offline_form":1,"offline_count":1,"offline_count_time":"31 December 2013 12:00:00","offline_newsletter":"","offline_social":"","custom_css_code":"\\/* Enter Your CSS Code below  *\\/"}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_ucm_base`
--

CREATE TABLE IF NOT EXISTS `jos_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_ucm_base`
--

INSERT INTO `jos_ucm_base` (`ucm_id`, `ucm_item_id`, `ucm_type_id`, `ucm_language_id`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_ucm_content`
--

CREATE TABLE IF NOT EXISTS `jos_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the jos_assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_ucm_content`
--

INSERT INTO `jos_ucm_content` (`core_content_id`, `core_type_alias`, `core_title`, `core_alias`, `core_body`, `core_state`, `core_checked_out_time`, `core_checked_out_user_id`, `core_access`, `core_params`, `core_featured`, `core_metadata`, `core_created_user_id`, `core_created_by_alias`, `core_created_time`, `core_modified_user_id`, `core_modified_time`, `core_language`, `core_publish_up`, `core_publish_down`, `core_content_item_id`, `asset_id`, `core_images`, `core_urls`, `core_hits`, `core_version`, `core_ordering`, `core_metakey`, `core_metadesc`, `core_catid`, `core_xreference`, `core_type_id`) VALUES
(1, 'com_content.article', 'Getting Started', 'getting-started', '<p>It''s easy to get started creating your website. Knowing some of the basics will help.</p><h3>What is a Content Management System?</h3><p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.</p><p>In this site, the content is stored in a <em>database</em>. The look and feel are created by a <em>template</em>. Joomla! brings together the template and your content to create web pages.</p><h3>Logging in</h3><p>To login to your site use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles and modify some settings.</p><h3>Creating an article</h3><p>Once you are logged-in, a new menu will be visible. To create a new article, click on the "Submit Article" link on that menu.</p><p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.</p><div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).</div><h3>Template, site settings, and modules</h3><p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template settings. Click the "Template Settings" in the user menu.</p><p>The boxes around the main content of the site are called modules. You can modify modules on the current page by moving your cursor to the module and clicking the edit link. Always be sure to save and close any module you edit.</p><p>You can change some site settings such as the site name and description by clicking on the "Site Settings" link.</p><p>More advanced options for templates, site settings, modules, and more are available in the site administrator.</p><h3>Site and Administrator</h3><p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the "Site Administrator" link on the "User Menu" menu (visible once you login) or by adding /administrator to the end of your domain name. The same user name and password are used for both sites.</p><h3>Learn more</h3><p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href="https://docs.joomla.org" target="_blank">Joomla! documentation site</a> and on the<a href="http://forum.joomla.org" target="_blank"> Joomla! forums</a>.</p>', 1, '', 0, 1, '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 0, '{"robots":"","author":"","rights":"","xreference":""}', 849, '', '2013-11-16 00:00:00', 0, '0000-00-00 00:00:00', '*', '2013-11-16 00:00:00', '0000-00-00 00:00:00', 1, 62, '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', 0, 1, 0, '', '', 2, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_ucm_history`
--

CREATE TABLE IF NOT EXISTS `jos_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `jos_ucm_history`
--

INSERT INTO `jos_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 2, 10, 'Initial content', '2013-11-16 00:00:00', 849, 558, 'be28228b479aa67bad3dc1db2975232a033d5f0f', '{"id":2,"parent_id":"1","lft":"1","rgt":2,"level":1,"path":"joomla","title":"Joomla","alias":"joomla","note":"","description":null,"published":1,"checked_out":"0","checked_out_time":"0000-00-00 00:00:00","access":1,"params":null,"metadesc":null,"metakey":null,"metadata":null,"created_user_id":"849","created_time":"2013-11-16 00:00:00","created_by_alias":"","modified_user_id":"0","modified_time":"0000-00-00 00:00:00","images":null,"urls":null,"hits":"0","language":"*","version":"1","publish_up":"0000-00-00 00:00:00","publish_down":"0000-00-00 00:00:00"}', 0),
(2, 1, 1, 'Initial content', '2013-11-16 00:00:00', 849, 4539, '4f6bf8f67e89553853c3b6e8ed0a6111daaa7a2f', '{"id":1,"asset_id":54,"title":"Getting Started","alias":"getting-started","introtext":"<p>It''s easy to get started creating your website. Knowing some of the basics will help.<\\/p>\\r\\n<h3>What is a Content Management System?<\\/h3>\\r\\n<p>A content management system is software that allows you to create and manage webpages easily by separating the creation of your content from the mechanics required to present it on the web.<\\/p>\\r\\n<p>In this site, the content is stored in a <em>database<\\/em>. The look and feel are created by a <em>template<\\/em>. Joomla! brings together the template and your content to create web pages.<\\/p>\\r\\n<h3>Logging in<\\/h3>\\r\\n<p>To login to your site use the user name and password that were created as part of the installation process. Once logged-in you will be able to create and edit articles and modify some settings.<\\/p>\\r\\n<h3>Creating an article<\\/h3>\\r\\n<p>Once you are logged-in, a new menu will be visible. To create a new article, click on the \\"Submit Article\\" link on that menu.<\\/p>\\r\\n<p>The new article interface gives you a lot of options, but all you need to do is add a title and put something in the content area. To make it easy to find, set the state to published.<\\/p>\\r\\n<div>You can edit an existing article by clicking on the edit icon (this only displays to users who have the right to edit).<\\/div>\\r\\n<h3>Template, site settings, and modules<\\/h3>\\r\\n<p>The look and feel of your site is controlled by a template. You can change the site name, background colour, highlights colour and more by editing the template settings. Click the \\"Template Settings\\" in the user menu.\\u00a0<\\/p>\\r\\n<p>The boxes around the main content of the site are called modules. \\u00a0You can modify modules on the current page by moving your cursor to the module and clicking the edit link. Always be sure to save and close any module you edit.<\\/p>\\r\\n<p>You can change some site settings such as the site name and description by clicking on the \\"Site Settings\\" link.<\\/p>\\r\\n<p>More advanced options for templates, site settings, modules, and more are available in the site administrator.<\\/p>\\r\\n<h3>Site and Administrator<\\/h3>\\r\\n<p>Your site actually has two separate sites. The site (also called the front end) is what visitors to your site will see. The administrator (also called the back end) is only used by people managing your site. You can access the administrator by clicking the \\"Site Administrator\\" link on the \\"User Menu\\" menu (visible once you login) or by adding \\/administrator to the end of your domain name. The same user name and password are used for both sites.<\\/p>\\r\\n<h3>Learn more<\\/h3>\\r\\n<p>There is much more to learn about how to use Joomla! to create the web site you envision. You can learn much more at the <a href=\\"http:\\/\\/docs.joomla.org\\" target=\\"_blank\\">Joomla! documentation site<\\/a> and on the<a href=\\"http:\\/\\/forum.joomla.org\\" target=\\"_blank\\"> Joomla! forums<\\/a>.<\\/p>","fulltext":"","state":1,"catid":"2","created":"2013-11-16 00:00:00","created_by":"849","created_by_alias":"","modified":"","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2013-11-16 00:00:00","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(3, 8, 5, '', '2015-09-19 18:22:17', 62, 580, 'e366aa62db5af062bddc0005ad4e4a4f2b798072', '{"id":8,"asset_id":68,"parent_id":"1","lft":"11","rgt":12,"level":1,"path":null,"extension":"com_content","title":"About Us","alias":"about-us-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:22:17","modified_user_id":null,"modified_time":"2015-09-19 18:22:17","hits":"0","language":"*","version":null}', 0),
(4, 9, 5, '', '2015-09-19 18:23:47', 62, 580, '94005555d2367b59f9de80d91c601af775aff954', '{"id":9,"asset_id":69,"parent_id":"1","lft":"13","rgt":14,"level":1,"path":null,"extension":"com_content","title":"Our Work","alias":"our-work-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:23:47","modified_user_id":null,"modified_time":"2015-09-19 18:23:47","hits":"0","language":"*","version":null}', 0),
(5, 10, 5, '', '2015-09-19 18:24:49', 62, 585, 'c8faadaf340a204e5228e72d648a3902f78ce7d4', '{"id":10,"asset_id":70,"parent_id":"1","lft":"15","rgt":16,"level":1,"path":null,"extension":"com_content","title":"Contact Us","alias":"contact-us-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:24:49","modified_user_id":null,"modified_time":"2015-09-19 18:24:49","hits":"0","language":"*","version":null}', 0),
(6, 11, 5, '', '2015-09-19 18:25:37', 62, 575, 'ec3ad462a32aa4b709839be118079681f99524bd', '{"id":11,"asset_id":71,"parent_id":"1","lft":"17","rgt":18,"level":1,"path":null,"extension":"com_content","title":"Video","alias":"video-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:25:37","modified_user_id":null,"modified_time":"2015-09-19 18:25:37","hits":"0","language":"*","version":null}', 0),
(7, 12, 5, '', '2015-09-19 18:26:15', 62, 573, '3a1fb3fb1d82e11fd343a4176b811d02f734aed2', '{"id":12,"asset_id":72,"parent_id":"1","lft":"19","rgt":20,"level":1,"path":null,"extension":"com_content","title":"Blog","alias":"blog-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:26:15","modified_user_id":null,"modified_time":"2015-09-19 18:26:15","hits":"0","language":"*","version":null}', 0),
(8, 13, 5, '', '2015-09-19 18:26:52', 62, 583, '86a720ff666b130be8a09864036e34a419ae1294', '{"id":13,"asset_id":73,"parent_id":"1","lft":"21","rgt":22,"level":1,"path":null,"extension":"com_content","title":"Volunteer","alias":"volunteer-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:26:52","modified_user_id":null,"modified_time":"2015-09-19 18:26:52","hits":"0","language":"*","version":null}', 0),
(9, 14, 5, '', '2015-09-19 18:27:25', 62, 577, 'fbb3ca02d6f4a2cffc6d1901ceb583bd2ee674cf', '{"id":14,"asset_id":74,"parent_id":"1","lft":"23","rgt":24,"level":1,"path":null,"extension":"com_content","title":"Donate","alias":"donate-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:27:25","modified_user_id":null,"modified_time":"2015-09-19 18:27:25","hits":"0","language":"*","version":null}', 0),
(10, 15, 5, '', '2015-09-19 18:27:54', 62, 561, '90a2c2bfa0959a10bdf176cfe63cda35451cbfd0', '{"id":15,"asset_id":75,"parent_id":"1","lft":"25","rgt":26,"level":1,"path":null,"extension":"com_content","title":"Share Stories","alias":"latest-news","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:27:54","modified_user_id":null,"modified_time":"2015-09-19 18:27:54","hits":"0","language":"*","version":null}', 0),
(11, 16, 5, '', '2015-09-19 18:29:29', 62, 581, 'd42f5e905f8471a903731b55ba81b8700476c67d', '{"id":16,"asset_id":76,"parent_id":"1","lft":"27","rgt":28,"level":1,"path":null,"extension":"com_content","title":"Advocacy","alias":"advocacy-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:29:29","modified_user_id":null,"modified_time":"2015-09-19 18:29:29","hits":"0","language":"*","version":null}', 0),
(12, 17, 5, '', '2015-09-19 18:30:01', 62, 591, '770c8023bb740d7fce7fe49a5799a402501e3209', '{"id":17,"asset_id":77,"parent_id":"1","lft":"29","rgt":30,"level":1,"path":null,"extension":"com_content","title":"Public Policy","alias":"public-policy-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:30:01","modified_user_id":null,"modified_time":"2015-09-19 18:30:01","hits":"0","language":"*","version":null}', 0),
(13, 18, 5, '', '2015-09-19 18:30:30', 62, 583, 'd579097e52c5e727ec0cff08be61464754e00d6c', '{"id":18,"asset_id":78,"parent_id":"1","lft":"31","rgt":32,"level":1,"path":null,"extension":"com_content","title":"Approvals","alias":"approvals-vivo-kidney-care-foundation","note":"","description":"","published":"1","checked_out":null,"checked_out_time":null,"access":"1","params":"{\\"category_layout\\":\\"\\",\\"image\\":\\"\\",\\"image_alt\\":\\"\\"}","metadesc":"","metakey":"","metadata":"{\\"author\\":\\"\\",\\"robots\\":\\"\\"}","created_user_id":"62","created_time":"2015-09-19 18:30:30","modified_user_id":null,"modified_time":"2015-09-19 18:30:30","hits":"0","language":"*","version":null}', 0),
(14, 2, 1, '', '2015-09-19 18:44:29', 62, 3432, '2a42dedaf49934e9becb2f717c07ef7066c50c5b', '{"id":2,"asset_id":79,"title":"About Us","alias":"about-vivo-kidney-care-foundation","introtext":"<p><img class=\\"imgalignleft\\" style=\\"padding: 0px 15px 15px 0px;\\" src=\\"images\\/about_pic.jpg\\" alt=\\"\\" width=\\"265\\" height=\\"183\\" align=\\"left\\" border=\\"0\\" \\/>Vivo Kidney Care Foundation (VKCF) is a national not-for-profit organization dedicated to helping people with kidney and urologic diseases and individuals waiting for organ and tissue transplants.<\\/p>\\r\\n<p>Kidney diseases affect millions of Indians, and it is reaching epidemic proportions due to an increase in diabetes, hypertensive disease, and obesity.<\\/p>\\r\\n<p>We work on improving the methods of diagnosis, evaluation, treatment and care of childhood and adult kidney disease. The foundation partners with educational organizations, hospitals, and advocacy and membership groups to achieve our goals and to reach the broadest range of individuals across pan-India.<\\/p>\\r\\n<h4>What Sets Us Apart?<\\/h4>\\r\\n<p><img class=\\"imgalignright\\" style=\\"padding: 0px 15px 0px 15px;\\" src=\\"images\\/about_pic2.jpg\\" alt=\\"\\" width=\\"235\\" height=\\"157\\" align=\\"right\\" border=\\"0\\" \\/>VKCF comprises a dedicated Executive Board, medical advisors, educated staff and volunteers who provide individualized support to patients and their families. Experienced nephrologists and transplant physicians constitute our Medical Advisory Board across various States.<\\/p>\\r\\n<p>We are a phone call or e-mail click away from getting you the help you need to cope with a new diagnosis, a resource for valuable information on kidney or a window into current research treatment options or a link to a physician should you need one.<\\/p>\\r\\n<p>The measure our success is based on our ability to respond meaningfully and personally to the public that includes you, a family member or a friend.<\\/p>","fulltext":"","state":1,"catid":"8","created":"2015-09-19 18:44:29","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:44:29","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:44:29","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(15, 3, 1, '', '2015-09-19 18:46:08', 62, 5297, '9f2c261ee71acd9626437c5f229b5bc40bc68766', '{"id":3,"asset_id":80,"title":"Privacy Policy","alias":"privacypolicy","introtext":"<h3><span style=\\"text-decoration: underline;\\">Privacy Policy<\\/span><br \\/><span style=\\"text-decoration: underline;\\">July 1, 2015 \\u2013 Version 1.01<\\/span><\\/h3>\\r\\n<p><strong>Purpose:<\\/strong><br \\/> This Privacy Policy (the \\u201cPolicy\\u201d) governs all aspects of how vkcf.org (\\u201cWe\\u201d, \\u201cUs\\u201d and \\u201cOur\\u201d) collects, uses, maintains and discloses Personal Information from users (\\u201cUsers\\u201d, \\u201cYou\\u201d and \\u201cYour\\u201d) through their website, <a href=\\"http:\\/\\/www.vkcf.org\\" target=\\"_blank\\">http:\\/\\/www.vkcf.org<\\/a> (\\u201cSite\\u201d) and through other Services (\\u201cServices\\u201d) offered by vkcf.org. vkcf.org is owned and operated by Vivo Kidney Care Foundation (VKCF) a national not-for-profit organization dedicated to helping people with kidney and urologic diseases.<\\/p>\\r\\n<p><strong>Information we gather from you:<\\/strong><br \\/> We may from time-to-time gather your personal information, either online or in person or through social media or other electronic modes of communication, during the course when you donate, or enter a request, sign up to our information sheet or register your interest as a potential volunteer .<\\/p>\\r\\n<p>The personal information we gather consist of your name, address, e-mail, PAN#, Date of Birth, Telephone numbers, donations you make or voluntary services you offer or Credit or Debit Card, Net Banking details as minimum required.<\\/p>\\r\\n<p><strong>Privacy of Personal Information:<\\/strong><br \\/> The personal information is not distributed, shared, rented or given to companies or organizations that are not part of the Vivo Kidney Care Foundation or its sister organizations. Authorized employees within the company on a need to know basis only use any information collected from you.<\\/p>\\r\\n<p>However, we may disclose your personal information<\\/p>\\r\\n<ul>\\r\\n<li>as required by law, only to such legally authorized personal<\\/li>\\r\\n<li>when we believe in good faith that disclosure is necessary to protect our rights, protect your safety or the safety of others, investigate fraud, or respond to a government request,<\\/li>\\r\\n<li>to any other third party as required by you or with your prior consent to do so.<\\/li>\\r\\n<\\/ul>\\r\\n<p><strong>Your right:<\\/strong><br \\/> You have the right to request for a copy of the personal information we have of you on the proviso that we are given reasonable notice of such a request through email on <a href=\\"mailto:contactus@vkcf.org\\">contactus@vkcf.org<\\/a><\\/p>\\r\\n<p>You are requested to retain copies of any literature issued in relation to the provision of our services.<\\/p>\\r\\n<p><strong>Our Commitment:<\\/strong><br \\/> We are committed to protecting your privacy and adhere to the laws as passed by Indian Parliament from time to time.<\\/p>\\r\\n<p>All content contained on the vkcf.org website is intended only for people 18 years of age and over and we do not knowingly collect or use Personal Information from anyone under the age of 18.<\\/p>\\r\\n<p>We will not sell, share, or rent your personal information to any third party or use your e-mail address for unsolicited mail. Any emails sent by us will only be in connection with the provision of agreed services and products.<\\/p>\\r\\n<p><strong>Questions:<\\/strong><br \\/> Please also refer to our Terms &amp; Conditions for the contractual relationships and usage of our site and services.<\\/p>\\r\\n<p>If you have any questions further about our privacy practices or you wish to access your personal information, please send us an email to <a href=\\"mailto:contactus@vkcf.org\\">contactus@vkcf.org<\\/a><\\/p>","fulltext":"","state":1,"catid":"17","created":"2015-09-19 18:46:08","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:46:08","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:46:08","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(16, 4, 1, '', '2015-09-19 18:47:26', 62, 1867, '1f3d4ce5cd5c3e9a2b6c65d4f2ab9cfaa1cb9c12', '{"id":4,"asset_id":81,"title":"12A Registration# of IT Act","alias":"12a-registration-of-it-act","introtext":"<p><a href=\\"approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/12a-registration-of-it-act.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"2","created":"2015-09-19 18:47:26","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:47:26","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:47:26","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(17, 5, 1, '', '2015-09-19 18:48:34', 62, 4557, '7ec3ed086ea2cc0c30a7bbb1f6dcbb66a5faa654', '{"id":5,"asset_id":82,"title":"Advocacy","alias":"advocacy-vivo-kidney-care-foundation","introtext":"<p><img class=\\"imgalignright\\" style=\\"padding: 0px 15px 0px 15px; border: 0; float: right;\\" src=\\"images\\/advocacy.jpg\\" alt=\\"\\" width=\\"233\\" height=\\"164\\" border=\\"0\\" \\/><strong>What is Advocacy?<\\/strong><br \\/>Advocacy is the act of supporting a cause, idea or position that you are passionate about.<\\/p>\\r\\n<p><strong>Who are VKCF Advocates?<\\/strong><br \\/>A VKCF Advocate is someone who has been affected by kidney disease, donation or transplant in some way - people with chronic kidney disease, dialysis patients, transplant recipients, living donors, donor family members, caregivers, friends and family members - and who wants to empower and educate others.<\\/p>\\r\\n<p><strong>Why become an VKCF Advocate?<\\/strong><\\/p>\\r\\n<p>Advocacy plays an integral role in our mission. You can make a significant difference in the lives of kidney patients by representing the VKCF so that patients voices can be heard.<\\/p>\\r\\n<p><strong>How can I Participate ?<\\/strong><\\/p>\\r\\n<p><img class=\\"imgalignright\\" style=\\"padding: 0px 15px 0px 15px;\\" src=\\"images\\/advocacy2.jpg\\" alt=\\"\\" align=\\"right\\" border=\\"0\\" \\/>Here are some of the ways you can be an advocate for those affected by kidney disease, donation and transplantation:<\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<p>Join our VKCF Group sessions to learn about how to use your voice on public policy issues relating to donation, transplantation and kidney disease. You will receive email alerts and guidance for contacting your elected officials. It''s quick and easy to make a difference!<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Share your personal story. You never know who you will connect with or impact! Speak at local community events; share your story with the VKCF for possible inclusion on our web site or in our newsletter; connect with others on VKCF Facebook page.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Volunteer with your local VKCF office.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Write a Letter to the Editor of your local newspaper about an VKCF event coming up that you are participating in, or about specific legislation in Parliament that is really important to you as a kidney patient.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Attend VKCF events.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Invite your local Government officials to attend a local event or program when they are available.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Raise awareness about the importance of kidneys, risk factors for kidney disease, and steps to take to keep kidneys healthy by presenting VKCFs Awareness Program.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Sign up as an organ and tissue donor through available registry.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>It is also very important to tell your family of your wishes. You can also find information about living kidney donation on our website shortly.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Help VCKF programs by making a financial contribution.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul>","fulltext":"","state":1,"catid":"16","created":"2015-09-19 18:48:34","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:48:34","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:48:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(18, 6, 1, '', '2015-09-19 18:50:05', 62, 2973, 'b2d67e10047e1e10b80b14eae7bd48eed001dd46', '{"id":6,"asset_id":83,"title":"Approvals","alias":"approvals-vivo-kidney-care-foundation","introtext":"<p><strong>Please click on the relevant approval number to view the document<\\/strong><\\/p>\\r\\n<table border=\\"0\\" width=\\"700\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Corporate Identity Number <\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"corporate-identity-number\\">U85300MH2013NPL249125(Mumbai), dated 11 Oct 2013<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Permanent Account Number <\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"permanent-account-number\\">AAECV6262A<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Licence U\\/S 25 of ICA 1956<\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"licence-u-s-25-of-ica-1956\\">ROC25(1)\\/SRNB78629052\\/86\\/9\\/2013\\/4224, dated 12 Sep 2013<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>12A Registration# of IT Act<\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"12a-registration-of-it-act\\">46870, dated 27 Aug 2015<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Certificate U\\/S 80G of IT Act<\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"certificate-u-s-80g-of-it-act\\">DIT(E)\\/80G\\/498\\/2014-15, dated 12 Sep 2014<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:50:05","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:50:05","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:50:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(19, 7, 1, '', '2015-09-19 18:51:41', 62, 1876, '08187f191543bde156c1bd9d99072ff5f652d781', '{"id":7,"asset_id":84,"title":"Certificate U\\/S 80G of IT Act","alias":"certificate-u-s-80g-of-it-act","introtext":"<p><a href=\\"approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/certificate-us-80g-of-it-act.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:51:41","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:51:41","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:51:41","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(20, 8, 1, '', '2015-09-19 18:52:28', 62, 2844, '0699b42655552db188575ee726110ebcbb4b3f0d', '{"id":8,"asset_id":85,"title":"Contact Us","alias":"contact-us","introtext":"<table width=\\"550px\\" cellspacing=\\"0\\" cellpadding=\\"5\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"130px\\">\\r\\n<p>Contact Person<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>D.Shaikh<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p>Registered Address<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>Vivo Kidney Care Foundation,<br \\/> 23 Rainbow, Vidyanagari,<br \\/> Santacruz (East),<br \\/> Mumbai \\u2013 400 098.<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p>Operating Address<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>Vivo Kidney Care Foundation,<br \\/> 5,Creative Industries Building, <br \\/> Sunder Nagar Road No.2,<br \\/> Off CST Road, Kalina, Santacruz (East),<br \\/> Mumbai \\u2013 400 098.<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p>Hours of operation<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>10 a.m. to 6 p.m.<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p>Mobile #<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>+91-9820925470<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p>Landline #<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>+91-22-26652024<\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p>Email Id<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p><span style=\\"text-decoration: underline;\\">contactus@vkcf.org<\\/span><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"10","created":"2015-09-19 18:52:28","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:52:28","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:52:28","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(21, 9, 1, '', '2015-09-19 18:53:34', 62, 1864, '27595e717ec56157b3f31e4c72add71c82f3e1f8', '{"id":9,"asset_id":86,"title":"Corporate Identity Number","alias":"corporate-identity-number","introtext":"<p><a href=\\"approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/corporate-identity-number.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:53:34","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:53:34","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:53:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(22, 10, 1, '', '2015-09-19 18:54:47', 62, 3220, '168853dc05a5a27bbff5195ed29001b5d7975c05', '{"id":10,"asset_id":87,"title":"Donate","alias":"donate-vivo-kidney-care-foundation","introtext":"<p><img class=\\"imgalignright\\" src=\\"images\\/donate.jpg\\" alt=\\"\\" width=\\"190\\" height=\\"137\\" align=\\"right\\" border=\\"0\\" \\/>The Vivo Kidney Care Foundation sustains its programs with the help and support of many people. As a non profit organization that receives no government funding, we rely on your contribution and partnerships with corporations who have CSR(Corporate Social Responsibility) Programs.<\\/p>\\r\\n<p>We plan to run a number of Fund Raising Campaigns throughout the year, such as:<\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<p><strong>Kidney Awareness Walk Programs <br \\/><\\/strong>With these events we bring together the patient and professional communities while promoting public awareness and raising much needed contributions to continue our work.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p><strong>Musical Events<br \\/><\\/strong>A few high profile performers have committed to being a part of our initiative and help raise monies for identified causes.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p><strong>Corporate Golf Event<\\/strong><br \\/>We are currently in talks with a some large corporate houses to jointly create awareness about kidney disease and support the foundation.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p><strong>Individual Donations<\\/strong><br \\/>We believe every little contribution counts. We constantly endeavor to get global donors sponsor less-privileged patients for renal care. Vivo Kidney Care Foundation has obtained Section 80 G approval from Government of India, thus making the donations eligible for tax-deductions.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul>","fulltext":"","state":1,"catid":"14","created":"2015-09-19 18:54:47","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:54:47","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:54:47","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(23, 11, 1, '', '2015-09-19 18:55:58', 62, 1839, 'b14d145334693c42d1947ab4837c1b42cb7683f0', '{"id":11,"asset_id":88,"title":"Licence U\\/S 25 of ICA 1956","alias":"licence-u-s-25-of-ica-1956","introtext":"<p><a href=\\"approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/licence-us-25-of-ica-1956.jpg\\" alt=\\"\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:55:58","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:55:58","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:55:58","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);
INSERT INTO `jos_ucm_history` (`version_id`, `ucm_item_id`, `ucm_type_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(24, 12, 1, '', '2015-09-19 18:56:56', 62, 4579, '47272dbd74f430365de54ff488a38ca6d31badf4', '{"id":12,"asset_id":89,"title":"Our Work","alias":"our-work-vivo-kidney-care-foundation","introtext":"<p>The Vivo Kidney Care Foundation is actively involved in a wide range of activities from education and awareness to diagnosis and treatment.<\\/p>\\r\\n<p><img class=\\"imgalignright\\" style=\\"padding: 0px 15px 0px 15px;\\" src=\\"images\\/ourwork.jpg\\" alt=\\"\\" align=\\"right\\" border=\\"0\\" \\/><\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<p><strong>Quality Educational Conferences<br \\/><\\/strong>Vivo Kidney Care Foundation (VKCF) organises significant conferences for physicians and other medical professionals in the nephrology, urology and transplant communities. The purpose of this is to foster discussions on issues of concern in the renal, transplant communities. <br \\/>The planning of these conferences is driven by prominent physicians, allied medical professionals and thought leaders. These experts in their respective fields help create a rich and focused curriculum for medical caregivers, facilitate discussion, and promote professional networking. The ultimate goal of our continuing education programs is to provide the information and tools that can lead to improved patient outcomes.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p><strong>The Vivo Kidney Care Foundation (VKCF) Data Institute<br \\/><\\/strong>The institute maintains a registry of Patient Information on the diagnoses and demographics of kidney patients being screened for renal diseases. This information provides physicians with baseline data to better understand the prevalence and impact of kidney disease among Indian patients and the results of the Patient Registry can be used to work with Ministry of Health in India for grants to help treatment in rural areas.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p><strong>Sponsoring Education Programs<br \\/><\\/strong>We provide subsidized training programs to dialysis technicians and nurses from weaker sections of the society and get them employed with healthcare institutions.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p><strong><img class=\\"imgalignright\\" style=\\"padding: 0px 15px 0px 15px;\\" src=\\"images\\/ourwrk2.jpg\\" alt=\\"\\" align=\\"right\\" border=\\"0\\" \\/>Supporting Renal Care Needs<br \\/><\\/strong>VKCF treats people with renal and urological disease from lesser privileged sections of society by working with social organizations and individual donors worldwide.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p><strong>Maintaining Donor Organ Registry <br \\/><\\/strong>We work closely with Health care local administration of helping needy patients get donors.<\\/p>\\r\\n<\\/li>\\r\\n<li><strong>Organising Corporate Screening Camps <br \\/><\\/strong>In association with corporate houses, VKCF regularly holds preventive kidney care checkups and knowledge sharing workshops on precautions to be taken.<\\/li>\\r\\n<li>\\r\\n<p><strong>Working with Social Organizations<\\/strong><br \\/>VCKF collaborates closely with Rotary, Lions, Jaycees and other charitable foundations to support Mobile Dialysis care in rural areas.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul>","fulltext":"","state":1,"catid":"9","created":"2015-09-19 18:56:56","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:56:56","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:56:56","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(25, 13, 1, '', '2015-09-19 18:58:01', 62, 1841, 'a0388dd68caebbe9823dd36eed7d6b27aae67015', '{"id":13,"asset_id":90,"title":"Permanent Account Number","alias":"permanent-account-number","introtext":"<p><a href=\\"approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/pan.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:58:01","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:58:01","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:58:01","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(26, 14, 1, '', '2015-09-19 18:59:19', 62, 8921, '567df28e3a9f12cc2fce8c4258dc017806db66d6', '{"id":14,"asset_id":91,"title":"Video","alias":"video-vivo-kidney-care-foundation","introtext":"<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis Center - Akola - Vivo Kidney Care<\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">With Fresenius dialysis machines, a world famous Gambro RO water purification system and state of the art US clinical procedures and protocols followed by our staff, all kidney patients can now access world class facilities at our dialysis center at Akola.<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/z8E_rquBRLU\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis Center - Nagpur - Vivo Kidney Care <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">With Fresenius dialysis machines, a world famous Gambro RO water purification system and state of the art US clinical procedures and protocols followed by our staff, all kidney patients can now access world class facilities at our dialysis center at Akola.<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/sAY0tN7wxTw\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Sanjay Bhoyar at Nagpur <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch Sanjay speak about Vivo Kidney Care''s kidney dialysis center at Nagpur. Sanjay is being treated for past 6-7 months at our world class facilities and has seen an improvement in his health. You can contribute to our non-profit, Vivo Kidney Care Foundation at vkcf.org or visit our website vivokidneycare.com to help patients like Sanjay get back to a normal life.<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/kjZooaEdaWc\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Certificate Course in Dialysis Technology - Vivo Kidney Care<\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">The primary focus of the certified hemodialysis technologist is to undertake hemodialysis treatment for patients with acute and end stage renal failure and to provide technical expertise, equipment monitoring and machine maintenance.<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/-TnGgoHg50Q\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Swapnil Jiwane at Nagpur <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch Swapnil speak about lack of medical facilities for kidney care in Nagpur and his experience with Vivo Kidney Care''s dialysis center. He started dialysis due to overdose of creatine (as recommended by his gym instructor). You can contribute to our non-profit, Vivo Kidney Care Foundation at vkcf.org or visit our website vivokidneycare.com to help patients like Swapnil get back to a normal life.<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/Z9di4JVhkhs\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Prahlad Chaudhari at Nagpur <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch Prahlad speak about his financial difficulties in availing quality kidney dialysis services in Nagpur. You can contribute to our non-profit, Vivo Kidney Care Foundation at vkcf.org or visit our website vivokidneycare.com to help patients like Prahlad lead a normal life.<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/KG0XmIj03B4\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Aruna Shrirame at Nagpur <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch Arun speak about difficulties in availing quality kidney dialysis services for his wife Aruna in Nagpur and how Vivo Kidney Care has improved her health. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/FnohZ1YEUJA\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Rani Khobragade at Nagpur <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch Rani speak about her difficulties in availing quality kidney dialysis services in Nagpur and how Vivo Kidney Care has come to help. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/ShuH5uDMHzg\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Ganesh Kanojia at Nagpur <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch Ganesh speak about his difficulties in availing quality kidney dialysis services in Nagpur and how Vivo Kidney Care has come to help. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/U5q1wrM7aTs\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Kidney Dialysis - Vivo Kidney Care treats Ashish Gaikwad at Nagpur <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch Ashish speak about his difficulties in availing quality kidney dialysis services in Nagpur and how Vivo Kidney care has come to help. You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/KnMELpFdRss\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<hr \\/>\\r\\n<table>\\r\\n<tbody>\\r\\n<tr>\\r\\n<td width=\\"60%\\">\\r\\n<p><strong>Patients speak about Vivo Kidney Care <\\/strong><\\/p>\\r\\n<p style=\\"text-align: justify;\\">Watch different patients speak about Vivo Kidney Care.You can contribute to our non-profit at vkcf.org or visit our website vivokidneycare.com<\\/p>\\r\\n<\\/td>\\r\\n<td>\\r\\n<p>\\u00a0<\\/p>\\r\\n<center><object data=\\"http:\\/\\/www.youtube.com\\/embed\\/ASuyCqIK-qU\\" width=\\"200\\" height=\\"100\\"><\\/object><\\/center><\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>\\r\\n<p>\\u00a0<\\/p>","fulltext":"","state":1,"catid":"11","created":"2015-09-19 18:59:19","created_by":"62","created_by_alias":"","modified":"2015-09-19 18:59:19","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 18:59:19","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(27, 15, 1, '', '2015-09-19 19:00:41', 62, 2919, '1bab9f9b745966543662138df77beca14e8b4eeb', '{"id":15,"asset_id":92,"title":"Volunteer","alias":"volunteer-vivo-kidney-care-foundation","introtext":"<p><img class=\\"imgalignright\\" style=\\"padding: 0px 15px 0px 15px;\\" src=\\"images\\/volunteer.jpg\\" alt=\\"\\" width=\\"179\\" height=\\"120\\" align=\\"right\\" border=\\"0\\" \\/>By giving some of your time, you can actually help improve the quality of life a kidney patient in India.<\\/p>\\r\\n<p>Whether you volunteer on a regular basis or just occasionally, making the difference begins with you, and your involvement will be appreciated.<\\/p>\\r\\n<p>Here''s what you can do with these<strong>Volunteer Opportunities<\\/strong><\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<p>Participate in the annual Walk-A-Thon as an Individual Walker, Team Captain, or as a volunteer on walk day.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Help us brighten the holidays for many local dialysis patients by preparing to spend time with them during festivals.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Volunteer at a Patient Education Conference where patients gather free-of-charge for a full day of instruction on a variety of kidney disease subjects.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Help with office assistance for seasonal mailings.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Serve as a peer counselor for newly diagnosed patients and\\/or transplant recipients.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<p>Come Volunteer today!<\\/p>","fulltext":"","state":1,"catid":"13","created":"2015-09-19 19:00:41","created_by":"62","created_by_alias":"","modified":"2015-09-19 19:00:41","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 19:00:41","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(28, 16, 1, '', '2015-09-19 19:02:09', 62, 2517, '7c9d992eab4b2fe34a6e8c26969aa8d1b2f6b1b6', '{"id":16,"asset_id":93,"title":"World class dialysis facility. Now available in Nagpur","alias":"world-class-dialysis-facility-available-now-at-nagpur","introtext":"<p><img class=\\"imgalignleft\\" style=\\"padding: 0px 15px 15px 0px;\\" src=\\"images\\/vivo-pc-photo.jpg\\" alt=\\"\\" width=\\"265\\" height=\\"183\\" align=\\"left\\" border=\\"0\\" \\/>Swapnil is a poor patient who cannot afford, leave alone the prescribed <span style=\\"line-height: 1.3em;\\">3 dialysis sessions, even a single<\\/span><span style=\\"line-height: 1.3em;\\"> one in<\\/span><span style=\\"line-height: 1.3em;\\"> a week. When he first came to us, he was wheelchair bound. Without proper treatment, his life would be cut short. Seeing his condition VKCF intervened, and since then Swapnil has shown amazing progress. As a bicycling patient today, he validates our quality of kidney care treatment.The Vivo clinic is rated as the best dialysis center in Nagpur.<\\/span><\\/p>","fulltext":"","state":1,"catid":"12","created":"2015-09-19 19:02:09","created_by":"62","created_by_alias":"","modified":"2015-09-19 19:02:09","modified_by":null,"checked_out":null,"checked_out_time":null,"publish_up":"2015-09-19 19:02:09","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":1,"ordering":null,"metakey":"","metadesc":"","access":"1","hits":null,"metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(29, 13, 1, '', '2015-09-19 21:14:11', 62, 1869, '209d4d5dae5ca2495808d50e7d6e372f835d4695', '{"id":13,"asset_id":"90","title":"Permanent Account Number","alias":"permanent-account-number","introtext":"<p><a href=\\"index.php\\/approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/pan.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:58:01","created_by":"62","created_by_alias":"","modified":"2015-09-19 21:14:11","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-19 21:13:06","publish_up":"2015-09-19 18:58:01","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(30, 11, 1, '', '2015-09-19 21:15:57', 62, 1867, 'e0d1201f5713762deb12636df21e2cc87f1cabd1', '{"id":11,"asset_id":"88","title":"Licence U\\/S 25 of ICA 1956","alias":"licence-u-s-25-of-ica-1956","introtext":"<p><a href=\\"index.php\\/approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/licence-us-25-of-ica-1956.jpg\\" alt=\\"\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:55:58","created_by":"62","created_by_alias":"","modified":"2015-09-19 21:15:57","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-19 21:15:23","publish_up":"2015-09-19 18:55:58","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"1","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(31, 6, 1, '', '2015-09-19 21:19:38', 62, 3045, '506eac0871aa82f3ad6c3cb702a6c24d2f1b7a12', '{"id":6,"asset_id":"83","title":"Approvals","alias":"approvals-vivo-kidney-care-foundation","introtext":"<p><strong>Please click on the relevant approval number to view the document<\\/strong><\\/p>\\r\\n<table border=\\"0\\" width=\\"700\\">\\r\\n<tbody>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Corporate Identity Number <\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"index.php\\/corporate-identity-number\\">U85300MH2013NPL249125(Mumbai), dated 11 Oct 2013<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Permanent Account Number <\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"index.php\\/permanent-account-number\\">AAECV6262A<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Licence U\\/S 25 of ICA 1956<\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"index.php\\/licence-u-s-25-of-ica-1956\\">ROC25(1)\\/SRNB78629052\\/86\\/9\\/2013\\/4224, dated 12 Sep 2013<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>12A Registration# of IT Act<\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"index.php\\/12a-registration-of-it-act\\">46870, dated 27 Aug 2015<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<tr>\\r\\n<td>\\r\\n<p><strong>Certificate U\\/S 80G of IT Act<\\/strong><\\/p>\\r\\n<\\/td>\\r\\n<td>\\u00a0<\\/td>\\r\\n<td>\\r\\n<p><a href=\\"index.php\\/certificate-u-s-80g-of-it-act\\">DIT(E)\\/80G\\/498\\/2014-15, dated 12 Sep 2014<\\/a><\\/p>\\r\\n<\\/td>\\r\\n<\\/tr>\\r\\n<\\/tbody>\\r\\n<\\/table>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:50:05","created_by":"62","created_by_alias":"","modified":"2015-09-19 21:19:38","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-19 21:18:24","publish_up":"2015-09-19 18:50:05","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"4","metakey":"","metadesc":"","access":"1","hits":"5","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(32, 4, 1, '', '2015-09-19 21:21:48', 62, 1895, 'f3952ccb9a6b5837b925b40f93ccbc5ce989e003', '{"id":4,"asset_id":"81","title":"12A Registration# of IT Act","alias":"12a-registration-of-it-act","introtext":"<p><a href=\\"index.php\\/approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/12a-registration-of-it-act.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"2","created":"2015-09-19 18:47:26","created_by":"62","created_by_alias":"","modified":"2015-09-19 21:21:48","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-19 21:21:10","publish_up":"2015-09-19 18:47:26","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(33, 4, 1, '', '2015-09-19 21:22:38', 62, 1896, '351d3985c8184ff3e3e1715da0fd9a1baee141b8', '{"id":4,"asset_id":"81","title":"12A Registration# of IT Act","alias":"12a-registration-of-it-act","introtext":"<p><a href=\\"index.php\\/approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/12a-registration-of-it-act.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:47:26","created_by":"62","created_by_alias":"","modified":"2015-09-19 21:22:38","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-19 21:22:05","publish_up":"2015-09-19 18:47:26","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":3,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(34, 7, 1, '', '2015-09-19 21:23:38', 62, 1904, '6574ca0c93f04c90236f5856d4d33434f6537746', '{"id":7,"asset_id":"84","title":"Certificate U\\/S 80G of IT Act","alias":"certificate-u-s-80g-of-it-act","introtext":"<p><a href=\\"index.php\\/approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/certificate-us-80g-of-it-act.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:51:41","created_by":"62","created_by_alias":"","modified":"2015-09-19 21:23:38","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-19 21:22:58","publish_up":"2015-09-19 18:51:41","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"3","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(35, 16, 1, '', '2015-09-19 21:27:44', 62, 2534, 'a8e2571f012cbdd2fc17e360c4e7cce20fe44788', '{"id":16,"asset_id":"93","title":"World class dialysis facility. Now available in Nagpur","alias":"world-class-dialysis-facility-available-now-at-nagpur","introtext":"<p><img class=\\"imgalignleft\\" style=\\"padding: 0px 15px 15px 0px;\\" src=\\"images\\/vivo-pc-photo.jpg\\" alt=\\"\\" width=\\"265\\" height=\\"183\\" align=\\"left\\" border=\\"0\\" \\/>Swapnil is a poor patient who cannot afford, leave alone the prescribed <span style=\\"line-height: 1.3em;\\">3 dialysis sessions, even a single<\\/span><span style=\\"line-height: 1.3em;\\"> one in<\\/span><span style=\\"line-height: 1.3em;\\"> a week. When he first came to us, he was wheelchair bound. Without proper treatment, his life would be cut short. Seeing his condition VKCF intervened, and since then Swapnil has shown amazing progress. As a bicycling patient today, he validates our quality of kidney care treatment.The Vivo clinic is rated as the best dialysis center in Nagpur.<\\/span><\\/p>","fulltext":"","state":1,"catid":"15","created":"2015-09-19 19:02:09","created_by":"62","created_by_alias":"","modified":"2015-09-19 21:27:44","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-19 21:26:49","publish_up":"2015-09-19 19:02:09","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"0","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(36, 9, 1, '', '2015-09-21 10:40:28', 62, 1892, '3c4e5f2ea5cee53bba64c5f00569756030bb2536', '{"id":9,"asset_id":"86","title":"Corporate Identity Number","alias":"corporate-identity-number","introtext":"<p><a href=\\"index.php\\/approvals\\"><strong>Back<\\/strong><\\/a><\\/p>\\r\\n<p><img src=\\"images\\/corporate-identity-number.jpg\\" alt=\\"\\" width=\\"550\\" height=\\"900\\" border=\\"0\\" \\/><\\/p>","fulltext":"","state":1,"catid":"18","created":"2015-09-19 18:53:34","created_by":"62","created_by_alias":"","modified":"2015-09-21 10:40:28","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-21 10:38:31","publish_up":"2015-09-19 18:53:34","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"2","metakey":"","metadesc":"","access":"1","hits":"5","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0),
(37, 15, 1, '', '2015-09-21 13:13:47', 62, 2937, '1848a28e456f60d45a03437bb9a10b6754fba393', '{"id":15,"asset_id":"92","title":"Volunteer","alias":"volunteer-vivo-kidney-care-foundation","introtext":"<p><img class=\\"imgalignright\\" style=\\"padding: 0px 15px 0px 15px;\\" src=\\"images\\/volunteer.jpg\\" alt=\\"\\" width=\\"179\\" height=\\"120\\" align=\\"right\\" border=\\"0\\" \\/>By giving some of your time, you can actually help improve the quality of life a kidney patient in India.<\\/p>\\r\\n<p>Whether you volunteer on a regular basis or just occasionally, making the difference begins with you, and your involvement will be appreciated.<\\/p>\\r\\n<p>Here''s what you can do with these <strong>Volunteer Opportunities<\\/strong><\\/p>\\r\\n<ul>\\r\\n<li>\\r\\n<p>Participate in the annual Walk-A-Thon as an Individual Walker, Team Captain, or as a volunteer on walk day.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Help us brighten the holidays for many local dialysis patients by preparing to spend time with them during festivals.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Volunteer at a Patient Education Conference where patients gather free-of-charge for a full day of instruction on a variety of kidney disease subjects.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Help with office assistance for seasonal mailings.<\\/p>\\r\\n<\\/li>\\r\\n<li>\\r\\n<p>Serve as a peer counselor for newly diagnosed patients and\\/or transplant recipients.<\\/p>\\r\\n<\\/li>\\r\\n<\\/ul>\\r\\n<p>Come Volunteer today!<\\/p>","fulltext":"","state":1,"catid":"13","created":"2015-09-19 19:00:41","created_by":"62","created_by_alias":"","modified":"2015-09-21 13:13:47","modified_by":"62","checked_out":"62","checked_out_time":"2015-09-21 13:13:04","publish_up":"2015-09-19 19:00:41","publish_down":"0000-00-00 00:00:00","images":"{\\"image_intro\\":\\"\\",\\"float_intro\\":\\"\\",\\"image_intro_alt\\":\\"\\",\\"image_intro_caption\\":\\"\\",\\"image_fulltext\\":\\"\\",\\"float_fulltext\\":\\"\\",\\"image_fulltext_alt\\":\\"\\",\\"image_fulltext_caption\\":\\"\\"}","urls":"{\\"urla\\":false,\\"urlatext\\":\\"\\",\\"targeta\\":\\"\\",\\"urlb\\":false,\\"urlbtext\\":\\"\\",\\"targetb\\":\\"\\",\\"urlc\\":false,\\"urlctext\\":\\"\\",\\"targetc\\":\\"\\"}","attribs":"{\\"show_title\\":\\"\\",\\"link_titles\\":\\"\\",\\"show_tags\\":\\"\\",\\"show_intro\\":\\"\\",\\"info_block_position\\":\\"\\",\\"show_category\\":\\"\\",\\"link_category\\":\\"\\",\\"show_parent_category\\":\\"\\",\\"link_parent_category\\":\\"\\",\\"show_author\\":\\"\\",\\"link_author\\":\\"\\",\\"show_create_date\\":\\"\\",\\"show_modify_date\\":\\"\\",\\"show_publish_date\\":\\"\\",\\"show_item_navigation\\":\\"\\",\\"show_icons\\":\\"\\",\\"show_print_icon\\":\\"\\",\\"show_email_icon\\":\\"\\",\\"show_vote\\":\\"\\",\\"show_hits\\":\\"\\",\\"show_noauth\\":\\"\\",\\"urls_position\\":\\"\\",\\"alternative_readmore\\":\\"\\",\\"article_layout\\":\\"\\",\\"show_publishing_options\\":\\"\\",\\"show_article_options\\":\\"\\",\\"show_urls_images_backend\\":\\"\\",\\"show_urls_images_frontend\\":\\"\\"}","version":2,"ordering":"0","metakey":"","metadesc":"","access":"1","hits":"8","metadata":"{\\"robots\\":\\"\\",\\"author\\":\\"\\",\\"rights\\":\\"\\",\\"xreference\\":\\"\\"}","featured":"0","language":"*","xreference":""}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_updates`
--

CREATE TABLE IF NOT EXISTS `jos_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=48 ;

--
-- Dumping data for table `jos_updates`
--

INSERT INTO `jos_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.4.4.1', '', 'http://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(2, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.4.4.1', '', 'http://update.joomla.org/language/details3/et-EE_details.xml', '', ''),
(3, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(4, 3, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '3.4.5.1', '', 'http://update.joomla.org/language/details3/km-KH_details.xml', '', ''),
(5, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.4.4.2', '', 'http://update.joomla.org/language/details3/ko-KR_details.xml', '', ''),
(6, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.4.3.1', '', 'http://update.joomla.org/language/details3/lv-LV_details.xml', '', ''),
(7, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.4.5.1', '', 'http://update.joomla.org/language/details3/mk-MK_details.xml', '', ''),
(8, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.4.5.1', '', 'http://update.joomla.org/language/details3/nb-NO_details.xml', '', ''),
(9, 3, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '3.4.2.1', '', 'http://update.joomla.org/language/details3/nn-NO_details.xml', '', ''),
(10, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(11, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(12, 3, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.4.5.1', '', 'http://update.joomla.org/language/details3/pt-PT_details.xml', '', ''),
(13, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.4.1.3', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', '', ''),
(14, 3, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(15, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.4.8.2', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(16, 3, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.4.6.1', '', 'http://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(17, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.5.0.1', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(18, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.4.5.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(19, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(20, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(21, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(22, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.4.4.1', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(23, 1, 700, 'Joomla', '', 'joomla', 'file', '', 0, '3.4.8', '', 'https://update.joomla.org/core/sts/extension_sts.xml', '', ''),
(24, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(25, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(26, 3, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '3.3.6.1', '', 'http://update.joomla.org/language/details3/hi-IN_details.xml', '', ''),
(27, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(28, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.4.4.1', '', 'http://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(29, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(30, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(31, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.4.4.1', '', 'http://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(32, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/vi-VN_details.xml', '', ''),
(33, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.3.0.2', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
(34, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.4.2.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', '', ''),
(35, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(36, 3, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.3.1.1', '', 'http://update.joomla.org/language/details3/srp-ME_details.xml', '', ''),
(37, 3, 0, 'English CA', '', 'pkg_en-CA', 'package', '', 0, '3.4.6.1', '', 'http://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(38, 3, 0, 'French CA', '', 'pkg_fr-CA', 'package', '', 0, '3.4.4.3', '', 'http://update.joomla.org/language/details3/fr-CA_details.xml', '', ''),
(39, 3, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '3.3.0.2', '', 'http://update.joomla.org/language/details3/cy-GB_details.xml', '', ''),
(40, 3, 0, 'Sinhala', '', 'pkg_si-LK', 'package', '', 0, '3.3.1.1', '', 'http://update.joomla.org/language/details3/si-LK_details.xml', '', ''),
(41, 3, 0, 'Dari Persian', '', 'pkg_prs-AF', 'package', '', 0, '3.4.4.1', '', 'http://update.joomla.org/language/details3/prs-AF_details.xml', '', ''),
(42, 3, 0, 'Turkmen', '', 'pkg_tk-TM', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/tk-TM_details.xml', '', ''),
(43, 3, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '3.4.8.1', '', 'http://update.joomla.org/language/details3/ga-IE_details.xml', '', ''),
(44, 3, 0, 'Dzongkha', '', 'pkg_dz-BT', 'package', '', 0, '3.4.5.1', '', 'http://update.joomla.org/language/details3/dz-BT_details.xml', '', ''),
(45, 5, 10001, 'Akeeba Backup Core', 'Akeeba Backup Core', 'com_akeeba', 'component', '', 1, '4.5.5', '', 'http://cdn.akeebabackup.com/updates/abcore.xml', 'https://www.akeebabackup.com/component/ars/?view=Items&release_id=2408', ''),
(46, 7, 10007, 'JJ Social Slider', 'JJ Social Slider', 'mod_social_slider', 'module', '', 0, '2.0.2', '', 'http://www.joomjunk.co.uk/updates/social_slider_update.xml', '', ''),
(47, 8, 10008, 'Slideshow CK', 'Show your images with a nice effect', 'mod_slideshowck', 'module', '', 0, '1.4.27', '', 'http://update.joomlack.fr/mod_slideshowck_update.xml', 'http://www.joomlack.fr/extensions-joomla/slideshow-ck', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_update_sites`
--

CREATE TABLE IF NOT EXISTS `jos_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_update_sites`
--

INSERT INTO `jos_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla! Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1458021963, ''),
(2, 'Joomla! Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1458021963, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1458021962, ''),
(4, 'Joomla! Update Component Update Site', 'extension', 'http://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1458021962, ''),
(5, 'Akeeba Backup Core', 'extension', 'http://cdn.akeebabackup.com/updates/abcore.xml', 1, 1458021962, ''),
(6, 'Plugin Googlemap Update Site', 'extension', 'http://tech.reumer.net/update/plugin_googlemap3/extension.xml', 1, 1458021962, ''),
(7, 'JJ Social Slider', 'extension', 'http://www.joomjunk.co.uk/updates/social_slider_update.xml', 1, 1458021962, ''),
(8, 'Slideshow CK Update', 'extension', 'http://update.joomlack.fr/mod_slideshowck_update.xml', 1, 1458021962, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `jos_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `jos_update_sites_extensions`
--

INSERT INTO `jos_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 28),
(5, 10001),
(6, 10004),
(7, 10007),
(8, 10008);

-- --------------------------------------------------------

--
-- Table structure for table `jos_usergroups`
--

CREATE TABLE IF NOT EXISTS `jos_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `jos_usergroups`
--

INSERT INTO `jos_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`) VALUES
(62, 'Super User', 'gaddielsattva_h64ks440', 'gaddiel.sattva@gmail.com', '$2y$10$8j96HDzLNB3BrhbvgzGNtuAuJjUMpCb0y578uEZYBArHR2boAQyby', 0, 1, '2015-09-19 17:47:45', '2016-03-15 05:48:44', '0', '{}', '0000-00-00 00:00:00', 0, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_user_keys`
--

CREATE TABLE IF NOT EXISTS `jos_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_user_notes`
--

CREATE TABLE IF NOT EXISTS `jos_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_user_profiles`
--

CREATE TABLE IF NOT EXISTS `jos_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `jos_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `jos_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to jos_users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to jos_usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_user_usergroup_map`
--

INSERT INTO `jos_user_usergroup_map` (`user_id`, `group_id`) VALUES
(62, 8);

-- --------------------------------------------------------

--
-- Table structure for table `jos_viewlevels`
--

CREATE TABLE IF NOT EXISTS `jos_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_viewlevels`
--

INSERT INTO `jos_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
