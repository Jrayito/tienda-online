-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2021 at 04:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `usuario` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `idOrden` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `calificar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `precio` float NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `imagenes`
--

CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `imagenes`
--

INSERT INTO `imagenes` (`id`, `id_producto`, `url`, `tipo`) VALUES
(32, 16, '6893b8bfbe55bc7386d61cd7c3de2bf4.jpg', 0),
(33, 16, 'ccce166afa14b8c90e18842f5912917b.jpg', 1),
(34, 16, 'f78a6493662bc5107f05ba791cec7eda.jpg', 2),
(35, 16, 'fad045eb6fdc3d298512fd4ee0fd2fc6.jpg', 3),
(36, 17, '448a4c78d151f8f184b1af14c5870130.jpg', 0),
(37, 17, '4ef5e4f0331fdcbf7d376d0c0e8348cb.jpg', 1),
(38, 18, '8605b55a38c6b8d892267435c4d83ca5.jpg', 0),
(39, 18, 'fcfce43486b495e1cba2f6c3058e322a.jpg', 1),
(40, 18, '9f9a563125bd70cc124135755aec90af.jpg', 2),
(41, 18, '97ef0ca705988a7661afa012e835bbaa.jpg', 3),
(42, 19, 'b6c79cd86a90cbae9bfb42630d24545f.jpg', 0),
(43, 19, '8cb2fe49ef5e675e3355b6753caa1e8b.jpg', 1),
(44, 19, 'afff7c844609ee5c5979bd37813d05b3.jpg', 2),
(45, 19, '1f72ba36d70bf99ce193e2d41e2b1c73.jpg', 3),
(50, 21, '6f302f3f79014e9dc04dc972c2d1a0a8.jpg', 0),
(51, 21, 'c285979110d3e7e0aa0957571e66ddd1.jpg', 1),
(52, 21, 'e6feb72daae763e62d1291c3e80e9b86.jpg', 2),
(53, 21, '46dc37e16b04b91e8bfda4f621b9a978.jpg', 3),
(54, 22, '80010a897bcbc30ebbd876bc8fd395db.jpg', 0),
(55, 22, '02a176511d018952ebff08279f76f88a.jpg', 1),
(56, 22, '34189980c662d4066b1691a9921628c3.jpg', 2),
(57, 22, 'a100b6621822d3017c898677bbc1c7d2.jpg', 3),
(58, 23, 'd88ec755ef43adb36940ccf35c8931cd.jpg', 0),
(59, 23, '160fb7a2a664e15407fdc7d7d71291f5.jpg', 1),
(60, 23, '89fe55c2df94fb402da8520a3d3a597a.jpg', 2),
(61, 23, '9ad2ba4d91e469c3feeb9ef792c4eab8.jpg', 3),
(66, 25, 'd93b4c6ab604ddb0a99d4d0df1d4731a.jpg', 0),
(67, 25, 'a5d8b037636471c73e5d60892e66e1d2.jpg', 1),
(68, 25, 'f2172a2ac6419f995abb4d0780aa3bfb.jpg', 2),
(69, 25, '37b7f9fea5efd977caabbd43483169de.jpg', 3),
(70, 26, 'b3ea1c79d25b804a357697da82eb9c17.jpg', 0),
(71, 26, '7f3fe2e68ce56ce9c5e3ee39e3afaa87.jpg', 1),
(72, 26, '78ac477ab88a2d69325f0e078ee6d440.jpg', 2),
(73, 27, 'c284aed9867eb42bf76c5224d39eb443.jpg', 0),
(74, 27, 'dc0b6db9dc0309e5895d77aa359bd8c8.jpg', 1),
(75, 27, 'a0b6bf5023d584a6d465c89634652707.jpg', 2),
(76, 27, '612da2d371351010b8688f07b4131815.jpg', 3),
(77, 28, '6166f5c5f0a20e2a143d860750281bdb.jpg', 0),
(78, 28, 'bc51ac403733f6068ec115439956cab3.jpg', 1),
(79, 28, 'efbfb1d41574bb8e7447803687ee5a3b.jpg', 2),
(80, 28, '3f45337c9643688c6b1461b9ad03d641.jpg', 3),
(81, 29, '0c2711d12e32541f982b37e73e4d6ec0.jpg', 0),
(82, 29, 'cb84a5fd4071147848cd98aa2ac1828d.jpg', 1),
(83, 29, '701edeebd49496f51f0459bff316ddb7.jpg', 2),
(84, 29, 'db4e658ee5b229d3c00686a8306d56c3.jpg', 3),
(85, 30, '4e80b35b8bd6ecd097e966018d3b1836.jpg', 0),
(86, 30, 'c98b5fc01e615b630e572f81ae880990.jpg', 1),
(87, 30, '233fc6acdd4386199e2fa483db320019.jpg', 2),
(88, 31, '6e6e4c9d0406426a74f464be460428e9.jpg', 0),
(89, 31, '61e22ac7d592d8496f4a8ba38f177b5a.jpg', 1),
(90, 31, '7caa290aaf8841e030c406d59e46c5e1.jpg', 2),
(91, 31, '01a2bb3d5398469cb2a07f7713f953b4.jpg', 3),
(92, 32, 'fb966474e1c4b9eb4617126df62fb674.jpg', 0),
(93, 32, 'aeb9afce8658365ae577537fb1dde94e.jpg', 1),
(94, 32, '61e068714e2d2242df26253cf683adc1.jpg', 2),
(95, 32, '9d773b9c6e9ed8808b901207f480cac6.jpg', 3),
(96, 33, '5efc7500cba81bc9ef78ad24097ddd21.jpg', 0),
(97, 33, '925d4087883cb39cd0d9f49fb0729667.jpg', 1),
(98, 33, '8ab39d5e4876f4c7c877fcb8e26c7144.jpg', 2),
(99, 33, '76035a06995e617e142015099876c552.jpg', 3),
(100, 34, '7ffbf72e5c8b4dd699b258d21e24a0ad.jpg', 0),
(101, 35, '75d45fbff8fbf848879c88e276622e12.jpg', 0),
(102, 35, '907ac733f12c282ac844a9063856c564.jpg', 1),
(103, 35, '3ad5845a5d84b140a2d2406e8d2313b7.jpg', 2),
(104, 35, '7eec206dff825110d85ef31e8e2fbaea.jpg', 3),
(105, 36, 'e3d93b837f885ccd5ba619357a44bd19.jpg', 0),
(106, 36, '6cd4ca16db133af3fde140d6464a4f81.jpg', 1),
(107, 36, 'cf6fa529c1c5e7014091ca62dcd087f4.jpg', 2),
(108, 36, '0630063b98b27c8cfc01eaabb3d155fe.jpg', 3),
(113, 38, '3db5d9cea814e94bb5ef32d30c50d67e.jpg', 0),
(114, 38, '89b8ca041bed02773637a3ca48884484.jpg', 1),
(115, 38, 'f2236d34155144056a42e2c952f75acd.jpg', 2),
(116, 39, 'c106a4849a3e5a61aa1ccbfddd4a31f3.jpg', 0),
(117, 39, '0a058de299b99ccd8e7b5f2928921c62.jpg', 1),
(118, 39, '4e0198690ad7edf305b504fa952f4a89.jpg', 2),
(119, 40, '6d7133f71ea7719a761720526661ef5d.jpg', 0),
(120, 40, '676c8c4b9dd14d65c9bbc5b9f89cfb4e.jpg', 1),
(121, 40, '44c762580ac794fef248098f5742331f.jpg', 2),
(122, 40, 'd0fef3c3d9d89034604f04079ca8bac7.jpg', 3),
(123, 41, '526e3dca47b491992f5d2cabae5be30f.jpg', 0),
(124, 41, '01531fab8269827c2f65b1a354b711f8.jpg', 1),
(125, 42, '332b14a0fb21a2c951cc7e62f39c6ffa.jpg', 0),
(126, 42, '697c25093f59e97cf7a8760096b7faaa.jpg', 1),
(127, 42, '48f41bbf0d4b49759d454b3253e0fa18.jpg', 2),
(128, 43, 'af9bd7079ab50c75a56e48a13b6ea88d.jpg', 0),
(129, 43, 'e0677ea756edfed53f4acc6ac295b7c9.jpg', 1),
(130, 43, '5bde76e809582bc9e8350512560e265f.jpg', 2),
(131, 44, '4080892803ab0d708dbe399b5adde121.jpg', 0),
(132, 44, 'b179d7ccc20170a913abeddec632314c.jpg', 1),
(133, 44, '3a907b7f5e7c9ac24622fe94c93c3492.jpg', 2),
(134, 44, 'd7cea347979d835b463d3ee4f8068140.jpg', 3),
(135, 45, '736c1fdfbc1294a1f4b128d286902b81.jpg', 0),
(136, 45, '0adb670857c7bd51855dd69591d1378f.jpg', 1),
(137, 45, 'e49c2ecf85ddfc2918f4781dc5dc9c49.jpg', 2),
(138, 45, '2760e7e5a703e2ec7b58127c82b52436.jpg', 3),
(139, 46, 'eb2f5ed34b014eb4728a58079af54e8b.jpg', 0),
(140, 46, 'a22514dd5852a2e35d9561edf7cfce66.jpg', 1),
(141, 47, '049a7da7d93490ce21b1775bcc120e4f.jpg', 0),
(142, 47, '116898c0aaaca192e46db33ca1c692f2.jpg', 1),
(143, 48, '12657104f115737a28b438e137091454.jpg', 0),
(144, 48, '8db1dbdc4bbdbd12559ec81eb8cf1610.jpg', 1),
(145, 48, '42c11e1355c7f682eb53b90904565d7c.jpg', 2),
(146, 49, 'ce56a61867b2ad0eb40815c1f89c2a7e.jpg', 0),
(147, 49, '63e6dc391e0bf3ada8fc9a01e5f34634.jpg', 1),
(148, 49, '894ab164af4517cdafc2924200ea8ad9.jpg', 2),
(149, 49, '2be42f34ee1138be053b7b605c482c4b.jpg', 3),
(150, 50, '7dc958c1f7f6996b908d1ed28c1810c6.jpg', 0),
(151, 50, '5aa6d49cb29b55a41dc58e933ba8c345.jpg', 1),
(152, 50, 'b009755ab2579e8cfed913ded289b3b6.jpg', 2),
(153, 51, '3e67c4f4a1590cf9b0a73c6cc1fabc44.jpg', 0),
(154, 51, '9b95b90592415c30eba452be6563933c.jpg', 1),
(155, 52, 'ff684780a07da1d313f92a55db2755ba.jpg', 0),
(156, 52, '790580e0d3c36a527ae8d39e49dbb2f9.jpg', 1),
(157, 52, '6e66ead1e19fde9e3b05fbf23b0080af.jpg', 2),
(158, 52, '1f003e610dac28f9847d5cc247f800f1.jpg', 3),
(159, 53, 'bc92d34eab65e521f6c44ec82e475ee9.jpg', 0),
(160, 53, '39de43477f68852fb03ae8142f8d61a0.jpg', 1),
(161, 53, '02e5dd32ff6ee9173854980c550e28c9.jpg', 2),
(162, 53, '81aa85355c46aeec30333f7b592c491b.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `idOrden` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `direccion` varchar(1000) NOT NULL,
  `pago` varchar(250) NOT NULL,
  `subtotal` float NOT NULL,
  `descuento` float NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idComprador` int(11) NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `pregunta` varchar(250) NOT NULL,
  `respuesta` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `resena` varchar(250) NOT NULL,
  `categoria` varchar(250) NOT NULL,
  `subcategoria` varchar(250) NOT NULL,
  `marca` varchar(250) NOT NULL,
  `modelo` varchar(250) NOT NULL,
  `color` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL,
  `oferta` int(1) NOT NULL,
  `precio` float NOT NULL,
  `por_oferta` int(11) NOT NULL,
  `precio_oferta` float NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `id_user`, `nombre`, `resena`, `categoria`, `subcategoria`, `marca`, `modelo`, `color`, `estado`, `oferta`, `precio`, `por_oferta`, `precio_oferta`, `stock`, `descripcion`) VALUES
(16, 9, 'Xiaomi Poco X3 NFC Dual SIM 128 GB shadow gray 6 GB RAM', 'El Xiaomi Poco X3 NFC posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones.', 'Celulares y Telefonía', 'Celulares y smartphones', 'Xiaomi Poco X3', 'Poco X3', 'Negro', 'Nuevo', 0, 5760, 0, 0, 40, 'Lo que tienes que saber de este producto\n\nDispositivo desbloqueado para que elijas la compañía telefónica que prefieras.\nPotente rendimiento gaming y gran capacidad de procesamiento de gráficos y funciones avanzadas.\nPantalla Full HD+ con tasa de refresco de 120 Hz que muestra 120 fotogramas por segundo.\nSistema de vibración 4D que hace los movimientos de juego más sorprendentes.\nBatería con carga rápida para que juegues 10 h y reproduzcas videos 17 h.\n4 cámaras traseras de 64 Mpx, 13 Mpx, 2 Mpx y 2 Mpx y una frontal de 20 Mpx con inteligencia artificial.\nCon carcasa antibacteriana y protector de pantalla.\n\nFotografía profesional en tu bolsillo\nDescubre infinitas posibilidades para tus fotos con las 4 cámaras principales de tu equipo. Pon a prueba tu creatividad y juega con la iluminación, diferentes planos y efectos para obtener grandes resultados.\n\nDesbloqueo facial y dactilar\nMáxima seguridad para que solo tú puedas acceder al equipo. Podrás elegir entre el sensor de huella dactilar para habilitar el teléfono en un toque, o el reconocimiento facial que permite un desbloqueo hasta un 30% más rápido.\n\nBatería superior\n¡Desenchúfate! Con la súper batería de 5160 mAh tendrás energía por mucho más tiempo para jugar, ver series o trabajar sin necesidad de recargar tu teléfono.'),
(17, 9, ' Audífonos inalámbricos Veeela E7s negro', 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos Veeela y ¡escápate de la rutina por un rato! Vas a poder disfrutar de la música que más te gusta y de tus podcasts favor', 'Celulares y Telefonía', 'Audifonos', ' Veeela', ' E7s', 'Negro', 'Nuevo', 1, 310, 26, 229.4, 300, 'Compatible con PC.\nConexión mediante Bluetooth.\nSu alcance inalámbrico es de 8m.\nSu batería dura 3 horas.\nCon micrófono incorporado.\nResistentes al agua.\nDisfrutá de un sonido superior y sin límites.\nCómodos y prácticos.'),
(18, 9, ' Funda Xiaomi Redmi Note 8/ Note 8 Pro/note 9/ Note 9pro/mi9t', 'La carcasa del teléfono móvil tiene una sensación agradable para la piel, resistencia al polvo y la suciedad, sin huellas dactilares, sin decoloración, protección completa para teléfonos móviles y pr', 'Celulares y Telefonía', 'Carcasas y fundas', ' Xiaomi', ' Varios Modelos', 'Blanco', 'Nuevo', 1, 165, 37, 103.95, 367, 'TENEMOS LAS SIGUIENTES VARIANTES\nXIAOMI REDMI Note 8\nNote 8 pro\nNote 9\nNOTE 9S /NOTE 9 PRO\nXiaomi Mi 9t / Mi9t Pro / Redmi K20 / K20 Pro\n\n\n––––? ?CóMO HACER UNA COMPRA EXITOSA? ?––––\nPara realizar la compra es necesario SELECCIONAR EL MODELO DE TU TELéFONO Y COLOR DE LA FUNDA O CASE que deseas adquirir, por medio de la cinta de opciones ARRIBA DEL BOTóN “COMPRAR” además la mayor parte de nuestros productos están disponibles bajo la modalidad de Mercado Envíos FULL ?Esto que significa?\n? Su pedido será procesado de manera automática una vez acreditada su orden, NO ES NECESARIO PREGUNTAR POR EXISTENCIAS, si está disponible en la cinta de opciones y con LA LEYENDA FULL, QUIERE DECIR QUE ESTá EN STOCK.\n? Deberá elegir el color de su preferencia en la cinta de opciones al momento de hacer su compra, ya que no será posible hacer cambios de color después de acreditada su orden (esto debido a que el proceso es automático).\n\n––––? TIPS Y SUGERENCIAS ?––––\nAsegúrate de conocer el modelo exacto de tu teléfono (Puedes confirmarlo dentro de su caja, ajustes o manuales).\nDentro de la publicación tomate tu tiempo, selecciona correctamente el modelo de la funda o case que deseas adquirir, arriba del botón de comprar se muestra los modelos y colores disponibles.\nSi buscas un modelo en particular checa nuestro perfil de vendedor seguramente tenemos uno para tu teléfono. https://listado.mercadolibre.com.mx/_CustId_614661814\nUna vez que esté seguro de querer adquirir el producto, comience el proceso de compra.\nIMPORTANTE: Asegúrate y Confirma que tus datos sean reales y correctos para evitar problemas con en el envío.\n'),
(19, 9, ' Huawei Reloj Inteligente Honor Band 5 Original Cardíacoxigen', 'Original Huawei Honor Band 5 banda de natación impermeable deportes salud Fitness Monitor de sueño Pantalla AMOLED Smartband Conocer más sobre el reloj en la descripcion.', 'Celulares y Telefonía', 'Smartwatches y smartbands', 'Huawei', 'Band 5', 'Negro', 'Nuevo', 1, 786, 21, 620.94, 576, '[Pantalla de color AMOLED]: pantalla AMOLED de 0.95 \"color verdadero, clara y más colorida; 240 * 120, 282ppi, excelente visibilidad incluso al aire libre bajo la luz solar directa; mejor pantalla UI, brinda la mejor experiencia visual al usuario.\n\n[Asistente inteligente]: notificaciones de llamadas entrantes, rechazar una llamada en banda, SMS, correo electrónico, notificaciones SNS, alertas de vibración, alarma inteligente, temporizador.\n\n[Detección de frecuencia cardíaca]: monitoreo continuo de frecuencia cardíaca en tiempo real de 24 horas; monitoreo nocturno de la frecuencia cardíaca infrarroja; advertencias de frecuencia cardíaca; Tecnología de frecuencia cardíaca HUAWEI TruSeen 3.0, una nueva generación de algoritmos dinámicos de frecuencia cardíaca de Huawei 2012 Lab, docenas de algoritmos de optimización de escenas de ejercicio, mediciones más precisas.\n\n[SpO2 Monitor2 For Everyone HONOR Band 5]: El monitor SpO2 rastrea los niveles de saturación de oxígeno en el torrente sanguíneo para que puedas evaluar cómo tu cuerpo se está adaptando durante los entrenamientos o a grandes altitudes.\n\n[Una cara de reloj para cada ocasión]: en casa, oficina o gimnasio: encontrarás caras de reloj frescas, modernas y conmutables para cada ocasión en el nuevo reloj HONOR Face Store.\n\n[Un entrenador personal en la muñeca]: Un planificador de running avanzado para seguimiento de fitness de alto nivel y recomendaciones personalizadas realiza un seguimiento exhaustivo y muestra datos como la frecuencia cardíaca, el tiempo de entrenamiento, la distancia, la frecuencia de zancada, la velocidad, las calorías y los resultados aeróbicos y anaeróbicos para un plan de entrenamiento más profundo.\n\n\n[Seguimiento de Huawei TruSleep]: registre automáticamente sus períodos de REM, sueño estable (sueño profundo), sueño inestable (sueño ligero) y despertar. Utilice la tecnología de monitoreo HUAWEI TruSleep para analizar la calidad de su sueño, el monitoreo de quedarse dormido es más del 95% de precisión. Combinando la tecnología Huawei AI, seis categorías de problemas típicos del sueño, proporcionando más de 200 sugerencias para mejorar (Funciona con la aplicación Huawei Health).\n\n[Reconocimiento del golpe de natación]: puede reconocer automáticamente los golpes de natación, registrar la velocidad de natación, la distancia, las calorías y determinar el SWOLF promedio. Resistente al agua hasta 50 metros mientras te lavas las manos, nadas o te atrapan la lluvia.\n\n[Multideporte]: modos de deporte múltiple, mejor experiencia de ejercicio; registro de frecuencia cardíaca / frecuencia cardíaca en tiempo real en la banda, las advertencias de frecuencia cardíaca reducen el riesgo de ejercicio; tiempo de carrera / distancia / velocidad / ritmo. Admite GPS conectado, distancia y datos más precisos.\n\n[Buscar teléfono inteligente]: toca la pantalla y haz clic en el brazalete para encontrar el teléfono. Dentro del rango de BT, el teléfono sonará, permitiéndole localizarlo fácilmente.\n\n[Cámara de control remoto]: tome selfie / foto con un clic; use el teléfono remoto con control remoto talkband para hacer que la fotografía sea más divertida y conveniente.\n\nParámetros:\nMicroprocesador: Apollo 3\nTamaño de pantalla: 0.95 pulgadas (21.6 mm × 10.8 mm para el área AA)\nTipo de pantalla: pantalla a color AMOLED\nResolución: 240 * 120 píxeles\nRAM: 384 KB\nROM: 1 MB\nPSRAM: 8M\nFlash: 32 MB'),
(21, 9, ' Tablet Huawei MatePad T 10 AGR-W 9.7\" 32GB deepsea blue con memoria RAM 2GB', 'Esta tablet es ideal para cada una de tus actividades: editar fotos, documentos, navegar por internet y ¡mucho más! Su diseño delgado, compacto y portátil es la combinación perfecta de rendimiento.', 'Computación', 'Tablets y accesorios', ' Huawei', ' MatePad T 10', 'Negro', 'Nuevo', 1, 3398, 10, 3058.2, 37, 'Diseñada para llevar a todas partes.\nSistema operativo: Android 10.\nCon procesador Quad-Core Cortex-A73, Quad-Core Cortex-A53 de 2GHz.\nResolución de pantalla de 1280px x 800px.\nCon lector microSD.\nCuenta con GPS.\nIncluye cargador, cable USB-c.\n\nEficiencia sin límites\nTransfiere, sincroniza y accede a tus dispositivos con este producto las veces que quieras. Sus conexiones Bluetooth y Wi-Fi, USB-C, OTG te permitirán potenciar sus funciones al máximo.\n\nGracias a su cámara principal de 5 Mpx y frontal de 2 Mpx, podrás hacer videollamadas o sacarte fotos en cualquier momento y lugar, con una excelente calidad de imagen. Nitidez, brillo y colores vibrantes harán que tus experiencias se reflejen de manera óptima.'),
(22, 9, ' Impresora a color multifunción HP Deskjet Ink Advantage 2374 100V/240V blana', ' HP está orgulloso de proveer las impresoras más seguras del mundo. Con ellas conseguirás proteger tu información, obtener lo máximo en tecnología y un rendimiento impresionante.', 'Computación', 'Impresión', ' HP', ' Deskjet Ink', 'Blanco', 'Nuevo', 1, 1223, 12, 1076.24, 46, ' Podrás imprimir, escanear y hacer copias.\nTecnología: inyección de tinta.\nConéctala mediante su entrada USB.\nVelocidad máxima de impresión en blanco y negro: 20ppm.\nPuedes cargar hasta 60 hojas.\nSoporta diversos tamaños de papel.\nIncluye accesorios.\nPráctica y funcional tanto para uso personal como profesional.\n\nHP está orgulloso de proveer las impresoras más seguras del mundo. Con ellas conseguirás proteger tu información, obtener lo máximo en tecnología y un rendimiento impresionante que con seguridad se adaptará a cualquier reto que tengas. Siempre están listas para ayudar a cumplir cualquier meta y nunca quedarse atrás en momentos inoportunos.\n\nPerfecta para tu hogar o la oficina\nAl ser a tinta te permitirá lograr impresiones de gran calidad con colores vivos y degradados suaves. Ocupa poco espacio y es fácil de manejar lo que la convierte en la opción ideal para cuestiones laborales, tareas escolares y requerimientos de la vida diaria.\n\nhp, 2374 deskjet ink advante'),
(23, 9, ' Monitor Gamer Xzeal 23.8 Xz3010 1ms 144hz Full Hd Hdmi', ' Disfruta de tus juegos favoritos con 23.8 pulgadas FULL HD con resolución de 1920 x 1080 en un panel VA con sincronización FreeSync, experimenta la rápida respuesta de 1 ms.', 'Computación', 'Monitores', 'Stylos', ' 23.8 Xz3010', 'Negro', 'Nuevo', 1, 8989, 42, 5213.62, 579, 'Modelo detallado: XZEAL XZ3010\nFrecuencia de refresco: 144 Hz\nTipo de pantalla: LED\nTipo de resolución: Full HD\nResolución de la pantalla: 1920 x 1080 pixeles\nConexiones del monitor: DisplayPort,HDMI\nEs curvo: No\nEs gamer: Sí\nTecnologías de la pantalla: VA\nCon pantalla táctil: No\n\nMONITOR GAMING XZEAL XZ3010 // XZ3015\n\nDisfruta de tus juegos favoritos con 23.8 pulgadas FULL HD con resolución de 1920 x 1080 en un panel VA con sincronización FreeSync, experimenta la rápida respuesta de 1 ms, y elige la conexión que más te guste por DisplayPort o HDMI, así como salida de audio desde tu monitor o conexión USB.\n\nESPECIFICACIONES\nTamaño: 23.8” Plano 144Hz // 23.8 \" Curvo 165Hz\nPanel: VA\nDisplay: Full HD\nTiempo de respuesta: 1 ms\nResolución: 1920 x 1080 pixeles\nColores: 16.7 millones\nInput: DisplayPort + HDMI\nPower Input: DC 12V / 3A\nPuertos: USB + Audio'),
(25, 9, 'Camara Web Webcam Fhd Microfono 1080p Usb 2mpx Audio Pc Xbox', 'Perfecta para tus clases virtuales o tu Home Office. Solo conecta y empieza a utilizarla porque no requiere un software adicional.. Compatibilidad con Zoom y Hangouts', 'Computación', 'Webcam y audio', 'Seedary', 'web-01', 'Negro', 'Nuevo', 0, 295, 0, 0, 21, 'Perfecta para tus clases virtuales o tu Home Office\n-Solo conecta y empieza a utilizarla porque no requiere un software adicional\n-Compatibilidad con Zoom y Hangouts\n-Diseño que se adapta a casi cualquier monitor o escritorio para una fácil colocación\n-No batalles más con diademas o microfonos estorbosos, incluye un microfono con supresión de ruidos\n-Ajuste de la cámara con la que siempre tendrás el mejor ángulo\n\nSí lo tuyo son los videojuegos esta opción también es para ti\n-Resolución FHD 2MPx @30FPS\n-Compatible con los softwares más populares como OBS Studio, StreamLabs, Discord etc\n-Puedes usarlo directamente desde la plataforma como Twitch, Facebook Gamming, YouTube y más\n-Si lo tuyo son las consolas, esta cámara también la puedes conectar a tu Xbox ONE y realizar tus transmisiones desde la consola\n\nEsta cámara web está equipada con 1080P @2MPx cámara de alta definición completa a 30 fps, creemos que la imagen clara, las cargas rápidas y la transmisión en vivo pueden ofrecerte la mejor experiencia para tu videoconferencia o entretenimiento social. Perfecto para streaming en redes sociales y juegos como OBS, Skype, Twitch, Youtube, Facebook, Xbox one, GoReact, entre otras\n\nLente giratoria de 360º\nA diferencia de la mayoría de los clips de cámara web que giran sólo 90°, la cámara universal con una función giratoria de 360° y la lente personal puede ayudarte a ajustar la posición más cómoda para participar en vídeo interactivo. Esta cámara web también tiene una función de enfoque manual, puede ayudarle a verse mejor en la cámara web.\n\nMicrófonos con cancelación de ruido\nMicrófonos omnidireccionales dobles integrados con cancelación de ruido que reducen eficazmente el ruido de fondo distraído para un sonido natural y claro. La cámara de sonido independiente optimiza el sonido impecable y de calidad de estudio.\n\nPlug & Play\nNo requiere software adicional y fácil de usar. No necesita controladores. Compatible con Windows 7 8 10, Mac OS 10.6 y superior. Soporta Chrome OS, Smart TV y TV BOX Android 5.0 o superior. Funciona con redes sociales y juegos como Skype, OBS, Twitch, YouTube, Facebook, Xbox One, GoReact y más.\n\nExcelente lente óptica\nLa corrección automática de luz baja proporciona vídeo realista incluso en condiciones de iluminación tenue o expuesta. La cámara web con enfoque manual ajustable le permite encontrar el ángulo de ajuste en su transmisión en vivo o videoconferencia. Asegúrate de que te veas mejor durante las videollamadas y la transmisión en vivo.\n\n'),
(26, 10, 'Control joystick inalámbrico Microsoft Xbox One Controller + Cable for Windows negro', 'Este mando combina funciones revolucionarias mientras conserva precisión, comodidad y exactitud en cada movimiento.', 'Consolas y videojuegos', 'Accesorios consolas', 'Microsoft', 'Xbox One Controller ', 'Negro', 'Nuevo', 0, 1499, 0, 0, 42, '    Diversión garantizada con tu joystick Microsoft.\n    Cuenta con Bluetooth.\n    Mando inalámbrico.\n    Diseño ergonómico.\n\nControl preciso\nEste mando combina funciones revolucionarias mientras conserva precisión, comodidad y exactitud en cada movimiento.\n\nDiseño inteligente\nGracias a su ergonomía especialmente pensada para la posición de tu mano, podrás pasar horas jugando con total confort.\n\nOtras características\n\n    Tipo de control: Gamepad\n    Es inalámbrico: Sí\n    Con detección de movimiento: No\n    Con vibración: Sí\n    Con Bluetooth: Sí\n    Con touchpad: No'),
(27, 10, 'Estabilizador De Cámara Steadycam Brazo Universal Gopro ', 'Nuestro estabilizador de cámaras nace para filmar tu vida, graba vídeos creativos de tus momentos, desde los más extraordinarios a los más cotidianos, y compártelos con facilidad', 'Cámara y accesorios', 'Accesorios para cámaras', 'TEKER', 'TEKER', 'Rojo', 'Nuevo', 1, 664, 18, 544.48, 103, 'TEKER ESTABILIZADOR UNIVERSAL PARA CÁMARA, CELULAR Y GO PRO\nNuestro estabilizador de cámaras nace para filmar tu vida, graba vídeos creativos de tus momentos, desde los más extraordinarios a los más cotidianos, y compártelos con facilidad.\nIdeal para los trabajadores profesionales de fotografía y video / todo tipo de trabajadores de medios independientes.\n\nMÁS ESTABLE SIN SACUDIDAS\nEl estabilizador es un soporte para equilibrar teléfonos inteligentes / cámaras digitales / cámaras de acción que puede suavizar la imagen y el video de manera estable sin sacudidas, incluso para una vibración intensa, también contiene múltiples modos de disparo que crean fotos más interesantes y grabacion.\n\n\nALTA COMPATIBILIDAD\nCámara Digital(peso menos que o igual a 1.5kg): hay un hilo estándar de 1/4 pulgada\n\nSerie SONY RX10 IV, SONY A7RII, SONY DSC-HX60, Canon PowerShot G1/5/7/9 X MarkII, Canon PowerShot SX620/740/720, Canon IXUS 285 HS, Canon XF10/100, Panosonic DMC-LX10, Panosonic DC-ZS70GK, etc.\n\nSmartphone(ancho máx. 85 mm): viene con un adaptador para celular\n\niPhone Xs Max/Xs/X Max/X Max/XR/8 Plus/8/7 Plus/7/6 Plus/6/5/SE, Samsung Note10/9/8/6/4/4/3, Samsung S10/S10 Plus/S9/S9 Plus/S8/S8 Plus, etc.\nCámara de Acción: incluye adaptador para GO PRO\n\nSerie GoPro Hero, serie SONY RX0, SONY X3000, YI CAM, SJCAM, etc.\n\nMANGO GIRATORIO DE 360°\n¿Desea una filmación de video especial desde un ángulo diferente?\nTEKER estabilizador siempre es compatible con su sueño. Es capaz de girar 360 °del mango panorámico, ajusta la posición de la cámara para adaptarla como prefieras y utiliza el mango giratorio sin límites a la hora de hacer las mejores fotos o grabaciones de los paisajes más atractivos, logra una perspectiva inigualable.\n\nVIENE CONTRAPESOS\nEl estabilizador de cámara está equipada con 3 * 120 contrapesos, puede lograr un mejor equilibrio y estabilidad, que se pueden sumar o restar de acuerdo con el peso del dispositivo.\n\nANTIDESLIZANTE\nEl palet principal tiene una almohadilla de silicona, que puede proteger el equipo contra daños y los mangos cubiertos de espuma son más estables\n\nESPECIFICACIÓN\nColor: Rojo\nMateriales: Aleación de aluminio y caucho\nAncho del palé principal: 5 cm\nDiámetro del mango: 3.2 cm\nPeso del artículo: 1000 g\nCapacidad de carga: 1500 g\nTamaño del paquete: 26 * 21 * 6 cm\n\nCONTENIDOS DEL PAQUETE\n1 * Soporte estabilizador\n1 * Mango universal\n1 * Soporte para celular\n1 * Adaptador para Gopro\n3 * Contrapesos(120g * 3)'),
(28, 10, 'Steelpro Minicomponente Hometeather 10,000 W - Armony - A3.1', '--- ENVÍOS A TODA LA REPÚBLICA MEXICANA Y CDMX\n--- FACTURAMOS SIN COSTO ADICIONAL SOLO EL DÍA DE LA COMPRA', 'Electrónica,audio y video', 'Minicomponentes', 'Steelpro', 'A3.1', 'Negro', 'Nuevo', 0, 2599, 0, 0, 11, '--- STEELPRO - ARMONY - A3.1 ---\n\nSystema 3.1 multifuncional y teatro en casa\nCables de bocinas con 1 metro de largo cada una\nUSB Player , SD Card.\nBLUETOOTH Integrado\nFM Tuning\nentrada Auxiliar\n10000 watts P.M.P.O.\n250 watts + 100 watts x 3. RMS\nSubwoofer 8” de alto desempeño con 3 satélites de bocina 3”\nEfectos de Iluminación Multicolor y Ecualizador preestablecido\nControl remoto incluido\nRespuesta de Frecuencia 20Hz-20,000Hz\nCrossover 80Hz-CUT/3,000Hz, 12dB crossover, 102 dB Sensibilidad\nSuspensión de Tela/Nomex\nCono de Cartón Prensado con Difusión de Medios de 90HZ-6000Hz a +6 dB y caída de 12Db x Octava\n\n--SOPORTE TÉCNICO Y ASESORÍA SIN COSTO ADICIONAL--\n\n--- ENVÍOS A TODA LA REPÚBLICA MEXICANA Y CDMX ---\n--- FACTURAMOS SIN COSTO ADICIONAL SOLO EL DÍA DE LA COMPRA ---\n\nHORARIOS DE ATENCIÓN Y ENVÍOS\n-- LUNES A VIERNES 9:00AM - 6:00PM\n-- SÁBADOS 9:00AM - 2:30PM\n\n--SOMOS LA MEJOR TIENDA EN INTERNET CON LOS MEJORES PRECIOS DEL MERCADO --'),
(29, 10, 'Samsung Galaxy A01 Core 16 GB negro 1 GB RAM', 'El Samsung A01 Core posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones. ', 'Celulares y Telefonía', 'Celulares y smartphones', 'Samsung', 'Galaxy A01', 'Azul', 'Nuevo', 0, 1829, 0, 0, 820, 'Lo que tienes que saber de este producto\n\nDispositivo desbloqueado para que elijas la compañía telefónica que prefieras.\nPantalla panorámica de 5.3\" HD+ para una experiencia inmersiva.\nDiseño llamativo y elegante con rayas en su exterior.\nCámara trasera de 8 Mpx.\nCámara delantera de 5 Mpx.\n\nPensado para ti\nEl Samsung A01 Core posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones. Entre sus diversas funcionalidades encontrarás el tema oscuro, navegación por gestos y modo sin distracciones, para que completes tus tareas mientras disfrutas al máximo tu dispositivo.\n\nMomentos únicos, capturas reales\nCaptura tus mejores momentos y revívelos cuando quieras con la cámara trasera de 8 Mpx.\n\nAdemás, el dispositivo cuenta con cámara frontal de 5 Mpx para que puedas sacarte divertidas selfies o hacer videollamadas.\n\nBatería para todo el día\nSu batería de 3000 mAh se adapta a tu ritmo de vida y te garantiza energía para toda una jornada con una sola carga.\n\nLleva lo esencial\nSi buscas un dispositivo que te permita almacenar fotos, videos y archivos indispensables, este celular con 16 GB de memoria interna es para ti.'),
(30, 10, 'Super Mario 3D All-Stars Standard Edition Físico Nintendo Switch', 'Con este juego de Mario vas a disfrutar de horas de diversión y de nuevos desafíos que te permitirán mejorar como gamer. ', 'Consolas y videojuegos', 'Juegos', 'Mario', 'Super Mario', 'Blanco', 'Nuevo', 0, 1249, 0, 0, 23, 'Clasificación E.\nAño de lanzamiento: 2020.\nCantidad máxima de jugadores: 2.\nTamaño del archivo: 4.9 GB.\nGénero: plataforma, acción\n\nFranquicia	Mario\nSaga	Super Mario\nTítulo	Super Mario 3D All-Stars\nEdición	Standard Edition\nPlataforma	Nintendo Switch\nFormato	Físico\n\nOtras características\n\n    Editoriales: Nintendo\n    Año de lanzamiento: 2020\n    Tamaño del archivo: 4.9 GB\n    Géneros: Plataforma, Acción\n    Es multijugador: Sí\n    Idiomas de subtítulos: Japonés, Inglés\n    Clasificación de juego: E\n    Cantidad máxima de jugadores: 2'),
(31, 10, 'Audífonos inalámbricos Redlemon 79329 negro', 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos Redlemon', 'Electrónica,audio y video', 'Audifonos', 'Redlemon', '79329', 'Negro', 'Nuevo', 0, 699, 0, 0, 99, 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos Redlemon y ¡escápate de la rutina por un rato! Vas a poder disfrutar de la música que más te gusta y de tus podcasts favoritos cuando quieras y donde quieras.\n\nEl formato perfecto para vos\nEl diseño over-ear brinda una comodidad insuperable gracias a sus almohadillas. Al mismo tiempo, su sonido envolvente del más alto nivel se convierte en el protagonista de la escena.\nOtras características\n\n    Formato del audífono: Over-ear\n    Es inalámbrico: Sí\n    Con Bluetooth: Sí\n    Con micrófono: Sí\n    Alcance inalámbrico: 10 m\n    Impedancia: 32 Ω\n    Respuesta en frecuencia: 20 Hz - 20 kHz\n    Sensibilidad: 102 dB\n    Duración de la batería: 10 h\n    Con cancelación de ruido: Sí\n    Tipo de conector: Jack 3.5 mm\n    Consolas de videojuegos compatibles: PC\n    Accesorios incluidos: Cable USB de carga, Cable auxiliar 3.5 mm'),
(32, 10, 'Canon EOS M50 15-45mm IS STM Kit sin espejo color negro', 'Captura momentos con tu cámara Canon y genera imágenes realmente espectaculares que podrás guardar para siempre.\n', 'Cámara y accesorios', 'Cámaras', 'Canon', 'M50 15-45mm IS STM Kit', 'Negro', 'Nuevo', 0, 13287, 0, 0, 24, 'Captura momentos con tu cámara Canon y genera imágenes realmente espectaculares que podrás guardar para siempre.\n\nFotografía en cualquier momento y lugar\nEsta cámara se adapta a tu ritmo de vida y te ofrece excelentes resultados en situaciones complejas. Ya sea que haya poca iluminación o que necesites realizar tomas de escenas rápidas, la cámara sin espejos sortea todos los obstáculos para ofrecer fotografías nítidas y vídeos en alta calidad. Su peso ligero y resultados increíbles la convertirán en tu compañera ideal.\n\nResultados deslumbrantes\nDetalles precisos y colores brillantes. Debido a la resolución de 24 MP, la calidad de tus imágenes será impresionante.\n\nFotos profesionales de noche y de día\nCon el sensor CMOS, la digitalización de las imágenes se lleva a cabo de manera interna con gran rapidez a través de transmisores más pequeños. Una gran ventaja es que el sensor es más sensible a la luz, y por lo tanto en condiciones de poca iluminación obtendrás excelentes tomas.\n\nCongela el momento\nCon la gran velocidad de obturación de tu cámara podrás congelar cualquier movimiento en milésimas de segundo, desde una gota que cae hasta un auto de fórmula 1 uno. Por el contrario, con la velocidad de obturación lenta podrás captar movimientos casi imperceptibles como las luces de la ciudad o de las estrellas en la noche. Diviértete jugando con tu cámara y obtén fotografías con gran dinamismo.\n\nDomina tu cámara y conviértete en un profesional\nCon tu cámara podrás enfocar manualmente objetos cercanos para asegurar nitidez y destacar unos sobre otros para conseguir fotos artísticas y profesionales. A su vez, con le modo autofoco podrás lograr fotografías espontáneas en cualquier momento y lugar.'),
(33, 10, 'Receptor Bluetooth Auxiliar En Caja Audio', '¿Tu auto no tiene manos libre ?\nno te preocupes !!, con el micrófono de tu receptor bluetooth contesta las llamadas que quieras ', 'Electrónica,audio y video', 'Accesorios electrónica', 'Bluetooth', 'Manos Libres', 'Negro', 'Nuevo', 0, 53, 0, 0, 1939, 'Receptor bluetooth audio\nReceptor bluetooth Auxiliar 3.5mm\nReceptor Bluetooth para auto\n\n\nConvierte todas tus bocinas en Bluetooth !\n\n¿Tu auto no tiene manos libre ?\nno te preocupes !!, con el micrófono de tu receptor bluetooth contesta las llamadas que quieras\n\nControla tu musica desde tu celular !\n\n**se puede usar mientras se carga !!'),
(34, 10, 'Consola Genérica Sup Plus roja', 'Con tu consola Sup Plus tendrás entretenimiento asegurado todos los días. Su tecnología fue creada para poner nuevos retos tanto a jugadores principiantes como expertos.', 'Consolas y videojuegos', 'Consolas', 'Genérica', 'Sup Plus', 'Rojo', 'Nuevo', 1, 249, 5, 236.55, 443, 'Es portátil, ideal para llevar a donde quieras y jugar con tus amigos y familia.\nCon 400 juegos.\nDisplay de 3\".\nCuenta con: 1 batería, 1 cable av, 1 cable cargador, 1 manual.\nHoras de diversión garantizada\n\nCon tu consola Sup Plus tendrás entretenimiento asegurado todos los días. Su tecnología fue creada para poner nuevos retos tanto a jugadores principiantes como expertos. '),
(35, 10, 'Bocinas Logitech Z607 Sistema De Altavoces 80w Negro /v /vc', 'Con una potencia de pico de 160 vatios, este sistema de altavoces 5.1 llena tu espacio con audio de alta calidad que suena increíble.', 'Electrónica,audio y video', 'Teatro casa', 'Logitech', '980-001315', 'Negro', 'Nuevo', 0, 2099, 0, 0, 6, 'Bocinas Logitech Z607 - Sistema De Altavoces 80w\n\nEL SONIDO ENVOLVENTE 5.1 OFRECE UN AUDIO POTENTE\nCon una potencia de pico de 160 vatios, este sistema de altavoces 5.1 llena tu espacio con audio de alta calidad que suena increíble. Disfruta de auténtico sonido envolvente desde cualquier fuente: televisor, teléfono, computadora, juegos 1 y más. Incluso puedes reproducir contenido de audio directamente de tarjetas SD, unidades USB o radio FM. El transductor de subwoofer de 133,35 mm produce graves que puedes sentir. Y el remoto incluido y los cables posteriores extralargos facilitan la configuración y el uso.\n\nDIMENSIONES\nSubwoofer:\nAltura x Anchura x Profundidad:\n297 mm x 193 mm x 267 mm\nPeso: 3,5 Kg\nAltavoces satélite:\nAltura x Anchura x Profundidad:\n178 mm x 110 mm x 93 mm\nPeso: 0,45 Kg\nCanal central:\nAltura x Anchura x Profundidad:\n178 mm x 110 mm x 93 mm\nPeso: 0,42 kg\nRemoto\nAltura x Anchura x Profundidad:\n86 mm x 40 mm x 7 mm\nPeso: 16,6 g\nLongitud del cable\nCable de altavoz satélite posterior a subwoofer: 6,2 m\nCable de altavoz satélite frontal a subwoofer: 2,2 m\nCable de altavoz de canal central a subwoofer: 2,2 m\nCable de alimentación del subwoofer: 1,6 m\nREQUISITOS DEL SISTEMA\nPara cualquier dispositivo dotado de Bluetooth o entradas RCA o de 3,5 mm, incluidos:\nTelevisor\nComputadora\n\nSmartphone\n\nTablet\n\nReproductor de música\n\nReproductor de DVD\n\nConsola de videojuegos1\n\nAcepta contenido de tarjetas SDHC de hasta 32 GB y unidades USB con formato FAT (consulta las ESPECIFICACIONES TÉCNICAS para más detalles)\nAptos para radio FM\nESPECIFICACIONES\nTotal de vatios reales (RMS): 160 W de pico/80 W RMS\n\nSubwoofer: 25 W RMS\n\nAltavoces satélite: 55 W RMS (total)\n\nBluetooth 4.2: 1\n\nCables RCA a RCA: 3\n\nCable de 3,5 mm a RCA: 1\n\nLector de tarjetas SD: 1\n- Admite tarjetas SDHC de hasta 32 GB\n- Admite formatos de archivos de audio: MP3, WMA, WAV, APE, FLAC\n\nPuerto USB: 1\n- Admite unidades USB de hasta 32 GB con formato FAT16 o FAT32\n- Admite formatos de archivos de audio: MP3, WMA, WAV, APE, FLAC\n\nRadio FM: sí\n\nRemoto: 1'),
(36, 10, 'Bocina JBL Charge 4 portátil con bluetooth pink', 'JBL Charge Charge 4 ofrece un sonido natural, con una gran claridad y precisión, que se dispersa uniformemente por toda la habitación. ', 'Electrónica,audio y video', 'Bocinas', 'JBL', 'Charge 4', 'Rosa', 'Nuevo', 0, 3980, 0, 0, 23, 'JBL Charge Charge 4 ofrece un sonido natural, con una gran claridad y precisión, que se dispersa uniformemente por toda la habitación. Una bocina que asegura potencia y calidad por igual en la reproducción de contenidos multimedia.\n\nApta para aire libre\nÚsala en donde quieras, está diseñada para que tengas el mejor sonido siempre, tanto en interiores como en exteriores.\n\nOtras características\n\n    Modelo detallado: JBLCHARGE4PINK\n    Potencia de salida (RMS): 30 W\n    Autonomía de la batería: 20 h\n    Cantidad de parlantes: 1\n    Formato del parlante: Caja\n    Con Bluetooth: Sí\n    Con Wi-Fi: No\n    Con base: No\n    Con luces LED: No\n    Con micrófono: No\n    Con controladores DJ integrados: No\n    Con función karaoke: No\n    Con efecto de voz: No\n    Es portátil: Sí\n    Es inalámbrico: Sí\n    Es a prueba de agua: Sí\n    Incluye soporte: No\n    Incluye batería recargable: Sí\n    Es apto para uso en exteriores: Sí\n    Incluye control remoto: No\n    Conectores de entrada: Plug\n    Respuesta mínima en frecuencia - Respuesta máxima \n en frecuencia: 60 Hz - 20 kHz\n    Ancho x Profundidad x Altura: 22 cm x 9.5 cm x 9.3 cm\n    Peso: 965 g'),
(38, 11, 'Smartwatch T500 Plus iPhone/ Android Nuevo', 'Puedes recibir llamadas entrantes, mensajes SMS y notificaciones de Facebook, Twitter y otras aplicaciones a través de tu smartwatch. Hará tu vida más fácil y más conveniente.', 'Celulares y Telefonía', 'Smartwatches y smartbands', 'OEM', 'T500 Plus', 'Rosa', 'Nuevo', 1, 799, 25, 599.25, 85, 'Puedes recibir llamadas entrantes, mensajes SMS y notificaciones de Facebook, Twitter y otras aplicaciones a través de tu smartwatch. Hará tu vida más fácil y más conveniente. Modo de trabajo Bluetooth: simplemente conecta el reloj inteligente con tu teléfono a través de Bluetooth, luego descarga e instala la aplicación (2M Wear), para que puedas leer WhatsApp, Twitter, Facebook y otros mensajes push de aplicaciones, hacer o recibir llamadas telefónicas directamente desde el reloj inteligente, ver mensajes de texto, etc. Reloj inteligente multifuncional. Soporte para hacer y responder llamadas, verificar mensajes, podómetro, recordatorio de sedentarismo, monitoreo de sueño, recordatorio de mensajes (de texto, mensaje (de texto, teléfono y otras notificaciones de mensajes), Controladores de cámara, reproductores de música y mucho más. Reloj inteligente, vida inteligente. Monitor de sueño y podómetro: puede contar tus pasos, mide la distancia recorrida y estimar las calorías quemadas a través de un acelerómetro de 3 ejes. Seguir la calidad de tu sueño, y te ayudará a desarrollar mejores hábitos de vida. Monitoriza la calidad del sueño y registra los datos del estado del sueño. Deja que te ayude a disfrutar de una vida más saludable. Batería de larga duración y garantía: batería de litio de 400 mAh soporta 24 horas de uso medio.\n\nIdiomas: Español\nSistemas operativos compatibles: iOS 8.0 o superior,Android 4.4 o superior\nFunciones: Frecuencia cardiaca,Modo deportes,Recordatorio de llamadas,Control de música,Calculadora,Calendario,Alarma,Agenda,Registro llamadas\nMemoria interna: 32 MB\nMemoria RAM: 32 MB\nEs resistente al agua: No\nCon Wi-Fi: Sí\nCon GPS: Sí\nCon Bluetooth: Sí\nCon USB: Sí'),
(39, 11, 'Huawei Matebook D 14 R7, Amd Ryzen 7,512 Gb + 8 Gb Ram', 'HUAWEI MateBook D 14 R7 es un pórtatil delgado y liviano con colaboración multipantalla y características que la vuelven única.', 'Computación', 'Laptos', 'Huawei', ' Matebook D 14', 'Negro', 'Nuevo', 1, 19999, 10, 17999.1, 96, 'HUAWEI MateBook D 14 R7 es un pórtatil delgado y liviano con colaboración multipantalla y características que la vuelven única. Su pantalla IPS de 14 pulgadas con resolución de 1920 × 1080 píxeles será tu compañera perfecta. Es compatible con Huawei Share OneHop y Multi-Screen Collaboration.\n-Windows 10 Home Edition\n-Procesador AMD Ryzen 7 3700U y GPU Radeon RX Vega 8 Graphics\n-Tamaño de pantalla: IPS de 14 pulgadas y brillo de 250 nits\n-Resolución: 1920 × 1080 píxeles\n-Capacidad de la batería: 56Wh\n-8 GB de RAM + 512 GB de ROM\nCaracterísticas:\nVe más viveza, hermosa en todos los sentidos\nHUAWEI MateBook D 14 está equipada con una notable pantalla IPS de 1,920 x 1,080 cuyos biseles se han reducido a solo 4.8 mm, lo que hace que la pantalla FullView de 14 pulgadas parezca casi interminable.\n\n'),
(40, 11, 'Laptop Lenovo Idealpad 1 14 Pulgadas 64gb Emmc 4gb Ram', 'Ejecuta el último sistema operativo de Windows\nIncluye Windows 10 Home en modo S, para hacer las cosas que desea con protección en la que puede confiar y rendimiento duradero.', 'Computación', 'Laptos', 'Lenovo', '81VS0001US', 'Negro', 'Nuevo', 0, 9999, 0, 0, 15, 'Ejecuta el último sistema operativo de Windows\nIncluye Windows 10 Home en modo S, para hacer las cosas que desea con protección en la que puede confiar y rendimiento duradero.\n\nPantalla de 14 \"\nResolución HD típica de 1366 x 768. Retroiluminación LED de bajo consumo.\n\nProcesador acelerado AMD A6-9220e\nProcesamiento de doble núcleo. La APU AMD A6 maneja los gráficos AMD Radeon junto con el procesador central para equilibrar la carga, lo que permite un gran rendimiento, multitarea rápida y entretenimiento envolvente.\n\nMemoria del sistema de 4GB para multitarea básica\nRAM de gran ancho de banda adecuada para ejecutar sin problemas múltiples aplicaciones y pestañas del navegador a la vez.\n\nMemoria flash eMMC de 64 GB\nEste sistema de memoria ultracompacto es ideal para dispositivos y aplicaciones móviles, ya que brinda capacidades de almacenamiento mejoradas, administración de datos optimizada, tiempos de arranque rápidos y soporte para reproducción de video de alta definición.\n\nAMD Radeon R4\nEl chipset de gráficos integrado con memoria de video compartida proporciona una calidad de imagen sólida para uso en Internet, películas, edición básica de fotografías y juegos casuales.\n\nPesa 3.09 libras. y mide 0.78 \"de grosor\nUltradelgado y ultraligero para una máxima portabilidad, con un tamaño de pantalla más pequeño y omitiendo la unidad de DVD / CD para lograr el factor de forma compacto.\n\nBatería de iones de litio.\nLa salida HDMI amplía sus opciones de visualización. Conéctese a un HDTV o monitor de alta definición para configurar dos pantallas una al lado de la otra o simplemente ver más del panorama general. Lector de medios integrado para una transferencia de fotos sencilla\nAdmite formatos de tarjeta de memoria microSD.\n\nConectividad inalámbrica de CA\nConéctese a un enrutador Wireless-AC para casi 3 veces la velocidad, más capacidad y una cobertura más amplia que Wireless-N. Compatible con versiones anteriores con todas las demás redes Wi-Fi y puntos de acceso.\n\nPaquete de software básico incluido\nSuscripción de 12 meses a Microsoft Microsoft 365 Personal .\n\n---------------------------------------------------------\n\nESPECIFICACIONES\n\n• Teclado iluminado: No\n• Tamaño de pantalla: 14 pulgadas\n• Resolución de la pantalla: 1366 x 768 (HD)\n• Pantalla táctil: No\n• Tipo de almacenamiento: eMMC\n• Capacidad total de almacenamiento: 64 GB\n• Memoria del sistema (RAM) 4 gigabytes\n• Gráficos: AMD Radeon R4\n• Velocidad del procesador (base): 1,6 gigahercios\n• Modelo de procesador: AMD A6 A6-9220e\n• Sistema operativo: Windows 10 Home en modo S\n• Duración de la batería: 8 horas\n• Tipo de Batería: Iones de litio\n• Toma de auriculares: si\n• Número de puertos USB (total): 2\n• Número de puertos USB 3.0 tipo A: 2\n• Número de salidas HDMI (total): 1\n• Altura del producto: 0,78 pulgadas\n• Ancho del producto: 12,9 pulgadas\n• Profundidad del producto: 9.3 pulgadas\n• Peso del Producto: 3,09 libras\n• Tipo de altavoz: Altavoces estéreo'),
(41, 11, 'Impresora a color multifunción Epson EcoTank L3150 con wifi 110V negra', 'Epson se compromete a que obtengas el máximo provecho de sus productos. Te brinda soluciones de impresión con una amplia gama de dispositivos.', 'Computación', 'Impresión', 'Epson', 'Epson', 'Negro', 'Nuevo', 0, 5299, 0, 0, 15, 'Epson se compromete a que obtengas el máximo provecho de sus productos. Te brinda soluciones de impresión con una amplia gama de dispositivos que cubren todos los usos y necesidades, del hogar y del trabajo.\n\nPerfecta para tu hogar o la oficina\nAl ser a tinta te permitirá lograr impresiones de gran calidad con colores vivos y degradados suaves. Ocupa poco espacio y es fácil de manejar lo que la convierte en la opción ideal para cuestiones laborales, tareas escolares y requerimientos de la vida diaria.\n\nConectividad móvil\nAhora puedes imprimir fácilmente desde tu celular o tablet sin importar en donde te encuentres y sin la asistencia de una computadora. Disfruta de sus soluciones de impresión móvil, utiliza la que más te guste y ten tus documentos en solo segundos.\nPodrás imprimir, escanear y hacer copias.\nTecnología: inyección de tinta.\nConéctala mediante su entrada USB.\nVelocidad máxima de impresión en blanco y negro: 33ppm.\nPuedes cargar hasta 100 hojas.\nSoporta diversos tamaños de papel.\nIncluye accesorios.\nPráctica y funcional tanto para uso personal como profesional.'),
(42, 12, 'Huawei Y9 Prime 2019 Dual SIM 128 GB verde esmeralda 4 GB RAM', 'El Huawei Y9 Prime 2019 Dual SIM cuenta con el sistema operativo avanzado Android 9.0 Pie que aprende tus hábitos para adaptarse a tu rutina y lograr la máxima eficiencia de tu equipo.', 'Celulares y Telefonía', 'Celulares y smartphones', 'Huawei', 'Y9 Prime', 'Azul', 'Nuevo', 0, 4899, 0, 0, 40, 'Inteligente y predictivo\nEl Huawei Y9 Prime 2019 Dual SIM cuenta con el sistema operativo avanzado Android 9.0 Pie que aprende tus hábitos para adaptarse a tu rutina y lograr la máxima eficiencia de tu equipo. Esta tecnología vuelve a tu dispositivo tan autónomo que podrá reducir el consumo energético, ajustar automáticamente el brillo y gestionar la batería de manera inteligente.\n\nFotografía profesional en tu bolsillo\nDescubre infinitas posibilidades para tus fotos con las 3 cámaras principales de tu equipo. Pon a prueba tu creatividad y juega con la iluminación, diferentes planos y efectos para obtener grandes resultados.\n\nAdemás, el dispositivo cuenta con cámara frontal de 16 Mpx para que puedas sacarte divertidas selfies o hacer videollamadas.\n\nDesbloqueo facial y dactilar\nMáxima seguridad para que solo tú puedas acceder al equipo. Podrás elegir entre el sensor de huella dactilar para habilitar el teléfono en un toque, o el reconocimiento facial que permite un desbloqueo hasta un 30% más rápido.\n\nBatería superior\n¡Desenchúfate! Con la súper batería de 4000 mAh tendrás energía por mucho más tiempo para jugar, ver series o trabajar sin necesidad de recargar tu teléfono.\n\nLo que tienes que saber de este producto\n\nDispositivo desbloqueado para que elijas la compañía telefónica que prefieras.\nDiseñado con una textura de seda que brilla bajo la luz.\nPantalla Ultra FullView sin marco que proporciona una visión inmersiva.\nCámara frontal oculta de 16 Mpx, con inteligencia artificial, que se despliega y retrae automáticamente.\nCámara principal de 16 Mpx, ultra gran angular de 8 Mpx y lente de profundidad de 2 Mpx.\nIncluye auriculares, funda y película protectora.'),
(43, 12, 'ZTE Blade L8 Dual SIM 16 GB negro 1 GB RAM', 'El ZTE L8 cuenta con el sistema operativo avanzado Android 9.0 Pie que aprende tus hábitos para adaptarse a tu rutina y lograr la máxima eficiencia de tu equipo.', 'Celulares y Telefonía', 'Celulares y smartphones', 'ZTE', 'Blade L8', 'Negro', 'Nuevo', 0, 1434, 0, 0, 15, 'Inteligente y predictivo\nEl ZTE L8 cuenta con el sistema operativo avanzado Android 9.0 Pie que aprende tus hábitos para adaptarse a tu rutina y lograr la máxima eficiencia de tu equipo. Esta tecnología vuelve a tu dispositivo tan autónomo que podrá reducir el consumo energético, ajustar automáticamente el brillo y gestionar la batería de manera inteligente.\n\nMomentos únicos, capturas reales\nCaptura tus mejores momentos y revívelos cuando quieras con la cámara trasera de 8 Mpx.\n\nAdemás, el dispositivo cuenta con cámara frontal de 5 Mpx para que puedas sacarte divertidas selfies o hacer videollamadas.\n\nMás para ver\nCon su pantalla TFT de 5 \", disfruta de colores intensos y mayor nitidez en todos tus contenidos.\n\nBatería para todo el día\nSu batería de 2000 mAh se adapta a tu ritmo de vida y te garantiza energía para toda una jornada con una sola carga.\n\nLleva lo esencial\nSi buscas un dispositivo que te permita almacenar fotos, videos y archivos indispensables, este celular con 16 GB de memoria interna es para ti.\n\nDispositivo desbloqueado para que elijas la compañía telefónica que prefieras.\nPantalla TFT de 5 \".\nCámara trasera de 8Mpx.\nCámara delantera de 5Mpx.\nProcesador Spreadtrum SC7731E Quad-Core de 1.3GHz con 1GB de RAM.\nBatería de 2000mAh.\nMemoria interna de 16GB. Apto para tarjeta SD de 128GB.'),
(44, 12, 'Moto E7 Plus Dual SIM 64 GB azul mystic 4 GB RAM', 'El Motorola E7 Plus Dual SIM posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones.', 'Celulares y Telefonía', 'Celulares y smartphones', 'MOTO', 'E7 Plus', 'Azul', 'Nuevo', 0, 3439, 0, 0, 150, 'Pensado para ti\nEl Motorola E7 Plus Dual SIM posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones. Entre sus diversas funcionalidades encontrarás el tema oscuro, navegación por gestos y modo sin distracciones, para que completes tus tareas mientras disfrutas al máximo tu dispositivo.\n\nDoble cámara y más detalles\nSus 2 cámaras traseras de 48 Mpx/2 Mpx te permitirán tomar imágenes con más detalles y lograr efectos únicos como el famoso modo retrato de poca profundidad de campo.\n\nAdemás, el dispositivo cuenta con cámara frontal de 8 Mpx para que puedas sacarte divertidas selfies o hacer videollamadas.\n\nMás para ver\nCon su pantalla IPS de 6.5 \", disfruta de colores intensos y mayor nitidez en todos tus contenidos.\n\nDesbloqueo facial y dactilar\nMáxima seguridad para que solo tú puedas acceder al equipo. Podrás elegir entre el sensor de huella dactilar para habilitar el teléfono en un toque, o el reconocimiento facial que permite un desbloqueo hasta un 30% más rápido.\n\nBatería de duración superior\n¡Desenchúfate! Con la súper batería de 5000 mAh tendrás energía por mucho más tiempo para jugar, ver series o trabajar sin necesidad de realizar recargas.\n\nGran capacidad de almacenamiento\nCon su memoria interna de 64 GB siempre tendrás espacio para almacenar archivos y documentos importantes. Además, podrás guardar películas, series y videos para reproducirlos cuando quieras sin conexión.\n\nLo que tienes que saber de este producto\n\nDispositivo desbloqueado para que elijas la compañía telefónica que prefieras.\nPantalla IPS de 6.5 \".\nTiene 2 cámaras traseras de 48Mpx/2Mpx.\nCámara delantera de 8Mpx.\nProcesador Snapdragon 460 Octa-Core de 1.8GHz con 4GB de RAM.\nBatería de 5000mAh.\nMemoria interna de 64GB. Apto para tarjeta SD de 512GB.\nResistente a las salpicaduras.\nCon reconocimiento facial y sensor de huella dactilar.'),
(45, 12, 'Samsung Galaxy A21s 64 GB negro 4 GB RAM', 'El Samsung A21s posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones. ', 'Celulares y Telefonía', 'Celulares y smartphones', 'Samsung', 'Galaxy A21s', 'Negro', 'Nuevo', 0, 440, 0, 0, 7, 'Pensado para ti\nEl Samsung A21s posee el novedoso sistema operativo Android 10 que incorpora respuestas inteligentes y acciones sugeridas para todas tus aplicaciones. Entre sus diversas funcionalidades encontrarás el tema oscuro, navegación por gestos y modo sin distracciones, para que completes tus tareas mientras disfrutas al máximo tu dispositivo.\n\nFotografía profesional en tu bolsillo\nDescubre infinitas posibilidades para tus fotos con las 4 cámaras principales de tu equipo. Pon a prueba tu creatividad y juega con la iluminación, diferentes planos y efectos para obtener grandes resultados.\n\nDesbloqueo facial y dactilar\nMáxima seguridad para que solo tú puedas acceder al equipo. Podrás elegir entre el sensor de huella dactilar para habilitar el teléfono en un toque, o el reconocimiento facial que permite un desbloqueo hasta un 30% más rápido.\n\nBatería de duración superior\n¡Desenchúfate! Con la súper batería de 5000 mAh tendrás energía por mucho más tiempo para jugar, ver series o trabajar sin necesidad de realizar recargas.\n\nLo que tienes que saber de este producto\n\nDispositivo desbloqueado para que elijas la compañía telefónica que prefieras.\nPantalla PLS de 6.5 \".\nTiene 4 cámaras traseras de 48Mpx/8Mpx/2Mpx/2Mpx.\nCámara delantera de 13Mpx.\nProcesador Exynos 850 Octa-Core de 2GHz con 4GB de RAM.\nBatería de 5000mAh.\nMemoria interna de 64GB. Apto para tarjeta SD de 512GB.\nCon reconocimiento facial y sensor de huella dactilar.'),
(46, 12, 'Audífonos inalámbricos i12 TWS rosa', 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos i12 TWS y ¡escápate de la rutina por un rato! ', 'Celulares y Telefonía', 'Audifonos', 'Genérica', 'i12 TWS', 'Rosa', 'Nuevo', 1, 140, 18, 114.8, 1278, 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos i12 TWS y ¡escápate de la rutina por un rato! Vas a poder disfrutar de la música que más te gusta y de tus podcasts favoritos cuando quieras y donde quieras.\n\nEl formato perfecto para vos\nAl ser in-ear aíslan el ruido del exterior, mejoran la calidad del audio y son de tamaño pequeño para poder insertarse en tu oreja. Son ideales para acompañarte a la hora de hacer ejercicio mientras te sumergís en el mejor sonido envolvente.\n\nConexión mediante Bluetooth.\nSu alcance inalámbrico es de 10m.\nSu batería dura 4 horas.\nCon micrófono incorporado.\nDisfrutá de un sonido superior y sin límites.\nCómodos y prácticos.'),
(47, 12, 'Audífonos inalámbricos i12 TWS negro', 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos i12 TWS y ¡escápate de la rutina por un rato!', 'Celulares y Telefonía', 'Audifonos', 'Genérica', 'i12 TWS', 'Negro', 'Nuevo', 0, 124, 0, 0, 502, 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos i12 TWS y ¡escápate de la rutina por un rato! Vas a poder disfrutar de la música que más te gusta y de tus podcasts favoritos cuando quieras y donde quieras.\n\nEl formato perfecto para vos\nAl ser in-ear aíslan el ruido del exterior, mejoran la calidad del audio y son de tamaño pequeño para poder insertarse en tu oreja. Son ideales para acompañarte a la hora de hacer ejercicio mientras te sumergís en el mejor sonido envolvente.\n\nConexión mediante Bluetooth.\nSu alcance inalámbrico es de 10m.\nSu batería dura 4 horas.\nCon micrófono incorporado.\nDisfrutá de un sonido superior y sin límites.\nCómodos y prácticos.'),
(48, 12, 'Audífonos Apple EarPods with Lightning Connector blanco', 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos Apple y ¡escápate de la rutina por un rato! ', 'Celulares y Telefonía', 'Audifonos', 'Apple', 'EarPods with Lightning Connector', 'Blanco', 'Nuevo', 0, 295, 0, 0, 26, 'En la calle, en el colectivo o en la oficina, ten siempre a mano tus audífonos Apple y ¡escápate de la rutina por un rato! Vas a poder disfrutar de la música que más te gusta y de tus podcasts favoritos cuando quieras y donde quieras.\n\nEl formato perfecto para vos\nAl ser in-ear aíslan el ruido del exterior, mejoran la calidad del audio y son de tamaño pequeño para poder insertarse en tu oreja. Son ideales para acompañarte a la hora de hacer ejercicio mientras te sumergís en el mejor sonido envolvente.\n\nCon micrófono incorporado.\nResistentes al agua.\nDisfrutá de un sonido superior y sin límites.\nCómodos y prácticos.');
INSERT INTO `productos` (`id`, `id_user`, `nombre`, `resena`, `categoria`, `subcategoria`, `marca`, `modelo`, `color`, `estado`, `oferta`, `precio`, `por_oferta`, `precio_oferta`, `stock`, `descripcion`) VALUES
(49, 12, 'Funda Premium, Uso Rudo, Mate/transparente. Modelos iPhone', 'Funda premium\nCortes perfectos para entradas y salidas de puertos.\nAgradable al tacto\nProtege tu móvil a la perfección\nUso Rudo\nContra caídas y golpes\nCubre completamente las cámaras.', 'Celulares y Telefonía', 'Carcasas y fundas', 'Genérica', 'MATE', 'Negro', 'Nuevo', 0, 99, 0, 0, 661, 'Funda premium\nCortes perfectos para entradas y salidas de puertos.\nAgradable al tacto\nProtege tu móvil a la perfección\nUso Rudo\nContra caídas y golpes\nCubre completamente las cámaras.'),
(50, 12, 'Funda + Protector De Pantalla De Vidrio Templado P/samsung', 'Diseño y silicona con textura que ofrece un dispositivo de agarre más mejorada y la sensación táctil, delgado todavía robusto diseño permite una protección óptima', 'Celulares y Telefonía', 'Carcasas y fundas', 'TuYue', 'Varios modelos', 'Rojo', 'Nuevo', 0, 269, 0, 0, 1061, 'For galaxy Note 20/Note 20 Ultra/S20/S20 Ultra/S20 Plus/Note 10/Note 10 plus/S10E/S10/S10 Plus/S21/S21 Plus/S21 Ultra,El paquete incluye: 1 piezas funda case + 1 protector de pantalla de hidrogel que es una cobertura total y puede leer muy bien las huellas dactilares\n\nPara otros modelos,El paquete incluye: 1 piezas funda case + 1 de protector de pantalla templado .\n\nCaso de doble capa consiste en una capa interna de TPU flexible para proteger contra golpes y caídas, y un PC capa externa sólida, dura para el refuerzo y definición. duradera y protectora.\n\nDiseño y silicona con textura que ofrece un dispositivo de agarre más mejorada y la sensación táctil, delgado todavía robusto diseño permite una protección óptima, mejor agarre y una cobertura completa del dispositivo.\n\nEl pleno acceso a todos los botones, puertos, altavoces, cámara y otras características y controles.\n\nAnillo giratorio reforzado 360 grados al que se puede agarrar cuando se toma una autofoto y puede funcionar con el soporte magnético para automóvil.\n\nPráctico soporte para una experiencia de visualización con manos libres.'),
(51, 12, 'Funda 360 iPhone 6, 6 Plus, 7, 7 Plus, 8, 8 Plus X + Cristal', 'Funda 360º de policarbonato cubre la superficie del equipo al 100% protegiéndolo de golpes leves y rayaduras.', 'Celulares y Telefonía', 'Carcasas y fundas', '360', '360°', 'Rojo', 'Nuevo', 0, 209, 0, 0, 200, 'Funda 360º de policarbonato cubre la superficie del equipo al 100% protegiéndolo de golpes leves y rayaduras.\n\n- Incluye GRATIS mica de cristal templado con dureza 9H para evitar cualquier tipo de daño a tu pantalla.\n\nDiseño ultra delgado\nLigero\nCómodo\nElegante\n\n- Modelos Disponibles\niPhone 6/6s\niPhone 6 Plus/6s Plus\niPhone 7\niPhone 7 Plus\niPhone 8\niPhone 8 Plus\niPhone Xr\niPhone Xs Max\niPhone 11\n\n- Colores Disponibles\nNegro\nRojo'),
(52, 12, 'Huawei Smartwatch Gt 2 Gps 3d Glass Screen Bluetooth', 'El Huawei Watch GT 2 46mm cuenta con una pantalla AMOLED con cristal 3D con diagonal de 1.39 pulgadas y resolución de 454 x 454 píxeles.', 'Celulares y Telefonía', 'Smartwatches y smartbands', 'Huawei', 'GT 2 Negro', 'Negro', 'Nuevo', 1, 4999, 34, 3299.34, 612, 'Su procesador Kirin A1, es un chip que integra una unidad de procesamiento avanzado de Bluetooth y una unidad de gestión energética, pensado para su bajo consumo energético de hasta 10uA/MHz. Esto da un resultado de dos semanas de autonomía, con las notificaciones y el registro de ritmo cardiaco activados, y 30 horas en modo GPS.\n\n•También es compatible con un total de 15 deportes, ocho de exteriores y siete de interiores. Entre todos esos deportes se incluyen correr, andar, trail, ciclismo, natación, triatlón, escalada, elíptica.\n\nEn el apartado de la salud, el Watch GT 2 incluye la monitorización del sueño y es capaz de detectar arritmias cardiacas. Si percibe una posible alteración (por encima de las 100 pulsaciones por segundo o por debajo de las 50 en reposo durante más de 10 minutos), emite una notificación. Compatible con las App Huawei Sports y Health app.\n\n•Puede sumergirse hasta 50 metros de profundidad e incluye los sensores barómetro, brújula y una función para encontrar nuestro teléfono en caso de que lo hayamos perdido.\nEl nuevo Watch GT 2 Por si fuera poco soporta llamadas por Bluetooth hasta 150 metros de alcance y permite escuchar música.\n\n\nPantalla: 1.39 pulgadas\nResolución: 454 x 454 píxeles\nCompatibilidad: Android 4.4 o posterior, iOS 9.0 o posterior\nProcesador: Kirin A1 10uA/MHz\nSensores: Acelerómetro, giroscopio, geomagnético, óptico de frecuencia cardíaca, luz ambiental, sensor de presión de aire, sensor capacitivo.\nCompatibilidad: Smartphones con Android 4.4 o superior, o iOS 9.0 o posterior\n'),
(53, 12, 'Samsung Galaxy Watch Active Negro', 'Conoce a la nueva generación del mundo de Galaxy Watch. Logra y mide tus objetivos fitness con este smartwatch Samsung Galaxy Watch Active.', 'Celulares y Telefonía', 'Smartwatches y smartbands', 'Samsung', 'Active', 'Negro', 'Nuevo', 1, 3799, 7, 3533.07, 1552, 'Conoce a la nueva generación del mundo de Galaxy Watch. Logra y mide tus objetivos fitness con este smartwatch Samsung Galaxy Watch Active. Con un seguimiento avanzado de ejercicios, te ayuda a optimizar tus entrenamientos y monitorea el progreso mediante la adaptación de hasta 40 ejercicios. Monitorea tu corazón y envía alertas en tiempo real en caso de una actividad irregular. Aún en movimiento no pierdas el estilo.\n\nOtras características\n\nSistemas operativos compatibles: Android\nFunciones: Cronómetro\nMemoria interna: 4 GB\nMemoria RAM: 0.75 GB\nProfundidad máxima de resistencia al agua: 50 m\nEs resistente al agua: Sí\nCon Wi-Fi: Sí\nCon GPS: Sí\nCon Bluetooth: Sí\nNombres de los sistemas operativos: Tizen 4.0\nSensores: Acelerómetro,Barómetro,Giroscopio,Sensor de luz ambiente,Sensor óptico de frecuencia cardíaca PPG');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `apellidos` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `cp` varchar(250) NOT NULL,
  `estado` varchar(250) NOT NULL,
  `ciudad` varchar(250) NOT NULL,
  `municipio` varchar(250) NOT NULL,
  `colonia` varchar(250) NOT NULL,
  `calle` varchar(250) NOT NULL,
  `puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `cp`, `estado`, `ciudad`, `municipio`, `colonia`, `calle`, `puntos`) VALUES
(9, 'Jesus Raymundo', 'Hernández Zapata', 'jesusraymundi@gmail.com', '123456789', '86150', 'Tabasco', 'Villahermosa', 'Centro', 'Tamulte de las Barrancas', 'Melchor Ocampo 805 int 3', 174),
(10, 'Wendy Janet', 'Cahuich Garcia', 'wendy10@gmail.com', 'qwerty', '86126', 'Tabasco', 'Villahermosa', 'Centro', 'Carlos A Madrazo', 'Cd Macuilis SN km 3+600', 150),
(11, 'Rodrigo', 'Sanchez Izquierdo', 'rodrigoizquierdo@hotmail.com', 'ñlkjh', '86150', 'Tabasco', 'Villahermosa', 'Centro', 'Santa Karla II', 'Manzana 35 Lote 45', 200),
(12, 'Maria del Carmen', 'Zapata Caliz', 'maria_caliz@hotmail.com', 'zxcvbn', '01030', 'Ciudad de México', 'Ciudad de México', 'Álvaro Obregón', 'Florida', 'Ciudad de México, CDMX Axotla', 305);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagenes`
--
ALTER TABLE `imagenes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `imagenes`
--
ALTER TABLE `imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
