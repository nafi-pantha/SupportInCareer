-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2017 at 09:23 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

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
(19, 'Can add user info', 7, 'add_userinfo'),
(20, 'Can change user info', 7, 'change_userinfo'),
(21, 'Can delete user info', 7, 'delete_userinfo'),
(22, 'Can add subject', 8, 'add_subject'),
(23, 'Can change subject', 8, 'change_subject'),
(24, 'Can delete subject', 8, 'delete_subject'),
(25, 'Can add mcq question', 9, 'add_mcqquestion'),
(26, 'Can change mcq question', 9, 'change_mcqquestion'),
(27, 'Can delete mcq question', 9, 'delete_mcqquestion'),
(28, 'Can add essay question', 10, 'add_essayquestion'),
(29, 'Can change essay question', 10, 'change_essayquestion'),
(30, 'Can delete essay question', 10, 'delete_essayquestion'),
(31, 'Can add test', 11, 'add_test'),
(32, 'Can change test', 11, 'change_test'),
(33, 'Can delete test', 11, 'delete_test');

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
(1, 'pbkdf2_sha256$36000$YZBheAmk68Uq$avqSBdr9FEW+k3Xw80WfZa6kqVs8pljIBfkOV8gcfsc=', '2017-11-17 08:17:21.610162', 0, 'nafi', '', '', 'nafi@gmail.com', 1, 1, '2017-11-17 07:52:04.282516');

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
(10, 'exam', 'essayquestion'),
(9, 'exam', 'mcqquestion'),
(8, 'exam', 'subject'),
(11, 'exam', 'test'),
(7, 'exam', 'userinfo'),
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
(1, 'contenttypes', '0001_initial', '2017-11-17 07:49:30.798117'),
(2, 'auth', '0001_initial', '2017-11-17 07:49:42.838716'),
(3, 'admin', '0001_initial', '2017-11-17 07:49:45.481777'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-11-17 07:49:45.548329'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-11-17 07:49:47.095957'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-11-17 07:49:48.248241'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-11-17 07:49:49.493429'),
(8, 'auth', '0004_alter_user_username_opts', '2017-11-17 07:49:49.560566'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-11-17 07:49:50.236192'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-11-17 07:49:50.314726'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-11-17 07:49:50.383289'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-11-17 07:49:52.438549'),
(13, 'sessions', '0001_initial', '2017-11-17 07:49:53.269343'),
(14, 'exam', '0001_initial', '2017-11-17 07:50:21.576294');

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
('qzokdxkc1s93p1g2v0stz18b1h9mle3r', 'MDRiNmYyNjk3NGFhNjY0NmI5ODhlNjcxYTE2ZjE1ZGExNzI3MDkzZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZjI5NTQwZDFhMTAzNTIwYTY1Njk5MjkyMDg0MDA1NTRlOGE2YWM5In0=', '2017-12-01 08:17:21.672663');

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
(1, 1, 'er', 5, 'Null', '2017-11-17 08:10:52.587951', 101012),
(2, 2, 'er', 5, 'Null', '2017-11-17 08:10:52.664400', 101012),
(3, 3, 'er', 2, 'Null', '2017-11-17 08:12:18.300287', 101012),
(4, 4, 'er', 5, 'Null', '2017-11-17 08:10:52.863519', 101012),
(5, 5, 'er', 5, 'Null', '2017-11-17 08:10:52.924173', 101012),
(6, 6, 'er', 5, 'Null', '2017-11-17 08:10:52.978033', 101012),
(7, 7, 'er', 5, 'Null', '2017-11-17 08:10:53.024080', 101012),
(8, 8, 'er', 5, 'Null', '2017-11-17 08:10:53.070011', 101012),
(9, 9, 'er', 5, 'Null', '2017-11-17 08:10:53.111970', 101012),
(10, 10, 'er', 5, 'Null', '2017-11-17 08:10:53.155997', 101012),
(11, 1, 'vv', 7, 'Null', '2017-11-17 08:17:08.473238', 101022),
(12, 2, 'vv', 7, 'Null', '2017-11-17 08:17:08.548121', 101022),
(13, 3, 'ss', 9, 'Null', '2017-11-17 08:17:48.889027', 101022),
(14, 4, 'vv', 7, 'Null', '2017-11-17 08:17:08.691222', 101022),
(15, 5, 'vv', 7, 'Null', '2017-11-17 08:17:08.735908', 101022),
(16, 6, 'vv', 7, 'Null', '2017-11-17 08:17:08.791946', 101022),
(17, 7, 'vv', 7, 'Null', '2017-11-17 08:17:08.825968', 101022),
(18, 8, 'vv', 7, 'Null', '2017-11-17 08:17:08.868996', 101022),
(19, 9, 'vv', 7, 'Null', '2017-11-17 08:17:08.903018', 101022),
(20, 10, 'vv', 7, 'Null', '2017-11-17 08:17:08.947048', 101022);

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
(1, 1, 'a', 'a', 'a', 'a', 'a', 4, 'Null', '2017-11-17 07:57:24.699215', 101011),
(2, 2, 'a', 'a', 'a', 'a', 'a', 2, 'Null', '2017-11-17 07:56:44.909007', 101011),
(3, 3, 'aa', 'a', 'a', 'a', 'a', 3, 'Null', '2017-11-17 07:56:44.972791', 101011),
(4, 4, 'a', 'a', 'a', 'a', 'a', 4, 'Null', '2017-11-17 07:56:45.076680', 101011),
(5, 5, 'a', 'a', 'a', 'a', 'a', 1, 'Null', '2017-11-17 07:56:45.131382', 101011),
(6, 6, 'aa', 'a', 'a', 'a', 'a', 2, 'Null', '2017-11-17 07:56:45.175634', 101011),
(7, 7, 'a', 'a', 'a', 'a', 'a', 3, 'Null', '2017-11-17 07:56:45.228855', 101011),
(8, 8, 'a', 'a', 'a', 'a', 'a', 4, 'Null', '2017-11-17 07:56:45.276967', 101011),
(9, 9, 'a', 'a', 'a', 'a', 'a', 4, 'Null', '2017-11-17 07:56:45.322769', 101011),
(10, 10, 'a', 'a', 'a', 'a', 'a', 4, 'Null', '2017-11-17 07:56:45.368065', 101011),
(11, 1, 'b', 'b', 'b', 'b', 'b', 1, 'Null', '2017-11-17 08:01:12.638341', 101021),
(12, 2, 'b', 'b', 'b', 'b', 'b', 2, 'Null', '2017-11-17 08:01:12.712535', 101021),
(13, 3, 'b', 'b', 'b', 'b', 'b', 3, 'Null', '2017-11-17 08:01:12.783426', 101021),
(14, 4, 'b', 'b', 'b', 'b', 'b', 4, 'Null', '2017-11-17 08:01:12.945659', 101021),
(15, 5, 'b', 'b', 'b', 'b', 'b', 1, 'Null', '2017-11-17 08:01:12.990716', 101021),
(16, 6, 'b', 'b', 'b', 'b', 'b', 4, 'Null', '2017-11-17 08:01:13.034745', 101021),
(17, 7, 'b', 'b', 'b', 'b', 'b', 1, 'Null', '2017-11-17 08:01:13.079775', 101021),
(18, 8, 'b', 'b', 'b', 'b', 'b', 2, 'Null', '2017-11-17 08:01:13.122804', 101021),
(19, 9, 'b', 'b', 'b', 'b', 'b', 3, 'Null', '2017-11-17 08:01:13.167834', 101021),
(20, 10, 'b', 'b', 'b', 'b', 'b', 3, 'Null', '2017-11-17 08:01:13.211862', 101021);

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
(101, 'Algorithm', 20, 20, 'Null', '2017-11-17 07:54:59.732915');

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
(101011, 'class test', 10, 30, 1, 10, 'Null', '2017-11-17 07:55:33.976980', 101),
(101012, 'Essay Test1', 50, 50, 2, 10, 'Null', '2017-11-17 08:05:43.562694', 101),
(101021, 'class test 2', 10, 30, 1, 10, 'Null', '2017-11-17 08:00:01.002724', 101),
(101022, 'Essay Test 2', 100, 55, 2, 10, 'Null', '2017-11-17 08:16:06.285776', 101);

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
(1, '0123456', 'profile_pics/images.jpg', 'Null', '2017-11-17 07:52:04.481724', 1);

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
-- Indexes for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `exam_essayquestion`
--
ALTER TABLE `exam_essayquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- Constraints for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  ADD CONSTRAINT `exam_userinfo_user_id_9288bce1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
