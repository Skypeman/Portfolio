-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 30 2017 г., 02:36
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `santa_belinda`
--

-- --------------------------------------------------------

--
-- Структура таблицы `activities`
--

CREATE TABLE IF NOT EXISTS `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desciption` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `activities`
--

INSERT INTO `activities` (`id`, `name`, `desciption`) VALUES
(1, 'Ловля рыбы', 'Поимка рыбы в водоёмах с целью её продажи или употребления в пищу.'),
(2, 'Заготовка сахарного тростника', 'Заготовка сахарного тростника с целью получения из него сахара или иных полезных свойств, а так же для продажи.'),
(3, 'Выращивание табака', 'Комплекс действий для получения листов табака для производства сигарет и самокруток или для продажи.'),
(4, 'Выпечка хлеба', 'Производство хлебобулочных изделий из муки и других ингредиентов.'),
(5, 'Выращивание пшеницы', 'Комплекс мероприятий по посадке, уходу и сбору пшеницы с целью производства из нее муки или для продажи.');

-- --------------------------------------------------------

--
-- Структура таблицы `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Dom` int(11) NOT NULL,
  `street` int(11) DEFAULT NULL,
  `house_num` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Dom` (`Dom`),
  KEY `street` (`street`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `addresses`
--

INSERT INTO `addresses` (`id`, `Dom`, `street`, `house_num`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 1),
(4, 4, 2, 2),
(5, 5, 1, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `contract`
--

CREATE TABLE IF NOT EXISTS `contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Predprinimatel` int(11) NOT NULL,
  `Rabochii` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Predprinimatel` (`Predprinimatel`,`Rabochii`),
  KEY `Rabochii` (`Rabochii`),
  KEY `Predprinimatel_2` (`Predprinimatel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `contract`
--

INSERT INTO `contract` (`id`, `Predprinimatel`, `Rabochii`, `begin_date`, `end_date`, `description`) VALUES
(1, 3, 6, '1760-01-02', '1763-03-09', 'Третьяков Олег Климентович нанимается для выполнения тяжелых работ, связанных с переносом и погрузкой товаров.'),
(2, 2, 3, '1743-03-04', '1745-12-12', 'Анна Леопольдовна нанята для выполнения работ по очистке и сортировке рыбы.');

-- --------------------------------------------------------

--
-- Структура таблицы `cooperative`
--

CREATE TABLE IF NOT EXISTS `cooperative` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `create_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `cooperative`
--

INSERT INTO `cooperative` (`id`, `name`, `create_date`, `end_date`) VALUES
(1, 'Дружный', '1745-05-29', NULL),
(2, 'Недружный', '1775-07-13', '1776-08-14');

-- --------------------------------------------------------

--
-- Структура таблицы `coop_activities`
--

CREATE TABLE IF NOT EXISTS `coop_activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Kooperativ` int(11) NOT NULL,
  `Deyatelnost` int(11) NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Kooperativ` (`Kooperativ`,`Deyatelnost`),
  KEY `deyatelnost_koop_ibfk_1` (`Deyatelnost`),
  KEY `Kooperativ_2` (`Kooperativ`),
  KEY `Kooperativ_3` (`Kooperativ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `coop_activities`
--

INSERT INTO `coop_activities` (`id`, `Kooperativ`, `Deyatelnost`, `begin_date`, `end_date`) VALUES
(1, 1, 1, '1745-05-30', NULL),
(2, 2, 2, '1775-07-13', '1775-09-12'),
(3, 2, 4, '1775-09-13', '1776-08-14');

-- --------------------------------------------------------

--
-- Структура таблицы `coop_participation`
--

CREATE TABLE IF NOT EXISTS `coop_participation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Predprinimatel` int(11) NOT NULL,
  `Koop` int(11) NOT NULL,
  `enter_date` date NOT NULL,
  `escape_date` date DEFAULT NULL,
  `shareholding` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Predprinimatel` (`Predprinimatel`),
  KEY `Predprinimatel_2` (`Predprinimatel`,`Koop`),
  KEY `Koop` (`Koop`),
  KEY `Predprinimatel_3` (`Predprinimatel`,`Koop`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `coop_participation`
--

INSERT INTO `coop_participation` (`id`, `Predprinimatel`, `Koop`, `enter_date`, `escape_date`, `shareholding`) VALUES
(1, 1, 1, '1745-05-29', '1785-01-08', 100),
(2, 3, 2, '1775-07-13', NULL, 50),
(3, 4, 2, '1775-07-13', NULL, 50);

-- --------------------------------------------------------

--
-- Структура таблицы `entrepreneurs`
--

CREATE TABLE IF NOT EXISTS `entrepreneurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Jitel` int(11) NOT NULL,
  `Deyatelnost` int(11) DEFAULT NULL,
  `begin_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Jitel` (`Jitel`,`Deyatelnost`),
  KEY `predprinimateli_ibfk_2` (`Deyatelnost`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `entrepreneurs`
--

INSERT INTO `entrepreneurs` (`id`, `Jitel`, `Deyatelnost`, `begin_date`, `end_date`) VALUES
(1, 1, 1, '1742-01-01', '1785-11-08'),
(2, 2, 3, '1748-08-22', '1760-10-08'),
(3, 5, 2, '1755-12-12', '1780-03-25'),
(4, 7, 2, '1778-11-15', '1800-12-31'),
(5, 6, 4, '1750-05-06', '1830-08-10');

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE IF NOT EXISTS `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `house`
--

CREATE TABLE IF NOT EXISTS `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `construct_date` date NOT NULL,
  `destrust_date` date DEFAULT NULL,
  `square` smallint(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `house`
--

INSERT INTO `house` (`id`, `construct_date`, `destrust_date`, `square`) VALUES
(1, '1719-06-23', '1919-04-05', 300),
(2, '1726-03-29', '1890-06-22', 100),
(3, '1920-09-25', NULL, 123),
(4, '1923-07-17', NULL, 256),
(5, '1800-01-03', NULL, 150);

-- --------------------------------------------------------

--
-- Структура таблицы `house_residents`
--

CREATE TABLE IF NOT EXISTS `house_residents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Jitel` int(11) NOT NULL,
  `Dom` int(11) NOT NULL,
  `arrival_date` date NOT NULL,
  `eviction_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Jitel` (`Jitel`,`Dom`),
  KEY `jiteli_domov_ibfk_2` (`Dom`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `house_residents`
--

INSERT INTO `house_residents` (`id`, `Jitel`, `Dom`, `arrival_date`, `eviction_date`) VALUES
(1, 1, 1, '1719-06-23', '1785-11-08'),
(2, 2, 1, '1719-06-23', '1793-07-10'),
(3, 3, 1, '1719-06-23', '1746-12-30'),
(4, 4, 1, '1725-03-19', '1750-04-25'),
(5, 4, 2, '1750-04-25', '1800-01-20'),
(6, 5, 2, '1733-08-09', '1784-05-08'),
(7, 6, 2, '1736-01-16', '1781-09-11'),
(8, 7, 1, '1750-03-25', '1830-08-15');

-- --------------------------------------------------------

--
-- Структура таблицы `people`
--

CREATE TABLE IF NOT EXISTS `people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `second_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `Pol` int(11) NOT NULL,
  `birth_date` date NOT NULL,
  `death_date` date DEFAULT NULL,
  `Otec` int(11) DEFAULT NULL,
  `Mat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_Pol` (`Pol`),
  KEY `Otec` (`Otec`,`Mat`),
  KEY `Otec_2` (`Otec`),
  KEY `Mat` (`Mat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `people`
--

INSERT INTO `people` (`id`, `second_name`, `name`, `patronymic`, `Pol`, `birth_date`, `death_date`, `Otec`, `Mat`) VALUES
(1, 'Карпов', 'Афанасий', NULL, 1, '1717-10-18', '1785-11-08', NULL, NULL),
(2, 'Третьяков', 'Климент', NULL, 1, '1718-11-16', '1793-07-10', NULL, NULL),
(3, 'Леопольдовна', 'Анна', NULL, 2, '1718-04-16', '1746-12-30', NULL, NULL),
(4, 'Кудряшова', 'Инна', NULL, 2, '1725-03-19', '1800-01-20', NULL, NULL),
(5, 'Карпова', 'Анастасия', 'Афанасиевна', 2, '1733-08-09', '1784-05-08', 1, 4),
(6, 'Третьяков', 'Олег', 'Климентович', 1, '1736-01-16', '1781-09-11', 2, NULL),
(7, 'Кудряшова', 'Инга', NULL, 2, '1750-03-25', '1830-08-15', NULL, 4),
(8, 'Третьякова', 'Валерия', 'Олеговна', 2, '1750-09-23', NULL, 6, 5),
(9, 'Третьяков', 'Игорь', 'Олегович', 1, '1753-04-25', NULL, 6, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `streets`
--

CREATE TABLE IF NOT EXISTS `streets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `streets`
--

INSERT INTO `streets` (`id`, `name`) VALUES
(1, 'Первая'),
(2, 'Вторая');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`Dom`) REFERENCES `house` (`id`),
  ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`street`) REFERENCES `streets` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ограничения внешнего ключа таблицы `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`Predprinimatel`) REFERENCES `entrepreneurs` (`id`),
  ADD CONSTRAINT `contract_ibfk_4` FOREIGN KEY (`Rabochii`) REFERENCES `people` (`id`);

--
-- Ограничения внешнего ключа таблицы `coop_activities`
--
ALTER TABLE `coop_activities`
  ADD CONSTRAINT `coop_activities_ibfk_1` FOREIGN KEY (`Deyatelnost`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `coop_activities_ibfk_2` FOREIGN KEY (`Kooperativ`) REFERENCES `cooperative` (`id`);

--
-- Ограничения внешнего ключа таблицы `coop_participation`
--
ALTER TABLE `coop_participation`
  ADD CONSTRAINT `coop_participation_ibfk_1` FOREIGN KEY (`Predprinimatel`) REFERENCES `entrepreneurs` (`id`),
  ADD CONSTRAINT `coop_participation_ibfk_2` FOREIGN KEY (`Koop`) REFERENCES `cooperative` (`id`);

--
-- Ограничения внешнего ключа таблицы `entrepreneurs`
--
ALTER TABLE `entrepreneurs`
  ADD CONSTRAINT `entrepreneurs_ibfk_1` FOREIGN KEY (`Jitel`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `entrepreneurs_ibfk_2` FOREIGN KEY (`Deyatelnost`) REFERENCES `activities` (`id`);

--
-- Ограничения внешнего ключа таблицы `house_residents`
--
ALTER TABLE `house_residents`
  ADD CONSTRAINT `house_residents_ibfk_1` FOREIGN KEY (`Jitel`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `house_residents_ibfk_2` FOREIGN KEY (`Dom`) REFERENCES `house` (`id`);

--
-- Ограничения внешнего ключа таблицы `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`Pol`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `people_ibfk_2` FOREIGN KEY (`Otec`) REFERENCES `people` (`id`),
  ADD CONSTRAINT `people_ibfk_3` FOREIGN KEY (`Mat`) REFERENCES `people` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
