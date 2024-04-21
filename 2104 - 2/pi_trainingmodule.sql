-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 21, 2024 at 10:14 PM
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
(42, '2024-04-21 20:02:03.000000', 'Test your knowledge of emergency response procedures within the ESPRIT campus community.', 75, 'Emergency Response Campus Readiness Quiz', 'MULTIPLE_CHOICE', 3),
(44, '2024-04-21 20:07:21.000000', 'Test your knowledge of emergency response procedures within the ESPRIT campus community by filling in the blanks.', 90, 'Emergency Response Campus Fill in the Blank Quiz', 'FILL_IN_THE_BLANK', 3),
(45, '2024-04-21 20:09:29.000000', 'Match the term with its corresponding definition related to emergency response procedures within the ESPRIT campus community.', 15, 'Emergency Response Campus Matching Quiz', 'MATCHING', 3),
(47, '2024-04-21 20:20:26.000000', 'Provide detailed responses to the following essay questions related to emergency response procedures within the ESPRIT campus community.', 50, 'Emergency Response Campus Essay Quiz', 'ESSAY', 3),
(48, '2024-04-21 20:43:21.000000', 'Test your understanding of emergency response procedures within the ESPRIT campus community with true/false questions.', 120, 'Emergency Response Campus True/False Quiz', 'TRUE_FALSE', 3);

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
  `essay_answer_example` varchar(1000) DEFAULT NULL,
  `explanation` tinytext DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `quiz_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_question`
--

INSERT INTO `quiz_question` (`id`, `answer_choicea`, `answer_choiceb`, `answer_choicec`, `answer_choiced`, `correct_answer`, `essay_answer_example`, `explanation`, `text`, `quiz_id`) VALUES
(69, 'Campus Security and Emergency Response System', 'Emergency Campus Response Platform', 'Campus Safety and Emergency Resource System', 'Emergency Services and Response System', 'A', NULL, 'CSERS stands for Campus Security and Emergency Response System. It is a web-based platform designed to centralize security management and streamline emergency response procedures within the ESPRIT campus community.', 'What does CSERS stand for?', 42),
(70, 'To manage campus events', 'To schedule classes', 'To centralize security management and streamline emergency response procedures', 'To organize campus clubs', 'C', NULL, 'The primary purpose of CSERS is to centralize security management and streamline emergency response procedures within the ESPRIT campus community.', 'What is the primary purpose of CSERS?', 42),
(71, 'The response time of emergency services', 'Efficient coordination of actions and communication during an emergency', 'Managing campus events', 'Organizing campus clubs', 'B', NULL, '\'Coordinated response\' in the context of CSERS refers to the ability to efficiently coordinate actions and communication among campus security personnel, faculty, staff, and students during an emergency.', 'In the context of CSERS, what does \'coordinated response\' refer to?', 42),
(76, NULL, NULL, NULL, NULL, 'evacuate', NULL, NULL, 'In case of fire, the recommended evacuation route is to __________ the building using the nearest exit.', 44),
(77, NULL, NULL, NULL, NULL, 'campus security', NULL, NULL, 'During an emergency, students and staff should follow the instructions of __________ personnel.', 44),
(78, NULL, NULL, NULL, NULL, 'safety', NULL, NULL, 'CSERS allows for efficient information sharing and coordinated response, enhancing campus __________.', 44),
(79, NULL, NULL, NULL, NULL, 'community', NULL, NULL, 'The primary purpose of CSERS is to centralize security management and streamline emergency response procedures within the ESPRIT campus __________.', 44),
(80, 'A. Designated path for safely exiting a building during an emergency.', 'B. Location where individuals gather after evacuating a building during an emergency.', NULL, NULL, 'A', NULL, NULL, 'Match the term with its corresponding definition: \n\n A. Evacuation Route', 45),
(81, 'A. Designated path for safely exiting a building during an emergency.', 'B. Location where individuals gather after evacuating a building during an emergency.', NULL, NULL, 'B', NULL, NULL, 'Match the term with its corresponding definition: \n\n B. Assembly Point', 45),
(82, 'A. Collection of supplies and equipment used to provide medical assistance.', 'B. A designated area where individuals can seek shelter during severe weather events.', NULL, NULL, 'A', NULL, NULL, 'Match the term with its corresponding definition: \n\n A. First Aid Kit', 45),
(83, 'A. Collection of supplies and equipment used to provide medical assistance.', 'B. A designated area where individuals can seek shelter during severe weather events.', NULL, NULL, 'B', NULL, NULL, 'Match the term with its corresponding definition: \n\n B. Shelter Area', 45),
(84, NULL, NULL, NULL, NULL, NULL, 'A comprehensive emergency response system like CSERS is crucial for ensuring the safety and security of individuals within the ESPRIT campus community. CSERS centralizes security management and streamlines emergency response procedures, allowing for efficient coordination and communication during emergencies. By providing timely and accurate information, CSERS helps to mitigate risks and facilitate prompt decision-making by campus authorities. Additionally, CSERS enhances preparedness by allowing for regular training and drills, ensuring that students, faculty, and staff are well-equipped to respond effectively to various emergency situations.', NULL, 'Discuss the importance of having a comprehensive emergency response system like CSERS in place within the ESPRIT campus community.', 47),
(85, NULL, NULL, NULL, NULL, NULL, 'Students play a crucial role in promoting a culture of safety and preparedness within the ESPRIT campus community. They can contribute by familiarizing themselves with emergency procedures outlined in CSERS, participating in emergency drills, and reporting any safety concerns or hazards to campus authorities. Additionally, students can take proactive measures to ensure their own safety and that of others by staying informed about potential risks, following safety protocols, and assisting others during emergencies. By actively engaging in campus safety initiatives, students help to create a safer and more resilient campus environment.', NULL, 'Describe the role of students in promoting a culture of safety and preparedness within the ESPRIT campus community.', 47),
(86, NULL, NULL, NULL, NULL, NULL, 'Regular training and preparedness exercises are essential for maintaining readiness for emergency situations within the ESPRIT campus community. These exercises allow students, faculty, and staff to familiarize themselves with emergency procedures, practice response protocols, and identify areas for improvement. By simulating realistic scenarios, training exercises help to build confidence and competence in responding to emergencies, reducing panic and confusion during actual events. Additionally, regular training promotes collaboration and coordination among campus stakeholders, enhancing overall preparedness and resilience. Ultimately, investing in preparedness efforts through training exercises can save lives and minimize the impact of emergencies on the campus community.', NULL, 'Explain the importance of regular training and preparedness exercises in maintaining readiness for emergency situations.', 47),
(87, NULL, NULL, NULL, NULL, NULL, 'Communication plays a vital role in effective emergency response within the ESPRIT campus community. Timely and accurate communication helps to disseminate critical information, coordinate response efforts, and ensure the safety of individuals during emergencies. CSERS facilitates communication by providing a centralized platform for sharing information among campus stakeholders, including students, faculty, staff, and emergency responders. Through CSERS, alerts and notifications can be issued quickly to notify individuals of potential hazards or emergencies, allowing them to take appropriate actions to protect themselves. Furthermore, CSERS enables two-way communication, allowing individuals to report incidents, request assistance, and provide updates during crises. By enhancing communication capabilities, CSERS helps to improve overall response coordination and effectiveness, ultimately contributing to a safer campus environment.', NULL, 'Discuss the role of communication in effective emergency response and how CSERS facilitates communication during crises.', 47),
(88, NULL, NULL, NULL, NULL, 'A', NULL, NULL, 'CSERS is a web-based platform designed to centralize security management and streamline emergency response procedures within the ESPRIT campus community.', 48),
(89, NULL, NULL, NULL, NULL, 'B', NULL, NULL, 'The primary purpose of CSERS is to organize campus events.', 48),
(90, NULL, NULL, NULL, NULL, 'A', NULL, NULL, 'Efficient coordination of actions and communication during an emergency is referred to as \'coordinated response\' within CSERS.', 48),
(91, NULL, NULL, NULL, NULL, 'B', NULL, NULL, 'CSERS stands for Centralized Security and Emergency Response System.', 48);

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
-- Dumping data for table `training_content`
--

INSERT INTO `training_content` (`id`, `completed`, `content`, `content_url`, `created_date`, `description`, `estimated_time`, `title`, `type`, `video_duration`) VALUES
(3, NULL, NULL, NULL, '2024-04-17 00:00:02.000000', 'Test your knowledge of campus security procedures', NULL, 'Campus Security Quiz', 'VIDEO', NULL);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `training_content`
--
ALTER TABLE `training_content`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
