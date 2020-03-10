-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mar 10, 2020 alle 15:56
-- Versione del server: 10.4.11-MariaDB
-- Versione PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_books`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `nationality` varchar(15) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `deathdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `author`
--

INSERT INTO `author` (`author_id`, `name`, `nationality`, `birthdate`, `deathdate`) VALUES
(1, 'Terry Pratchett', 'english', '0000-00-00', '0000-00-00'),
(2, 'Neil Gaiman', 'english', '0000-00-00', NULL),
(3, 'Greer Ilene Gilman', 'USA', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `lang` varchar(12) DEFAULT NULL,
  `cover` varchar(300) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `book`
--

INSERT INTO `book` (`book_id`, `owner_id`, `title`, `author_id`, `publisher_id`, `type`, `lang`, `cover`, `description`, `origin_id`, `location`) VALUES
(1, 1, 'La saggezza della luna', 3, 3, 'fantasy', 'italian', NULL, 'Ariane came to visit Sylvie at midwinter, hoping to rekindle the old magic of their girlhood game: the Nine Worlds, a fantastical universe founded in a handful of marbles and a tarot of cards, whose m', NULL, 'box in Italy'),
(2, 1, 'Coraline', 2, 2, 'kids,horror', 'italian', NULL, 'Coraline reluctantly have to move to the country-side with her two neglectful parents. Once there, she finds a door leading to the Other World. Seemingly a better and funnier copy of the real world bu', NULL, 'box in Italy'),
(3, 1, 'Buona apocalisse a tutti!', 1, 3, 'humour,urban-fantasy', 'italian', NULL, 'The book is a comedy about the birth of the son of Satan and the coming of the End Times. There are attempts by the angel Aziraphale and the demon Crowley to sabotage the coming of the end times, havi', NULL, 'box in Italy');

-- --------------------------------------------------------

--
-- Struttura della tabella `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `adress` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `telephone_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `loan`
--

INSERT INTO `loan` (`loan_id`, `name`, `adress`, `date`, `telephone_num`) VALUES
(1, 'Cristiano', NULL, '0000-00-00', NULL),
(2, 'Biblioteca comunale di Desenzano', 'via roncavalli 12', '0000-00-00', 2147483647);

-- --------------------------------------------------------

--
-- Struttura della tabella `origin`
--

CREATE TABLE `origin` (
  `origin_id` int(11) NOT NULL,
  `present_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `origin`
--

INSERT INTO `origin` (`origin_id`, `present_id`, `loan_id`) VALUES
(1, NULL, NULL),
(2, 1, NULL),
(3, 2, NULL),
(4, NULL, 1),
(5, NULL, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `owner`
--

CREATE TABLE `owner` (
  `owner_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `telephone_num` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `owner`
--

INSERT INTO `owner` (`owner_id`, `name`, `telephone_num`) VALUES
(1, 'Fulvia', 2147483647),
(2, 'Cristiano', 2147483647);

-- --------------------------------------------------------

--
-- Struttura della tabella `present`
--

CREATE TABLE `present` (
  `present_id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `occasion` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `present`
--

INSERT INTO `present` (`present_id`, `name`, `occasion`, `date`) VALUES
(1, 'Cristiano', 'compleanno', NULL),
(2, 'mamma', 'compleanno', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `collana` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `name`, `nationality`, `collana`) VALUES
(1, 'Arnoldo Mondadori Editore', 'Italy', 'Strade Blu'),
(2, 'Arnoldo Mondadodi Editore', 'Italy', 'I grandi del fantastico'),
(3, 'Arnoldo Mondadori Editore', 'Italy', 'Urania Fantasy');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indici per le tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `publisher_id` (`publisher_id`),
  ADD KEY `origin_id` (`origin_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indici per le tabelle `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indici per le tabelle `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`origin_id`),
  ADD KEY `present_id` (`present_id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indici per le tabelle `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`owner_id`);

--
-- Indici per le tabelle `present`
--
ALTER TABLE `present`
  ADD PRIMARY KEY (`present_id`);

--
-- Indici per le tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`),
  ADD CONSTRAINT `book_ibfk_4` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`);

--
-- Limiti per la tabella `origin`
--
ALTER TABLE `origin`
  ADD CONSTRAINT `origin_ibfk_1` FOREIGN KEY (`present_id`) REFERENCES `present` (`present_id`),
  ADD CONSTRAINT `origin_ibfk_2` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
