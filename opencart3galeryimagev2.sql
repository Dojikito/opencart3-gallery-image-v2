-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 29 2019 г., 13:48
-- Версия сервера: 5.7.26-0ubuntu0.16.04.1
-- Версия PHP: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `admin_opencart3gal`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_albumv2`
--

CREATE TABLE `oc_albumv2` (
  `album_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_album_catalogsv2`
--

CREATE TABLE `oc_album_catalogsv2` (
  `catalog_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `catalog` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_album_descriptionv2`
--

CREATE TABLE `oc_album_descriptionv2` (
  `album_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_album_filterv2`
--

CREATE TABLE `oc_album_filterv2` (
  `album_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_album_pathv2`
--

CREATE TABLE `oc_album_pathv2` (
  `album_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_album_to_layoutv2`
--

CREATE TABLE `oc_album_to_layoutv2` (
  `album_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_album_to_storev2`
--

CREATE TABLE `oc_album_to_storev2` (
  `album_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_albumv2`
--
ALTER TABLE `oc_albumv2`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_album_catalogsv2`
--
ALTER TABLE `oc_album_catalogsv2`
  ADD PRIMARY KEY (`catalog_id`),
  ADD KEY `album_id` (`album_id`,`language_id`);

--
-- Индексы таблицы `oc_album_descriptionv2`
--
ALTER TABLE `oc_album_descriptionv2`
  ADD PRIMARY KEY (`album_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_album_filterv2`
--
ALTER TABLE `oc_album_filterv2`
  ADD PRIMARY KEY (`album_id`,`filter_id`);

--
-- Индексы таблицы `oc_album_pathv2`
--
ALTER TABLE `oc_album_pathv2`
  ADD PRIMARY KEY (`album_id`,`path_id`);

--
-- Индексы таблицы `oc_album_to_layoutv2`
--
ALTER TABLE `oc_album_to_layoutv2`
  ADD PRIMARY KEY (`album_id`,`store_id`);

--
-- Индексы таблицы `oc_album_to_storev2`
--
ALTER TABLE `oc_album_to_storev2`
  ADD PRIMARY KEY (`album_id`,`store_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_albumv2`
--
ALTER TABLE `oc_albumv2`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_album_catalogsv2`
--
ALTER TABLE `oc_album_catalogsv2`
  MODIFY `catalog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
