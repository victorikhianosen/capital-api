-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 23, 2026 at 10:44 AM
-- Server version: 8.0.45-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `corebanking`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `account_product_id` bigint UNSIGNED NOT NULL,
  `account_type_id` bigint UNSIGNED NOT NULL,
  `currency_id` bigint UNSIGNED NOT NULL,
  `account_balance` decimal(18,2) NOT NULL DEFAULT '0.00',
  `available_balance` decimal(18,2) NOT NULL DEFAULT '0.00',
  `tier` tinyint NOT NULL DEFAULT '1',
  `status` enum('pending','active','dormant','closed','blocked','restricted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `opened_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_categories`
--

CREATE TABLE `account_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_officers`
--

CREATE TABLE `account_officers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Nigeria',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_officers`
--

INSERT INTO `account_officers` (`id`, `user_id`, `branch_id`, `first_name`, `last_name`, `email`, `phone`, `code`, `address`, `city`, `state`, `country`, `created_at`, `updated_at`, `gender`) VALUES
(5, 1, 4, 'Fatima', 'Abubakar', 'fatima.abubakar@gmail.com', '07087654321', 'AO-00005', '12 Ahmadu Bello Way', 'Kaduna', 'Kaduna', 'Nigeria', '2026-03-21 08:41:16', '2026-03-21 08:41:16', NULL),
(6, 1, 4, 'Aisha Bala jo', 'Bello', 'aisha.bello@gmail.com', '08051234589', 'AO-00006', '39 Aina street, Ojudo Lagos', 'Ikeja', 'Lagos', 'Nigeria', '2026-03-21 08:41:32', '2026-03-21 22:24:58', NULL),
(7, 1, 3, 'Chinedu', 'Okafor', 'chinedu.okafor@yahoo.com', '08123456789', 'AO-00007', '15 Independence Layout', 'Enugu', 'Enugu', 'Nigeria', '2026-03-21 08:41:38', '2026-03-21 08:41:38', NULL),
(9, 1, 3, 'Chioma', 'Okafor', 'chioma.okafor23@gmail.com', '08034567891', 'AO-00009', '12 Aba Road', 'Port Harcourt', 'Rivers', 'Nigeria', '2026-03-21 09:52:51', '2026-03-21 09:52:51', 'female'),
(18, 1, 2, 'Grace', 'Carroll', 'mykubydam@mailinator.com', '12199782683', 'AO-00010', 'Eos commodi volupta', 'Sit sequi voluptatem', 'Fugit animi velit', 'Nigeria', '2026-03-21 13:01:13', '2026-03-21 13:01:13', 'male'),
(19, 1, 1, 'Victor John', 'Washington', 'zojedezoq@gmail.com', '14884161922', 'AO-00019', 'Porro qui nulla offi', 'Ikeja', 'Abuja', 'Nigeria', '2026-03-21 21:37:07', '2026-03-21 22:29:51', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `account_products`
--

CREATE TABLE `account_products` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `account_category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minimum_balance` decimal(25,2) NOT NULL DEFAULT '0.00',
  `interest_rate` decimal(15,2) DEFAULT NULL,
  `overdraft_allowed` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_trails`
--

CREATE TABLE `audit_trails` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `performed_by_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `performed_by_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auditable_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `before_change` json DEFAULT NULL,
  `after_change` json DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_trails`
--

INSERT INTO `audit_trails` (`id`, `branch_id`, `performed_by_type`, `performed_by_id`, `auditable_type`, `auditable_id`, `module`, `actions`, `before_change`, `after_change`, `description`, `ip`, `agent`, `created_at`, `updated_at`) VALUES
(1, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 08:39:43\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 08:39:43', '127.0.0.1', 'node', '2026-03-20 07:39:43', '2026-03-20 07:39:43'),
(2, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 08:47:26\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 08:47:26', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 07:47:26', '2026-03-20 07:47:26'),
(3, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 08:47:33\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 08:47:33', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 07:47:33', '2026-03-20 07:47:33'),
(4, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '5', 'Permission', 'Create', NULL, '{\"id\": 5, \"name\": \"update_settings\", \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}', 'The permission with ID 5 and name update_settings was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 07:48:22', '2026-03-20 07:48:22'),
(5, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '1', 'Role', 'Assign Permission', '[1, 2, 3, 4]', '[1, 2, 3, 5, 4]', 'Permissions assigned to role super_admin by System.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 07:49:52', '2026-03-20 07:49:52'),
(6, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Logout', '{\"login_at\": \"2026-03-20 08:47:33\"}', '{\"ip\": \"127.0.0.1\", \"logout_at\": \"2026-03-20T08:50:00.910485Z\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged out at 2026-03-20 08:50:00 (login was 2026-03-20 08:47:33)', '127.0.0.1', 'node', '2026-03-20 07:50:00', '2026-03-20 07:50:00'),
(7, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 08:50:07\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 08:50:07', '127.0.0.1', 'node', '2026-03-20 07:50:07', '2026-03-20 07:50:07'),
(8, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Logout', '{\"login_at\": \"2026-03-20 08:50:07\"}', '{\"ip\": \"127.0.0.1\", \"logout_at\": \"2026-03-20T08:56:10.334830Z\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged out at 2026-03-20 08:56:10 (login was 2026-03-20 08:50:07)', '127.0.0.1', 'node', '2026-03-20 07:56:10', '2026-03-20 07:56:10'),
(9, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 08:56:18\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 08:56:18', '127.0.0.1', 'node', '2026-03-20 07:56:18', '2026-03-20 07:56:18'),
(10, 1, 'user', '1', 'App\\Models\\Settings', '2', 'Settings', 'Update', '{\"id\": 2, \"created_at\": null, \"updated_at\": null, \"setting_key\": \"company_logo\", \"setting_group\": \"company\", \"setting_value\": \"assets/images/settings/logo.png\"}', '{\"id\": 2, \"created_at\": null, \"updated_at\": \"2026-03-20T08:57:31.000000Z\", \"setting_key\": \"company_logo\", \"setting_group\": \"company\", \"setting_value\": \"settings/Sol0UHAg7sAKJ4LkM5R4.png\"}', 'User victor updated \'company_logo\'', '127.0.0.1', 'node', '2026-03-20 07:57:31', '2026-03-20 07:57:31'),
(11, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Create', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"York\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Vanna\", \"last_login\": null, \"updated_at\": \"2026-03-20T08:58:51.000000Z\", \"updated_by\": null, \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Vanna York was created', '127.0.0.1', 'node', '2026-03-20 07:58:51', '2026-03-20 07:58:51'),
(12, 1, 'user', '1', 'App\\Models\\Settings', '2', 'Settings', 'Update', '{\"id\": 2, \"created_at\": null, \"updated_at\": \"2026-03-20T08:57:31.000000Z\", \"setting_key\": \"company_logo\", \"setting_group\": \"company\", \"setting_value\": \"settings/Sol0UHAg7sAKJ4LkM5R4.png\"}', '{\"id\": 2, \"created_at\": null, \"updated_at\": \"2026-03-20T09:01:55.000000Z\", \"setting_key\": \"company_logo\", \"setting_group\": \"company\", \"setting_value\": \"settings/k3N4sKioIYwyk9Sdnskz.png\"}', 'User victor updated \'company_logo\'', '127.0.0.1', 'node', '2026-03-20 08:01:55', '2026-03-20 08:01:55'),
(13, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"York\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Vanna\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:03:06.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Vanna York was updated', '127.0.0.1', 'node', '2026-03-20 08:03:06', '2026-03-20 08:03:06'),
(14, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"York\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Vanna\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:03:06.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Vanna York was updated', '127.0.0.1', 'node', '2026-03-20 08:03:15', '2026-03-20 08:03:15'),
(15, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"York\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Vanna\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:03:06.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Vanna York was updated', '127.0.0.1', 'node', '2026-03-20 08:09:16', '2026-03-20 08:09:16'),
(16, 1, 'user', '1', 'App\\Models\\Settings', '2', 'Settings', 'Update', '{\"id\": 2, \"created_at\": null, \"updated_at\": \"2026-03-20T09:01:55.000000Z\", \"setting_key\": \"company_logo\", \"setting_group\": \"company\", \"setting_value\": \"settings/k3N4sKioIYwyk9Sdnskz.png\"}', '{\"id\": 2, \"created_at\": null, \"updated_at\": \"2026-03-20T09:10:55.000000Z\", \"setting_key\": \"company_logo\", \"setting_group\": \"company\", \"setting_value\": \"settings/kxFCunzo5XKTEzxosw6d.png\"}', 'User victor updated \'company_logo\'', '127.0.0.1', 'node', '2026-03-20 08:10:55', '2026-03-20 08:10:55'),
(17, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Tom\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:17:14.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Tom Water was updated', '127.0.0.1', 'node', '2026-03-20 08:17:14', '2026-03-20 08:17:14'),
(18, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"active\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Tom\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:18:16.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Tom Water was updated', '127.0.0.1', 'node', '2026-03-20 08:18:16', '2026-03-20 08:18:16'),
(19, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Victor\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:21:04.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Victor Water was updated', '127.0.0.1', 'node', '2026-03-20 08:21:04', '2026-03-20 08:21:04'),
(20, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": null, \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": null, \"gender\": \"male\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Victor\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:21:04.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Victor Water was updated', '127.0.0.1', 'node', '2026-03-20 08:31:38', '2026-03-20 08:31:38'),
(21, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": \"Lagos\", \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": \"Edo\", \"gender\": \"male\", \"status\": \"pending\", \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Victor\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:31:54.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Victor Water was updated', '127.0.0.1', 'node', '2026-03-20 08:31:54', '2026-03-20 08:31:54'),
(22, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": \"Lagos\", \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": \"Edo\", \"gender\": \"male\", \"status\": \"pending\", \"address\": \"39 Aina street, Ojudo\", \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Victor\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:32:07.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Victor Water was updated', '127.0.0.1', 'node', '2026-03-20 08:32:07', '2026-03-20 08:32:07'),
(23, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Reset Password', '{\"id\": 2, \"city\": \"Lagos\", \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": \"Edo\", \"gender\": \"male\", \"status\": \"pending\", \"address\": \"39 Aina street, Ojudo\", \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Victor\", \"last_login\": null, \"updated_at\": \"2026-03-20T09:32:07.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', NULL, 'Password for vannayork was reset by victor', '127.0.0.1', 'node', '2026-03-20 08:32:11', '2026-03-20 08:32:11'),
(24, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 10:46:45\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 10:46:45', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 09:46:45', '2026-03-20 09:46:45'),
(25, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Update', NULL, '{\"id\": 2, \"city\": \"Lagos\", \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": \"Edo\", \"gender\": \"male\", \"status\": \"active\", \"address\": \"39 Aina street, Ojudo\", \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Victor\", \"last_login\": null, \"updated_at\": \"2026-03-20T11:22:07.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Victor Water was updated', '127.0.0.1', 'node', '2026-03-20 10:22:07', '2026-03-20 10:22:07'),
(26, 1, 'user', '1', 'App\\Models\\User', '2', 'User', 'Reset Password', '{\"id\": 2, \"city\": \"Lagos\", \"email\": \"rejoxulota@mailinator.com\", \"phone\": \"13788878927\", \"photo\": \"users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png\", \"state\": \"Edo\", \"gender\": \"male\", \"status\": \"active\", \"address\": \"39 Aina street, Ojudo\", \"country\": null, \"role_id\": null, \"username\": \"vannayork\", \"branch_id\": 1, \"last_name\": \"Water\", \"role_name\": \"supervisor\", \"created_at\": \"2026-03-20T08:58:51.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Victor\", \"last_login\": null, \"updated_at\": \"2026-03-20T11:22:07.000000Z\", \"updated_by\": \"victor\", \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', NULL, 'Password for vannayork was reset by victor', '127.0.0.1', 'node', '2026-03-20 10:22:11', '2026-03-20 10:22:11'),
(27, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Logout', '{\"login_at\": \"2026-03-20 10:46:45\"}', '{\"ip\": \"127.0.0.1\", \"logout_at\": \"2026-03-20T12:28:56.508589Z\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged out at 2026-03-20 12:28:56 (login was 2026-03-20 10:46:45)', '127.0.0.1', 'node', '2026-03-20 11:28:56', '2026-03-20 11:28:56'),
(28, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 12:29:10\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 12:29:10', '127.0.0.1', 'node', '2026-03-20 11:29:10', '2026-03-20 11:29:10'),
(29, 1, 'user', '1', 'App\\Models\\User', '3', 'User', 'Create', NULL, '{\"id\": 3, \"city\": null, \"email\": \"reloc@mailinator.com\", \"phone\": \"14085651063\", \"photo\": \"users/photos/1T65lSnDMp3pGNofJcYO21ybEF6YSV98WHWLNqHP.png\", \"state\": null, \"gender\": \"female\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"umaelliott\", \"branch_id\": 1, \"last_name\": \"Elliott\", \"role_name\": \"admin\", \"created_at\": \"2026-03-20T12:30:30.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Uma\", \"last_login\": null, \"updated_at\": \"2026-03-20T12:30:30.000000Z\", \"updated_by\": null, \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Uma Elliott was created', '127.0.0.1', 'node', '2026-03-20 11:30:30', '2026-03-20 11:30:30'),
(30, 1, 'user', '1', 'App\\Models\\User', '3', 'User', 'Update Status', '{\"id\": 3, \"city\": null, \"email\": \"reloc@mailinator.com\", \"phone\": \"14085651063\", \"photo\": \"users/photos/1T65lSnDMp3pGNofJcYO21ybEF6YSV98WHWLNqHP.png\", \"state\": null, \"gender\": \"female\", \"status\": \"pending\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"umaelliott\", \"branch_id\": 1, \"last_name\": \"Elliott\", \"role_name\": \"admin\", \"created_at\": \"2026-03-20T12:30:30.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Uma\", \"last_login\": null, \"updated_at\": \"2026-03-20T12:30:30.000000Z\", \"updated_by\": null, \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', '{\"id\": 3, \"city\": null, \"email\": \"reloc@mailinator.com\", \"phone\": \"14085651063\", \"photo\": \"users/photos/1T65lSnDMp3pGNofJcYO21ybEF6YSV98WHWLNqHP.png\", \"state\": null, \"gender\": \"female\", \"status\": \"active\", \"address\": null, \"country\": null, \"role_id\": null, \"username\": \"umaelliott\", \"branch_id\": 1, \"last_name\": \"Elliott\", \"role_name\": \"admin\", \"created_at\": \"2026-03-20T12:30:30.000000Z\", \"created_by\": \"victor\", \"first_name\": \"Uma\", \"last_login\": null, \"updated_at\": \"2026-03-20T12:30:47.000000Z\", \"updated_by\": null, \"middle_name\": null, \"google2fa_secret\": null, \"email_verified_at\": null, \"two_factor_enabled\": 0, \"two_factor_confirmed_at\": null}', 'User Uma Elliott (umaelliott) status updated to active by victor', '127.0.0.1', 'node', '2026-03-20 11:30:47', '2026-03-20 11:30:47'),
(31, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 14:32:57\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 14:32:57', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 13:32:57', '2026-03-20 13:32:57'),
(32, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '2', 'Role', 'Update', '{\"id\": 2, \"name\": \"admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', '{\"id\": 2, \"name\": \"it_officer\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T14:33:15.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', 'Role it_officer was updated by username victor with ID 1', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 13:33:15', '2026-03-20 13:33:15'),
(33, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '2', 'Role', 'Update', '{\"id\": 2, \"name\": \"it_officer\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T14:33:15.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', '{\"id\": 2, \"name\": \"it_officer\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T14:33:15.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', 'Role it_officer was updated by username victor with ID 1', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 13:33:37', '2026-03-20 13:33:37'),
(34, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '2', 'Role', 'Update', '{\"id\": 2, \"name\": \"it_officer\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T14:33:15.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', '{\"id\": 2, \"name\": \"admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T14:33:49.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', 'Role admin was updated by username victor with ID 1', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 13:33:49', '2026-03-20 13:33:49'),
(35, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '2', 'Role', 'Update', '{\"id\": 2, \"name\": \"admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T14:33:49.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', '{\"id\": 2, \"name\": \"admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T14:33:49.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 2, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', 'Role admin updated by  (ID: 1)', '127.0.0.1', 'node', '2026-03-20 14:03:10', '2026-03-20 14:03:10'),
(36, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '3', 'Role', 'Update', '{\"id\": 3, \"name\": \"supervisor\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 3, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 3, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', '{\"id\": 3, \"name\": \"supervisor\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 3, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 3, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 3, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 3, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}]}', 'Role supervisor updated by  (ID: 1)', '127.0.0.1', 'node', '2026-03-20 14:03:33', '2026-03-20 14:03:33'),
(37, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '1', 'Role', 'Update', '{\"id\": 1, \"name\": \"super_admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', '{\"id\": 1, \"name\": \"super_admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', 'Role super_admin updated by  (ID: 1)', '127.0.0.1', 'node', '2026-03-20 14:04:00', '2026-03-20 14:04:00'),
(38, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '1', 'Role', 'Update', '{\"id\": 1, \"name\": \"super_admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', '{\"id\": 1, \"name\": \"main\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T15:05:53.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', 'Role main updated by  (ID: 1)', '127.0.0.1', 'node', '2026-03-20 14:05:53', '2026-03-20 14:05:53'),
(39, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '1', 'Role', 'Update', '{\"id\": 1, \"name\": \"main\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T15:05:53.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', '{\"id\": 1, \"name\": \"super_admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T15:06:11.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', 'Role super_admin updated by  (ID: 1)', '127.0.0.1', 'node', '2026-03-20 14:06:11', '2026-03-20 14:06:11'),
(40, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '1', 'Role', 'Update', '{\"id\": 1, \"name\": \"super_admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T15:06:11.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', '{\"id\": 1, \"name\": \"super_admin\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T15:06:11.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 1, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 1, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', 'Role super_admin updated by  (ID: 1)', '127.0.0.1', 'node', '2026-03-20 14:38:50', '2026-03-20 14:38:50'),
(41, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 16:19:23\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 16:19:23', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 15:19:23', '2026-03-20 15:19:23'),
(42, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '4', 'Role', 'Create', NULL, '{\"id\": 4, \"name\": \"it_officer\", \"created_at\": \"2026-03-20T16:20:09.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T16:20:09.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 4, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 4, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 4, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 4, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 4, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', 'The role it_officer with 5 permissions was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 15:20:09', '2026-03-20 15:20:09'),
(43, 1, 'user', '1', 'Spatie\\Permission\\Models\\Role', '5', 'Role', 'Create', NULL, '{\"id\": 5, \"name\": \"it_officers\", \"created_at\": \"2026-03-20T16:38:17.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T16:38:17.000000Z\", \"permissions\": [{\"id\": 1, \"name\": \"create_account\", \"pivot\": {\"role_id\": 5, \"permission_id\": 1}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 2, \"name\": \"delete_account\", \"pivot\": {\"role_id\": 5, \"permission_id\": 2}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 3, \"name\": \"edit_account\", \"pivot\": {\"role_id\": 5, \"permission_id\": 3}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 4, \"name\": \"upgrade_account\", \"pivot\": {\"role_id\": 5, \"permission_id\": 4}, \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}, {\"id\": 5, \"name\": \"update_settings\", \"pivot\": {\"role_id\": 5, \"permission_id\": 5}, \"created_at\": \"2026-03-20T08:48:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:48:22.000000Z\"}]}', 'The role it_officers with 5 permissions was created by victor.', '127.0.0.1', 'node', '2026-03-20 15:38:17', '2026-03-20 15:38:17'),
(44, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 16:46:30\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 16:46:30', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 15:46:30', '2026-03-20 15:46:30'),
(45, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Logout', '{\"login_at\": \"2026-03-20 16:46:30\"}', '{\"ip\": \"127.0.0.1\", \"logout_at\": \"2026-03-20T17:11:32.516235Z\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged out at 2026-03-20 17:11:32 (login was 2026-03-20 16:46:30)', '127.0.0.1', 'node', '2026-03-20 16:11:32', '2026-03-20 16:11:32'),
(46, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 17:11:44\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 17:11:44', '127.0.0.1', 'node', '2026-03-20 16:11:44', '2026-03-20 16:11:44'),
(47, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 17:20:00\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 17:20:00', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 16:20:00', '2026-03-20 16:20:00'),
(48, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '4', 'Permission', 'Delete', '{\"id\": 4, \"name\": \"upgrade_account\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}', NULL, 'The permission with ID 4 and name upgrade_account was deleted by victor.', '127.0.0.1', 'node', '2026-03-20 17:10:31', '2026-03-20 17:10:31'),
(49, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 18:12:00\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 18:12:00', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 17:12:00', '2026-03-20 17:12:00'),
(50, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '6', 'Permission', 'Create', NULL, '{\"id\": 6, \"name\": \"add_settings\", \"created_at\": \"2026-03-20T18:12:51.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:12:51.000000Z\"}', 'The permission with ID 6 and name add_settings was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 17:12:51', '2026-03-20 17:12:51'),
(51, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '7', 'Permission', 'Create', NULL, '{\"id\": 7, \"name\": \"victor\", \"created_at\": \"2026-03-20T18:16:17.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:16:17.000000Z\"}', 'The permission with ID 7 and name victor was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:16:17', '2026-03-20 17:16:17'),
(52, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '8', 'Permission', 'Create', NULL, '{\"id\": 8, \"name\": \"cupidatat_quas_delen\", \"created_at\": \"2026-03-20T18:19:26.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:19:26.000000Z\"}', 'The permission with ID 8 and name cupidatat_quas_delen was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:19:26', '2026-03-20 17:19:26'),
(53, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '9', 'Permission', 'Create', NULL, '{\"id\": 9, \"name\": \"vitor\", \"created_at\": \"2026-03-20T18:20:14.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:20:14.000000Z\"}', 'The permission with ID 9 and name vitor was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:20:14', '2026-03-20 17:20:14'),
(54, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '10', 'Permission', 'Create', NULL, '{\"id\": 10, \"name\": \"ok\", \"created_at\": \"2026-03-20T18:20:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:20:22.000000Z\"}', 'The permission with ID 10 and name ok was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:20:22', '2026-03-20 17:20:22'),
(55, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '10', 'Permission', 'Delete', '{\"id\": 10, \"name\": \"ok\", \"created_at\": \"2026-03-20T18:20:22.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:20:22.000000Z\"}', NULL, 'The permission with ID 10 and name ok was deleted by victor.', '127.0.0.1', 'node', '2026-03-20 17:20:31', '2026-03-20 17:20:31'),
(56, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '9', 'Permission', 'Update', '{\"id\": 9, \"name\": \"vitor\", \"created_at\": \"2026-03-20T18:20:14.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:20:14.000000Z\"}', '{\"id\": 9, \"name\": \"update_create\", \"created_at\": \"2026-03-20T18:20:14.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:24:25.000000Z\"}', 'The permission with ID 9 and name update_create was updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 17:24:25', '2026-03-20 17:24:25'),
(57, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '9', 'Permission', 'Update', '{\"id\": 9, \"name\": \"update_create\", \"created_at\": \"2026-03-20T18:20:14.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:24:25.000000Z\"}', '{\"id\": 9, \"name\": \"create_people\", \"created_at\": \"2026-03-20T18:20:14.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:27:34.000000Z\"}', 'The permission with ID 9 and name create_people was updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 17:27:34', '2026-03-20 17:27:34'),
(58, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '11', 'Permission', 'Create', NULL, '{\"id\": 11, \"name\": \"john\", \"created_at\": \"2026-03-20T18:34:45.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:34:45.000000Z\"}', 'The permission with ID 11 and name john was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:34:45', '2026-03-20 17:34:45'),
(59, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '8', 'Permission', 'Update', '{\"id\": 8, \"name\": \"cupidatat_quas_delen\", \"created_at\": \"2026-03-20T18:19:26.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:19:26.000000Z\"}', '{\"id\": 8, \"name\": \"existing\", \"created_at\": \"2026-03-20T18:19:26.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:35:51.000000Z\"}', 'The permission with ID 8 and name existing was updated by victor.', '127.0.0.1', 'node', '2026-03-20 17:35:51', '2026-03-20 17:35:51'),
(60, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Logout', '{\"login_at\": \"2026-03-20 18:12:00\"}', '{\"ip\": \"127.0.0.1\", \"logout_at\": \"2026-03-20T18:36:53.001008Z\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged out at 2026-03-20 18:36:53 (login was 2026-03-20 18:12:00)', '127.0.0.1', 'node', '2026-03-20 17:36:53', '2026-03-20 17:36:53'),
(61, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 18:37:01\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 18:37:01', '127.0.0.1', 'node', '2026-03-20 17:37:01', '2026-03-20 17:37:01'),
(62, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '12', 'Permission', 'Create', NULL, '{\"id\": 12, \"name\": \"ok\", \"created_at\": \"2026-03-20T18:37:19.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:37:19.000000Z\"}', 'The permission with ID 12 and name ok was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:37:19', '2026-03-20 17:37:19');
INSERT INTO `audit_trails` (`id`, `branch_id`, `performed_by_type`, `performed_by_id`, `auditable_type`, `auditable_id`, `module`, `actions`, `before_change`, `after_change`, `description`, `ip`, `agent`, `created_at`, `updated_at`) VALUES
(63, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '1', 'Permission', 'Update', '{\"id\": 1, \"name\": \"create_account\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T08:38:52.000000Z\"}', '{\"id\": 1, \"name\": \"testing_tool\", \"created_at\": \"2026-03-20T08:38:52.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:39:02.000000Z\"}', 'The permission with ID 1 and name testing_tool was updated by victor.', '127.0.0.1', 'node', '2026-03-20 17:39:02', '2026-03-20 17:39:02'),
(64, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '12', 'Permission', 'Update', '{\"id\": 12, \"name\": \"ok\", \"created_at\": \"2026-03-20T18:37:19.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:37:19.000000Z\"}', '{\"id\": 12, \"name\": \"3ok\", \"created_at\": \"2026-03-20T18:37:19.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:40:32.000000Z\"}', 'The permission with ID 12 and name 3ok was updated by victor.', '127.0.0.1', 'node', '2026-03-20 17:40:32', '2026-03-20 17:40:32'),
(65, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '12', 'Permission', 'Update', '{\"id\": 12, \"name\": \"3ok\", \"created_at\": \"2026-03-20T18:37:19.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:40:32.000000Z\"}', '{\"id\": 12, \"name\": \"nn3ok\", \"created_at\": \"2026-03-20T18:37:19.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:40:41.000000Z\"}', 'The permission with ID 12 and name nn3ok was updated by victor.', '127.0.0.1', 'node', '2026-03-20 17:40:41', '2026-03-20 17:40:41'),
(66, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '13', 'Permission', 'Create', NULL, '{\"id\": 13, \"name\": \"debitis_aperiam_tota\", \"created_at\": \"2026-03-20T18:46:24.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:46:24.000000Z\"}', 'The permission with ID 13 and name debitis_aperiam_tota was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:46:25', '2026-03-20 17:46:25'),
(67, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '14', 'Permission', 'Create', NULL, '{\"id\": 14, \"name\": \"quia_et_saepe_vitae\", \"created_at\": \"2026-03-20T18:46:30.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:46:30.000000Z\"}', 'The permission with ID 14 and name quia_et_saepe_vitae was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:46:30', '2026-03-20 17:46:30'),
(68, 1, 'user', '1', 'Spatie\\Permission\\Models\\Permission', '15', 'Permission', 'Create', NULL, '{\"id\": 15, \"name\": \"voluptas_et_asperior\", \"created_at\": \"2026-03-20T18:46:36.000000Z\", \"guard_name\": \"user\", \"updated_at\": \"2026-03-20T18:46:36.000000Z\"}', 'The permission with ID 15 and name voluptas_et_asperior was created by victor.', '127.0.0.1', 'node', '2026-03-20 17:46:36', '2026-03-20 17:46:36'),
(69, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 21:35:39\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 21:35:39', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:35:39', '2026-03-20 20:35:39'),
(70, 1, 'user', '1', 'App\\Models\\AccountOfficer', '1', 'AccountOfficer', 'Create', NULL, '{\"id\": 1, \"city\": \"Ikeja\", \"code\": \"AO0001\", \"email\": \"joh @gmail.com\", \"phone\": \"07033274155\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"branch_id\": 2, \"last_name\": \"Math\", \"created_at\": \"2026-03-20T21:43:22.000000Z\", \"first_name\": \"John\", \"updated_at\": \"2026-03-20T21:43:22.000000Z\"}', 'Account Officer John Math (AO0001) was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:43:22', '2026-03-20 20:43:22'),
(71, 1, 'user', '1', 'App\\Models\\AccountOfficer', '2', 'AccountOfficer', 'Create', NULL, '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"joh @gmail.com\", \"phone\": \"07033274155\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Math\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"John\", \"updated_at\": \"2026-03-20T21:52:31.000000Z\"}', 'Account Officer John was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:52:31', '2026-03-20 20:52:31'),
(72, 1, 'user', '1', 'App\\Models\\AccountOfficer', '3', 'AccountOfficer', 'Create', NULL, '{\"id\": 3, \"city\": \"Ikeja\", \"code\": \"AO-00003\", \"email\": \"joh@gmail.c4om\", \"phone\": \"07033274145\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Math\", \"created_at\": \"2026-03-20T21:56:17.000000Z\", \"first_name\": \"John\", \"updated_at\": \"2026-03-20T21:56:17.000000Z\"}', 'Account Officer John was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:56:17', '2026-03-20 20:56:17'),
(73, 1, 'user', '1', 'App\\Models\\AccountOfficer', '2', 'AccountOfficer', 'Update', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"joh @gmail.com\", \"phone\": \"07033274155\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Math\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"John\", \"updated_at\": \"2026-03-20T21:52:31.000000Z\"}', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', 'Account Officer AO-00001 and ID 2 updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:59:32', '2026-03-20 20:59:32'),
(74, 1, 'user', '1', 'App\\Models\\AccountOfficer', '2', 'AccountOfficer', 'Update', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', 'Account Officer AO-00001 and ID 2 updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:59:38', '2026-03-20 20:59:38'),
(75, 1, 'user', '1', 'App\\Models\\AccountOfficer', '2', 'AccountOfficer', 'Update', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', 'Account Officer AO-00001 and ID 2 updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:59:39', '2026-03-20 20:59:39'),
(76, 1, 'user', '1', 'App\\Models\\AccountOfficer', '2', 'AccountOfficer', 'Update', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', 'Account Officer AO-00001 and ID 2 updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 20:59:41', '2026-03-20 20:59:41'),
(77, 1, 'user', '1', 'App\\Models\\AccountOfficer', '4', 'AccountOfficer', 'Create', NULL, '{\"id\": 4, \"city\": \"Ikeja\", \"code\": \"AO-00004\", \"email\": \"joh@gmadil.c4om\", \"phone\": \"12345678909\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Math\", \"created_at\": \"2026-03-20T22:16:07.000000Z\", \"first_name\": \"John\", \"updated_at\": \"2026-03-20T22:16:07.000000Z\"}', 'Account Officer John was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 21:16:07', '2026-03-20 21:16:07'),
(78, 1, 'user', '1', 'App\\Models\\AccountOfficer', '2', 'AccountOfficer', 'Update', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Tom\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"Tom\", \"updated_at\": \"2026-03-20T21:59:32.000000Z\"}', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"<A<\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"MAM\", \"updated_at\": \"2026-03-20T22:16:37.000000Z\"}', 'Account Officer AO-00001 and ID 2 updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 21:16:37', '2026-03-20 21:16:37'),
(79, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-20 22:20:30\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-20 22:20:30', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 21:20:30', '2026-03-20 21:20:30'),
(80, 1, 'user', '1', 'App\\Models\\AccountOfficer', '2', 'AccountOfficer', 'Delete', '{\"id\": 2, \"city\": \"Ikeja\", \"code\": \"AO-00001\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"<A<\", \"created_at\": \"2026-03-20T21:52:31.000000Z\", \"first_name\": \"MAM\", \"updated_at\": \"2026-03-20T22:16:37.000000Z\"}', NULL, 'Account Officer AO-00001 deleted by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-20 21:20:39', '2026-03-20 21:20:39'),
(81, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-21 08:27:09\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-21 08:27:09', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 07:27:09', '2026-03-21 07:27:09'),
(82, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Logout', '{\"login_at\": \"2026-03-21 08:27:09\"}', '{\"ip\": \"127.0.0.1\", \"logout_at\": \"2026-03-21T09:37:06.361687Z\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged out at 2026-03-21 09:37:06 (login was 2026-03-21 08:27:09)', '127.0.0.1', 'node', '2026-03-21 08:37:06', '2026-03-21 08:37:06'),
(83, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-21 09:37:14\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-21 09:37:14', '127.0.0.1', 'node', '2026-03-21 08:37:14', '2026-03-21 08:37:14'),
(84, 1, 'user', '1', 'App\\Models\\AccountOfficer', '5', 'AccountOfficer', 'Create', NULL, '{\"id\": 5, \"city\": \"Kaduna\", \"code\": \"AO-00005\", \"email\": \"fatima.abubakar@gmail.com\", \"phone\": \"07087654321\", \"state\": \"Kaduna\", \"address\": \"12 Ahmadu Bello Way\", \"user_id\": 1, \"branch_id\": 4, \"last_name\": \"Abubakar\", \"created_at\": \"2026-03-21T09:41:16.000000Z\", \"first_name\": \"Fatima\", \"updated_at\": \"2026-03-21T09:41:16.000000Z\"}', 'Account Officer Fatima was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 08:41:16', '2026-03-21 08:41:16'),
(85, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Create', NULL, '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"address\": \"23 Allen Avenue\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha\", \"updated_at\": \"2026-03-21T09:41:32.000000Z\"}', 'Account Officer Aisha was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 08:41:32', '2026-03-21 08:41:32'),
(86, 1, 'user', '1', 'App\\Models\\AccountOfficer', '7', 'AccountOfficer', 'Create', NULL, '{\"id\": 7, \"city\": \"Enugu\", \"code\": \"AO-00007\", \"email\": \"chinedu.okafor@yahoo.com\", \"phone\": \"08123456789\", \"state\": \"Enugu\", \"address\": \"15 Independence Layout\", \"user_id\": 1, \"branch_id\": 3, \"last_name\": \"Okafor\", \"created_at\": \"2026-03-21T09:41:38.000000Z\", \"first_name\": \"Chinedu\", \"updated_at\": \"2026-03-21T09:41:38.000000Z\"}', 'Account Officer Chinedu was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 08:41:38', '2026-03-21 08:41:38'),
(87, 1, 'user', '1', 'App\\Models\\AccountOfficer', '8', 'AccountOfficer', 'Create', NULL, '{\"id\": 8, \"city\": \"Lekki\", \"code\": \"AO-00008\", \"email\": \"t.adeyemi@company.com\", \"phone\": \"07011223344\", \"state\": \"Lagos\", \"address\": \"Plot 7 Admiralty Way\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Adeyemi\", \"created_at\": \"2026-03-21T09:42:06.000000Z\", \"first_name\": \"Tunde\", \"updated_at\": \"2026-03-21T09:42:06.000000Z\"}', 'Account Officer Tunde was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 08:42:06', '2026-03-21 08:42:06'),
(88, 1, 'user', '1', 'App\\Models\\AccountOfficer', '9', 'AccountOfficer', 'Create', NULL, '{\"id\": 9, \"city\": \"Port Harcourt\", \"code\": \"AO-00009\", \"email\": \"chioma.okafor23@gmail.com\", \"phone\": \"08034567891\", \"state\": \"Rivers\", \"gender\": \"female\", \"address\": \"12 Aba Road\", \"user_id\": 1, \"branch_id\": 3, \"last_name\": \"Okafor\", \"created_at\": \"2026-03-21T10:52:51.000000Z\", \"first_name\": \"Chioma\", \"updated_at\": \"2026-03-21T10:52:51.000000Z\"}', 'Account Officer Chioma was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 09:52:51', '2026-03-21 09:52:51'),
(89, 1, 'user', '1', 'App\\Models\\AccountOfficer', '10', 'AccountOfficer', 'Create', NULL, '{\"id\": 10, \"city\": \"Kano\", \"code\": \"AO-00010\", \"email\": \"ibrahim.sule@bizmail.com\", \"phone\": \"08122334455\", \"state\": \"Kano\", \"gender\": \"male\", \"address\": \"45 Emir Palace Road\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Sule\", \"created_at\": \"2026-03-21T10:53:22.000000Z\", \"first_name\": \"Ibrahim\", \"updated_at\": \"2026-03-21T10:53:22.000000Z\"}', 'Account Officer Ibrahim was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 09:53:22', '2026-03-21 09:53:22'),
(90, 1, 'user', '1', 'App\\Models\\AccountOfficer', '11', 'AccountOfficer', 'Create', NULL, '{\"id\": 11, \"city\": \"Abuja\", \"code\": \"AO-00011\", \"email\": \"sadiq.bello@company.org\", \"phone\": \"07099887766\", \"state\": \"FCT\", \"gender\": \"male\", \"address\": \"8 Ahmadu Bello Way\", \"user_id\": 1, \"branch_id\": 4, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T10:53:39.000000Z\", \"first_name\": \"Sadiq\", \"updated_at\": \"2026-03-21T10:53:39.000000Z\"}', 'Account Officer Sadiq was created by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 09:53:39', '2026-03-21 09:53:39'),
(91, 1, 'user', '1', 'App\\Models\\AccountOfficer', '12', 'AccountOfficer', 'Create', NULL, '{\"id\": 12, \"city\": \"Aliquip Nam numquam\", \"code\": \"AO-00012\", \"email\": \"jomykosuh@mailinator.com\", \"phone\": \"98888888888\", \"state\": \"Qui nemo nisi irure\", \"gender\": \"male\", \"address\": \"Ullamco et sit unde\", \"user_id\": 1, \"branch_id\": \"1\", \"last_name\": \"Townsend\", \"created_at\": \"2026-03-21T12:49:11.000000Z\", \"first_name\": \"Lane\", \"updated_at\": \"2026-03-21T12:49:11.000000Z\"}', 'Account Officer Lane was created by victor.', '127.0.0.1', 'node', '2026-03-21 11:49:12', '2026-03-21 11:49:12'),
(92, 1, 'user', '1', 'App\\Models\\AccountOfficer', '13', 'AccountOfficer', 'Create', NULL, '{\"id\": 13, \"city\": \"Laborum qui debitis\", \"code\": \"AO-00013\", \"email\": \"codav@mailinator.com\", \"phone\": \"49084309039\", \"state\": \"Eaque quisquam fugia\", \"gender\": \"female\", \"address\": \"Iusto qui qui conseq\", \"user_id\": 1, \"branch_id\": \"4\", \"last_name\": \"Flynn\", \"created_at\": \"2026-03-21T12:51:53.000000Z\", \"first_name\": \"Kelsie\", \"updated_at\": \"2026-03-21T12:51:53.000000Z\"}', 'Account Officer Kelsie was created by victor.', '127.0.0.1', 'node', '2026-03-21 11:51:53', '2026-03-21 11:51:53'),
(93, 1, 'user', '1', 'App\\Models\\AccountOfficer', '14', 'AccountOfficer', 'Create', NULL, '{\"id\": 14, \"city\": \"Ikeja\", \"code\": \"AO-00014\", \"email\": \"testing@gmail.comsdd\", \"phone\": \"08033111122\", \"state\": \"Edo\", \"gender\": \"female\", \"address\": \"39 Aina street, Ojudo Lagos\", \"user_id\": 1, \"branch_id\": \"3\", \"last_name\": \"Yusuf\", \"created_at\": \"2026-03-21T12:58:07.000000Z\", \"first_name\": \"Michael\", \"updated_at\": \"2026-03-21T12:58:07.000000Z\"}', 'Account Officer Michael was created by victor.', '127.0.0.1', 'node', '2026-03-21 11:58:07', '2026-03-21 11:58:07'),
(94, 1, 'user', '1', 'App\\Models\\AccountOfficer', '15', 'AccountOfficer', 'Create', NULL, '{\"id\": 15, \"city\": \"Nulla tempora enim c\", \"code\": \"AO-00015\", \"email\": \"pilyzytito@mailinator.com\", \"phone\": \"15746477956\", \"state\": \"In id voluptas occae\", \"gender\": \"female\", \"address\": \"Ut quibusdam molliti\", \"user_id\": 1, \"branch_id\": \"3\", \"last_name\": \"Roberts\", \"created_at\": \"2026-03-21T13:00:03.000000Z\", \"first_name\": \"Mari\", \"updated_at\": \"2026-03-21T13:00:03.000000Z\"}', 'Account Officer Mari was created by victor.', '127.0.0.1', 'node', '2026-03-21 12:00:03', '2026-03-21 12:00:03'),
(95, 1, 'user', '1', 'App\\Models\\AccountOfficer', '3', 'AccountOfficer', 'Update', '{\"id\": 3, \"city\": \"Ikeja\", \"code\": \"AO-00003\", \"email\": \"joh@gmail.c4om\", \"phone\": \"07033274145\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Math\", \"created_at\": \"2026-03-20T21:56:17.000000Z\", \"first_name\": \"John\", \"updated_at\": \"2026-03-20T21:56:17.000000Z\"}', '{\"id\": 3, \"city\": \"Ikeja\", \"code\": \"AO-00003\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"<A<\", \"created_at\": \"2026-03-20T21:56:17.000000Z\", \"first_name\": \"MAM\", \"updated_at\": \"2026-03-21T13:04:02.000000Z\"}', 'Account Officer AO-00003 and ID 3 updated by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 12:04:02', '2026-03-21 12:04:02'),
(96, 1, 'user', '1', 'App\\Models\\AccountOfficer', '16', 'AccountOfficer', 'Create', NULL, '{\"id\": 16, \"city\": \"Placeat nulla venia\", \"code\": \"AO-00016\", \"email\": \"nefe@mailinator.com\", \"phone\": \"12964249116\", \"state\": \"Saepe dignissimos en\", \"gender\": \"female\", \"address\": \"Sapiente non volupta\", \"user_id\": 1, \"branch_id\": \"1\", \"last_name\": \"Kline\", \"created_at\": \"2026-03-21T13:14:58.000000Z\", \"first_name\": \"Sigourney\", \"updated_at\": \"2026-03-21T13:14:58.000000Z\"}', 'Account Officer Sigourney was created by victor.', '127.0.0.1', 'node', '2026-03-21 12:14:58', '2026-03-21 12:14:58'),
(97, 1, 'user', '1', 'App\\Models\\AccountOfficer', '17', 'AccountOfficer', 'Create', NULL, '{\"id\": 17, \"city\": \"Rem nihil aspernatur\", \"code\": \"AO-00017\", \"email\": \"zoqab@mailinator.com\", \"phone\": \"17733348052\", \"state\": \"Nam ex tempore pari\", \"gender\": \"male\", \"address\": \"Temporibus eligendi\", \"user_id\": 1, \"branch_id\": \"2\", \"last_name\": \"Green\", \"created_at\": \"2026-03-21T13:28:55.000000Z\", \"first_name\": \"Isabella\", \"updated_at\": \"2026-03-21T13:28:55.000000Z\"}', 'Account Officer Isabella was created by victor.', '127.0.0.1', 'node', '2026-03-21 12:28:55', '2026-03-21 12:28:55'),
(98, 1, 'user', '1', 'App\\Models\\AccountOfficer', '4', 'AccountOfficer', 'Delete', '{\"id\": 4, \"city\": \"Ikeja\", \"code\": \"AO-00004\", \"email\": \"joh@gmadil.c4om\", \"phone\": \"12345678909\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Math\", \"created_at\": \"2026-03-20T22:16:07.000000Z\", \"first_name\": \"John\", \"updated_at\": \"2026-03-20T22:16:07.000000Z\"}', NULL, 'Account Officer AO-00004 deleted by victor.', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-21 12:40:50', '2026-03-21 12:40:50'),
(99, 1, 'user', '1', 'App\\Models\\AccountOfficer', '17', 'AccountOfficer', 'Delete', '{\"id\": 17, \"city\": \"Rem nihil aspernatur\", \"code\": \"AO-00017\", \"email\": \"zoqab@mailinator.com\", \"phone\": \"17733348052\", \"state\": \"Nam ex tempore pari\", \"gender\": \"male\", \"address\": \"Temporibus eligendi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Green\", \"created_at\": \"2026-03-21T13:28:55.000000Z\", \"first_name\": \"Isabella\", \"updated_at\": \"2026-03-21T13:28:55.000000Z\"}', NULL, 'Account Officer AO-00017 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:50:53', '2026-03-21 12:50:53'),
(100, 1, 'user', '1', 'App\\Models\\AccountOfficer', '16', 'AccountOfficer', 'Delete', '{\"id\": 16, \"city\": \"Placeat nulla venia\", \"code\": \"AO-00016\", \"email\": \"nefe@mailinator.com\", \"phone\": \"12964249116\", \"state\": \"Saepe dignissimos en\", \"gender\": \"female\", \"address\": \"Sapiente non volupta\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Kline\", \"created_at\": \"2026-03-21T13:14:58.000000Z\", \"first_name\": \"Sigourney\", \"updated_at\": \"2026-03-21T13:14:58.000000Z\"}', NULL, 'Account Officer AO-00016 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:52:45', '2026-03-21 12:52:45'),
(101, 1, 'user', '1', 'App\\Models\\AccountOfficer', '15', 'AccountOfficer', 'Delete', '{\"id\": 15, \"city\": \"Nulla tempora enim c\", \"code\": \"AO-00015\", \"email\": \"pilyzytito@mailinator.com\", \"phone\": \"15746477956\", \"state\": \"In id voluptas occae\", \"gender\": \"female\", \"address\": \"Ut quibusdam molliti\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 3, \"last_name\": \"Roberts\", \"created_at\": \"2026-03-21T13:00:03.000000Z\", \"first_name\": \"Mari\", \"updated_at\": \"2026-03-21T13:00:03.000000Z\"}', NULL, 'Account Officer AO-00015 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:52:58', '2026-03-21 12:52:58'),
(102, 1, 'user', '1', 'App\\Models\\AccountOfficer', '14', 'AccountOfficer', 'Delete', '{\"id\": 14, \"city\": \"Ikeja\", \"code\": \"AO-00014\", \"email\": \"testing@gmail.comsdd\", \"phone\": \"08033111122\", \"state\": \"Edo\", \"gender\": \"female\", \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 3, \"last_name\": \"Yusuf\", \"created_at\": \"2026-03-21T12:58:07.000000Z\", \"first_name\": \"Michael\", \"updated_at\": \"2026-03-21T12:58:07.000000Z\"}', NULL, 'Account Officer AO-00014 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:53:18', '2026-03-21 12:53:18'),
(103, 1, 'user', '1', 'App\\Models\\AccountOfficer', '12', 'AccountOfficer', 'Delete', '{\"id\": 12, \"city\": \"Aliquip Nam numquam\", \"code\": \"AO-00012\", \"email\": \"jomykosuh@mailinator.com\", \"phone\": \"98888888888\", \"state\": \"Qui nemo nisi irure\", \"gender\": \"male\", \"address\": \"Ullamco et sit unde\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Townsend\", \"created_at\": \"2026-03-21T12:49:11.000000Z\", \"first_name\": \"Lane\", \"updated_at\": \"2026-03-21T12:49:11.000000Z\"}', NULL, 'Account Officer AO-00012 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:56:42', '2026-03-21 12:56:42'),
(104, 1, 'user', '1', 'App\\Models\\AccountOfficer', '13', 'AccountOfficer', 'Delete', '{\"id\": 13, \"city\": \"Laborum qui debitis\", \"code\": \"AO-00013\", \"email\": \"codav@mailinator.com\", \"phone\": \"49084309039\", \"state\": \"Eaque quisquam fugia\", \"gender\": \"female\", \"address\": \"Iusto qui qui conseq\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 4, \"last_name\": \"Flynn\", \"created_at\": \"2026-03-21T12:51:53.000000Z\", \"first_name\": \"Kelsie\", \"updated_at\": \"2026-03-21T12:51:53.000000Z\"}', NULL, 'Account Officer AO-00013 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:57:10', '2026-03-21 12:57:10'),
(105, 1, 'user', '1', 'App\\Models\\AccountOfficer', '8', 'AccountOfficer', 'Delete', '{\"id\": 8, \"city\": \"Lekki\", \"code\": \"AO-00008\", \"email\": \"t.adeyemi@company.com\", \"phone\": \"07011223344\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"Plot 7 Admiralty Way\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Adeyemi\", \"created_at\": \"2026-03-21T09:42:06.000000Z\", \"first_name\": \"Tunde\", \"updated_at\": \"2026-03-21T09:42:06.000000Z\"}', NULL, 'Account Officer AO-00008 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:57:33', '2026-03-21 12:57:33'),
(106, 1, 'user', '1', 'App\\Models\\AccountOfficer', '10', 'AccountOfficer', 'Delete', '{\"id\": 10, \"city\": \"Kano\", \"code\": \"AO-00010\", \"email\": \"ibrahim.sule@bizmail.com\", \"phone\": \"08122334455\", \"state\": \"Kano\", \"gender\": \"male\", \"address\": \"45 Emir Palace Road\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Sule\", \"created_at\": \"2026-03-21T10:53:22.000000Z\", \"first_name\": \"Ibrahim\", \"updated_at\": \"2026-03-21T10:53:22.000000Z\"}', NULL, 'Account Officer AO-00010 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:58:34', '2026-03-21 12:58:34'),
(107, 1, 'user', '1', 'App\\Models\\AccountOfficer', '11', 'AccountOfficer', 'Delete', '{\"id\": 11, \"city\": \"Abuja\", \"code\": \"AO-00011\", \"email\": \"sadiq.bello@company.org\", \"phone\": \"07099887766\", \"state\": \"FCT\", \"gender\": \"male\", \"address\": \"8 Ahmadu Bello Way\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 4, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T10:53:39.000000Z\", \"first_name\": \"Sadiq\", \"updated_at\": \"2026-03-21T10:53:39.000000Z\"}', NULL, 'Account Officer AO-00011 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 12:58:43', '2026-03-21 12:58:43'),
(108, 1, 'user', '1', 'App\\Models\\AccountOfficer', '18', 'AccountOfficer', 'Create', NULL, '{\"id\": 18, \"city\": \"Sit sequi voluptatem\", \"code\": \"AO-00010\", \"email\": \"mykubydam@mailinator.com\", \"phone\": \"12199782683\", \"state\": \"Fugit animi velit\", \"gender\": \"male\", \"address\": \"Eos commodi volupta\", \"user_id\": 1, \"branch_id\": \"2\", \"last_name\": \"Carroll\", \"created_at\": \"2026-03-21T14:01:13.000000Z\", \"first_name\": \"Grace\", \"updated_at\": \"2026-03-21T14:01:13.000000Z\"}', 'Account Officer Grace was created by victor.', '127.0.0.1', 'node', '2026-03-21 13:01:13', '2026-03-21 13:01:13'),
(109, 1, 'user', '1', 'App\\Models\\AccountOfficer', '3', 'AccountOfficer', 'Delete', '{\"id\": 3, \"city\": \"Ikeja\", \"code\": \"AO-00003\", \"email\": \"Tom@gmail.c4om\", \"phone\": \"07033274135\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"10 Main street\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"<A<\", \"created_at\": \"2026-03-20T21:56:17.000000Z\", \"first_name\": \"MAM\", \"updated_at\": \"2026-03-21T13:04:02.000000Z\"}', NULL, 'Account Officer AO-00003 deleted by victor.', '127.0.0.1', 'node', '2026-03-21 13:01:35', '2026-03-21 13:01:35'),
(110, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Logout', '{\"login_at\": \"2026-03-21 09:37:14\"}', '{\"ip\": \"127.0.0.1\", \"logout_at\": \"2026-03-21T22:36:10.940288Z\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged out at 2026-03-21 22:36:10 (login was 2026-03-21 09:37:14)', '127.0.0.1', 'node', '2026-03-21 21:36:10', '2026-03-21 21:36:10'),
(111, NULL, 'system', NULL, 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-21 22:36:18\", \"user_agent\": \"node\"}', 'User with username victor and ID: 1 logged in at 2026-03-21 22:36:18', '127.0.0.1', 'node', '2026-03-21 21:36:18', '2026-03-21 21:36:18'),
(112, 1, 'user', '1', 'App\\Models\\AccountOfficer', '19', 'AccountOfficer', 'Create', NULL, '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"user_id\": 1, \"branch_id\": \"1\", \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Naida\", \"updated_at\": \"2026-03-21T22:37:07.000000Z\"}', 'Account Officer Naida was created by victor.', '127.0.0.1', 'node', '2026-03-21 21:37:07', '2026-03-21 21:37:07'),
(113, 1, 'user', '1', 'App\\Models\\AccountOfficer', '19', 'AccountOfficer', 'Update', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Naida\", \"updated_at\": \"2026-03-21T22:37:07.000000Z\"}', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:17:36.000000Z\"}', 'Account Officer AO-00019 and ID 19 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:17:36', '2026-03-21 22:17:36'),
(114, 1, 'user', '1', 'App\\Models\\AccountOfficer', '19', 'AccountOfficer', 'Update', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:17:36.000000Z\"}', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:17:36.000000Z\"}', 'Account Officer AO-00019 and ID 19 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:17:54', '2026-03-21 22:17:54'),
(115, 1, 'user', '1', 'App\\Models\\AccountOfficer', '19', 'AccountOfficer', 'Update', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:17:36.000000Z\"}', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:17:36.000000Z\"}', 'Account Officer AO-00019 and ID 19 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:18:10', '2026-03-21 22:18:10'),
(116, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha\", \"updated_at\": \"2026-03-21T09:41:32.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala\", \"updated_at\": \"2026-03-21T23:20:00.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:20:00', '2026-03-21 22:20:00'),
(117, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala\", \"updated_at\": \"2026-03-21T23:20:00.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": \"2\", \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:20:16.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:20:16', '2026-03-21 22:20:16'),
(118, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:20:16.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:20:16.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:20:26', '2026-03-21 22:20:26'),
(119, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234567\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:20:16.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:21:59.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:21:59', '2026-03-21 22:21:59'),
(120, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:21:59.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:21:59.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:22:24', '2026-03-21 22:22:24'),
(121, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"23 Allen Avenue\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:21:59.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:24:14.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:24:14', '2026-03-21 22:24:14'),
(122, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 2, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:24:14.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": \"4\", \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:24:58.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:24:58', '2026-03-21 22:24:58'),
(123, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 4, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:24:58.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": \"4\", \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:24:58.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:25:49', '2026-03-21 22:25:49'),
(124, 1, 'user', '1', 'App\\Models\\AccountOfficer', '6', 'AccountOfficer', 'Update', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 4, \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:24:58.000000Z\"}', '{\"id\": 6, \"city\": \"Ikeja\", \"code\": \"AO-00006\", \"email\": \"aisha.bello@gmail.com\", \"phone\": \"08051234589\", \"state\": \"Lagos\", \"gender\": null, \"address\": \"39 Aina street, Ojudo Lagos\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": \"4\", \"last_name\": \"Bello\", \"created_at\": \"2026-03-21T09:41:32.000000Z\", \"first_name\": \"Aisha Bala jo\", \"updated_at\": \"2026-03-21T23:24:58.000000Z\"}', 'Account Officer AO-00006 and ID 6 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:25:52', '2026-03-21 22:25:52'),
(125, 1, 'user', '1', 'App\\Models\\AccountOfficer', '19', 'AccountOfficer', 'Update', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Edo\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:17:36.000000Z\"}', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Abuja\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:27:38.000000Z\"}', 'Account Officer AO-00019 and ID 19 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:27:38', '2026-03-21 22:27:38'),
(126, 1, 'user', '1', 'App\\Models\\AccountOfficer', '19', 'AccountOfficer', 'Update', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161924\", \"state\": \"Abuja\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:27:38.000000Z\"}', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161922\", \"state\": \"Abuja\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:28:28.000000Z\"}', 'Account Officer AO-00019 and ID 19 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:28:28', '2026-03-21 22:28:28'),
(127, 1, 'user', '1', 'App\\Models\\AccountOfficer', '19', 'AccountOfficer', 'Update', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@mailinator.com\", \"phone\": \"14884161922\", \"state\": \"Abuja\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:28:28.000000Z\"}', '{\"id\": 19, \"city\": \"Ikeja\", \"code\": \"AO-00019\", \"email\": \"zojedezoq@gmail.com\", \"phone\": \"14884161922\", \"state\": \"Abuja\", \"gender\": \"male\", \"address\": \"Porro qui nulla offi\", \"country\": \"Nigeria\", \"user_id\": 1, \"branch_id\": 1, \"last_name\": \"Washington\", \"created_at\": \"2026-03-21T22:37:07.000000Z\", \"first_name\": \"Victor John\", \"updated_at\": \"2026-03-21T23:29:51.000000Z\"}', 'Account Officer AO-00019 and ID 19 updated by victor.', '127.0.0.1', 'node', '2026-03-21 22:29:51', '2026-03-21 22:29:51'),
(128, 1, 'user', '1', 'App\\Models\\User', '1', 'Authentication', 'Login', NULL, '{\"ip\": \"127.0.0.1\", \"login_at\": \"2026-03-23 08:34:28\", \"user_agent\": \"PostmanRuntime/7.49.1\"}', 'User with username victor and ID: 1 logged in at 2026-03-23 08:34:28', '127.0.0.1', 'PostmanRuntime/7.49.1', '2026-03-23 07:34:28', '2026-03-23 07:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Nigeria',
  `status` enum('active','pending','blocked','disabled','inactive','delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `code`, `email`, `phone`, `address`, `city`, `state`, `country`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lagos Branch', 'LAG001', 'lagos@yourapp.com', '08010000001', 'Victoria Island', 'Lagos', 'Lagos', 'Nigeria', 'active', '2026-03-20 07:38:52', '2026-03-20 07:38:52'),
(2, 'Abuja Branch', 'ABJ001', 'abuja@yourapp.com', '08010000002', 'Wuse Zone 2', 'Abuja', 'FCT', 'Nigeria', 'active', '2026-03-20 07:38:52', '2026-03-20 07:38:52'),
(3, 'Port Harcourt Branch', 'PH001', 'ph@yourapp.com', '08010000003', 'GRA Phase 2', 'Port Harcourt', 'Rivers', 'Nigeria', 'active', '2026-03-20 07:38:52', '2026-03-20 07:38:52'),
(4, 'Kano Branch', 'KAN001', 'kano@yourapp.com', '08010000004', 'Sabon Gari', 'Kano', 'Kano', 'Nigeria', 'active', '2026-03-20 07:38:52', '2026-03-20 07:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-lv:v3.24.0:file:97e36b74-laravel-2026-03-20.log:de68e687:chunk:0', 'a:8:{i:1774032385;a:1:{s:4:\"INFO\";a:1:{i:23;i:1675;}}i:1774032390;a:1:{s:4:\"INFO\";a:1:{i:49;i:5760;}}i:1774032396;a:1:{s:4:\"INFO\";a:1:{i:75;i:9946;}}i:1774032436;a:1:{s:4:\"INFO\";a:1:{i:127;i:47402;}}i:1774032447;a:1:{s:4:\"INFO\";a:1:{i:140;i:76700;}}i:1774032456;a:1:{s:4:\"INFO\";a:1:{i:179;i:274370;}}i:1774032466;a:1:{s:4:\"INFO\";a:1:{i:231;i:380560;}}i:1774032473;a:1:{s:4:\"INFO\";a:1:{i:244;i:477890;}}}', 1774118907),
('laravel-cache-lv:v3.24.0:file:97e36b74-laravel-2026-03-20.log:de68e687:metadata', 'a:9:{s:5:\"query\";s:9:\"~nn3ok~iu\";s:10:\"identifier\";s:8:\"de68e687\";s:26:\"last_scanned_file_position\";i:659180;s:18:\"last_scanned_index\";i:246;s:24:\"next_log_index_to_create\";i:245;s:14:\"max_chunk_size\";i:50000;s:19:\"current_chunk_index\";i:0;s:17:\"chunk_definitions\";a:0:{}s:24:\"current_chunk_definition\";a:5:{s:5:\"index\";i:0;s:4:\"size\";i:8;s:18:\"earliest_timestamp\";i:1774032385;s:16:\"latest_timestamp\";i:1774032473;s:12:\"level_counts\";a:1:{s:4:\"INFO\";i:8;}}}', 1774118907),
('laravel-cache-lv:v3.24.0:file:97e36b74-laravel-2026-03-20.log:ecf8427e:chunk:0', 'a:36:{i:1774031102;a:2:{s:5:\"ERROR\";a:1:{i:0;i:0;}s:4:\"INFO\";a:13:{i:1;i:19215;i:2;i:19294;i:3;i:19379;i:4;i:19467;i:5;i:19515;i:6;i:19565;i:7;i:19613;i:8;i:19660;i:9;i:19730;i:10;i:19813;i:11;i:19866;i:12;i:20074;i:13;i:20135;}}i:1774031213;a:1:{s:4:\"INFO\";a:13:{i:14;i:20289;i:15;i:20368;i:16;i:20453;i:17;i:20541;i:18;i:20589;i:19;i:20639;i:20;i:20687;i:21;i:20734;i:22;i:20804;i:23;i:20887;i:24;i:20940;i:25;i:21199;i:26;i:21260;}}i:1774031229;a:1:{s:4:\"INFO\";a:13:{i:27;i:21414;i:28;i:21493;i:29;i:21578;i:30;i:21666;i:31;i:21714;i:32;i:21764;i:33;i:21812;i:34;i:21859;i:35;i:21929;i:36;i:22012;i:37;i:22065;i:38;i:22324;i:39;i:22385;}}i:1774031254;a:1:{s:4:\"INFO\";a:13:{i:40;i:22539;i:41;i:22618;i:42;i:22703;i:43;i:22791;i:44;i:22839;i:45;i:22889;i:46;i:22937;i:47;i:22984;i:48;i:23054;i:49;i:23136;i:50;i:23189;i:51;i:23340;i:52;i:23402;}}i:1774031685;a:1:{s:4:\"INFO\";a:13:{i:53;i:23556;i:54;i:23635;i:55;i:23720;i:56;i:23805;i:57;i:23854;i:58;i:23904;i:59;i:23952;i:60;i:23999;i:61;i:24052;i:62;i:24125;i:63;i:24178;i:64;i:24329;i:65;i:24391;}}i:1774031686;a:1:{s:4:\"INFO\";a:13:{i:66;i:24545;i:67;i:24624;i:68;i:24709;i:69;i:24809;i:70;i:24857;i:71;i:24907;i:72;i:24955;i:73;i:25002;i:74;i:25055;i:75;i:25125;i:76;i:25178;i:77;i:27234;i:78;i:27295;}}i:1774031699;a:1:{s:4:\"INFO\";a:13:{i:79;i:27449;i:80;i:27528;i:81;i:27613;i:82;i:27701;i:83;i:27749;i:84;i:27799;i:85;i:27847;i:86;i:27894;i:87;i:27947;i:88;i:28020;i:89;i:28073;i:90;i:28332;i:91;i:28393;}}i:1774031751;a:1:{s:4:\"INFO\";a:26:{i:92;i:28547;i:93;i:28626;i:94;i:28711;i:95;i:28799;i:96;i:28847;i:97;i:28897;i:98;i:28945;i:99;i:28992;i:100;i:29045;i:101;i:29122;i:102;i:29175;i:103;i:29326;i:104;i:29388;i:105;i:29542;i:106;i:29621;i:107;i:29706;i:108;i:29806;i:109;i:29854;i:110;i:29904;i:111;i:29952;i:112;i:29999;i:113;i:30052;i:114;i:30122;i:115;i:30175;i:116;i:32219;i:117;i:32279;}}i:1774031813;a:1:{s:4:\"INFO\";a:13:{i:118;i:32433;i:119;i:32512;i:120;i:32597;i:121;i:32672;i:122;i:32721;i:123;i:32771;i:124;i:32819;i:125;i:32866;i:126;i:32919;i:127;i:32972;i:128;i:33025;i:129;i:33179;i:130;i:33241;}}i:1774031821;a:1:{s:4:\"INFO\";a:26:{i:131;i:33395;i:132;i:33474;i:133;i:33559;i:134;i:33633;i:135;i:33682;i:136;i:33732;i:137;i:33780;i:138;i:33831;i:139;i:33884;i:140;i:33963;i:141;i:34016;i:142;i:35243;i:143;i:35305;i:144;i:35459;i:145;i:35538;i:146;i:35623;i:147;i:35699;i:148;i:35747;i:149;i:35797;i:150;i:35845;i:151;i:35892;i:152;i:36042;i:153;i:36095;i:154;i:36148;i:155;i:37053;i:156;i:37115;}}i:1774031829;a:1:{s:4:\"INFO\";a:13:{i:157;i:37269;i:158;i:37348;i:159;i:37433;i:160;i:37533;i:161;i:37581;i:162;i:37631;i:163;i:37679;i:164;i:37726;i:165;i:37779;i:166;i:37849;i:167;i:37902;i:168;i:39946;i:169;i:40007;}}i:1774031839;a:1:{s:4:\"INFO\";a:26:{i:170;i:40161;i:171;i:40240;i:172;i:40325;i:173;i:40410;i:174;i:40459;i:175;i:40509;i:176;i:40557;i:177;i:40604;i:178;i:40657;i:179;i:40728;i:180;i:40781;i:181;i:40932;i:182;i:40993;i:183;i:41147;i:184;i:41226;i:185;i:41311;i:186;i:41411;i:187;i:41459;i:188;i:41509;i:189;i:41557;i:190;i:41604;i:191;i:41657;i:192;i:41727;i:193;i:41780;i:194;i:43910;i:195;i:43970;}}i:1774031942;a:1:{s:4:\"INFO\";a:26:{i:196;i:44124;i:197;i:44203;i:198;i:44288;i:199;i:44376;i:200;i:44424;i:201;i:44474;i:202;i:44522;i:203;i:44569;i:204;i:44622;i:205;i:44703;i:206;i:44756;i:207;i:44907;i:208;i:44969;i:209;i:45123;i:210;i:45202;i:211;i:45287;i:212;i:45387;i:213;i:45435;i:214;i:45485;i:215;i:45533;i:216;i:45580;i:217;i:45633;i:218;i:45703;i:219;i:45756;i:220;i:47884;i:221;i:47945;}}i:1774032032;a:1:{s:4:\"INFO\";a:13:{i:222;i:48099;i:223;i:48178;i:224;i:48263;i:225;i:48352;i:226;i:48400;i:227;i:48450;i:228;i:48498;i:229;i:48545;i:230;i:48598;i:231;i:48670;i:232;i:48723;i:233;i:48874;i:234;i:48936;}}i:1774032033;a:1:{s:4:\"INFO\";a:13:{i:235;i:49090;i:236;i:49169;i:237;i:49254;i:238;i:49354;i:239;i:49402;i:240;i:49452;i:241;i:49500;i:242;i:49547;i:243;i:49600;i:244;i:49670;i:245;i:49723;i:246;i:51852;i:247;i:51913;}}i:1774032041;a:1:{s:4:\"INFO\";a:26:{i:248;i:52067;i:249;i:52146;i:250;i:52231;i:251;i:52320;i:252;i:52368;i:253;i:52418;i:254;i:52466;i:255;i:52513;i:256;i:52566;i:257;i:52640;i:258;i:52693;i:259;i:52844;i:260;i:52906;i:261;i:53060;i:262;i:53139;i:263;i:53224;i:264;i:53324;i:265;i:53372;i:266;i:53422;i:267;i:53470;i:268;i:53517;i:269;i:53570;i:270;i:53640;i:271;i:53693;i:272;i:55824;i:273;i:55883;}}i:1774032056;a:1:{s:4:\"INFO\";a:13:{i:274;i:56037;i:275;i:56116;i:276;i:56201;i:277;i:56290;i:278;i:56338;i:279;i:56388;i:280;i:56436;i:281;i:56483;i:282;i:56536;i:283;i:56609;i:284;i:56662;i:285;i:56921;i:286;i:56982;}}i:1774032058;a:1:{s:4:\"INFO\";a:13:{i:287;i:57136;i:288;i:57215;i:289;i:57300;i:290;i:57389;i:291;i:57437;i:292;i:57487;i:293;i:57535;i:294;i:57582;i:295;i:57635;i:296;i:57708;i:297;i:57761;i:298;i:58020;i:299;i:58081;}}i:1774032059;a:1:{s:4:\"INFO\";a:13:{i:300;i:58235;i:301;i:58314;i:302;i:58399;i:303;i:58488;i:304;i:58536;i:305;i:58586;i:306;i:58634;i:307;i:58681;i:308;i:58734;i:309;i:58807;i:310;i:58860;i:311;i:59119;i:312;i:59180;}}i:1774032060;a:1:{s:4:\"INFO\";a:13:{i:313;i:59334;i:314;i:59413;i:315;i:59498;i:316;i:59587;i:317;i:59635;i:318;i:59685;i:319;i:59733;i:320;i:59780;i:321;i:59833;i:322;i:59906;i:323;i:59959;i:324;i:60218;i:325;i:60279;}}i:1774032061;a:1:{s:4:\"INFO\";a:13:{i:326;i:60433;i:327;i:60512;i:328;i:60597;i:329;i:60686;i:330;i:60734;i:331;i:60784;i:332;i:60832;i:333;i:60879;i:334;i:60932;i:335;i:61005;i:336;i:61058;i:337;i:61317;i:338;i:61378;}}i:1774032343;a:1:{s:4:\"INFO\";a:13:{i:339;i:61532;i:340;i:61611;i:341;i:61696;i:342;i:61759;i:343;i:61807;i:344;i:61857;i:345;i:61905;i:346;i:61956;i:347;i:62106;i:348;i:62159;i:349;i:62212;i:350;i:62263;i:351;i:62325;}}i:1774032347;a:1:{s:4:\"INFO\";a:26:{i:352;i:62479;i:353;i:62558;i:354;i:62643;i:355;i:62717;i:356;i:62765;i:357;i:62815;i:358;i:62863;i:359;i:62914;i:360;i:63064;i:361;i:63117;i:362;i:63170;i:363;i:63221;i:364;i:63283;i:365;i:63437;i:366;i:63516;i:367;i:63601;i:368;i:63702;i:369;i:63750;i:370;i:63800;i:371;i:63848;i:372;i:63899;i:373;i:64049;i:374;i:64127;i:375;i:64180;i:376;i:66754;i:377;i:66815;}}i:1774032385;a:1:{s:4:\"INFO\";a:26:{i:0;i:37;i:1;i:116;i:2;i:201;i:3;i:286;i:4;i:335;i:5;i:385;i:6;i:433;i:7;i:480;i:8;i:533;i:9;i:622;i:10;i:675;i:11;i:826;i:12;i:888;i:13;i:1042;i:14;i:1121;i:15;i:1206;i:16;i:1306;i:17;i:1354;i:18;i:1404;i:19;i:1452;i:20;i:1499;i:21;i:1552;i:22;i:1622;i:23;i:1675;i:24;i:3908;i:25;i:3969;}}i:1774032390;a:1:{s:4:\"INFO\";a:26:{i:26;i:4123;i:27;i:4202;i:28;i:4287;i:29;i:4372;i:30;i:4421;i:31;i:4471;i:32;i:4519;i:33;i:4566;i:34;i:4619;i:35;i:4707;i:36;i:4760;i:37;i:4911;i:38;i:4973;i:39;i:5127;i:40;i:5206;i:41;i:5291;i:42;i:5391;i:43;i:5439;i:44;i:5489;i:45;i:5537;i:46;i:5584;i:47;i:5637;i:48;i:5707;i:49;i:5760;i:50;i:8094;i:51;i:8154;}}i:1774032396;a:1:{s:4:\"INFO\";a:26:{i:52;i:8308;i:53;i:8387;i:54;i:8472;i:55;i:8557;i:56;i:8606;i:57;i:8656;i:58;i:8704;i:59;i:8751;i:60;i:8804;i:61;i:8893;i:62;i:8946;i:63;i:9097;i:64;i:9159;i:65;i:9313;i:66;i:9392;i:67;i:9477;i:68;i:9577;i:69;i:9625;i:70;i:9675;i:71;i:9723;i:72;i:9770;i:73;i:9823;i:74;i:9893;i:75;i:9946;i:76;i:12382;i:77;i:12442;}}i:1774032429;a:1:{s:4:\"INFO\";a:39:{i:78;i:12596;i:79;i:12675;i:80;i:12760;i:81;i:12871;i:82;i:12919;i:83;i:12969;i:84;i:13017;i:85;i:13068;i:86;i:13218;i:87;i:13318;i:88;i:13371;i:89;i:13422;i:90;i:13483;i:91;i:13637;i:92;i:13716;i:93;i:13801;i:94;i:13902;i:95;i:13950;i:96;i:14000;i:97;i:14048;i:98;i:14099;i:99;i:14249;i:100;i:14327;i:101;i:14380;i:102;i:16952;i:103;i:17013;i:104;i:17167;i:105;i:17246;i:106;i:17331;i:107;i:17512;i:108;i:17560;i:109;i:17610;i:110;i:17658;i:111;i:17709;i:112;i:17859;i:113;i:18062;i:114;i:18115;i:115;i:46214;i:116;i:46276;}}i:1774032436;a:1:{s:4:\"INFO\";a:13:{i:117;i:46430;i:118;i:46509;i:119;i:46594;i:120;i:46782;i:121;i:46830;i:122;i:46880;i:123;i:46928;i:124;i:46979;i:125;i:47129;i:126;i:47349;i:127;i:47402;i:128;i:75536;i:129;i:75598;}}i:1774032447;a:1:{s:4:\"INFO\";a:13:{i:130;i:75752;i:131;i:75831;i:132;i:75916;i:133;i:76097;i:134;i:76145;i:135;i:76195;i:136;i:76243;i:137;i:76294;i:138;i:76444;i:139;i:76647;i:140;i:76700;i:141;i:177140;i:142;i:177202;}}i:1774032451;a:1:{s:4:\"INFO\";a:13:{i:143;i:177356;i:144;i:177435;i:145;i:177520;i:146;i:177708;i:147;i:177756;i:148;i:177806;i:149;i:177854;i:150;i:177905;i:151;i:178055;i:152;i:178275;i:153;i:178328;i:154;i:243946;i:155;i:244008;}}i:1774032453;a:1:{s:4:\"INFO\";a:13:{i:156;i:244162;i:157;i:244241;i:158;i:244326;i:159;i:244514;i:160;i:244562;i:161;i:244612;i:162;i:244660;i:163;i:244711;i:164;i:244861;i:165;i:245081;i:166;i:245134;i:167;i:273182;i:168;i:273244;}}i:1774032456;a:1:{s:4:\"INFO\";a:13:{i:169;i:273398;i:170;i:273477;i:171;i:273562;i:172;i:273750;i:173;i:273798;i:174;i:273848;i:175;i:273896;i:176;i:273947;i:177;i:274097;i:178;i:274317;i:179;i:274370;i:180;i:302583;i:181;i:302645;}}i:1774032457;a:1:{s:4:\"INFO\";a:13:{i:182;i:302799;i:183;i:302878;i:184;i:302963;i:185;i:303152;i:186;i:303200;i:187;i:303250;i:188;i:303298;i:189;i:303349;i:190;i:303499;i:191;i:303720;i:192;i:303773;i:193;i:328175;i:194;i:328237;}}i:1774032461;a:1:{s:4:\"INFO\";a:13:{i:195;i:328391;i:196;i:328470;i:197;i:328555;i:198;i:328744;i:199;i:328792;i:200;i:328842;i:201;i:328890;i:202;i:328941;i:203;i:329091;i:204;i:329312;i:205;i:329365;i:206;i:353766;i:207;i:353827;}}i:1774032463;a:1:{s:4:\"INFO\";a:13:{i:208;i:353981;i:209;i:354060;i:210;i:354145;i:211;i:354334;i:212;i:354382;i:213;i:354432;i:214;i:354480;i:215;i:354531;i:216;i:354681;i:217;i:354902;i:218;i:354955;i:219;i:379372;i:220;i:379434;}}i:1774032466;a:1:{s:4:\"INFO\";a:13:{i:221;i:379588;i:222;i:379667;i:223;i:379752;i:224;i:379940;i:225;i:379988;i:226;i:380038;i:227;i:380086;i:228;i:380137;i:229;i:380287;i:230;i:380507;i:231;i:380560;i:232;i:476726;i:233;i:476788;}}}', 1774637273),
('laravel-cache-lv:v3.24.0:file:97e36b74-laravel-2026-03-20.log:ecf8427e:metadata', 'a:9:{s:5:\"query\";s:0:\"\";s:10:\"identifier\";s:8:\"ecf8427e\";s:26:\"last_scanned_file_position\";i:476905;s:18:\"last_scanned_index\";i:234;s:24:\"next_log_index_to_create\";i:234;s:14:\"max_chunk_size\";i:50000;s:19:\"current_chunk_index\";i:0;s:17:\"chunk_definitions\";a:0:{}s:24:\"current_chunk_definition\";a:5:{s:5:\"index\";i:0;s:4:\"size\";i:612;s:18:\"earliest_timestamp\";i:1774031102;s:16:\"latest_timestamp\";i:1774032466;s:12:\"level_counts\";a:2:{s:5:\"ERROR\";i:1;s:4:\"INFO\";i:611;}}}', 1774637273),
('laravel-cache-lv:v3.24.0:file:97e36b74-laravel-2026-03-20.log:metadata', 'a:8:{s:4:\"type\";s:7:\"laravel\";s:4:\"name\";s:22:\"laravel-2026-03-20.log\";s:4:\"path\";s:82:\"/home/victor/Documents/Project/corebanking-api/storage/logs/laravel-2026-03-20.log\";s:4:\"size\";i:659180;s:18:\"earliest_timestamp\";i:1774031102;s:16:\"latest_timestamp\";i:1774032473;s:26:\"last_scanned_file_position\";i:659180;s:15:\"related_indices\";a:2:{s:8:\"ecf8427e\";a:2:{s:5:\"query\";s:0:\"\";s:26:\"last_scanned_file_position\";i:476905;}s:8:\"de68e687\";a:2:{s:5:\"query\";s:9:\"~nn3ok~iu\";s:26:\"last_scanned_file_position\";i:659180;}}}', 1774637307),
('laravel-cache-lv:v3.24.0:file:b9466e7d-laravel.log:metadata', 'a:1:{s:4:\"type\";s:7:\"laravel\";}', 1774637147);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_buy` decimal(15,6) DEFAULT NULL,
  `rate_sell` decimal(15,6) DEFAULT NULL,
  `exchange_rate` decimal(15,6) NOT NULL DEFAULT '1.000000',
  `is_base_currency` tinyint(1) NOT NULL DEFAULT '0',
  `status` enum('pending','active','inactive','disabled','deleted') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `accountofficer_id` bigint UNSIGNED DEFAULT NULL,
  `customer_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_type` enum('individual','corporate','merchant','government','ngo','agent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'individual',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_address` text COLLATE utf8mb4_unicode_ci,
  `office_address` text COLLATE utf8mb4_unicode_ci,
  `lga` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `working_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bvn` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pep` tinyint(1) NOT NULL DEFAULT '0',
  `tier` tinyint NOT NULL DEFAULT '1',
  `id_verified` tinyint(1) NOT NULL DEFAULT '0',
  `face_verified` tinyint(1) NOT NULL DEFAULT '0',
  `utility_verified` tinyint(1) NOT NULL DEFAULT '0',
  `tier_upgraded_at` timestamp NULL DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '3b061d99-8406-4275-a641-fb019f6f59e4', 'database', 'default', '{\"uuid\":\"3b061d99-8406-4275-a641-fb019f6f59e4\",\"displayName\":\"App\\\\Mail\\\\CoreBankMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"deleteWhenMissingModels\":false,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:21:\\\"App\\\\Mail\\\\CoreBankMail\\\":6:{s:11:\\\"subjectLine\\\";s:15:\\\"Account Created\\\";s:7:\\\"content\\\";s:207:\\\"\\n<p>Your account has been successfully created.<\\/p>\\n\\n<p><strong>Username:<\\/strong> umaelliott<\\/p>\\n<p><strong>Email:<\\/strong> reloc@mailinator.com<\\/p>\\n\\n<p>Please login and change your password. Pa$$w0rd!<\\/p>\\n\\\";s:4:\\\"name\\\";s:3:\\\"Uma\\\";s:5:\\\"files\\\";a:0:{}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:20:\\\"reloc@mailinator.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\",\"batchId\":null},\"createdAt\":1774009830,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"127.0.0.1:1025\": stream_socket_client(): Unable to connect to 127.0.0.1:1025 (Connection refused) in /home/victor/Documents/Project/corebanking-api/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}()\n#1 /home/victor/Documents/Project/corebanking-api/vendor/symfony/mailer/Transport/Smtp/Stream/SocketStream.php(157): stream_socket_client()\n#2 /home/victor/Documents/Project/corebanking-api/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(268): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 /home/victor/Documents/Project/corebanking-api/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(200): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 /home/victor/Documents/Project/corebanking-api/vendor/symfony/mailer/Transport/AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend()\n#5 /home/victor/Documents/Project/corebanking-api/vendor/symfony/mailer/Transport/Smtp/SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send()\n#6 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send()\n#7 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage()\n#8 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(207): Illuminate\\Mail\\Mailer->send()\n#9 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#10 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale()\n#11 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Mail/SendQueuedMailable.php(89): Illuminate\\Mail\\Mailable->send()\n#12 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle()\n#13 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#15 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#16 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call()\n#17 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(135): Illuminate\\Container\\Container->call()\n#18 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#19 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(139): Illuminate\\Pipeline\\Pipeline->then()\n#21 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#22 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#23 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then()\n#25 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#26 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call()\n#27 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(435): Illuminate\\Queue\\Worker->process()\n#29 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(201): Illuminate\\Queue\\Worker->runJob()\n#30 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon()\n#31 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#32 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#34 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure()\n#35 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#36 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Container/Container.php(799): Illuminate\\Container\\BoundMethod::call()\n#37 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(273): Illuminate\\Container\\Container->call()\n#38 /home/victor/Documents/Project/corebanking-api/vendor/symfony/console/Command/Command.php(341): Illuminate\\Console\\Command->execute()\n#39 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Console/Command.php(242): Symfony\\Component\\Console\\Command\\Command->run()\n#40 /home/victor/Documents/Project/corebanking-api/vendor/symfony/console/Application.php(1117): Illuminate\\Console\\Command->run()\n#41 /home/victor/Documents/Project/corebanking-api/vendor/symfony/console/Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand()\n#42 /home/victor/Documents/Project/corebanking-api/vendor/symfony/console/Application.php(195): Symfony\\Component\\Console\\Application->doRun()\n#43 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(198): Symfony\\Component\\Console\\Application->run()\n#44 /home/victor/Documents/Project/corebanking-api/vendor/laravel/framework/src/Illuminate/Foundation/Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle()\n#45 /home/victor/Documents/Project/corebanking-api/artisan(16): Illuminate\\Foundation\\Application->handleCommand()\n#46 {main}', '2026-03-20 16:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
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
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_00_000000_create_cache_table', 1),
(2, '0001_01_00_000000_create_permission_tables', 1),
(3, '0001_01_01_000000_create_branches_table', 1),
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000002_create_jobs_table', 1),
(6, '2026_03_11_210323_create_personal_access_tokens_table', 1),
(7, '2026_03_11_221642_create_audit_trails_table', 1),
(8, '2026_03_11_221843_create_account_officers_table', 1),
(9, '2026_03_12_004726_create_customers_table', 1),
(10, '2026_03_12_004727_create_currencies_table', 1),
(11, '2026_03_12_011638_create_account_categories_table', 1),
(12, '2026_03_12_011712_create_account_types_table', 1),
(13, '2026_03_12_011751_create_account_products_table', 1),
(14, '2026_03_12_012114_create_accounts_table', 1),
(15, '2026_03_14_090551_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'testing_tool', 'user', '2026-03-20 07:38:52', '2026-03-20 17:39:02'),
(2, 'delete_account', 'user', '2026-03-20 07:38:52', '2026-03-20 07:38:52'),
(3, 'edit_account', 'user', '2026-03-20 07:38:52', '2026-03-20 07:38:52'),
(5, 'update_settings', 'user', '2026-03-20 07:48:22', '2026-03-20 07:48:22'),
(6, 'add_settings', 'user', '2026-03-20 17:12:51', '2026-03-20 17:12:51'),
(7, 'victor', 'user', '2026-03-20 17:16:17', '2026-03-20 17:16:17'),
(8, 'existing', 'user', '2026-03-20 17:19:26', '2026-03-20 17:35:51'),
(9, 'create_people', 'user', '2026-03-20 17:20:14', '2026-03-20 17:27:34'),
(11, 'john', 'user', '2026-03-20 17:34:45', '2026-03-20 17:34:45'),
(12, 'nn3ok', 'user', '2026-03-20 17:37:19', '2026-03-20 17:40:41'),
(13, 'debitis_aperiam_tota', 'user', '2026-03-20 17:46:24', '2026-03-20 17:46:24'),
(14, 'quia_et_saepe_vitae', 'user', '2026-03-20 17:46:30', '2026-03-20 17:46:30'),
(15, 'voluptas_et_asperior', 'user', '2026-03-20 17:46:36', '2026-03-20 17:46:36');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'user-token', 'a9a607e451de2e6358a0b6044db09e18ec41afcef108aef326aa943d2d7605cf', '[\"*\"]', NULL, NULL, '2026-03-20 07:47:26', '2026-03-20 07:47:26'),
(3, 'App\\Models\\User', 1, 'user-token', '22c4f279d82d8ef6111dc57455e6afa6f1ce233e9fcd49d246c9e9194f80e90d', '[\"*\"]', '2026-03-20 07:49:52', NULL, '2026-03-20 07:47:33', '2026-03-20 07:49:52'),
(6, 'App\\Models\\User', 1, 'user-token', 'cc53a47544ab9235321a20bdedf6f99ea4b38f6d4586c34b0f7d59ad24fc8828', '[\"*\"]', '2026-03-20 11:36:08', NULL, '2026-03-20 09:46:45', '2026-03-20 11:36:08'),
(8, 'App\\Models\\User', 1, 'user-token', '5c44476976a7afa208537850b7410dd9beab23255ec95c749f3170fbbc19d0f7', '[\"*\"]', '2026-03-20 16:43:55', NULL, '2026-03-20 13:32:57', '2026-03-20 16:43:55'),
(9, 'App\\Models\\User', 1, 'user-token', '894cae8e0932c84c008f461d5681d8475f91e514c4a356eb99fa8a0828649e9d', '[\"*\"]', '2026-03-20 15:44:20', NULL, '2026-03-20 15:19:23', '2026-03-20 15:44:20'),
(10, 'App\\Models\\User', 1, 'user-token', '0b9f4d174e06c4ac9a93dcd00d9f80ba540fe991dfc9ef109a0cb9b763f6066b', '[\"*\"]', NULL, NULL, '2026-03-20 15:46:30', '2026-03-20 15:46:30'),
(12, 'App\\Models\\User', 1, 'user-token', 'c6dee48a324542b3e88902700bf0ba8f04db5796dd7222f372e5ee0c753d1466', '[\"*\"]', '2026-03-20 16:20:15', NULL, '2026-03-20 16:19:59', '2026-03-20 16:20:15'),
(13, 'App\\Models\\User', 1, 'user-token', 'b49e12c6c2f17093d5d58256b8793c1ae90e583a14086b0a0fecc2b00a2da6b2', '[\"*\"]', '2026-03-20 17:27:34', NULL, '2026-03-20 17:12:00', '2026-03-20 17:27:34'),
(15, 'App\\Models\\User', 1, 'user-token', 'bcf74e948318c453d332b2a250438a9a01481c743e4a048e9c20f562488df63c', '[\"*\"]', '2026-03-23 07:34:28', NULL, '2026-03-20 20:35:39', '2026-03-23 07:34:28'),
(16, 'App\\Models\\User', 1, 'user-token', '9a4a1e6489202d400ecb6e9d8904e73093f9485131ebcdc130d3559bfb4922f5', '[\"*\"]', NULL, NULL, '2026-03-20 21:20:30', '2026-03-20 21:20:30'),
(17, 'App\\Models\\User', 1, 'user-token', '26a90e3f5eaebb6afe3536919349d3014a4e81d040ead7a1c33c87cf73d33e2d', '[\"*\"]', '2026-03-21 11:08:12', NULL, '2026-03-21 07:27:09', '2026-03-21 11:08:12'),
(19, 'App\\Models\\User', 1, 'user-token', 'ae8ec3aad0fb4072cfd82ca7c59f52d5675ffa9f593ef78b12b7a2228d9f1315', '[\"*\"]', '2026-03-23 08:02:16', NULL, '2026-03-21 21:36:18', '2026-03-23 08:02:16'),
(20, 'App\\Models\\User', 1, 'user-token', 'e8e613928ffb4b768c0b09451bf37a791e124a076671f1dfcf3524fd1330400b', '[\"*\"]', '2026-03-23 07:35:02', NULL, '2026-03-23 07:34:28', '2026-03-23 07:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'user', '2026-03-20 07:38:52', '2026-03-20 14:06:11'),
(2, 'admin', 'user', '2026-03-20 07:38:52', '2026-03-20 13:33:49'),
(3, 'supervisor', 'user', '2026-03-20 07:38:52', '2026-03-20 07:38:52'),
(4, 'it_officer', 'user', '2026-03-20 15:20:09', '2026-03-20 15:20:09'),
(5, 'it_officers', 'user', '2026-03-20 15:38:17', '2026-03-20 15:38:17');

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
(5, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4),
(5, 4),
(1, 5),
(2, 5),
(3, 5),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('akZwwXmzGMtdvt6KjwnWWiVfIA2JxgG0SJdk7grU', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHpacDk0Qlh5U1dOa1dJWU92eW1MSExGZXFVODEzc1V6VEFBWWNGcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774262222),
('dTd8q4sRMnFwBaxix6ESFKsgYHoJOzz62WdVv7xJ', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjQyWVlXSzVhVklxeGhJRG5UNVJUVHRPSXVkaWJObXg3UkZEWU4wMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774081970),
('GvpfQAnBSsrxdCuMJfsYp5edLPQ95YzkA2UcwgRE', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGh0elhIZ3dTaldoaHlYWWlpdEhoV2JmOHBKeVZ2TTRZRnVIT3d4ayI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1774254668),
('MJUIpPpdNv6rfXQOsdYgUjcESJJ7z30wnUIbgJQZ', NULL, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNGo0ZmdpM1FLT1M5WndQNnRORDhqeVdBWk1Ca2dkUlBOVnVQNFFlQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2ctdmlld2VyP2ZpbGU9OTdlMzZiNzQtbGFyYXZlbC0yMDI2LTAzLTIwLmxvZyI7czo1OiJyb3V0ZSI7czoxNjoibG9nLXZpZXdlci5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzE6ImxvZy12aWV3ZXI6c2hvcnRlci1zdGFjay10cmFjZXMiO2I6MDt9', 1774032507);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `setting_group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_key`, `setting_value`, `created_at`, `updated_at`) VALUES
(1, 'company', 'company_name', 'AssetMatrix MFB', NULL, NULL),
(2, 'company', 'company_logo', 'settings/kxFCunzo5XKTEzxosw6d.png', NULL, '2026-03-20 08:10:55'),
(3, 'company', 'company_share', '200000000', NULL, NULL),
(4, 'company', 'company_capital', '112350552.04', NULL, NULL),
(5, 'company', 'company_address', 'Ibadan', NULL, NULL),
(6, 'company', 'company_currency', 'NGN', NULL, NULL),
(7, 'company', 'company_country', 'Nigeria', NULL, NULL),
(8, 'company', 'company_email', 'info@cba.assetmatrixmfb.com', NULL, NULL),
(9, 'company', 'company_phone', '080', NULL, NULL),
(10, 'system', 'system_version', '1.0', NULL, NULL),
(11, 'system', 'bank_fund', '0', NULL, NULL),
(12, 'system', 'enable_cron', '1', NULL, NULL),
(13, 'accounts', 'till_account', '10923392', NULL, NULL),
(14, 'accounts', 'vault_account', '10373391', NULL, NULL),
(15, 'accounts', 'company_account', '10997918', NULL, NULL),
(16, 'sms', 'sms_enabled', '1', NULL, NULL),
(17, 'sms', 'active_sms', 'termii', NULL, NULL),
(18, 'sms', 'sms_public_key', 'TLLOIHNInhqZtTKUhSdeBIgdGbPKGFiPjaaZTWzEqEyVEyCvSRTTbcVOsQZVqS', NULL, NULL),
(19, 'sms', 'sms_secret_key', NULL, NULL, NULL),
(20, 'sms', 'sms_baseurl', 'https://v3.api.termii.com/api/', NULL, NULL),
(21, 'sms', 'sms_sender', 'AssetMatrix MFB', NULL, NULL),
(22, 'payment', 'payment_gateway', 'Flutterwave', NULL, NULL),
(23, 'payment', 'gateway_pub_key', 'FLWPUBK-7e29638573271bd98b7a8ff83c31a6c7-', NULL, NULL),
(24, 'payment', 'gateway_secret_key', 'FLWSECK-48901f50145a4f75549013bdaf5c289f-189fe7889d9vt-', NULL, NULL),
(25, 'limits', 'deposit_limit', '500', NULL, NULL),
(26, 'limits', 'withdrawal_limit', '500', NULL, NULL),
(27, 'limits', 'stamp_duty', '50', NULL, NULL),
(28, 'limits', 'savings_account_interest_rate', '3.5', NULL, NULL),
(29, 'limits', 'savings_account_transfer_limit_per_month', '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','pending','inactive','blocked','deleted','disabled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google2fa_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `branch_id`, `role_id`, `first_name`, `last_name`, `photo`, `middle_name`, `username`, `password`, `status`, `email`, `email_verified_at`, `phone`, `gender`, `address`, `city`, `state`, `country`, `last_login`, `google2fa_secret`, `two_factor_enabled`, `two_factor_confirmed_at`, `created_by`, `updated_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Victor', 'David', NULL, NULL, 'victor', '$2y$12$7ghqfiRU3dS3/4DboisvGuI42tUxofwUSgM4FU3ri9aUai47w25RO', 'active', 'victor@example.com', '2026-03-20 07:38:52', '07033274155', 'male', NULL, 'Lagos', 'Lagos', 'Nigeria', '2026-03-23 08:34:28', NULL, 0, NULL, NULL, NULL, NULL, '2026-03-20 07:38:52', '2026-03-23 07:34:28'),
(2, 1, NULL, 'Victor', 'Water', 'users/photos/AbSoM2QZiQPnOUpQTJcYOa3kCY2wFPj8aBd5hAxt.png', NULL, 'vannayork', '$2y$12$HfsMN7.vargOadDS4/WS4efHlzBGFJLxU76gWBmMVae7x1LKUm7jC', 'active', 'rejoxulota@mailinator.com', NULL, '13788878927', 'male', '39 Aina street, Ojudo', 'Lagos', 'Edo', NULL, NULL, NULL, 0, NULL, 'victor', 'victor', NULL, '2026-03-20 07:58:51', '2026-03-20 10:22:11'),
(3, 1, NULL, 'Uma', 'Elliott', 'users/photos/1T65lSnDMp3pGNofJcYO21ybEF6YSV98WHWLNqHP.png', NULL, 'umaelliott', '$2y$12$mEZnlPtVwRz6iGL0X2O5SuqENLAosWZEfOv2PgVbpXIV1RGIWWx5y', 'active', 'reloc@mailinator.com', NULL, '14085651063', 'female', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 'victor', NULL, NULL, '2026-03-20 11:30:30', '2026-03-20 11:30:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_account_number_unique` (`account_number`),
  ADD KEY `accounts_customer_id_foreign` (`customer_id`),
  ADD KEY `accounts_branch_id_foreign` (`branch_id`),
  ADD KEY `accounts_account_product_id_foreign` (`account_product_id`),
  ADD KEY `accounts_account_type_id_foreign` (`account_type_id`),
  ADD KEY `accounts_currency_id_foreign` (`currency_id`),
  ADD KEY `accounts_customer_number_index` (`customer_number`),
  ADD KEY `accounts_tier_index` (`tier`);

--
-- Indexes for table `account_categories`
--
ALTER TABLE `account_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_categories_code_unique` (`code`),
  ADD KEY `account_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `account_officers`
--
ALTER TABLE `account_officers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_officers_email_unique` (`email`),
  ADD UNIQUE KEY `account_officers_phone_unique` (`phone`),
  ADD UNIQUE KEY `account_officers_code_unique` (`code`),
  ADD KEY `account_officers_user_id_foreign` (`user_id`),
  ADD KEY `account_officers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `account_products`
--
ALTER TABLE `account_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_products_code_unique` (`code`),
  ADD KEY `account_products_user_id_foreign` (`user_id`),
  ADD KEY `account_products_account_category_id_foreign` (`account_category_id`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_types_code_unique` (`code`),
  ADD KEY `account_types_user_id_foreign` (`user_id`);

--
-- Indexes for table `audit_trails`
--
ALTER TABLE `audit_trails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_trails_branch_id_index` (`branch_id`),
  ADD KEY `audit_trails_performed_by_type_performed_by_id_index` (`performed_by_type`,`performed_by_id`),
  ADD KEY `audit_trails_module_index` (`module`),
  ADD KEY `audit_trails_actions_index` (`actions`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_code_unique` (`code`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_customer_number_unique` (`customer_number`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_username_unique` (`username`),
  ADD UNIQUE KEY `customers_bvn_unique` (`bvn`),
  ADD UNIQUE KEY `customers_nin_unique` (`nin`),
  ADD UNIQUE KEY `customers_tin_unique` (`tin`),
  ADD KEY `customers_user_id_foreign` (`user_id`),
  ADD KEY `customers_branch_id_foreign` (`branch_id`),
  ADD KEY `customers_accountofficer_id_foreign` (`accountofficer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_available_at_index` (`queue`,`reserved_at`,`available_at`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

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
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_setting_key_unique` (`setting_key`),
  ADD KEY `settings_setting_group_index` (`setting_group`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_branch_id_foreign` (`branch_id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_categories`
--
ALTER TABLE `account_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_officers`
--
ALTER TABLE `account_officers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `account_products`
--
ALTER TABLE `account_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_trails`
--
ALTER TABLE `audit_trails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_account_product_id_foreign` FOREIGN KEY (`account_product_id`) REFERENCES `account_products` (`id`),
  ADD CONSTRAINT `accounts_account_type_id_foreign` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`),
  ADD CONSTRAINT `accounts_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `accounts_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `account_categories`
--
ALTER TABLE `account_categories`
  ADD CONSTRAINT `account_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `account_officers`
--
ALTER TABLE `account_officers`
  ADD CONSTRAINT `account_officers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_officers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `account_products`
--
ALTER TABLE `account_products`
  ADD CONSTRAINT `account_products_account_category_id_foreign` FOREIGN KEY (`account_category_id`) REFERENCES `account_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `account_types`
--
ALTER TABLE `account_types`
  ADD CONSTRAINT `account_types_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_accountofficer_id_foreign` FOREIGN KEY (`accountofficer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `customers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
