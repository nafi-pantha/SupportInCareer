-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 07:39 PM
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
(1, 'pbkdf2_sha256$36000$h6QuRMS5b6tX$ZjfjJW5GS2yHJxt6wFdvFufIbbuaEy8gchfPLXzKgYI=', '2018-02-07 17:05:27.289481', 0, 'nafi', 'Nafiul', 'Hassan', 'nafpantha@gmail.com', 1, 1, '2017-11-17 17:06:02.255224'),
(2, 'pbkdf2_sha256$36000$CsaTXWcfj55o$Cr3J9EpMshXj0cBpqduVbz90gfOwVt6pKDiznNPixdM=', '2018-02-07 18:27:31.444018', 0, 'sajib', 'Jahidul', 'Sajib', 'sajib@gmail.com', 0, 1, '2017-11-20 17:52:45.126263'),
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

-- --------------------------------------------------------

--
-- Table structure for table `exam_essayquestion`
--

CREATE TABLE `exam_essayquestion` (
  `id` int(11) NOT NULL,
  `essay_question_id` int(11) NOT NULL,
  `essay_question` longtext,
  `essay_question_marks` int(11) DEFAULT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `exam_mcqquestion`
--

CREATE TABLE `exam_mcqquestion` (
  `id` int(11) NOT NULL,
  `mcq_question_id` int(11) NOT NULL,
  `mcq_question` longtext,
  `mcq_option1` longtext,
  `mcq_option2` longtext,
  `mcq_option3` longtext,
  `mcq_option4` longtext,
  `mcq_right_answer` int(11) DEFAULT NULL,
  `approver` varchar(50) DEFAULT NULL,
  `datetime` datetime(6) NOT NULL,
  `test_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(16, 10),
(17, 20),
(18, 30);

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
(9, 10),
(10, 20),
(11, 30),
(12, 50);

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
(16, 10),
(17, 20),
(18, 30);

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
-- Table structure for table `exam_scfu_totaltime`
--

CREATE TABLE `exam_scfu_totaltime` (
  `id` int(11) NOT NULL,
  `test_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_scfu_totaltime`
--

INSERT INTO `exam_scfu_totaltime` (`id`, `test_time`) VALUES
(9, 15),
(10, 30),
(11, 60),
(12, 90);

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
(100, 'Type 1', 10, 5, NULL, '2018-02-07 18:00:00.000000');

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
-- Indexes for table `exam_scfu_totaltime`
--
ALTER TABLE `exam_scfu_totaltime`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `exam_adminreview`
--
ALTER TABLE `exam_adminreview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `exam_essayquestion`
--
ALTER TABLE `exam_essayquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `exam_essaysummary`
--
ALTER TABLE `exam_essaysummary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exam_mcqquestion`
--
ALTER TABLE `exam_mcqquestion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `exam_scfu_essaytesttotalquesno`
--
ALTER TABLE `exam_scfu_essaytesttotalquesno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam_scfu_essaytotaltest`
--
ALTER TABLE `exam_scfu_essaytotaltest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `exam_scfu_mcqtesttotalquesno`
--
ALTER TABLE `exam_scfu_mcqtesttotalquesno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam_scfu_mcqtotaltest`
--
ALTER TABLE `exam_scfu_mcqtotaltest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `exam_scfu_totaltime`
--
ALTER TABLE `exam_scfu_totaltime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam_subject`
--
ALTER TABLE `exam_subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `exam_useressayanswer`
--
ALTER TABLE `exam_useressayanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `exam_userinfo`
--
ALTER TABLE `exam_userinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `exam_usermcqanswer`
--
ALTER TABLE `exam_usermcqanswer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;
--
-- AUTO_INCREMENT for table `exam_userresult`
--
ALTER TABLE `exam_userresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=721;
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
