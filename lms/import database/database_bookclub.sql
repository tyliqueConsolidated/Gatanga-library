-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2023 at 06:07 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greenlms`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bookID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `bookcategoryID` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `isbnno` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `codeno` varchar(100) NOT NULL,
  `rackID` int DEFAULT NULL,
  `editionnumber` varchar(100) NOT NULL,
  `editiondate` datetime DEFAULT NULL,
  `publisher` varchar(100) NOT NULL,
  `publisheddate` datetime DEFAULT NULL,
  `notes` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '0= Book Available, 1= Book Not Available',
  `deleted_at` tinyint NOT NULL COMMENT '0= Book Available, 1=Book Deleted ',
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`bookID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookcategory`
--

DROP TABLE IF EXISTS `bookcategory`;
CREATE TABLE IF NOT EXISTS `bookcategory` (
  `bookcategoryID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `coverphoto` varchar(255) NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`bookcategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookissue`
--

DROP TABLE IF EXISTS `bookissue`;
CREATE TABLE IF NOT EXISTS `bookissue` (
  `bookissueID` int NOT NULL AUTO_INCREMENT,
  `roleID` int NOT NULL,
  `memberID` int NOT NULL,
  `bookcategoryID` int NOT NULL,
  `bookID` int NOT NULL,
  `bookno` int NOT NULL,
  `notes` varchar(255) NOT NULL,
  `issue_date` datetime NOT NULL,
  `expire_date` datetime NOT NULL,
  `renewed` tinyint NOT NULL,
  `max_renewed_limit` tinyint NOT NULL,
  `book_fine_per_day` decimal(10,2) NOT NULL,
  `fineamount` decimal(10,2) NOT NULL,
  `paymentamount` decimal(10,2) NOT NULL,
  `discountamount` decimal(10,2) NOT NULL,
  `paidstatus` tinyint NOT NULL DEFAULT '0' COMMENT '0 = due,  1 = partial, 2 = Paid',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 = Issued,  1 = Return, 2 = Lost',
  `deleted_at` tinyint NOT NULL DEFAULT '0' COMMENT '0 = Not Deleted, 1 = Deleted',
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`bookissueID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bookitem`
--

DROP TABLE IF EXISTS `bookitem`;
CREATE TABLE IF NOT EXISTS `bookitem` (
  `bookitemID` int NOT NULL AUTO_INCREMENT,
  `bookID` int NOT NULL,
  `bookno` int NOT NULL,
  `status` tinyint NOT NULL COMMENT '0= Book Available, 1= Book Issued, 2=Book Lost',
  `deleted_at` tinyint NOT NULL COMMENT '0= Book Available, 1= Book Not Available',
  PRIMARY KEY (`bookitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `chatID` int NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`chatID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chatID`, `message`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'gbnggh', '2023-11-02 06:54:48', 1, 1, '2023-11-02 06:54:48', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ebook`
--

DROP TABLE IF EXISTS `ebook`;
CREATE TABLE IF NOT EXISTS `ebook` (
  `ebookID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `file` varchar(200) NOT NULL,
  `file_original_name` varchar(200) NOT NULL,
  `notes` text NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`ebookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `emailsend`
--

DROP TABLE IF EXISTS `emailsend`;
CREATE TABLE IF NOT EXISTS `emailsend` (
  `emailsendID` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `sender_name` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sender_memberID` int NOT NULL,
  `sender_roleID` int NOT NULL,
  `emailtemplateID` int NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `on_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '0=show, 1=delete',
  PRIMARY KEY (`emailsendID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emailsetting`
--

DROP TABLE IF EXISTS `emailsetting`;
CREATE TABLE IF NOT EXISTS `emailsetting` (
  `optionkey` varchar(100) NOT NULL,
  `optionvalue` text NOT NULL,
  UNIQUE KEY `frontendkey` (`optionkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emailsetting`
--

INSERT INTO `emailsetting` (`optionkey`, `optionvalue`) VALUES
('mail_driver', ''),
('mail_encryption', ''),
('mail_host', ''),
('mail_password', ''),
('mail_port', ''),
('mail_username', '');

-- --------------------------------------------------------

--
-- Table structure for table `emailtemplate`
--

DROP TABLE IF EXISTS `emailtemplate`;
CREATE TABLE IF NOT EXISTS `emailtemplate` (
  `emailtemplateID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `template` text NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`emailtemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

DROP TABLE IF EXISTS `expense`;
CREATE TABLE IF NOT EXISTS `expense` (
  `expenseID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `fileoriginalname` varchar(200) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`expenseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `finehistory`
--

DROP TABLE IF EXISTS `finehistory`;
CREATE TABLE IF NOT EXISTS `finehistory` (
  `finehistoryID` int NOT NULL AUTO_INCREMENT,
  `bookissueID` int NOT NULL,
  `bookstatusID` int NOT NULL COMMENT '0 = Issued,  1 = Return, 2 = Lost',
  `renewed` tinyint NOT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `fineamount` decimal(10,2) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`finehistoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generalsetting`
--

DROP TABLE IF EXISTS `generalsetting`;
CREATE TABLE IF NOT EXISTS `generalsetting` (
  `optionkey` varchar(100) NOT NULL,
  `optionvalue` varchar(250) DEFAULT NULL,
  UNIQUE KEY `frontendkey` (`optionkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generalsetting`
--

INSERT INTO `generalsetting` (`optionkey`, `optionvalue`) VALUES
('address', '1234,kenya'),
('copyright_by', 'tylique con.'),
('delivery_charge', '0'),
('ebook_download', '0'),
('email', 'tylique@embrenn.it'),
('frontend', '0'),
('logo', ''),
('paypal_payment_method', '0'),
('phone', '123456789'),
('registration', '1'),
('settheme', 'mytheme'),
('sitename', 'bookclub LMS'),
('stripe_key', ''),
('stripe_payment_method', '0'),
('stripe_secret', ''),
('web_address', 'www.tyliquenet.cloud');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

DROP TABLE IF EXISTS `income`;
CREATE TABLE IF NOT EXISTS `income` (
  `incomeID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `fileoriginalname` varchar(200) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`incomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `libraryconfigure`
--

DROP TABLE IF EXISTS `libraryconfigure`;
CREATE TABLE IF NOT EXISTS `libraryconfigure` (
  `libraryconfigureID` int NOT NULL AUTO_INCREMENT,
  `roleID` int NOT NULL,
  `max_issue_book` int NOT NULL,
  `max_renewed_limit` int NOT NULL,
  `per_renew_limit_day` int NOT NULL,
  `book_fine_per_day` decimal(11,0) NOT NULL,
  `issue_off_limit_amount` decimal(11,0) NOT NULL,
  PRIMARY KEY (`libraryconfigureID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `libraryconfigure`
--

INSERT INTO `libraryconfigure` (`libraryconfigureID`, `roleID`, `max_issue_book`, `max_renewed_limit`, `per_renew_limit_day`, `book_fine_per_day`, `issue_off_limit_amount`) VALUES
(1, 1, 20, 20, 20, '20', '200'),
(2, 2, 15, 15, 15, '15', '150'),
(3, 3, 10, 10, 10, '10', '100'),
(4, 4, 5, 5, 5, '5', '50');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `memberID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `dateofbirth` datetime DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `bloodgroup` varchar(20) NOT NULL,
  `address` text,
  `joinningdate` datetime DEFAULT NULL,
  `photo` varchar(200) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(128) NOT NULL,
  `roleID` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0=New, 1=active, 2=Block',
  `deleted_at` tinyint DEFAULT '0' COMMENT '0 = Not Deleted, 1 = Deleted',
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberID`, `name`, `dateofbirth`, `gender`, `religion`, `email`, `phone`, `bloodgroup`, `address`, `joinningdate`, `photo`, `username`, `password`, `roleID`, `status`, `deleted_at`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'admin', NULL, NULL, NULL, 'admin@gmail.com', '112306237', '', NULL, NULL, '04d768071130eabef965440556b55acc29d10d7afc5285258487dcec290740240bc0893b440b450c9b056d00e0534c4dbe1f87782962bf12d77ce0c7b179ed7b.png', 'victor', 'befb4f91f6bc75be5898041a336bed01239fa08ced0a1be308bbd16c3042e25b2f5c917b988fc3df76afc2fb1d1ceb062002ae27968c25f7c9d5cf4746ae8171', 1, 1, 0, '2023-10-29 20:22:32', 1, 1, '2023-10-29 20:22:32', 1, 1),
(2, 'joy', '1999-11-02 00:00:00', 'Female', 'christian', 'joy@embrenn.it', '0236447895', 'O+', 'dzftgchm,46', '2023-11-02 00:00:00', 'default.png', 'joy123', 'befb4f91f6bc75be5898041a336bed01239fa08ced0a1be308bbd16c3042e25b2f5c917b988fc3df76afc2fb1d1ceb062002ae27968c25f7c9d5cf4746ae8171', 3, 1, 0, '2023-11-01 23:46:20', 1, 1, '2023-11-01 23:49:03', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menuID` int NOT NULL AUTO_INCREMENT,
  `menuname` varchar(128) NOT NULL,
  `menulink` varchar(128) NOT NULL,
  `menuicon` varchar(128) DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '500',
  `parentmenuID` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`menuID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menuID`, `menuname`, `menulink`, `menuicon`, `priority`, `parentmenuID`, `status`) VALUES
(1, 'dashboard', 'dashboard', 'fa fa-dashboard', 500, 0, 1),
(2, 'bookissue', 'bookissue', 'fa lms-educational-book', 500, 0, 1),
(3, 'member', 'member', 'fa fa-user-plus', 500, 0, 1),
(4, 'ebook', 'ebook', 'fa lms-study', 500, 0, 1),
(5, 'books', '#', 'fa lms-book', 500, 0, 1),
(6, 'book', 'book', 'fa fa-book', 500, 5, 1),
(7, 'rack', 'rack', 'fa lms-bookshelf', 500, 5, 1),
(8, 'bookcategory', 'bookcategory', 'fa lms-notebook', 500, 5, 1),
(9, 'bookbarcode', 'bookbarcode', 'fa fa-barcode', 500, 5, 1),
(10, 'requestbook', 'requestbook', 'fa lms-professor', 500, 0, 1),
(11, 'storemanagement', '#', 'fa fa-shopping-cart', 500, 0, 1),
(12, 'order', 'order', 'fa fa-first-order', 500, 11, 1),
(13, 'storebook', 'storebook', 'fa fa-book', 0, 11, 1),
(14, 'storebookcategory', 'storebookcategory', 'fa lms-notebook', 0, 11, 1),
(15, 'emailsend', 'emailsend', 'fa fa-envelope', 500, 0, 1),
(16, 'account', '#', 'fa lms-merchant', 500, 0, 1),
(17, 'income', 'income', 'fa lms-incomes', 500, 16, 1),
(18, 'expense', 'expense', 'fa lms-salary', 500, 16, 1),
(19, 'reports', '#', 'fa fa-clipboard', 500, 0, 1),
(20, 'bookreport', 'bookreport', 'fa lms-library', 500, 19, 1),
(21, 'bookissuereport', 'bookissuereport', 'fa lms-writing', 500, 19, 1),
(22, 'memberreport', 'memberreport', 'fa lms-community', 500, 19, 1),
(23, 'idcardreport', 'idcardreport', 'fa lms-id-card', 500, 19, 1),
(24, 'transactionreport', 'transactionreport', 'fa fa-credit-card', 500, 19, 1),
(25, 'bookbarcodereport', 'bookbarcodereport', 'fa fa-barcode', 0, 19, 1),
(26, 'administrator', '#', 'fa fa-lock', 500, 0, 1),
(27, 'menu', 'menu', 'fa fa-bars', 500, 26, 1),
(28, 'role', 'role', 'fa fa-users', 500, 26, 1),
(29, 'emailtemplate', 'emailtemplate', 'fa lms-template-design', 500, 26, 1),
(30, 'permissions', 'permissions', 'fa fa-balance-scale', 500, 26, 1),
(31, 'permissionlog', 'permissionlog', 'fa fa-key', 500, 26, 1),
(32, 'update', 'update', 'fa fa-upload', 0, 26, 1),
(33, 'backup', 'backup', 'fa fa-download', 0, 26, 1),
(34, 'settings', '#', 'fa fa-cogs', 500, 0, 1),
(35, 'generalsetting', 'generalsetting', 'fa fa-cog', 500, 34, 1),
(36, 'emailsetting', 'emailsetting', 'fa lms-open-envelope', 500, 34, 1),
(37, 'libraryconfigure', 'libraryconfigure', 'fa lms-settings', 500, 34, 1),
(38, 'themesetting', 'themesetting', 'fa fa-paint-brush', 0, 34, 1),
(39, 'paymentsetting', 'paymentsetting', 'fa fa-credit-card-alt', 0, 34, 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter`
--

DROP TABLE IF EXISTS `newsletter`;
CREATE TABLE IF NOT EXISTS `newsletter` (
  `newsletterID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `verify` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`newsletterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE IF NOT EXISTS `orderitems` (
  `orderitemID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `orderID` bigint UNSIGNED NOT NULL,
  `storebookID` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `unit_price` double(13,2) UNSIGNED NOT NULL,
  `subtotal` double(13,2) UNSIGNED NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `memberID` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double(13,2) UNSIGNED NOT NULL,
  `subtotal` double(13,2) UNSIGNED NOT NULL,
  `total` double(13,2) UNSIGNED NOT NULL,
  `payment_status` tinyint UNSIGNED NOT NULL COMMENT 'PAID=5, UNPAID=10',
  `payment_method` tinyint UNSIGNED NOT NULL COMMENT 'CASH_ON_DELIVERY=5',
  `paid_amount` double(13,2) UNSIGNED NOT NULL,
  `discounted_price` double(13,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `misc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL COMMENT 'PENDING = 5, CANCEL = 10, REJECT = 15, ACCEPT = 20, PROCESS = 25, ON_THE_WAY = 30, COMPLETED = 35',
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `modify_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `paymentanddiscount`
--

DROP TABLE IF EXISTS `paymentanddiscount`;
CREATE TABLE IF NOT EXISTS `paymentanddiscount` (
  `paymentanddiscountID` int NOT NULL AUTO_INCREMENT,
  `bookissueID` int NOT NULL,
  `paymentamount` decimal(10,2) NOT NULL,
  `discountamount` decimal(10,2) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`paymentanddiscountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissionlog`
--

DROP TABLE IF EXISTS `permissionlog`;
CREATE TABLE IF NOT EXISTS `permissionlog` (
  `permissionlogID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `active` enum('yes','no') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`permissionlogID`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `permissionlog`
--

INSERT INTO `permissionlog` (`permissionlogID`, `name`, `description`, `active`) VALUES
(1, 'dashboard', 'Dashboard', 'yes'),
(2, 'bookissue', 'Book Issue', 'yes'),
(3, 'bookissue_add', 'Book Issue Add', 'yes'),
(4, 'bookissue_edit', 'Book Issue Edit', 'yes'),
(5, 'bookissue_view', 'Book Issue View', 'yes'),
(6, 'bookissue_delete', 'Book Issue Delete', 'yes'),
(7, 'member', 'Member', 'yes'),
(8, 'member_add', 'Member Add', 'yes'),
(9, 'member_edit', 'Member Edit', 'yes'),
(10, 'member_view', 'Member View', 'yes'),
(11, 'member_delete', 'Member Delete', 'yes'),
(12, 'ebook', 'Ebook', 'yes'),
(13, 'ebook_add', 'Ebook Add', 'yes'),
(14, 'ebook_edit', 'Ebook Edit', 'yes'),
(15, 'ebook_view', 'Ebook View', 'yes'),
(16, 'ebook_delete', 'Ebook Delete', 'yes'),
(17, 'book', 'Book', 'yes'),
(18, 'book_add', 'Book Add', 'yes'),
(19, 'book_edit', 'Book Edit', 'yes'),
(20, 'book_delete', 'Book Delete', 'yes'),
(21, 'book_view', 'Book View', 'yes'),
(22, 'rack', 'Rack', 'yes'),
(23, 'rack_add', 'Rack Add', 'yes'),
(24, 'rack_edit', 'Rack Edit', 'yes'),
(25, 'rack_delete', 'Rack Delete', 'yes'),
(26, 'bookcategory', 'Bool Category', 'yes'),
(27, 'bookcategory_add', 'Book Category Add', 'yes'),
(28, 'bookcategory_edit', 'Book Category Edit', 'yes'),
(29, 'bookcategory_delete', 'Book Category Delete', 'yes'),
(30, 'requestbook', 'Request Book', 'yes'),
(31, 'requestbook_add', 'Request Book Add', 'yes'),
(32, 'requestbook_edit', 'Request Book Edit', 'yes'),
(33, 'requestbook_view', 'Request Book View', 'yes'),
(34, 'requestbook_delete', 'Request Book Delete', 'yes'),
(35, 'emailsend', 'emailsend', 'yes'),
(36, 'emailsend_add', 'Emailsend Add', 'yes'),
(37, 'emailsend_view', 'Emailsend View', 'yes'),
(38, 'emailsend_delete', 'Emailsend Delete', 'yes'),
(39, 'income', 'Income', 'yes'),
(40, 'income_add', 'Income Add', 'yes'),
(41, 'income_edit', 'Income Edit', 'yes'),
(42, 'income_delete', 'Income Delete', 'yes'),
(43, 'expense', 'Expense', 'yes'),
(44, 'expense_add', 'Expense Add', 'yes'),
(45, 'expense_edit', 'Expense Edit', 'yes'),
(46, 'expense_delete', 'Expense Delete', 'yes'),
(47, 'bookreport', 'Book Report', 'yes'),
(48, 'bookissuereport', 'Book Issue Report', 'yes'),
(49, 'memberreport', 'Member Report', 'yes'),
(50, 'idcardreport', 'ID Card Report', 'yes'),
(51, 'transactionreport', 'Transaction Report', 'yes'),
(52, 'menu', 'Menu', 'yes'),
(53, 'menu_add', 'Menu Add', 'yes'),
(54, 'menu_edit', 'Menu Edit', 'yes'),
(55, 'menu_delete', 'Menu Delete', 'yes'),
(56, 'role', 'Role', 'yes'),
(57, 'role_add', 'Role Add', 'yes'),
(58, 'role_edit', 'Role Edit', 'yes'),
(59, 'role_delete', 'Role Delete', 'yes'),
(60, 'emailsetting', 'Email Setting', 'yes'),
(61, 'emailtemplate', 'Email template', 'yes'),
(62, 'emailtemplate_add', 'Email Template Add', 'yes'),
(63, 'emailtemplate_edit', 'Email Template Edit', 'yes'),
(64, 'emailtemplate_delete', 'Email Template Delete', 'yes'),
(65, 'emailtemplate_view', 'Email Template', 'yes'),
(66, 'permissions', 'Permissions', 'yes'),
(67, 'permissionlog', 'Permissionlog', 'yes'),
(68, 'permissionlog_add', 'Permissionlog', 'yes'),
(69, 'permissionlog_edit', 'Permissionlog', 'yes'),
(70, 'permissionlog_delete', 'Permissionlog', 'yes'),
(71, 'generalsetting', 'General Setting', 'yes'),
(73, 'libraryconfigure', 'Library Configure', 'yes'),
(74, 'libraryconfigure_add', 'Library Configure Add', 'yes'),
(75, 'libraryconfigure_edit', 'Library Configure Edit', 'yes'),
(76, 'libraryconfigure_delete', 'Library Configure Delete', 'yes'),
(77, 'themesetting', 'Theme Setting', 'yes'),
(78, 'backup', 'Backup', 'yes'),
(79, 'update', 'Update', 'yes'),
(80, 'bookbarcodereport', 'Book Barcode Report', 'yes'),
(81, 'bookbarcode', 'Book Barcode', 'yes'),
(82, 'smssetting', 'SMS Setting', 'yes'),
(83, 'storebookcategory', 'Store Book Category', 'yes'),
(84, 'storebookcategory_add', 'Store Book Category Add', 'yes'),
(85, 'storebookcategory_edit', 'Store Book Category Edit', 'yes'),
(86, 'storebookcategory_view', 'Store Book Category View', 'yes'),
(87, 'storebookcategory_delete', 'Store Book Category Delete', 'yes'),
(88, 'storebook', 'Store Book', 'yes'),
(89, 'storebook_add', 'Store Book Add', 'yes'),
(90, 'storebook_edit', 'Store Book Edit', 'yes'),
(91, 'storebook_view', 'Store Book View', 'yes'),
(92, 'storebook_delete', 'Store Book Delete', 'yes'),
(93, 'order', 'Order', 'yes'),
(94, 'order_view', 'Order View', 'yes'),
(95, 'order_edit', 'Order Edit', 'yes'),
(96, 'paymentsetting', 'Payment Setting', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `permissionlogID` int NOT NULL,
  `roleID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permissionlogID`, `roleID`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(6, 1),
(5, 1),
(7, 1),
(8, 1),
(9, 1),
(11, 1),
(10, 1),
(12, 1),
(13, 1),
(14, 1),
(16, 1),
(15, 1),
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
(34, 1),
(33, 1),
(35, 1),
(36, 1),
(38, 1),
(37, 1),
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
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(87, 1),
(86, 1),
(88, 1),
(89, 1),
(90, 1),
(92, 1),
(91, 1),
(93, 1),
(95, 1),
(94, 1),
(96, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(6, 2),
(5, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(12, 2),
(13, 2),
(14, 2),
(16, 2),
(15, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(34, 2),
(33, 2),
(35, 2),
(36, 2),
(38, 2),
(37, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(80, 2),
(81, 2),
(83, 2),
(84, 2),
(85, 2),
(87, 2),
(86, 2),
(88, 2),
(89, 2),
(90, 2),
(92, 2),
(91, 2),
(93, 2),
(95, 2),
(94, 2),
(1, 3),
(2, 3),
(5, 3),
(7, 3),
(10, 3),
(12, 3),
(15, 3),
(17, 3),
(21, 3),
(22, 3),
(26, 3),
(30, 3),
(31, 3),
(32, 3),
(34, 3),
(33, 3),
(35, 3),
(36, 3),
(37, 3),
(81, 3),
(83, 3),
(86, 3),
(88, 3),
(91, 3),
(93, 3),
(94, 3);

-- --------------------------------------------------------

--
-- Table structure for table `rack`
--

DROP TABLE IF EXISTS `rack`;
CREATE TABLE IF NOT EXISTS `rack` (
  `rackID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`rackID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requestbook`
--

DROP TABLE IF EXISTS `requestbook`;
CREATE TABLE IF NOT EXISTS `requestbook` (
  `requestbookID` int NOT NULL AUTO_INCREMENT,
  `memberID` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `bookcategoryID` int NOT NULL,
  `isbnno` varchar(100) DEFAULT NULL,
  `editionnumber` varchar(50) DEFAULT NULL,
  `editiondate` date DEFAULT NULL,
  `publisher` varchar(50) DEFAULT NULL,
  `publisheddate` date DEFAULT NULL,
  `notes` text,
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0= Request Book, 1= Request Book Accepet, 2= Request Book Rejected',
  `deleted_at` tinyint NOT NULL DEFAULT '0' COMMENT '0= Request Book Not Deleted, 1=Request Book Deleted ',
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`requestbookID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resetpassword`
--

DROP TABLE IF EXISTS `resetpassword`;
CREATE TABLE IF NOT EXISTS `resetpassword` (
  `resetpasswordID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `code` varchar(11) NOT NULL,
  `memberID` int NOT NULL,
  `roleID` int NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime NOT NULL,
  PRIMARY KEY (`resetpasswordID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `roleID` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` varchar(30) NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `create_roleID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  `modify_roleID` int NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleID`, `role`, `create_date`, `create_memberID`, `create_roleID`, `modify_date`, `modify_memberID`, `modify_roleID`) VALUES
(1, 'Admin', '2019-09-25 20:19:22', 1, 1, '2019-09-25 20:19:22', 1, 1),
(2, 'Librarian', '2019-09-25 20:19:32', 1, 1, '2020-01-29 23:32:27', 1, 1),
(3, 'Member', '2019-09-25 20:19:39', 1, 1, '2019-11-03 00:03:22', 1, 1),
(4, 'Customer', '2019-12-10 20:38:31', 1, 1, '2019-12-10 20:38:31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `storebook`
--

DROP TABLE IF EXISTS `storebook`;
CREATE TABLE IF NOT EXISTS `storebook` (
  `storebookID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `storebookcategoryID` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `isbnno` varchar(100) NOT NULL,
  `coverphoto` varchar(200) NOT NULL,
  `codeno` varchar(100) NOT NULL,
  `editionnumber` varchar(100) NOT NULL,
  `editiondate` datetime DEFAULT NULL,
  `publisher` varchar(100) NOT NULL,
  `publisheddate` datetime DEFAULT NULL,
  `notes` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint NOT NULL COMMENT '0= Book Available, 1= Book Not Available',
  `deleted_at` tinyint NOT NULL COMMENT '0= Book Available, 1=Book Deleted ',
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  PRIMARY KEY (`storebookID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storebookcategory`
--

DROP TABLE IF EXISTS `storebookcategory`;
CREATE TABLE IF NOT EXISTS `storebookcategory` (
  `storebookcategoryID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `coverphoto` varchar(255) NOT NULL,
  `status` tinyint NOT NULL,
  `create_date` datetime NOT NULL,
  `create_memberID` int NOT NULL,
  `modify_date` datetime NOT NULL,
  `modify_memberID` int NOT NULL,
  PRIMARY KEY (`storebookcategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storebookimage`
--

DROP TABLE IF EXISTS `storebookimage`;
CREATE TABLE IF NOT EXISTS `storebookimage` (
  `storebookimageID` int NOT NULL AUTO_INCREMENT,
  `storebookID` int NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `meta` text NOT NULL,
  PRIMARY KEY (`storebookimageID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
CREATE TABLE IF NOT EXISTS `updates` (
  `updateID` int NOT NULL AUTO_INCREMENT,
  `version` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `memberID` int NOT NULL,
  `status` tinyint NOT NULL,
  `description` text,
  PRIMARY KEY (`updateID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
