-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2024 at 10:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `remote_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_confirm_pass` varchar(100) NOT NULL,
  `user_verifycode` int(11) NOT NULL,
  `user_approve` tinyint(4) NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_email`, `user_password`, `user_confirm_pass`, `user_verifycode`, `user_approve`, `create_time`) VALUES
(1, 'test', 'test@gmail.com', 'lkjsdsd', 'lkjsdsd', 0, 0, '2024-12-13 20:34:25'),
(7, 'ahmed', 'kali@test.com', '$2y$10$6d4/tcZPv/rv7plLh.RiB.8TAJPbb301xKuKmO3Mkqigfcfd.jrZ2', '$2y$10$HcW34yfYoZCHTeDIfAPOWeN2Wski0Jr1aeA0WkypWEdw3Et6f4sFy', 0, 0, '2024-12-14 13:54:26'),
(8, 'ahmed', 'kalii@test.com', '$2y$10$Up6lp2AsnJH1gJcmoZNCFuSl0z2GgFo0NpgFRU67H1tRYg0EfiDcm', '$2y$10$BL7Vp9g6pzRNv2TLilHuaueQAtsNA7yTHU4UByUDXSCGajThAXLyS', 0, 0, '2024-12-14 15:30:32'),
(9, '', '', '$2y$10$iu3aXOQjAEYaMbPESWhQ/uPTeSiVW8S2svd5BJlbqq7xJ4UmwYGHi', '$2y$10$TH.cbq41niCz37J37vqu7OrSjbAMdc8O8bczMH687.ozdnDzsSwP6', 0, 0, '2024-12-15 18:43:32'),
(10, 'http://192.168.1.28/Remote_app/auth/register.php', 'http://192.168.1.28/Remote_app/auth/register.php', '$2y$10$5qiBws9uhr1WPSLv4lqvq.nvw5URDp.rM7y.s2QtpjZ1MrLDZaYT6', '$2y$10$PxF.YPtd49hCeWjVkQxbkepiVtzkCTzQvSwVjPTfG3EUTCTIusMzi', 0, 0, '2024-12-15 18:43:57'),
(11, 'http://192.168.1.28/Remote_app/auth/register.php', 'http://192.168.1.28/Remote_app/auth/register.php', '$2y$10$W38KhWa6aJuNUGYcHDddK.Mu8dFSFmb.F20hnkDyKR3KvjXXaRs3C', '$2y$10$h4nbbQXpFYlT392n7ecmMOs9RqGTIrD9Xu81mTmaZAzhnoa8ruYt.', 0, 0, '2024-12-15 18:43:58'),
(12, 'test', 'test', '$2y$10$cQyrKy9AIEh2B1lL/ZQ.TuO2b4f5TYJEUX.MmPoaKVB2htoDTv7Fa', '$2y$10$omR4UQZJOdVglPhbV7GDpuSNThTcDM8J8sc6rZBRoQ6oOsTeejxFO', 0, 0, '2024-12-15 18:44:21'),
(13, 'dsf', 'sdfsf', '$2y$10$70LqnNZbAPN4ulyIqpoVJuZNyPqPCUUAPisw6OIkazFolFuS06DTa', '$2y$10$K8D5wfTyFDVt4.yRDc1r6egyr/fUF.JCqKwLwhb6fhTRuGoI5Kbcq', 0, 0, '2024-12-15 18:45:29'),
(14, 'test', 'testrttt', '$2y$10$ZsNP.bEktOTh8ww32xpuj.FtCEDXHNQIxp7JsByKtuEL920xmlRqa', '$2y$10$Y7YOL8s30VX1yCI.oEgmC.KJQZh/GnWHGXN26LQYioLtR4gZ4qNCC', 0, 0, '2024-12-15 19:08:16'),
(15, 'test', 'testrttt', '$2y$10$r1c2qFZLPyRIBtgBJdu2neRVi8wvJBg5a6igaYxcG.Gq5VE/VeK22', '$2y$10$8R61AqL3eMUyUwE5RyXqGukmDqegx1cwxVvVNi5p73YkHOqDMZgZG', 0, 0, '2024-12-15 19:08:18'),
(16, 'test', 'test@test.com', '$2y$10$whbxJYRrNaF9GoQww/X5ieF5SIpx0VfGGH1h1wVFqPRyNjle0Woau', '$2y$10$BIftPvkPCKpkVNvImEmGX.Lcjpo0x7HljgQh0Iz1gcenW/WMl6LeO', 0, 0, '2024-12-17 11:14:01'),
(17, 'test', 'test@test.com', '$2y$10$vR6HzJDkD8F8aHXqS3Stxuw2GNdNLefYG.cS5SOIb6ktsrIHcVjGO', '$2y$10$oWSsjqPOXo9vITokXOK1j.7J84iSGzzSq.uyyEqHXAQuhGFmXha5K', 0, 0, '2024-12-17 11:14:02'),
(18, 'test', 'test@test.com', '$2y$10$/AaMTiXCeOL.UWPYCOVVh.iLCSvHuY3xGqEogsxSud27au2EWidmC', '$2y$10$6WbPKU86AIda22PQpBYpy.3xw/vPo3xszNnO3huP3OK9WPHkj3DyS', 0, 0, '2024-12-17 11:14:03'),
(19, 'user', 'user@user.com', '$2y$10$r0PTurBw2ZH6qtbsNEWB6exz9b.VjCNb/RNrrSOdTaf5NO.bv0mQe', '$2y$10$UbZyf7WQX/pz5VYPwRGhguAWf7iEtEtbiqMq9n61pCcGM8vy7OiQG', 73175, 0, '2024-12-17 11:27:04'),
(20, 'user', 'user@user.com', '$2y$10$GBDkHyf2lKvE5eKJDwMJ6.nPKGlsmES0ducJhg8kF3R42vZF2Dyw6', '$2y$10$0Reckxw3cc94BX3eXUaxmuCd8oKXePqxVFv4GOwtgk0lWpVSNlOda', 61430, 0, '2024-12-17 11:27:05'),
(21, 'user', 'user@user.com', '$2y$10$HwWUd2hdAEYJRjzblRwRReamLKQP0ix07f5cZkjbwdoDFG5d1Zkue', '$2y$10$0Pqg92qRxLRDjk0XwMx6luOIZpnKrXOYl/6HHesid3gAkLJ69.Jzu', 35910, 0, '2024-12-17 11:27:06'),
(22, 'user', 'user1@user.com', '$2y$10$UyzmEkWq51yEJ31uviAVteFiB6NpahQgM5Z.3gP89nze5.o6k/TEq', '$2y$10$F14LmhHyeOdK4m5jdFVJ4eqfyKu.e6j4sjQcDoD658j.1W56R5uJ.', 99587, 0, '2024-12-17 11:27:33'),
(23, 'ahmed', 'ahmedss@ahmed.com', '$2y$10$bu.T.rwrEfTAgAtXSL5aqufmnLGUNXlLaSYmZRqYt9j1fV6.NEcNe', '$2y$10$01TxrS5m.kT6JnvYS8wbT.5S3Jh2K7xeRI/ltj7JgtOrvMBU4lU8m', 47132, 0, '2024-12-17 11:57:26'),
(24, 'ahmed', 'kalih7@test.com', '$2y$10$govD6C.UlT.IERNF4/gG1eOE5t.04gfeYmMtIm245fnCvkN/dPZHq', '$2y$10$LGMe0aR0EcCrwsaeQorPwuR5iY5iBrSxsgvqUfqGesqmWa9F8Cjbi', 80662, 0, '2024-12-17 12:04:16'),
(25, 'ahmed', 'kalih7t@test.com', '$2y$10$ylX1qBuP.bzHALvRw4TrWeA/UuniaYm0VXKDJFPtygjoVKcarlzAG', '$2y$10$XzcNC.bGlR0EE/Ymxod11.7VbxKruIsPZzsvyPEXUAYLo.dJRNNuS', 32363, 0, '2024-12-17 12:05:04'),
(26, 'test@testt', 'test@testt.com', '$2y$10$iR5Haft0LMa8jIT3KgYvR.XxMwlDX2cn5F3hgcRgbssIxwy3BaIlC', '$2y$10$Hj.3TrqBR.riZbbTBrMq/u6ZpNUBzAVN6aeCNRRimp3dQRxLiSj8G', 14979, 0, '2024-12-17 12:06:10'),
(27, 'test@testt', 'test@testt.com', '$2y$10$DNIPAbHdb.QMYk.G7InjRegSSoPlVKn7aPCD64dLAmfSo9R5xcrRS', '$2y$10$Yc3D/0MOg1ZKQqd3aJ7F2.vevGh1.GHfvol3eeMmqRGCXjmaSV.aO', 86860, 0, '2024-12-17 12:06:11'),
(28, 'test@testt', 'test44234@testt.com', '$2y$10$4Ac7JWWJznqD8VurwleP7uB5QWFMP6Ko7rHo2PqaUUcyf8p/R1pj2', '$2y$10$zuX6WNORxbmEyBgTKNrmB.h6ehkLae2MSQBDUWUT8QhY0ZiIpSrs2', 19016, 0, '2024-12-17 12:06:29'),
(31, 'test@testt', 'testv442j34@testt.com', '$2y$10$6su6WNZFmmOQFrKKAuF86O6eKW90RERqbWAtFVyVZyQgxAP8alImS', '$2y$10$iNoT1xTrrAj2LXi24XTXj.8yStk9.1Y/cjI55beKrto0E5rYCTY6y', 47406, 0, '2024-12-17 12:10:20'),
(32, 'test@testt', 'testv4m42j34@testt.com', '$2y$10$.V3E5XKZRKWRClZ0/db2DuGXCauaDUsLUMvhX3E.sRxh3x1oeBkry', '$2y$10$6DgjdCyWhhbanybYd8njaOeIaCbR4sY4m5B8yRrE.hjAcRR6tpkr2', 30769, 0, '2024-12-17 12:10:38'),
(33, 'ahmed', 'kaldddih7t@test.com', '$2y$10$Q5tt/WhopUZIsSsk1yfhZuHbH8zyosGB48if2oXTqM6cF5MEIsmlS', '$2y$10$OT/Sjsbzfa8jNScL88Qvku3FtuvzeCOrCHAqXAp647APRz9OS.MrW', 46195, 0, '2024-12-17 12:11:00'),
(34, 'ahmed', 'kalddd88ih7t@test.com', '$2y$10$94TwiJ4pm/a.KI8AXspqKeirKTDB80kEvjVBBm.dXKYTUDpWKVuUu', '$2y$10$ftGGPHV/DDVfMEMX/ia.Zu/WYU48L90uxHIcA.eNO8dbeL047tqLe', 82161, 0, '2024-12-17 12:18:58'),
(35, 'dgh', 'dhfhdfh@sdgfs.com', '$2y$10$ah2mXRvGINfK18ITECYSX.6pYJKTnFC3tGqCyZDGWANCIkjbgCQB6', '$2y$10$MKMxjeAbkCZjxS/zpKAVY.w/weymdXno/mqaiUcSDmC6GaeWUTslq', 19410, 0, '2024-12-17 12:34:41'),
(36, 'sdfsf', 'sdfsf@gmail.com', '$2y$10$wX2avgeZg4igk7gGGFTklefmTNl35G4MUrOeovkCAO9ZfoQpc4fpW', '$2y$10$Kb0G1eAVusith0Y73Ku.8uRJ7bBDrCgx2eUZLtnMHYXviHTU.ZKre', 40752, 0, '2024-12-17 12:35:53'),
(37, 'test', 'test56544@test.com', '$2y$10$pb1/8QTN79CiehGPPYd1yOuBe7R375TsnDH6ofoCV9lUHnhfJkcJ6', '$2y$10$E/Ee5F5kbeFyuzYvBsQbdeuRNVx4OWOaXsRcRSfWWoXHbieqE00Qm', 61583, 0, '2024-12-17 12:58:36'),
(38, 'test', 'tedsfsdfdfst@test.com', '$2y$10$JqY4YsVTrZmdjRXi8.NrUu/F.6tfnKaDkpLRNW/rJEBO0eSUeV1py', '$2y$10$zZ6P3yS/didgOaM04Mu4DOIRxiA439Pydttw2.Rv5.Wy4rRf1a55K', 75902, 0, '2024-12-17 13:03:44'),
(39, 'ahmed', 'kalddd88fgfgih7t@test.com', '$2y$10$IsJYYrce1573C7RoII.wFu8m37kAfU1wy.NvcJIAPh7ZHnbx2lnEO', '$2y$10$yCGVeod4dl26GmUskGj.FeeFXPSVRtsAvjDS93xLzJRJ87oVPRZ76', 81255, 0, '2024-12-17 13:04:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
