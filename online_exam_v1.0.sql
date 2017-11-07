-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2017 at 08:28 PM
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
(25, 'Can add test', 9, 'add_test'),
(26, 'Can change test', 9, 'change_test'),
(27, 'Can delete test', 9, 'delete_test'),
(28, 'Can add mcq question', 10, 'add_mcqquestion'),
(29, 'Can change mcq question', 10, 'change_mcqquestion'),
(30, 'Can delete mcq question', 10, 'delete_mcqquestion'),
(31, 'Can add essay question', 11, 'add_essayquestion'),
(32, 'Can change essay question', 11, 'change_essayquestion'),
(33, 'Can delete essay question', 11, 'delete_essayquestion'),
(34, 'Can add mcq answer', 12, 'add_mcqanswer'),
(35, 'Can change mcq answer', 12, 'change_mcqanswer'),
(36, 'Can delete mcq answer', 12, 'delete_mcqanswer');

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
(11, 'exam', 'essayquestion'),
(12, 'exam', 'mcqanswer'),
(10, 'exam', 'mcqquestion'),
(8, 'exam', 'subject'),
(9, 'exam', 'test'),
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
(1, 'contenttypes', '0001_initial', '2017-11-02 18:55:54.779404'),
(2, 'auth', '0001_initial', '2017-11-02 18:56:05.257985'),
(3, 'admin', '0001_initial', '2017-11-02 18:56:08.413834'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-11-02 18:56:08.458867'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-11-02 18:56:09.903855'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-11-02 18:56:11.057963'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-11-02 18:56:12.068843'),
(8, 'auth', '0004_alter_user_username_opts', '2017-11-02 18:56:12.142755'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-11-02 18:56:12.815568'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-11-02 18:56:12.867976'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-11-02 18:56:12.933617'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-11-02 18:56:13.851682'),
(13, 'sessions', '0001_initial', '2017-11-02 18:56:14.504311'),
(14, 'exam', '0001_initial', '2017-11-02 20:15:15.837197'),
(15, 'exam', '0002_userinfo_is_admin', '2017-11-02 20:22:28.502776'),
(16, 'exam', '0003_auto_20171103_0232', '2017-11-02 20:32:20.713516'),
(17, 'exam', '0004_subject', '2017-11-02 20:39:44.584587'),
(18, 'exam', '0005_auto_20171103_0240', '2017-11-02 20:40:26.002979'),
(19, 'exam', '0006_auto_20171103_0301', '2017-11-02 21:06:26.816704'),
(20, 'exam', '0007_test', '2017-11-02 21:06:36.924013'),
(21, 'exam', '0008_mcqquestion', '2017-11-02 21:22:49.887961'),
(22, 'exam', '0009_essayquestion', '2017-11-02 21:33:08.513838'),
(23, 'exam', '0010_mcqanswer', '2017-11-02 21:57:55.516476'),
(24, 'exam', '0011_auto_20171103_0400', '2017-11-02 22:01:00.600337'),
(25, 'exam', '0012_auto_20171103_0409', '2017-11-02 22:09:13.916066'),
(26, 'exam', '0013_auto_20171103_0410', '2017-11-02 22:10:15.065724'),
(27, 'exam', '0014_auto_20171103_0430', '2017-11-02 22:30:45.068828'),
(28, 'exam', '0015_auto_20171103_0445', '2017-11-02 22:45:23.074331'),
(29, 'exam', '0016_auto_20171103_1637', '2017-11-03 10:37:08.082077'),
(30, 'exam', '0017_auto_20171104_0020', '2017-11-04 15:38:02.124832'),
(31, 'exam', '0018_auto_20171104_0414', '2017-11-04 15:38:04.835200'),
(32, 'exam', '0018_auto_20171104_0219', '2017-11-04 15:38:06.503644'),
(33, 'exam', '0019_merge_20171104_0436', '2017-11-04 15:38:06.550542'),
(34, 'exam', '0020_auto_20171104_0439', '2017-11-04 15:38:12.273997'),
(35, 'exam', '0021_auto_20171104_2220', '2017-11-04 16:20:18.857584'),
(36, 'exam', '0022_test_test_total_questions', '2017-11-04 16:23:17.593730'),
(37, 'exam', '0023_auto_20171106_2345', '2017-11-06 17:45:56.448166');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_essayquestion`
--

CREATE TABLE `exam_essayquestion` (
  `essay_question_id` int(11) NOT NULL,
  `essay_question` longtext NOT NULL,
  `essay_question_marks` int(11) NOT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_mcqquestion`
--

CREATE TABLE `exam_mcqquestion` (
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
(141, 'Algorithm', 50, 20, 'Null', '2017-11-04 17:20:21.362875');

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
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `subject_id_id` int(11) NOT NULL,
  `test_total_questions` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_userinfo`
--

CREATE TABLE `exam_userinfo` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_contact` varchar(11) NOT NULL,
  `user_image` varchar(100) DEFAULT NULL,
  `user_email` varchar(254) NOT NULL,
  `user_status` tinyint(1) NOT NULL,
  `user_password` varchar(11) NOT NULL,
  `approver` varchar(200) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_userinfo`
--

INSERT INTO `exam_userinfo` (`user_id`, `user_name`, `user_contact`, `user_image`, `user_email`, `user_status`, `user_password`, `approver`, `datetime`, `is_admin`) VALUES
(1104010, 'sajib', '01923099786', '', 'abc@gmail.com', 0, 'pass12345', 'sajib', '2017-11-03 00:00:00.000000', 1),
(1104020, 'noman', '01923099786', 'profile_pics/20907139_1750713331624390_1186776786_o.jpg', 'noman@gmail.com', 0, 'pass12345', 'Null', '2017-11-06 18:04:10.320402', 0),
(1104118, 'nafi', '01923099786', '', 'nafi@gmail.com', 0, 'pass12345', 'sajib', '2017-11-02 18:00:00.000000', 0);

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
  ADD PRIMARY KEY (`essay_question_id`),
  ADD KEY `exam_essayquestion_test_id_id_2064760d_fk_exam_test_test_id` (`test_id_id`);

--
-- Indexes for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  ADD PRIMARY KEY (`mcq_question_id`),
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
  ADD PRIMARY KEY (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
