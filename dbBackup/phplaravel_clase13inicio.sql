-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2020 at 01:38 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phplaravel`
--
DROP DATABASE phplaravel;
CREATE DATABASE IF NOT EXISTS `phplaravel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phplaravel`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USUARIO_CON` (IN `nom_usuario` VARCHAR(50), IN `contrasenia` VARCHAR(300), IN `opc` INT)  NO SQL
BEGIN
	IF opc = 1 THEN
        SELECT u.id as id_user,
                       u.usuario as user_name,
                       u.clave as password,
                       u.idempleado as id_employee,
                       u.idperfil as id_role,
                       u.estado as status_user,
                       p.id as id_role,
                       p.nombre as name_role,
                       p.estado as status_role,
                       e.id as id_employee,
                       e.cedula as dni_employee,
                       e.nombre as name_employee,
                       e.apellido as lastname_employee,
                       e.fecha_nacimiento as birthday_employee,
                       e.estado as status_employee
                from usuario u, perfil p, empleado e
                where u.usuario=nom_usuario
                  and u.clave = password(contrasenia) 
                  and u.idperfil = p.id
                  and u.idempleado = e.id
                  and u.estado = 'A';
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USUARIO_MAN` (IN `nombre_usuario` VARCHAR(100), IN `clave_actual` VARCHAR(300), IN `clave_nueva` VARCHAR(300), IN `opc` INT)  NO SQL
BEGIN
	IF opc = 1 THEN
    	UPDATE usuario SET clave = PASSWORD(clave_nueva) WHERE usuario = nombre_usuario;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `status` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `description`, `status`) VALUES
(1, 'General', 'A'),
(2, 'Tecnología', 'A'),
(3, 'Electrónica', 'A'),
(4, 'Telefonía', 'A'),
(5, 'Hogar', 'A'),
(6, 'Automotriz', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL),
(6, 1, NULL, NULL),
(7, 1, NULL, NULL),
(8, 1, NULL, NULL),
(9, 1, NULL, NULL),
(10, 1, NULL, NULL),
(11, 1, NULL, NULL),
(12, 1, NULL, NULL),
(13, 1, NULL, NULL),
(14, 1, NULL, NULL),
(15, 1, NULL, NULL),
(8, 5, NULL, NULL),
(12, 2, NULL, NULL),
(12, 3, NULL, NULL),
(1, 4, NULL, NULL),
(2, 2, NULL, NULL),
(1, 3, NULL, NULL),
(12, 6, NULL, NULL),
(12, 5, NULL, NULL),
(20, 1, '2020-09-10 00:42:23', '2020-09-10 00:42:23'),
(20, 3, '2020-09-10 00:42:23', '2020-09-10 00:42:23'),
(21, 1, '2020-09-10 01:15:45', '2020-09-10 01:15:45'),
(21, 5, '2020-09-10 01:15:45', '2020-09-10 01:15:45');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `ruc` varchar(13) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `ruc`, `nombre`, `estado`) VALUES
(1, '0921247033001', 'WYNE INDUSTRIES', 'A'),
(2, '0924896360021', 'CYBERDINE SYSTEMS RESEARCH', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`id`, `cedula`, `nombre`, `apellido`, `fecha_nacimiento`, `estado`) VALUES
(1, 921257005, 'Angel', 'Alvarado', '1985-08-03', 'A'),
(2, 1325457896, 'Manuel', 'Zambrano', '1991-10-23', 'A'),
(3, 984999177, 'GUILLERMO', 'VINCES', '1950-08-26', 'A'),
(4, 912457863, 'MARIA', 'DB', '1990-08-14', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `facturac`
--

CREATE TABLE `facturac` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `ruc` varchar(13) NOT NULL,
  `cliente` varchar(200) NOT NULL,
  `subtotal` float NOT NULL,
  `iva` float NOT NULL,
  `total` float NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturac`
--

INSERT INTO `facturac` (`id`, `fecha`, `ruc`, `cliente`, `subtotal`, `iva`, `total`, `estado`) VALUES
(1, '2019-12-07', '0921247033001', 'WYNE INDUSTRIES', 0, 0, 0, 'A'),
(2, '2019-12-03', '0924896360021', 'CYBERDINE SYSTEMS RESEARCH', 0, 0, 0, 'A'),
(3, '2019-12-07', '0924896360021', 'CYBERDINE SYSTEMS RESEARCH', 0, 0, 0, 'A'),
(4, '2019-12-07', '0921247033001', 'WYNE INDUSTRIES', 1199.97, 143.996, 1343.97, 'A'),
(5, '2019-12-07', '0924896360021', 'CYBERDINE SYSTEMS RESEARCH', 12.99, 1.5588, 14.5488, 'A'),
(6, '2019-12-07', '0924896360021', 'CYBERDINE SYSTEMS RESEARCH', 799.98, 95.9976, 895.978, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `facturad`
--

CREATE TABLE `facturad` (
  `id` int(11) NOT NULL,
  `facturac` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `cantidad` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facturad`
--

INSERT INTO `facturad` (`id`, `facturac`, `id_producto`, `producto`, `estado`, `precio`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 'Teclado Usb', 'A', '10.25', '0.00', '0.00'),
(2, 1, 2, 'Monitor 19\'', 'A', '119.99', '0.00', '0.00'),
(3, 2, 1, 'Televisor Smart TV 40\" Refurbisher', 'A', '399.99', '0.00', '0.00'),
(4, 2, 2, 'Laptop Asus Core i7 G8', 'A', '850.50', '0.00', '0.00'),
(5, 3, 2, 'Laptop Asus Core i7 G8', 'A', '850.50', '5.00', '0.00'),
(6, 4, 1, 'Televisor Smart TV 40\" Refurbisher', 'A', '399.99', '3.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mark`
--

INSERT INTO `mark` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Generica', 'A', '2020-09-05 01:22:25', '2020-09-05 01:22:25'),
(2, 'Nokia', 'A', NULL, NULL),
(3, 'LG', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `idmenu_padre` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nivel` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `ruta` varchar(300) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `idmenu_padre`, `nombre`, `nivel`, `orden`, `ruta`, `estado`) VALUES
(1, 0, 'Acceso', 1, 1, '#', 'A'),
(2, 0, 'Mantenimiento', 1, 2, '#', 'A'),
(3, 0, 'Procesos', 1, 3, '#', 'A'),
(4, 0, 'Reportes', 1, 4, '#', 'A'),
(5, 1, 'Cambiar Clave', 2, 2, 'cambiarClave.php', 'A'),
(6, 1, 'Cerrar Sesión', 2, 1, 'UserController/logout/', 'A'),
(7, 2, 'Usuario', 2, 1, '#', 'A'),
(8, 2, 'Empleado', 2, 2, '#', 'A'),
(9, 4, 'Listado de Productos', 2, 1, 'ProductController/index/', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_09_05_003614_create_presentation_table', 2),
(6, '2020_09_05_005213_create_mark_table', 3),
(9, '2020_09_05_010257_add_status_to_mark_table', 4),
(10, '2020_09_05_011834_add_mark_fk_to_product_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`id`, `nombre`, `estado`) VALUES
(1, 'Administrador', 'A'),
(2, 'Operador', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `idperfil` int(11) NOT NULL,
  `idmenu` int(11) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `perfil_menu`
--

INSERT INTO `perfil_menu` (`idperfil`, `idmenu`, `estado`) VALUES
(1, 1, 'A'),
(1, 2, 'A'),
(1, 3, 'A'),
(1, 4, 'A'),
(1, 5, 'A'),
(1, 6, 'A'),
(1, 9, 'A'),
(2, 1, 'A'),
(2, 4, 'A'),
(2, 5, 'A'),
(2, 6, 'A'),
(2, 9, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `presentation`
--

CREATE TABLE `presentation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presentation`
--

INSERT INTO `presentation` (`id`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Unidad', '', NULL, NULL),
(2, 'Bulto', '', NULL, NULL),
(3, 'Caja', 'A', NULL, NULL),
(4, 'Rollo', 'A', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'A',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mark_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `presentation_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `description`, `price`, `status`, `created_at`, `updated_at`, `mark_id`, `presentation_id`) VALUES
(1, 'Nokia A3 2.1', '150.99', 'A', '2020-09-05 01:29:42', '2020-09-05 01:29:42', 2, 1),
(2, 'Iphone 11 64 GB Azul', '869.99', 'A', '2020-09-04 21:58:10', '2020-09-04 21:58:10', 1, 1),
(6, 'Monitor LG 21\"', '100.00', 'A', '2020-09-05 01:29:33', '2020-09-05 01:29:33', 3, 1),
(7, 'Monitor HP 19 \"', '85.08', 'A', '2020-09-04 21:58:54', '2020-09-04 21:58:54', 1, 1),
(8, 'Mesa', '1.00', 'A', '2020-09-04 21:59:20', '2020-09-04 21:59:20', 1, 1),
(9, 'Billetera de Cuero', '20.58', 'A', '2020-09-04 21:58:54', '2020-09-04 21:58:54', 1, 1),
(10, 'Tablet Asus 7\"', '125.87', 'A', '2020-09-04 21:58:54', '2020-09-04 21:58:54', 1, 1),
(11, 'CPU Celeron AX3', '105.00', 'A', '2020-09-04 21:58:54', '2020-09-04 21:58:54', 1, 1),
(12, 'Parlante 3W', '25.89', 'A', '2020-09-04 21:58:54', '2020-09-04 21:58:54', 1, 1),
(13, 'Teclado', '5.00', 'A', '2020-09-04 21:58:54', '2020-09-04 21:58:54', 1, 1),
(14, 'Cable UTP CAT 6', '53.55', 'A', '2020-09-05 07:33:02', '2020-09-05 07:33:02', 1, 4),
(15, 'Lapices', '5.25', 'A', '2020-09-05 07:34:36', '2020-09-05 07:34:36', 1, 3),
(20, 'Proyector', '100.52', 'A', '2020-09-10 00:42:23', '2020-09-10 00:42:23', 3, 1),
(21, 'Silla', '20.69', 'A', '2020-09-10 01:15:45', '2020-09-10 01:15:45', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `precio` decimal(12,2) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `descripcion`, `precio`, `estado`) VALUES
(1, 'Televisor Smart TV 40\" Refurbisher', '399.99', 'A'),
(2, 'Laptop Asus Core i7 G8', '850.50', 'A'),
(3, 'Parlantes Speemind', '12.99', 'A'),
(4, 'Control Remoto', '5.00', 'X'),
(5, 'Acondicionador de Aire', '456.99', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `song`
--

CREATE TABLE `song` (
  `id` int(11) NOT NULL,
  `artist` text COLLATE utf8_unicode_ci NOT NULL,
  `track` text COLLATE utf8_unicode_ci NOT NULL,
  `link` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `song`
--

INSERT INTO `song` (`id`, `artist`, `track`, `link`) VALUES
(1, 'Dena', 'Cash, Diamond Ring, Swimming Pools', 'http://www.youtube.com/watch?v=r4CDc9yCAqE'),
(2, 'Jessy Lanza', 'Kathy Lee', 'http://vimeo.com/73455369'),
(3, 'The Orwells', 'In my Bed (live)', 'http://www.youtube.com/watch?v=8tA_2qCGnmE'),
(4, 'L\'Orange & Stik Figa', 'Smoke Rings', 'https://www.youtube.com/watch?v=Q5teohMyGEY'),
(5, 'Labyrinth Ear', 'Navy Light', 'http://www.youtube.com/watch?v=a9qKkG7NDu0'),
(6, 'Bon Hiver', 'Wolves (Kill them with Colour Remix)', 'http://www.youtube.com/watch?v=5GXAL5mzmyw'),
(7, 'Detachments', 'Circles (Martyn Remix)', 'http://www.youtube.com/watch?v=UzS7Gvn7jJ0'),
(8, 'Dillon & Dirk von Loetzow', 'Tip Tapping (Live at ZDF Aufnahmezustand)', 'https://www.youtube.com/watch?v=hbrOLsgu000'),
(9, 'Dillon', 'Contact Us (Live at ZDF Aufnahmezustand)', 'https://www.youtube.com/watch?v=E6WqTL2Up3Y'),
(10, 'Tricky', 'Hey Love (Promo Edit)', 'http://www.youtube.com/watch?v=OIsCGdW49OQ'),
(11, 'Compuphonic', 'Sunset feat. Marques Toliver (DJ T. Remix)', 'http://www.youtube.com/watch?v=Ue5ZWSK9r00'),
(12, 'Ludovico Einaudi', 'Divenire (live @ Royal Albert Hall London)', 'http://www.youtube.com/watch?v=X1DRDcGlSsE'),
(13, 'Maxxi Soundsystem', 'Regrets we have no use for (Radio1 Rip)', 'https://soundcloud.com/maxxisoundsystem/maxxi-soundsystem-ft-name-one'),
(14, 'Beirut', 'Nantes (Fredo & Thang Remix)', 'https://www.youtube.com/watch?v=ojV3oMAgGgU'),
(15, 'Buku', 'All Deez', 'http://www.youtube.com/watch?v=R0bN9JRIqig'),
(16, 'Pilocka Krach', 'Wild Pete', 'http://www.youtube.com/watch?v=4wChP_BEJ4s'),
(17, 'Mount Kimbie', 'Here to stray (live at Pitchfork Music Festival Paris)', 'http://www.youtube.com/watch?v=jecgI-zEgIg'),
(18, 'Kool Savas', 'King of Rap (2012) / Ein Wunder', 'http://www.youtube.com/watch?v=mTqc6UTG1eY&hd=1'),
(19, 'Chaim feat. Meital De Razon', 'Love Rehab (Original Mix)', 'http://www.youtube.com/watch?v=MJT1BbNFiGs'),
(20, 'Emika', 'Searching', 'http://www.youtube.com/watch?v=oscuSiHfbwo'),
(21, 'Emika', 'Sing to me', 'http://www.youtube.com/watch?v=k9sDBZm8pgk'),
(22, 'George Fitzgerald', 'Thinking of You', 'http://www.youtube.com/watch?v=-14B8l49iKA'),
(23, 'Disclosure', 'You & Me (Flume Edit)', 'http://www.youtube.com/watch?v=OUkkaqSNduU'),
(24, 'Crystal Castles', 'Doe Deer', 'http://www.youtube.com/watch?v=zop0sWrKJnQ'),
(25, 'Tok Tok vs. Soffy O.', 'Missy Queens Gonna Die', 'http://www.youtube.com/watch?v=EN0Tnw5zy6w'),
(26, 'Fink', 'Maker (Synapson Remix)', 'http://www.youtube.com/watch?v=Dyd-cUkj4Nk'),
(27, 'Flight Facilities (ft. Christine Hoberg)', 'Clair De Lune', 'http://www.youtube.com/watch?v=Jcu1AHaTchM'),
(28, 'Karmon', 'Turning Point (Original Mix)', 'https://www.youtube.com/watch?v=-tB-zyLSPEo'),
(29, 'Shuttle Life', 'The Birds', 'http://www.youtube.com/watch?v=-I3m3cWDEtM'),
(30, 'SantÃ©', 'Homegirl (Rampa Mix)', 'http://www.youtube.com/watch?v=fnhMNOWxLYw'),
(31, 'Delfin Quispe', 'Torres Gemelas', 'https://www.youtube.com/watch?v=DOoL8yFP350');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Angel Alvarado', 'angalvar@hotmail.com', NULL, '$2y$10$DgFa.kF7G55VSUH5nTGDguUOQ/.UCsavhcKQLIx98yUmRrFC5LBQC', NULL, '2020-09-03 07:22:13', '2020-09-03 07:22:13');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(300) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `clave`, `idempleado`, `idperfil`, `estado`) VALUES
(1, 'aalvarado', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', 1, 1, 'A'),
(2, 'mzambrano', '*23AE809DDACAF96AF0FD78ED04B6A265E05AA257', 2, 2, 'A'),
(3, 'mariadb', '*531E182E2F72080AB0740FE2F2D689DBE0146E04', 4, 2, 'A'),
(4, 'gvinces', '*531E182E2F72080AB0740FE2F2D689DBE0146E04', 3, 1, 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD KEY `product_id_foreign` (`product_id`),
  ADD KEY `category_id_foreign` (`category_id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indexes for table `facturac`
--
ALTER TABLE `facturac`
  ADD PRIMARY KEY (`id`),
  ADD KEY `factura_cliente` (`ruc`);

--
-- Indexes for table `facturad`
--
ALTER TABLE `facturad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facturad_facturac` (`facturac`),
  ADD KEY `facturad_producto` (`id_producto`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD UNIQUE KEY `idperfil` (`idperfil`,`idmenu`),
  ADD KEY `idmenu` (`idmenu`);

--
-- Indexes for table `presentation`
--
ALTER TABLE `presentation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_mark_id_foreign` (`mark_id`),
  ADD KEY `product_presentation_id_foreign` (`presentation_id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `idempleado` (`idempleado`),
  ADD KEY `idperfil` (`idperfil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `facturac`
--
ALTER TABLE `facturac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `facturad`
--
ALTER TABLE `facturad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `presentation`
--
ALTER TABLE `presentation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `facturac`
--
ALTER TABLE `facturac`
  ADD CONSTRAINT `factura_cliente` FOREIGN KEY (`ruc`) REFERENCES `cliente` (`ruc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `facturad`
--
ALTER TABLE `facturad`
  ADD CONSTRAINT `facturad_facturac` FOREIGN KEY (`facturac`) REFERENCES `facturac` (`id`),
  ADD CONSTRAINT `facturad_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`);

--
-- Constraints for table `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `perfil_menu_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`id`),
  ADD CONSTRAINT `perfil_menu_ibfk_2` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_mark_id_foreign` FOREIGN KEY (`mark_id`) REFERENCES `mark` (`id`),
  ADD CONSTRAINT `product_presentation_id_foreign` FOREIGN KEY (`presentation_id`) REFERENCES `presentation` (`id`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`id`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
