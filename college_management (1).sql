-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Sep 28, 2026 at 05:35 PM
-- Server version: 10.3.14-MariaDB
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
CREATE TABLE IF NOT EXISTS `assignments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `title`, `description`, `file_path`, `teacher_id`, `course_id`, `due_date`, `created_at`) VALUES
(1, 'pyhon', '', '', 1, 4, '2026-04-11', '2026-09-21 18:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `code`, `name`, `description`) VALUES
(3, '11', 'MCA', ''),
(4, '2', 'BCA', '');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
CREATE TABLE IF NOT EXISTS `marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `exam_name` varchar(100) NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `total_marks` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `student_id`, `course_id`, `exam_name`, `marks_obtained`, `total_marks`) VALUES
(1, 2, 4, 'sem 1', '50.00', '100.00'),
(2, 3, 4, 'sem 1', '44.00', '100.00');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
CREATE TABLE IF NOT EXISTS `notices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `posted_by` int(11) NOT NULL,
  `target_role` enum('all','student','teacher') NOT NULL DEFAULT 'all',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `posted_by` (`posted_by`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `content`, `posted_by`, `target_role`, `created_at`) VALUES
(1, 'holiday', 'due to rain we have holiday', 1, 'all', '2026-09-21 13:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone`, `course_id`, `enrollment_date`) VALUES
(1, 2, 'CHAUHAN', 'VIRAJ', 'virajsinh30895@gmail.com', '9925136205', 3, '2026-06-16'),
(2, 3, 'pratham', 'dagi', 'pratham@gamil.com', '9925136206', 4, '2026-06-18'),
(3, 4, 'viraj', 'chuahan', 'virajsinhchauhan9696@gmail.com', '9925136205', 4, '2026-06-28');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone`, `department`) VALUES
(1, 5, 'Test', 'Teacher', 'testteacher@example.com', NULL, NULL),
(2, 6, 'nirav', 'dangi', 'nirav@gmail.com', '9925136204', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$00o0.Co9m/WSYyjuqAWvKeVKCSC7Is1QVOpuzK0uobxPYmRQgpagW', 'admin', '2026-06-16 11:23:06'),
(2, 'VIRAJSINH2502', '$2y$10$tBOIxo0RpOeyGa2v1mcTV.vjb95xdOBtoSREpQ77pyqq/CGO5S30W', 'student', '2026-06-16 13:29:59'),
(3, 'pratham12', '$2y$10$89ZUfcvCWbBRFuwWGSBDrOEZy2CWgH9CJDpTnCYUYjmiSZxCl9mue', 'student', '2026-06-18 09:32:29'),
(4, 'VIRAJSINH2505', '$2y$10$IxmUaEqs5LfrAOwThUGKrOQGLNuISrrE/iFJGa3rFprUHPyq.tL76', 'student', '2026-06-28 10:42:51'),
(6, '222222211112233', '$2y$10$sA0D0l1grqbs/.FWmaDJruoQPPW8bf/cgzxZ5PNbho7YeJsX.EH3C', 'teacher', '2026-09-21 18:22:46');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
