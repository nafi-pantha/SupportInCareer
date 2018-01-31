-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2018 at 08:23 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_exam`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add mcq question', 7, 'add_mcqquestion'),
(20, 'Can change mcq question', 7, 'change_mcqquestion'),
(21, 'Can delete mcq question', 7, 'delete_mcqquestion'),
(22, 'Can add essay question', 8, 'add_essayquestion'),
(23, 'Can change essay question', 8, 'change_essayquestion'),
(24, 'Can delete essay question', 8, 'delete_essayquestion'),
(25, 'Can add user info', 9, 'add_userinfo'),
(26, 'Can change user info', 9, 'change_userinfo'),
(27, 'Can delete user info', 9, 'delete_userinfo'),
(28, 'Can add test', 10, 'add_test'),
(29, 'Can change test', 10, 'change_test'),
(30, 'Can delete test', 10, 'delete_test'),
(31, 'Can add user result', 11, 'add_userresult'),
(32, 'Can change user result', 11, 'change_userresult'),
(33, 'Can delete user result', 11, 'delete_userresult'),
(34, 'Can add subject', 12, 'add_subject'),
(35, 'Can change subject', 12, 'change_subject'),
(36, 'Can delete subject', 12, 'delete_subject'),
(37, 'Can add user mcq answer', 13, 'add_usermcqanswer'),
(38, 'Can change user mcq answer', 13, 'change_usermcqanswer'),
(39, 'Can delete user mcq answer', 13, 'delete_usermcqanswer'),
(40, 'Can add user essay answer', 14, 'add_useressayanswer'),
(41, 'Can change user essay answer', 14, 'change_useressayanswer'),
(42, 'Can delete user essay answer', 14, 'delete_useressayanswer'),
(43, 'Can add admin review', 15, 'add_adminreview'),
(44, 'Can change admin review', 15, 'change_adminreview'),
(45, 'Can delete admin review', 15, 'delete_adminreview'),
(46, 'Can add essay summary', 16, 'add_essaysummary'),
(47, 'Can change essay summary', 16, 'change_essaysummary'),
(48, 'Can delete essay summary', 16, 'delete_essaysummary'),
(49, 'Can add scf u_ user status', 17, 'add_scfu_userstatus'),
(50, 'Can change scf u_ user status', 17, 'change_scfu_userstatus'),
(51, 'Can delete scf u_ user status', 17, 'delete_scfu_userstatus'),
(52, 'Can add scf u_ user type', 18, 'add_scfu_usertype'),
(53, 'Can change scf u_ user type', 18, 'change_scfu_usertype'),
(54, 'Can delete scf u_ user type', 18, 'delete_scfu_usertype'),
(55, 'Can add scf u_ essay exam ques no', 19, 'add_scfu_essayexamquesno'),
(56, 'Can change scf u_ essay exam ques no', 19, 'change_scfu_essayexamquesno'),
(57, 'Can delete scf u_ essay exam ques no', 19, 'delete_scfu_essayexamquesno'),
(58, 'Can add scf u_mcq exam ques no', 20, 'add_scfu_mcqexamquesno'),
(59, 'Can change scf u_mcq exam ques no', 20, 'change_scfu_mcqexamquesno'),
(60, 'Can delete scf u_mcq exam ques no', 20, 'delete_scfu_mcqexamquesno'),
(61, 'Can add scf u_ essay total test', 19, 'add_scfu_essaytotaltest'),
(62, 'Can change scf u_ essay total test', 19, 'change_scfu_essaytotaltest'),
(63, 'Can delete scf u_ essay total test', 19, 'delete_scfu_essaytotaltest'),
(64, 'Can add scf u_ mcq total test', 20, 'add_scfu_mcqtotaltest'),
(65, 'Can change scf u_ mcq total test', 20, 'change_scfu_mcqtotaltest'),
(66, 'Can delete scf u_ mcq total test', 20, 'delete_scfu_mcqtotaltest'),
(67, 'Can add scf u_ test type', 21, 'add_scfu_testtype'),
(68, 'Can change scf u_ test type', 21, 'change_scfu_testtype'),
(69, 'Can delete scf u_ test type', 21, 'delete_scfu_testtype'),
(70, 'Can add scf u_ test total ques no', 22, 'add_scfu_testtotalquesno'),
(71, 'Can change scf u_ test total ques no', 22, 'change_scfu_testtotalquesno'),
(72, 'Can delete scf u_ test total ques no', 22, 'delete_scfu_testtotalquesno'),
(73, 'Can add scf u_mcq test total ques no', 23, 'add_scfu_mcqtesttotalquesno'),
(74, 'Can change scf u_mcq test total ques no', 23, 'change_scfu_mcqtesttotalquesno'),
(75, 'Can delete scf u_mcq test total ques no', 23, 'delete_scfu_mcqtesttotalquesno'),
(76, 'Can add scf u_ essay test total ques no', 22, 'add_scfu_essaytesttotalquesno'),
(77, 'Can change scf u_ essay test total ques no', 22, 'change_scfu_essaytesttotalquesno'),
(78, 'Can delete scf u_ essay test total ques no', 22, 'delete_scfu_essaytesttotalquesno'),
(79, 'Can add scf u_ test total ques no', 24, 'add_scfu_testtotalquesno'),
(80, 'Can change scf u_ test total ques no', 24, 'change_scfu_testtotalquesno'),
(81, 'Can delete scf u_ test total ques no', 24, 'delete_scfu_testtotalquesno');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$h6QuRMS5b6tX$ZjfjJW5GS2yHJxt6wFdvFufIbbuaEy8gchfPLXzKgYI=', '2018-01-31 19:12:11.708588', 0, 'nafi', 'Nafiul', 'Hassan', 'nafpantha@gmail.com', 1, 1, '2017-11-17 17:06:02.255224'),
(2, 'pbkdf2_sha256$36000$CsaTXWcfj55o$Cr3J9EpMshXj0cBpqduVbz90gfOwVt6pKDiznNPixdM=', '2018-01-31 19:09:15.207165', 0, 'sajib', 'Jahidul', 'Sajib', 'sajib@gmail.com', 0, 1, '2017-11-20 17:52:45.126263'),
(13, 'pbkdf2_sha256$36000$8XcnyiHOgXri$VxTSm/Y8ls4kmjUDTDVxPMrZxIcqdD79aYfniDqsE30=', '2018-01-31 17:45:23.614870', 0, 'pantha', 'Nafiul', 'Hassan', 'nafiul.csecuet@gmail.com', 0, 1, '2018-01-28 16:44:48.523044');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(15, 'exam', 'adminreview'),
(8, 'exam', 'essayquestion'),
(16, 'exam', 'essaysummary'),
(7, 'exam', 'mcqquestion'),
(22, 'exam', 'scfu_essaytesttotalquesno'),
(19, 'exam', 'scfu_essaytotaltest'),
(23, 'exam', 'scfu_mcqtesttotalquesno'),
(20, 'exam', 'scfu_mcqtotaltest'),
(24, 'exam', 'scfu_testtotalquesno'),
(21, 'exam', 'scfu_testtype'),
(17, 'exam', 'scfu_userstatus'),
(18, 'exam', 'scfu_usertype'),
(12, 'exam', 'subject'),
(10, 'exam', 'test'),
(14, 'exam', 'useressayanswer'),
(9, 'exam', 'userinfo'),
(13, 'exam', 'usermcqanswer'),
(11, 'exam', 'userresult'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-11-30 22:52:12.517147'),
(2, 'auth', '0001_initial', '2017-11-30 22:52:30.536191'),
(3, 'admin', '0001_initial', '2017-11-30 22:52:34.288699'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-11-30 22:52:34.488832'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-11-30 22:52:36.681297'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-11-30 22:52:39.066892'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-11-30 22:52:40.334739'),
(8, 'auth', '0004_alter_user_username_opts', '2017-11-30 22:52:40.532872'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-11-30 22:52:41.092245'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-11-30 22:52:41.145281'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-11-30 22:52:41.196315'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-11-30 22:52:42.501188'),
(13, 'sessions', '0001_initial', '2017-11-30 22:52:43.303724'),
(14, 'exam', '0001_initial', '2017-11-30 22:54:44.216356'),
(15, 'exam', '0002_usermcqanswer', '2017-12-03 15:33:33.719141'),
(16, 'exam', '0003_auto_20171204_2354', '2017-12-11 14:51:10.330845'),
(17, 'exam', '0004_useressayanswer', '2017-12-11 14:51:13.729100'),
(18, 'exam', '0005_auto_20171212_0010', '2017-12-11 18:11:03.182723'),
(19, 'exam', '0006_auto_20171214_2310', '2017-12-14 17:10:16.459303'),
(20, 'exam', '0007_auto_20171215_0012', '2017-12-14 18:12:31.207195'),
(21, 'exam', '0008_adminreview_spend_time', '2017-12-16 17:27:58.633049'),
(22, 'exam', '0009_essaysummary', '2017-12-31 16:37:30.828741'),
(23, 'exam', '0010_remove_essaysummary_subject_id', '2017-12-31 16:46:53.001208'),
(24, 'exam', '0011_scfu_userstatus', '2018-01-10 16:15:09.014676'),
(25, 'exam', '0012_scfu_usertype', '2018-01-10 16:16:42.208203'),
(26, 'exam', '0013_scfu_essayexamquesno_scfu_mcqexamquesno', '2018-01-12 16:22:15.300739'),
(27, 'exam', '0014_auto_20180112_2259', '2018-01-12 16:59:45.058344'),
(28, 'exam', '0015_scfu_testtype', '2018-01-12 17:42:12.933163'),
(29, 'exam', '0016_scfu_testtotalquesno', '2018-01-13 15:42:34.600683'),
(30, 'exam', '0017_auto_20180114_2219', '2018-01-14 16:19:55.890413'),
(31, 'exam', '0018_auto_20180114_2300', '2018-01-14 17:00:43.016744'),
(32, 'exam', '0019_auto_20180131_2236', '2018-01-31 16:38:54.203557');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0a4d8vq8d5e03zkydzab5rs4hmj2lmr8', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-04 16:26:15.454799'),
('1kz2gp188j6caznz65n6xghyvo4uvgvg', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-19 18:56:36.713975'),
('1zr9jxhqsf5dtyq8dbv8eyqudukua9nc', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-21 20:19:21.498833'),
('33n0dtsszs4p16tgt2nqwjpgv8ox86y2', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-03 15:32:58.728875'),
('3nl9mmmhqu5jy1ro7iat392k6dxpd1v5', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-01-15 18:42:28.839831'),
('4wvbxzlfwjrgzs6g3zemtxvrrtrk3kt0', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-03 18:17:36.669539'),
('6etm7w81dmys95tvx0t55cie5dnmobvj', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-23 19:19:37.686448'),
('76ufnaviqn6l7imikmlgy3vnnrrj51ew', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-26 15:34:16.248866'),
('7gl5o9x8d2gi60mm5ixkfn8zyw66t8d6', 'ZTdmM2E3YjUyNmYwZWFjY2VmMjFhNmNjNDNlZTA2ZTE1YjkyODM3Mjp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjoxMH0=', '2017-12-10 15:17:38.249086'),
('8apz4809fmjiuvezq8p9b89hxpq3l50c', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-02-04 17:37:45.175083'),
('8thsr69hvxzy1kzj4ogcifij4nt58zgh', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-02-14 19:12:11.792144'),
('9cryamxakvxkawijcp73lmmo7j3nz09f', 'ZTI0OTE1OWI2YzNlYjI3OTM5MmM2MWRkYjZhMDZiNWE2YzliNDVjNzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MH0=', '2018-01-13 12:20:54.573992'),
('aei9zsquewm9jrio28nwhjdrynyb920u', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-30 15:02:03.476475'),
('an9k25xax13q4hygj1yorm59tyz4tyyp', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-02-11 17:52:04.034298'),
('atoxlcob9yiha8h0enjyyvwfmebnnwn3', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-02 14:38:36.486456'),
('bvi9mcjxnppw5s9fuf8lj3ovwa26ri6r', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-25 16:18:29.719568'),
('bwhjiusqucki7umcvzqbaawtwbzah96e', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-06 15:25:05.863491'),
('caubtncpj5xp725m87csnrf5vkvuxhm8', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-20 15:50:31.284130'),
('cov5c1pge3mgiamlowp95lf7o4dakvwj', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-30 16:45:47.876892'),
('dd8oum90t2r8hidhf7792fb5s53leggy', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-25 14:52:41.806067'),
('e2yug1vl7jua94tb744bzfhute9mrh5w', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-27 15:33:33.553019'),
('epy13p1uvdt7p5wej4bzqzder5rq2d7t', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-02-11 16:46:54.089626'),
('gxjf8xvflnyenxw57s3hjhubaowxvfg3', 'NzFmOWM3YWJmZGIyNjU1MTAwYzg3MDNkNzM0NGFjNTA4NzM2MzFiNjp7InVzZXJuYW1lIjoic2FqaWIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmEzMzU4NzU4MTViNzMyOTY5OWY1NGM1MDE5MzgzZjA5YWU3NTY3MyJ9', '2017-12-23 16:34:22.893515'),
('h7wxes38y4z4ganq0r53i5ucjm7uyjot', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-18 18:37:14.583476'),
('hegroj32e2klf5kp5xpsmx4vdox4amts', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-01-06 15:23:50.046175'),
('hje6tkgx4slpe9c8rxkldktp3xmb2vfx', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-29 16:22:46.592484'),
('i25lmwc2r5p61q4t0e89rw502q951bgd', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-01-14 17:36:46.150474'),
('i7wrvnyiu9vcvs13viqrus7t9t1rwoji', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-16 17:14:11.150974'),
('i9np9eqoo5igf69akr0wq6663cfgj9om', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-28 15:38:23.028834'),
('ibjq6kaxirr1ywmiux9c72jvx55iituo', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-02-05 18:19:26.244304'),
('kr5khz37lvio4v94a22ik9a7u340ylm0', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-14 16:29:12.356060'),
('lczn4r7qdgahotvwm6aji7gkosd6ho3m', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-24 16:51:59.305919'),
('m25p2fnnxx4cn7g92a4vgdrleuxe7b2v', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-02-05 15:22:40.672749'),
('n2xvxrs1ix9y1o41eg09z5n3anwjyrky', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2017-12-30 17:33:25.272505'),
('n5dbf6619cqebxsl29f2smbsyt7fwgi8', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-02-03 20:05:43.277927'),
('nswn93idnhdbytptgoeu9xob25il5m90', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-05 16:28:27.395732'),
('po3j3iv0wkmmqxascxy8p6nm64rd4n8w', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-28 15:59:15.063975'),
('qta3aifbus8yjr47oy5lctchatkpm2yg', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-01-18 21:00:31.673236'),
('rotvuxmpk80jvev4p524tghkruwl8h51', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-19 16:00:07.754477'),
('rvvub7hs1jlhrgy6adus4f74e6qtg73m', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-17 18:12:37.983439'),
('slgfbwypnlunodw472w75vzpl170cdfx', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-17 17:26:43.223854'),
('snyhciy8ood5at0aizi6zghsy0x8n73y', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-01-06 18:15:18.733518'),
('u06i5nug6zdc7hue7hc8gkrfhwbetmtd', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-14 23:25:55.681724'),
('vhormggfe9a2svekgtnxbl445kdlaehg', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-19 19:47:50.754060'),
('vllkjucaetyyn87pf3ypyqumwnhww1o6', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-15 18:44:03.111277'),
('wcvu5ex0r61y72idrys6ypapz1dhct26', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-19 20:03:03.590280'),
('wlskl4yrw3od1j82t85q6j9dmw2gqyx0', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-26 15:58:31.654226'),
('xjss0o47h4tlzb18wi42fnzrqtis59ru', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-15 18:21:31.163973');

-- --------------------------------------------------------

--
-- Table structure for table `exam_adminreview`
--

CREATE TABLE `exam_adminreview` (
  `id` int(11) NOT NULL,
  `is_reviewed` tinyint(1) NOT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `spend_time` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_adminreview`
--

INSERT INTO `exam_adminreview` (`id`, `is_reviewed`, `approver`, `datetime`, `test_id_id`, `user_id`, `spend_time`) VALUES
(12, 1, 'Null', '2017-12-23 18:18:19.215291', 101012, 2, NULL),
(13, 1, 'Null', '2018-01-01 18:33:24.625730', 101012, 2, NULL),
(14, 1, 'Null', '2018-01-26 16:50:11.911771', 101012, 2, NULL),
(15, 1, 'Null', '2018-01-26 17:15:40.013789', 102012, 2, NULL),
(16, 1, 'Null', '2018-01-28 16:46:33.223796', 101012, 13, NULL),
(17, 1, 'Null', '2018-01-29 16:16:19.937453', 102012, 13, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exam_essayquestion`
--

CREATE TABLE `exam_essayquestion` (
  `id` int(11) NOT NULL,
  `essay_question_id` int(11) NOT NULL,
  `essay_question` longtext NOT NULL,
  `essay_question_marks` int(11) NOT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_essayquestion`
--

INSERT INTO `exam_essayquestion` (`id`, `essay_question_id`, `essay_question`, `essay_question_marks`, `approver`, `datetime`, `test_id_id`) VALUES
(1, 1, 'AFD', 10, 'Null', '2017-11-22 17:44:22.782653', 101012),
(2, 2, 'AMDSN', 2, 'Null', '2017-11-22 17:44:22.860703', 101012),
(3, 3, 'AFSA', 1, 'Null', '2017-11-22 17:44:22.925746', 101012),
(4, 4, 'SAFL', 5, 'Null', '2017-11-22 17:44:23.185920', 101012),
(5, 5, 'ADHFGKHJ', 1, 'Null', '2017-11-22 17:44:44.842395', 101012),
(6, 6, 'A.M', 3, 'Null', '2017-11-22 17:44:23.292993', 101012),
(7, 7, 'AML', 1, 'Null', '2017-11-22 17:44:23.326014', 101012),
(8, 8, 'LKJ', 2, 'Null', '2017-11-22 17:44:23.393058', 101012),
(9, 9, 'KJ', 1, 'Null', '2017-11-22 17:44:23.436087', 101012),
(10, 10, 'LS', 1, 'Null', '2017-11-22 17:44:23.504132', 101012),
(11, 1, 'ok', 5, 'Null', '2018-01-26 17:15:05.903178', 102012),
(12, 2, 'pantha', 10, 'Null', '2018-01-26 17:15:05.979229', 102012),
(13, 3, 'eh', 1, 'Null', '2018-01-26 17:15:06.023258', 102012),
(14, 4, 'sajib', 3, 'Null', '2018-01-26 17:15:06.104311', 102012),
(15, 5, 'ok', 1, 'Null', '2018-01-26 17:15:06.211384', 102012),
(16, 6, 'adsas', 1, 'Null', '2018-01-26 17:15:06.255413', 102012),
(17, 7, 'hfd', 5, 'Null', '2018-01-26 17:15:06.300443', 102012),
(18, 8, 'hg', 1, 'Null', '2018-01-26 17:15:06.333464', 102012),
(19, 9, 'ghf', 2, 'Null', '2018-01-26 17:15:06.378493', 102012),
(20, 10, 'fjhf', 1, 'Null', '2018-01-26 17:15:06.422524', 102012),
(21, 1, 'adsfgfgf', 7, 'Null', '2018-01-31 18:36:07.016686', 101022),
(22, 2, 'jmghfmnaa vsvav', 6, 'Null', '2018-01-31 18:36:07.083730', 101022),
(23, 3, 'kjghkuhfhmhmghf', 6, 'Null', '2018-01-31 18:36:07.117752', 101022),
(24, 4, 'asdffdgergvfga', 8, 'Null', '2018-01-31 18:36:07.149774', 101022),
(25, 5, 'gdgrgsdfgnbshb', 7, 'Null', '2018-01-31 18:36:07.206810', 101022),
(26, 6, 'fgstherhfhbbhrtfr', 4, 'Null', '2018-01-31 18:36:07.316883', 101022),
(27, 7, 'mklhajjsahjdhajk', 6, 'Null', '2018-01-31 18:36:07.406943', 101022),
(28, 8, 'slfujhasuifufasudiu', 7, 'Null', '2018-01-31 18:36:07.438965', 101022),
(29, 9, 'sikafiuausyfuyusayu', 8, 'Null', '2018-01-31 18:36:07.473988', 101022),
(30, 10, 'ausdfgdfyyastdytays', 5, 'Null', '2018-01-31 18:36:07.529025', 101022);

-- --------------------------------------------------------

--
-- Table structure for table `exam_essaysummary`
--

CREATE TABLE `exam_essaysummary` (
  `id` int(11) NOT NULL,
  `essay_summary_details` longtext NOT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_essaysummary`
--

INSERT INTO `exam_essaysummary` (`id`, `essay_summary_details`, `approver`, `datetime`, `test_id_id`) VALUES
(1, 'asdfjhdsdfsjssads', 'null', '2018-01-04 00:00:00.000000', 101012),
(2, 'klsjfhujhsdaufh', 'Null', '2018-01-26 17:15:06.467553', 102012),
(3, 'asdfpogysiisoif hyuiaish uuia dyuy', 'Null', '2018-01-31 18:36:07.573054', 101022);

-- --------------------------------------------------------

--
-- Table structure for table `exam_mcqquestion`
--

CREATE TABLE `exam_mcqquestion` (
  `id` int(11) NOT NULL,
  `mcq_question_id` int(11) NOT NULL,
  `mcq_question` longtext NOT NULL,
  `mcq_option1` longtext NOT NULL,
  `mcq_option2` longtext NOT NULL,
  `mcq_option3` longtext NOT NULL,
  `mcq_option4` longtext NOT NULL,
  `mcq_right_answer` int(11) NOT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_mcqquestion`
--

INSERT INTO `exam_mcqquestion` (`id`, `mcq_question_id`, `mcq_question`, `mcq_option1`, `mcq_option2`, `mcq_option3`, `mcq_option4`, `mcq_right_answer`, `approver`, `datetime`, `test_id_id`) VALUES
(1, 1, 'a', 'a', 'a', 'a', 'a', 1, 'Null', '2017-11-22 17:37:56.135096', 101011),
(2, 2, 'b', 'b', 'b', 'b', 'b', 2, 'Null', '2017-11-22 17:38:35.541434', 101011),
(3, 3, 'a', 'a', 'a', 'a', 'a', 3, 'Null', '2017-11-22 17:37:56.314214', 101011),
(4, 4, 'a', 'a', 'a', 'a', 'a', 4, 'Null', '2017-11-22 17:37:56.470318', 101011),
(5, 5, 'a', 'a', 'a', 'a', 'a', 1, 'Null', '2017-11-22 17:37:56.556376', 101011),
(6, 6, 'a', 'a', 'a', 'a', 'a', 2, 'Null', '2017-11-22 17:37:56.615416', 101011),
(7, 7, 'a', 'a', 'a', 'a', 'a', 3, 'Null', '2017-11-22 17:37:56.696470', 101011),
(8, 8, 'a', 'a', 'a', 'a', 'a', 4, 'Null', '2017-11-22 17:37:56.737498', 101011),
(9, 9, 'a', 'a', 'a', 'a', 'a', 1, 'Null', '2017-11-22 17:37:56.770520', 101011),
(10, 10, 'a', 'a', 'a', 'a', 'a', 2, 'Null', '2017-11-22 17:37:56.803542', 101011),
(11, 1, 'ad', 'd', 'a', 'd', 'ad', 1, 'Null', '2018-01-20 21:48:57.549268', 101021),
(12, 2, 'ad', 'ad', 'ad', 'ad', 'sdf', 2, 'Null', '2018-01-20 21:48:57.606308', 101021),
(13, 3, 'sfd', 'sdf', 'fsd', 'dgf', 'dfg', 3, 'Null', '2018-01-20 21:48:57.683357', 101021),
(14, 4, 'gsd', 'dgf', 'fgh', 'ghf', 'ghj', 4, 'Null', '2018-01-20 21:48:57.772416', 101021),
(15, 5, 'fh', 'hgf', 'ghj', 'gjh', 'j', 1, 'Null', '2018-01-20 21:48:57.927519', 101021),
(16, 6, 'ads', 'fg', 'fh', 'fhg', 'fgh', 2, 'Null', '2018-01-20 21:48:58.006571', 101021),
(17, 7, 'dgf', 'fhg', 'fhg', 'gh', 'fgh', 3, 'Null', '2018-01-20 21:48:58.049600', 101021),
(18, 8, 'sf', 'ok', 'ok', 'ok', 'ok', 4, 'Null', '2018-01-31 18:26:04.953531', 101021),
(19, 9, 'ads', 'asd', 'asd', 'ads', 'ads', 1, 'Null', '2018-01-20 21:48:58.161673', 101021),
(20, 10, 'dfg', 'fgh', 'ghj', 'ghj', 'ghj', 2, 'Null', '2018-01-20 21:48:58.217710', 101021);

-- --------------------------------------------------------

--
-- Table structure for table `exam_scfu_essaytesttotalquesno`
--

CREATE TABLE `exam_scfu_essaytesttotalquesno` (
  `id` int(11) NOT NULL,
  `test_ques_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_essaytesttotalquesno`
--

INSERT INTO `exam_scfu_essaytesttotalquesno` (`id`, `test_ques_no`) VALUES
(9, 3),
(10, 4),
(11, 5),
(12, 10);

-- --------------------------------------------------------

--
-- Table structure for table `exam_scfu_essaytotaltest`
--

CREATE TABLE `exam_scfu_essaytotaltest` (
  `id` int(11) NOT NULL,
  `essay_total_test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_essaytotaltest`
--

INSERT INTO `exam_scfu_essaytotaltest` (`id`, `essay_total_test`) VALUES
(7, 10),
(8, 20),
(9, 30);

-- --------------------------------------------------------

--
-- Table structure for table `exam_scfu_mcqtesttotalquesno`
--

CREATE TABLE `exam_scfu_mcqtesttotalquesno` (
  `id` int(11) NOT NULL,
  `test_ques_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_mcqtesttotalquesno`
--

INSERT INTO `exam_scfu_mcqtesttotalquesno` (`id`, `test_ques_no`) VALUES
(5, 10),
(6, 20),
(7, 30),
(8, 50);

-- --------------------------------------------------------

--
-- Table structure for table `exam_scfu_mcqtotaltest`
--

CREATE TABLE `exam_scfu_mcqtotaltest` (
  `id` int(11) NOT NULL,
  `mcq_total_test` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_mcqtotaltest`
--

INSERT INTO `exam_scfu_mcqtotaltest` (`id`, `mcq_total_test`) VALUES
(7, 10),
(8, 20),
(9, 30);

-- --------------------------------------------------------

--
-- Table structure for table `exam_scfu_testtype`
--

CREATE TABLE `exam_scfu_testtype` (
  `test_type_id` int(11) NOT NULL,
  `test_type_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_testtype`
--

INSERT INTO `exam_scfu_testtype` (`test_type_id`, `test_type_name`) VALUES
(1, 'MCQ'),
(2, 'Essay');

-- --------------------------------------------------------

--
-- Table structure for table `exam_scfu_userstatus`
--

CREATE TABLE `exam_scfu_userstatus` (
  `status_id` tinyint(1) NOT NULL,
  `status_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_userstatus`
--

INSERT INTO `exam_scfu_userstatus` (`status_id`, `status_name`) VALUES
(0, 'Inactive'),
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `exam_scfu_usertype`
--

CREATE TABLE `exam_scfu_usertype` (
  `type_id` tinyint(1) NOT NULL,
  `type_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_usertype`
--

INSERT INTO `exam_scfu_usertype` (`type_id`, `type_name`) VALUES
(0, 'User'),
(1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `exam_subject`
--

CREATE TABLE `exam_subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(20) NOT NULL,
  `mcq_total_test` int(11) NOT NULL,
  `essay_total_test` int(11) NOT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_subject`
--

INSERT INTO `exam_subject` (`subject_id`, `subject_name`, `mcq_total_test`, `essay_total_test`, `approver`, `datetime`) VALUES
(101, 'Algorithm', 20, 20, 'Null', '2018-01-12 17:03:30.402737'),
(102, 'CSE', 20, 20, 'Null', '2017-11-22 17:45:15.629971'),
(103, 'Test', 20, 30, 'Null', '2018-01-13 17:54:21.382729'),
(104, 'Test 02', 20, 30, 'Null', '2018-01-13 17:55:26.963167');

-- --------------------------------------------------------

--
-- Table structure for table `exam_test`
--

CREATE TABLE `exam_test` (
  `test_id` int(11) NOT NULL,
  `test_name` varchar(20) NOT NULL,
  `test_totalmarks` int(11) NOT NULL,
  `test_totaltimes` int(11) NOT NULL,
  `test_type` int(11) NOT NULL,
  `test_total_questions` int(11) NOT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `subject_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_test`
--

INSERT INTO `exam_test` (`test_id`, `test_name`, `test_totalmarks`, `test_totaltimes`, `test_type`, `test_total_questions`, `approver`, `datetime`, `subject_id_id`) VALUES
(101011, 'Algo MT 01', 10, 20, 1, 10, 'Null', '2017-11-22 17:35:45.867676', 101),
(101012, 'Algo Essay 01', 10, 30, 2, 10, 'Null', '2017-11-22 17:43:36.761891', 101),
(101021, 'Algo MT 02', 10, 30, 1, 10, 'Null', '2017-11-28 16:45:01.230575', 101),
(101022, 'Algo Essay 02', 50, 30, 2, 10, 'Null', '2018-01-20 23:59:20.128675', 101),
(101031, 'Algo MT 03', 10, 10, 1, 10, 'Null', '2018-01-13 17:53:11.794634', 101),
(102012, 'CSE MT 01', 10, 30, 2, 10, 'Null', '2018-01-26 17:14:07.659573', 102),
(102022, 'CSE MT 02', 10, 30, 2, 5, 'Null', '2018-01-31 19:16:18.966294', 102),
(103011, 'Test MT 01', 20, 20, 1, 10, 'Null', '2018-01-13 19:20:11.169221', 103),
(104011, 'Test 02 MT 01', 20, 10, 1, 10, 'Null', '2018-01-13 19:16:41.409800', 104);

-- --------------------------------------------------------

--
-- Table structure for table `exam_useressayanswer`
--

CREATE TABLE `exam_useressayanswer` (
  `id` int(11) NOT NULL,
  `user_answer` longtext NOT NULL,
  `essay_question_id_id` int(11) NOT NULL,
  `test_id_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` datetime(6) DEFAULT NULL,
  `individual_mark` int(11) DEFAULT NULL,
  `suggestions` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_useressayanswer`
--

INSERT INTO `exam_useressayanswer` (`id`, `user_answer`, `essay_question_id_id`, `test_id_id`, `user_id`, `datetime`, `individual_mark`, `suggestions`) VALUES
(44, 'A', 1, 101012, 2, '2018-01-26 16:50:10.513344', 1, 'ok'),
(45, 'AS', 2, 101012, 2, '2018-01-26 16:50:11.480985', 1, 'nice'),
(46, 'GFDDF', 3, 101012, 2, '2018-01-26 16:50:11.526515', 1, 'ok'),
(47, 'ADSSD', 4, 101012, 2, '2018-01-26 16:50:11.571044', 1, 'good'),
(48, 'AFDS', 5, 101012, 2, '2018-01-26 16:50:11.614573', 1, 'nice'),
(49, 'ASD', 6, 101012, 2, '2018-01-26 16:50:11.659604', 1, 'bad'),
(50, 'SFSDFG', 7, 101012, 2, '2018-01-26 16:50:11.704634', 1, 'poor'),
(51, 'FSDS', 8, 101012, 2, '2018-01-26 16:50:11.759169', 1, 'good'),
(52, 'ASDAS', 9, 101012, 2, '2018-01-26 16:50:11.804699', 1, ''),
(53, 'ADDAS', 10, 101012, 2, '2018-01-26 16:50:11.859736', 1, ''),
(54, 'ajkhjkhjkjkl', 1, 102012, 2, '2018-01-26 17:15:39.318327', 1, 'ok'),
(55, 'af', 2, 102012, 2, '2018-01-26 17:15:39.371363', 1, 'not ok'),
(56, 'adf', 3, 102012, 2, '2018-01-26 17:15:39.422397', 1, ''),
(57, 'asd', 4, 102012, 2, '2018-01-26 17:15:39.463423', 1, ''),
(58, 'asd', 5, 102012, 2, '2018-01-26 17:15:39.604517', 1, 'poor'),
(59, 'asd', 6, 102012, 2, '2018-01-26 17:15:39.659554', 1, 'very good'),
(60, 'asda', 7, 102012, 2, '2018-01-26 17:15:39.749614', 1, 'need more details'),
(61, 'ad', 8, 102012, 2, '2018-01-26 17:15:39.816658', 1, 'good'),
(62, 'asdas', 9, 102012, 2, '2018-01-26 17:15:39.915724', 1, ''),
(63, 'asdasd', 10, 102012, 2, '2018-01-26 17:15:39.959753', 1, ''),
(64, 'a', 1, 101012, 13, '2018-01-28 16:46:32.268163', 9, 'very good'),
(65, 'f', 2, 101012, 13, '2018-01-28 16:46:32.395247', 0, ''),
(66, 'a', 3, 101012, 13, '2018-01-28 16:46:32.602384', 1, 'ok'),
(67, 'hs', 4, 101012, 13, '2018-01-28 16:46:32.657420', 0, ''),
(68, 'af', 5, 101012, 13, '2018-01-28 16:46:32.725468', 0, ''),
(69, 'affgd', 6, 101012, 13, '2018-01-28 16:46:32.846547', 0, 'wrong'),
(70, 'ad', 7, 101012, 13, '2018-01-28 16:46:32.948613', 0, ''),
(71, 'gg', 8, 101012, 13, '2018-01-28 16:46:33.013658', 0, ''),
(72, 'gsf', 9, 101012, 13, '2018-01-28 16:46:33.101717', 0, ''),
(73, 'a', 10, 101012, 13, '2018-01-28 16:46:33.180769', 0, ''),
(74, 'fjdkjs', 1, 102012, 13, '2018-01-29 16:16:19.362072', 3, 'average'),
(75, 'pantha', 2, 102012, 13, '2018-01-29 16:16:19.461139', 9, 'very good '),
(76, 'ahisdiugy', 3, 102012, 13, '2018-01-29 16:16:19.618242', 0, 'wrong'),
(77, 'asdg', 4, 102012, 13, '2018-01-29 16:16:19.682284', 2, ''),
(78, 'fghjl', 5, 102012, 13, '2018-01-29 16:16:19.729316', 0, 'wrong'),
(79, 'ghjkl;', 6, 102012, 13, '2018-01-29 16:16:19.763337', 1, ''),
(80, 'jlk;\'', 7, 102012, 13, '2018-01-29 16:16:19.796360', 3, ''),
(81, 'sdfghjk', 8, 102012, 13, '2018-01-29 16:16:19.830382', 0, 'poor'),
(82, 'fghjkl', 9, 102012, 13, '2018-01-29 16:16:19.862403', 2, ''),
(83, 'dfghjk', 10, 102012, 13, '2018-01-29 16:16:19.907433', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `exam_userinfo`
--

CREATE TABLE `exam_userinfo` (
  `id` int(11) NOT NULL,
  `user_contact` varchar(11) DEFAULT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `approver` varchar(200) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_userinfo`
--

INSERT INTO `exam_userinfo` (`id`, `user_contact`, `user_image`, `approver`, `datetime`, `user_id`) VALUES
(1, '01727210244', 'profile_pics/NafiulHassan.jpg', 'Null', '2017-11-17 17:06:02.562430', 1),
(2, '01234567891', 'Null', 'Null', '2017-11-20 17:52:45.813802', 2),
(13, '01727210244', 'Null', 'Null', '2018-01-28 16:44:48.838252', 13);

-- --------------------------------------------------------

--
-- Table structure for table `exam_usermcqanswer`
--

CREATE TABLE `exam_usermcqanswer` (
  `id` int(11) NOT NULL,
  `user_answer` int(11) NOT NULL,
  `mcq_question_id_id` int(11) NOT NULL,
  `test_id_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datetime` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_usermcqanswer`
--

INSERT INTO `exam_usermcqanswer` (`id`, `user_answer`, `mcq_question_id_id`, `test_id_id`, `user_id`, `datetime`) VALUES
(91, 1, 1, 101011, 2, '2018-01-20 21:46:08.156063'),
(92, 2, 2, 101011, 2, '2018-01-20 21:46:17.855488'),
(93, 3, 3, 101011, 2, '2018-01-20 21:46:17.957555'),
(94, 4, 4, 101011, 2, '2018-01-20 21:46:18.000584'),
(95, 1, 5, 101011, 2, '2018-01-20 21:46:18.044613'),
(96, 2, 6, 101011, 2, '2018-01-20 21:46:18.101652'),
(97, 3, 7, 101011, 2, '2018-01-20 21:46:18.144680'),
(98, 4, 8, 101011, 2, '2018-01-20 21:46:18.188710'),
(99, 1, 9, 101011, 2, '2018-01-20 21:46:18.232738'),
(100, 2, 10, 101011, 2, '2018-01-20 21:46:18.411856');

-- --------------------------------------------------------

--
-- Table structure for table `exam_userresult`
--

CREATE TABLE `exam_userresult` (
  `id` int(11) NOT NULL,
  `test_type` int(11) NOT NULL,
  `gained_marks` int(11) NOT NULL,
  `spend_time` decimal(5,2) NOT NULL,
  `is_passed` tinyint(1) NOT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_userresult`
--

INSERT INTO `exam_userresult` (`id`, `test_type`, `gained_marks`, `spend_time`, `is_passed`, `datetime`, `test_id_id`, `user_id`) VALUES
(6, 1, 10, '0.32', 1, '2018-01-20 21:46:18.707052', 101011, 2),
(7, 2, 10, '15.00', 1, '2018-01-28 15:44:44.836362', 101012, 2),
(9, 2, 10, '15.00', 1, '2018-01-28 15:55:12.352431', 102012, 2),
(14, 2, 10, '15.00', 1, '2018-01-29 16:10:29.773001', 101012, 13),
(16, 2, 20, '15.00', 1, '2018-01-29 16:21:02.391170', 102012, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `exam_adminreview`
--
ALTER TABLE `exam_adminreview`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_adminreview_test_id_id_a7d66d0b_fk_exam_test_test_id` (`test_id_id`),
  ADD KEY `exam_adminreview_user_id_9834b216_fk_exam_userinfo_id` (`user_id`);

--
-- Indexes for table `exam_essayquestion`
--
ALTER TABLE `exam_essayquestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_essayquestion_test_id_id_2064760d_fk_exam_test_test_id` (`test_id_id`);

--
-- Indexes for table `exam_essaysummary`
--
ALTER TABLE `exam_essaysummary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_essaysummary_test_id_id_95c2eeb2_fk_exam_test_test_id` (`test_id_id`);

--
-- Indexes for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_mcqquestion_test_id_id_da272b48_fk_exam_test_test_id` (`test_id_id`);

--
-- Indexes for table `exam_scfu_essaytesttotalquesno`
--
ALTER TABLE `exam_scfu_essaytesttotalquesno`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_scfu_essaytotaltest`
--
ALTER TABLE `exam_scfu_essaytotaltest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_scfu_mcqtesttotalquesno`
--
ALTER TABLE `exam_scfu_mcqtesttotalquesno`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_scfu_mcqtotaltest`
--
ALTER TABLE `exam_scfu_mcqtotaltest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_scfu_testtype`
--
ALTER TABLE `exam_scfu_testtype`
  ADD PRIMARY KEY (`test_type_id`);

--
-- Indexes for table `exam_scfu_userstatus`
--
ALTER TABLE `exam_scfu_userstatus`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `exam_scfu_usertype`
--
ALTER TABLE `exam_scfu_usertype`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `exam_subject`
--
ALTER TABLE `exam_subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `exam_test`
--
ALTER TABLE `exam_test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `exam_test_subject_id_id_d5f83820_fk_exam_subject_subject_id` (`subject_id_id`);

--
-- Indexes for table `exam_useressayanswer`
--
ALTER TABLE `exam_useressayanswer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_useressayanswer_test_id_id_f0d96c35_fk_exam_test_test_id` (`test_id_id`),
  ADD KEY `exam_useressayanswer_user_id_1d25cbb7_fk_exam_userinfo_id` (`user_id`),
  ADD KEY `exam_useressayanswer_essay_question_id_id_37e6a1d5_fk_exam_essa` (`essay_question_id_id`);

--
-- Indexes for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `exam_usermcqanswer`
--
ALTER TABLE `exam_usermcqanswer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_usermcqanswer_mcq_question_id_id_cc3853f7_fk_exam_mcqq` (`mcq_question_id_id`),
  ADD KEY `exam_usermcqanswer_test_id_id_86ab79a3_fk_exam_test_test_id` (`test_id_id`),
  ADD KEY `exam_usermcqanswer_user_id_3e48b73b_fk_exam_userinfo_id` (`user_id`);

--
-- Indexes for table `exam_userresult`
--
ALTER TABLE `exam_userresult`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_userresult_test_id_id_976f464d_fk_exam_test_test_id` (`test_id_id`),
  ADD KEY `exam_userresult_user_id_5f4c18a2_fk_exam_userinfo_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `exam_adminreview`
--
ALTER TABLE `exam_adminreview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `exam_essayquestion`
--
ALTER TABLE `exam_essayquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `exam_essaysummary`
--
ALTER TABLE `exam_essaysummary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `exam_scfu_essaytesttotalquesno`
--
ALTER TABLE `exam_scfu_essaytesttotalquesno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam_scfu_essaytotaltest`
--
ALTER TABLE `exam_scfu_essaytotaltest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `exam_scfu_mcqtesttotalquesno`
--
ALTER TABLE `exam_scfu_mcqtesttotalquesno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `exam_scfu_mcqtotaltest`
--
ALTER TABLE `exam_scfu_mcqtotaltest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `exam_subject`
--
ALTER TABLE `exam_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `exam_useressayanswer`
--
ALTER TABLE `exam_useressayanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `exam_usermcqanswer`
--
ALTER TABLE `exam_usermcqanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `exam_userresult`
--
ALTER TABLE `exam_userresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `exam_adminreview`
--
ALTER TABLE `exam_adminreview`
  ADD CONSTRAINT `exam_adminreview_test_id_id_a7d66d0b_fk_exam_test_test_id` FOREIGN KEY (`test_id_id`) REFERENCES `exam_test` (`test_id`),
  ADD CONSTRAINT `exam_adminreview_user_id_9834b216_fk_exam_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `exam_userinfo` (`id`);

--
-- Constraints for table `exam_essayquestion`
--
ALTER TABLE `exam_essayquestion`
  ADD CONSTRAINT `exam_essayquestion_test_id_id_2064760d_fk_exam_test_test_id` FOREIGN KEY (`test_id_id`) REFERENCES `exam_test` (`test_id`);

--
-- Constraints for table `exam_essaysummary`
--
ALTER TABLE `exam_essaysummary`
  ADD CONSTRAINT `exam_essaysummary_test_id_id_95c2eeb2_fk_exam_test_test_id` FOREIGN KEY (`test_id_id`) REFERENCES `exam_test` (`test_id`);

--
-- Constraints for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  ADD CONSTRAINT `exam_mcqquestion_test_id_id_da272b48_fk_exam_test_test_id` FOREIGN KEY (`test_id_id`) REFERENCES `exam_test` (`test_id`);

--
-- Constraints for table `exam_test`
--
ALTER TABLE `exam_test`
  ADD CONSTRAINT `exam_test_subject_id_id_d5f83820_fk_exam_subject_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `exam_subject` (`subject_id`);

--
-- Constraints for table `exam_useressayanswer`
--
ALTER TABLE `exam_useressayanswer`
  ADD CONSTRAINT `exam_useressayanswer_essay_question_id_id_37e6a1d5_fk_exam_essa` FOREIGN KEY (`essay_question_id_id`) REFERENCES `exam_essayquestion` (`id`),
  ADD CONSTRAINT `exam_useressayanswer_test_id_id_f0d96c35_fk_exam_test_test_id` FOREIGN KEY (`test_id_id`) REFERENCES `exam_test` (`test_id`),
  ADD CONSTRAINT `exam_useressayanswer_user_id_1d25cbb7_fk_exam_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `exam_userinfo` (`id`);

--
-- Constraints for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  ADD CONSTRAINT `exam_userinfo_user_id_9288bce1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `exam_usermcqanswer`
--
ALTER TABLE `exam_usermcqanswer`
  ADD CONSTRAINT `exam_usermcqanswer_mcq_question_id_id_cc3853f7_fk_exam_mcqq` FOREIGN KEY (`mcq_question_id_id`) REFERENCES `exam_mcqquestion` (`id`),
  ADD CONSTRAINT `exam_usermcqanswer_test_id_id_86ab79a3_fk_exam_test_test_id` FOREIGN KEY (`test_id_id`) REFERENCES `exam_test` (`test_id`),
  ADD CONSTRAINT `exam_usermcqanswer_user_id_3e48b73b_fk_exam_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `exam_userinfo` (`id`);

--
-- Constraints for table `exam_userresult`
--
ALTER TABLE `exam_userresult`
  ADD CONSTRAINT `exam_userresult_test_id_id_976f464d_fk_exam_test_test_id` FOREIGN KEY (`test_id_id`) REFERENCES `exam_test` (`test_id`),
  ADD CONSTRAINT `exam_userresult_user_id_5f4c18a2_fk_exam_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `exam_userinfo` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
