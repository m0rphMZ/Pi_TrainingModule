-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 03, 2024 at 12:50 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pi_trainingmodule`
--

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `description` text DEFAULT NULL,
  `passing_score` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('MULTIPLE_CHOICE','TRUE_FALSE','FILL_IN_THE_BLANK','MATCHING','ESSAY') DEFAULT NULL,
  `training_content_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `created_date`, `description`, `passing_score`, `title`, `type`, `training_content_id`) VALUES
(1, '2024-04-02 23:36:42.000000', 'Test your understanding of core CSERS security concepts.', 75, 'CSERS Security Basics', 'MULTIPLE_CHOICE', NULL),
(2, '2024-04-02 23:36:49.000000', 'Determine if the statements about CSERS procedures are true or false.', 80, 'CSERS True or False', 'TRUE_FALSE', NULL),
(3, '2024-04-02 23:36:55.000000', 'Complete the sentences with the appropriate CSERS-related terms.', 60, 'CSERS Terminology', 'FILL_IN_THE_BLANK', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question`
--

CREATE TABLE `quiz_question` (
  `id` bigint(20) NOT NULL,
  `answer_choicea` varchar(255) DEFAULT NULL,
  `answer_choiceb` varchar(255) DEFAULT NULL,
  `answer_choicec` varchar(255) DEFAULT NULL,
  `answer_choiced` varchar(255) DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `essay_answer_example` tinytext DEFAULT NULL,
  `explanation` tinytext DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `quiz_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_question`
--

INSERT INTO `quiz_question` (`id`, `answer_choicea`, `answer_choiceb`, `answer_choicec`, `answer_choiced`, `correct_answer`, `essay_answer_example`, `explanation`, `text`, `quiz_id`) VALUES
(1, NULL, NULL, NULL, NULL, 'Centralizing emergency notifications', NULL, NULL, 'Which of the following is a primary function of the CSERS platform?', 1),
(2, NULL, NULL, NULL, NULL, 'All of the above', NULL, NULL, 'What type of information can be shared through CSERS during an active incident?', 1),
(3, NULL, NULL, NULL, NULL, 'false', NULL, NULL, 'CSERS can only be accessed by campus security personnel.', 2),
(4, NULL, NULL, NULL, NULL, 'true', NULL, NULL, 'Students should use CSERS to report suspicious activity.', 2),
(5, NULL, NULL, NULL, NULL, 'template', NULL, NULL, 'A _________  is a pre-written message that can be quickly sent out during an emergency.', NULL),
(6, NULL, NULL, NULL, NULL, 'incident', NULL, NULL, 'The ________ dashboard provides a real-time overview of an active situation.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `training_content`
--

CREATE TABLE `training_content` (
  `id` bigint(20) NOT NULL,
  `completed` bit(1) DEFAULT NULL,
  `content` tinyblob DEFAULT NULL,
  `content_url` varchar(500) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `description` text DEFAULT NULL,
  `estimated_time` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type` enum('VIDEO','DOCUMENT','PRESENTATION','EXTERNAL_URL') DEFAULT NULL,
  `video_duration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7si6ebomnv9juj4p7oan7ian5` (`training_content_id`);

--
-- Indexes for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdtynvfjgh6e7fd8l0wk37nrpc` (`quiz_id`);

--
-- Indexes for table `training_content`
--
ALTER TABLE `training_content`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `training_content`
--
ALTER TABLE `training_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `FK7si6ebomnv9juj4p7oan7ian5` FOREIGN KEY (`training_content_id`) REFERENCES `training_content` (`id`);

--
-- Constraints for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD CONSTRAINT `FKdtynvfjgh6e7fd8l0wk37nrpc` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
