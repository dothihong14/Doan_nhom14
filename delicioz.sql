-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 19, 2025 at 02:48 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delicioz`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:3;', 1742352529),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1742352529;', 1742352529),
('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:1;', 1742350131),
('livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1742350131;', 1742350131),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:187:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:9:\"view_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:13:\"view_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:11:\"create_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"update_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:12:\"restore_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"restore_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:14:\"replicate_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:12:\"reorder_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:11:\"delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:15:\"delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:17:\"force_delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:21:\"force_delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:9:\"view_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"view_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:11:\"create_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:11:\"update_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:12:\"restore_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:16:\"restore_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:14:\"replicate_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:12:\"reorder_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:11:\"delete_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:15:\"delete_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:17:\"force_delete_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:21:\"force_delete_any_dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:15:\"view_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:19:\"view_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:17:\"create_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:17:\"update_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:18:\"restore_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:22:\"restore_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:20:\"replicate_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:18:\"reorder_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:17:\"delete_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:21:\"delete_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:23:\"force_delete_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:27:\"force_delete_any_ingredient\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:12:\"view_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:16:\"view_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:14:\"create_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:14:\"update_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:15:\"restore_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:19:\"restore_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:17:\"replicate_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:15:\"reorder_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:14:\"delete_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:18:\"delete_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:20:\"force_delete_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:24:\"force_delete_any_invoice\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:10:\"view_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:14:\"view_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:12:\"create_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:12:\"update_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:13:\"restore_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:17:\"restore_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:15:\"replicate_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:13:\"reorder_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:12:\"delete_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:16:\"delete_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:18:\"force_delete_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:22:\"force_delete_any_order\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:3:{s:1:\"a\";i:67;s:1:\"b\";s:16:\"view_order::item\";s:1:\"c\";s:3:\"web\";}i:67;a:3:{s:1:\"a\";i:68;s:1:\"b\";s:20:\"view_any_order::item\";s:1:\"c\";s:3:\"web\";}i:68;a:3:{s:1:\"a\";i:69;s:1:\"b\";s:18:\"create_order::item\";s:1:\"c\";s:3:\"web\";}i:69;a:3:{s:1:\"a\";i:70;s:1:\"b\";s:18:\"update_order::item\";s:1:\"c\";s:3:\"web\";}i:70;a:3:{s:1:\"a\";i:71;s:1:\"b\";s:19:\"restore_order::item\";s:1:\"c\";s:3:\"web\";}i:71;a:3:{s:1:\"a\";i:72;s:1:\"b\";s:23:\"restore_any_order::item\";s:1:\"c\";s:3:\"web\";}i:72;a:3:{s:1:\"a\";i:73;s:1:\"b\";s:21:\"replicate_order::item\";s:1:\"c\";s:3:\"web\";}i:73;a:3:{s:1:\"a\";i:74;s:1:\"b\";s:19:\"reorder_order::item\";s:1:\"c\";s:3:\"web\";}i:74;a:3:{s:1:\"a\";i:75;s:1:\"b\";s:18:\"delete_order::item\";s:1:\"c\";s:3:\"web\";}i:75;a:3:{s:1:\"a\";i:76;s:1:\"b\";s:22:\"delete_any_order::item\";s:1:\"c\";s:3:\"web\";}i:76;a:3:{s:1:\"a\";i:77;s:1:\"b\";s:24:\"force_delete_order::item\";s:1:\"c\";s:3:\"web\";}i:77;a:3:{s:1:\"a\";i:78;s:1:\"b\";s:28:\"force_delete_any_order::item\";s:1:\"c\";s:3:\"web\";}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:14:\"view_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:18:\"view_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:80;a:4:{s:1:\"a\";i:81;s:1:\"b\";s:16:\"create_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:81;a:4:{s:1:\"a\";i:82;s:1:\"b\";s:16:\"update_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:82;a:4:{s:1:\"a\";i:83;s:1:\"b\";s:17:\"restore_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:83;a:4:{s:1:\"a\";i:84;s:1:\"b\";s:21:\"restore_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:84;a:4:{s:1:\"a\";i:85;s:1:\"b\";s:19:\"replicate_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:85;a:4:{s:1:\"a\";i:86;s:1:\"b\";s:17:\"reorder_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:86;a:4:{s:1:\"a\";i:87;s:1:\"b\";s:16:\"delete_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:87;a:4:{s:1:\"a\";i:88;s:1:\"b\";s:20:\"delete_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:88;a:4:{s:1:\"a\";i:89;s:1:\"b\";s:22:\"force_delete_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:89;a:4:{s:1:\"a\";i:90;s:1:\"b\";s:26:\"force_delete_any_promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:90;a:4:{s:1:\"a\";i:91;s:1:\"b\";s:16:\"view_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:91;a:4:{s:1:\"a\";i:92;s:1:\"b\";s:20:\"view_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:92;a:4:{s:1:\"a\";i:93;s:1:\"b\";s:18:\"create_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:93;a:4:{s:1:\"a\";i:94;s:1:\"b\";s:18:\"update_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:94;a:4:{s:1:\"a\";i:95;s:1:\"b\";s:19:\"restore_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:95;a:4:{s:1:\"a\";i:96;s:1:\"b\";s:23:\"restore_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:96;a:4:{s:1:\"a\";i:97;s:1:\"b\";s:21:\"replicate_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:97;a:4:{s:1:\"a\";i:98;s:1:\"b\";s:19:\"reorder_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:98;a:4:{s:1:\"a\";i:99;s:1:\"b\";s:18:\"delete_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:99;a:4:{s:1:\"a\";i:100;s:1:\"b\";s:22:\"delete_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:100;a:4:{s:1:\"a\";i:101;s:1:\"b\";s:24:\"force_delete_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:101;a:4:{s:1:\"a\";i:102;s:1:\"b\";s:28:\"force_delete_any_reservation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:102;a:4:{s:1:\"a\";i:103;s:1:\"b\";s:15:\"view_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:103;a:4:{s:1:\"a\";i:104;s:1:\"b\";s:19:\"view_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:104;a:4:{s:1:\"a\";i:105;s:1:\"b\";s:17:\"create_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:105;a:4:{s:1:\"a\";i:106;s:1:\"b\";s:17:\"update_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:106;a:4:{s:1:\"a\";i:107;s:1:\"b\";s:18:\"restore_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:107;a:4:{s:1:\"a\";i:108;s:1:\"b\";s:22:\"restore_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:108;a:4:{s:1:\"a\";i:109;s:1:\"b\";s:20:\"replicate_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:109;a:4:{s:1:\"a\";i:110;s:1:\"b\";s:18:\"reorder_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:110;a:4:{s:1:\"a\";i:111;s:1:\"b\";s:17:\"delete_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:111;a:4:{s:1:\"a\";i:112;s:1:\"b\";s:21:\"delete_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:112;a:4:{s:1:\"a\";i:113;s:1:\"b\";s:23:\"force_delete_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:113;a:4:{s:1:\"a\";i:114;s:1:\"b\";s:27:\"force_delete_any_restaurant\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:114;a:4:{s:1:\"a\";i:115;s:1:\"b\";s:10:\"view_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:115;a:4:{s:1:\"a\";i:116;s:1:\"b\";s:14:\"view_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:116;a:4:{s:1:\"a\";i:117;s:1:\"b\";s:12:\"create_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:117;a:4:{s:1:\"a\";i:118;s:1:\"b\";s:12:\"update_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:118;a:4:{s:1:\"a\";i:119;s:1:\"b\";s:13:\"restore_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:119;a:4:{s:1:\"a\";i:120;s:1:\"b\";s:17:\"restore_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:120;a:4:{s:1:\"a\";i:121;s:1:\"b\";s:15:\"replicate_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:121;a:4:{s:1:\"a\";i:122;s:1:\"b\";s:13:\"reorder_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:122;a:4:{s:1:\"a\";i:123;s:1:\"b\";s:12:\"delete_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:123;a:4:{s:1:\"a\";i:124;s:1:\"b\";s:16:\"delete_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:124;a:4:{s:1:\"a\";i:125;s:1:\"b\";s:18:\"force_delete_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:125;a:4:{s:1:\"a\";i:126;s:1:\"b\";s:22:\"force_delete_any_table\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:126;a:4:{s:1:\"a\";i:127;s:1:\"b\";s:19:\"view_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:127;a:4:{s:1:\"a\";i:128;s:1:\"b\";s:23:\"view_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:128;a:4:{s:1:\"a\";i:129;s:1:\"b\";s:21:\"create_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:129;a:4:{s:1:\"a\";i:130;s:1:\"b\";s:21:\"update_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:130;a:4:{s:1:\"a\";i:131;s:1:\"b\";s:22:\"restore_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:131;a:4:{s:1:\"a\";i:132;s:1:\"b\";s:26:\"restore_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:132;a:4:{s:1:\"a\";i:133;s:1:\"b\";s:24:\"replicate_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:133;a:4:{s:1:\"a\";i:134;s:1:\"b\";s:22:\"reorder_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:134;a:4:{s:1:\"a\";i:135;s:1:\"b\";s:21:\"delete_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:135;a:4:{s:1:\"a\";i:136;s:1:\"b\";s:25:\"delete_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:136;a:4:{s:1:\"a\";i:137;s:1:\"b\";s:27:\"force_delete_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:137;a:4:{s:1:\"a\";i:138;s:1:\"b\";s:31:\"force_delete_any_food::category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:138;a:3:{s:1:\"a\";i:139;s:1:\"b\";s:9:\"view_post\";s:1:\"c\";s:3:\"web\";}i:139;a:3:{s:1:\"a\";i:140;s:1:\"b\";s:13:\"view_any_post\";s:1:\"c\";s:3:\"web\";}i:140;a:3:{s:1:\"a\";i:141;s:1:\"b\";s:11:\"create_post\";s:1:\"c\";s:3:\"web\";}i:141;a:3:{s:1:\"a\";i:142;s:1:\"b\";s:11:\"update_post\";s:1:\"c\";s:3:\"web\";}i:142;a:3:{s:1:\"a\";i:143;s:1:\"b\";s:12:\"restore_post\";s:1:\"c\";s:3:\"web\";}i:143;a:3:{s:1:\"a\";i:144;s:1:\"b\";s:16:\"restore_any_post\";s:1:\"c\";s:3:\"web\";}i:144;a:3:{s:1:\"a\";i:145;s:1:\"b\";s:14:\"replicate_post\";s:1:\"c\";s:3:\"web\";}i:145;a:3:{s:1:\"a\";i:146;s:1:\"b\";s:12:\"reorder_post\";s:1:\"c\";s:3:\"web\";}i:146;a:3:{s:1:\"a\";i:147;s:1:\"b\";s:11:\"delete_post\";s:1:\"c\";s:3:\"web\";}i:147;a:3:{s:1:\"a\";i:148;s:1:\"b\";s:15:\"delete_any_post\";s:1:\"c\";s:3:\"web\";}i:148;a:3:{s:1:\"a\";i:149;s:1:\"b\";s:17:\"force_delete_post\";s:1:\"c\";s:3:\"web\";}i:149;a:3:{s:1:\"a\";i:150;s:1:\"b\";s:21:\"force_delete_any_post\";s:1:\"c\";s:3:\"web\";}i:150;a:3:{s:1:\"a\";i:151;s:1:\"b\";s:19:\"view_post::category\";s:1:\"c\";s:3:\"web\";}i:151;a:3:{s:1:\"a\";i:152;s:1:\"b\";s:23:\"view_any_post::category\";s:1:\"c\";s:3:\"web\";}i:152;a:3:{s:1:\"a\";i:153;s:1:\"b\";s:21:\"create_post::category\";s:1:\"c\";s:3:\"web\";}i:153;a:3:{s:1:\"a\";i:154;s:1:\"b\";s:21:\"update_post::category\";s:1:\"c\";s:3:\"web\";}i:154;a:3:{s:1:\"a\";i:155;s:1:\"b\";s:22:\"restore_post::category\";s:1:\"c\";s:3:\"web\";}i:155;a:3:{s:1:\"a\";i:156;s:1:\"b\";s:26:\"restore_any_post::category\";s:1:\"c\";s:3:\"web\";}i:156;a:3:{s:1:\"a\";i:157;s:1:\"b\";s:24:\"replicate_post::category\";s:1:\"c\";s:3:\"web\";}i:157;a:3:{s:1:\"a\";i:158;s:1:\"b\";s:22:\"reorder_post::category\";s:1:\"c\";s:3:\"web\";}i:158;a:3:{s:1:\"a\";i:159;s:1:\"b\";s:21:\"delete_post::category\";s:1:\"c\";s:3:\"web\";}i:159;a:3:{s:1:\"a\";i:160;s:1:\"b\";s:25:\"delete_any_post::category\";s:1:\"c\";s:3:\"web\";}i:160;a:3:{s:1:\"a\";i:161;s:1:\"b\";s:27:\"force_delete_post::category\";s:1:\"c\";s:3:\"web\";}i:161;a:3:{s:1:\"a\";i:162;s:1:\"b\";s:31:\"force_delete_any_post::category\";s:1:\"c\";s:3:\"web\";}i:162;a:4:{s:1:\"a\";i:163;s:1:\"b\";s:12:\"view_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:163;a:4:{s:1:\"a\";i:164;s:1:\"b\";s:16:\"view_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:164;a:4:{s:1:\"a\";i:165;s:1:\"b\";s:14:\"create_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:165;a:4:{s:1:\"a\";i:166;s:1:\"b\";s:14:\"update_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:166;a:4:{s:1:\"a\";i:167;s:1:\"b\";s:15:\"restore_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:167;a:4:{s:1:\"a\";i:168;s:1:\"b\";s:19:\"restore_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:168;a:4:{s:1:\"a\";i:169;s:1:\"b\";s:17:\"replicate_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:169;a:4:{s:1:\"a\";i:170;s:1:\"b\";s:15:\"reorder_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:170;a:4:{s:1:\"a\";i:171;s:1:\"b\";s:14:\"delete_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:171;a:4:{s:1:\"a\";i:172;s:1:\"b\";s:18:\"delete_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:172;a:4:{s:1:\"a\";i:173;s:1:\"b\";s:20:\"force_delete_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:173;a:4:{s:1:\"a\";i:174;s:1:\"b\";s:24:\"force_delete_any_contact\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:174;a:4:{s:1:\"a\";i:175;s:1:\"b\";s:11:\"page_Themes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:175;a:4:{s:1:\"a\";i:176;s:1:\"b\";s:16:\"view_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:176;a:4:{s:1:\"a\";i:177;s:1:\"b\";s:20:\"view_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:177;a:4:{s:1:\"a\";i:178;s:1:\"b\";s:18:\"create_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:178;a:4:{s:1:\"a\";i:179;s:1:\"b\";s:18:\"update_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:179;a:4:{s:1:\"a\";i:180;s:1:\"b\";s:19:\"restore_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:180;a:4:{s:1:\"a\";i:181;s:1:\"b\";s:23:\"restore_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:181;a:4:{s:1:\"a\";i:182;s:1:\"b\";s:21:\"replicate_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:182;a:4:{s:1:\"a\";i:183;s:1:\"b\";s:19:\"reorder_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:183;a:4:{s:1:\"a\";i:184;s:1:\"b\";s:18:\"delete_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:184;a:4:{s:1:\"a\";i:185;s:1:\"b\";s:22:\"delete_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:185;a:4:{s:1:\"a\";i:186;s:1:\"b\";s:24:\"force_delete_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:186;a:4:{s:1:\"a\";i:187;s:1:\"b\";s:28:\"force_delete_any_table::dish\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"Admin\";s:1:\"c\";s:3:\"web\";}}}', 1742369247),
('theme', 's:6:\"sunset\";', 2057571258),
('theme_color', 's:4:\"lime\";', 2057571260);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`, `updated_at`) VALUES
(1, '123', '123@2', '123', '2025-03-14 13:31:49', '2025-03-14 13:31:49'),
(2, '123', '1@1', 'Message123', '2025-03-14 13:33:56', '2025-03-14 13:33:56'),
(3, '1', '2@2', '123', '2025-03-14 13:35:06', '2025-03-14 13:35:06'),
(4, '123', '2509roblox@gmail.com', '123', '2025-03-14 13:35:32', '2025-03-14 13:35:32'),
(5, '123', '2509roblox@gmail.com', '123', '2025-03-16 13:08:57', '2025-03-16 13:08:57'),
(6, 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', '2025-03-16 13:51:15', '2025-03-16 13:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `food_category_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sold_quantity` int NOT NULL DEFAULT '0',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `restaurant_id`, `name`, `description`, `price`, `created_at`, `updated_at`, `food_category_id`, `image`, `slug`, `sold_quantity`, `status`) VALUES
(12, 1, 'Gỏi tôm và sốt chanh tuyết', 'Gỏi tôm và sốt chanh tuyết', '245000.00', '2025-03-19 02:39:17', '2025-03-19 02:39:17', 2, 'goi-tom-va-sot-chanh-tuyet-1742351957.jpeg', 'goi-tom-va-sot-chanh-tuyet', 0, NULL),
(13, 1, 'Lưỡi bò nướng chấm trứng lòng đào mắm tỏi và mắm me', 'Lưỡi bò nướng chấm trứng lòng đào mắm tỏi và mắm me', '205000.00', '2025-03-19 02:39:18', '2025-03-19 02:39:18', 2, 'luoi-bo-nuong-cham-trung-long-dao-mam-toi-va-mam-me-1742351958.jpeg', 'luoi-bo-nuong-cham-trung-long-dao-mam-toi-va-mam-me', 0, NULL),
(14, 1, 'Mực chiên trứng muối', 'Mực chiên trứng muối', '170000.00', '2025-03-19 02:39:19', '2025-03-19 02:39:19', 2, 'muc-chien-trung-muoi-1742351959.jpeg', 'muc-chien-trung-muoi', 0, NULL),
(15, 1, 'Xiên sườn bò Black Angus Mỹ nướng sốt Satay', 'Xiên sườn bò Black Angus Mỹ nướng sốt Satay', '175000.00', '2025-03-19 02:39:20', '2025-03-19 02:39:20', 2, 'xien-suon-bo-black-angus-my-nuong-sot-satay-1742351960.jpeg', 'xien-suon-bo-black-angus-my-nuong-sot-satay', 0, NULL),
(16, 1, 'Xiên Heo nướng ăn kèm bánh mì bơ dừa', 'Xiên Heo nướng ăn kèm bánh mì bơ dừa', '135000.00', '2025-03-19 02:39:21', '2025-03-19 02:39:21', 2, 'xien-heo-nuong-an-kem-banh-mi-bo-dua-1742351961.jpeg', 'xien-heo-nuong-an-kem-banh-mi-bo-dua', 0, NULL),
(17, 1, 'Gỏi phile cá diêu hồng kiểu Thái', 'Gỏi phile cá diêu hồng kiểu Thái', '195000.00', '2025-03-19 02:39:23', '2025-03-19 02:39:23', 2, 'goi-phile-ca-dieu-hong-kieu-thai-1742351963.png', 'goi-phile-ca-dieu-hong-kieu-thai', 0, NULL),
(18, 1, 'Cánh gà chiên kiểu Bangkok', 'Cánh gà chiên kiểu Bangkok', '110000.00', '2025-03-19 02:39:23', '2025-03-19 02:39:23', 2, 'canh-ga-chien-kieu-bangkok-1742351963.jpeg', 'canh-ga-chien-kieu-bangkok', 0, NULL),
(19, 1, 'Cánh gà chiên sốt Tom Yum', 'Cánh gà chiên sốt Tom Yum', '115000.00', '2025-03-19 02:39:24', '2025-03-19 02:39:24', 2, 'canh-ga-chien-sot-tom-yum-1742351964.jpeg', 'canh-ga-chien-sot-tom-yum', 0, NULL),
(20, 1, 'Ngao hấp bia Chang và lá chanh Thái', 'Ngao hấp bia Chang và lá chanh Thái', '145000.00', '2025-03-19 02:39:25', '2025-03-19 02:39:25', 2, 'ngao-hap-bia-chang-va-la-chanh-thai-1742351965.jpeg', 'ngao-hap-bia-chang-va-la-chanh-thai', 0, NULL),
(21, 1, 'Đậu hũ chiên sốt me', 'Đậu hũ chiên sốt me', '65000.00', '2025-03-19 02:39:26', '2025-03-19 02:39:26', 2, 'dau-hu-chien-sot-me-1742351966.jpeg', 'dau-hu-chien-sot-me', 0, NULL),
(22, 1, 'Gỏi trứng lòng đào trộn thịt bằm thính hành khô', 'Gỏi trứng lòng đào trộn thịt bằm thính hành khô', '110000.00', '2025-03-19 02:39:27', '2025-03-19 02:39:27', 2, 'goi-trung-long-dao-tron-thit-bam-thinh-hanh-kho-1742351967.jpeg', 'goi-trung-long-dao-tron-thit-bam-thinh-hanh-kho', 0, NULL),
(23, 1, 'Lạp heo phồng tôm', 'Lạp heo phồng tôm', '110000.00', '2025-03-19 02:39:28', '2025-03-19 02:39:28', 2, 'lap-heo-phong-tom-1742351968.jpeg', 'lap-heo-phong-tom', 0, NULL),
(24, 1, 'Thịt trâu lát mỏng tái chanh kiểu Thái', 'Thịt trâu lát mỏng tái chanh kiểu Thái', '150000.00', '2025-03-19 02:39:29', '2025-03-19 02:39:29', 2, 'thit-trau-lat-mong-tai-chanh-kieu-thai-1742351969.jpeg', 'thit-trau-lat-mong-tai-chanh-kieu-thai', 0, NULL),
(25, 1, 'Cơm cháy chấm sốt tôm thịt kiểu Thái', 'Cơm cháy chấm sốt tôm thịt kiểu Thái', '90000.00', '2025-03-19 02:39:29', '2025-03-19 02:39:29', 2, 'com-chay-cham-sot-tom-thit-kieu-thai-1742351969.jpeg', 'com-chay-cham-sot-tom-thit-kieu-thai', 0, NULL),
(26, 1, 'Nấm chiên giòn chua cay', 'Nấm chiên giòn chua cay', '75000.00', '2025-03-19 02:39:31', '2025-03-19 02:39:31', 2, 'nam-chien-gion-chua-cay-1742351971.jpeg', 'nam-chien-gion-chua-cay', 0, NULL),
(27, 1, 'Salad miến trộn hải sản cay', 'Salad miến trộn hải sản cay', '160000.00', '2025-03-19 02:39:32', '2025-03-19 02:39:32', 1, 'salad-mien-tron-hai-san-cay-1742351972.jpeg', 'salad-mien-tron-hai-san-cay', 0, NULL),
(28, 1, 'Gỏi bưởi hạt điều và dừa khô', 'Gỏi bưởi hạt điều và dừa khô', '120000.00', '2025-03-19 02:39:32', '2025-03-19 02:39:32', 1, 'goi-buoi-hat-dieu-va-dua-kho-1742351972.jpeg', 'goi-buoi-hat-dieu-va-dua-kho', 0, NULL),
(29, 1, 'Cải làn xào thịt heo quay - Rau thay đổi theo mùa)', 'Cải làn xào thịt heo quay - Rau thay đổi theo mùa)', '115000.00', '2025-03-19 02:39:33', '2025-03-19 02:39:33', 1, 'cai-lan-xao-thit-heo-quay-rau-thay-doi-theo-mua-1742351973.jpeg', 'cai-lan-xao-thit-heo-quay-rau-thay-doi-theo-mua', 0, NULL),
(30, 1, 'Gỏi Ngô', 'Gỏi Ngô', '105000.00', '2025-03-19 02:39:35', '2025-03-19 02:39:35', 1, 'goi-ngo-1742351975.png', 'goi-ngo', 0, NULL),
(31, 1, 'Gỏi Cá Hồi', 'Gỏi Cá Hồi', '245000.00', '2025-03-19 02:39:36', '2025-03-19 02:39:36', 1, 'goi-ca-hoi-1742351976.jpeg', 'goi-ca-hoi', 0, NULL),
(32, 1, 'Gỏi roi trộn', 'Gỏi roi trộn', '120000.00', '2025-03-19 02:39:37', '2025-03-19 02:39:37', 1, 'goi-roi-tron-1742351977.png', 'goi-roi-tron', 0, NULL),
(33, 1, 'Gỏi sò huyết Thái', 'Gỏi sò huyết Thái', '260000.00', '2025-03-19 02:39:38', '2025-03-19 02:39:38', 1, 'goi-so-huyet-thai-1742351978.png', 'goi-so-huyet-thai', 0, NULL),
(34, 1, 'Súp Tom Yum với Tôm', 'Súp Tom Yum với Tôm', '120000.00', '2025-03-19 02:39:39', '2025-03-19 02:39:39', 3, 'sup-tom-yum-voi-tom-1742351979.jpeg', 'sup-tom-yum-voi-tom', 0, NULL),
(35, 1, 'Súp thịt gà nước cốt dừa', 'Súp thịt gà nước cốt dừa', '115000.00', '2025-03-19 02:39:42', '2025-03-19 02:39:42', 3, 'sup-thit-ga-nuoc-cot-dua-1742351982.jpeg', 'sup-thit-ga-nuoc-cot-dua', 0, NULL),
(36, 1, 'Súp Tom Yum nước trong với chân gà', 'Súp Tom Yum nước trong với chân gà', '120000.00', '2025-03-19 02:39:44', '2025-03-19 02:39:44', 3, 'sup-tom-yum-nuoc-trong-voi-chan-ga-1742351984.jpeg', 'sup-tom-yum-nuoc-trong-voi-chan-ga', 0, NULL),
(37, 1, 'Súp sườn cay', 'Súp sườn cay', '225000.00', '2025-03-19 02:39:45', '2025-03-19 02:39:45', 3, 'sup-suon-cay-1742351985.jpeg', 'sup-suon-cay', 0, NULL),
(38, 1, 'Súp xoài xanh cá điêu hồng chua cay', 'Súp xoài xanh cá điêu hồng chua cay', '130000.00', '2025-03-19 02:39:46', '2025-03-19 02:39:46', 3, 'sup-xoai-xanh-ca-dieu-hong-chua-cay-1742351986.jpeg', 'sup-xoai-xanh-ca-dieu-hong-chua-cay', 0, NULL),
(39, 1, 'Bò lúc lắc với lá chanh Thái và ớt khô', 'Bò lúc lắc với lá chanh Thái và ớt khô', '200000.00', '2025-03-19 02:39:47', '2025-03-19 02:39:47', 4, 'bo-luc-lac-voi-la-chanh-thai-va-ot-kho-1742351987.jpeg', 'bo-luc-lac-voi-la-chanh-thai-va-ot-kho', 0, NULL),
(40, 1, 'Nọng heo nướng chấm sốt me', 'Nọng heo nướng chấm sốt me', '210000.00', '2025-03-19 02:39:48', '2025-03-19 02:39:48', 4, 'nong-heo-nuong-cham-sot-me-1742351988.jpeg', 'nong-heo-nuong-cham-sot-me', 0, NULL),
(41, 1, '1/2 Gà nướng kiểu Bắc Thái ăn kèm với gỏi xoài', '1/2 Gà nướng kiểu Bắc Thái ăn kèm với gỏi xoài', '225000.00', '2025-03-19 02:39:49', '2025-03-19 02:39:49', 4, '12-ga-nuong-kieu-bac-thai-an-kem-voi-goi-xoai-1742351989.jpeg', '12-ga-nuong-kieu-bac-thai-an-kem-voi-goi-xoai', 0, NULL),
(42, 1, 'Sườn nướng mật ong với sốt Nam Jim Jaew', 'Sườn nướng mật ong với sốt Nam Jim Jaew', '260000.00', '2025-03-19 02:39:50', '2025-03-19 02:39:50', 4, 'suon-nuong-mat-ong-voi-sot-nam-jim-jaew-1742351990.jpeg', 'suon-nuong-mat-ong-voi-sot-nam-jim-jaew', 0, NULL),
(43, 1, 'Cua lột cà ri trứng muối', 'Cua lột cà ri trứng muối', '395000.00', '2025-03-19 02:39:51', '2025-03-19 02:39:51', 4, 'cua-lot-ca-ri-trung-muoi-1742351991.jpeg', 'cua-lot-ca-ri-trung-muoi', 0, NULL),
(44, 1, 'Cá điêu hồng hấp sốt chanh', 'Cá điêu hồng hấp sốt chanh', '335000.00', '2025-03-19 02:39:53', '2025-03-19 02:39:53', 4, 'ca-dieu-hong-hap-sot-chanh-1742351993.jpeg', 'ca-dieu-hong-hap-sot-chanh', 0, NULL),
(45, 1, 'Sườn cay (suất 2 người)', 'Sườn cay (suất 2 người)', '385000.00', '2025-03-19 02:39:55', '2025-03-19 02:39:55', 4, 'suon-cay-suat-2-nguoi-1742351995.jpeg', 'suon-cay-suat-2-nguoi', 0, NULL),
(46, 1, 'Padthai xào tôm với trứng chần', 'Padthai xào tôm với trứng chần', '155000.00', '2025-03-19 02:39:56', '2025-03-19 02:39:56', 5, 'padthai-xao-tom-voi-trung-chan-1742351996.png', 'padthai-xao-tom-voi-trung-chan', 0, NULL),
(47, 1, 'Phở bản to xào gà và tôm kiểu Thái sốt cay', 'Phở bản to xào gà và tôm kiểu Thái sốt cay', '110000.00', '2025-03-19 02:39:58', '2025-03-19 02:39:58', 5, 'pho-ban-to-xao-ga-va-tom-kieu-thai-sot-cay-1742351998.jpeg', 'pho-ban-to-xao-ga-va-tom-kieu-thai-sot-cay', 0, NULL),
(48, 1, 'Bún cà ri cua', 'Bún cà ri cua', '170000.00', '2025-03-19 02:39:59', '2025-03-19 02:39:59', 5, 'bun-ca-ri-cua-1742351999.jpeg', 'bun-ca-ri-cua', 0, NULL),
(49, 1, 'Phở bản to xào Bò với sốt xì dầu', 'Phở bản to xào Bò với sốt xì dầu', '140000.00', '2025-03-19 02:40:01', '2025-03-19 02:40:01', 5, 'pho-ban-to-xao-bo-voi-sot-xi-dau-1742352001.jpeg', 'pho-ban-to-xao-bo-voi-sot-xi-dau', 0, NULL),
(50, 1, 'Cơm thịt Gà xe BBQ, trứng muối và trái vải', 'Cơm thịt Gà xe BBQ, trứng muối và trái vải', '150000.00', '2025-03-19 02:40:03', '2025-03-19 02:40:03', 5, 'com-thit-ga-xe-bbq-trung-muoi-va-trai-vai-1742352003.png', 'com-thit-ga-xe-bbq-trung-muoi-va-trai-vai', 0, NULL),
(51, 1, 'Cơm chiên dứa tôm và hạt điều', 'Cơm chiên dứa tôm và hạt điều', '155000.00', '2025-03-19 02:40:04', '2025-03-19 02:40:04', 5, 'com-chien-dua-tom-va-hat-dieu-1742352004.jpeg', 'com-chien-dua-tom-va-hat-dieu', 0, NULL),
(52, 1, 'Cơm chiên sốt Tom Yum', 'Cơm chiên sốt Tom Yum', '150000.00', '2025-03-19 02:40:08', '2025-03-19 02:40:08', 5, 'com-chien-sot-tom-yum-1742352008.jpeg', 'com-chien-sot-tom-yum', 0, NULL),
(53, 1, 'Mỳ bò trộn kiểu Thái', 'Mỳ bò trộn kiểu Thái', '215000.00', '2025-03-19 02:40:09', '2025-03-19 02:40:09', 5, 'my-bo-tron-kieu-thai-1742352009.jpeg', 'my-bo-tron-kieu-thai', 0, NULL),
(54, 1, 'Cơm thịt heo bằm, mực xào lá quế và trứng ốp la', 'Cơm thịt heo bằm, mực xào lá quế và trứng ốp la', '135000.00', '2025-03-19 02:40:10', '2025-03-19 02:40:10', 5, 'com-thit-heo-bam-muc-xao-la-que-va-trung-op-la-1742352010.jpeg', 'com-thit-heo-bam-muc-xao-la-que-va-trung-op-la', 0, NULL),
(55, 1, 'Miếm om tay cầm', 'Miếm om tay cầm', '155000.00', '2025-03-19 02:40:11', '2025-03-19 02:40:11', 5, 'miem-om-tay-cam-1742352011.jpeg', 'miem-om-tay-cam', 0, NULL),
(56, 1, 'Cà ri vịt nướng trái vải và dứa', 'Cà ri vịt nướng trái vải và dứa', '260000.00', '2025-03-19 02:40:12', '2025-03-19 02:40:12', 6, 'ca-ri-vit-nuong-trai-vai-va-dua-1742352012.jpeg', 'ca-ri-vit-nuong-trai-vai-va-dua', 0, NULL),
(57, 1, 'Cà ri đỏ với tôm', 'Cà ri đỏ với tôm', '170000.00', '2025-03-19 02:40:13', '2025-03-19 02:40:13', 6, 'ca-ri-do-voi-tom-1742352013.jpeg', 'ca-ri-do-voi-tom', 0, NULL),
(58, 1, 'Cà ri xanh với nấm, đậu phụ và cà tím', 'Cà ri xanh với nấm, đậu phụ và cà tím', '110000.00', '2025-03-19 02:40:14', '2025-03-19 02:40:14', 6, 'ca-ri-xanh-voi-nam-dau-phu-va-ca-tim-1742352014.jpeg', 'ca-ri-xanh-voi-nam-dau-phu-va-ca-tim', 0, NULL),
(59, 1, 'Cà ri Massaman bò Úc khoai tây và hạt điều', 'Cà ri Massaman bò Úc khoai tây và hạt điều', '250000.00', '2025-03-19 02:40:15', '2025-03-19 02:40:15', 6, 'ca-ri-massaman-bo-uc-khoai-tay-va-hat-dieu-1742352015.png', 'ca-ri-massaman-bo-uc-khoai-tay-va-hat-dieu', 0, NULL),
(60, 1, 'Tôm cà ri trứng', 'Tôm cà ri trứng', '215000.00', '2025-03-19 02:40:16', '2025-03-19 02:40:16', 6, 'tom-ca-ri-trung-1742352016.jpeg', 'tom-ca-ri-trung', 0, NULL),
(61, 1, 'Cà ri sake', 'Cà ri sake', '155000.00', '2025-03-19 02:40:17', '2025-03-19 02:40:17', 6, 'ca-ri-sake-1742352017.jpeg', 'ca-ri-sake', 0, NULL),
(62, 1, 'Xôi xoài', 'Xôi xoài', '75000.00', '2025-03-19 02:40:19', '2025-03-19 02:40:19', 6, 'xoi-xoai-1742352019.png', 'xoi-xoai', 0, NULL),
(63, 1, 'Kem dừa nhà làm', 'Kem dừa nhà làm', '65000.00', '2025-03-19 02:40:20', '2025-03-19 02:40:20', 6, 'kem-dua-nha-lam-1742352020.jpeg', 'kem-dua-nha-lam', 0, NULL),
(64, 1, 'Kem đốt sầu riêng và nếp cẩm', 'Kem đốt sầu riêng và nếp cẩm', '100000.00', '2025-03-19 02:40:21', '2025-03-19 02:40:21', 6, 'kem-dot-sau-rieng-va-nep-cam-1742352021.jpeg', 'kem-dot-sau-rieng-va-nep-cam', 0, NULL),
(65, 1, 'Pudding sữa sốt xoài', 'Pudding sữa sốt xoài', '60000.00', '2025-03-19 02:40:22', '2025-03-19 02:40:22', 6, 'pudding-sua-sot-xoai-1742352022.jpeg', 'pudding-sua-sot-xoai', 0, NULL),
(66, 1, 'Cơm nọng heo nướng với gỏi đu đủ & soup gà cốt dừa', 'Cơm nọng heo nướng với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:23', '2025-03-19 02:40:23', 8, 'com-nong-heo-nuong-voi-goi-du-du-soup-ga-cot-dua-1742352023.png', 'com-nong-heo-nuong-voi-goi-du-du-soup-ga-cot-dua', 0, NULL),
(67, 1, 'Padthai với gỏi đu đủ & soup gà cốt dừa', 'Padthai với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:25', '2025-03-19 02:40:25', 8, 'padthai-voi-goi-du-du-soup-ga-cot-dua-1742352025.png', 'padthai-voi-goi-du-du-soup-ga-cot-dua', 0, NULL),
(68, 1, 'Cơm cải làn xào heo quay với gỏi đu đủ & soup Tomyum', 'Cơm cải làn xào heo quay với gỏi đu đủ & soup Tomyum', '120000.00', '2025-03-19 02:40:26', '2025-03-19 02:40:26', 8, 'com-cai-lan-xao-heo-quay-voi-goi-du-du-soup-tomyum-1742352026.png', 'com-cai-lan-xao-heo-quay-voi-goi-du-du-soup-tomyum', 0, NULL),
(69, 1, 'Cơm curry đỏ với soup gà cốt dừa', 'Cơm curry đỏ với soup gà cốt dừa', '120000.00', '2025-03-19 02:40:27', '2025-03-19 02:40:27', 8, 'com-curry-do-voi-soup-ga-cot-dua-1742352027.png', 'com-curry-do-voi-soup-ga-cot-dua', 0, NULL),
(70, 1, 'Cơm bò lúc lắc với gỏi đu đủ & soup gà cốt dừa', 'Cơm bò lúc lắc với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:30', '2025-03-19 02:40:30', 8, 'com-bo-luc-lac-voi-goi-du-du-soup-ga-cot-dua-1742352030.png', 'com-bo-luc-lac-voi-goi-du-du-soup-ga-cot-dua', 0, NULL),
(71, 1, 'Cơm curry xanh với soup gà cốt dừa', 'Cơm curry xanh với soup gà cốt dừa', '120000.00', '2025-03-19 02:40:31', '2025-03-19 02:40:31', 8, 'com-curry-xanh-voi-soup-ga-cot-dua-1742352031.png', 'com-curry-xanh-voi-soup-ga-cot-dua', 0, NULL),
(72, 1, 'Cơm thịt gà xé BBQ, trứng muối & trái vải với gỏi đu đủ & soup gà cốt dừa', 'Cơm thịt gà xé BBQ, trứng muối & trái vải với gỏi đu đủ & soup gà cốt dừa', '120000.00', '2025-03-19 02:40:33', '2025-03-19 02:40:33', 8, 'com-thit-ga-xe-bbq-trung-muoi-trai-vai-voi-goi-du-du-soup-ga-cot-dua-1742352033.png', 'com-thit-ga-xe-bbq-trung-muoi-trai-vai-voi-goi-du-du-soup-ga-cot-dua', 0, NULL),
(73, 1, 'Set Thư Thái (2-3 người)', 'Set Thư Thái (2-3 người)', '450000.00', '2025-03-19 02:40:34', '2025-03-19 02:40:34', 9, 'set-thu-thai-2-3-nguoi-1742352034.jpeg', 'set-thu-thai-2-3-nguoi', 0, NULL),
(74, 1, 'Set Sẻ Chia (4-6 người)', 'Set Sẻ Chia (4-6 người)', '610000.00', '2025-03-19 02:40:36', '2025-03-19 02:40:36', 9, 'set-se-chia-4-6-nguoi-1742352036.jpeg', 'set-se-chia-4-6-nguoi', 0, NULL),
(75, 1, 'Set Sum Vầy (6-8 người)', 'Set Sum Vầy (6-8 người)', '800000.00', '2025-03-19 02:40:37', '2025-03-19 02:40:37', 9, 'set-sum-vay-6-8-nguoi-1742352037.jpeg', 'set-sum-vay-6-8-nguoi', 0, NULL),
(76, 1, 'Bí Đỏ Chiên Giòn', 'Bí Đỏ Chiên Giòn', '75000.00', '2025-03-19 02:40:37', '2025-03-19 02:40:37', 10, 'bi-do-chien-gion-1742352037.jpeg', 'bi-do-chien-gion', 0, NULL),
(77, 1, 'Gỏi Má Heo nướng Ngó Sen', 'Gỏi Má Heo nướng Ngó Sen', '145000.00', '2025-03-19 02:40:38', '2025-03-19 02:40:38', 10, 'goi-ma-heo-nuong-ngo-sen-1742352038.jpeg', 'goi-ma-heo-nuong-ngo-sen', 0, NULL),
(78, 1, 'Lạp Bò với Tuỷ Bò nướng xúc Bánh Đa', 'Lạp Bò với Tuỷ Bò nướng xúc Bánh Đa', '135000.00', '2025-03-19 02:40:40', '2025-03-19 02:40:40', 10, 'lap-bo-voi-tuy-bo-nuong-xuc-banh-da-1742352040.jpeg', 'lap-bo-voi-tuy-bo-nuong-xuc-banh-da', 0, NULL),
(79, 1, 'Gà chiên giòn ăn kèm Gỏi Xoài chua ngọt', 'Gà chiên giòn ăn kèm Gỏi Xoài chua ngọt', '155000.00', '2025-03-19 02:40:41', '2025-03-19 02:40:41', 10, 'ga-chien-gion-an-kem-goi-xoai-chua-ngot-1742352041.jpeg', 'ga-chien-gion-an-kem-goi-xoai-chua-ngot', 0, NULL),
(80, 1, 'Soup Tomyum Thịt bằm', 'Soup Tomyum Thịt bằm', '120000.00', '2025-03-19 02:40:42', '2025-03-19 02:40:42', 10, 'soup-tomyum-thit-bam-1742352042.jpeg', 'soup-tomyum-thit-bam', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food_categories`
--

CREATE TABLE `food_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `food_categories`
--

INSERT INTO `food_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Salads, Rau & Món Phụ', 'Salads, Rau & Món Phụ', '2025-03-10 01:06:09', '2025-03-19 02:08:30'),
(2, ' Khai vị', '\nKhai vị', '2025-03-19 02:08:40', '2025-03-19 02:08:40'),
(3, 'Súp', 'Súp', '2025-03-19 02:08:51', '2025-03-19 02:08:51'),
(4, 'Món chính', 'Món chính', '2025-03-19 02:08:59', '2025-03-19 02:08:59'),
(5, 'Mì & Cơm', 'Mì & Cơm', '2025-03-19 02:09:10', '2025-03-19 02:09:10'),
(6, 'Cà Ri', 'Cà Ri', '2025-03-19 02:09:15', '2025-03-19 02:09:15'),
(7, 'Tráng miệng', 'Tráng miệng', '2025-03-19 02:09:25', '2025-03-19 02:09:25'),
(8, 'Cơm Trưa', 'Cơm Trưa', '2025-03-19 02:09:29', '2025-03-19 02:09:29'),
(9, 'Lẩu Thái', 'Lẩu Thái', '2025-03-19 02:09:36', '2025-03-19 02:09:36'),
(10, 'Menu Mùa Thu', 'Menu Mùa Thu', '2025-03-19 02:09:41', '2025-03-19 02:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity_in_stock` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `minimum_threshold` decimal(8,2) DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `image`, `quantity_in_stock`, `created_at`, `updated_at`, `minimum_threshold`, `unit`, `restaurant_id`) VALUES
(1, 'Bột tỏi', '01JPKPW1XFTPPNHS8G1XZE3W21.png', '20000.00', '2025-03-16 13:16:42', '2025-03-18 04:06:00', '100.00', 'gram', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `invoice_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` bigint UNSIGNED NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_code`, `restaurant_id`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 'INV-67D9229572BF8', 1, '1000000.00', '2025-02-26 07:36:59', '2025-03-18 07:36:59'),
(2, 'INV-67D9306648806', 2, '123123123.00', '2025-03-18 08:35:54', '2025-03-18 08:35:54'),
(3, 'INV-67D9308D1AD3F', 1, '123123.00', '2025-03-18 08:36:34', '2025-03-18 08:36:34');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_10_045113_create_permission_tables', 2),
(5, '2025_03_10_071927_create_ingredients_table', 3),
(6, '2025_03_10_071931_create_orders_table', 4),
(7, '2025_03_10_071934_create_order_items_table', 4),
(8, '2025_03_10_071936_create_promotions_table', 4),
(9, '2025_03_10_071943_create_restaurants_table', 5),
(10, '2025_03_10_071945_create_tables_table', 5),
(11, '2025_03_10_073539_create_food_categories_table', 6),
(12, '2025_03_10_073553_create_post_categories_table', 6),
(13, '2025_03_10_073556_create_posts_table', 6),
(14, '2025_03_10_074027_add_food_category_id_to_dishes_table', 6),
(15, '2025_03_10_081029_add_image_to_dishes_table', 7),
(16, 'a2025_03_10_081135_add_slug_and_sold_quantity_to_dishes_table', 8),
(17, '2025_03_12_175816_add_banner_and_slug_to_promotions_table', 9),
(18, '2025_03_12_180553_add_columns_to_ingredients_table', 10),
(19, '2025_03_12_181137_add_reservation_code_to_reservations_table', 11),
(20, '2025_03_12_181841_add_payment_status_to_orders_table', 12),
(21, '2025_03_12_182130_add_address_to_users_table', 13),
(22, '2025_03_12_182213_add_order_code_to_orders_table', 14),
(23, '2025_03_12_184419_add_notes_to_orders_table', 15),
(24, '2025_03_12_205620_add_column_to_reservations_table', 16),
(25, '2025_03_12_210147_add_columns_to_reservations_table', 17),
(26, '2025_03_12_210600_add_columns_to_restaurants_table', 18),
(27, '2025_03_14_184136_add_loyalty_points_to_users_table', 19),
(28, '2025_03_14_190852_add_restaurant_id_to_dishes_table', 20),
(29, '2025_03_14_202943_create_contacts_table', 20),
(30, '2025_03_15_104309_add_reservation_id_to_tables_table', 21),
(31, '2025_03_16_193606_add_short_description_to_restaurants_table', 22),
(32, '2025_03_16_194909_create_recipes_table', 23),
(33, '2025_03_16_204145_add_status_to_dishes_table', 24),
(34, '2025_03_17_094501_add_themes_settings_to_users_table', 25),
(35, '2025_03_17_200419_add_is_locked_to_users_table', 26),
(36, '2025_03_18_104024_create_table_dishes_table', 27),
(37, '2025_03_18_142451_create_invoices_table', 28);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status` enum('pending','confirmed','preparing','shipping','completed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `total_amount`, `payment_method`, `created_at`, `updated_at`, `payment_status`, `address`, `name`, `phone`, `email`, `order_code`, `notes`) VALUES
(1, 1, 'confirmed', '1200000.00', 'cod', '2025-03-12 11:34:44', '2025-03-12 11:34:44', 'unpaid', 'z', 'a', 'a', '2@2', 'ORDER_67D171544CA4E', NULL),
(2, 1, 'canceled', '1200000.00', 'cod', '2025-03-12 11:34:57', '2025-03-17 11:45:24', 'unpaid', 'z', 'a', 'a', '2@2', 'ORDER_67D17161B6FFA', NULL),
(3, 1, 'canceled', '1200000.00', 'cod', '2025-03-12 11:35:29', '2025-03-17 11:45:36', 'unpaid', '123', '123', '123', '123@2', 'ORDER_67D17181E8D14', NULL),
(4, 1, 'canceled', '1200000.00', 'cod', '2025-03-12 11:35:32', '2025-03-17 11:46:29', 'unpaid', '123', '123', '123', '123@2', 'ORDER_67D171846C01F', NULL),
(5, 1, 'pending', '0.00', 'cod', '2025-03-12 11:36:05', '2025-03-12 11:36:05', 'unpaid', 'a', 'a', 'a', 'a@2', 'ORDER_67D171A59CF85', NULL),
(6, 1, 'canceled', '100000.00', 'bank', '2025-03-12 11:47:47', '2025-03-17 11:46:43', 'unpaid', '123', '123', '123', '123', 'ORDER_67D17463082DC', NULL),
(7, 1, 'canceled', '0.00', NULL, '2025-03-12 11:55:30', '2025-03-17 11:47:09', 'unpaid', NULL, NULL, NULL, NULL, 'ORDER_67D17632DB3B1', NULL),
(8, 1, 'pending', '0.00', NULL, '2025-03-12 11:56:45', '2025-03-12 11:56:45', 'unpaid', NULL, NULL, NULL, NULL, 'ORDER_67D1767D0E328', NULL),
(9, 1, 'pending', '1200000.00', NULL, '2025-03-12 11:57:40', '2025-03-12 11:57:40', 'unpaid', NULL, NULL, NULL, NULL, 'ORDER_67D176B4AB117', NULL),
(10, 1, 'pending', '200000.00', 'bank', '2025-03-12 12:07:43', '2025-03-12 12:16:49', 'paid', '234', '234', '234', '234', 'ORDER_67D1790F3D639', NULL),
(11, 1, 'pending', '300000.00', 'bank', '2025-03-14 11:48:00', '2025-03-14 11:48:59', 'failed', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D4177076E5B', NULL),
(12, 1, 'pending', '100000.00', 'bank', '2025-03-14 11:50:17', '2025-03-14 11:50:37', 'failed', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D417F97A38C', NULL),
(13, 1, 'pending', '100000.00', 'bank', '2025-03-14 11:53:15', '2025-03-14 11:53:22', 'failed', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D418AB1D56A', NULL),
(14, 1, 'pending', '100000.00', 'cod', '2025-03-14 11:57:11', '2025-03-14 11:57:11', 'unpaid', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D4199761E5B', NULL),
(15, 1, 'pending', '100000.00', 'cod', '2025-03-14 11:57:13', '2025-03-14 11:57:13', 'unpaid', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D41999B012F', NULL),
(16, 1, 'canceled', '100000.00', 'cod', '2025-03-14 11:57:35', '2025-03-17 11:49:44', 'unpaid', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D419AF7242A', NULL),
(17, 1, 'canceled', '100000.00', 'bank', '2025-03-14 12:00:15', '2025-03-17 11:49:52', 'unpaid', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D41A4FF0437', NULL),
(18, 1, 'canceled', '100000.00', 'cod', '2025-03-14 12:00:30', '2025-03-17 11:49:30', 'paid', '123', 'admin@gmail.com', '123', 'admin@gmail.com', 'ORDER_67D41A5E46F77', NULL),
(19, 1, 'canceled', '400000.00', 'bank', '2025-03-16 13:50:16', '2025-03-17 11:49:21', 'failed', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67D6D718122C7', NULL),
(20, 1, 'canceled', '1600000.00', 'cod', '2025-03-17 02:40:03', '2025-03-17 11:49:23', 'paid', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'admin@gmail.com', 'ORDER_67D78B8307AEE', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `dish_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(2, 'view_any_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(3, 'create_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(4, 'update_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(5, 'delete_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(6, 'delete_any_role', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(7, 'view_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(8, 'view_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(9, 'create_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(10, 'update_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(11, 'restore_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(12, 'restore_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(13, 'replicate_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(14, 'reorder_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(15, 'delete_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(16, 'delete_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(17, 'force_delete_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(18, 'force_delete_any_user', 'web', '2025-03-09 21:56:56', '2025-03-09 21:56:56'),
(19, 'view_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(20, 'view_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(21, 'create_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(22, 'update_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(23, 'restore_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(24, 'restore_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(25, 'replicate_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(26, 'reorder_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(27, 'delete_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(28, 'delete_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(29, 'force_delete_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(30, 'force_delete_any_dish', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(31, 'view_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(32, 'view_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(33, 'create_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(34, 'update_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(35, 'restore_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(36, 'restore_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(37, 'replicate_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(38, 'reorder_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(39, 'delete_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(40, 'delete_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(41, 'force_delete_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(42, 'force_delete_any_ingredient', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(43, 'view_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(44, 'view_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(45, 'create_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(46, 'update_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(47, 'restore_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(48, 'restore_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(49, 'replicate_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(50, 'reorder_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(51, 'delete_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(52, 'delete_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(53, 'force_delete_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(54, 'force_delete_any_invoice', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(55, 'view_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(56, 'view_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(57, 'create_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(58, 'update_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(59, 'restore_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(60, 'restore_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(61, 'replicate_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(62, 'reorder_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(63, 'delete_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(64, 'delete_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(65, 'force_delete_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(66, 'force_delete_any_order', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(67, 'view_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(68, 'view_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(69, 'create_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(70, 'update_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(71, 'restore_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(72, 'restore_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(73, 'replicate_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(74, 'reorder_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(75, 'delete_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(76, 'delete_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(77, 'force_delete_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(78, 'force_delete_any_order::item', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(79, 'view_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(80, 'view_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(81, 'create_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(82, 'update_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(83, 'restore_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(84, 'restore_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(85, 'replicate_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(86, 'reorder_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(87, 'delete_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(88, 'delete_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(89, 'force_delete_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(90, 'force_delete_any_promotion', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(91, 'view_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(92, 'view_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(93, 'create_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(94, 'update_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(95, 'restore_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(96, 'restore_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(97, 'replicate_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(98, 'reorder_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(99, 'delete_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(100, 'delete_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(101, 'force_delete_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(102, 'force_delete_any_reservation', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(103, 'view_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(104, 'view_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(105, 'create_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(106, 'update_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(107, 'restore_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(108, 'restore_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(109, 'replicate_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(110, 'reorder_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(111, 'delete_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(112, 'delete_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(113, 'force_delete_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(114, 'force_delete_any_restaurant', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(115, 'view_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(116, 'view_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(117, 'create_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(118, 'update_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(119, 'restore_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(120, 'restore_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(121, 'replicate_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(122, 'reorder_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(123, 'delete_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(124, 'delete_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(125, 'force_delete_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(126, 'force_delete_any_table', 'web', '2025-03-10 00:31:24', '2025-03-10 00:31:24'),
(127, 'view_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(128, 'view_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(129, 'create_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(130, 'update_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(131, 'restore_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(132, 'restore_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(133, 'replicate_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(134, 'reorder_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(135, 'delete_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(136, 'delete_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(137, 'force_delete_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(138, 'force_delete_any_food::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(139, 'view_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(140, 'view_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(141, 'create_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(142, 'update_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(143, 'restore_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(144, 'restore_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(145, 'replicate_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(146, 'reorder_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(147, 'delete_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(148, 'delete_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(149, 'force_delete_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(150, 'force_delete_any_post', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(151, 'view_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(152, 'view_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(153, 'create_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(154, 'update_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(155, 'restore_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(156, 'restore_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(157, 'replicate_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(158, 'reorder_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(159, 'delete_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(160, 'delete_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(161, 'force_delete_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(162, 'force_delete_any_post::category', 'web', '2025-03-11 03:43:19', '2025-03-11 03:43:19'),
(163, 'view_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(164, 'view_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(165, 'create_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(166, 'update_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(167, 'restore_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(168, 'restore_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(169, 'replicate_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(170, 'reorder_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(171, 'delete_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(172, 'delete_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(173, 'force_delete_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(174, 'force_delete_any_contact', 'web', '2025-03-16 13:09:51', '2025-03-16 13:09:51'),
(175, 'page_Themes', 'web', '2025-03-18 03:47:32', '2025-03-18 03:47:32'),
(176, 'view_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(177, 'view_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(178, 'create_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(179, 'update_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(180, 'restore_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(181, 'restore_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(182, 'replicate_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(183, 'reorder_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(184, 'delete_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(185, 'delete_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(186, 'force_delete_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27'),
(187, 'force_delete_any_table::dish', 'web', '2025-03-18 07:27:27', '2025-03-18 07:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`id`, `title`, `description`, `start_date`, `end_date`, `created_at`, `updated_at`, `banner`, `slug`) VALUES
(1, 'Giảm 10% Tất Cả Menu Từ T2-CN', '<p>&nbsp;</p><h2>Điều kiện áp dụng</h2><p><strong>1. Ưu đãi:</strong></p><p><strong>- Giảm 10% Tất cả Menu </strong>cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần <strong>T2-CN</strong>. <strong>Áp dụng</strong> <strong>hết ngày 30/06/2025.</strong></p><p><strong>2. Quy định về ưu đãi: Có, cụ thể như sau:</strong></p><p>- Không áp dụng Ưu đãi vào ngày lễ tết: <strong>Tháng 1</strong> ( Ngày 1); <strong>Tháng 2</strong> (Từ ngày 2-7 &amp; ngày 14);<strong> Tháng 3</strong> (Ngày 8); <strong>Tháng 4</strong> (Ngày 30); Tháng 5 (Ngày 1); <strong>Tháng 9</strong> (Ngày 2,3,4,10); <strong>Tháng 10</strong> (Ngày 19, 20); <strong>Tết Nguyên Đán</strong> &amp; 10/3; 15/8 Âm Lịch</p><p><strong>3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.</strong></p><p><strong>4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận</strong></p><p><strong>5. Quy định về đặt cọc:</strong></p><p>- Đoàn khách từ <strong>20 người lớn</strong> <strong>hoặc đặt món</strong> trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.</p><p><strong>6. Khác</strong></p><p>- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.</p><p>- Thời gian nhà hàng giữ chỗ tối đa: <strong>15 phút.</strong></p><p>- Nhà hàng quy định <strong>Không mang thức ăn </strong>và <strong>Tính phí khi mang thức uống</strong> từ ngoài vào.&nbsp;</p><p>Áp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".&nbsp;</p>', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-19 02:47:54', '01JPP4SR0VYC97BTMG0TMBYTYN.png', '1'),
(2, 'Giảm 10% Tất Cả Menu Từ T2-CN', '<p>&nbsp;</p><h2>Điều kiện áp dụng</h2><p><strong>1. Ưu đãi:</strong></p><p><strong>- Giảm 10% Tất cả Menu </strong>cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần <strong>T2-CN</strong>. <strong>Áp dụng</strong> <strong>hết ngày 30/06/2025.</strong></p><p><strong>2. Quy định về ưu đãi: Có, cụ thể như sau:</strong></p><p>- Không áp dụng Ưu đãi vào ngày lễ tết: <strong>Tháng 1</strong> ( Ngày 1); <strong>Tháng 2</strong> (Từ ngày 2-7 &amp; ngày 14);<strong> Tháng 3</strong> (Ngày 8); <strong>Tháng 4</strong> (Ngày 30); Tháng 5 (Ngày 1); <strong>Tháng 9</strong> (Ngày 2,3,4,10); <strong>Tháng 10</strong> (Ngày 19, 20); <strong>Tết Nguyên Đán</strong> &amp; 10/3; 15/8 Âm Lịch</p><p><strong>3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.</strong></p><p><strong>4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận</strong></p><p><strong>5. Quy định về đặt cọc:</strong></p><p>- Đoàn khách từ <strong>20 người lớn</strong> <strong>hoặc đặt món</strong> trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.</p><p><strong>6. Khác</strong></p><p>- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.</p><p>- Thời gian nhà hàng giữ chỗ tối đa: <strong>15 phút.</strong></p><p>- Nhà hàng quy định <strong>Không mang thức ăn </strong>và <strong>Tính phí khi mang thức uống</strong> từ ngoài vào.&nbsp;</p><p>Áp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".&nbsp;</p>', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-19 02:48:11', '01JPP4T9835Q0E3T0M2KHKXRR3.png', '12'),
(3, 'Giảm 10% Tất Cả Menu Từ T2-CN', 'Điều kiện áp dụng\r\n1. Ưu đãi:\r\n\r\n- Giảm 10% Tất cả Menu cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần T2-CN. Áp dụng hết ngày 30/06/2025.\r\n\r\n2. Quy định về ưu đãi: Có, cụ thể như sau:\r\n\r\n- Không áp dụng Ưu đãi vào ngày lễ tết: Tháng 1 ( Ngày 1); Tháng 2 (Từ ngày 2-7 & ngày 14); Tháng 3 (Ngày 8); Tháng 4 (Ngày 30); Tháng 5 (Ngày 1); Tháng 9 (Ngày 2,3,4,10); Tháng 10 (Ngày 19, 20); Tết Nguyên Đán & 10/3; 15/8 Âm Lịch\r\n\r\n3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.\r\n\r\n4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận\r\n\r\n5. Quy định về đặt cọc:\r\n\r\n- Đoàn khách từ 20 người lớn hoặc đặt món trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.\r\n\r\n6. Khác\r\n\r\n- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.\r\n\r\n- Thời gian nhà hàng giữ chỗ tối đa: 15 phút.\r\n\r\n- Nhà hàng quy định Không mang thức ăn và Tính phí khi mang thức uống từ ngoài vào. \r\n\r\nÁp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-19 02:48:21', '01JPP4TK5BMAHTT60S3HAM1SSR.png', '123'),
(4, 'Giảm 10% Tất Cả Menu Từ T2-CN', 'Điều kiện áp dụng\r\n1. Ưu đãi:\r\n\r\n- Giảm 10% Tất cả Menu cho khách hàng: Sử dụng dịch vụ tại nhà hàng vào các ngày trong tuần T2-CN. Áp dụng hết ngày 30/06/2025.\r\n\r\n2. Quy định về ưu đãi: Có, cụ thể như sau:\r\n\r\n- Không áp dụng Ưu đãi vào ngày lễ tết: Tháng 1 ( Ngày 1); Tháng 2 (Từ ngày 2-7 & ngày 14); Tháng 3 (Ngày 8); Tháng 4 (Ngày 30); Tháng 5 (Ngày 1); Tháng 9 (Ngày 2,3,4,10); Tháng 10 (Ngày 19, 20); Tết Nguyên Đán & 10/3; 15/8 Âm Lịch\r\n\r\n3. Nhà hàng không tính VAT và chỉ xuất hóa đơn trực tiếp.\r\n\r\n4. Địa chỉ sử dụng: Tám Riêu - 235 Đường Phan Xích Long, P. 2, Q. Phú Nhuận\r\n\r\n5. Quy định về đặt cọc:\r\n\r\n- Đoàn khách từ 20 người lớn hoặc đặt món trở lên đặt cọc, vui lòng đặt cọc trước 30% giá trị hóa đơn tạm tính với nhà hàng.\r\n\r\n6. Khác\r\n\r\n- Quý khách cần đặt chỗ trước tối thiểu 30 phút để được hỗ trợ tốt nhất.\r\n\r\n- Thời gian nhà hàng giữ chỗ tối đa: 15 phút.\r\n\r\n- Nhà hàng quy định Không mang thức ăn và Tính phí khi mang thức uống từ ngoài vào. \r\n\r\nÁp dụng từ \"01/04/2024 - 00:00\" đến hết \"30/06/2025 - 23:59\".', '2025-03-12 19:25:48', '2025-03-13 19:25:51', '2025-03-12 12:25:55', '2025-03-12 12:25:55', '01JP5533NZPF5JETB29YPD261A.png', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` bigint UNSIGNED NOT NULL,
  `ingredient_id` bigint UNSIGNED NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `number_of_people` int NOT NULL,
  `reservation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','confirmed','canceled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reservation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reservation_day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `user_id`, `restaurant_id`, `number_of_people`, `reservation_time`, `status`, `created_at`, `updated_at`, `reservation_code`, `notes`, `name`, `phone`, `reservation_day`) VALUES
(9, 1, 1, 1, '19:00:00', 'confirmed', '2025-03-17 10:52:33', '2025-03-18 03:36:31', 'RESERVATION_67D8018839DEA', '123', 'admin', '0999999999', '2025-03-20'),
(10, 1, 1, 1, '18:03:00', 'canceled', '2025-03-17 11:03:36', '2025-03-17 12:39:00', 'RESERVATION_67D8018839DEE', '23', 'admin@gmail.com', '0999999999', '2025-03-17'),
(11, 1, 1, 1, '18:07', 'canceled', '2025-03-17 11:07:41', '2025-03-17 12:38:48', 'RESERVATION_67D8027D45909', '123', 'admin@gmail.com1132', 'admin@gmail.com123', '2025-03-17'),
(12, 1, 1, 1, '18:08', 'canceled', '2025-03-17 11:08:31', '2025-03-17 12:39:18', 'RESERVATION_67D802AFB99DB', NULL, 'admin@gmail.com', 'admin@gmail.com', '2025-03-17'),
(13, 1, 1, 1, '20:03', 'pending', '2025-03-17 13:03:21', '2025-03-17 13:03:21', 'RESERVATION_67D81D9985752', NULL, 'admin@gmail.com', 'admin@gmail.com', '2025-03-17'),
(14, 1, 1, 1, '10:12', 'pending', '2025-03-18 03:12:40', '2025-03-18 03:12:40', 'RESERVATION_67D8E4A855DAD', NULL, 'admin@gmail.com', 'admin@gmail.com', '2025-03-18');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `short_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `map` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `image`, `location`, `description`, `short_description`, `created_at`, `updated_at`, `map`, `phone`, `email`) VALUES
(1, 'ME ME HAI BÀ TRƯNG', '01JPP4MQBSQNCW5CZ0CSH0NEBY.png', '51A MAI HẮC ĐẾ', '<p><strong>Giới thiệu về IZAKAYA UNATOTO</strong></p><p>Chào mừng bạn đến với <strong>IZAKAYA UNATOTO</strong>, một trong những điểm đến ẩm thực nổi bật nhất dành cho những tín đồ yêu thích <strong>ẩm thực Nhật Bản</strong>. Tại đây, món <strong>lươn nướng</strong> không chỉ đơn thuần là một món ăn, mà còn là một biểu tượng của <strong>dinh dưỡng và sự tinh tế</strong> trong ẩm thực.</p><p>Với không gian <strong>ấm cúng</strong> và thiết kế mang đậm văn hóa Nhật Bản, IZAKAYA UNATOTO tạo ra một bầu không khí thân thiện, nơi thực khách có thể thư giãn và thưởng thức những món ăn tuyệt vời. Mỗi món lươn được chế biến từ những nguyên liệu tươi ngon nhất, mang đến hương vị đậm đà và hấp dẫn.</p><p>Điều đặc biệt tại IZAKAYA UNATOTO là sự kết hợp giữa <strong>truyền thống và sáng tạo</strong>. Đội ngũ đầu bếp tài năng của chúng tôi không ngừng nỗ lực để mang đến những món ăn không chỉ ngon mà còn đẹp mắt, tạo nên những trải nghiệm ẩm thực khó quên.</p><p>Hãy đến với IZAKAYA UNATOTO để cùng khám phá <strong>hương vị độc đáo</strong> và tận hưởng sự phục vụ tận tình từ đội ngũ nhân viên chuyên nghiệp. Chúng tôi tin rằng mỗi bữa ăn tại đây sẽ là một hành trình ẩm thực đáng nhớ, làm hài lòng cả những thực khách khó tính nhất!</p>', 'Chào mừng bạn đến với IZAKAYA UNATOTO, một trong những điểm đến ẩm thực nổi bật nhất dành cho những tín đồ yêu thích ẩm thực Nhật Bản. Tại đây, món lươn nướng không chỉ đơn thuần là một món ăn, mà còn là một biểu tượng của dinh dưỡng và sự tinh tế trong ẩm thực.', '2025-03-10 01:07:59', '2025-03-19 02:45:09', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d95865.71390934997!2d106.52494024335938!3d10.768954500000017!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f52d2e999fb%3A0x2c2739f3ca688d63!2sIzakaya%20Unatoto%20Ba%20Th%C3%A1ng%20Hai!5e1!3m2!1svi!2s!4v1741958363480!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '02839369986', 'a@a'),
(2, '​ME ME CẦU GIẤY', '01JPP4PFKHN2RWC5ESGV3P65D3.png', ' 34T HOÀNG ĐẠO THUÝ', NULL, NULL, '2025-03-18 08:35:42', '2025-03-19 02:46:07', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2487.9230920214663!2d105.80031227296512!3d21.008264488486606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ad611f5ebc87%3A0x3ed01a9b830aa8f!2sMe%20Me%20Bistro!5e1!3m2!1svi!2s!4v1742352363454!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', '02839369986', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2025-03-09 21:56:43', '2025-03-16 13:26:46'),
(3, 'Bếp trưởng', 'web', '2025-03-15 03:55:44', '2025-03-15 03:55:44'),
(4, 'Kế toán', 'web', '2025-03-15 03:55:54', '2025-03-15 03:55:54'),
(5, 'Nhân viên thu ngân', 'web', '2025-03-15 03:56:03', '2025-03-15 03:56:03'),
(6, 'Nhân viên phục vụ', 'web', '2025-03-15 03:56:16', '2025-03-15 03:56:16'),
(7, 'Nhân viên bếp', 'web', '2025-03-15 03:56:23', '2025-03-15 03:56:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 1),
(135, 1),
(136, 1),
(137, 1),
(138, 1),
(163, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('svjPjjiveByaKMOYKykwmDen0bVYYpxlvoe3At5U', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36 OPR/117.0.0.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTWtDMldURXBaU1lZNjQ3Z0tCR2VDSFJvd1Q1alI3dGZKWXkzZ1RtVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaG9wIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiRhaVM5dU55a3pOVmI3bFF1QjhKdEkueERmMjdxODFqeEh4UUhnZ1JIbjRkMmdDZUpDWXlKcSI7czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1742352516);

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint UNSIGNED NOT NULL,
  `restaurant_id` bigint UNSIGNED DEFAULT NULL,
  `table_number` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reservation_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `restaurant_id`, `table_number`, `status`, `reservation_id`, `created_at`, `updated_at`) VALUES
(1, 1, 123, 'available', NULL, '2025-03-15 03:54:38', '2025-03-18 03:37:12');

-- --------------------------------------------------------

--
-- Table structure for table `table_dishes`
--

CREATE TABLE `table_dishes` (
  `id` bigint UNSIGNED NOT NULL,
  `dish_id` bigint UNSIGNED NOT NULL,
  `table_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `served_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loyalty_points` int NOT NULL DEFAULT '0',
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_locked`, `phone`, `created_at`, `updated_at`, `address`, `loyalty_points`, `theme`, `theme_color`) VALUES
(1, 'admin@gmail.com', 'admin@gmail.com', NULL, '$2y$12$aiS9uNykzNVb7lQuB8JtI.xDf27q81jxHxQHggRHn4d2gCeJCYyJq', 'MTYZ6qEzq2iygAuwg1QysfpW4d03T2wrpTvSUAQjRYopVXbA8S31WNum0JGB', 0, 'admin@gmail.com', '2025-03-09 21:32:39', '2025-03-17 13:13:45', 'admin@gmail.com', 50000, 'default', NULL),
(6, 'beptruong@gmail.com', 'beptruong@gmail.com', NULL, '$2y$12$AnKMLUKYHLoinNGtE/nrtu.gTPFi3XbDCaKYv.nwHSJ3EfL3cAr1a', NULL, 0, NULL, '2025-03-16 13:25:36', '2025-03-16 13:25:46', NULL, 0, 'default', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dishes_slug_unique` (`slug`),
  ADD KEY `dishes_food_category_id_foreign` (`food_category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food_categories`
--
ALTER TABLE `food_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredients_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_invoice_code_unique` (`invoice_code`),
  ADD KEY `invoices_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_code_unique` (`order_code`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_dish_id_foreign` (`dish_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promotions_slug_unique` (`slug`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_dish_id_foreign` (`dish_id`),
  ADD KEY `recipes_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reservations_reservation_code_unique` (`reservation_code`),
  ADD KEY `reservations_user_id_foreign` (`user_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `table_dishes`
--
ALTER TABLE `table_dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_dishes_dish_id_foreign` (`dish_id`),
  ADD KEY `table_dishes_table_id_foreign` (`table_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food_categories`
--
ALTER TABLE `food_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `table_dishes`
--
ALTER TABLE `table_dishes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `dishes_food_category_id_foreign` FOREIGN KEY (`food_category_id`) REFERENCES `food_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_dish_id_foreign` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_dish_id_foreign` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipes_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `table_dishes`
--
ALTER TABLE `table_dishes`
  ADD CONSTRAINT `table_dishes_dish_id_foreign` FOREIGN KEY (`dish_id`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `table_dishes_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
