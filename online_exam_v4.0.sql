-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2017 at 07:31 PM
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
(45, 'Can delete admin review', 15, 'delete_adminreview');

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
(1, 'pbkdf2_sha256$36000$h6QuRMS5b6tX$ZjfjJW5GS2yHJxt6wFdvFufIbbuaEy8gchfPLXzKgYI=', '2017-12-23 18:21:54.825536', 0, 'nafi', '', '', 'nafpantha@gmail.com', 1, 1, '2017-11-17 17:06:02.255224'),
(2, 'pbkdf2_sha256$36000$CsaTXWcfj55o$Cr3J9EpMshXj0cBpqduVbz90gfOwVt6pKDiznNPixdM=', '2017-12-23 18:15:45.261114', 0, 'sajib', '', '', 'sajib@gmail.com', 0, 1, '2017-11-20 17:52:45.126263');

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
(7, 'exam', 'mcqquestion'),
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
(21, 'exam', '0008_adminreview_spend_time', '2017-12-16 17:27:58.633049');

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
('4wvbxzlfwjrgzs6g3zemtxvrrtrk3kt0', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-03 18:17:36.669539'),
('6etm7w81dmys95tvx0t55cie5dnmobvj', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-23 19:19:37.686448'),
('76ufnaviqn6l7imikmlgy3vnnrrj51ew', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-26 15:34:16.248866'),
('7gl5o9x8d2gi60mm5ixkfn8zyw66t8d6', 'ZTdmM2E3YjUyNmYwZWFjY2VmMjFhNmNjNDNlZTA2ZTE1YjkyODM3Mjp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6MiwiX3Nlc3Npb25fZXhwaXJ5IjoxMH0=', '2017-12-10 15:17:38.249086'),
('atoxlcob9yiha8h0enjyyvwfmebnnwn3', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-02 14:38:36.486456'),
('bvi9mcjxnppw5s9fuf8lj3ovwa26ri6r', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-25 16:18:29.719568'),
('bwhjiusqucki7umcvzqbaawtwbzah96e', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-06 15:25:05.863491'),
('caubtncpj5xp725m87csnrf5vkvuxhm8', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-20 15:50:31.284130'),
('cpar4xidk4ucrh9rdpdredi06jfn5fac', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-06 18:21:54.984641'),
('dd8oum90t2r8hidhf7792fb5s53leggy', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2017-12-25 14:52:41.806067'),
('gxjf8xvflnyenxw57s3hjhubaowxvfg3', 'NzFmOWM3YWJmZGIyNjU1MTAwYzg3MDNkNzM0NGFjNTA4NzM2MzFiNjp7InVzZXJuYW1lIjoic2FqaWIiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmEzMzU4NzU4MTViNzMyOTY5OWY1NGM1MDE5MzgzZjA5YWU3NTY3MyJ9', '2017-12-23 16:34:22.893515'),
('h7wxes38y4z4ganq0r53i5ucjm7uyjot', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-18 18:37:14.583476'),
('hegroj32e2klf5kp5xpsmx4vdox4amts', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-01-06 15:23:50.046175'),
('i7wrvnyiu9vcvs13viqrus7t9t1rwoji', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-16 17:14:11.150974'),
('n2xvxrs1ix9y1o41eg09z5n3anwjyrky', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2017-12-30 17:33:25.272505'),
('nswn93idnhdbytptgoeu9xob25il5m90', 'NzA5YzM0OTdhZTRjNjg2M2M2YTg4MWMxYWQ2ZDY3ZGEzYjI4NDc3ODp7InVzZXJuYW1lIjoibmFmaSIsImlzX3N0YWZmIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWM0ZTEwYWUwZTE5NDIyMDMxYTljNGFmYjgzNzI0Zjg5MmJjZTRmYSIsImlkIjoxfQ==', '2018-01-05 16:28:27.395732'),
('rvvub7hs1jlhrgy6adus4f74e6qtg73m', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-17 18:12:37.983439'),
('slgfbwypnlunodw472w75vzpl170cdfx', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-17 17:26:43.223854'),
('snyhciy8ood5at0aizi6zghsy0x8n73y', 'MTdkN2ZiMjUyMGU2ZjNiZGRiMGM2YTlhNjQ1OTE4NWMwM2IwMGQ4Mzp7InVzZXJuYW1lIjoic2FqaWIiLCJpc19zdGFmZiI6MCwiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhMzM1ODc1ODE1YjczMjk2OTlmNTRjNTAxOTM4M2YwOWFlNzU2NzMiLCJpZCI6Mn0=', '2018-01-06 18:15:18.733518'),
('u06i5nug6zdc7hue7hc8gkrfhwbetmtd', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-14 23:25:55.681724'),
('vhormggfe9a2svekgtnxbl445kdlaehg', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-19 19:47:50.754060'),
('wcvu5ex0r61y72idrys6ypapz1dhct26', 'ZTFiYTg1OWM0NTJjNTU2N2Y1NzUzZWNmZTA1ZTc1MWIwYzc5MjA2Yjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYTMzNTg3NTgxNWI3MzI5Njk5ZjU0YzUwMTkzODNmMDlhZTc1NjczIn0=', '2017-12-19 20:03:03.590280');

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
(12, 1, 'Null', '2017-12-23 18:18:19.215291', 101012, 2, NULL);

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
(1, 1, 'AFD', 1, 'Null', '2017-11-22 17:44:22.782653', 101012),
(2, 2, 'AMDSN', 1, 'Null', '2017-11-22 17:44:22.860703', 101012),
(3, 3, 'AFSA', 1, 'Null', '2017-11-22 17:44:22.925746', 101012),
(4, 4, 'SAFL', 1, 'Null', '2017-11-22 17:44:23.185920', 101012),
(5, 5, 'ADHFGKHJ', 1, 'Null', '2017-11-22 17:44:44.842395', 101012),
(6, 6, 'A.M', 1, 'Null', '2017-11-22 17:44:23.292993', 101012),
(7, 7, 'AML', 1, 'Null', '2017-11-22 17:44:23.326014', 101012),
(8, 8, 'LKJ', 1, 'Null', '2017-11-22 17:44:23.393058', 101012),
(9, 9, 'KJ', 1, 'Null', '2017-11-22 17:44:23.436087', 101012),
(10, 10, 'LS', 1, 'Null', '2017-11-22 17:44:23.504132', 101012);

-- --------------------------------------------------------

--
-- Table structure for table `exam_mcqquestion`
--

CREATE TABLE `exam_mcqquestion` (
  `id` int(11) NOT NULL,
  `mcq_question_id` int(11) NOT NULL,
  `mcq_question` varchar(100) NOT NULL,
  `mcq_option1` varchar(50) NOT NULL,
  `mcq_option2` varchar(50) NOT NULL,
  `mcq_option3` varchar(50) NOT NULL,
  `mcq_option4` varchar(50) NOT NULL,
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
(10, 10, 'a', 'a', 'a', 'a', 'a', 2, 'Null', '2017-11-22 17:37:56.803542', 101011);

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
(101, 'Algorithm', 20, 20, 'Null', '2017-11-17 17:26:42.448065'),
(102, 'CSE', 20, 20, 'Null', '2017-11-22 17:45:15.629971');

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
(101011, 'Algo MT 01', 10, 15, 1, 10, 'Null', '2017-11-22 17:35:45.867676', 101),
(101012, 'Algo Essay 01', 10, 30, 2, 10, 'Null', '2017-11-22 17:43:36.761891', 101),
(101021, 'Algo MT 02', 10, 30, 1, 10, 'Null', '2017-11-28 16:45:01.230575', 101);

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
(24, 'usadkhuayu au yhu hui iu u u u u u u u u u u uu u u u uu u u u u u ', 1, 101012, 2, '2017-12-23 18:18:08.678972', 1, ''),
(25, 'jakdhfxc', 2, 101012, 2, '2017-12-23 18:18:18.627900', 1, ''),
(26, 'jhtdjhyxjhjhx', 3, 101012, 2, '2017-12-23 18:18:18.717961', 1, ''),
(27, 'hsdh', 4, 101012, 2, '2017-12-23 18:18:18.884573', 1, ''),
(28, 'khakh', 5, 101012, 2, '2017-12-23 18:18:18.933103', 1, ''),
(29, 'jhadj', 6, 101012, 2, '2017-12-23 18:18:18.972629', 1, ''),
(30, 'khsdajh', 7, 101012, 2, '2017-12-23 18:18:19.019661', 1, ''),
(31, 'hajh', 8, 101012, 2, '2017-12-23 18:18:19.063690', 1, ''),
(32, 'haj', 9, 101012, 2, '2017-12-23 18:18:19.121728', 1, ''),
(33, 'hjs', 10, 101012, 2, '2017-12-23 18:18:19.171762', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `exam_userinfo`
--

CREATE TABLE `exam_userinfo` (
  `id` int(11) NOT NULL,
  `user_contact` varchar(11) NOT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `approver` varchar(200) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_userinfo`
--

INSERT INTO `exam_userinfo` (`id`, `user_contact`, `user_image`, `approver`, `datetime`, `user_id`) VALUES
(1, '01727210244', 'profile_pics/20108232_1781263908569669_705545318971396210_n.jpg', 'Null', '2017-11-17 17:06:02.562430', 1),
(2, '01234567891', 'profile_pics/logo.png', 'Null', '2017-11-20 17:52:45.813802', 2);

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
(81, 1, 1, 101011, 2, '2017-12-14 18:14:37.203028'),
(82, 2, 2, 101011, 2, '2017-12-14 18:14:37.645325'),
(83, 3, 3, 101011, 2, '2017-12-14 18:14:37.690352'),
(84, 4, 4, 101011, 2, '2017-12-14 18:14:37.758398'),
(85, 4, 5, 101011, 2, '2017-12-14 18:14:37.801426'),
(86, 3, 6, 101011, 2, '2017-12-14 18:14:37.847458'),
(87, 2, 7, 101011, 2, '2017-12-14 18:14:37.890485'),
(88, 1, 8, 101011, 2, '2017-12-14 18:14:37.936515'),
(89, 1, 9, 101011, 2, '2017-12-14 18:14:37.979544'),
(90, 2, 10, 101011, 2, '2017-12-14 18:14:38.047589');

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
(2, 1, 6, '0.26', 0, '2017-12-14 18:14:38.288751', 101011, 2),
(4, 2, 10, '15.00', 1, '2017-12-23 18:19:41.981947', 101012, 2);

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
-- Indexes for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_mcqquestion_test_id_id_da272b48_fk_exam_test_test_id` (`test_id_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `exam_adminreview`
--
ALTER TABLE `exam_adminreview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam_essayquestion`
--
ALTER TABLE `exam_essayquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `exam_subject`
--
ALTER TABLE `exam_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `exam_useressayanswer`
--
ALTER TABLE `exam_useressayanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `exam_usermcqanswer`
--
ALTER TABLE `exam_usermcqanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `exam_userresult`
--
ALTER TABLE `exam_userresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
