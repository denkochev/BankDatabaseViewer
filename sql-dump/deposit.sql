-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:8889
-- Час створення: Трв 06 2023 р., 13:36
-- Версія сервера: 5.7.34
-- Версія PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `deposit`
--

DELIMITER $$
--
-- Процедури
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `my_loop` ()  BEGIN
  DECLARE counter INT DEFAULT 1;

  WHILE counter <= 10 DO
    SELECT counter;
    SET counter = counter + 1;
  END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблиці `active`
--

CREATE TABLE `active` (
  `id_active_depo` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_deposit` int(11) NOT NULL,
  `sum` decimal(65,2) NOT NULL,
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `termin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `active`
--

INSERT INTO `active` (`id_active_depo`, `id_client`, `id_deposit`, `sum`, `date_start`, `termin`) VALUES
(1, 1, 1, '100000.00', '2023-04-25 18:30:37', 4),
(2, 2, 3, '10000.00', '2023-04-25 19:34:03', 3),
(3, 3, 2, '200000.00', '2023-04-25 21:03:29', 4),
(4, 4, 1, '25000.00', '2023-04-26 01:20:28', 5),
(5, 5, 2, '30000.00', '2023-04-26 01:22:07', 3),
(6, 9, 3, '100000.00', '2023-04-26 01:22:25', 3),
(7, 4, 3, '35000.00', '2023-04-26 01:25:33', 5);

-- --------------------------------------------------------

--
-- Структура таблиці `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `surname` varchar(15) NOT NULL,
  `phone` int(9) NOT NULL,
  `email` varchar(35) NOT NULL,
  `adress` varchar(30) NOT NULL,
  `balance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `client`
--

INSERT INTO `client` (`id_client`, `name`, `surname`, `phone`, `email`, `adress`, `balance`) VALUES
(1, 'John', 'Walles', 87657896, 'walles@gmail.com', 'Svovody distr. 1/5 10', 0),
(2, 'Ivan', 'Semenchenko', 78987654, 'vanyasema@gmx.net', 'Lviv 5kv10', 0),
(3, 'Dmitriy', 'Kurs', 65382756, 'hellodima2201@gmail.com', 'Kharkiv Sumska 10/kv.5', 0),
(4, 'Petr', 'Petrenko', 99875645, 'petyayatakoi@gmail.com', 'Vityaz 1 kv.15', 0),
(5, 'Ivanov', 'Vanos', 99874657, 'eddevaby@gmail.com', 'Kvartirka 77 o1', 0),
(6, 'Sergey', 'Pritula', 99856762, 'pritula@mail.com', 'Kyiv Proreznaya 1/14', 0),
(7, 'Kalin', 'Kalinih', 99123432, 'kalinich@gmail.com', 'Kalinovskiy 7', 0),
(8, 'Mike', 'Ohern', 19834321, 'ohern@youtu.be', 'LA distrinct 10 / 4', 0),
(9, 'Steave', 'Jobs', 19385749, 'apple@apple.com', 'San Francisco Silicon Valley 1', 0),
(10, 'Petrob', 'Petr', 98765789, 'petrpeter@gmail.com', 'Kharkiv Khai 1 RD corp. 1', 0);

-- --------------------------------------------------------

--
-- Структура таблиці `credit`
--

CREATE TABLE `credit` (
  `id_credit` int(11) NOT NULL,
  `type` varchar(30) NOT NULL,
  `percentage` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `credit`
--

INSERT INTO `credit` (`id_credit`, `type`, `percentage`) VALUES
(1, 'one_payment_credit', '5.00'),
(2, 'classic_scheme_credit', '9.00'),
(3, 'annuity_payment_credit', '7.50');

-- --------------------------------------------------------

--
-- Структура таблиці `credit_active`
--

CREATE TABLE `credit_active` (
  `id_active_credo` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_credit` int(11) NOT NULL,
  `body` int(11) NOT NULL,
  `termin` int(11) NOT NULL,
  `date_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `credit_active`
--

INSERT INTO `credit_active` (`id_active_credo`, `id_client`, `id_credit`, `body`, `termin`, `date_start`) VALUES
(1, 8, 3, 100000, 2, '2023-05-04 20:58:06'),
(2, 7, 3, 100000, 4, '2023-05-04 20:58:57'),
(3, 9, 2, 100000, 4, '2023-05-04 21:18:05'),
(4, 6, 1, 100000, 4, '2023-05-01 21:00:27'),
(6, 7, 1, 30000, 4, '2023-05-06 14:11:27'),
(8, 9, 3, 45000, 2, '2023-05-06 14:11:46'),
(10, 4, 3, 79000, 5, '2023-05-06 14:12:01'),
(13, 3, 1, 10000, 3, '2023-05-06 15:09:57');

-- --------------------------------------------------------

--
-- Структура таблиці `credit_lines`
--

CREATE TABLE `credit_lines` (
  `id_payment` int(11) NOT NULL,
  `id_active_credo` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `payment_sum` decimal(60,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `credit_lines`
--

INSERT INTO `credit_lines` (`id_payment`, `id_active_credo`, `date`, `status`, `payment_sum`) VALUES
(6, 4, '2023-08-01 19:00:27', 1, '5000.00'),
(7, 4, '2023-11-01 20:00:27', 0, '5000.00'),
(8, 4, '2024-02-01 20:00:27', 0, '5000.00'),
(9, 4, '2024-05-01 19:00:27', 0, '105000.00'),
(10, 1, '2023-08-04 18:58:06', 1, '57500.00'),
(11, 1, '2023-11-04 19:58:06', 0, '57500.00'),
(12, 2, '2023-08-04 18:58:57', 0, '32500.00'),
(13, 2, '2023-11-04 19:58:57', 0, '32500.00'),
(14, 2, '2024-02-04 19:58:57', 0, '32500.00'),
(15, 2, '2024-05-04 18:58:57', 0, '32500.00'),
(16, 3, '2023-08-04 19:18:05', 0, '31750.00'),
(17, 3, '2023-11-04 20:18:05', 0, '29500.00'),
(18, 3, '2024-02-04 20:18:05', 0, '27250.00'),
(19, 3, '2024-05-04 19:18:05', 0, '25000.00'),
(20, 6, '2023-08-06 12:11:27', 0, '1500.00'),
(21, 6, '2023-11-06 13:11:27', 0, '1500.00'),
(22, 6, '2024-02-06 13:11:27', 0, '1500.00'),
(23, 6, '2024-05-06 12:11:27', 0, '31500.00'),
(24, 8, '2023-08-06 12:11:46', 1, '25875.00'),
(25, 8, '2023-11-06 13:11:46', 0, '25875.00'),
(26, 10, '2023-08-06 12:12:01', 1, '21725.00'),
(27, 10, '2023-11-06 13:12:01', 0, '21725.00'),
(28, 10, '2024-02-06 13:12:01', 0, '21725.00'),
(29, 10, '2024-05-06 12:12:01', 0, '21725.00'),
(30, 10, '2024-08-06 12:12:01', 0, '21725.00'),
(31, 13, '2023-08-06 13:09:57', 0, '500.00'),
(32, 13, '2023-11-06 14:09:57', 0, '500.00'),
(33, 13, '2024-02-06 14:09:57', 0, '10500.00');

-- --------------------------------------------------------

--
-- Структура таблиці `deposit`
--

CREATE TABLE `deposit` (
  `id_deposit` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `percentage` decimal(65,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `deposit`
--

INSERT INTO `deposit` (`id_deposit`, `type`, `percentage`) VALUES
(1, 'end_deposit', '4.50'),
(2, 'period_deposit', '2.50'),
(3, 'capitalization_deposit', '1.00');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `active`
--
ALTER TABLE `active`
  ADD PRIMARY KEY (`id_active_depo`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_deposit` (`id_deposit`);

--
-- Індекси таблиці `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Індекси таблиці `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`id_credit`);

--
-- Індекси таблиці `credit_active`
--
ALTER TABLE `credit_active`
  ADD PRIMARY KEY (`id_active_credo`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_credit` (`id_credit`);

--
-- Індекси таблиці `credit_lines`
--
ALTER TABLE `credit_lines`
  ADD PRIMARY KEY (`id_payment`),
  ADD KEY `id_active_credo` (`id_active_credo`);

--
-- Індекси таблиці `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id_deposit`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `active`
--
ALTER TABLE `active`
  MODIFY `id_active_depo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблиці `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `credit`
--
ALTER TABLE `credit`
  MODIFY `id_credit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `credit_active`
--
ALTER TABLE `credit_active`
  MODIFY `id_active_credo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблиці `credit_lines`
--
ALTER TABLE `credit_lines`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблиці `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id_deposit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `active`
--
ALTER TABLE `active`
  ADD CONSTRAINT `active_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `active_ibfk_2` FOREIGN KEY (`id_deposit`) REFERENCES `deposit` (`id_deposit`);

--
-- Обмеження зовнішнього ключа таблиці `credit_active`
--
ALTER TABLE `credit_active`
  ADD CONSTRAINT `credit_active_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `credit_active_ibfk_2` FOREIGN KEY (`id_credit`) REFERENCES `credit` (`id_credit`);

--
-- Обмеження зовнішнього ключа таблиці `credit_lines`
--
ALTER TABLE `credit_lines`
  ADD CONSTRAINT `credit_lines_ibfk_1` FOREIGN KEY (`id_active_credo`) REFERENCES `credit_active` (`id_active_credo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
