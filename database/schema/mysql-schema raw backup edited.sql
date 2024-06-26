/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

/*!40101 SET character_set_client = @saved_cs_client */;
-- DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `admin` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
--   `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
--   `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
--   `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `loan_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_approval` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loan_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `response` enum('approved','declined') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`)
  KEY `user_id` (`user_id`),
  CONSTRAINT `loan_approval_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `loan_approval_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `loan_request` (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `allotment_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allotment_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `allotment_file` varchar(255) NOT NULL,
  `file_uploader` INT NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bankname` varchar(255) NOT NULL,
  `bankcode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contributions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` enum('approved','notapproved') NOT NULL,
  `time` varchar(255) NOT NULL,
  `expiry` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `conversion_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversion_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `refcode` varchar(255) NOT NULL,
  `transaction_status` varchar(255) NOT NULL,
  `medium` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `expiry` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `deposit_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposit_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `refcode` varchar(255) NOT NULL,
  `transaction_status` varchar(255) NOT NULL,
  `medium` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `expiry` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `document_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doc_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `doc_type` int NOT NULL,
  `doc_name` text NOT NULL,
  `doc_file` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `documents_FK` (`doc_type`),
  KEY `documents_FK_1` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `expenditure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenditure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `recipient_account` varchar(255) NOT NULL,
  `recipient_bank` varchar(255) NOT NULL,
  `admin_id` int NOT NULL,
  `transaction_id` int NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `transfer_code` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expenditure_ibfk_1` (`admin_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `expenditure_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `loan_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_balance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` varchar(255) NOT NULL,
  `balance` varchar(255) NOT NULL,
  `last_loan_id` int NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `loan_guarantors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_guarantors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loan_id` varchar(255) NOT NULL,
  `guarantor_staffid` varchar(255) NOT NULL,
  `guarantor_response` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `loan_repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_repayment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `loan_id` int NOT NULL,
  `staffid` int NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_ref` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `transaction_status` enum('success','failed') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'success',
  `time` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `loan_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `package_id` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `monthlydue` varchar(255) NOT NULL,
  `biweeklydue` varchar(255) NOT NULL,
  `interest` varchar(255) NOT NULL,
  `loan_duration` varchar(255) NOT NULL,
  `refcode` varchar(255) NOT NULL,
  `guarantor_one` varchar(255) NOT NULL,
  `guarantor_two` varchar(255) NOT NULL,
  `reason` longtext NOT NULL,
  `status` varchar(255) NOT NULL,
  `repayment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) NOT NULL,
  `package_price` varchar(255) NOT NULL,
  `package_interest_rate` varchar(255) NOT NULL,
  `package_tenure` varchar(255) NOT NULL,
  `package_access_rate` varchar(255) NOT NULL,
  `base_fee` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `package_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `paystack_live_publickey` varchar(255) NOT NULL,
  `paystack_test_publickey` varchar(255) NOT NULL,
  `paystack_test_secretkey` varchar(255) NOT NULL,
  `paystack_live_secretkey` varchar(255) NOT NULL,
  `system_name` varchar(255) NOT NULL,
  `system_desc` varchar(255) NOT NULL,
  `smtp_email` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `refcode` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `medium` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `userbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userbank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` varchar(255) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `account_no` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `withdrawal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `refcode` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `withdrawal_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `withdrawal_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staffid` int NOT NULL,
  `amount` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `refcode` varchar(255) NOT NULL,
  `transaction_status` varchar(255) NOT NULL,
  `medium` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `expiry` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `staffid` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
