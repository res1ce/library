-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: mysql-8.2
-- Время создания: Янв 27 2025 г., 00:01
-- Версия сервера: 8.2.0
-- Версия PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `LibraryDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Books`
--

CREATE TABLE `Books` (
  `Id` int NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IsAvailable` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Books`
--

INSERT INTO `Books` (`Id`, `Title`, `Author`, `IsAvailable`) VALUES
(2, 'New Book', 'Author Name', 0),
(3, 'New Book', 'Author Namfsd', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Rentals`
--

CREATE TABLE `Rentals` (
  `Id` int NOT NULL,
  `UserId` int NOT NULL,
  `BookId` int NOT NULL,
  `RentalDate` datetime NOT NULL,
  `ReturnDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Rentals`
--

INSERT INTO `Rentals` (`Id`, `UserId`, `BookId`, `RentalDate`, `ReturnDate`) VALUES
(1, 1, 2, '2025-01-26 21:44:13', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `Id` int NOT NULL,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordHash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Role` enum('User','Admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`Id`, `Username`, `PasswordHash`, `Role`) VALUES
(1, 'admin', '$2a$10$7fMw2X3evuCEELS.1lXoNehLOhkLWjyzvg8ilNUJRoO9t5k9/gyvW', 'Admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`Id`);

--
-- Индексы таблицы `Rentals`
--
ALTER TABLE `Rentals`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `BookId` (`BookId`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Books`
--
ALTER TABLE `Books`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `Rentals`
--
ALTER TABLE `Rentals`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Rentals`
--
ALTER TABLE `Rentals`
  ADD CONSTRAINT `rentals_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`),
  ADD CONSTRAINT `rentals_ibfk_2` FOREIGN KEY (`BookId`) REFERENCES `Books` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
