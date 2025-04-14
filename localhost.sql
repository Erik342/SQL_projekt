-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:3306
-- Létrehozás ideje: 2025. Ápr 08. 11:34
-- Kiszolgáló verziója: 5.7.24
-- PHP verzió: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `etterem`
--
CREATE DATABASE IF NOT EXISTS `etterem` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `etterem`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pizza`
--

CREATE TABLE `pizza` (
  `pizza_id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `ar` decimal(6,2) NOT NULL,
  `meret` enum('kicsi','kozepes','nagy') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `pizza`
--

INSERT INTO `pizza` (`pizza_id`, `nev`, `ar`, `meret`) VALUES
(1, 'Margherita', '1800.00', 'kozepes'),
(2, 'Hawaii', '2200.00', 'nagy'),
(3, 'Sonkás', '2000.00', 'kicsi'),
(4, 'Tonhalas', '2300.00', 'kozepes'),
(5, 'Mexikói', '2400.00', 'nagy'),
(6, 'Gombás', '2100.00', 'kozepes'),
(7, 'Szalámis', '2000.00', 'kicsi'),
(8, 'Vegetáriánus', '1900.00', 'nagy'),
(9, 'BBQ csirkés', '2500.00', 'kozepes'),
(10, 'Négysajtos', '2600.00', 'nagy'),
(22, 'Tonhalas', '2300.00', 'kozepes');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

CREATE TABLE `rendeles` (
  `rendeles_id` int(11) NOT NULL,
  `vevo_id` int(11) NOT NULL,
  `datum` date NOT NULL,
  `osszeg` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `rendeles`
--

INSERT INTO `rendeles` (`rendeles_id`, `vevo_id`, `datum`, `osszeg`) VALUES
(1, 1, '2024-04-01', '4000.00'),
(2, 2, '2024-04-02', '2200.00'),
(3, 3, '2024-04-03', '2600.00'),
(4, 4, '2024-04-03', '2000.00'),
(5, 5, '2024-04-04', '4800.00'),
(6, 6, '2024-04-04', '1900.00'),
(7, 7, '2024-04-05', '4600.00'),
(8, 8, '2024-04-06', '2200.00'),
(9, 9, '2024-04-07', '2500.00'),
(10, 10, '2024-04-07', '2100.00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_tetel`
--

CREATE TABLE `rendeles_tetel` (
  `rendeles_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL,
  `darab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `rendeles_tetel`
--

INSERT INTO `rendeles_tetel` (`rendeles_id`, `pizza_id`, `darab`) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(3, 5, 1),
(4, 6, 1),
(5, 2, 2),
(5, 7, 1),
(6, 8, 1),
(7, 9, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vevo`
--

CREATE TABLE `vevo` (
  `vevo_id` int(11) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefonszam` varchar(20) DEFAULT NULL,
  `cim` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `vevo`
--

INSERT INTO `vevo` (`vevo_id`, `nev`, `email`, `telefonszam`, `cim`) VALUES
(1, 'Kiss Péter', 'kisspeter@gmail.com', '06201234567', 'Budapest, Fő utca 1.'),
(2, 'Nagy Anna', 'annanagy@gmail.com', '06301234567', 'Debrecen, Petőfi utca 10.'),
(3, 'Szabó László', 'szabolaci@gmail.com', '06203334444', 'Győr, Bartók Béla utca 3.'),
(4, 'Tóth Eszter', 'totheszti@gmail.com', '06701112233', 'Szeged, Kossuth tér 5.'),
(5, 'Kovács Dániel', 'kovacs.d@gmail.com', '06209998877', 'Pécs, Arany János utca 2.'),
(6, 'Farkas Zita', 'zitafarkas@gmail.com', '06707775555', 'Miskolc, Erzsébet tér 6.'),
(7, 'Lakatos András', 'andraslakatos@gmail.com', '06302223333', 'Eger, Dobó tér 1.'),
(8, 'Papp Veronika', 'pappvero@gmail.com', '06207776666', 'Sopron, Deák utca 4.'),
(9, 'Balogh Bence', 'baloghbence@gmail.com', '06708889999', 'Szombathely, Kossuth utca 8.'),
(10, 'Varga Fanni', 'vargafanni@gmail.com', '06205554444', 'Kecskemét, Katona utca 12.');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`pizza_id`);

--
-- A tábla indexei `rendeles`
--
ALTER TABLE `rendeles`
  ADD PRIMARY KEY (`rendeles_id`),
  ADD KEY `vevo_id` (`vevo_id`);

--
-- A tábla indexei `rendeles_tetel`
--
ALTER TABLE `rendeles_tetel`
  ADD PRIMARY KEY (`rendeles_id`,`pizza_id`),
  ADD KEY `pizza_id` (`pizza_id`);

--
-- A tábla indexei `vevo`
--
ALTER TABLE `vevo`
  ADD PRIMARY KEY (`vevo_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `pizza`
--
ALTER TABLE `pizza`
  MODIFY `pizza_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT a táblához `rendeles`
--
ALTER TABLE `rendeles`
  MODIFY `rendeles_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `vevo`
--
ALTER TABLE `vevo`
  MODIFY `vevo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `rendeles_ibfk_1` FOREIGN KEY (`vevo_id`) REFERENCES `vevo` (`vevo_id`);

--
-- Megkötések a táblához `rendeles_tetel`
--
ALTER TABLE `rendeles_tetel`
  ADD CONSTRAINT `rendeles_tetel_ibfk_1` FOREIGN KEY (`rendeles_id`) REFERENCES `rendeles` (`rendeles_id`),
  ADD CONSTRAINT `rendeles_tetel_ibfk_2` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`pizza_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
