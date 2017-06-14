-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 07 2017 г., 15:38
-- Версия сервера: 5.5.43
-- Версия PHP: 5.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(8) NOT NULL,
  `name` varchar(25) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL DEFAULT '0',
  `isAdmin` bit(1) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `age`, `isAdmin`, `createdDate`) VALUES
(2, 'Трамп', 6, b'0', '2017-06-01 06:43:00'),
(3, 'Обама', 43, b'0', '2017-03-28 06:21:00'),
(4, 'Буш', 10, b'1', '2017-06-05 10:22:52'),
(7, 'Меркель', 45, b'0', '2017-06-05 12:06:53'),
(8, 'Путин', 18, b'1', '2017-06-06 06:06:01'),
(9, 'Олланд', 32, b'0', '2017-03-28 06:21:21'),
(10, 'Саркози', 24, b'1', '2017-03-28 06:21:21'),
(13, 'Мадуро', 23, b'0', '2017-03-28 06:21:21'),
(14, 'Лукашенко', 52, b'0', '2017-03-28 06:21:21'),
(16, 'Наполеон', 18, b'0', '2017-03-28 06:21:21'),
(17, 'Пётр1', 20, b'0', '2017-03-28 06:21:00'),
(27, 'Екатерина', 45, b'0', '2017-05-26 07:55:20'),
(28, 'Ленин', 20, b'0', '2017-05-25 12:19:34'),
(29, 'Сталин', 40, b'0', '2017-05-25 12:20:10'),
(30, 'Николай', 34, b'0', '2017-05-25 12:22:26'),
(31, 'Клинтон', 43, b'0', '2017-05-25 12:22:37'),
(32, 'Вашингтон', 43, b'0', '2017-05-25 12:28:42'),
(33, 'Де Голь', 20, b'0', '2017-05-25 12:28:56'),
(38, 'Макрон', 20, b'1', '2017-03-28 06:21:00'),
(39, 'Цезарь', 100, b'1', '2017-06-02 11:13:00'),
(41, 'Август', 100, b'0', '2017-06-06 06:07:10');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user` MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
