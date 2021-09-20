-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 20 2021 г., 00:34
-- Версия сервера: 5.6.47
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sarafan`
--

-- --------------------------------------------------------

--
-- Структура таблицы `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
    `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
                           `id` bigint(20) NOT NULL,
                           `text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `spring_session`
--

CREATE TABLE `spring_session` (
                                  `PRIMARY_ID` char(36) NOT NULL,
                                  `SESSION_ID` char(36) NOT NULL,
                                  `CREATION_TIME` bigint(20) NOT NULL,
                                  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
                                  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
                                  `EXPIRY_TIME` bigint(20) NOT NULL,
                                  `PRINCIPAL_NAME` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `spring_session_attributes`
--

CREATE TABLE `spring_session_attributes` (
                                             `SESSION_PRIMARY_ID` char(36) NOT NULL,
                                             `ATTRIBUTE_NAME` varchar(200) NOT NULL,
                                             `ATTRIBUTE_BYTES` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `usr`
--

CREATE TABLE `usr` (
                       `id` varchar(255) NOT NULL,
                       `email` varchar(255) DEFAULT NULL,
                       `gender` varchar(255) DEFAULT NULL,
                       `last_visit` datetime DEFAULT NULL,
                       `locale` varchar(255) DEFAULT NULL,
                       `name` varchar(255) DEFAULT NULL,
                       `userpic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `spring_session`
--
ALTER TABLE `spring_session`
    ADD PRIMARY KEY (`PRIMARY_ID`),
  ADD UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  ADD KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  ADD KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`);

--
-- Индексы таблицы `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
    ADD PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`);

--
-- Индексы таблицы `usr`
--
ALTER TABLE `usr`
    ADD PRIMARY KEY (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `spring_session_attributes`
--
ALTER TABLE `spring_session_attributes`
    ADD CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
