-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 31, 2024 at 06:03 AM
-- Server version: 8.0.35-0ubuntu0.22.04.1
-- PHP Version: 8.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ameemca2`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_balance`
--

CREATE TABLE `account_balance` (
  `id` bigint UNSIGNED NOT NULL,
  `staffid` int NOT NULL,
  `balance` decimal(13,2) NOT NULL,
  `time` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_featured_forums`
--

CREATE TABLE `amc_featured_forums` (
  `id` bigint UNSIGNED NOT NULL,
  `forum_id` bigint UNSIGNED NOT NULL,
  `priority` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_forums`
--

CREATE TABLE `amc_forums` (
  `id` bigint UNSIGNED NOT NULL,
  `forum_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `forum_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_desc` text COLLATE utf8mb4_unicode_ci,
  `forum_package` enum('0','1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `privacy` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `forum_status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_forum_posts`
--

CREATE TABLE `amc_forum_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_thumb` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_forum_post_replies`
--

CREATE TABLE `amc_forum_post_replies` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reply_body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_forum_report`
--

CREATE TABLE `amc_forum_report` (
  `id` bigint UNSIGNED NOT NULL,
  `forum_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `report_status` enum('acknowledged','reviewed','discarded') COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_status_review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_forum_report_attachments`
--

CREATE TABLE `amc_forum_report_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `report_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attachment_type` enum('image','video','audio','document','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `attachment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_forum_subscribers`
--

CREATE TABLE `amc_forum_subscribers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `forum_id` bigint UNSIGNED NOT NULL,
  `subscribtion` enum('posts','popular','everything') COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribe_message` text COLLATE utf8mb4_unicode_ci,
  `status` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_forum_topics`
--

CREATE TABLE `amc_forum_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `forum_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `privacy` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_post_attachments`
--

CREATE TABLE `amc_post_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attachment_type` enum('image','video','audio','document','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `attachment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_reply_attachments`
--

CREATE TABLE `amc_reply_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `reply_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attachment_type` enum('image','video','audio','document','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `attachment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_reply_report`
--

CREATE TABLE `amc_reply_report` (
  `id` bigint UNSIGNED NOT NULL,
  `reply_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `report_status` enum('acknowledged','reviewed','discarded') COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_status_review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_reply_report_attachments`
--

CREATE TABLE `amc_reply_report_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `report_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attachment_type` enum('image','video','audio','document','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `attachment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_topic_report`
--

CREATE TABLE `amc_topic_report` (
  `id` bigint UNSIGNED NOT NULL,
  `topic_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `report_status` enum('acknowledged','reviewed','discarded') COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_status_review` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amc_topic_report_attachments`
--

CREATE TABLE `amc_topic_report_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `report_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `attachment_type` enum('image','video','audio','document','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `attachment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_from` bigint UNSIGNED NOT NULL,
  `chat_to` bigint UNSIGNED NOT NULL,
  `chat_status` enum('sent','delivered','read') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivered',
  `chat_type` enum('text','attachment','quote') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_attachments`
--

CREATE TABLE `chat_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `chat_id` bigint UNSIGNED NOT NULL,
  `chat_from` bigint UNSIGNED NOT NULL,
  `chat_to` bigint UNSIGNED NOT NULL,
  `attachment_status` enum('sent','delivered','read') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivered',
  `attachment_type` enum('image','video','audio','document','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file',
  `attachment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `investment` decimal(13,2) NOT NULL,
  `roi` decimal(13,2) NOT NULL,
  `batch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_17_152310_create_support_tickets_table', 1),
(5, '2024_05_17_170653_create_personal_access_tokens_table', 1),
(6, '2024_05_23_113531_create_chats_table', 1),
(7, '2024_05_23_230023_create_forums_table', 1),
(8, '2024_05_29_095921_investments', 1),
(9, '2024_05_29_104249_create_account_balance', 1);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `support_message_id` bigint UNSIGNED NOT NULL,
  `attachment_type` enum('document','image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `ticket_ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `priority` tinyint NOT NULL DEFAULT '1',
  `last_reply` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `staffid` int NOT NULL,
  `user_type` bigint UNSIGNED NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `second_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci,
  `agency_bureau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_post` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_number` int NOT NULL,
  `allotment_amount` decimal(8,2) NOT NULL,
  `allotment_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `allotment_file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_fee` decimal(8,2) NOT NULL,
  `date_of_employment` date NOT NULL,
  `code` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package` int NOT NULL,
  `nokgender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nokphone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nokfname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noklname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nokemail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nokstate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nokcountry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nokaddress` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` enum('president','finsec','treasurer','gensec') COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_balance`
--
ALTER TABLE `account_balance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amc_featured_forums`
--
ALTER TABLE `amc_featured_forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_featured_forums_forum_id_foreign` (`forum_id`);

--
-- Indexes for table `amc_forums`
--
ALTER TABLE `amc_forums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_forums_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_forum_posts`
--
ALTER TABLE `amc_forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_forum_posts_topic_id_foreign` (`topic_id`),
  ADD KEY `amc_forum_posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_forum_post_replies`
--
ALTER TABLE `amc_forum_post_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_forum_post_replies_post_id_foreign` (`post_id`),
  ADD KEY `amc_forum_post_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_forum_report`
--
ALTER TABLE `amc_forum_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_forum_report_forum_id_foreign` (`forum_id`),
  ADD KEY `amc_forum_report_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_forum_report_attachments`
--
ALTER TABLE `amc_forum_report_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_forum_report_attachments_report_id_foreign` (`report_id`),
  ADD KEY `amc_forum_report_attachments_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_forum_subscribers`
--
ALTER TABLE `amc_forum_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_forum_subscribers_user_id_foreign` (`user_id`),
  ADD KEY `amc_forum_subscribers_forum_id_foreign` (`forum_id`);

--
-- Indexes for table `amc_forum_topics`
--
ALTER TABLE `amc_forum_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_forum_topics_forum_id_foreign` (`forum_id`),
  ADD KEY `amc_forum_topics_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_post_attachments`
--
ALTER TABLE `amc_post_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_post_attachments_post_id_foreign` (`post_id`),
  ADD KEY `amc_post_attachments_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_reply_attachments`
--
ALTER TABLE `amc_reply_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_reply_attachments_reply_id_foreign` (`reply_id`),
  ADD KEY `amc_reply_attachments_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_reply_report`
--
ALTER TABLE `amc_reply_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_reply_report_reply_id_foreign` (`reply_id`),
  ADD KEY `amc_reply_report_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_reply_report_attachments`
--
ALTER TABLE `amc_reply_report_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_reply_report_attachments_report_id_foreign` (`report_id`),
  ADD KEY `amc_reply_report_attachments_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_topic_report`
--
ALTER TABLE `amc_topic_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_topic_report_topic_id_foreign` (`topic_id`),
  ADD KEY `amc_topic_report_user_id_foreign` (`user_id`);

--
-- Indexes for table `amc_topic_report_attachments`
--
ALTER TABLE `amc_topic_report_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `amc_topic_report_attachments_report_id_foreign` (`report_id`),
  ADD KEY `amc_topic_report_attachments_user_id_foreign` (`user_id`);

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
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_chat_from_foreign` (`chat_from`),
  ADD KEY `chats_chat_to_foreign` (`chat_to`);

--
-- Indexes for table `chat_attachments`
--
ALTER TABLE `chat_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_attachments_chat_id_foreign` (`chat_id`),
  ADD KEY `chat_attachments_chat_from_foreign` (`chat_from`),
  ADD KEY `chat_attachments_chat_to_foreign` (`chat_to`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `investments_user_id_foreign` (`user_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_attachments_support_message_id_foreign` (`support_message_id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_messages_support_ticket_id_foreign` (`support_ticket_id`),
  ADD KEY `support_messages_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_staffid_unique` (`staffid`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_secondary_email_unique` (`secondary_email`),
  ADD UNIQUE KEY `users_nokemail_unique` (`nokemail`),
  ADD KEY `users_user_type_foreign` (`user_type`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_balance`
--
ALTER TABLE `account_balance`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_featured_forums`
--
ALTER TABLE `amc_featured_forums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_forums`
--
ALTER TABLE `amc_forums`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_forum_posts`
--
ALTER TABLE `amc_forum_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_forum_post_replies`
--
ALTER TABLE `amc_forum_post_replies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_forum_report`
--
ALTER TABLE `amc_forum_report`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_forum_report_attachments`
--
ALTER TABLE `amc_forum_report_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_forum_subscribers`
--
ALTER TABLE `amc_forum_subscribers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_forum_topics`
--
ALTER TABLE `amc_forum_topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_post_attachments`
--
ALTER TABLE `amc_post_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_reply_attachments`
--
ALTER TABLE `amc_reply_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_reply_report`
--
ALTER TABLE `amc_reply_report`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_reply_report_attachments`
--
ALTER TABLE `amc_reply_report_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_topic_report`
--
ALTER TABLE `amc_topic_report`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amc_topic_report_attachments`
--
ALTER TABLE `amc_topic_report_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_attachments`
--
ALTER TABLE `chat_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `amc_featured_forums`
--
ALTER TABLE `amc_featured_forums`
  ADD CONSTRAINT `amc_featured_forums_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `amc_forums` (`id`);

--
-- Constraints for table `amc_forums`
--
ALTER TABLE `amc_forums`
  ADD CONSTRAINT `amc_forums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_forum_posts`
--
ALTER TABLE `amc_forum_posts`
  ADD CONSTRAINT `amc_forum_posts_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `amc_forum_topics` (`id`),
  ADD CONSTRAINT `amc_forum_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_forum_post_replies`
--
ALTER TABLE `amc_forum_post_replies`
  ADD CONSTRAINT `amc_forum_post_replies_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `amc_forum_posts` (`id`),
  ADD CONSTRAINT `amc_forum_post_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_forum_report`
--
ALTER TABLE `amc_forum_report`
  ADD CONSTRAINT `amc_forum_report_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `amc_forums` (`id`),
  ADD CONSTRAINT `amc_forum_report_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_forum_report_attachments`
--
ALTER TABLE `amc_forum_report_attachments`
  ADD CONSTRAINT `amc_forum_report_attachments_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `amc_forum_report` (`id`),
  ADD CONSTRAINT `amc_forum_report_attachments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_forum_subscribers`
--
ALTER TABLE `amc_forum_subscribers`
  ADD CONSTRAINT `amc_forum_subscribers_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `amc_forums` (`id`),
  ADD CONSTRAINT `amc_forum_subscribers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_forum_topics`
--
ALTER TABLE `amc_forum_topics`
  ADD CONSTRAINT `amc_forum_topics_forum_id_foreign` FOREIGN KEY (`forum_id`) REFERENCES `amc_forums` (`id`),
  ADD CONSTRAINT `amc_forum_topics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_post_attachments`
--
ALTER TABLE `amc_post_attachments`
  ADD CONSTRAINT `amc_post_attachments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `amc_forum_posts` (`id`),
  ADD CONSTRAINT `amc_post_attachments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_reply_attachments`
--
ALTER TABLE `amc_reply_attachments`
  ADD CONSTRAINT `amc_reply_attachments_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `amc_forum_post_replies` (`id`),
  ADD CONSTRAINT `amc_reply_attachments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_reply_report`
--
ALTER TABLE `amc_reply_report`
  ADD CONSTRAINT `amc_reply_report_reply_id_foreign` FOREIGN KEY (`reply_id`) REFERENCES `amc_forum_post_replies` (`id`),
  ADD CONSTRAINT `amc_reply_report_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_reply_report_attachments`
--
ALTER TABLE `amc_reply_report_attachments`
  ADD CONSTRAINT `amc_reply_report_attachments_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `amc_reply_report` (`id`),
  ADD CONSTRAINT `amc_reply_report_attachments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_topic_report`
--
ALTER TABLE `amc_topic_report`
  ADD CONSTRAINT `amc_topic_report_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `amc_forum_topics` (`id`),
  ADD CONSTRAINT `amc_topic_report_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `amc_topic_report_attachments`
--
ALTER TABLE `amc_topic_report_attachments`
  ADD CONSTRAINT `amc_topic_report_attachments_report_id_foreign` FOREIGN KEY (`report_id`) REFERENCES `amc_topic_report` (`id`),
  ADD CONSTRAINT `amc_topic_report_attachments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_chat_from_foreign` FOREIGN KEY (`chat_from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_chat_to_foreign` FOREIGN KEY (`chat_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_attachments`
--
ALTER TABLE `chat_attachments`
  ADD CONSTRAINT `chat_attachments_chat_from_foreign` FOREIGN KEY (`chat_from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_attachments_chat_id_foreign` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`),
  ADD CONSTRAINT `chat_attachments_chat_to_foreign` FOREIGN KEY (`chat_to`) REFERENCES `users` (`id`);

--
-- Constraints for table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `investments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD CONSTRAINT `support_attachments_support_message_id_foreign` FOREIGN KEY (`support_message_id`) REFERENCES `support_messages` (`id`);

--
-- Constraints for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD CONSTRAINT `support_messages_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`),
  ADD CONSTRAINT `support_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_type_foreign` FOREIGN KEY (`user_type`) REFERENCES `user_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
