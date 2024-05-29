-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Maj 29, 2024 at 04:50 PM
-- Wersja serwera: 8.4.0
-- Wersja PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kina`
--
CREATE DATABASE IF NOT EXISTS `kina` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `kina`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cinema_city`
--

CREATE TABLE `cinema_city` (
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `schedule_link` varchar(255) NOT NULL,
  `imax_technology` tinyint(1) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cinema_city`
--

INSERT INTO `cinema_city` (`name`, `address`, `phone`, `email`, `schedule_link`, `imax_technology`, `latitude`, `longitude`) VALUES
('Cinema City Bielsko Biała', 'Leszczyńska 20, 43-382 Bielsko-Biała', '+48 33 485 39 39', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/bielsko-biala', 0, 49.80247716478286, 19.050030153209224),
('Cinema City Bydgoszcz', 'Jagiellońska 39/47, 85-097 Bydgoszcz', '+48 22 241 92 22', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/bydgoszcz', 0, 53.12535102845733, 18.018166868704267),
('Cinema City Bytom', 'Centrum Handlowe Agora, plac Tadeusza Kościuszki 1, 41-902 Bytom', '+48 324 939 606', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/bytom', 0, 50.34737747494929, 18.919306555082276),
('Cinema City Cieszyn', 'Wojciecha Korfantego 23, 43-400 Cieszyn', '+48 222 419 222', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/cieszyn', 0, 49.750161107317425, 18.63971608204232),
('Cinema City Częstochowa - Galeria Jurajska', 'Aleja Wojska Polskiego 207, 42-200 Częstochowa', '+48 34 390 17 77', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/jurajska', 0, 50.807495748217185, 19.131543271079916),
('Cinema City Częstochowa - Wolność', 'Wolność, Aleja Tadeusza Kościuszki 5, 42-202 Częstochowa', '+48 34 371 71 71', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/wolnosc', 0, 50.81319209906386, 19.1181058281166),
('Cinema City Elbląg', 'Teatralna 5, 82-300 Elbląg', '+48 22 241 92 22', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/elblag', 0, 54.165810713731645, 19.401347726424827),
('Cinema City Gliwice', 'CH Forum, Lipowa 1, 44-100 Gliwice', '+48 324 939 777', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/gliwice', 0, 50.30034091626717, 18.682848183915738),
('Cinema City IMAX Katowice - Punkt 44', 'Punkt 44, Gliwicka 44, 40-853 Katowice', '+48 323 595 959', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/punkt44', 0, 50.262611323299616, 19.00645508391401),
('Cinema City Silesia', 'Silesia City Center, Chorzowska 107, 40-101 Katowice', '+48 324 939 555', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/silesia', 0, 50.27044294907695, 19.00162179740777),
('Cinema City Kraków - Bonarka', 'CH Bonarka City Center, Henryka Kamieńskiego 11, 30-644 Kraków', '+48 222 419 222', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/bonarka', 0, 50.027038151380495, 19.94968433972576),
('Cinema City Kraków - Galeria Kazimierz', 'Galeria Kazimierz, Podgórska 34, 31-536 Kraków', '+48 122 545 454', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/kazimierz', 0, 50.05368276754853, 19.95488826856248),
('Cinema City IMAX Zakopianka', 'Zakopiańska 62, 30-418 Kraków', '+48 122 959 595', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/zakopianka', 0, 50.01643953984991, 19.930487897396365),
('Cinema City Lublin - Felicity', 'Cinema City Felicity, al. Wincentego Witosa 32, 20-315 Lublin', '+48 81 443 58 58', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/felicity', 0, 51.23207242452219, 22.61445756861609),
('Cinema City Lublin - Plaza', 'CH Plaza, Lipowa 13, 20-020 Lublin', '+48 81 535 25 25', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/lublinplaza', 0, 51.244718398674436, 22.55191792628773),
('Cinema City Łódź - Manufaktura', 'CH Manufaktura, Drewnowska 58, 91-002 Łódź', '+48 42 664 64 64', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/manufaktura', 0, 51.780957095842176, 19.44878235756748),
('Cinema City Poznań - Kinepolis', 'Kinepolis, Bolesława Krzywoustego 72, 61-144 Poznań', '+48 61 871 56 00', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/kinepolis', 0, 52.37355362335944, 16.98046461099799),
('Cinema City Poznań - Plaza', 'CH Plaza, Drużbickiego 2, 61-693 Poznań', '+48 61 662 62 62', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/poznanplaza', 0, 52.44214914826156, 16.91954342877371),
('Cinema City Ruda Śląska', '1 Maja 310, 41-710 Ruda Śląska', '+48 22 241 92 22', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/rudaslaska', 0, 50.27569856322832, 18.865984537888433),
('Cinema City Sosnowiec Plaza', 'Sosnowiec Plaza, Henryka Sienkiewicza 2, 41-400 Sosnowiec', '+48 32 775 75 75', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/sosnowiec', 0, 50.275714449674, 19.12714304158563),
('Cinema City Starogard Gdański', 'Galeria Neptun, Pomorska 7, 83-200 Starogard Gdański', '+48 58 325 01 50', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/starogard', 0, 53.96451097026724, 18.528644153402098),
('Cinema City Toruń - Czerwona Droga', 'Czerwona Droga 1/6, 87-100 Toruń', '+48 56 664 64 64', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/czerwonadroga', 0, 53.015276807677694, 18.600237726370104),
('Cinema City Toruń - Plaza', 'Plaza, Broniewskiego 90, 87-100 Toruń', '+48 22 241 92 22', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/torunplaza', 0, 53.01602441434767, 18.561302566850447),
('Cinema City Wałbrzych', 'Galeria Victoria, 1 Maja 64, 58-300 Wałbrzych', '+48 74 648 48 48', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/walbrzych', 0, 50.76711301450461, 16.2656027685948),
('Cinema City Warszawa - Arkadia', 'al. Jana Pawła II 82, 00-175 Warszawa', '+48 22 321 21 21', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/arkadia', 0, 52.25723918367676, 20.98454843982802),
('Cinema City Warszawa - Bemowo', 'Galeria Bemowo, Powstańców Śląskich 126A, 01-466 Warszawa', '+48 22 241 95 19', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/bemowo', 0, 52.26590485870823, 20.932834039828464),
('Cinema City Warszawa - Białołęka', 'Białołęka Galeria Północna, Światowida 17, 03-144 Warszawa', '+48 22 241 92 22', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/galeriapolnocna', 0, 52.318658785246804, 20.9670413711314),
('Cinema City Warszawa - Mokotów ', 'Wołoska 12, 02-675 Warszawa', '+48 22 456 65 02', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/mokotow', 0, 52.179152576158366, 21.004201597495417),
('Cinema City Warszawa - Promenada', 'Ostrobramska 75C, 04-175 Warszawa', '+48 22 241 90 90', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/promenada', 0, 52.23168638065836, 21.105382153320292),
('Cinema City Warszawa - Sadyba', 'Powsińska 31, 02-903 Warszawa', '+48 22 241 94 19', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/sadyba', 0, 52.18741782498665, 21.06122031098915),
('Cinema City Wrocław - Korona', 'CH Korona, Bolesława Krzywoustego 126C, 51-421 Wrocław', '+48 71 323 60 00', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/korona', 0, 51.14228672095374, 17.08910719929605),
('Cinema City Zielona Góra', 'Focus Mall Zielona Góra, Wrocławska 17, 65-427 Zielona Góra', '+48 68 321 01 10', 'https://www.cinema-city.pl/kontakt', 'https://www.cinema-city.pl/kina/zielonagora', 0, 51.93588539383726, 15.511286497484118);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `helios`
--

CREATE TABLE `helios` (
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `schedule_link` varchar(255) NOT NULL,
  `imax_technology` tinyint(1) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `helios`
--

INSERT INTO `helios` (`name`, `address`, `phone`, `email`, `schedule_link`, `imax_technology`, `latitude`, `longitude`) VALUES
('Helios Bełchatów', 'ul.Kolejowa 6, Bełchatów', '+48 44 715 95 60', 'belchatow@helios.pl', 'https://www.helios.pl/37,Belchatow/Repertuar/', 0, 51.3535140708787, 19.376050568701626),
('Helios Białystok Alfa', 'ul. Świętojańska 15, Białystok', '+48 85 741 13 56', 'alfabialystok@helios.pl', 'https://www.helios.pl/26,Bialystok/Repertuar/', 0, 53.125620296039685, 23.169040091508897),
('Helios Białystok Biała', 'ul. Czesława Miłosza 2, Białystok', '+48 85 710 91 72', 'bialystok@helios.pl', 'https://www.helios.pl/6,Bialystok/Repertuar/', 0, 53.12231763353874, 23.177372572722625),
('Helios Białystok Jurowiecka', 'ul. Jurowiecka 1, Białystok', '+48 85 871 01 14', 'bialystok.jurowiecka@helios.pl', 'https://www.helios.pl/46,Bialystok/Repertuar/', 0, 53.13682289758407, 23.162460048608864),
('Helios Bielsko-Biała', 'ul. Mostowa 5, Bielsko-Biała', '+48 33 498 70 12', 'bielsko@helios.pl', 'https://www.helios.pl/7,Bielsko-Biala/Repertuar/', 0, 49.82745621898707, 19.04967177980713),
('Helios Bydgoszcz', 'ul. Fordońska 141, Bydgoszcz', '+48 52 581 00 63', 'bydgoszcz@helios.pl', 'https://www.helios.pl/38,Bydgoszcz/Repertuar/', 0, 53.12593879791866, 18.067248002362426),
('Helios Gdańsk Forum', 'Targ Sienny 7, Gdańsk', '+48 58 732 96 07', 'gdansk.forum@helios.pl', 'https://www.helios.pl/58,Gdansk/Repertuar/', 0, 54.34846690167877, 18.644202064718133),
('Helios Gdańsk Alfa', 'ul. Kołobrzeska 41C, Gdańsk', '+48 58 767 99 82', 'gdansk@helios.pl', 'https://www.helios.pl/2,Gdansk/Repertuar/', 0, 54.404192572607286, 18.5866502443354),
('Helios Gdańsk Metropolia', 'ul. Kilińskiego 4, Gdańsk', '+48 58 731 13 96', 'gdansk.metropolia@helios.pl', 'https://www.helios.pl/49,Gdansk/Repertuar/', 0, 54.38274130256126, 18.605643436555503),
('Helios Dąbrowa Górnicza', 'ul. Jana III Sobieskiego 6, Dąbrowa Górnicza', '+48 32 262 32 19', 'dabrowa@helios.pl', 'https://www.helios.pl/27,Dabrowa-Gornicza/Repertuar/', 0, 50.327649035633165, 19.182274958903243),
('Helios Gdynia', 'ul. Kazimierza Górskiego 2, Gdynia', '+48 58 779 00 01', 'gdynia@helios.pl', 'https://www.helios.pl/42,Gdynia/Repertuar/', 0, 54.5050430092195, 18.53197873261705),
('Helios Gniezno', 'ul. Pałucka 2, Gniezno', '+48 61 426 66 19', 'gniezno@helios.pl', 'https://www.helios.pl/9,Gniezno/Repertuar/', 0, 52.561063486990086, 17.612547353413003),
('Helios Gorzów Wielkopolski', 'Al. Konstytucji 3 Maja 102, Gorzów Wielkopolski', '+48 95 737 27 37', 'gorzow@helios.pl', 'https://www.helios.pl/10,Gorzow-Wielkopolski/Repertuar/', 0, 52.73105117411271, 15.224719083948406),
('Helios Grudziądz', 'ul. Chełmińska 4, Grudziądz', '+48 56 643 12 13', 'grudziadz@helios.pl', 'https://www.helios.pl/32,Grudziadz/Repertuar/', 0, 53.48439312964071, 18.747650627941585),
('Helios Jelenia Góra', 'Al. Jana Pawła II 51, elenia Góra', '+48 75 769 38 65', 'jelenia.gora@helios.pl', 'https://www.helios.pl/45,Jelenia-Gora/Repertuar/', 0, 50.922159591763496, 15.763085060166201),
('Helios Kalisz', 'ul. Górnośląska 82, Kalisz', '+48 62 761 18 67', 'kalisz@helios.pl', 'https://www.helios.pl/40,Kalisz/Repertuar/', 0, 51.7442874799184, 18.070156828236243),
('Helios Katowice', 'ul. Kościuszki 229, Katowice', '+48 32 721 20 70', 'katowice@helios.pl', 'https://www.helios.pl/51,Katowice/Repertuar/', 0, 50.223955385064286, 18.98771066993626),
('Helios Kędzierzyn-Koźle', 'Al. Armii Krajowej 38, Kędzierzyn-Koźle', '+48 77 545 83 36', 'kedzierzyn@helios.pl', 'https://www.helios.pl/34,Kedzierzyn-Kozle/Repertuar/', 0, 50.34209364936955, 18.19106578354544),
('Helios Kielce', 'ul. Świętokrzyska 20, Kielce', '+48 41 332 13 30', 'kielce@helios.pl', 'https://www.helios.pl/13,Kielce/Repertuar/', 0, 50.88051972326799, 20.64768284083923),
('Helios Konin', 'ul. Paderewskiego 8, Konin', '+48 63 242 02 67', 'konin@helios.pl', 'https://www.helios.pl/14,Konin/Repertuar/', 0, 52.238404071991454, 18.259646868740067),
('Helios Koszalin', 'ul. Jana Pawła II 20, Koszalin', '+48 94 711 01 67', 'koszalin@helios.pl', 'https://www.helios.pl/68,Koszalin/Repertuar/', 0, 54.206943239819026, 16.185775278922357),
('Helios Krosno', 'ul. Bieszczadzka 29, Krosno', '+48 13 495 12 50', 'krosno@helios.pl', 'https://www.helios.pl/55,Krosno/Repertuar/', 0, 49.67713010054, 21.77613533871067),
('Helios Legionowo', 'Piłsudskiego 31C, Legionowo', '+48 22 206 38 12', 'legionowo@helios.pl', 'https://www.helios.pl/61,Legionowo/Repertuar/', 0, 52.396487556051085, 20.933348947145888),
('Helios Legnica', 'ul. Najświętszej Marii Panny 9, Legnica', '+48 76 862 00 80', 'legnica@helios.pl', 'https://www.helios.pl/30,Legnica/Repertuar/', 0, 51.209485324657734, 16.16433739326696),
('Helios Lubin', 'ul. Generała Władysława Sikorskiego 20, Lubin', '+48 76 724 97 90', 'lubin@helios.pl', 'https://www.helios.pl/31,Lubin/Repertuar/', 0, 51.39402893877838, 16.205964236593726),
('Helios Łomża', 'al. Legionów 46, Łomża', '+48 86 224 14 06', 'lomza@helios.pl', 'https://www.helios.pl/67,Lomza/Repertuar/', 0, 53.17296520909119, 22.067008587110223),
('Helios Łódź', 'Al. Politechniki 1, Łódź', '+48 42 299 92 72', 'lodz.sukcesja@helios.pl', 'https://www.helios.pl/47,Lodz/Repertuar/', 0, 51.74974957854736, 19.44845429940128),
('Helios Nowy Sącz', 'ul. Lwowska 80, Nowy Sącz', '+48 18 440 11 73', 'nowy.sacz@helios.pl', 'https://www.helios.pl/39,Nowy-Sacz/Repertuar/', 0, 49.62397222099489, 20.706033526862875),
('Helios Olsztyn', 'Al. Piłsudskiego 16, Olsztyn', '+48 89 535 20 00', 'olsztyn@helios.pl', 'https://www.helios.pl/16,Olsztyn/Repertuar/', 0, 53.77711758782555, 20.482800511881003),
('Helios Opole', 'Wrocławska 152/154, Opole', '+48 77 543 01 29', 'opole.karolinka@helios.pl', 'https://www.helios.pl/66,Opole/Repertuar/', 0, 50.681610469904875, 17.883255114554984),
('Helios Opole Solaris', 'Pl. Kopernika 17, Opole', '+48 77 402 50 30', 'opole@helios.pl', 'https://www.helios.pl/17,Opole/Repertuar/', 0, 50.67051852973646, 17.926130821033922),
('Helios Ostrów Wielkopolski', 'ul. Kaliska 120, Ostrów Wielkopolski', '+48 62 590 25 27', 'ostrow.wielkopolski@helios.pl', 'https://www.helios.pl/65,Ostrow-Wielkopolski/Repertuar/', 0, 51.659367151931036, 17.84848600371626),
('Helios Pabianice', 'ul. Grobelna 8, Pabianice', '+48 42 288 19 76', 'pabianice@helios.pl', 'https://www.helios.pl/60,Pabianice/Repertuar/', 0, 51.66076326749611, 19.358502432172184),
('Helios Piła', 'Al. Powst. Wielkopolskich 99, Piła', '+48 67 349 14 16', 'pila@helios.pl', 'https://www.helios.pl/28,Pila/Repertuar/', 0, 53.15860509730956, 16.756921327721226),
('Helios Piotrków Trybunalski', 'ul. Słowackiego 123, Piotrków Trybunalski', '+48 44 715 91 55', 'piotrkow@helios.pl', 'https://www.helios.pl/19,Piotrkow-Trybunalski/Repertuar/', 0, 51.411402739134196, 19.66739843071053),
('Helios Płock', 'ul. Wyszogrodzka 144, Płock', '+48 24 363 34 46', 'plock@helios.pl', 'https://www.helios.pl/29,Plock/Repertuar/', 0, 52.534932718369795, 19.75717812375217),
('Helios Poznań', 'ul. Pleszewska 1, Poznań', '+48 61 622 72 97', 'poznan@helios.pl', 'https://www.helios.pl/50,Poznan/Repertuar/', 0, 52.397633597482546, 16.956290002662204),
('Helios Przemyśl', 'ul. Wojciecha Brudzewskiego 1, Przemyśl', '+48 16 733 16 02', 'przemysl@helios.pl', 'https://www.helios.pl/52,Przemysl/Repertuar/', 0, 49.790810150841395, 22.78321289870589),
('Helios Radom', 'ul. Poniatowskiego 5, Radom', '+48 48 340 07 89', 'radom@helios.pl', 'https://www.helios.pl/20,Radom/Repertuar/', 0, 51.39055196434273, 21.151998371702287),
('Helios Rzeszów Galeria Rzeszów', 'Al. Piłsudskiego 44, Rzeszów', '+48 17 777 12 90', 'galeriarzeszow@helios.pl', 'https://www.helios.pl/36,Rzeszow/Repertuar/', 0, 50.04185527883409, 21.998100661258473),
('Helios Rzeszów Powstańców W-wy', 'Al. Powstańców Warszawy 14, Rzeszów', '+48 17 854 00 64', 'rzeszow@helios.pl', 'https://www.helios.pl/21,Rzeszow/Repertuar/', 0, 50.019116968082734, 21.990691782208824),
('Helios Siedlce', 'ul. Piłsudskiego 74, Siedlce', '+48 25 786 35 80', 'siedlce@helios.pl', 'https://www.helios.pl/43,Siedlce/Repertuar/', 0, 52.16904413968986, 22.269439015594813),
('Helios Sosnowiec', 'ul. Modrzejowska 32b, Sosnowiec', '+48 32 363 14 14', 'sosnowiec@helios.pl', 'https://www.helios.pl/22,Sosnowiec/Repertuar/', 0, 50.27547531452034, 19.13193933558235),
('Helios Stalowa Wola', 'ul. Fryderyka Chopina 42, Stalowa Wola', '+48 15 306 11 36', 'stalowa.wola@helios.pl', 'https://www.helios.pl/56,Stalowa-Wola/Repertuar/', 0, 50.584336970158795, 22.064505363846038),
('Helios Starachowice', 'ul. Ks. Kardynała Stefana Wyszyńskiego 14, Starachowice', '+48 41 262 97 05', 'starachowice@helios.pl', 'https://www.helios.pl/44,Starachowice/Repertuar/', 0, 51.0364981340241, 21.087213427486994),
('Helios Szczecin CHR Kupiec', 'ul. Bolesława Krzywoustego 9-10, Szczecin', '+48 91 485 12 36', 'szczecin@helios.pl', 'https://www.helios.pl/23,Szczecin/Repertuar/', 0, 53.42662541981596, 14.542421371164693),
('Helios Szczecin Outlet Park', 'ul. Andrzeja Struga 42, Szczecin', '+48 91 810 67 60', 'szczecin.outletpark@helios.pl', 'https://www.helios.pl/35,Szczecin/Repertuar/', 0, 53.38034755818751, 14.671247736743219),
('Helios Tczew', 'ul. Pomorska 1, Tczew', '+48 58 777 26 17', 'tczew@helios.pl', 'https://www.helios.pl/33,Tczew/Repertuar/', 0, 54.09638902300392, 18.787588514850242),
('Helios Tomaszów Mazowiecki', 'ul. Warszawska 1, Tomaszów Mazowiecki', '+48 44 737 01 47', 'tomaszow@helios.pl', 'https://www.helios.pl/53,Tomaszow-Mazowiecki/Repertuar/', 0, 51.53446337752163, 20.008136792951788),
('Helios Warszawa Blue City', 'Aleje Jerozolimskie 179, Warszawa', '+48 22 206 38 17', 'warszawa.bluecity@helios.pl', 'https://www.helios.pl/57,Warszawa/Repertuar/', 0, 52.21249910307101, 20.955633117398957),
('Helios Wołomin', 'ul. Geodetów 2, Wołomin', '+48 22 212 54 14', 'wolomin@helios.pl', 'https://www.helios.pl/54,Wolomin/Repertuar/', 0, 52.35653688037137, 21.258070971164692),
('Helios Wrocław Aleja Bielany', 'ul. Czekoladowa 7-9, Bielany Wrocławskie, Kobierzyce', '+48 71 712 10 42', 'wroclaw.bielany@helios.pl', 'https://www.helios.pl/48,Wroclaw/Repertuar/', 0, 51.048852242373556, 16.95993069514578),
('Helios Wrocław Magnolia Park', 'ul. Legnicka 58, Wrocław', '+48 71 355 53 54', 'wroclaw.legnicka@helios.pl', 'https://www.helios.pl/3,Wroclaw/Repertuar/', 0, 51.11819102658211, 16.987191275309165),
('Helios Żory', 'ul. Katowicka 10, Żory', '+48 32 750 60 24', 'zory@helios.pl', 'https://www.helios.pl/64,Zory/Repertuar/', 0, 50.045247689342105, 18.703396741533773);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `multikino`
--

CREATE TABLE `multikino` (
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `phone` text NOT NULL,
  `email` text NOT NULL,
  `schedule_link` varchar(255) NOT NULL,
  `imax_technology` tinyint(1) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `multikino`
--

INSERT INTO `multikino` (`name`, `address`, `phone`, `email`, `schedule_link`, `imax_technology`, `latitude`, `longitude`) VALUES
('Multikino Gdańsk', 'al. Zwycięstwa 14, Gdańsk', '+48 54 23 03 631', 'gdansk@multikino.pl', 'https://multikino.pl/repertuar/gdansk/', 0, 54.37212236607634, 18.627158613036855),
('Multikino Biała Podlaska', 'ul. Brzeska 21, Biała Podlaska', '+48 41 267 23 87', 'bialapodlaska@multikino.pl', 'https://multikino.pl/repertuar/biala-podlaska', 0, 52.034403463238654, 23.123035141024296),
('Multikino Bydgoszcz', 'ul. Marszałka Focha 48, Bydgoszcz', '+48 41 267 23 70', 'bydgoszcz@multikino.pl', 'https://multikino.pl/repertuar/bydgoszcz', 0, 53.12616554316124, 17.989407199939517),
('Multikino Czechowice-Dziedzice', 'ul. Legionów 83. Czechowice-Dziedzice', '+48 41 26 72 368', 'czechowicedziedzice@multikino.pl', 'https://multikino.pl/repertuar/czechowice-dziedzice', 0, 49.912481536638005, 18.997366171164693),
('Multikino Elbląg', 'ul. płk. Stanisława Dąbka 152', '+48 41 267 23 71', 'elblag@multikino.pl', 'https://multikino.pl/repertuar/elblag', 0, 54.185897570703744, 19.406303971164693),
('Multikino Głogów', 'ul. Piłsudskiego 19, Głogów', '+48 41 267 23 90', 'glogow@multikino.pl', 'https://multikino.pl/repertuar/glogow', 0, 51.650155450960035, 16.054871156701093),
('Multikino Gorzów Wielkopolski', 'ul. kombatantów 30, Gorzów Wielkopolski', '+48 41 267 23 90', 'gorzow@multikino.pl', 'https://multikino.pl/repertuar/gorzow-wielkopolski', 0, 52.76103527893256, 15.260379700649477),
('Multikino Jaworzno', 'ul. Grunwaldzka 59, Jaworzno', '+48 41 26 72 369', 'jaworzno@multikino.pl', 'https://multikino.pl/repertuar/jaworzno', 0, 50.20335806642576, 19.2687931),
('Multikino Kalisz', 'ul. 3 Maja 1, Kalisz', '+48 41 267 23 84', 'kalisz@multikino.pl', 'https://multikino.pl/repertuar/kalisz', 0, 51.76571080706539, 18.08779086714561),
('Multikino Katowice', 'ul. 3 Maja 30, Katowice', '+48 41 26 72 361', 'katowice@multikino.pl', 'https://multikino.pl/repertuar/katowice', 0, 50.2587230928755, 19.016505542330144),
('Multikino Kielce', 'ul. Warszawska 26, Kielce', '+48 54 23 03 635', 'kielce@multikino.pl', 'https://multikino.pl/repertuar/kielce', 0, 50.875691205184204, 20.635210400000002),
('Multikino Kłodzko', 'ul. Noworudzka 2, Kłodzko', '+48 41 267 23 83', 'klodzko@multikino.pl', 'https://multikino.pl/repertuar/klodzko', 0, 50.45397977577372, 16.637643933359147),
('Multikino Koszalin', 'ul. Paderewskiego 1, Koszalin', '+48 41 26 72 364', 'koszalin@multikino.pl', 'https://multikino.pl/repertuar/koszalin', 0, 54.176759419167105, 16.20078476321199),
('Multikino Kraków', 'Dobrego Pasterza 128, Kraków', '+48 54 23 03 630', 'krakow@multikino.pl', 'https://multikino.pl/repertuar/krakow', 0, 50.088907823805, 19.984302636788012),
('Multikino Leszno', 'Al. Konstytucji 3 Maja 12, Leszno', '+48 441 267 23 86', 'leszno@multikino.pl', 'https://multikino.pl/repertuar/leszno', 0, 51.82578469999274, 16.599972671117065),
('Multikino Lublin', 'Aleja Spółdzielności Pracy 36B, Lublin', '+48 41 26 72 367', 'lublin@multikino.pl', 'https://multikino.pl/repertuar/lublin', 0, 51.2672573356486, 22.57132672028951),
('Multikino Łódź', 'Al. Piłsudskiego 5, Łódź', '+48 41 267 23 72', 'lodz@multikino.pl', 'https://multikino.pl/repertuar/lodz', 0, 51.759077915592414, 19.4605384312662),
('Multikino Mielec', 'ul. Powstańców Warszawy 4, Mielec', '+48 41 267 23 93', 'mielec@multikino.pl', 'https://multikino.pl/repertuar/mielec', 0, 50.28837687056168, 21.459415557570853),
('Multikino Olsztyn', 'ul. Tuwima 26, Olsztyn', '+48 41 267 23 73', 'olsztyn@multikino.pl', 'https://multikino.pl/repertuar/olsztyn', 0, 53.75394134133059, 20.48488854232939),
('Multikino Poznań 51', 'ul. Królowej Jadwigi 51, Poznań', '+48 54 23 03 633', 'poznan51@multikino.pl', 'https://multikino.pl/repertuar/poznan-multikino-51', 0, 52.39943294951617, 16.9290235),
('Multikino Poznań Stary Browar', 'ul. Półwiejska 42, Poznań', '+48 41 267 23 74', 'starybrowar@multikino.pl', 'https://multikino.pl/repertuar/poznan-stary-browar', 0, 52.40282079850625, 16.924306400000766),
('Multikino Pruszków', 'ul. Sienkiewicza 19, Pruszków', '+48 41 267 23 81', 'pruszkow@multikino.pl', 'https://multikino.pl/repertuar/pruszkow', 0, 52.16516209877899, 20.792842249143277),
('Multikino Radom', 'ul. Bolesława Chrobrego 1, Radom', '+48 41 26 72 366', 'radom@multikino.pl', 'https://multikino.pl/repertuar/radom', 0, 51.40534675915925, 21.154300835394498),
('Multikino Rumia', 'ul. Sabata 1, Rumia', '+48 41 267 23 75', 'rumia@multikino.pl', 'https://multikino.pl/repertuar/rumia', 0, 54.563962191758044, 18.39156155013186),
('Multikino Rybnik', 'ul. Bolesława Chrobrego 1, Rybnik', '+48 41 267 23 76', 'rybnik@multikino.pl', 'https://multikino.pl/repertuar/rybnik', 0, 50.09436359295983, 18.543234599997355),
('Multikino Rzeszów', 'al. Kopisto 1, Rzeszów', '+48 54 23 03 638', 'rzeszow@multikino.pl', 'https://multikino.pl/repertuar/rzeszow', 0, 50.02756337293523, 22.015870870290787),
('Multikino Słupsk', 'ul. Szczecińska 57, Słupsk', '+48 41 267 23 77', 'slupsk@multikino.pl', 'https://multikino.pl/repertuar/slupsk', 0, 54.45394326950538, 16.9921056),
('Multikino Sopot', 'ul. Boh. Monte Cassino 63, Sopot', '+48 54 23 03 639', 'sopot@multikino.pl', 'https://multikino.pl/repertuar/sopot', 0, 54.445258125999736, 18.567887107220983),
('Multikino Szczecin', 'al. Wyzwolenia 18-20, Szczecin', '+48 41 267 23 78', 'szczecin@multikino.pl', 'https://multikino.pl/repertuar/szczecin', 0, 53.43373952896621, 14.555905286505915),
('Multikino Świdnica', 'ul. Westerplatte 29, Świdnica', '+48 41 267 23 85', 'swidnica@multikino.pl', 'https://multikino.pl/repertuar/swidnica', 0, 50.840749465335556, 16.49749680191636),
('Multikino Świnoujście', 'ul. Jarosława Dąbrowskiego 5, Świnoujście', '+48 41 267 23 88', 'swinoujscie@multikino.pl', 'https://multikino.pl/repertuar/swinoujscie', 0, 53.909904345214635, 14.246423303084335),
('Multikino Tarnów', 'ul. Krakowska 149/154, Tarnów', '+48 41 267 23 92', 'tarnow@multikino.pl', 'https://multikino.pl/repertuar/tarnow', 0, 50.00058262779079, 20.957632135574404),
('Multikino Tychy City Point', 'al. Jana Pawła II 16/18, Tychy', '+48 54 23 03 634', 'tychy@multikino.pl', 'https://multikino.pl/repertuar/tychy-city-point', 0, 50.11162141987295, 18.987986899996137),
('Multikino Tychy Gemini Park', 'ul. Towarowa 2C, Tychy', '+48 519 520 934', 'TychyGemini@multikino.pl', 'https://multikino.pl/repertuar/tychy-gemini-park', 0, 50.097030546010096, 19.008535120444552),
('Multikino Warszawa Atrium Reduta', 'Aleje Jerozolimskie 148, Warszawa', '+48 41 267 23 94', 'reduta@multikino.pl', 'https://multikino.pl/repertuar/warszawa-atrium-reduta', 0, 52.213152989946884, 20.951132945190448),
('Multikino Warszawa Atrium Targówek', 'ul. Głębocka 15, Warszawa', '+48 41 26 72 362', 'targowek@multikino.pl', 'https://multikino.pl/repertuar/warszawa-atrium-targowek', 0, 52.30239199922756, 21.057580409359762),
('Multikino Warszawa Młociny', 'ul. Zgrupowania AK Kampinos 15, Warszawa', '+48 41 26 72 382', 'mlociny@multikino.pl', 'https://multikino.pl/repertuar/warszawa-mlociny', 0, 52.294780564143004, 20.930933312063026),
('Multikino Warszawa Ursynów', 'al. Komisji Edukacji Narodowej 60, Warszawa', '+48 54 23 03 632', 'ursynow@multikino.pl', 'https://multikino.pl/repertuar/warszawa-ursynow', 0, 52.149623191615646, 21.046763499998118),
('Multikino Warszawa Wola Park', 'ul. Górczewska 124, Warszawa', '+48 41 267 23 79', 'wola@multikino.pl', 'https://multikino.pl/repertuar/warszawa-wola-park', 0, 52.24172833679486, 20.932905700000003),
('Multikino Warszawa Złote Tarasy', 'ul. Złota 59, Warszawa', '+48 41 26 72 360', 'zlotetarasy@multikino.pl', 'https://multikino.pl/repertuar/warszawa-zlote-tarasy', 0, 52.229383385715494, 21.001904142329394),
('Multikino Włocławek', 'ul. Pułaskiego 10-12, Włocławek', '+48 54 23 03 637', 'wloclawek@multikino.pl', 'https://multikino.pl/repertuar/wloclawek', 0, 52.654720572926365, 19.06085475767062),
('Multikino Wrocław Pasaż Grunwaldzki', 'pl. Grunwaldzki 22, Wrocław', '+48 54 23 03 636', 'wroclawpasaz@multikino.pl', 'https://multikino.pl/repertuar/wroclaw-pasaz-grunwaldzki', 0, 51.11267026133811, 17.0592564),
('Multikino Zabrze', 'ul. Gdańska 18, Zabrze', '+48 41 26 72 363', 'zabrze@multikino.pl', 'https://multikino.pl/repertuar/zabrze', 0, 50.317292957203655, 18.7767766672993),
('Multikino Zgorzelec', 'ul. Armii Krajowej 52a, Zgorzelec', '+48 41 267 23 80', 'zgorzelec@multikino.pl', 'https://multikino.pl/repertuar/zgorzelec', 0, 51.15295034642946, 15.026851471164694);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
