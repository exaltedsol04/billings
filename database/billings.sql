-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2026 at 12:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `billings`
--

-- --------------------------------------------------------

--
-- Table structure for table `bl_admins`
--

CREATE TABLE `bl_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` text NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `forgot_password_code` varchar(191) DEFAULT NULL,
  `fcm_id` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 => Active, 0 => Inactive',
  `login_at` timestamp NULL DEFAULT NULL,
  `last_active_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_admins`
--

INSERT INTO `bl_admins` (`id`, `username`, `email`, `password`, `role_id`, `created_by`, `forgot_password_code`, `fcm_id`, `remember_token`, `status`, `login_at`, `last_active_at`, `created_at`, `updated_at`) VALUES
(1, 'superadmin1', 'admin@billing.in', '$2y$10$eDLjo4Ahp/sgAXsOvolH8uDYI52OUEZEw50IizHZDTkOoo38wB2OW', 1, 1, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-12 12:01:28', '2025-08-12 12:01:28'),
(2, 'EcoLeaf Main Hub', 'seller@billing.in', '$2y$10$eDLjo4Ahp/sgAXsOvolH8uDYI52OUEZEw50IizHZDTkOoo38wB2OW', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-12 21:01:25', '2026-01-01 12:52:20'),
(3, 'Thane West', 'namkeen@gmail.com', '$2y$10$OHPWiWtxcfHhy0Olg5/lCe6v4S8aXjR2.q2mfTOS5O7OhEexv.Xiy', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-14 16:15:05', '2025-10-01 14:26:18'),
(4, 'Vikhroli', 'Bakery@gmail.com', '$2y$10$6aFA7zBCMIz3Oc0NyPNYJeLdUZ283SsRIeGSsuDdcQIwzWJ62eLSK', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-14 16:18:22', '2025-10-01 14:26:01'),
(5, 'Dadar East', 'Masala@gmail.com', '$2y$10$bhD1yLIcXadlzYTAjdnXWu57.ZqrjeRF5gEk2notFEUrYAI9/LOHu', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-14 16:23:01', '2025-10-01 14:22:52'),
(6, 'Mumbai Central', 'Sweet@gmail.com', '$2y$10$2c0sqtjNjzlzGxG0Jr9oIesZA.jyMDeyxAqxa7iLRyx0wsCwoBfI.', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-14 16:27:49', '2025-10-01 14:22:24'),
(7, 'Borivali East', 'Dairy@gmail.com', '$2y$10$piE/wFNNI.qjLQXYMllRreDqCnURS2Z0Lhx9riKTeZiqHhNkR/oHy', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-14 16:35:48', '2025-10-01 14:22:00'),
(8, 'Delivery person', 'delivery@ecofresh.in', '$2y$10$asw5RC2gNuhPc0v1koCC4OEUGWtAMMqhABbxXu6TYZ9ufxF2RRuKG', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-18 14:10:36', '2025-11-20 15:34:31'),
(9, 'yogichowkseller', 'selleryogi@gmail.com', '$2y$10$0b1mO2vAdO3OpDRZSPqSkOeNYdmlVpljDXII6RYKiqlOdBFJphjuG', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-18 17:43:25', '2025-08-18 18:11:49'),
(10, 'motavarcha', 'mota@gmail.com', '$2y$10$ctV2PWuoPAXTR1FadqNcO.UmHjE5fjXvpeRON8TEx21B3B.aB4eHG', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-18 17:59:12', '2025-08-18 18:10:29'),
(11, 'Rahul dadar', 'rahuleco@gmail.com', '$2y$10$guOkkN3aucvQ61r2Uh/SwOKhRfshqBi2zJDFenpA6w86ZlQHtaqv6', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-22 11:48:23', '2025-10-01 14:33:02'),
(12, 'motavarchaS', 'motavarcha@gmail.com', '$2y$10$bsZ/f8mznTsnlaoW4EAiqOksubq3bgG1bVgFBDsqeNbXOrI.NucSS', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-23 09:44:01', '2025-10-01 14:21:37'),
(13, 'yogichowk', 'yogichowk@gmail.com', '$2y$10$5jgR2lujCHIwGWVWHN9.Bug4HXHJ2Qz1MpymVxXWeH8R8VCkfGCEm', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-23 09:46:26', '2025-10-09 14:54:03'),
(14, 'Patkhal', 'patkhal@gmail.com', '$2y$10$L2KvFHS9cSYWp.o5YlwSJ.EmtjHfLbfKnD0.et5ZbRP6YNS6vE6/S', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-23 13:48:35', '2025-09-05 17:29:18'),
(15, 'Sanjay', 'sanjaco@gmail.com', '$2y$10$.eMu5Z2mHSrNQrdLcmtqoeKeKFmWPx8TNAOdDBvIpiUS/n4yHnvx.', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-27 17:31:42', '2025-09-05 17:24:48'),
(17, 'Kunal Bombay ', 'kunal@gmail.com', '$2y$10$TkCqhI4v.8zZUivyB8w1iOnZpD711p4ncCq9aOgdPj1X1Go/9j2GK', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-08-30 10:49:22', '2025-10-11 21:02:44'),
(18, 'Ecoleaf Satara', 'bomtaurant@gmail.com', '$2y$10$43iMrHXUCQ0Q0tt717F7F.7LQnnGxmQIDMdaFkz9z0rW7cm9tw2Oy', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-10-03 11:30:56', '2025-11-02 14:47:09'),
(19, 'testplaystore', 'testplaystore@ecofresh.in', '$2y$10$kYIndQApFNq7k7.3XM6cnORvaK4CPBW5011gjT.JEyMWGcG0vB5S6', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-10-06 20:31:56', '2025-11-20 15:34:52'),
(20, 'Soham', 'scoleafsatara@gmail.com', '$2y$10$1Q9UKK0qDwZYyYtD8/5p2.1x6IEl8l0OieZ3U7Z0mnT38Cmq4pyWm', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-11-02 14:16:41', '2025-11-02 15:14:45'),
(21, 'Ecoleaf Satara', 'satara@ecoleaf.store', '$2y$10$8moN87PSYGqbg6AVOFnmLe5HVh9df9cDx7zwtefa2KdN2Zm.UUDUS', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-11-02 14:51:23', '2025-12-18 16:21:32'),
(22, 'Ulkesh', 'ulcoleafsatara@gmail.com', '$2y$10$KEw53zYeqkJsH.oCAtlPLeC4xlllQf/TaOVyINsEGqj.p1y0B1MrW', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-11-03 17:53:30', '2025-11-10 10:44:05'),
(23, 'Ecoleaf Mumbai', 'mumbai@gmail.com', '$2y$10$knLhN5b7ur2Dk.QTIUDDTObzXogtdRiuVyM4qcboKYK5IJxjqaOui', 3, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-11-16 10:12:10', '2025-11-16 10:34:35'),
(24, 'Samir', 'samir@gmail.com', '$2y$10$jS8hlaEQJfqbVylinYRl7.IG9SVC/uqffleAW3kH4GaJu/1n2nFXG', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-11-16 10:24:59', '2025-11-16 10:54:01'),
(25, 'Prakash', 'prakash@gmail.com', '$2y$10$MFus2IJq319PegMxX2e8K.CIUl.cG3.ZENbnP2oy98vMnvMoR6ETS', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-11-16 10:53:47', '2025-11-16 10:53:47'),
(26, 'Ak deliveryman', 'akdel@gmail.com', '$2y$10$Z1Di64yQLN5Bj0Mdpz01quVm7rVN3JF0gID341pirVZ4blJ0XOaAK', 4, 0, NULL, NULL, NULL, 1, NULL, NULL, '2025-11-20 15:44:12', '2025-11-20 15:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `bl_admin_tokens`
--

CREATE TABLE `bl_admin_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `fcm_token` varchar(255) NOT NULL,
  `platform` varchar(191) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_admin_tokens`
--

INSERT INTO `bl_admin_tokens` (`id`, `user_id`, `type`, `fcm_token`, `platform`) VALUES
(1, 1, 'Seller', 'dZzgKJA6RJSGSdz2llIrrL:APA91bFPtvrsITZOSEUnGMyHSOmtrPgQCJqjxeBd7LTla-kUNjTigfodrlv4HV59Y3TBFAr22K4w4ZFsFD5qqMr2_J6IV8ck7e_1fMB74yxHVzKSwxtQMgw', 'android'),
(2, 1, 'Super Admin', 'cTPpJB0a-_6cY0Yk8qgA_d:APA91bFsYH1xDC_LO_siNcB_-bz83b8S97Ixeujbkr2Z5y9IpT-0e1Smlk3-pXZ5EsrXEGeg2lbtWhOSP6kdARbKXJwdEpsxQuyHwI4G1KjcwVusDk689oY', 'web'),
(3, 1, 'Super Admin', 'fCOxJzaKae5fVlRH76AowN:APA91bGWMGCNCfLwAAvd9jvxFrFGmuO7aMx-0IKL-OMx8wsbFKkUYHFkJ5fhXowasvozlgfoyvdl7yKfT__gsb1Zy-SLThxoXuyJWAXfwOMlOhwUX0DZf14', 'web'),
(4, 1, 'Super Admin', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bHX8th2jh-ukvehRrhA61OvLByZk4-Ky_6Rt0O1gIo4Nqdnimb86mIG7IYnayZ-U6hPs1Gkh_roWF-oytHEMB_izq56lgWTRanOyf_D4sfXw2AH2K4', 'web'),
(5, 7, 'Seller', 'eIRFuHyWQCeMJzzAhIa9Er:APA91bHEQj2Te-UsXisXvt7ldJ3hNHIXPg9C0jhh_69PF2iynP3rwA0aGkjfMtBhVynVp3qRBPkN_0CA5uTFjIRjtr_zxKu8WlVFp_vlAjHQ1alM_1wFaAI', 'android'),
(6, 2, 'Delivery Boy', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(7, 3, 'Seller', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(8, 2, 'Delivery Boy', 'fvTJgdIwQ_6YRNFjnlP5za:APA91bH9oeSQatbM1QdF9aXmHjXGSSCLaNRR6_C8xgHXLMjTZ2hnl906kP14rm6AuEYawsrfN05itq_eiEdaJPd5pV5S6X92aL6SGipPT33NvBluWs2StzI', 'android'),
(9, 3, 'Seller', 'fvTJgdIwQ_6YRNFjnlP5za:APA91bH9oeSQatbM1QdF9aXmHjXGSSCLaNRR6_C8xgHXLMjTZ2hnl906kP14rm6AuEYawsrfN05itq_eiEdaJPd5pV5S6X92aL6SGipPT33NvBluWs2StzI', 'android'),
(10, 2, 'Delivery Boy', 'dkT1_ZWTQ3CgxLJ1tS-02G:APA91bHlGIkRQnuA4s0GbH7KMgtC2jbOzHOg-DNyH1aSDCfaqi2z9nXgtQBz-3V2tpsvZ810OAtW4vjixjB7tHYDxzcqsvFKs3AMyRI7XR8ll16__YqoSCs', 'android'),
(11, 3, 'Seller', 'dkT1_ZWTQ3CgxLJ1tS-02G:APA91bHlGIkRQnuA4s0GbH7KMgtC2jbOzHOg-DNyH1aSDCfaqi2z9nXgtQBz-3V2tpsvZ810OAtW4vjixjB7tHYDxzcqsvFKs3AMyRI7XR8ll16__YqoSCs', 'android'),
(12, 1, 'Super Admin', 'cKtGf7Mt7nB_lMx0sgilP7:APA91bH7V0lPJVLli_VneHM6Up34SYVqSSOM-L5nMD-AR-VdjTqE6rwp3GnebP8ymVWD712OxUHoJ0iKhyc4FGsJuUfjWEfb5h7agpe4BlK2sCd58MqiRJQ', 'web'),
(13, 1, 'Super Admin', 'cKtGf7Mt7nB_lMx0sgilP7:APA91bHqkR_kRX1Tv0zxnw2-w3LtY5tQrPm8v1YUEeq4DCq3sAu6hKyhdc9Zye12QYrYxUErAlgP4JJCLRJuRz2rKaydpBJuHPjTloMaaIVIxj5GyI9fYic', 'web'),
(14, 11, 'Seller', 'dZzgKJA6RJSGSdz2llIrrL:APA91bFPtvrsITZOSEUnGMyHSOmtrPgQCJqjxeBd7LTla-kUNjTigfodrlv4HV59Y3TBFAr22K4w4ZFsFD5qqMr2_J6IV8ck7e_1fMB74yxHVzKSwxtQMgw', 'android'),
(15, 1, 'Delivery Boy', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(16, 14, 'Seller', 'ey6Zx-_7hhzcvax9eaG9pP:APA91bGbECJfFnlzs5XztCI5qcUy-jgYYbRT5ahgRWz8upbdEjms-uFDeg6rsvdCOCzhZDe9KbuBq5sS-QRZXP2o0l2GfJ0OuLIbrF0rW96cziJN0BYrprU', 'web'),
(17, 4, 'Seller', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(18, 11, 'Seller', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(19, 3, 'Delivery Boy', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(20, 1, 'Super Admin', 'cKtGf7Mt7nB_lMx0sgilP7:APA91bGQAxQxtLki33F4kSmbN4psHOHszxuon9i68_W3TLw1EPIS1NcjKiQ6IkDTaYFlMc2IrxUJlzf-ChupV7Qz_HYHMK4iea3Rdt2bzuQPL0rpn-_ngxk', 'web'),
(21, 1, 'Super Admin', 'fgPdNdA_Kw91w8uRVYS7Bl:APA91bGQgtILvHV0hqYYkCumJ30WZgBXlg22_gt20WUWJ0E9DZ8dUSvJHfVEUTPhwXVNJ-ffdliiEorHhsjC-rDR3ESSmTczNi2SWQbQT6VgHi8wWccJk8w', 'web'),
(22, 4, 'Delivery Boy', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(23, 3, 'Delivery Boy', 'dZzgKJA6RJSGSdz2llIrrL:APA91bFPtvrsITZOSEUnGMyHSOmtrPgQCJqjxeBd7LTla-kUNjTigfodrlv4HV59Y3TBFAr22K4w4ZFsFD5qqMr2_J6IV8ck7e_1fMB74yxHVzKSwxtQMgw', 'android'),
(24, 1, 'Delivery Boy', 'euSDhXa2QMm573jNMivHKf:APA91bFyRn3fDZ3TvDV0hpCoXTQxVrE4-P5sCoQtNJ8pSVRjIqmk7k4neK14vQzScGo9w1Zp-2OtSnCistYjn3vG1D0BTQ2SqL3vixeS4iNEztvEUSnW-w0', 'android'),
(25, 13, 'Seller', 'cTPpJB0a-_6cY0Yk8qgA_d:APA91bFsYH1xDC_LO_siNcB_-bz83b8S97Ixeujbkr2Z5y9IpT-0e1Smlk3-pXZ5EsrXEGeg2lbtWhOSP6kdARbKXJwdEpsxQuyHwI4G1KjcwVusDk689oY', 'web'),
(26, 16, 'Seller', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bHX8th2jh-ukvehRrhA61OvLByZk4-Ky_6Rt0O1gIo4Nqdnimb86mIG7IYnayZ-U6hPs1Gkh_roWF-oytHEMB_izq56lgWTRanOyf_D4sfXw2AH2K4', 'web'),
(27, 12, 'Seller', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(28, 1, 'Super Admin', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bG9w0PkuQI5NG0wG6d85fIAR8OdjD3W5K2n51ZG3_8pD8TGngZ3I1fqtnXNHHRAG4MpD8JncF3bm4SfUdQXymg2s3rzOdFIPuN_UcIoIs4X0DxEnXo', 'web'),
(29, 4, 'Delivery Boy', 'dZzgKJA6RJSGSdz2llIrrL:APA91bFPtvrsITZOSEUnGMyHSOmtrPgQCJqjxeBd7LTla-kUNjTigfodrlv4HV59Y3TBFAr22K4w4ZFsFD5qqMr2_J6IV8ck7e_1fMB74yxHVzKSwxtQMgw', 'android'),
(30, 12, 'Seller', 'e7NfX9BvT_mD1EWiifJC3z:APA91bE7PF1KZYbnKo9OUD_JJ0LlGOWM8FfAUp_l766vhzGhDF_ADtgEMq6ZgXuMGaokwGcQjGXSPqOK3WyBfBmoYjS0H0ZOViVKBSQTL0DI4WYVptY49bw', 'android'),
(31, 4, 'Delivery Boy', 'fVlVDuZLSjSKSVa_w45XpE:APA91bF1OL2zS_tvP7M5gWzFEaxd6fGfRuTdG3Aii3XFtYPHsc8tBrLfacR6cXoWpWlNrivQaMmDvtJmwtSDwFDSiivc1rjC7Zab-vylsPG1ywDbBp5G8UI', 'android'),
(32, 4, 'Delivery Boy', 'eVnuHQnDRuirUYved4lr72:APA91bGBfdb4keUxBPs1U6oYBHQFdnJJnPYCnTTr6CxFeJaqUTv8oilEPwqaISDpydarVu1ofexhyNrf5UmQfcJWp6dLtFBACYEo_fg4mS1Y7YxsEHaCCHk', 'android'),
(33, 17, 'Delivery Boy', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bG9w0PkuQI5NG0wG6d85fIAR8OdjD3W5K2n51ZG3_8pD8TGngZ3I1fqtnXNHHRAG4MpD8JncF3bm4SfUdQXymg2s3rzOdFIPuN_UcIoIs4X0DxEnXo', 'web'),
(34, 1, 'Super Admin', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bGKjwACpSVquwep4F7vMfVWiOB3YylkCoLbETjd4IVmphhZt-nqc4ONf6awi5xrHI6QFObkKhRpHnar-8L7AksYLL1wk-T9pSnIeVbOYYSqBnTSMYs', 'web'),
(35, 13, 'Seller', 'fVlVDuZLSjSKSVa_w45XpE:APA91bF1OL2zS_tvP7M5gWzFEaxd6fGfRuTdG3Aii3XFtYPHsc8tBrLfacR6cXoWpWlNrivQaMmDvtJmwtSDwFDSiivc1rjC7Zab-vylsPG1ywDbBp5G8UI', 'android'),
(36, 13, 'Seller', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(37, 1, 'Delivery Boy', 'eN6mURH8QuWYM5JyU79VVd:APA91bF0NtiA8S8wZwK49NAZSs3rfhFb9o5YoC2nMFOZUFxDzvYMgrTCAEaqbeC1BgI9X_9PVYc50eu7kXYumFfv2jnpWpHcs-q_Mn5WZyKRmIlU39pEtF4', 'android'),
(38, 19, 'Delivery Boy', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bGKjwACpSVquwep4F7vMfVWiOB3YylkCoLbETjd4IVmphhZt-nqc4ONf6awi5xrHI6QFObkKhRpHnar-8L7AksYLL1wk-T9pSnIeVbOYYSqBnTSMYs', 'web'),
(39, 1, 'Delivery Boy', 'dIi-dbM6TwOv_8hSIikHn5:APA91bHPSujczI3cP6L0fjS1OYeEwut6nwNTpu3e2IsfIC1-NhCgp1VYiq33eLe19zUWcJxtfpE9yhZAgs3xOHQzYIY_cOO07SIl1-8zyBmMZGktJpjAXbQ', 'android'),
(40, 18, 'Seller', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bGKjwACpSVquwep4F7vMfVWiOB3YylkCoLbETjd4IVmphhZt-nqc4ONf6awi5xrHI6QFObkKhRpHnar-8L7AksYLL1wk-T9pSnIeVbOYYSqBnTSMYs', 'web'),
(41, 4, 'Delivery Boy', 'fIhnR33bQ3SMN2JYMGKsOk:APA91bElCqRuIh_ZI68mVfnc_HkzrMONa8pSmE9LKZeqwX-5FYw-Nmbl7xp7K_dVtDPKcCFsMWbHZ_rRbTmhojjeJdMaDfeGUB5iQPWFVblzrGfqYP9mCM0', 'android'),
(42, 1, 'Delivery Boy', 'eYiCWRRARUyjVRXbxxiFT3:APA91bGS0qqaQh0jC2tOGQXXshNpVWF2yt1X1Ndy4nrha2fJ-d61YIeCNDYxp-LlWqgNsxKonU3zdyyTLu_EiQO5rU7psXEJGhj1okdU9EdYt5A4ErUb1Kw', 'android'),
(43, 1, 'Delivery Boy', 'c7RaOeUxSWSvj1HL5Ttw_S:APA91bEzY1ODGzydWXPQScvth-4NugQ0dzaZVV230ezNKgkdk0oqj6zSEJFKSgpNGVJKSbYqXCiAsVKbrKLKL6OZdDxKbq1oL5rADgI9e6NEdTJrpRlzizU', 'android'),
(44, 1, 'Delivery Boy', 'dVwJga8rTuecQ_jx44kS1l:APA91bHJMVRMiGEP74gKvudZuKVUj7SYIQ4BPufI-iIbShOEMNXEztTlWzERqXrX1mkvNk3Ldfc3nJ666-aNbld5Xg_9aiQ4198_WBq_05ohKz9tI4v0Bnw', 'android'),
(45, 4, 'Delivery Boy', 'cNRuTjeSRw2cFW4LBoGvL3:APA91bEcVqk2gkPll1SKPij4RSfr22YFg9QMpcXuEfSJ9883IlI3bS64sOcC-TFxpQbqKUoGC8coZU9XQhpvabEfwKDwz_naoxCagzmF-TTWbzmLts2pSF4', 'android'),
(46, 4, 'Delivery Boy', 'cDm95SxjTFCcmFOUnz8zkX:APA91bEWZXqKX9CZtObT49NvymvUtpnnBJosjgrPf_3wnfo6cTs8K1oJIIYYkBKbcIUIR5sJe8Ao0npFTJtMfm55l3wFd_R8qczJkO68JNvZh1VWTqxZRJw', 'android'),
(47, 13, 'Seller', 'cDm95SxjTFCcmFOUnz8zkX:APA91bEWZXqKX9CZtObT49NvymvUtpnnBJosjgrPf_3wnfo6cTs8K1oJIIYYkBKbcIUIR5sJe8Ao0npFTJtMfm55l3wFd_R8qczJkO68JNvZh1VWTqxZRJw', 'android'),
(48, 1, 'Delivery Boy', 'd0h_l_kuTJ6zj1w6YYwtU6:APA91bEnd0e_JuuS9Mw9Yu51Kw1fEallP5-pwMC794sl3IhdqqugtUnmnQ77a9h3Sc5S0BF9KJm0HBjJgQ-rNfi4YgG01bv6RrROnaXm8bkRA74W6_BMFFU', 'android'),
(49, 1, 'Delivery Boy', 'cb0xvvULQLOwTealHVurw1:APA91bH81whDAGu0Pq-tqE20ajbgBedzx_H2cWVAnofCIITL3RuwX4ScWs4da8gy7HVaXWg7fdatadrVxT9gjHUskIGPaMaWogufOC0VMZUlwT-oq8KE3nc', 'android'),
(50, 4, 'Delivery Boy', 'eJk7jDbTRAqdj8PrIVU1Ka:APA91bGJIeoyIrMOJf1f3IGmcDnpgu9uh9Am0Ku9NOdgHmmU1-SIzTKp6ahC5G0OI6ynOiKtvHnP6wSwZEm3ELEqjNxUdQmFC8FgW0W0KvZKy0HzHhxUulE', 'android'),
(51, 1, 'Delivery Boy', 'd737bzb0SWaxzs8DEKQhEW:APA91bH0BOwBMDgfUlKhDzTk7wmkod-8zAm9RrAwWFSs4iJC24A7QHb8a58k79ghR9VgKBttjV2q7ZhNV8l6elR-4NRsJfZSn3OGEcBqZN0_320i2RSCqZU', 'android'),
(52, 13, 'Seller', 'f1fJVvoBT9ulk1hBajywYu:APA91bEC_2UCoLa5C-TjbsYFc0ghk0vE4sSPXteMfNRpIBLJ9g9MjAvZbP0tkjxIARhRBJGzW1D9YapWe3hwnQnLubl7Riqpa7TOhQzUVsgHPpOTKek0yqg', 'android'),
(53, 4, 'Delivery Boy', 'f1fJVvoBT9ulk1hBajywYu:APA91bEC_2UCoLa5C-TjbsYFc0ghk0vE4sSPXteMfNRpIBLJ9g9MjAvZbP0tkjxIARhRBJGzW1D9YapWe3hwnQnLubl7Riqpa7TOhQzUVsgHPpOTKek0yqg', 'android'),
(54, 1, 'Delivery Boy', 'c9k3E839QLCXX2I67cgloO:APA91bGke-2nnowbpjreDAfCng8AwLOyXp465bcs8GgG1uxTLGehOnahSoY1QNDdIFfvnfxlThd58GgxA0eCA7F3pzgc7uJk54EbtfgngrJSmkjaBxY-eHY', 'android'),
(55, 1, 'Delivery Boy', 'dwiKMCfFTcO3p0ibQL0MY4:APA91bGGHkEeVlJ_Ib1TZVo1jv-MdyCZtHKFeu_VphKolUlCMMPxnP-zOsuuu2McDgiA24ErPTBMFeuyUKtkW9aly745o2tnDFqatjnIOZhuxYoWZ1gPrOI', 'android'),
(56, 1, 'Delivery Boy', 'dQM8w5HnSn2YC5rrle2aS4:APA91bFBp1X3jNBek-LufhOAiNmlEkyA1BsLhqfkgEcBps4HBYzFJIi-91UlgPlP6otRMGgUk_rLwXQYiRS2G3WqBnW2Qcq12aGpAZ44-Twnk03swcnAfOQ', 'android'),
(57, 1, 'Delivery Boy', 'c1xIcNdDTm6OL7adOm38-t:APA91bHjUQH8lbIZowXiqdLtQcDayov8f1dmDMzo9Um2pXDx2qKw2YngNN63Q9ZcsVN0S5KrAUP6KxuB8V-4dryVGq3HvA4gH0RKN_ZF1deLLJKDyTgiAJw', 'android'),
(58, 4, 'Delivery Boy', 'cXA10xwSSnila6fRNJcmPm:APA91bFaX0bOaNPzdydEaTigXm7xRnpgYMA21zwIauU_Py5SzvCj1p_42Hp_s8OfF50Tk8ioLPInGyzzGSXQUFPlu7VunyK2AqF5BAE9dc4LpnyOOELL8K0', 'android'),
(59, 4, 'Delivery Boy', 'dm06WhsxT5-w3kD6J0LTik:APA91bGFmmiZVZRYdSVaT0r7uKTlSshhURLS0vpcDlUMh9ENPoUCd9SBmdkHLUvfMK-bLYPfJQKapNqNy_KZpoOjxLLQnYfwBvolMgbwFwIWN_DJgjJVw1E', 'android'),
(60, 1, 'Delivery Boy', 'epDCeZlXTquKuwJm55xCFc:APA91bHr15p5P7iNbKFnsf9TvR0mTMZPHIndm8b5LV4wkZVwf4UjeTq69VJolgXUPK-IZbmFd5hUpc1-j4jPXqO2GB3PU8C3iS_6BC_hfamKVNQ09WrpjU4', 'android'),
(61, 4, 'Delivery Boy', 'eiMwyMEMQb26_dcTrVyAa6:APA91bHUh1Y3QZvWQco88WLY2ARU-onIvP8Ilhnoio0yXHubgOBDsiJhRTtJyAkyIeyhQ-ynyddMJyulPi-5h8qCvAyHO4L62DGaijZkKRhXbz2HN2gKM4A', 'android'),
(62, 1, 'Seller', 'dm06WhsxT5-w3kD6J0LTik:APA91bGFmmiZVZRYdSVaT0r7uKTlSshhURLS0vpcDlUMh9ENPoUCd9SBmdkHLUvfMK-bLYPfJQKapNqNy_KZpoOjxLLQnYfwBvolMgbwFwIWN_DJgjJVw1E', 'android'),
(63, 4, 'Delivery Boy', 'c1hSFDjVRcyrAbsNx1bN-9:APA91bGYSSGTZGISluTFx6wuG3VbS_tNiE3DmH7zJ6HkyMKJIpPUg7juGUB3HGY9nrtmQtosmZom6XxSHir4pI9zeuRitgG-xXGt_HOgn0q6e7vKs3npmgo', 'android'),
(64, 4, 'Delivery Boy', 'd71dS2SASs-eGsa7fwUaW0:APA91bFJrZuZ62oISACALHpgCKZKKZtwMSoIPGE7hIFG4NSpyOKWEKwlSy2aUdXmFh9Hfk_YJL_W3FRoitpu9FdBtCIfbiCgatiJ5_oZihM3HBDl3ay7VcE', 'android'),
(65, 1, 'Super Admin', 'cKtGf7Mt7nB_lMx0sgilP7:APA91bFKMQb2mye8rvV1U8k0qSv8Vp4UbA99wT1GJ0gjifRxJhsgOs_FOBx6JBmyJbNFRg77ZFGaRSzh_91KLQcUb5ng-1TVBqhMU8cYuLKXVNGFPFjqMso', 'web'),
(66, 6, 'Delivery Boy', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android'),
(67, 7, 'Delivery Boy', 'cEC8f6aaRSmqb9tDaI3X1a:APA91bFZZx9vmLF7hEejl77JfcZr9T-KSp6BwIGXoS758rS5Q7dZ21E-ICRNqK316ea0msFwwsBd6VTpb39XoEcAk_fLNarJFQxaw4nNMSjABTDv9O6Y9h0', 'android'),
(68, 14, 'Seller', 'f1fJVvoBT9ulk1hBajywYu:APA91bEC_2UCoLa5C-TjbsYFc0ghk0vE4sSPXteMfNRpIBLJ9g9MjAvZbP0tkjxIARhRBJGzW1D9YapWe3hwnQnLubl7Riqpa7TOhQzUVsgHPpOTKek0yqg', 'android'),
(69, 14, 'Seller', 'f_Qdh7ThTDK8yqHfxnh430:APA91bGSFEWnhTZT_Op80HZ-CZYPQ7K75Dor3avPtLR0Ql95_rlIZd7ywLxmW5qDk7mZSp1qUrRXE03VHpQ0HmPZ1vQQc0vzzsvhL4ZtsKVY4X69FTB4yOQ', 'android'),
(70, 7, 'Delivery Boy', 'd71dS2SASs-eGsa7fwUaW0:APA91bFJrZuZ62oISACALHpgCKZKKZtwMSoIPGE7hIFG4NSpyOKWEKwlSy2aUdXmFh9Hfk_YJL_W3FRoitpu9FdBtCIfbiCgatiJ5_oZihM3HBDl3ay7VcE', 'android'),
(71, 7, 'Delivery Boy', 'crGG1nTfTx2gJJJ7KL8I1b:APA91bEBU8xrICsgwO8-eNO-EBAjxFnKq6YscZgsJ85KfQ0dku4iMvzZXVyPAXvoUEyzrf0bYGWlzkTa-aQpFaw9c5XsuekMOBZIHOe6ciiFn4Z3xqd2ivs', 'android'),
(72, 7, 'Delivery Boy', 'fHYbL0A9S8uJeEePeJLonJ:APA91bH1trVDku_0PqVuMmPfZFGGU3NRHgthp_fnw0ZA74VimIldEyHHTCxGXEncfhVo0NJZxeVxkp24Vums1ApvsmeF7wTAccUXdZSfHvebXcz8YmofoUA', 'android'),
(73, 7, 'Delivery Boy', 'eHHxTW8JTL21_S5WY3p0hU:APA91bGfYkFdkWVjNLrAwT4y0a8pP9W6WPUwX1vVObrvdoSlN8L6ZJ15qLo6L_qN8MfsujUkxK6rW9r1oCKeft-prh7NtzVNohsOFUoG4ZYPlr5QjVWAzn0', 'android'),
(74, 7, 'Delivery Boy', 'cnxRmGQTQy-7WoJnwqN6t6:APA91bGypMtoQjKqiZWuF8CpHVC-PW6-1hC5xbAurZBCiR6AZpVWMQYA0Rkp1tyOMSqv6dZh9hBNgVtY-2IA0FMxz1l830J7gAzeV9FrhF-dZZK1x9x6aHI', 'android'),
(75, 1, 'Delivery Boy', 'ePUDpri4SzSNkl9Fd5Nsaa:APA91bHxOVs2X4m8Xq_61rTbkhZFbsuauYYpP9RnhmxLz2CQO82ZOog-pZCg86avQHD293ZRPaPaAookhDx4zAMP68iyWM1UhdCujwFbKuZPrC2busoS43k', 'android'),
(76, 7, 'Delivery Boy', 'ePUDpri4SzSNkl9Fd5Nsaa:APA91bHxOVs2X4m8Xq_61rTbkhZFbsuauYYpP9RnhmxLz2CQO82ZOog-pZCg86avQHD293ZRPaPaAookhDx4zAMP68iyWM1UhdCujwFbKuZPrC2busoS43k', 'android'),
(77, 2, 'Seller', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bGKjwACpSVquwep4F7vMfVWiOB3YylkCoLbETjd4IVmphhZt-nqc4ONf6awi5xrHI6QFObkKhRpHnar-8L7AksYLL1wk-T9pSnIeVbOYYSqBnTSMYs', 'web'),
(78, 21, 'Seller', 'eIeL0Zn_IMM_BrIAf5qt0s:APA91bGKjwACpSVquwep4F7vMfVWiOB3YylkCoLbETjd4IVmphhZt-nqc4ONf6awi5xrHI6QFObkKhRpHnar-8L7AksYLL1wk-T9pSnIeVbOYYSqBnTSMYs', 'web'),
(79, 7, 'Delivery Boy', 'd7AP5Hy6QxqRlM-XRzspXw:APA91bE22cqdJ1mtHmnB1qjCg7zWQ7LG7ddTdq0h3OIZOyCBPFgRIcTv2FOtu7j4Sh5LX1o6HaxGFfXJUwpNAt_YYHpSMEu8x7ney4OXdlxGx4wH0wMPoCE', 'android'),
(80, 8, 'Delivery Boy', 'fHYbL0A9S8uJeEePeJLonJ:APA91bH1trVDku_0PqVuMmPfZFGGU3NRHgthp_fnw0ZA74VimIldEyHHTCxGXEncfhVo0NJZxeVxkp24Vums1ApvsmeF7wTAccUXdZSfHvebXcz8YmofoUA', 'android'),
(81, 9, 'Delivery Boy', 'fHYbL0A9S8uJeEePeJLonJ:APA91bH1trVDku_0PqVuMmPfZFGGU3NRHgthp_fnw0ZA74VimIldEyHHTCxGXEncfhVo0NJZxeVxkp24Vums1ApvsmeF7wTAccUXdZSfHvebXcz8YmofoUA', 'android'),
(82, 15, 'Seller', 'fHYbL0A9S8uJeEePeJLonJ:APA91bH1trVDku_0PqVuMmPfZFGGU3NRHgthp_fnw0ZA74VimIldEyHHTCxGXEncfhVo0NJZxeVxkp24Vums1ApvsmeF7wTAccUXdZSfHvebXcz8YmofoUA', 'android'),
(83, 1, 'Delivery Boy', 'cgQB06KkQYqAnDgEyfS261:APA91bFojWx9Kid62jdSbUbH4r9SDYnZ2CP_KfSoYiEWwHoYxOHO2AXmrRSXXwlrdKPsY36UXu9pOmXdyMU7baiNCbAF-CzwxUfS5en1aSVt3SGZUDjHny8', 'android'),
(84, 1, 'Delivery Boy', 'cT-7UeUCTMmVAGQddr-zTA:APA91bFk_CVSaiZKgTXg86s5HOS5I1DNv2NnwzGOHaiAm8xVf1TIaVl4Ux-C5g5KR3JHw6roaZcyyEiaFm_NFGtW2vg3FsOAR1eVLWBYnw-iyDz2khkvZNs', 'android'),
(85, 1, 'Delivery Boy', 'c1_NtAgwT-CWqMeEG76XXW:APA91bEl9VHeppFqPAaDx4smHttSxnBYqAq-HdHDV0pueLCGndxDM4W4Ik2zUsA9y6AVEpxZMghALeFTys_0_PYPtKqgAZUn4teEX8qCfRsGeJDCf2BduXI', 'android'),
(86, 5, 'Delivery Boy', 'eIlv3-6LRY-tJ6plzbNHPu:APA91bFzRobJWudizvdTz3MmT8sTgr_25ZQ7AtoAwNNkTmmBGH3iJB2h4AnSvDdTjpwMFaCbfYs8Jrnue7l3KBrpO19Nq4yLPoXhDd2mCRLigx3GIxLe4mQ', 'android'),
(87, 5, 'Delivery Boy', 'cGPjEtOWRQ2echMbWxVDNv:APA91bGaS5sFrovWMnBH35snb_HFhdWEaP4lJ9t9k3cjGqa2bsS1MbE1DYCxHl-Fr1qJmxQbhYv8Z4-znH9FHPjI1x0tV0yVkB2VgOO2ANuNOaOcuukLFYA', 'android'),
(88, 5, 'Delivery Boy', 'fGS4EgxmRXeocLZZMTXxFl:APA91bElG50QMswgNbtcB5rk9tkzz135JTniaAvTCVQlBP1fogViWcJxlkt3drac6oMdsUQFnGuamE80rSmlPzR0zC6scT4qJozoCwu4_n0rttio0exesV4', 'android'),
(89, 1, 'Delivery Boy', 'eStb4VELQ-W7K3hSklwN3N:APA91bG1QR2D380-rWeubp39kFozTicZLMOGpIjvVcAL8UmKZo1IfJV0ElRMKmBJYe9romUSl7tm1YnV4lO65ZW-png2vTPjve4FQ6R4TxsBvbTMocq3vqQ', 'android'),
(90, 7, 'Delivery Boy', 'dVLXbCaPTFGQqrwfRTFgdy:APA91bHMeFXT1FDe5KrHD5gifeqRa4DF_ysBoJnbut4FFxeqIHWy_6bLn004qLHQcYBl7yGFIa5JYXeqcPX3o6gtj7foUyGSm8jsXWv64gUSEuyG2HdbiRQ', 'android'),
(91, 1, 'Delivery Boy', 'eLzOEOenTOqPXwdFk46M0C:APA91bFJN_FcUJE8y2Bp3AXSAccPi6KB0CMUwywzUPd56cXVbDgJ-2rd9ewEVdbSojIX8gItrJZ5MoOcbUSA7l7MPTfPmKFXkZlY0lteMgrRmUctNzuXlf8', 'android'),
(92, 14, 'Seller', 'eLzOEOenTOqPXwdFk46M0C:APA91bFJN_FcUJE8y2Bp3AXSAccPi6KB0CMUwywzUPd56cXVbDgJ-2rd9ewEVdbSojIX8gItrJZ5MoOcbUSA7l7MPTfPmKFXkZlY0lteMgrRmUctNzuXlf8', 'android'),
(93, 11, 'Delivery Boy', 'fmuZzOh_QAKe2WiX3UDUiE:APA91bEDF1wjAAzmZAGQ96iG50bZFJ6UkkXdefdZ2RtwXDnetRk0k12JF90MYhOehXCix7fpLFHlOhn3ug6587owgIyAwT3rmS8lMTcegqi3MU4aPo9LnRw', 'android'),
(94, 11, 'Delivery Boy', 'cLYuEyeETjyX9zUzLyhp9K:APA91bEcZHMW1XJSJFW44T6NJwEWWbvRFOmsjfOsmRb7uMBzNLsUpnOsLjgyGTkWflxz78driLGZsY2o3MI8bbcOB3XCNkpKKjKKYFRDIl2Fl_OtJQyFnyo', 'android'),
(95, 14, 'Seller', 'fr3qG1QpR9uas1IDpu5h9k:APA91bHfN3aK61TS5Cf2Gp4gs_qjwyj_EaSTtQeUUP0o6BNGEEwTlbBwAmHLj5gBXz3JUqWQMgBhRTp-dDjt7fOXwu_S7TkyOxOd8HRQ74htSmmCWoccDoA', 'android');

-- --------------------------------------------------------

--
-- Table structure for table `bl_api_call_tracking`
--

CREATE TABLE `bl_api_call_tracking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_name` varchar(191) NOT NULL,
  `source` varchar(191) NOT NULL,
  `count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_api_call_tracking`
--

INSERT INTO `bl_api_call_tracking` (`id`, `api_name`, `source`, `count`, `created_at`, `updated_at`) VALUES
(1, 'google_places_autocomplete', 'app', 0, '2025-08-18 10:44:14', '2025-11-26 18:10:18'),
(2, 'google_places_autocomplete', 'web', 0, '2025-08-18 10:44:14', '2025-08-18 10:44:14'),
(3, 'google_places_details', 'app', 0, '2025-08-18 10:44:14', '2025-11-26 18:10:18'),
(4, 'google_places_details', 'web', 0, '2025-08-18 10:44:14', '2025-08-18 10:44:14'),
(5, 'google_maps_geocoding', 'app', 25, '2025-08-18 10:44:14', '2026-01-08 18:06:44'),
(6, 'google_maps_geocoding', 'web', 0, '2025-08-18 10:44:14', '2025-08-18 10:44:14'),
(7, 'google_gemini', 'app', 0, '2025-08-18 10:44:14', '2025-08-18 10:44:14'),
(8, 'google_gemini', 'web', 0, '2025-08-18 10:44:14', '2025-08-18 10:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `bl_app_usages`
--

CREATE TABLE `bl_app_usages` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `device_type` varchar(191) NOT NULL,
  `app_version` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_app_usages`
--

INSERT INTO `bl_app_usages` (`id`, `order_id`, `device_type`, `app_version`, `created_at`) VALUES
(1, 'wallet', 'Android', '1.0.0', '2025-08-31 17:45:41'),
(2, '68', 'Android', '1.0.0', '2025-08-31 17:50:20'),
(3, 'wallet', 'Android', '1.0.0', '2025-09-01 13:26:09'),
(4, '71', 'Android', '1.0.0', '2025-09-01 13:31:53'),
(5, '83', 'Android', '1.0.0', '2025-09-03 11:32:12'),
(6, 'wallet', 'Android', '1.0.0', '2025-09-03 11:43:42'),
(7, '84', 'Android', '1.0.0', '2025-09-03 11:51:41'),
(8, '85', 'Android', '1.0.0', '2025-09-03 12:00:54'),
(9, 'wallet', 'Android', '1.0.0', '2025-09-04 18:21:14'),
(10, 'wallet', 'Android', '1.0.0', '2025-09-11 22:20:18'),
(11, '222', 'Android', '1.0.0', '2025-09-25 19:14:07'),
(12, 'wallet', 'Android', '1.0.0', '2025-09-25 20:16:51'),
(13, 'wallet', 'Android', '1.0.0', '2025-09-27 10:17:35'),
(14, '239', 'Android', '1.0.0', '2025-09-27 10:48:28'),
(15, 'wallet', 'Android', '1.0.0', '2025-09-29 21:23:15'),
(16, '321', 'Android', '1.0.0', '2025-10-02 11:23:03'),
(17, '322', 'Android', '1.0.0', '2025-10-02 11:25:11'),
(18, 'wallet', 'Android', '1.0.1', '2025-10-03 10:27:16'),
(19, '391', 'Android', '1.0.1', '2025-10-03 14:44:54'),
(20, 'wallet', 'Android', '1.0.3', '2025-10-04 06:51:18'),
(21, '440', 'Android', '1.0.6', '2025-10-10 16:46:50'),
(22, '488', 'Android', '1.0.9', '2025-10-12 16:39:29'),
(23, '504', 'Android', '1.1.1', '2025-10-15 15:01:45'),
(24, 'wallet', 'Android', '1.1.1', '2025-10-16 13:11:22'),
(25, 'wallet', 'Android', '1.1.1', '2025-10-16 18:10:28'),
(26, '15', 'Android', '1.1.2', '2025-11-04 17:41:49'),
(27, '23', 'Android', '1.1.4', '2025-11-06 18:04:30'),
(28, '24', 'Android', '1.1.4', '2025-11-06 18:09:00'),
(29, '43', 'Android', '1.1.3', '2025-11-07 14:50:38'),
(30, '47', 'Android', '1.1.4', '2025-11-08 15:31:57'),
(31, '48', 'Android', '1.1.4', '2025-11-08 15:36:36'),
(32, '72', 'Android', '1.0.0', '2025-11-17 11:09:09'),
(33, '73', 'Android', '1.0.0', '2025-11-17 11:19:35'),
(34, 'wallet', 'Android', '1.0.0', '2025-11-17 11:25:52'),
(35, '75', 'Android', '1.0.0', '2025-11-17 11:37:14'),
(36, '89', 'Android', '1.0.1', '2025-11-20 16:47:31'),
(37, '125', 'Android', '1.0.9', '2025-12-10 17:14:40'),
(38, '131', 'Android', '1.0.8', '2025-12-16 16:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `bl_area`
--

CREATE TABLE `bl_area` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `minimum_free_delivery_order_amount` int(11) NOT NULL DEFAULT 0,
  `delivery_charges` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_brands`
--

CREATE TABLE `bl_brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` text NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_carts`
--

CREATE TABLE `bl_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `save_for_later` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_carts`
--

INSERT INTO `bl_carts` (`id`, `user_id`, `product_id`, `product_variant_id`, `qty`, `save_for_later`, `created_at`, `updated_at`) VALUES
(336, 45, 3, 106, 5, 0, NULL, '2025-11-08 14:45:43'),
(539, 12, 103, 171, 1, 0, '2025-12-03 16:05:10', NULL),
(547, 105, 83, 82, 1, 0, '2025-12-05 17:09:12', NULL),
(637, 92, 2, 111, 1, 0, '2025-12-22 15:59:51', NULL),
(642, 126, 29, 29, 1, 0, '2025-12-23 11:46:13', NULL),
(699, 133, 116, 188, 1, 0, '2025-12-24 12:56:33', NULL),
(709, 144, 18, 18, 1, 0, '2025-12-25 10:37:50', NULL),
(727, 22, 8, 8, 1, 0, '2025-12-27 16:03:09', NULL),
(744, 158, 2, 2, 1, 0, '2025-12-29 12:59:23', NULL),
(810, 37, 122, 194, 1, 0, '2026-01-04 16:22:21', NULL),
(811, 37, 2, 111, 7, 0, '2026-01-04 16:23:38', '2026-01-04 16:23:59'),
(835, 101, 122, 194, 1, 0, '2026-01-05 20:23:24', NULL),
(850, 113, 116, 188, 1, 0, '2026-01-07 10:25:25', '2026-01-07 10:28:59'),
(909, 20, 2, 2, 2, 0, '2026-01-07 18:31:57', '2026-01-07 18:32:00'),
(921, 176, 28, 126, 1, 0, '2026-01-08 12:01:44', NULL),
(932, 180, 28, 28, 2, 0, '2026-01-08 14:52:54', '2026-01-08 14:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `bl_cart_notifications`
--

CREATE TABLE `bl_cart_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_categories`
--

CREATE TABLE `bl_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL DEFAULT '0',
  `slug` varchar(191) DEFAULT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `product_rating` tinyint(4) NOT NULL DEFAULT 0,
  `web_image` text DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '0: Main Category, Other Sub category of id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_categories`
--

INSERT INTO `bl_categories` (`id`, `row_order`, `name`, `slug`, `subtitle`, `image`, `status`, `product_rating`, `web_image`, `parent_id`, `created_at`, `updated_at`, `meta_title`, `meta_keywords`, `schema_markup`, `meta_description`) VALUES
(1, 2, 'Fresh Vegetables', 'Fresh-Vegetables', 'Vegetables', 'categories/1758803118_18345.png', 1, 0, '', 0, '2025-08-12 20:43:54', '2025-10-15 12:44:49', 'null', 'null', 'null', 'null'),
(2, 3, 'Fresh Fruits', 'Fresh-Fruits', 'Fruits', 'categories/1758799572_20164.png', 1, 0, '', 0, '2025-08-13 13:07:29', '2025-10-15 12:44:49', 'null', 'null', 'null', 'null'),
(4, 5, 'Herbs & Seasonings', 'Herbs-Seasonings', 'Herbs & Seasonings', 'categories/1758799663_17765.png', 1, 0, '', 0, '2025-08-13 13:50:20', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(5, 6, 'Cuts & Sprouts', 'Cuts-Sprouts', 'Cuts & Sprouts', 'categories/1758800008_80845.png', 1, 0, '', 0, '2025-08-13 13:54:34', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(6, 11, 'Grains & Groceries', 'Grains-Groceries', 'Grains & Groceries', 'categories/1758799879_99119.png', 1, 0, '', 0, '2025-08-13 13:55:51', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(7, 7, 'Masalas & dry fruits', 'Masalas-dry-fruits', 'Masalas & dry fruits', 'categories/1758803401_38738.png', 1, 0, '', 0, '2025-08-13 13:58:07', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(9, 9, 'Exotic Fruits & Veggies', 'Exotic-Fruits-Veggies', 'exotic fruits & veggies', 'categories/1758803032_74827.png', 1, 0, '', 0, '2025-08-14 14:39:29', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(10, 14, 'Puja & Flowers  Essentials', 'Puja-Flowers-Essentials', 'flowers', 'categories/1758802433_99977.png', 1, 0, '', 0, '2025-08-14 14:48:45', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(11, 10, 'Organic Fruits & Vegetables', 'Organic-Fruits-Vegetables', 'organic fruits & vegetables', 'categories/1758801355_79228.png', 1, 0, '', 0, '2025-08-14 14:54:00', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(14, 12, 'Dairy Farm', 'Dairy-Farm', 'Dairy Farm', 'categories/1758801478_3115.png', 1, 0, '', 0, '2025-09-14 14:18:40', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(15, 13, 'Batter & Chutney', 'Batter-Chutney', 'Batter & Chutney', 'categories/1758801588_40333.png', 1, 0, '', 0, '2025-09-14 16:23:38', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(17, 1, 'View All', 'View-All', 'View All', 'categories/1760012496_89934.png', 1, 0, '', 0, '2025-10-09 11:21:19', '2025-10-15 12:44:49', 'null', 'null', 'null', 'null'),
(18, 8, 'Cold Pressed Oils', 'Cold-Pressed-Oils', 'Cold Pressed Oils', 'categories/1760512436_37009.png', 1, 0, '', 0, '2025-10-15 12:43:56', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(19, 15, 'Garden Nourish', 'Garden-Nourish', 'Garden Nourish', 'categories/1763984636_76712.png', 1, 0, '', 0, '2025-11-24 16:31:26', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null'),
(20, 4, 'Ozone Fresh Wash', 'Ozone-Fresh-Wash', 'Ozone Fresh Wash', 'categories/1767251748_59737.png', 1, 0, '', 0, '2026-01-01 12:45:48', '2026-01-01 12:46:31', 'null', 'null', 'null', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `bl_chat`
--

CREATE TABLE `bl_chat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userid` int(11) NOT NULL,
  `receiveid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=Delivery Issues, 2=Product Missing, 3=Product Complaint, 4=Feedback, 5=Complaint and Refund Status',
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_chat`
--

INSERT INTO `bl_chat` (`id`, `userid`, `receiveid`, `type`, `message`, `created_at`, `updated_at`) VALUES
(5, 10, 0, 1, 'issue', '2025-11-15 13:56:14', '2025-11-15 13:56:14'),
(6, 10, 0, 5, 'hii', '2025-11-15 13:58:19', '2025-11-15 13:58:19'),
(7, 10, 0, 5, 'sff', '2025-11-15 13:58:22', '2025-11-15 13:58:22'),
(8, 10, 0, 5, 'td', '2025-11-15 13:58:25', '2025-11-15 13:58:25'),
(9, 10, 0, 2, 'fdrh', '2025-11-15 13:58:33', '2025-11-15 13:58:33'),
(10, 10, 0, 3, 'dffvdd', '2025-11-15 13:59:44', '2025-11-15 13:59:44'),
(11, 0, 10, 3, 'gdgfbsbFbsmsnNzn. dgFvdvrh. dgarbd. sgrh. sgqrbadb svrharj', '2025-11-15 13:59:54', '2025-11-15 13:59:54'),
(12, 12, 0, 1, 'hello', '2025-11-17 14:23:25', '2025-11-17 14:23:25'),
(13, 12, 0, 1, 'hi', '2025-11-17 14:38:52', '2025-11-17 14:38:52'),
(15, 0, 12, 1, 'hyyy', '2025-11-17 15:16:22', '2025-11-17 15:16:22'),
(16, 12, 0, 4, 'hello 👋', '2025-11-17 16:08:06', '2025-11-17 16:08:06'),
(17, 12, 0, 1, 'test', '2025-11-17 16:09:55', '2025-11-17 16:09:55'),
(18, 12, 0, 1, 'gg', '2025-11-17 16:10:27', '2025-11-17 16:10:27'),
(19, 12, 0, 4, 'hi', '2025-11-17 16:40:29', '2025-11-17 16:40:29'),
(20, 16, 0, 4, 'Fresh, hygienic, and high-quality vegetables. Ecoleaf provides excellent service with timely delivery and great customer support. Truly reliable!', '2025-12-14 11:12:19', '2025-12-14 11:12:19'),
(21, 16, 0, 1, 'wrong items delivered', '2025-12-14 11:14:22', '2025-12-14 11:14:22'),
(22, 0, 16, 1, 'Sorry for the inconvenience. We have noted the issue and will replace the incorrect items as soon as possible.', '2025-12-14 11:16:38', '2025-12-14 11:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `bl_cities`
--

CREATE TABLE `bl_cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `zone` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `formatted_address` varchar(191) NOT NULL,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `min_amount_for_free_delivery` varchar(191) DEFAULT NULL,
  `delivery_charge_method` varchar(191) DEFAULT NULL,
  `fixed_charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `per_km_charge` decimal(11,2) NOT NULL DEFAULT 0.00,
  `range_wise_charges` text DEFAULT NULL,
  `time_to_travel` int(11) NOT NULL DEFAULT 0,
  `geolocation_type` varchar(191) DEFAULT NULL,
  `radius` varchar(191) DEFAULT '0',
  `boundary_points` text DEFAULT NULL,
  `max_deliverable_distance` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_cities`
--

INSERT INTO `bl_cities` (`id`, `name`, `zone`, `state`, `formatted_address`, `latitude`, `longitude`, `min_amount_for_free_delivery`, `delivery_charge_method`, `fixed_charge`, `per_km_charge`, `range_wise_charges`, `time_to_travel`, `geolocation_type`, `radius`, `boundary_points`, `max_deliverable_distance`) VALUES
(16, 'Surat', 'Yogi chowk', 'Gujarat', 'Surat, Gujarat, India', '21.1702401', '72.83106070000001', '50', 'fixed_charge', '80.00', '0.00', '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 1, 'polygon', 'undefined', '[{\"lat\":21.37540501464729,\"lng\":72.68377523857423},{\"lat\":21.395225468568363,\"lng\":72.90556173759767},{\"lat\":21.228906390312407,\"lng\":73.05456381279298},{\"lat\":21.059195670232373,\"lng\":73.00855856376954},{\"lat\":20.99061597498029,\"lng\":72.7483199163086},{\"lat\":21.202021816479068,\"lng\":72.64875631767579}]', 0),
(17, 'Surat', 'Mota varchaa', 'Gujarat', 'Surat, Gujarat, India', '21.1702401', '72.83106070000001', '200', 'fixed_charge', '30.00', '0.00', '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 1, 'polygon', 'undefined', '[{\"lat\":21.227146810534542,\"lng\":72.69390135167262},{\"lat\":21.294977366725725,\"lng\":72.84015684483668},{\"lat\":21.34167267566171,\"lng\":72.88204222081325},{\"lat\":21.25530668327621,\"lng\":73.02074461339137},{\"lat\":21.0926734484448,\"lng\":73.02692442296168},{\"lat\":21.035645557457393,\"lng\":72.85869627354762},{\"lat\":21.12278047353879,\"lng\":72.7419665372195},{\"lat\":21.227786867375393,\"lng\":72.68909483311793}]', 0),
(19, 'Hiranandani Estate', 'Hiranandani estate', 'Maharashtra', 'Hiranandani Estate, Thane West, Thane, Maharashtra, India', '19.2591372', '72.9844401', '199', 'fixed_charge', '2.00', '0.00', '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 25, 'circle', '641.654646114039', '[{\"lat\":19.260159533410015,\"lng\":72.983538877771}]', 0),
(20, 'Satara', 'satara all', 'Maharashtra', 'Satara, Maharashtra, India', '17.688671', '74.005667', '199', 'fixed_charge', '25.00', '0.00', '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 10, 'circle', '5326.305406668786', '[{\"lat\":17.694302370968533,\"lng\":74.02345541018677}]', 0),
(21, 'Mumbai', 'mumbai', 'Maharashtra', 'Mumbai, Maharashtra, India', '18.9581934', '72.8320729', '11', 'fixed_charge', '25.00', '0.00', '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 10, 'circle', '5116.036226779854', '[{\"lat\":18.963621247474784,\"lng\":72.82947652167357}]', 0),
(22, 'Powai', 'mumbai powai', 'Maharashtra', 'Powai, Mumbai, Maharashtra, India', '19.1175993', '72.9059747', '11', 'fixed_charge', '25.00', '0.00', '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 10, 'circle', '7389.834372492961', '[{\"lat\":19.127725342208848,\"lng\":72.88947375014037}]', 0),
(23, 'India', 'world', 'undefined', 'India', '20.593684', '78.96288', '10000', 'per_km_charge', '0.00', '1.00', '[{\"from_range\":\"\",\"to_range\":\"\",\"price\":\"\"}]', 1, 'circle', '19234821.50471267', '[{\"lat\":83.21656099175661,\"lng\":-138.24373320432963}]', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bl_countries`
--

CREATE TABLE `bl_countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `dial_code` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `logo` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_countries`
--

INSERT INTO `bl_countries` (`id`, `name`, `dial_code`, `code`, `logo`, `status`) VALUES
(1, 'Afghanistan', '+93', 'AF', NULL, 1),
(2, 'Aland Islands', '+358', 'AX', NULL, 1),
(3, 'Albania', '+355', 'AL', NULL, 1),
(4, 'Algeria', '+213', 'DZ', NULL, 1),
(5, 'AmericanSamoa', '+1684', 'AS', NULL, 1),
(6, 'Andorra', '+376', 'AD', NULL, 1),
(7, 'Angola', '+244', 'AO', NULL, 1),
(8, 'Anguilla', '+1264', 'AI', NULL, 1),
(9, 'Antarctica', '+672', 'AQ', NULL, 1),
(10, 'Antigua and Barbuda', '+1268', 'AG', NULL, 1),
(11, 'Argentina', '+54', 'AR', NULL, 1),
(12, 'Armenia', '+374', 'AM', NULL, 1),
(13, 'Aruba', '+297', 'AW', NULL, 1),
(14, 'Australia', '+61', 'AU', NULL, 1),
(15, 'Austria', '+43', 'AT', NULL, 1),
(16, 'Azerbaijan', '+994', 'AZ', NULL, 1),
(17, 'Bahamas', '+1242', 'BS', NULL, 1),
(18, 'Bahrain', '+973', 'BH', NULL, 1),
(19, 'Bangladesh', '+880', 'BD', NULL, 1),
(20, 'Barbados', '+1246', 'BB', NULL, 1),
(21, 'Belarus', '+375', 'BY', NULL, 1),
(22, 'Belgium', '+32', 'BE', NULL, 1),
(23, 'Belize', '+501', 'BZ', NULL, 1),
(24, 'Benin', '+229', 'BJ', NULL, 1),
(25, 'Bermuda', '+1441', 'BM', NULL, 1),
(26, 'Bhutan', '+975', 'BT', NULL, 1),
(27, 'Bolivia, Plurinational State of', '+591', 'BO', NULL, 1),
(28, 'Bosnia and Herzegovina', '+387', 'BA', NULL, 1),
(29, 'Botswana', '+267', 'BW', NULL, 1),
(30, 'Brazil', '+55', 'BR', NULL, 1),
(31, 'British Indian Ocean Territory', '+246', 'IO', NULL, 1),
(32, 'Brunei Darussalam', '+673', 'BN', NULL, 1),
(33, 'Bulgaria', '+359', 'BG', NULL, 1),
(34, 'Burkina Faso', '+226', 'BF', NULL, 1),
(35, 'Burundi', '+257', 'BI', NULL, 1),
(36, 'Cambodia', '+855', 'KH', NULL, 1),
(37, 'Cameroon', '+237', 'CM', NULL, 1),
(38, 'Canada', '+1', 'CA', NULL, 1),
(39, 'Cape Verde', '+238', 'CV', NULL, 1),
(40, 'Cayman Islands', '+345', 'KY', NULL, 1),
(41, 'Central African Republic', '+236', 'CF', NULL, 1),
(42, 'Chad', '+235', 'TD', NULL, 1),
(43, 'Chile', '+56', 'CL', NULL, 1),
(44, 'China', '+86', 'CN', NULL, 1),
(45, 'Christmas Island', '+61', 'CX', NULL, 1),
(46, 'Cocos (Keeling) Islands', '+61', 'CC', NULL, 1),
(47, 'Colombia', '+57', 'CO', NULL, 1),
(48, 'Comoros', '+269', 'KM', NULL, 1),
(49, 'Congo', '+242', 'CG', NULL, 1),
(50, 'Congo, The Democratic Republic of the Congo', '+243', 'CD', NULL, 1),
(51, 'Cook Islands', '+682', 'CK', NULL, 1),
(52, 'Costa Rica', '+506', 'CR', NULL, 1),
(53, 'Cote d\'Ivoire', '+225', 'CI', NULL, 1),
(54, 'Croatia', '+385', 'HR', NULL, 1),
(55, 'Cuba', '+53', 'CU', NULL, 1),
(56, 'Cyprus', '+357', 'CY', NULL, 1),
(57, 'Czech Republic', '+420', 'CZ', NULL, 1),
(58, 'Denmark', '+45', 'DK', NULL, 1),
(59, 'Djibouti', '+253', 'DJ', NULL, 1),
(60, 'Dominica', '+1767', 'DM', NULL, 1),
(61, 'Dominican Republic', '+1849', 'DO', NULL, 1),
(62, 'Ecuador', '+593', 'EC', NULL, 1),
(63, 'Egypt', '+20', 'EG', NULL, 1),
(64, 'El Salvador', '+503', 'SV', NULL, 1),
(65, 'Equatorial Guinea', '+240', 'GQ', NULL, 1),
(66, 'Eritrea', '+291', 'ER', NULL, 1),
(67, 'Estonia', '+372', 'EE', NULL, 1),
(68, 'Ethiopia', '+251', 'ET', NULL, 1),
(69, 'Falkland Islands (Malvinas)', '+500', 'FK', NULL, 1),
(70, 'Faroe Islands', '+298', 'FO', NULL, 1),
(71, 'Fiji', '+679', 'FJ', NULL, 1),
(72, 'Finland', '+358', 'FI', NULL, 1),
(73, 'France', '+33', 'FR', NULL, 1),
(74, 'French Guiana', '+594', 'GF', NULL, 1),
(75, 'French Polynesia', '+689', 'PF', NULL, 1),
(76, 'Gabon', '+241', 'GA', NULL, 1),
(77, 'Gambia', '+220', 'GM', NULL, 1),
(78, 'Georgia', '+995', 'GE', NULL, 1),
(79, 'Germany', '+49', 'DE', NULL, 1),
(80, 'Ghana', '+233', 'GH', NULL, 1),
(81, 'Gibraltar', '+350', 'GI', NULL, 1),
(82, 'Greece', '+30', 'GR', NULL, 1),
(83, 'Greenland', '+299', 'GL', NULL, 1),
(84, 'Grenada', '+1473', 'GD', NULL, 1),
(85, 'Guadeloupe', '+590', 'GP', NULL, 1),
(86, 'Guam', '+1671', 'GU', NULL, 1),
(87, 'Guatemala', '+502', 'GT', NULL, 1),
(88, 'Guernsey', '+44', 'GG', NULL, 1),
(89, 'Guinea', '+224', 'GN', NULL, 1),
(90, 'Guinea-Bissau', '+245', 'GW', NULL, 1),
(91, 'Guyana', '+595', 'GY', NULL, 1),
(92, 'Haiti', '+509', 'HT', NULL, 1),
(93, 'Holy See (Vatican City State)', '+379', 'VA', NULL, 1),
(94, 'Honduras', '+504', 'HN', NULL, 1),
(95, 'Hong Kong', '+852', 'HK', NULL, 1),
(96, 'Hungary', '+36', 'HU', NULL, 1),
(97, 'Iceland', '+354', 'IS', NULL, 1),
(98, 'India', '+91', 'IN', NULL, 1),
(99, 'Indonesia', '+62', 'ID', NULL, 1),
(100, 'Iran, Islamic Republic of Persian Gulf', '+98', 'IR', NULL, 1),
(101, 'Iraq', '+964', 'IQ', NULL, 1),
(102, 'Ireland', '+353', 'IE', NULL, 1),
(103, 'Isle of Man', '+44', 'IM', NULL, 1),
(104, 'Israel', '+972', 'IL', NULL, 1),
(105, 'Italy', '+39', 'IT', NULL, 1),
(106, 'Jamaica', '+1876', 'JM', NULL, 1),
(107, 'Japan', '+81', 'JP', NULL, 1),
(108, 'Jersey', '+44', 'JE', NULL, 1),
(109, 'Jordan', '+962', 'JO', NULL, 1),
(110, 'Kazakhstan', '+77', 'KZ', NULL, 1),
(111, 'Kenya', '+254', 'KE', NULL, 1),
(112, 'Kiribati', '+686', 'KI', NULL, 1),
(113, 'Korea, Democratic People\'s Republic of Korea', '+850', 'KP', NULL, 1),
(114, 'Korea, Republic of South Korea', '+82', 'KR', NULL, 1),
(115, 'Kuwait', '+965', 'KW', NULL, 1),
(116, 'Kyrgyzstan', '+996', 'KG', NULL, 1),
(117, 'Laos', '+856', 'LA', NULL, 1),
(118, 'Latvia', '+371', 'LV', NULL, 1),
(119, 'Lebanon', '+961', 'LB', NULL, 1),
(120, 'Lesotho', '+266', 'LS', NULL, 1),
(121, 'Liberia', '+231', 'LR', NULL, 1),
(122, 'Libyan Arab Jamahiriya', '+218', 'LY', NULL, 1),
(123, 'Liechtenstein', '+423', 'LI', NULL, 1),
(124, 'Lithuania', '+370', 'LT', NULL, 1),
(125, 'Luxembourg', '+352', 'LU', NULL, 1),
(126, 'Macao', '+853', 'MO', NULL, 1),
(127, 'Macedonia', '+389', 'MK', NULL, 1),
(128, 'Madagascar', '+261', 'MG', NULL, 1),
(129, 'Malawi', '+265', 'MW', NULL, 1),
(130, 'Malaysia', '+60', 'MY', NULL, 1),
(131, 'Maldives', '+960', 'MV', NULL, 1),
(132, 'Mali', '+223', 'ML', NULL, 1),
(133, 'Malta', '+356', 'MT', NULL, 1),
(134, 'Marshall Islands', '+692', 'MH', NULL, 1),
(135, 'Martinique', '+596', 'MQ', NULL, 1),
(136, 'Mauritania', '+222', 'MR', NULL, 1),
(137, 'Mauritius', '+230', 'MU', NULL, 1),
(138, 'Mayotte', '+262', 'YT', NULL, 1),
(139, 'Mexico', '+52', 'MX', NULL, 1),
(140, 'Micronesia, Federated States of Micronesia', '+691', 'FM', NULL, 1),
(141, 'Moldova', '+373', 'MD', NULL, 1),
(142, 'Monaco', '+377', 'MC', NULL, 1),
(143, 'Mongolia', '+976', 'MN', NULL, 1),
(144, 'Montenegro', '+382', 'ME', NULL, 1),
(145, 'Montserrat', '+1664', 'MS', NULL, 1),
(146, 'Morocco', '+212', 'MA', NULL, 1),
(147, 'Mozambique', '+258', 'MZ', NULL, 1),
(148, 'Myanmar', '+95', 'MM', NULL, 1),
(149, 'Namibia', '+264', 'NA', NULL, 1),
(150, 'Nauru', '+674', 'NR', NULL, 1),
(151, 'Nepal', '+977', 'NP', NULL, 1),
(152, 'Netherlands', '+31', 'NL', NULL, 1),
(153, 'Netherlands Antilles', '+599', 'AN', NULL, 1),
(154, 'New Caledonia', '+687', 'NC', NULL, 1),
(155, 'New Zealand', '+64', 'NZ', NULL, 1),
(156, 'Nicaragua', '+505', 'NI', NULL, 1),
(157, 'Niger', '+227', 'NE', NULL, 1),
(158, 'Nigeria', '+234', 'NG', NULL, 1),
(159, 'Niue', '+683', 'NU', NULL, 1),
(160, 'Norfolk Island', '+672', 'NF', NULL, 1),
(161, 'Northern Mariana Islands', '+1670', 'MP', NULL, 1),
(162, 'Norway', '+47', 'NO', NULL, 1),
(163, 'Oman', '+968', 'OM', NULL, 1),
(164, 'Pakistan', '+92', 'PK', NULL, 1),
(165, 'Palau', '+680', 'PW', NULL, 1),
(166, 'Palestinian Territory, Occupied', '+970', 'PS', NULL, 1),
(167, 'Panama', '+507', 'PA', NULL, 1),
(168, 'Papua New Guinea', '+675', 'PG', NULL, 1),
(169, 'Paraguay', '+595', 'PY', NULL, 1),
(170, 'Peru', '+51', 'PE', NULL, 1),
(171, 'Philippines', '+63', 'PH', NULL, 1),
(172, 'Pitcairn', '+872', 'PN', NULL, 1),
(173, 'Poland', '+48', 'PL', NULL, 1),
(174, 'Portugal', '+351', 'PT', NULL, 1),
(175, 'Puerto Rico', '+1939', 'PR', NULL, 1),
(176, 'Qatar', '+974', 'QA', NULL, 1),
(177, 'Romania', '+40', 'RO', NULL, 1),
(178, 'Russia', '+7', 'RU', NULL, 1),
(179, 'Rwanda', '+250', 'RW', NULL, 1),
(180, 'Reunion', '+262', 'RE', NULL, 1),
(181, 'Saint Barthelemy', '+590', 'BL', NULL, 1),
(182, 'Saint Helena, Ascension and Tristan Da Cunha', '+290', 'SH', NULL, 1),
(183, 'Saint Kitts and Nevis', '+1869', 'KN', NULL, 1),
(184, 'Saint Lucia', '+1758', 'LC', NULL, 1),
(185, 'Saint Martin', '+590', 'MF', NULL, 1),
(186, 'Saint Pierre and Miquelon', '+508', 'PM', NULL, 1),
(187, 'Saint Vincent and the Grenadines', '+1784', 'VC', NULL, 1),
(188, 'Samoa', '+685', 'WS', NULL, 1),
(189, 'San Marino', '+378', 'SM', NULL, 1),
(190, 'Sao Tome and Principe', '+239', 'ST', NULL, 1),
(191, 'Saudi Arabia', '+966', 'SA', NULL, 1),
(192, 'Senegal', '+221', 'SN', NULL, 1),
(193, 'Serbia', '+381', 'RS', NULL, 1),
(194, 'Seychelles', '+248', 'SC', NULL, 1),
(195, 'Sierra Leone', '+232', 'SL', NULL, 1),
(196, 'Singapore', '+65', 'SG', NULL, 1),
(197, 'Slovakia', '+421', 'SK', NULL, 1),
(198, 'Slovenia', '+386', 'SI', NULL, 1),
(199, 'Solomon Islands', '+677', 'SB', NULL, 1),
(200, 'Somalia', '+252', 'SO', NULL, 1),
(201, 'South Africa', '+27', 'ZA', NULL, 1),
(202, 'South Sudan', '+211', 'SS', NULL, 1),
(203, 'South Georgia and the South Sandwich Islands', '+500', 'GS', NULL, 1),
(204, 'Spain', '+34', 'ES', NULL, 1),
(205, 'Sri Lanka', '+94', 'LK', NULL, 1),
(206, 'Sudan', '+249', 'SD', NULL, 1),
(207, 'Suriname', '+597', 'SR', NULL, 1),
(208, 'Svalbard and Jan Mayen', '+47', 'SJ', NULL, 1),
(209, 'Swaziland', '+268', 'SZ', NULL, 1),
(210, 'Sweden', '+46', 'SE', NULL, 1),
(211, 'Switzerland', '+41', 'CH', NULL, 1),
(212, 'Syrian Arab Republic', '+963', 'SY', NULL, 1),
(213, 'Taiwan', '+886', 'TW', NULL, 1),
(214, 'Tajikistan', '+992', 'TJ', NULL, 1),
(215, 'Tanzania, United Republic of Tanzania', '+255', 'TZ', NULL, 1),
(216, 'Thailand', '+66', 'TH', NULL, 1),
(217, 'Timor-Leste', '+670', 'TL', NULL, 1),
(218, 'Togo', '+228', 'TG', NULL, 1),
(219, 'Tokelau', '+690', 'TK', NULL, 1),
(220, 'Tonga', '+676', 'TO', NULL, 1),
(221, 'Trinidad and Tobago', '+1868', 'TT', NULL, 1),
(222, 'Tunisia', '+216', 'TN', NULL, 1),
(223, 'Turkey', '+90', 'TR', NULL, 1),
(224, 'Turkmenistan', '+993', 'TM', NULL, 1),
(225, 'Turks and Caicos Islands', '+1649', 'TC', NULL, 1),
(226, 'Tuvalu', '+688', 'TV', NULL, 1),
(227, 'Uganda', '+256', 'UG', NULL, 1),
(228, 'Ukraine', '+380', 'UA', NULL, 1),
(229, 'United Arab Emirates', '+971', 'AE', NULL, 1),
(230, 'United Kingdom', '+44', 'GB', NULL, 1),
(231, 'United States', '+1', 'US', NULL, 1),
(232, 'Uruguay', '+598', 'UY', NULL, 1),
(233, 'Uzbekistan', '+998', 'UZ', NULL, 1),
(234, 'Vanuatu', '+678', 'VU', NULL, 1),
(235, 'Venezuela, Bolivarian Republic of Venezuela', '+58', 'VE', NULL, 1),
(236, 'Vietnam', '+84', 'VN', NULL, 1),
(237, 'Virgin Islands, British', '+1284', 'VG', NULL, 1),
(238, 'Virgin Islands, U.S.', '+1340', 'VI', NULL, 1),
(239, 'Wallis and Futuna', '+681', 'WF', NULL, 1),
(240, 'Yemen', '+967', 'YE', NULL, 1),
(241, 'Zambia', '+260', 'ZM', NULL, 1),
(242, 'Zimbabwe', '+263', 'ZW', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bl_customer_feedback`
--

CREATE TABLE `bl_customer_feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `video` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_delivery_boys`
--

CREATE TABLE `bl_delivery_boys` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `mobile` varchar(191) NOT NULL,
  `order_note` text DEFAULT NULL,
  `address` text NOT NULL,
  `bonus_type` int(11) DEFAULT 0 COMMENT '0 -> fixed/Salaried, 1 -> Commission',
  `bonus_percentage` double DEFAULT 0,
  `bonus_min_amount` double DEFAULT 0,
  `bonus_max_amount` double DEFAULT 0,
  `balance` double DEFAULT 0,
  `driving_license` text DEFAULT NULL,
  `national_identity_card` text DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bank_account_number` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `ifsc_code` text DEFAULT NULL,
  `other_payment_information` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `is_available` tinyint(4) NOT NULL DEFAULT 1,
  `fcm_id` varchar(191) DEFAULT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `cash_received` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_delivery_boys`
--

INSERT INTO `bl_delivery_boys` (`id`, `admin_id`, `city_id`, `name`, `mobile`, `order_note`, `address`, `bonus_type`, `bonus_percentage`, `bonus_min_amount`, `bonus_max_amount`, `balance`, `driving_license`, `national_identity_card`, `dob`, `bank_account_number`, `bank_name`, `account_name`, `ifsc_code`, `other_payment_information`, `status`, `is_available`, `fcm_id`, `pincode_id`, `cash_received`, `created_at`, `updated_at`, `remark`) VALUES
(7, 22, 20, 'Ulkesh', '8087864013', NULL, 'satara', 0, 0, 0, 0, 0, 'delivery_boy/driving_license/1762751645_74955.jpg', 'delivery_boy/national_identity_card/1762751645_73357.png', '2000-06-22', '4567890102', 'HDFC22', 'HDFC', 'HDFC22', NULL, 1, 1, NULL, NULL, 2316, '2025-11-03 17:53:30', '2025-12-19 14:43:46', NULL),
(8, 24, 21, 'Samir', '9876543216', NULL, 'mumbai', 0, 0, 0, 0, 0, 'delivery_boy/driving_license/1763268899_23318.jpg', 'delivery_boy/national_identity_card/1763268899_74483.jpg', '1997-07-23', '435677894', 'HDFC', 'HDFC', '23rTY', NULL, 1, 1, NULL, NULL, 0, '2025-11-16 10:24:59', '2025-11-16 10:54:01', NULL),
(9, 25, 22, 'Prakash', '987654321', NULL, 'powai mumbai', 0, 0, 0, 0, 0, 'delivery_boy/driving_license/1763270627_55406.jpg', 'delivery_boy/national_identity_card/1763270627_30920.jpg', '1997-12-16', '98765435', 'HDFC', '32145677', '56743TR', NULL, 1, 1, NULL, NULL, 0, '2025-11-16 10:53:47', '2025-11-16 10:53:47', NULL),
(11, 27, 20, 'Test Play Delivery', '9714500000', NULL, 'Test', 0, 0, 0, 0, 0, 'delivery_boy/driving_license/1763726034_19658.png', 'delivery_boy/national_identity_card/1763726034_94760.png', '1996-08-25', '45698521456325', 'SBIN1234UN', '', 'SBIN2343FV', NULL, 1, 1, NULL, NULL, 136, '2025-11-21 17:23:54', '2025-12-04 10:56:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_delivery_boy_notifications`
--

CREATE TABLE `bl_delivery_boy_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `message` text NOT NULL,
  `type` varchar(191) NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_delivery_boy_transactions`
--

CREATE TABLE `bl_delivery_boy_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `status` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_delivery_boy_transactions`
--

INSERT INTO `bl_delivery_boy_transactions` (`id`, `user_id`, `order_id`, `delivery_boy_id`, `type`, `amount`, `status`, `message`, `transaction_date`, `created_at`, `updated_at`) VALUES
(1, 36, 7, 7, 'COD', 98, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-04 11:59:53', '2025-11-04 11:59:53', '2025-11-04 11:59:53'),
(2, 40, 9, 7, 'COD', 38, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-04 14:57:25', '2025-11-04 14:57:25', '2025-11-04 14:57:25'),
(3, 11, 21, 7, 'COD', 38, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-06 18:37:23', '2025-11-06 18:37:23', '2025-11-06 18:37:23'),
(4, 16, 38, 7, 'COD', 75, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-07 12:37:03', '2025-11-07 12:37:03', '2025-11-07 12:37:03'),
(5, 10, 42, 7, 'COD', 20, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-07 12:56:09', '2025-11-07 12:56:09', '2025-11-07 12:56:09'),
(6, 38, 53, 7, 'COD', 30, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-11 10:39:47', '2025-11-11 10:39:47', '2025-11-11 10:39:47'),
(7, 11, 56, 7, 'COD', 294, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-13 18:57:43', '2025-11-13 18:57:43', '2025-11-13 18:57:43'),
(8, 16, 63, 7, 'COD', 90, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-15 17:25:20', '2025-11-15 17:25:20', '2025-11-15 17:25:20'),
(9, 16, 64, 7, 'COD', 175, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-15 17:46:03', '2025-11-15 17:46:03', '2025-11-15 17:46:03'),
(10, 16, 65, 7, 'COD', 90, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-15 17:57:28', '2025-11-15 17:57:28', '2025-11-15 17:57:28'),
(11, 10, 41, 1, 'COD', 20, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-18 11:10:40', '2025-11-18 11:10:40', '2025-11-18 11:10:40'),
(12, 16, 81, 7, 'COD', 85, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-20 11:28:41', '2025-11-20 11:28:41', '2025-11-20 11:28:41'),
(13, 16, 83, 7, 'COD', 85, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-20 12:22:54', '2025-11-20 12:22:54', '2025-11-20 12:22:54'),
(14, 0, 0, 1, 'delivery_boy_cash_collection', 40, 'success', 'received test', '2025-11-20 03:35:00', '2025-11-20 15:35:51', '2025-11-20 15:35:51'),
(15, 10, 35, 1, 'COD', 64, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-20 15:48:21', '2025-11-20 15:48:21', '2025-11-20 15:48:21'),
(16, 16, 92, 7, 'COD', 86, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-20 17:23:34', '2025-11-20 17:23:34', '2025-11-20 17:23:34'),
(17, 16, 107, 7, 'COD', 85, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-11-24 12:48:47', '2025-11-24 12:48:47', '2025-11-24 12:48:47'),
(18, 16, 117, 11, 'COD', 80, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:39:33', '2025-12-04 10:39:33', '2025-12-04 10:39:33'),
(19, 16, 118, 7, 'COD', 80, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:40:12', '2025-12-04 10:40:12', '2025-12-04 10:40:12'),
(20, 16, 115, 11, 'COD', 20, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:55:51', '2025-12-04 10:55:51', '2025-12-04 10:55:51'),
(21, 16, 116, 7, 'COD', 85, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:56:07', '2025-12-04 10:56:07', '2025-12-04 10:56:07'),
(22, 16, 113, 11, 'COD', 36, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:56:40', '2025-12-04 10:56:40', '2025-12-04 10:56:40'),
(23, 16, 114, 7, 'COD', 36, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:56:56', '2025-12-04 10:56:56', '2025-12-04 10:56:56'),
(24, 16, 111, 11, 'COD', 0, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:57:30', '2025-12-04 10:57:30', '2025-12-04 10:57:30'),
(25, 16, 112, 7, 'COD', 36, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:57:48', '2025-12-04 10:57:48', '2025-12-04 10:57:48'),
(26, 16, 104, 7, 'COD', 85, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:58:55', '2025-12-04 10:58:55', '2025-12-04 10:58:55'),
(27, 16, 103, 7, 'COD', 75, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 10:59:53', '2025-12-04 10:59:53', '2025-12-04 10:59:53'),
(28, 16, 120, 7, 'COD', 80, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-04 11:00:36', '2025-12-04 11:00:36', '2025-12-04 11:00:36'),
(29, 15, 134, 7, 'COD', 116, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-19 13:54:07', '2025-12-19 13:54:07', '2025-12-19 13:54:07'),
(30, 118, 139, 7, 'COD', 196, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-19 14:41:39', '2025-12-19 14:41:39', '2025-12-19 14:41:39'),
(31, 117, 136, 7, 'COD', 238, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-19 14:43:46', '2025-12-19 14:43:46', '2025-12-19 14:43:46'),
(32, 117, 135, 7, 'COD', 0, 'success', 'Delivery boy Delivered this order. Order payment method was COD', '2025-12-19 15:46:04', '2025-12-19 15:46:04', '2025-12-19 15:46:04');

-- --------------------------------------------------------

--
-- Table structure for table `bl_devices`
--

CREATE TABLE `bl_devices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fcm_id` varchar(191) NOT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_emails`
--

CREATE TABLE `bl_emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_email_templates`
--

CREATE TABLE `bl_email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_email_templates`
--

INSERT INTO `bl_email_templates` (`id`, `title`, `message`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Unlock 20% Off – Just for You!', 'Hi [First Name],\nWe’re excited to offer you an exclusive 20% discount on our most popular items! Don’t miss out – this special offer is only valid until [Date].\n\nClick below to shop and save:\n[Link Here]\n\nHurry, your discount awaits!', 'Exclusive Discount Offer', '2025-08-12 12:01:24', '2025-08-12 12:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `bl_failed_jobs`
--

CREATE TABLE `bl_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_faqs`
--

CREATE TABLE `bl_faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` char(191) DEFAULT '1',
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_faqs`
--

INSERT INTO `bl_faqs` (`id`, `question`, `answer`, `status`, `seller_id`) VALUES
(5, 'What areas do you deliver to?', 'We currently deliver to Satara, Pune. If your area isn’t listed, please contact us, and we’ll try to accommodate your request.', '1', NULL),
(6, 'Do you charge for delivery?', 'We offer free delivery on orders over Rs.299/-', '1', NULL),
(7, 'What is Ecoleaf?', 'Ecoleaf is a fresh-produce delivery project that brings farm-fresh vegetables, fruits, groceries, and natural products directly from farmers to your doorstep.', '1', NULL),
(8, 'What are your delivery timings?', 'We offer multiple delivery slots for your convenience. Please visit the checkout page and choose the time that works best for you.', '1', NULL),
(9, 'Can I track my delivery?', 'Yes, you can track your delivery. Just go to All Orders and select your order to view its status.', '1', NULL),
(10, 'Can I change the delivery address of my order ?', 'At the moment, we don’t offer the option to change the delivery address after an order is placed. We can deliver only to the address selected during checkout. However, you may cancel the order before it is out for delivery and place a new order with the correct address.', '1', NULL),
(11, 'What if I don\'t receive my order by the scheduled time?', 'Sometimes, unexpected issues may cause a delay in your delivery. If this happens, our customer support team will inform you about the updated delivery time.', '1', NULL),
(12, 'Can I schedule an order to my convenience?', 'Yes, you can schedule your order at your convenience by choosing from the available delivery slots. However, once an order is placed, it cannot be rescheduled.', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_farm_preneurs`
--

CREATE TABLE `bl_farm_preneurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `address` text DEFAULT NULL,
  `total_area` varchar(191) DEFAULT NULL,
  `area_under_cultivation` varchar(191) DEFAULT NULL,
  `crop_cycle` varchar(191) DEFAULT NULL,
  `agriculture_method` varchar(191) DEFAULT NULL,
  `farmer_information` text DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_favorites`
--

CREATE TABLE `bl_favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_favorites`
--

INSERT INTO `bl_favorites` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 36, 60, '2025-11-03 18:15:49', '2025-11-03 18:15:49'),
(2, 36, 3, '2025-11-03 18:15:49', '2025-11-03 18:15:49'),
(3, 36, 2, '2025-11-03 18:15:49', '2025-11-03 18:15:49'),
(4, 16, 60, '2025-11-03 18:17:43', '2025-11-03 18:17:43'),
(5, 37, 2, '2025-11-03 19:12:57', '2025-11-03 19:12:57'),
(6, 11, 28, '2025-11-04 08:55:26', '2025-11-04 08:55:26'),
(7, 11, 3, '2025-11-04 08:55:26', '2025-11-04 08:55:26'),
(8, 11, 2, '2025-11-04 08:55:26', '2025-11-04 08:55:26'),
(9, 13, 28, '2025-11-04 09:08:33', '2025-11-04 09:08:33'),
(10, 13, 3, '2025-11-04 09:08:33', '2025-11-04 09:08:33'),
(11, 40, 3, '2025-11-04 10:35:49', '2025-11-04 10:35:49'),
(12, 41, 2, '2025-11-04 11:17:29', '2025-11-04 11:17:29'),
(13, 10, 28, '2025-11-04 16:04:24', '2025-11-04 16:04:24'),
(14, 10, 3, '2025-11-04 16:04:24', '2025-11-04 16:04:24'),
(15, 10, 2, '2025-11-04 17:32:16', '2025-11-04 17:32:16'),
(16, 44, 28, '2025-11-06 11:01:44', '2025-11-06 11:01:44'),
(17, 44, 3, '2025-11-06 11:01:44', '2025-11-06 11:01:44'),
(18, 24, 3, '2025-11-06 14:37:00', '2025-11-06 14:37:00'),
(19, 46, 3, '2025-11-06 15:39:47', '2025-11-06 15:39:47'),
(20, 45, 3, '2025-11-06 17:21:40', '2025-11-06 17:21:40'),
(21, 47, 3, '2025-11-06 18:20:14', '2025-11-06 18:20:14'),
(22, 49, 3, '2025-11-06 19:01:19', '2025-11-06 19:01:19'),
(23, 24, 2, '2025-11-07 09:42:05', '2025-11-07 09:42:05'),
(24, 16, 28, '2025-11-07 12:30:49', '2025-11-07 12:30:49'),
(25, 52, 2, '2025-11-07 16:48:38', '2025-11-07 16:48:38'),
(26, 40, 2, '2025-11-07 20:28:01', '2025-11-07 20:28:01'),
(27, 40, 28, '2025-11-07 20:28:01', '2025-11-07 20:28:01'),
(28, 38, 2, '2025-11-10 18:18:33', '2025-11-10 18:18:33'),
(29, 80, 28, '2025-11-11 12:49:37', '2025-11-11 12:49:37'),
(30, 16, 2, '2025-11-12 08:02:32', '2025-11-12 08:02:32'),
(31, 11, 103, '2025-11-13 04:56:01', '2025-11-13 04:56:01'),
(32, 11, 92, '2025-11-13 04:56:01', '2025-11-13 04:56:01'),
(33, 11, 83, '2025-11-13 04:56:01', '2025-11-13 04:56:01'),
(34, 10, 103, '2025-11-13 15:23:33', '2025-11-13 15:23:33'),
(35, 83, 83, '2025-11-14 15:24:27', '2025-11-14 15:24:27'),
(36, 16, 103, '2025-11-15 15:49:20', '2025-11-15 15:49:20'),
(37, 16, 92, '2025-11-15 17:27:22', '2025-11-15 17:27:22'),
(38, 16, 83, '2025-11-16 10:55:43', '2025-11-16 10:55:43'),
(39, 78, 28, '2025-11-17 11:34:22', '2025-11-17 11:34:22'),
(40, 78, 83, '2025-11-17 12:40:00', '2025-11-17 12:40:00'),
(41, 31, 103, '2025-11-20 11:04:03', '2025-11-20 11:04:03'),
(42, 10, 83, '2025-11-20 15:54:36', '2025-11-20 15:54:36'),
(43, 10, 53, '2025-11-20 16:29:15', '2025-11-20 16:29:15'),
(44, 88, 83, '2025-11-20 16:46:59', '2025-11-20 16:46:59'),
(45, 16, 53, '2025-11-20 17:21:10', '2025-11-20 17:21:10'),
(46, 74, 103, '2025-11-20 18:12:43', '2025-11-20 18:12:43'),
(47, 91, 103, '2025-11-20 21:46:57', '2025-11-20 21:46:57'),
(48, 91, 83, '2025-11-20 21:46:57', '2025-11-20 21:46:57'),
(49, 91, 53, '2025-11-20 21:46:57', '2025-11-20 21:46:57'),
(50, 13, 103, '2025-11-21 10:33:46', '2025-11-21 10:33:46'),
(51, 13, 83, '2025-11-21 10:33:46', '2025-11-21 10:33:46'),
(52, 80, 103, '2025-11-25 05:40:48', '2025-11-25 05:40:48'),
(53, 97, 83, '2025-11-26 14:53:33', '2025-11-26 14:53:33'),
(54, 16, 25, '2025-11-28 15:29:43', '2025-11-28 15:29:43'),
(55, 16, 3, '2025-11-28 16:43:02', '2025-11-28 16:43:02'),
(56, 104, 28, '2025-12-02 13:36:03', '2025-12-02 13:36:03'),
(57, 74, 92, '2025-12-10 17:13:50', '2025-12-10 17:13:50'),
(58, 10, 113, '2025-12-10 17:21:03', '2025-12-10 17:21:03'),
(59, 16, 113, '2025-12-10 17:23:37', '2025-12-10 17:23:37'),
(60, 113, 103, '2025-12-14 10:42:27', '2025-12-14 10:42:27'),
(61, 116, 103, '2025-12-17 14:25:35', '2025-12-17 14:25:35'),
(62, 15, 92, '2025-12-17 16:53:00', '2025-12-17 16:53:00'),
(63, 15, 113, '2025-12-17 16:53:00', '2025-12-17 16:53:00'),
(64, 117, 83, '2025-12-18 12:26:46', '2025-12-18 12:26:46'),
(65, 117, 2, '2025-12-18 12:26:46', '2025-12-18 12:26:46'),
(66, 117, 28, '2025-12-18 13:08:52', '2025-12-18 13:08:52'),
(67, 118, 83, '2025-12-18 13:28:50', '2025-12-18 13:28:50'),
(68, 118, 2, '2025-12-18 13:28:50', '2025-12-18 13:28:50'),
(69, 118, 28, '2025-12-18 13:28:50', '2025-12-18 13:28:50'),
(70, 118, 113, '2025-12-18 14:42:32', '2025-12-18 14:42:32'),
(71, 119, 83, '2025-12-19 12:54:28', '2025-12-19 12:54:28'),
(72, 16, 116, '2025-12-20 12:12:38', '2025-12-20 12:12:38'),
(73, 74, 28, '2025-12-22 16:29:18', '2025-12-22 16:29:18'),
(74, 74, 18, '2025-12-22 16:29:18', '2025-12-22 16:29:18'),
(75, 74, 2, '2025-12-22 16:29:18', '2025-12-22 16:29:18'),
(76, 74, 83, '2025-12-22 16:29:18', '2025-12-22 16:29:18'),
(77, 91, 18, '2025-12-24 03:26:42', '2025-12-24 03:26:42'),
(78, 91, 16, '2025-12-24 03:26:42', '2025-12-24 03:26:42'),
(79, 91, 29, '2025-12-24 03:26:42', '2025-12-24 03:26:42'),
(80, 91, 12, '2025-12-24 03:26:42', '2025-12-24 03:26:42'),
(81, 91, 2, '2025-12-24 03:26:42', '2025-12-24 03:26:42'),
(82, 91, 28, '2025-12-24 03:26:42', '2025-12-24 03:26:42'),
(83, 154, 2, '2025-12-27 13:41:19', '2025-12-27 13:41:19'),
(84, 16, 18, '2025-12-27 15:46:37', '2025-12-27 15:46:37'),
(85, 86, 116, '2025-12-27 17:06:00', '2025-12-27 17:06:00'),
(86, 16, 115, '2025-12-28 11:12:36', '2025-12-28 11:12:36'),
(87, 16, 122, '2026-01-01 17:09:20', '2026-01-01 17:09:20'),
(88, 155, 116, '2026-01-03 13:40:28', '2026-01-03 13:40:28'),
(89, 155, 103, '2026-01-03 16:32:50', '2026-01-03 16:32:50'),
(90, 155, 83, '2026-01-03 16:41:05', '2026-01-03 16:41:05'),
(91, 16, 121, '2026-01-04 11:05:59', '2026-01-04 11:05:59'),
(93, 10, 116, '2026-01-07 10:59:15', '2026-01-07 10:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `bl_feature_products`
--

CREATE TABLE `bl_feature_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `special` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_feature_products`
--

INSERT INTO `bl_feature_products` (`id`, `title`, `image`, `category_id`, `created_at`, `updated_at`, `special`) VALUES
(4, 'Tomatoes Special Offer', 'https://admin.ecofresh.in/storage/feature_products/1762172637_93362.jpg', 1, '2025-11-03 17:18:27', '2025-11-08 14:26:34', 1),
(5, 'Fresh Potato', 'https://admin.ecofresh.in/storage/feature_products/1762335671_16612.jpg', 1, '2025-11-03 17:19:54', '2025-11-05 15:11:11', 0),
(6, 'Go Guava', 'https://admin.ecofresh.in/storage/feature_products/1762605325_15305.jpg', 2, '2025-11-03 17:21:37', '2025-11-09 10:35:02', 1),
(7, 'Banana Corner', 'https://admin.ecofresh.in/storage/feature_products/1762604574_41576.jpg', 2, '2025-11-03 17:23:32', '2025-11-08 17:54:49', 1),
(8, 'Fresh Garlic', 'https://admin.ecofresh.in/storage/feature_products/1762334938_96952.jpg', 4, '2025-11-03 17:27:41', '2025-11-05 15:18:57', 0),
(9, 'Fresh Onion', 'https://admin.ecofresh.in/storage/feature_products/1762335137_89739.jpg', 1, '2025-11-03 17:51:36', '2025-11-05 15:02:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bl_fund_transfers`
--

CREATE TABLE `bl_fund_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL COMMENT 'credit | debit',
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_fund_transfers`
--

INSERT INTO `bl_fund_transfers` (`id`, `delivery_boy_id`, `type`, `opening_balance`, `closing_balance`, `amount`, `status`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'credit', 0, 0.38, 0.38, '1', '', '2025-08-23 14:33:37', '2025-08-23 14:33:37'),
(2, 1, 'credit', 0.38, 2.18, 1.8, '1', '', '2025-10-10 13:34:55', '2025-10-10 13:34:55'),
(3, 4, 'credit', 0, 3.27, 3.27, '1', '', '2025-10-12 13:41:30', '2025-10-12 13:41:30'),
(4, 4, 'credit', 3.27, 3.27, 0, '1', '', '2025-10-15 14:49:49', '2025-10-15 14:49:49'),
(5, 4, 'credit', 3.27, 3.39, 0.12, '1', '', '2025-10-15 15:02:42', '2025-10-15 15:02:42'),
(6, 1, 'credit', 2.18, 2.78, 0.6, '1', '', '2025-10-15 17:59:13', '2025-10-15 17:59:13'),
(7, 4, 'credit', 3.39, 3.39, 0, '1', '', '2025-10-17 14:31:26', '2025-10-17 14:31:26'),
(8, 4, 'credit', 3.39, 3.39, 0, '1', '', '2025-10-17 16:01:45', '2025-10-17 16:01:45'),
(9, 4, 'credit', 3.39, 3.39, 0, '1', '', '2025-10-17 16:37:06', '2025-10-17 16:37:06'),
(10, 4, 'credit', 3.39, 3.39, 0, '1', '', '2025-10-17 18:37:41', '2025-10-17 18:37:41'),
(11, 4, 'credit', 3.39, 3.39, 0, '1', '', '2025-10-25 11:51:36', '2025-10-25 11:51:36'),
(12, 4, 'credit', 3.39, 3.39, 0, '1', '', '2025-10-27 17:23:14', '2025-10-27 17:23:14'),
(13, 1, 'credit', 2.78, 2.78, 0, '1', '', '2025-11-18 11:10:40', '2025-11-18 11:10:40'),
(14, 1, 'credit', 2.78, 2.78, 0, '1', '', '2025-11-20 15:48:21', '2025-11-20 15:48:21'),
(15, 1, 'credit', 2.78, 2.78, 0, '1', '', '2025-11-20 15:49:47', '2025-11-20 15:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `bl_invoice`
--

CREATE TABLE `bl_invoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_date` date NOT NULL,
  `order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `order_date` datetime NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `order_list` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `discount` varchar(191) NOT NULL,
  `total_sale` varchar(191) NOT NULL,
  `shipping_charge` varchar(191) NOT NULL,
  `payment` text NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_jobs`
--

CREATE TABLE `bl_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_languages`
--

CREATE TABLE `bl_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supported_language_id` int(11) DEFAULT 0,
  `system_type` int(11) NOT NULL COMMENT '1 => Customer App, 2 => Seller and delivery boy App, 3 => Website, 4 => Admin panel',
  `json_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_data`)),
  `display_name` varchar(191) DEFAULT NULL,
  `is_default` int(11) DEFAULT 0 COMMENT '0 => No, 1 => Yes',
  `status` int(11) DEFAULT 1 COMMENT '0 => Deactive, 1 => Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_languages`
--

INSERT INTO `bl_languages` (`id`, `supported_language_id`, `system_type`, `json_data`, `display_name`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(2, 16, 3, '{\"app_name\":\"EcoLeaf\",\"intro_title_1\":\"Set Your Delivery Location for Speedy Grocery Delivery.\",\"intro_title_2\":\"Discover Fresh Finds. Fill Your Cart with Everything You Need.\",\"intro_title_3\":\"Your Groceries Await Freshness Delivered to Your Doorstep.\",\"intro_description_1\":\"Pinpoint your exact location for superfast grocery delivery. We\'ll bring your order right to your doorstep!\",\"intro_description_2\":\"Explore thousands of fresh products. Add your favorites to cart, checkout with ease, and let us handle the rest!\",\"intro_description_3\":\"Relax and unwind while we bring your groceries to you. Track your order and get ready to enjoy your fresh haul!\",\"get_started\":\"Get Started\",\"skip_login\":\"Skip\",\"login\":\"Login\",\"welcome\":\"Login to\",\"login_message1\":\"Quick login or sign up with\",\"phone_number\":\"Phone Number\",\"apple\":\"Apple\",\"google\":\"Google\",\"agreement_message_1\":\"By continuing, you agree to EcoLeaf\'s\",\"terms_of_service\":\"Terms of Service\",\"privacy_policy\":\"Privacy Policy\",\"policies\":\"Policies\",\"and\":\"and\",\"enter_valid_mobile\":\"Enter valid mobile number\",\"check_internet\":\"Check Internet Connection\",\"something_went_wrong\":\"Something Went Wrong\",\"enter_verification_code\":\"Verification Code\",\"otp_send_message\":\"We have sent a verification code to\",\"verify_and_proceed\":\"Verify and Proceed\",\"resend_otp_in\":\"Resend otp in\",\"resend_otp\":\"Resend OTP\",\"enter_otp\":\"Enter OTP\",\"enter_valid_otp\":\"Please enter valid OTP\",\"profile_updated_successfully\":\"Profile updated successfully!\",\"profile\":\"Profile\",\"all_orders\":\"All Orders\",\"address\":\"Address\",\"change_theme\":\"Change Theme\",\"change_language\":\"Change Language\",\"select_location\":\"Select Location\",\"product_detail\":\"Product Detail\",\"how_it_works\":\"How it works\",\"notification\":\"Notification\",\"empty_active_orders_message\":\"No Active Orders\",\"empty_active_orders_description\":\"Currently, there are no active orders.\",\"empty_previous_orders_message\":\"No Previous Orders\",\"empty_previous_orders_description\":\"Currently, there are no previous orders.\",\"empty_notification_list_message\":\"No Notification\",\"empty_notification_list_description\":\"You have no notification right now come back later.\",\"empty_wish_list_message\":\"Re-Order is Empty\",\"empty_wish_list_description\":\"Create your personalized collection of must-haves !!\",\"empty_product_list_message\":\"Sorry!\",\"empty_product_list_description\":\"We couldn\'t find what you\'re looking for. Please try again.\",\"enter_text_to_search_the_products\":\"Enter text to search the products!\",\"does_not_delivery_long_message\":\"We doesn\'t delivery at selected city!\",\"sorry\":\"Sorry!\",\"change_location\":\"Change Location\",\"transaction_history\":\"Transaction History\",\"refer_and_earn\":\"Refer and Earn\",\"contact_us\":\"Contact Us\",\"about_us\":\"About Us\",\"rate_us\":\"Rate Us\",\"share_app\":\"Share App\",\"faq\":\"FAQ\",\"transactions\":\"Transactions\",\"terms_and_conditions\":\"Terms & Conditions\",\"logout\":\"Logout\",\"register\":\"Register\",\"edit_profile\":\"Edit Profile\",\"enter_valid_email\":\"Enter valid email\",\"user_name\":\"User Name\",\"enter_user_name\":\"Enter User Name\",\"email\":\"Email\",\"mobile_number\":\"Mobile Number\",\"invite_friends_to_signup\":\"Invite to your friend to signup\",\"friends_download_app\":\"Your friend download app\",\"friends_place_first_order\":\"Your friend place first order\",\"you_will_get_reward_after_delivered\":\"After first order delivered, you will get reward\",\"your_referral_code\":\"Your referral code\",\"refer_now\":\"Refer Now\",\"tap_to_copy\":\"Tap To Copy\",\"refer_code_copied\":\"Refer Code Copied to clipboard\",\"profile_info\":\"Profile Info\",\"tell_us_about_you\":\"Tell us a little about you\",\"profile_info_description\":\"This is an initial information of you, don\'t worry you can change it anytime.\",\"referral_code\":\"Referral Code (optional)\",\"save_info\":\"Save Info\",\"place_order\":\"Place Order\",\"addresses\":\"Addresses\",\"add_new_address\":\"Add New Address\",\"select_delivery_location\":\"Select Your Delivery Location\",\"use_my_current_location\":\"Use my current location\",\"or\":\"or\",\"type_location_manually\":\"Type Location Manually\",\"confirm_location\":\"Confirm Location\",\"select_your_location\":\"Select Your Location\",\"change\":\"Change\",\"recent_searches\":\"Recent Searches\",\"recent_searches_clear\":\"Clear\",\"accept_terms_and_condition\":\"Accept Terms & Conditions\",\"address_detail\":\"Address Detail\",\"contact_details\":\"Contact Details\",\"name\":\"Name\",\"enter_name\":\"Enter Name\",\"alternate_mobile_number\":\"Alternate Mobile No\",\"address_details\":\"Address Details\",\"enter_address\":\"Enter Address\",\"landmark\":\"Landmark\",\"enter_landmark\":\"Enter Landmark\",\"city\":\"City\",\"enter_city\":\"Enter City\",\"area\":\"Area\",\"enter_area\":\"Enter Area\",\"pin_code\":\"PinCode\",\"enter_pin_code\":\"Enter PinCode\",\"state\":\"State\",\"enter_state\":\"Enter State\",\"country\":\"Country\",\"enter_country\":\"Enter Country\",\"address_type\":\"Address Type\",\"address_type_home\":\"Home\",\"address_type_office\":\"Office\",\"address_type_other\":\"Other\",\"set_as_default_address\":\"Set as a default address\",\"delivery_to\":\"Deliver to\",\"delivered_at\":\"Delivered at\",\"home_search_hint\":\"What would you buy today?\",\"product_search_hint\":\"Search Products\",\"see_all\":\"Show All\",\"shop_by\":\"Shop by\",\"categories\":\"Categories\",\"products\":\"Products\",\"all\":\"All\",\"filter\":\"Filter\",\"sort_by\":\"Sort By\",\"share\":\"Share\",\"wish_list\":\"Re-Order\",\"list_view\":\"List View\",\"grid_view\":\"Grid View\",\"search\":\"Search\",\"search_result_for\":\"Search result for\",\"search_empty_message_title\":\"No result to show\",\"search_empty_message_description\":\"Please check spelling or try different keywords.\",\"return_and_exchanges_policy\":\"Returns & Exchanges Policy\",\"shopping_policy\":\"Shipping Policy\",\"cancellation_policy\":\"Cancellation Policy\",\"go_to_product\":\"Go to product\",\"go_to_category\":\"Go to category\",\"share_app_message\":\"Take a Look at EcoLeaf \\n\",\"refer_and_earn_share_prefix_message\":\"I have earned money using EcoLeaf app.\\nYou can also earn money by downloading app from given link\\nDon\'t forgot to enter referral code while registration -\",\"refer_and_earn_share_display_message_1_prefix\":\"Refer a friend and earn up to\",\"refer_and_earn_share_display_message_1_postfix\":\"when your friend\'s first order is successfully delivered.\",\"refer_and_earn_share_display_message_2\":\"Minimum order amount should be\",\"refer_and_earn_share_display_message_3\":\"Which allows you to earn up to\",\"out_of_stock\":\"Out of stock\",\"go_to_cart\":\"Go to cart\",\"cart\":\"Cart\",\"empty_cart_list_message\":\"Cart is Empty\",\"empty_cart_list_description\":\"It seems like you haven\'t added anything to your cart yet!\",\"empty_cart_list_button_name\":\"Shop Now\",\"cancel\":\"Cancel\",\"orders_history\":\"Orders history\",\"active_orders\":\"Active orders\",\"previous_orders\":\"Previous orders\",\"order\":\"Order\",\"placed_order_on\":\"Placed order on\",\"view_details\":\"View details\",\"total\":\"Total\",\"track_my_order\":\"Track order\",\"order_tracking\":\"Order tracking\",\"order_confirmed\":\"Order confirmed\",\"order_shipped\":\"Order shipped\",\"order_out_for_delivery\":\"Order out for delivery\",\"order_delivered\":\"Order delivered\",\"order_summary\":\"Order summary\",\"items\":\"Items\",\"delivery_information\":\"Delivery information\",\"billing_details\":\"Billing details\",\"payment_method\":\"Payment Method\",\"transaction_id\":\"Transaction id\",\"id\":\"ID\",\"date_and_time\":\"Date & Time\",\"amount\":\"Amount\",\"voice_search_product_message\":\"Hold mic and speak to search\",\"sure_to_cancel_product\":\"Are you sure, you want to cancel this product?\",\"sure_to_return_product\":\"Are you sure, you want to return this product?\",\"sure_to_return_order\":\"Are you sure, you want to return this order?\",\"sure_to_cancel_order\":\"Are you sure, you want to cancel this order?\",\"no\":\"No\",\"yes\":\"Yes\",\"unable_to_return_product\":\"Unable to return product\",\"unable_to_cancel_product\":\"Unable to cancel product\",\"unable_to_return_order\":\"Unable to return order\",\"unable_to_cancel_order\":\"Unable to cancel order\",\"change_coupon\":\"Change Coupon\",\"coupon\":\"Coupon\",\"discount\":\"Discount\",\"coupon_applied\":\"Coupon Applied\",\"you_saved\":\"You Saved\",\"with_this_promo_code\":\"with this promo code\",\"clean_all\":\"Clear All\",\"apply\":\"Apply\",\"subtotal\":\"Subtotal\",\"item\":\"Item\",\"proceed_to_checkout\":\"Proceed to Checkout\",\"login_to_checkout\":\"Login to Checkout\",\"apply_discount_code\":\"Apply Discount Code\",\"promo_codes\":\"Promo Codes\",\"applied\":\"Applied\",\"no_address_found_title\":\"No Address Found\",\"no_faq_found_title\":\"No FAQ Found!\",\"no_faq_found_message\":\"Not added any frequently asked questions!\",\"return1\":\"Return\",\"no_address_found_description\":\"You have no any delivery location add delivery address first.\",\"delete_address\":\"Delete Address\",\"please_select_address_from_map\":\"Please select address from map!\",\"checkout\":\"Checkout\",\"delivery_charge\":\"Delivery Charge\",\"seller_wise_delivery_charges_details\":\"Seller wise delivery charges detail\",\"preferred_delivery_date_time\":\"Preferred Delivery Date & Time\",\"required_login_message_for_cart\":\"Oops! You need to login first to add items into cart!\",\"required_login_message_for_wish_list\":\"Oops! You need to login first to add items into wishlist!\",\"required_login_message_for_cart_redirect\":\"Oops! You need to login first to access the cart!\",\"hide_details\":\"Hide\",\"show_details\":\"Show\",\"maximum_products_quantity_limit_reached_message\":\"Apologies, maximum product quantity limit reached!\",\"out_of_stock_message\":\"Oops, limited stock available!\",\"order_place_message\":\"Order Placed!\",\"order_place_description\":\"Your Order has been successfully placed.\",\"cash_on_delivery\":\"Cash On Delivery\",\"razorpay\":\"Razorpay\",\"paystack\":\"Paystack\",\"stripe\":\"Stripe \",\"by\":\"By\",\"continue_shopping\":\"Continue Shopping\",\"view_all_orders\":\"View All Orders\",\"logout_title\":\"Logout!\",\"logout_message\":\"Are you sure?\\nYou want to logout?\",\"delete_user_account\":\"Delete Account\",\"delete_user_title\":\"Delete account!\",\"delete_user_message\":\"Are you sure?\\nYou want to delete account?\\nYou will not undone once delete account!\",\"ok\":\"OK\",\"voice_to_search_product\":\"Search by voice\",\"home_bottom_menu_home\":\"Home\",\"home_bottom_menu_category\":\"Category\",\"home_bottom_menu_wishlist\":\"Re-Order\",\"home_bottom_menu_profile\":\"Profile\",\"theme_display_names_system_default\":\"System Default\",\"theme_display_names_light\":\"Light\",\"theme_display_names_dark\":\"Dark\",\"week_days_names_sunday\":\"Sun\",\"week_days_names_monday\":\"Mon\",\"week_days_names_tuesday\":\"Tues\",\"week_days_names_wednesday\":\"Wed\",\"week_days_names_thursday\":\"Thu\",\"week_days_names_friday\":\"Fri\",\"week_days_names_saturday\":\"Sat\",\"months_names_january\":\"January\",\"months_names_february\":\"February\",\"months_names_march\":\"March\",\"months_names_april\":\"April\",\"months_names_may\":\"May\",\"months_names_june\":\"June\",\"months_names_july\":\"July\",\"months_names_august\":\"August\",\"months_names_september\":\"September\",\"months_names_october\":\"October\",\"months_names_november\":\"November\",\"months_names_december\":\"December\",\"order_status_display_names_awaiting_payment\":\"Awaiting Payment\",\"order_status_display_names_received\":\"Received\",\"order_status_display_names_processed\":\"Processed\",\"order_status_display_names_shipped\":\"Shipped\",\"order_status_display_names_out_for_delivery\":\"Out for Delivery\",\"order_status_display_names_delivered\":\"Delivered\",\"order_status_display_names_cancelled\":\"Cancelled\",\"order_status_display_names_returned\":\"Returned\",\"sorting_display_list_default\":\"Default\",\"sorting_display_list_newest_first\":\"Newest First\",\"sorting_display_list_oldest_first\":\"Oldest First\",\"sorting_display_list_price_high_to_low\":\"Price - High to Low\",\"sorting_display_list_price_low_to_high\":\"Price - Low to High\",\"sorting_display_list_discount_high_to_low\":\"Discount - High to Low\",\"sorting_display_list_popularity\":\"Popularity\",\"filter_types_list_category\":\"Category\",\"filter_types_list_brand\":\"Brand\",\"filter_types_list_pack_size\":\"Pack Size\",\"filter_types_list_price\":\"Price\",\"settings\":\"Settings\",\"mail\":\"Mail\",\"mobile\":\"Mobile\",\"notifications_settings\":\"Notifications Settings\",\"update\":\"Update\",\"get_Invoice\":\"Get Invoice\",\"oops\":\"Oops!\",\"show_file\":\"Show File\",\"file_saved_successfully\":\"File saved successfully!\",\"invoice\":\"Invoice\",\"paytm\":\"Paytm\",\"app_under_maintenance\":\"Under Maintenance\",\"time_to_update\":\"Time To Update!\",\"app_update_description\":\"We added lots of new feature and fix some bugs to make your experience as smooth as possible.\",\"update_app\":\"Update App\",\"not_now\":\"Not Now\",\"add_to_cart\":\"Add\",\"paypal_payment\":\"Paypal Payment\",\"paypal\":\"Paypal\",\"payment_cancelled_by_user\":\"Transaction has been canceled. Feel free to try again.\",\"oops_order_item_cancelled_successfully\":\"Order item cancelled successfully!\",\"oops_order_item_unable_to_cancel\":\"Oops!Order item unable to cancel!\",\"minimum_selected_range\":\"Minimum Selected Range\",\"you_can_not_go_back_until_payment_cancel_or_success\":\"You can not go back until payment cancel or success.\",\"do_not_press_back_while_payment_and_double_tap_back_button_to_exit\":\"Do not press back while payment,Press double tap back button to exit.\",\"fssai_lic_no\":\"Fssai Lic. No\",\"no_internet_message_title\":\"No Internet!\",\"no_internet_message_description\":\"Connection lost. Please check your network settings.\",\"something_went_wrong_message_title\":\"Oops! Error\",\"something_went_wrong_message_description\":\"An unexpected error occurred. Please try again later.\",\"shop_by_categories\":\"Shop by categories\",\"shop_by_brands\":\"Shop by brands\",\"brands\":\"Brands\",\"shop_by_sellers\":\"Shop by sellers\",\"sellers\":\"Sellers\",\"please_select_timeslot\":\"Please select timeslot\",\"remove_sold_out_items_first\":\"Seems some items are sold out, please remove that to checkout!\",\"try_again\":\"Try Again\",\"search_places\":\"Search Places\",\"selected_address_is_not_deliverable\":\"Sorry, We are not delivering on selected address\",\"add_address_first\":\"Add Address First!\",\"address_is_not_deliverable\":\"Address Not Deliverable!\",\"wallet_balance\":\"Wallet balance\",\"wallet_used\":\"Wallet used\",\"go_back\":\"Go Back\",\"payment_method_not_available\":\"Payment methods not available\",\"return_requested\":\"Return Requested\",\"wallet\":\"Wallet\",\"search_location_hint\":\"Search location\",\"my_wallet\":\"My Wallet\",\"message\":\"Message\",\"empty_transaction_list_message\":\"No transactions detected!\",\"empty_transaction_description\":\"No money movements found in the account.\",\"empty_wallet_history_list_message\":\"No wallet history detected!\",\"empty_wallet_history_transaction_description\":\"Your wallet has no record of any transactions or activity.\",\"order_id\":\"Order ID\",\"order_placed_on\":\"Order placed on:\",\"credit\":\"Credit\",\"debit\":\"Debit\",\"seller_miss_match_item_message\":\"Item is not belonging to the seller, You ca add item of the same seller only,To add item you need to clear the cart first.\\n\\nYou want to clear cart?\",\"attachments\":\"Attachments\",\"ratings\":\"Ratings\",\"rating\":\"Rating\",\"review\":\"Review\",\"write_your_reviews_here\":\"Write your review(s) here\",\"ratings_and_reviews\":\"Ratings & Reviews\",\"customer_reviews\":\"Customer Reviews\",\"customer_photos\":\"Customer Photos\",\"country_of_origin\":\"Country of origin\",\"shop_by_country_of_origin\":\"Shop by country of origin\",\"view_all_reviews_title\":\"View all\",\"reviews\":\"reviews\",\"read_more\":\"Read More\",\"read_less\":\"Read Less\",\"upload_images_here\":\"Upload images here\",\"wallet_recharge\":\"Wallet Recharge\",\"recharge_amount\":\"Recharge Amount\",\"recharge\":\"Recharge\",\"enter_valid_amount\":\"Enter valid amount!\",\"add\":\"Add\",\"exist_attachments\":\"Exist Attachments\",\"new_attachments\":\"New Attachments\",\"rating_added_successfully\":\"Rating added successfully!\",\"rating_updated_successfully\":\"Rating updated successfully!\",\"reason_required\":\"Reason required!\",\"enter_reason\":\"Enter reason\",\"write_a_review\":\"Write a Review\",\"order_paypal_pending_message\":\"It looks like your PayPal payment is still pending. You\'ll receive an update from PayPal soon to confirm it.\",\"wallet_recharge_paypal_pending_message\":\"It seems your PayPal payment is still pending. Once confirmed, your wallet will be credited with the same amount.\",\"order_midtrans_pending_message\":\"It looks like your Midtrans payment is still pending. You\'ll receive an update from PayPal soon to confirm it.\",\"wallet_recharge_midtrans_pending_message\":\"It seems your Midtrans payment is still pending. Once confirmed, your wallet will be credited with the same amount.\",\"order_phonepe_pending_message\":\"It looks like your PhonePe payment is still pending. You\'ll receive an update from PhonePe soon to confirm it.\",\"order_phonepe_error_message\":\"It looks like there is some error in PhonePe side.Please try again later!\",\"order_phonepe_declined_message\":\"It looks like your PhonePe payment is declined.\",\"order_phonepe_cancelled_message\":\"It looks like your PhonePe payment cancelled by user.\",\"wallet_phonepe_pending_message\":\"It looks like your PhonePe payment is still pending. You\'ll receive an update from PhonePe soon to confirm it.\",\"wallet_phonepe_error_message\":\"It looks like there is some error in PhonePe side.Please try again later!\",\"wallet_phonepe_declined_message\":\"It looks like your PhonePe payment is declined.\",\"wallet_phonepe_cancelled_message\":\"It looks like your PhonePe payment cancelled by user.\",\"visit_web_link\":\"Visit web link\",\"edit\":\"Edit\",\"personal_data\":\"Personal Data\",\"other_information\":\"Other Information\",\"product_overview\":\"Product Overview\",\"product_specifications\":\"Product Specifications\",\"vegetarian\":\"Vegetarian\",\"non_vegetarian\":\"Non-Vegetarian\",\"returnable\":\"Returnable\",\"non_returnable\":\"Non-Returnable\",\"cancellable\":\"Cancellable\",\"non_cancellable\":\"Non-Cancellable\",\"product_is_returnable_till\":\"Product is returnable till\",\"product_is_cancellable_till\":\"Product is cancellable till\",\"days\":\"Day(s)\",\"category\":\"Category\",\"seller_name\":\"Seller\",\"brand\":\"Brand\",\"made_in\":\"Made In\",\"manufacturer\":\"Manufacturer\",\"time_slots_expired_issue\":\"It seems all timeslots are over, you need to change the delivery date and the delivery time.\",\"midtrans\":\"Midtrans\",\"phonepe\":\"PhonePe\",\"select_option\":\"Select option\",\"take_photo\":\"Take photo\",\"gallery\":\"Gallery\",\"review_should_not_empty\":\"Review should not empty!\",\"order_is\":\"Order is\",\"on\":\"on\",\"never_ask_again\":\"Never ask again!\",\"close\":\"Close\",\"go_to_setting\":\"Go to Setting\",\"location_permission_title\":\"Location Permission\",\"notification_permission_title\":\"Notification Permission\",\"storage_permission_title\":\"Storage Permission\",\"camera_permission_title\":\"Camera Permission\",\"camera_microphone_title\":\"Microphone Permission\",\"location_permission_message\":\"You denied the permission, So if you want to access location into map, you need to enable the location permission from the settings.\",\"notification_permission_message\":\"You denied the permission, So if you want to received the notifications, you need to enable the notification permission from the settings.\",\"storage_permission_message\":\"You denied the permission, So if you want to access the storage, you need to enable the storage permission from the settings.\",\"camera_permission_message\":\"You denied the permission, So if you want to access the camera, you need to enable the camera permission from the settings.\",\"location_microphone_message\":\"You denied the permission, So if you want to access voice product search option, you need to enable the microphone permission from the settings.\",\"product_is_either_unavailable_or_does_not_exist\":\"The product is either unavailable or doesn\'t exist!\",\"empty_payment_methods_message\":\"Payment Options Unavailable\",\"empty_payment_methods_description\":\"Wallet recharge payment options are currently unavailable.\",\"mobile_number_and_alternate_mobile_number_cannot_be_same\":\"Mobile number and alternate mobile number cannot be same!\",\"order_note\":\"Add Order Note (Optional)\",\"clear_note\":\"Clear note\",\"order_note_title\":\"Order note\",\"order_note_hint\":\"Please pack the parcel carefully.\",\"estimate_delivery_date\":\"Estimate delivery date\",\"similar_products\":\"Similar products\",\"or_\":\"OR\",\"continue_with_apple\":\"Continue with Apple\",\"continue_with_google\":\"Continue with Google\",\"skip\":\"Skip\",\"next\":\"Next\",\"back\":\"Back\",\"add_note\":\"Add Note...\",\"cashfree\":\"Cashfree\",\"cashfree_sandbox_warning\":\"Please make sure not to skip the timer on the payment screen. Wait until the timer finishes completely; otherwise, the process might not work correctly.\",\"wallet_recharge_cashfree_pending_message\":\"It seems your Midtrans payment is still pending. Once confirmed, your wallet will be credited with the same amount.\",\"order_cashfree_pending_message\":\"It looks like your Cashfree payment is still pending. You\'ll receive an update from Cashfree soon to confirm it.\",\"order_cashfree_cancelled_message\":\"It looks like your Cashfree payment cancelled by user.\",\"order_cashfree_error_message\":\"It looks like there is some error in Cashfree side.Please try again later!\",\"order_cashfree_declined_message\":\"It looks like your Cashfree payment is declined.\",\"wallet_cashfree_pending_message\":\"It looks like your Cashfree payment is still pending. You\'ll receive an update from Cashfree soon to confirm it.\",\"wallet_cashfree_error_message\":\"It looks like there is some error in Cashfree side.Please try again later!\",\"wallet_cashfree_declined_message\":\"It looks like your Cashfree payment is declined.\",\"wallet_cashfree_cancelled_message\":\"It looks like your Cashfree payment cancelled by user.\",\"view_cart\":\"View Cart\",\"clear_cart_title\":\"Clear Cart\",\"clear_cart_message\":\"Are you sure you want to clear your cart?\",\"custom_send_sms_error_message\":\"It seems there is some error in sms gateway.Please try again later!\",\"show_more\":\"Show More\",\"total_pay\":\"Total Pay\",\"see_all_updates\":\"See All Updates\",\"download_invoice\":\"Download Invoice\",\"delivery_location\":\"Delivery Location\",\"delivery_boy_name\":\"Delivery Boy Name\",\"delivery_boy_mobile\":\"Delivery Boy Mobile\",\"delivery_boy_is_not_live_yet\":\"Delivery Boy is not live yet\",\"order_awaiting_payment_track_order_message\":\"Order is not received yet. Once received you can track the order.\",\"order_information\":\"Order Information\",\"all_products\":\"All Products\",\"order_otp\":\"Order OTP\",\"continue_with_email\":\"Continue with Email\",\"continue_with_phone\":\"Continue with Phone\",\"password\":\"Password\",\"enter_valid_password\":\"Enter valid password\",\"confirm_password\":\"ConfirmPassword\",\"enter_valid_confirm_password\":\"Enter valid confirm password\",\"user_not_registered\":\"User not registered\",\"password_length_is_too_short\":\"Password length is too short\",\"enter_valid_user_name\":\"Enter valid user name\",\"password_and_confirm_password_not_match\":\"Password and confirm password not match\",\"dont_have_an_account\":\"Don\'t have an account?\",\"wants_to_register\":\"Register Now\",\"forgot_password\":\"Forgot password?\",\"forgot_password_title\":\"Forgot Password\",\"user_exist_with_google\":\"User already register with google login, please login with google\",\"user_exist_with_email\":\"User already register with email login, please login with email\",\"user_exist_with_apple\":\"User already register with apple login, please login with apple\",\"user_exist_with_phone\":\"User already register with phone login, please login with phone\",\"verification_mail_sent_successfully\":\"Verification Email sent successfully\",\"send_otp\":\"Send OTP\",\"email_not_verified\":\"Account ius registered but otp still not verify please verify it!\",\"otp_required\":\"OTP required\",\"email_is_not_registered\":\"Please register your email first\",\"reorder\":\"Reorder\",\"reorder_warning\":\"Only items currently in stock can be added to your cart.\",\"all_cart_products_have_not_same_seller\":\"All cart products have not same seller!\",\"change_password\":\"Change password\",\"search_product\":\"Search Product\",\"unable_to_open_camera\":\"Unable to open camera!\",\"please_allow_camera_permission_to_scan_qr_code\":\"Please allow camera permission to scan QR code.\",\"sorry_we_are_not_delivering_on_selected_address\":\"Sorry We are not delivering on selected address\",\"items_not_available\":\"Some items are may not available!\",\"is_from_disabled_seller\":\"Some items are may not available!\",\"phone_number_hint\":\"Phone number\",\"system_upgrad_message\":\"📢 For security reasons, we now require a password for login. Without a password, you may not be able to access your account.\",\"invalid_password\":\"Your password is incorrect. Please try again or reset it if needed.\",\"user_already_exist\":\"Account already exists. Please log in.\",\"succesfull_register_message\":\"Your registration was successful. You can log in now\",\"old_password\":\"Old Password\",\"return_rejected\":\"Return Rejected\",\"return_reason\":\"Return Reason\",\"user_deactivated\":\"Your account has been deactivated. Please contact the admin for more details.\",\"user_not_exist\":\"Provided Mobile Number not exist. Please register first\",\"friends_code\":\"Referral Code\",\"enter_friends_code\":\"Enter Referral Code\",\"sorry_didnt_hear_try_again\":\"Sorry, Didn\'t hear that, Try again!\",\"listening\":\"Listening....\",\"refer_and_earn_share_prefix_description\":\"Invite your friends to join and get the reward as soon as your friend first order Placed.\",\"paytabs\":\"Paytabs\",\"tap_microphone_to_try_again\":\"Tap microphone to try again\",\"locations\":\"Locations\",\"no_coupon_available_title\":\"No Coupon Available\",\"no_coupon_available_message\":\"There is no coupon code to show you right now.\",\"off\":\"off\",\"description_goes_here\":\"Description goes here\",\"settings_saved_successfully\":\"Settings saved successfully\",\"please_add_timeslot_in_admin_panel\":\"Please add a timeslot in the admin panel\",\"order_placed\":\"Order placed\",\"pay\":\"Pay\",\"your_order_is\":\"Your Order is\",\"order_number\":\"order #\",\"location_not_serviceable\":\"Location not serviceable\",\"location_not_serviceable_description\":\"Our team is working tirelessly to bring 10\\nminute deliveries to your location\",\"try_changing_location\":\"Try Changing Location\",\"view\":\"VIEW\",\"active_plan\":\"Active plan:-\",\"join_ecoleaf_message\":\"Join EcoLeaf – Where Freshness Meets Savings!\",\"dont_miss_out_message\":\"Don\'t miss out on exclusive savings - Join now!\",\"delivers_in\":\"Delivers in\",\"no_suggestions_found\":\"No suggestions found.\",\"confirmation\":\"Confirmation\",\"cod_confirmation_message\":\"Are you sure you want to proceed with Cash on Delivery?\",\"delete\":\"Delete\",\"saved_addresses\":\"Saved addresses\",\"add_new_address_uppercase\":\"ADD NEW ADDRESS\",\"selected\":\"SELECTED\",\"membership_options\":\"Membership Options\",\"order_details\":\"Order details\",\"order_no\":\"Order no:\",\"estimated_delivery_date_label\":\"Estimated\\ndelivery date\",\"quick_actions\":\"Quick Actions\",\"delivery_address\":\"Delivery address\",\"arriving\":\"Arriving\",\"no_categories\":\"No categories\",\"no_status_available\":\"No status available\",\"mobile_label\":\"Mobile:\",\"total_credited\":\"Total Credited: ₹\",\"on_label\":\"On:\",\"error_label\":\"Error:\",\"my_referrals\":\"My Referrals\",\"please_login_first\":\"Please Login First.\",\"wallet_label\":\"Wallet:\",\"cards\":\"Cards\",\"gpay\":\"GPay\",\"paytm_label\":\"PayTM\",\"phonepay\":\"PhonePay\",\"items_uppercase\":\"ITEMS\",\"item_uppercase\":\"ITEM\",\"saved\":\"SAVED ₹\",\"my_referral_code\":\"My Referral Code\\n\"}', NULL, 1, 1, '2025-11-15 18:53:49', '2025-11-16 11:53:41');
INSERT INTO `bl_languages` (`id`, `supported_language_id`, `system_type`, `json_data`, `display_name`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(4, 16, 1, '{\"app_name\":\"EcoLeaf\",\"intro_title_1\":\"Set Your Delivery Location for Speedy Grocery Delivery.\",\"intro_title_2\":\"Discover Fresh Finds. Fill Your Cart with Everything You Need.\",\"intro_title_3\":\"Your Groceries Await Freshness Delivered to Your Doorstep.\",\"intro_description_1\":\"Pinpoint your exact location for superfast grocery delivery. We\'ll bring your order right to your doorstep!\",\"intro_description_2\":\"Explore thousands of fresh products. Add your favorites to cart, checkout with ease, and let us handle the rest!\",\"intro_description_3\":\"Relax and unwind while we bring your groceries to you. Track your order and get ready to enjoy your fresh haul!\",\"get_started\":\"Get Started\",\"skip_login\":\"Skip\",\"login\":\"Login\",\"welcome\":\"Login to\",\"login_message1\":\"Quick login or sign up with\",\"phone_number\":\"Phone Number\",\"apple\":\"Apple\",\"google\":\"Google\",\"agreement_message_1\":\"By continuing, you agree to EcoLeaf\'s\",\"terms_of_service\":\"Terms of Service\",\"privacy_policy\":\"Privacy Policy\",\"policies\":\"Policies\",\"and\":\"and\",\"enter_valid_mobile\":\"Enter valid mobile number\",\"check_internet\":\"Check Internet Connection\",\"something_went_wrong\":\"Something Went Wrong\",\"enter_verification_code\":\"Verification Code\",\"otp_send_message\":\"We have sent a verification code to\",\"verify_and_proceed\":\"Verify and Proceed\",\"resend_otp_in\":\"Resend otp in\",\"resend_otp\":\"Resend OTP\",\"enter_otp\":\"Enter OTP\",\"enter_valid_otp\":\"Please enter valid OTP\",\"profile_updated_successfully\":\"Profile updated successfully!\",\"profile\":\"Profile\",\"all_orders\":\"All Orders\",\"address\":\"Address\",\"change_theme\":\"Change Theme\",\"change_language\":\"Change Language\",\"select_location\":\"Select Location\",\"product_detail\":\"Product Detail\",\"how_it_works\":\"How it works\",\"notification\":\"Notification\",\"empty_active_orders_message\":\"No Active Orders\",\"empty_active_orders_description\":\"Currently, there are no active orders.\",\"empty_previous_orders_message\":\"No Previous Orders\",\"empty_previous_orders_description\":\"Currently, there are no previous orders.\",\"empty_notification_list_message\":\"No Notification\",\"empty_notification_list_description\":\"You have no notification right now come back later.\",\"empty_wish_list_message\":\"Re-Order is Empty\",\"empty_wish_list_description\":\"Create your personalized collection of must-haves !!\",\"empty_product_list_message\":\"Sorry!\",\"empty_product_list_description\":\"We couldn\'t find what you\'re looking for. Please try again.\",\"enter_text_to_search_the_products\":\"Enter text to search the products!\",\"does_not_delivery_long_message\":\"We doesn\'t delivery at selected city!\",\"sorry\":\"Sorry!\",\"change_location\":\"Change Location\",\"transaction_history\":\"Transaction History\",\"refer_and_earn\":\"Refer and Earn\",\"contact_us\":\"Contact Us\",\"about_us\":\"About Us\",\"rate_us\":\"Rate Us\",\"share_app\":\"Share App\",\"faq\":\"FAQ\",\"transactions\":\"Transactions\",\"terms_and_conditions\":\"Terms & Conditions\",\"logout\":\"Logout\",\"register\":\"Register\",\"edit_profile\":\"Edit Profile\",\"enter_valid_email\":\"Enter valid email\",\"user_name\":\"User Name\",\"enter_user_name\":\"Enter User Name\",\"email\":\"Email\",\"mobile_number\":\"Mobile Number\",\"invite_friends_to_signup\":\"Invite to your friend to signup\",\"friends_download_app\":\"Your friend download app\",\"friends_place_first_order\":\"Your friend place first order\",\"you_will_get_reward_after_delivered\":\"After first order delivered, you will get reward\",\"your_referral_code\":\"Your referral code\",\"refer_now\":\"Refer Now\",\"tap_to_copy\":\"Tap To Copy\",\"refer_code_copied\":\"Refer Code Copied to clipboard\",\"profile_info\":\"Profile Info\",\"tell_us_about_you\":\"Tell us a little about you\",\"profile_info_description\":\"This is an initial information of you, don\'t worry you can change it anytime.\",\"referral_code\":\"Referral Code (optional)\",\"save_info\":\"Save Info\",\"place_order\":\"Place Order\",\"addresses\":\"Addresses\",\"add_new_address\":\"Add New Address\",\"select_delivery_location\":\"Select Your Delivery Location\",\"use_my_current_location\":\"Use my current location\",\"or\":\"or\",\"type_location_manually\":\"Type Location Manually\",\"confirm_location\":\"Confirm Location\",\"select_your_location\":\"Select Your Location\",\"change\":\"Change\",\"recent_searches\":\"Recent Searches\",\"recent_searches_clear\":\"Clear\",\"accept_terms_and_condition\":\"Accept Terms & Conditions\",\"address_detail\":\"Address Detail\",\"contact_details\":\"Contact Details\",\"name\":\"Name\",\"enter_name\":\"Enter Name\",\"alternate_mobile_number\":\"Alternate Mobile No\",\"address_details\":\"Address Details\",\"enter_address\":\"Enter Address\",\"landmark\":\"Landmark\",\"enter_landmark\":\"Enter Landmark\",\"city\":\"City\",\"enter_city\":\"Enter City\",\"area\":\"Area\",\"enter_area\":\"Enter Area\",\"pin_code\":\"PinCode\",\"enter_pin_code\":\"Enter PinCode\",\"state\":\"State\",\"enter_state\":\"Enter State\",\"country\":\"Country\",\"enter_country\":\"Enter Country\",\"address_type\":\"Address Type\",\"address_type_home\":\"Home\",\"address_type_office\":\"Office\",\"address_type_other\":\"Other\",\"set_as_default_address\":\"Set as a default address\",\"delivery_to\":\"Deliver to\",\"delivered_at\":\"Delivered at\",\"home_search_hint\":\"What would you buy today?\",\"product_search_hint\":\"Search Products\",\"see_all\":\"Show All\",\"shop_by\":\"Shop by\",\"categories\":\"Categories\",\"products\":\"Products\",\"all\":\"All\",\"filter\":\"Filter\",\"sort_by\":\"Sort By\",\"share\":\"Share\",\"wish_list\":\"Re-Order\",\"list_view\":\"List View\",\"grid_view\":\"Grid View\",\"search\":\"Search\",\"search_result_for\":\"Search result for\",\"search_empty_message_title\":\"No result to show\",\"search_empty_message_description\":\"Please check spelling or try different keywords.\",\"return_and_exchanges_policy\":\"Returns & Exchanges Policy\",\"shopping_policy\":\"Shipping Policy\",\"cancellation_policy\":\"Cancellation Policy\",\"go_to_product\":\"Go to product\",\"go_to_category\":\"Go to category\",\"share_app_message\":\"Take a Look at EcoLeaf \\n\",\"refer_and_earn_share_prefix_message\":\"I have earned money using EcoLeaf app.\\nYou can also earn money by downloading app from given link\\nDon\'t forgot to enter referral code while registration -\",\"refer_and_earn_share_display_message_1_prefix\":\"Refer a friend and earn up to\",\"refer_and_earn_share_display_message_1_postfix\":\"when your friend\'s first order is successfully delivered.\",\"refer_and_earn_share_display_message_2\":\"Minimum order amount should be\",\"refer_and_earn_share_display_message_3\":\"Which allows you to earn up to\",\"out_of_stock\":\"Out of stock\",\"go_to_cart\":\"Go to cart\",\"cart\":\"Cart\",\"empty_cart_list_message\":\"Cart is Empty\",\"empty_cart_list_description\":\"It seems like you haven\'t added anything to your cart yet!\",\"empty_cart_list_button_name\":\"Shop Now\",\"cancel\":\"Cancel\",\"orders_history\":\"Orders history\",\"active_orders\":\"Active orders\",\"previous_orders\":\"Previous orders\",\"order\":\"Order\",\"placed_order_on\":\"Placed order on\",\"view_details\":\"View details\",\"total\":\"Total\",\"track_my_order\":\"Track order\",\"order_tracking\":\"Order tracking\",\"order_confirmed\":\"Order confirmed\",\"order_shipped\":\"Order shipped\",\"order_out_for_delivery\":\"Order out for delivery\",\"order_delivered\":\"Order delivered\",\"order_summary\":\"Order summary\",\"items\":\"Items\",\"delivery_information\":\"Delivery information\",\"billing_details\":\"Billing details\",\"payment_method\":\"Payment Method\",\"transaction_id\":\"Transaction id\",\"id\":\"ID\",\"date_and_time\":\"Date & Time\",\"amount\":\"Amount\",\"voice_search_product_message\":\"Hold mic and speak to search\",\"sure_to_cancel_product\":\"Are you sure, you want to cancel this product?\",\"sure_to_return_product\":\"Are you sure, you want to return this product?\",\"sure_to_return_order\":\"Are you sure, you want to return this order?\",\"sure_to_cancel_order\":\"Are you sure, you want to cancel this order?\",\"no\":\"No\",\"yes\":\"Yes\",\"unable_to_return_product\":\"Unable to return product\",\"unable_to_cancel_product\":\"Unable to cancel product\",\"unable_to_return_order\":\"Unable to return order\",\"unable_to_cancel_order\":\"Unable to cancel order\",\"change_coupon\":\"Change Coupon\",\"coupon\":\"Coupon\",\"discount\":\"Discount\",\"coupon_applied\":\"Coupon Applied\",\"you_saved\":\"You Saved\",\"with_this_promo_code\":\"with this promo code\",\"clean_all\":\"Clear All\",\"apply\":\"Apply\",\"subtotal\":\"Subtotal\",\"item\":\"Item\",\"proceed_to_checkout\":\"Proceed to Checkout\",\"login_to_checkout\":\"Login to Checkout\",\"apply_discount_code\":\"Apply Discount Code\",\"promo_codes\":\"Promo Codes\",\"applied\":\"Applied\",\"no_address_found_title\":\"No Address Found\",\"no_faq_found_title\":\"No FAQ Found!\",\"no_faq_found_message\":\"Not added any frequently asked questions!\",\"return1\":\"Return\",\"no_address_found_description\":\"You have no any delivery location add delivery address first.\",\"delete_address\":\"Delete Address\",\"please_select_address_from_map\":\"Please select address from map!\",\"checkout\":\"Checkout\",\"delivery_charge\":\"Delivery Charge\",\"seller_wise_delivery_charges_details\":\"Seller wise delivery charges detail\",\"preferred_delivery_date_time\":\"Preferred Delivery Date & Time\",\"required_login_message_for_cart\":\"Oops! You need to login first to add items into cart!\",\"required_login_message_for_wish_list\":\"Oops! You need to login first to add items into wishlist!\",\"required_login_message_for_cart_redirect\":\"Oops! You need to login first to access the cart!\",\"hide_details\":\"Hide\",\"show_details\":\"Show\",\"maximum_products_quantity_limit_reached_message\":\"Apologies, maximum product quantity limit reached!\",\"out_of_stock_message\":\"Oops, limited stock available!\",\"order_place_message\":\"Order Placed!\",\"order_place_description\":\"Your Order has been successfully placed.\",\"cash_on_delivery\":\"Cash On Delivery\",\"razorpay\":\"Razorpay\",\"paystack\":\"Paystack\",\"stripe\":\"Stripe \",\"by\":\"By\",\"continue_shopping\":\"Continue Shopping\",\"view_all_orders\":\"View All Orders\",\"logout_title\":\"Logout!\",\"logout_message\":\"Are you sure?\\nYou want to logout?\",\"delete_user_account\":\"Delete Account\",\"delete_user_title\":\"Delete account!\",\"delete_user_message\":\"Are you sure?\\nYou want to delete account?\\nYou will not undone once delete account!\",\"ok\":\"OK\",\"voice_to_search_product\":\"Search by voice\",\"home_bottom_menu_home\":\"Home\",\"home_bottom_menu_category\":\"Category\",\"home_bottom_menu_wishlist\":\"Re-Order\",\"home_bottom_menu_profile\":\"Profile\",\"theme_display_names_system_default\":\"System Default\",\"theme_display_names_light\":\"Light\",\"theme_display_names_dark\":\"Dark\",\"week_days_names_sunday\":\"Sun\",\"week_days_names_monday\":\"Mon\",\"week_days_names_tuesday\":\"Tues\",\"week_days_names_wednesday\":\"Wed\",\"week_days_names_thursday\":\"Thu\",\"week_days_names_friday\":\"Fri\",\"week_days_names_saturday\":\"Sat\",\"months_names_january\":\"January\",\"months_names_february\":\"February\",\"months_names_march\":\"March\",\"months_names_april\":\"April\",\"months_names_may\":\"May\",\"months_names_june\":\"June\",\"months_names_july\":\"July\",\"months_names_august\":\"August\",\"months_names_september\":\"September\",\"months_names_october\":\"October\",\"months_names_november\":\"November\",\"months_names_december\":\"December\",\"order_status_display_names_awaiting_payment\":\"Awaiting Payment\",\"order_status_display_names_received\":\"Received\",\"order_status_display_names_processed\":\"Processed\",\"order_status_display_names_shipped\":\"Shipped\",\"order_status_display_names_out_for_delivery\":\"Out for Delivery\",\"order_status_display_names_delivered\":\"Delivered\",\"order_status_display_names_cancelled\":\"Cancelled\",\"order_status_display_names_returned\":\"Returned\",\"sorting_display_list_default\":\"Default\",\"sorting_display_list_newest_first\":\"Newest First\",\"sorting_display_list_oldest_first\":\"Oldest First\",\"sorting_display_list_price_high_to_low\":\"Price - High to Low\",\"sorting_display_list_price_low_to_high\":\"Price - Low to High\",\"sorting_display_list_discount_high_to_low\":\"Discount - High to Low\",\"sorting_display_list_popularity\":\"Popularity\",\"filter_types_list_category\":\"Category\",\"filter_types_list_brand\":\"Brand\",\"filter_types_list_pack_size\":\"Pack Size\",\"filter_types_list_price\":\"Price\",\"settings\":\"Settings\",\"mail\":\"Email\",\"mobile\":\"Mobile\",\"notifications_settings\":\"Notifications Settings\",\"update\":\"Update\",\"get_Invoice\":\"Get Invoice\",\"oops\":\"Oops!\",\"show_file\":\"Show File\",\"file_saved_successfully\":\"File saved successfully!\",\"invoice\":\"Invoice\",\"paytm\":\"Paytm\",\"app_under_maintenance\":\"Under Maintenance\",\"time_to_update\":\"Time To Update!\",\"app_update_description\":\"We added lots of new feature and fix some bugs to make your experience as smooth as possible.\",\"update_app\":\"Update App\",\"not_now\":\"Not Now\",\"add_to_cart\":\"Add\",\"paypal_payment\":\"Paypal Payment\",\"paypal\":\"Paypal\",\"payment_cancelled_by_user\":\"Transaction has been canceled. Feel free to try again.\",\"oops_order_item_cancelled_successfully\":\"Order item cancelled successfully!\",\"oops_order_item_unable_to_cancel\":\"Oops!Order item unable to cancel!\",\"minimum_selected_range\":\"Minimum Selected Range\",\"you_can_not_go_back_until_payment_cancel_or_success\":\"You can not go back until payment cancel or success.\",\"do_not_press_back_while_payment_and_double_tap_back_button_to_exit\":\"Do not press back while payment,Press double tap back button to exit.\",\"fssai_lic_no\":\"Fssai Lic. No\",\"no_internet_message_title\":\"No Internet!\",\"no_internet_message_description\":\"Connection lost. Please check your network settings.\",\"something_went_wrong_message_title\":\"Oops! Error\",\"something_went_wrong_message_description\":\"An unexpected error occurred. Please try again later.\",\"shop_by_categories\":\"Shop by categories\",\"shop_by_brands\":\"Shop by brands\",\"brands\":\"Brands\",\"shop_by_sellers\":\"Shop by sellers\",\"sellers\":\"Sellers\",\"please_select_timeslot\":\"Please select timeslot\",\"remove_sold_out_items_first\":\"Seems some items are sold out, please remove that to checkout!\",\"try_again\":\"Try Again\",\"search_places\":\"Search Places\",\"selected_address_is_not_deliverable\":\"Sorry, We are not delivering on selected address\",\"add_address_first\":\"Add Address First!\",\"address_is_not_deliverable\":\"Address Not Deliverable!\",\"wallet_balance\":\"Wallet balance\",\"wallet_used\":\"Wallet used\",\"go_back\":\"Go Back\",\"payment_method_not_available\":\"Payment methods not available\",\"return_requested\":\"Return Requested\",\"wallet\":\"Wallet\",\"search_location_hint\":\"Search location\",\"my_wallet\":\"My Wallet\",\"message\":\"Message\",\"empty_transaction_list_message\":\"No transactions detected!\",\"empty_transaction_description\":\"No money movements found in the account.\",\"empty_wallet_history_list_message\":\"No wallet history detected!\",\"empty_wallet_history_transaction_description\":\"Your wallet has no record of any transactions or activity.\",\"order_id\":\"Order ID\",\"order_placed_on\":\"Order placed on:\",\"credit\":\"Credit\",\"debit\":\"Debit\",\"seller_miss_match_item_message\":\"Item is not belonging to the seller, You ca add item of the same seller only,To add item you need to clear the cart first.\\n\\nYou want to clear cart?\",\"attachments\":\"Attachments\",\"ratings\":\"Ratings\",\"rating\":\"Rating\",\"review\":\"Review\",\"write_your_reviews_here\":\"Write your review(s) here\",\"ratings_and_reviews\":\"Ratings & Reviews\",\"customer_reviews\":\"Customer Reviews\",\"customer_photos\":\"Customer Photos\",\"country_of_origin\":\"Country of origin\",\"shop_by_country_of_origin\":\"Shop by country of origin\",\"view_all_reviews_title\":\"View all\",\"reviews\":\"reviews\",\"read_more\":\"Read More\",\"read_less\":\"Read Less\",\"upload_images_here\":\"Upload images here\",\"wallet_recharge\":\"Wallet Recharge\",\"recharge_amount\":\"Recharge Amount\",\"recharge\":\"Recharge\",\"enter_valid_amount\":\"Enter valid amount!\",\"add\":\"Add\",\"exist_attachments\":\"Exist Attachments\",\"new_attachments\":\"New Attachments\",\"rating_added_successfully\":\"Rating added successfully!\",\"rating_updated_successfully\":\"Rating updated successfully!\",\"reason_required\":\"Reason required!\",\"enter_reason\":\"Enter reason\",\"write_a_review\":\"Write a Review\",\"order_paypal_pending_message\":\"It looks like your PayPal payment is still pending. You\'ll receive an update from PayPal soon to confirm it.\",\"wallet_recharge_paypal_pending_message\":\"It seems your PayPal payment is still pending. Once confirmed, your wallet will be credited with the same amount.\",\"order_midtrans_pending_message\":\"It looks like your Midtrans payment is still pending. You\'ll receive an update from PayPal soon to confirm it.\",\"wallet_recharge_midtrans_pending_message\":\"It seems your Midtrans payment is still pending. Once confirmed, your wallet will be credited with the same amount.\",\"order_phonepe_pending_message\":\"It looks like your PhonePe payment is still pending. You\'ll receive an update from PhonePe soon to confirm it.\",\"order_phonepe_error_message\":\"It looks like there is some error in PhonePe side.Please try again later!\",\"order_phonepe_declined_message\":\"It looks like your PhonePe payment is declined.\",\"order_phonepe_cancelled_message\":\"It looks like your PhonePe payment cancelled by user.\",\"wallet_phonepe_pending_message\":\"It looks like your PhonePe payment is still pending. You\'ll receive an update from PhonePe soon to confirm it.\",\"wallet_phonepe_error_message\":\"It looks like there is some error in PhonePe side.Please try again later!\",\"wallet_phonepe_declined_message\":\"It looks like your PhonePe payment is declined.\",\"wallet_phonepe_cancelled_message\":\"It looks like your PhonePe payment cancelled by user.\",\"visit_web_link\":\"Visit web link\",\"edit\":\"Edit\",\"personal_data\":\"Personal Data\",\"other_information\":\"Other Information\",\"product_overview\":\"Product Overview\",\"product_specifications\":\"Product Specifications\",\"vegetarian\":\"Vegetarian\",\"non_vegetarian\":\"Non-Vegetarian\",\"returnable\":\"Returnable\",\"non_returnable\":\"Non-Returnable\",\"cancellable\":\"Cancellable\",\"non_cancellable\":\"Non-Cancellable\",\"product_is_returnable_till\":\"Product is returnable till\",\"product_is_cancellable_till\":\"Product is cancellable till\",\"days\":\"Day(s)\",\"category\":\"Category\",\"seller_name\":\"Seller\",\"brand\":\"Brand\",\"made_in\":\"Made In\",\"manufacturer\":\"Manufacturer\",\"time_slots_expired_issue\":\"It seems all timeslots are over, you need to change the delivery date and the delivery time.\",\"midtrans\":\"Midtrans\",\"phonepe\":\"PhonePe\",\"select_option\":\"Select option\",\"take_photo\":\"Take photo\",\"gallery\":\"Gallery\",\"review_should_not_empty\":\"Review should not empty!\",\"order_is\":\"Order is\",\"on\":\"on\",\"never_ask_again\":\"Never ask again!\",\"close\":\"Close\",\"go_to_setting\":\"Go to Setting\",\"location_permission_title\":\"Location Permission\",\"notification_permission_title\":\"Notification Permission\",\"storage_permission_title\":\"Storage Permission\",\"camera_permission_title\":\"Camera Permission\",\"camera_microphone_title\":\"Microphone Permission\",\"location_permission_message\":\"You denied the permission, So if you want to access location into map, you need to enable the location permission from the settings.\",\"notification_permission_message\":\"You denied the permission, So if you want to received the notifications, you need to enable the notification permission from the settings.\",\"storage_permission_message\":\"You denied the permission, So if you want to access the storage, you need to enable the storage permission from the settings.\",\"camera_permission_message\":\"You denied the permission, So if you want to access the camera, you need to enable the camera permission from the settings.\",\"location_microphone_message\":\"You denied the permission, So if you want to access voice product search option, you need to enable the microphone permission from the settings.\",\"product_is_either_unavailable_or_does_not_exist\":\"The product is either unavailable or doesn\'t exist!\",\"empty_payment_methods_message\":\"Payment Options Unavailable\",\"empty_payment_methods_description\":\"Wallet recharge payment options are currently unavailable.\",\"mobile_number_and_alternate_mobile_number_cannot_be_same\":\"Mobile number and alternate mobile number cannot be same!\",\"order_note\":\"Add Order Note (Optional)\",\"clear_note\":\"Clear note\",\"order_note_title\":\"Order note\",\"order_note_hint\":\"Please pack the parcel carefully.\",\"estimate_delivery_date\":\"Estimate delivery date\",\"similar_products\":\"Similar products\",\"or_\":\"OR\",\"continue_with_apple\":\"Continue with Apple\",\"continue_with_google\":\"Continue with Google\",\"skip\":\"Skip\",\"next\":\"Next\",\"back\":\"Back\",\"add_note\":\"Add Note...\",\"cashfree\":\"Cashfree\",\"cashfree_sandbox_warning\":\"Please make sure not to skip the timer on the payment screen. Wait until the timer finishes completely; otherwise, the process might not work correctly.\",\"wallet_recharge_cashfree_pending_message\":\"It seems your Midtrans payment is still pending. Once confirmed, your wallet will be credited with the same amount.\",\"order_cashfree_pending_message\":\"It looks like your Cashfree payment is still pending. You\'ll receive an update from Cashfree soon to confirm it.\",\"order_cashfree_cancelled_message\":\"It looks like your Cashfree payment cancelled by user.\",\"order_cashfree_error_message\":\"It looks like there is some error in Cashfree side.Please try again later!\",\"order_cashfree_declined_message\":\"It looks like your Cashfree payment is declined.\",\"wallet_cashfree_pending_message\":\"It looks like your Cashfree payment is still pending. You\'ll receive an update from Cashfree soon to confirm it.\",\"wallet_cashfree_error_message\":\"It looks like there is some error in Cashfree side.Please try again later!\",\"wallet_cashfree_declined_message\":\"It looks like your Cashfree payment is declined.\",\"wallet_cashfree_cancelled_message\":\"It looks like your Cashfree payment cancelled by user.\",\"view_cart\":\"View Cart\",\"clear_cart_title\":\"Clear Cart\",\"clear_cart_message\":\"Are you sure you want to clear your cart?\",\"custom_send_sms_error_message\":\"It seems there is some error in sms gateway.Please try again later!\",\"show_more\":\"Show More\",\"total_pay\":\"Total Pay\",\"see_all_updates\":\"See All Updates\",\"download_invoice\":\"Download Invoice\",\"delivery_location\":\"Delivery Location\",\"delivery_boy_name\":\"Delivery Boy Name\",\"delivery_boy_mobile\":\"Delivery Boy Mobile\",\"delivery_boy_is_not_live_yet\":\"Delivery Boy is not live yet\",\"order_awaiting_payment_track_order_message\":\"Order is not received yet. Once received you can track the order.\",\"order_information\":\"Order Information\",\"all_products\":\"All Products\",\"order_otp\":\"Order OTP\",\"continue_with_email\":\"Continue with Email\",\"continue_with_phone\":\"Continue with Phone\",\"password\":\"Password\",\"enter_valid_password\":\"Enter valid password\",\"confirm_password\":\"ConfirmPassword\",\"enter_valid_confirm_password\":\"Enter valid confirm password\",\"user_not_registered\":\"User not registered\",\"password_length_is_too_short\":\"Password length is too short\",\"enter_valid_user_name\":\"Enter valid user name\",\"password_and_confirm_password_not_match\":\"Password and confirm password not match\",\"dont_have_an_account\":\"Don\'t have an account?\",\"wants_to_register\":\"Register Now\",\"forgot_password\":\"Forgot password?\",\"forgot_password_title\":\"Forgot Password\",\"user_exist_with_google\":\"User already register with google login, please login with google\",\"user_exist_with_email\":\"User already register with email login, please login with email\",\"user_exist_with_apple\":\"User already register with apple login, please login with apple\",\"user_exist_with_phone\":\"User already register with phone login, please login with phone\",\"verification_mail_sent_successfully\":\"Verification Email sent successfully\",\"send_otp\":\"Send OTP\",\"email_not_verified\":\"Account ius registered but otp still not verify please verify it!\",\"otp_required\":\"OTP required\",\"email_is_not_registered\":\"Please register your email first\",\"reorder\":\"Reorder\",\"reorder_warning\":\"Only items currently in stock can be added to your cart.\",\"all_cart_products_have_not_same_seller\":\"All cart products have not same seller!\",\"change_password\":\"Change password\",\"search_product\":\"Search Product\",\"unable_to_open_camera\":\"Unable to open camera!\",\"please_allow_camera_permission_to_scan_qr_code\":\"Please allow camera permission to scan QR code.\",\"sorry_we_are_not_delivering_on_selected_address\":\"Sorry We are not delivering on selected address\",\"items_not_available\":\"Some items are may not available!\",\"is_from_disabled_seller\":\"Some items are may not available!\",\"phone_number_hint\":\"Phone number\",\"system_upgrad_message\":\"📢 For security reasons, we now require a password for login. Without a password, you may not be able to access your account.\",\"invalid_password\":\"Your password is incorrect. Please try again or reset it if needed.\",\"user_already_exist\":\"Account already exists. Please log in.\",\"succesfull_register_message\":\"Your registration was successful. You can log in now\",\"old_password\":\"Old Password\",\"return_rejected\":\"Return Rejected\",\"return_reason\":\"Return Reason\",\"user_deactivated\":\"Your account has been deactivated. Please contact the admin for more details.\",\"user_not_exist\":\"Provided Mobile Number not exist. Please register first\",\"friends_code\":\"Referral Code\",\"enter_friends_code\":\"Enter Referral Code\",\"sorry_didnt_hear_try_again\":\"Sorry, Didn\'t hear that, Try again!\",\"listening\":\"Listening....\",\"refer_and_earn_share_prefix_description\":\"Invite your friends to join and get the reward as soon as your friend first order Placed.\",\"paytabs\":\"Paytabs\",\"tap_microphone_to_try_again\":\"Tap microphone to try again\",\"locations\":\"Locations\",\"no_coupon_available_title\":\"No Coupon Available\",\"no_coupon_available_message\":\"There is no coupon code to show you right now.\",\"off\":\"off\",\"description_goes_here\":\"Description goes here\",\"settings_saved_successfully\":\"Settings saved successfully\",\"please_add_timeslot_in_admin_panel\":\"Please add a timeslot in the admin panel\",\"order_placed\":\"Order placed\",\"pay\":\"Pay\",\"your_order_is\":\"Your Order is\",\"your_order_is_in\":\"Your Order is in\",\"order_number\":\"order #\",\"location_not_serviceable\":\"Location not serviceable\",\"location_not_serviceable_description\":\"Our team is working tirelessly to bring 10\\nminute deliveries to your location\",\"try_changing_location\":\"Try Changing Location\",\"view\":\"VIEW\",\"active_plan\":\"Active plan:-\",\"join_ecoleaf_message\":\"Join EcoLeaf – Where Freshness Meets Savings!\",\"dont_miss_out_message\":\"Don\'t miss out on exclusive savings - Join now!\",\"delivers_in\":\"Delivers in\",\"no_suggestions_found\":\"No suggestions found.\",\"confirmation\":\"Confirmation\",\"cod_confirmation_message\":\"Are you sure you want to proceed with Cash on Delivery?\",\"delete\":\"Delete\",\"saved_addresses\":\"Saved addresses\",\"add_new_address_uppercase\":\"ADD NEW ADDRESS\",\"selected\":\"SELECTED\",\"membership_options\":\"Membership Options\",\"order_details\":\"Order details\",\"order_no\":\"Order no:\",\"estimated_delivery_date_label\":\"Estimated\\ndelivery date\",\"quick_actions\":\"Quick Actions\",\"delivery_address\":\"Delivery address\",\"arriving\":\"Arriving\",\"no_categories\":\"No categories\",\"no_status_available\":\"No status available\",\"mobile_label\":\"Mobile:\",\"total_credited\":\"Total Credited: ₹\",\"on_label\":\"On:\",\"error_label\":\"Error:\",\"my_referrals\":\"My Referrals\",\"please_login_first\":\"Please Login First.\",\"wallet_label\":\"Wallet:\",\"cards\":\"Cards\",\"gpay\":\"GPay\",\"paytm_label\":\"PayTM\",\"phonepay\":\"PhonePay\",\"items_uppercase\":\"ITEMS\",\"item_uppercase\":\"ITEM\",\"saved\":\"SAVED ₹\",\"my_referral_code\":\"My Referral Code\\n\",\"sold_out\":\"SOLD OUT\",\"notify\":\"Notify\",\"alert_on\":\"Alert On!\",\"mins\":\"mins\",\"total_refrral_amount\":\"Total Referral Amount\",\"become_member\":\"Become a member\",\"ecoleaf_support\":\"EcoLeaf Support\",\"online_transaction\":\"Online Transaction History\",\"account\":\"Account\",\"deal_of_day\":\"Deal Of The Day\",\"explore_more\":\"Explore More\",\"invite_and_earn\":\"Invite and Earn Now\",\"buy_now\":\"Buy Now\",\"active\":\"Active\",\"delivery_issues\":\"Delivery Issues\",\"product_missing\":\"Product Missing\",\"product_complaint\":\"Product Complaint\",\"feedback\":\"Feedback\",\"complaint_refund_status\":\"Complaint and Refund Status\",\"how_may_i_help_you\":\"How may I help you?\",\"type_message\":\"Type message...\"}', NULL, 1, 1, '2025-11-17 17:06:23', '2025-11-17 17:06:23');
INSERT INTO `bl_languages` (`id`, `supported_language_id`, `system_type`, `json_data`, `display_name`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(5, 48, 1, '{\"app_name\":\"इकोलीफ\",\"intro_title_1\":\"वेगवान किराणा डिलिव्हरीसाठी तुमचे स्थान सेट करा.\",\"intro_title_2\":\"ताज्या वस्तू शोधा. आवश्यक सर्व वस्तू कार्टमध्ये भरा.\",\"intro_title_3\":\"तुमचा किराणा माल — ताजेपणासह तुमच्या दारात.\",\"intro_description_1\":\"तुमचे अचूक लोकेशन सेट करा आणि सुपरफास्ट किराणा डिलिव्हरी मिळवा!\",\"intro_description_2\":\"हजारो ताज्या उत्पादनांचा शोध घ्या. आवडते उत्पादन कार्टमध्ये जोडा आणि सोप्या पद्धतीने चेकआउट करा!\",\"intro_description_3\":\"रिलॅक्स रहा — आम्ही तुमचा किराणा तुमच्यापर्यंत पोहोचवू. ऑर्डर ट्रॅक करा आणि ताजेपणाचा आनंद घ्या!\",\"get_started\":\"सुरू करा\",\"skip_login\":\"वगळा\",\"login\":\"लॉगिन\",\"welcome\":\"लॉगिन करा\",\"login_message1\":\"जलद लॉगिन किंवा साइन अप करा\",\"phone_number\":\"मोबाईल नंबर\",\"apple\":\"Apple\",\"google\":\"Google\",\"agreement_message_1\":\"पुढे जाताना, तुम्ही इकोलीफच्या\",\"terms_of_service\":\"सेवा अटी\",\"privacy_policy\":\"गोपनीयता धोरण\",\"policies\":\"धोरणे\",\"and\":\"आणि\",\"enter_valid_mobile\":\"कृपया वैध मोबाईल नंबर भरा\",\"check_internet\":\"इंटरनेट कनेक्शन तपासा\",\"something_went_wrong\":\"काहीतरी चूक झाली\",\"enter_verification_code\":\"पडताळणी कोड\",\"otp_send_message\":\"आम्ही तुमच्या नंबरवर OTP पाठवला आहे\",\"verify_and_proceed\":\"पडताळा आणि पुढे जा\",\"resend_otp_in\":\"OTP पुन्हा पाठवू:\",\"resend_otp\":\"OTP पुन्हा पाठवा\",\"enter_otp\":\"OTP भरा\",\"enter_valid_otp\":\"कृपया वैध OTP भरा\",\"profile_updated_successfully\":\"प्रोफाइल यशस्वीरीत्या अपडेट झाले!\",\"profile\":\"प्रोफाइल\",\"all_orders\":\"सर्व ऑर्डर्स\",\"address\":\"पत्ता\",\"change_theme\":\"थीम बदला\",\"change_language\":\"भाषा बदला\",\"select_location\":\"स्थान निवडा\",\"product_detail\":\"उत्पादन तपशील\",\"how_it_works\":\"हे कसे कार्य करते\",\"notification\":\"सूचना\",\"empty_active_orders_message\":\"कोणतीही सक्रिय ऑर्डर नाही\",\"empty_active_orders_description\":\"सध्या तुमच्याकडे कोणतीही सक्रिय ऑर्डर नाही.\",\"empty_previous_orders_message\":\"पूर्वीच्या ऑर्डर्स नाहीत\",\"empty_previous_orders_description\":\"सध्या पूर्वीच्या ऑर्डर्स उपलब्ध नाहीत.\",\"empty_notification_list_message\":\"कोणतीही सूचना नाही\",\"empty_notification_list_description\":\"सध्या कोणत्याही सूचना नाहीत, नंतर तपासा.\",\"empty_wish_list_message\":\"री-ऑर्डर यादी रिकामी आहे\",\"empty_wish_list_description\":\"तुमची महत्त्वाची उत्पादने येथे जतन करा!\",\"empty_product_list_message\":\"क्षमस्व!\",\"empty_product_list_description\":\"आम्हाला तुम्ही शोधत असलेले उत्पादन आढळले नाही. पुन्हा प्रयत्न करा.\",\"enter_text_to_search_the_products\":\"उत्पादने शोधण्यासाठी मजकूर भरा!\",\"does_not_delivery_long_message\":\"क्षमस्व, निवडलेल्या शहरात आम्ही डिलिव्हरी करत नाही!\",\"sorry\":\"क्षमस्व!\",\"change_location\":\"स्थान बदला\",\"transaction_history\":\"व्यवहार इतिहास\",\"refer_and_earn\":\"मित्रांना आमंत्रित करा आणि कमवा\",\"contact_us\":\"आमच्याशी संपर्क करा\",\"about_us\":\"आमच्याबद्दल\",\"rate_us\":\"रेट करा\",\"share_app\":\"अ‍ॅप शेअर करा\",\"faq\":\"FAQ\",\"transactions\":\"व्यवहार\",\"terms_and_conditions\":\"नियम व अटी\",\"logout\":\"लॉगआऊट\",\"register\":\"नोंदणी करा\",\"edit_profile\":\"प्रोफाइल संपादित करा\",\"enter_valid_email\":\"कृपया वैध ईमेल भरा\",\"user_name\":\"वापरकर्त्याचे नाव\",\"enter_user_name\":\"वापरकर्त्याचे नाव भरा\",\"email\":\"ईमेल\",\"mobile_number\":\"मोबाईल नंबर\",\"invite_friends_to_signup\":\"मित्रांना साइन अप करण्यासाठी आमंत्रित करा\",\"friends_download_app\":\"तुमचा मित्र अ‍ॅप डाउनलोड करतो\",\"friends_place_first_order\":\"तुमचा मित्र पहिली ऑर्डर करतो\",\"you_will_get_reward_after_delivered\":\"त्यांची पहिली ऑर्डर वितरित झाल्यावर तुम्हाला बक्षीस मिळेल\",\"your_referral_code\":\"तुमचा रेफरल कोड\",\"refer_now\":\"आता रेफर करा\",\"tap_to_copy\":\"कॉपी करण्यासाठी टॅप करा\",\"refer_code_copied\":\"रेफरल कोड कॉपी झाला\",\"profile_info\":\"प्रोफाइल माहिती\",\"tell_us_about_you\":\"तुमच्याबद्दल थोडक्यात सांगा\",\"profile_info_description\":\"ही प्राथमिक माहिती आहे, तुम्ही नंतर कधीही बदलू शकता.\",\"referral_code\":\"रेफरल कोड (पर्यायी)\",\"save_info\":\"माहिती जतन करा\",\"place_order\":\"ऑर्डर बुक करा\",\"addresses\":\"पत्ते\",\"add_new_address\":\"नवीन पत्ता जोडा\",\"select_delivery_location\":\"तुमचे डिलिव्हरी स्थान निवडा\",\"use_my_current_location\":\"सध्याचे स्थान वापरा\",\"or\":\"किंवा\",\"type_location_manually\":\"स्थान मॅन्युअली भरा\",\"confirm_location\":\"स्थान निश्चित करा\",\"select_your_location\":\"तुमचे स्थान निवडा\",\"change\":\"बदला\",\"recent_searches\":\"अलीकडील शोध\",\"recent_searches_clear\":\"काढून टाका\",\"accept_terms_and_condition\":\"नियम आणि अटी स्वीकारा\",\"address_detail\":\"पत्त्याचा तपशील\",\"contact_details\":\"संपर्क माहिती\",\"name\":\"नाव\",\"enter_name\":\"नाव भरा\",\"alternate_mobile_number\":\"पर्यायी मोबाईल नंबर\",\"address_details\":\"पत्त्याचे तपशील\",\"enter_address\":\"पत्ता भरा\",\"landmark\":\"ओळख चिन्ह\",\"enter_landmark\":\"ओळख चिन्ह भरा\",\"city\":\"शहर\",\"enter_city\":\"शहर भरा\",\"area\":\"क्षेत्र\",\"enter_area\":\"क्षेत्र भरा\",\"pin_code\":\"पिन कोड\",\"enter_pin_code\":\"पिन कोड भरा\",\"state\":\"राज्य\",\"enter_state\":\"राज्य भरा\",\"country\":\"देश\",\"enter_country\":\"देश भरा\",\"address_type\":\"पत्त्याचा प्रकार\",\"address_type_home\":\"घर\",\"address_type_office\":\"ऑफिस\",\"address_type_other\":\"इतर\",\"set_as_default_address\":\"डिफॉल्ट पत्ता करा\",\"delivery_to\":\"डिलिव्हरी येथे:\",\"delivered_at\":\"डिलिव्हर झाले:\",\"home_search_hint\":\"आज तुम्ही काय खरेदी करणार?\",\"product_search_hint\":\"उत्पादन शोधा\",\"see_all\":\"सर्व पहा\",\"shop_by\":\"यावरून खरेदी करा\",\"categories\":\"श्रेणी\",\"products\":\"उत्पादने\",\"all\":\"सर्व\",\"filter\":\"फिल्टर\",\"sort_by\":\"क्रम लावा\",\"share\":\"शेअर करा\",\"wish_list\":\"री-ऑर्डर\",\"list_view\":\"यादी दृश्य\",\"grid_view\":\"ग्रिड दृश्य\",\"search\":\"शोधा\",\"search_result_for\":\"यासाठी शोध परिणाम:\",\"search_empty_message_title\":\"दाखवण्यासाठी काहीही नाही\",\"search_empty_message_description\":\"स्पेलिंग तपासा किंवा वेगळे शब्द वापरून पहा.\",\"return_and_exchanges_policy\":\"रिटर्न आणि एक्सचेंज धोरण\",\"shopping_policy\":\"शिपिंग धोरण\",\"cancellation_policy\":\"रद्द करण्याचे धोरण\",\"go_to_product\":\"उत्पादन पहा\",\"go_to_category\":\"श्रेणी पहा\",\"share_app_message\":\"इकोलीफ अ‍ॅप पहा \\n\",\"refer_and_earn_share_prefix_message\":\"मी EcoLeaf वापरून पैसे कमावले.\\nतुम्हीही रेफरल कोड टाकून कमवू शकता.\\nडाउनलोड लिंक येथे —\",\"refer_and_earn_share_display_message_1_prefix\":\"मित्राला रेफर करा आणि मिळवा\",\"refer_and_earn_share_display_message_1_postfix\":\"तुमच्या मित्राची पहिली ऑर्डर डिलिव्हर झाल्यावर.\",\"refer_and_earn_share_display_message_2\":\"किमान ऑर्डर रक्कम असावी\",\"refer_and_earn_share_display_message_3\":\"ज्यामुळे तुम्ही इतके कमवू शकता\",\"out_of_stock\":\"स्टॉक संपला\",\"go_to_cart\":\"कार्टमध्ये जा\",\"cart\":\"कार्ट\",\"empty_cart_list_message\":\"कार्ट रिकामे आहे\",\"empty_cart_list_description\":\"तुम्ही अजून कोणतीही वस्तू कार्टमध्ये जोडलेली नाही!\",\"empty_cart_list_button_name\":\"आता खरेदी करा\",\"cancel\":\"रद्द करा\",\"orders_history\":\"ऑर्डर इतिहास\",\"active_orders\":\"सक्रिय ऑर्डर्स\",\"previous_orders\":\"मागील ऑर्डर्स\",\"order\":\"ऑर्डर\",\"placed_order_on\":\"ऑर्डर केलेली तारीख\",\"view_details\":\"तपशील पहा\",\"total\":\"एकूण\",\"track_my_order\":\"ऑर्डर ट्रॅक करा\",\"order_tracking\":\"ऑर्डर ट्रॅकिंग\",\"order_confirmed\":\"ऑर्डरची पुष्टी झाली\",\"order_shipped\":\"ऑर्डर पाठवली\",\"order_out_for_delivery\":\"ऑर्डर डिलिव्हरीसाठी बाहेर पडली\",\"order_delivered\":\"ऑर्डर डिलिव्हर झाली\",\"order_summary\":\"ऑर्डर सारांश\",\"items\":\"वस्तू\",\"delivery_information\":\"डिलिव्हरी माहिती\",\"billing_details\":\"बिलिंग तपशील\",\"payment_method\":\"पेमेंट पद्धत\",\"transaction_id\":\"व्यवहार आयडी\",\"id\":\"ID\",\"date_and_time\":\"तारीख आणि वेळ\",\"amount\":\"रक्कम\",\"voice_search_product_message\":\"शोधण्यासाठी माईक धरून बोला\",\"sure_to_cancel_product\":\"तुम्हाला खात्री आहे का? तुम्ही हे उत्पादन रद्द करू इच्छिता?\",\"sure_to_return_product\":\"तुम्हाला खात्री आहे का? हे उत्पादन परत करू इच्छिता?\",\"sure_to_return_order\":\"तुम्हाला खात्री आहे का? तुम्ही ही ऑर्डर परत करू इच्छिता?\",\"sure_to_cancel_order\":\"तुम्हाला खात्री आहे का? तुम्ही ही ऑर्डर रद्द करू इच्छिता?\",\"no\":\"नाही\",\"yes\":\"होय\",\"unable_to_return_product\":\"उत्पादन परत करता येत नाही\",\"unable_to_cancel_product\":\"उत्पादन रद्द करता येत नाही\",\"unable_to_return_order\":\"ऑर्डर परत करता येत नाही\",\"unable_to_cancel_order\":\"ऑर्डर रद्द करता येत नाही\",\"change_coupon\":\"कूपन बदला\",\"coupon\":\"कूपन\",\"discount\":\"सवलत\",\"coupon_applied\":\"कूपन लागू झाले\",\"you_saved\":\"तुमची बचत\",\"with_this_promo_code\":\"या प्रोमो कोडसह\",\"clean_all\":\"सर्व साफ करा\",\"apply\":\"लागू करा\",\"subtotal\":\"उप-एकूण\",\"item\":\"वस्तू\",\"proceed_to_checkout\":\"चेकआउटला जा\",\"login_to_checkout\":\"चेकआउटसाठी लॉगिन करा\",\"apply_discount_code\":\"डिस्काउंट कोड लागू करा\",\"promo_codes\":\"प्रोमो कोड\",\"applied\":\"लागू केले\",\"no_address_found_title\":\"पत्ता आढळला नाही\",\"no_faq_found_title\":\"FAQ उपलब्ध नाही!\",\"no_faq_found_message\":\"अद्याप कोणतेही वारंवार विचारले जाणारे प्रश्न जोडलेले नाहीत.\",\"return1\":\"परतावा\",\"no_address_found_description\":\"तुमच्याकडे डिलिव्हरी पत्ता नाही. कृपया प्रथम पत्ता जोडा.\",\"delete_address\":\"पत्ता हटवा\",\"please_select_address_from_map\":\"कृपया नकाशावरून पत्ता निवडा!\",\"checkout\":\"चेकआउट\",\"delivery_charge\":\"डिलिव्हरी शुल्क\",\"seller_wise_delivery_charges_details\":\"विक्रेत्यानुसार डिलिव्हरी शुल्क तपशील\",\"preferred_delivery_date_time\":\"प्राधान्य दिलेली डिलिव्हरी तारीख आणि वेळ\",\"required_login_message_for_cart\":\"अरे! कार्टमध्ये वस्तू जोडण्यासाठी कृपया प्रथम लॉगिन करा!\",\"required_login_message_for_wish_list\":\"अरे! विशलिस्टमध्ये वस्तू जोडण्यासाठी प्रथम लॉगिन करा!\",\"required_login_message_for_cart_redirect\":\"कार्ट पाहण्यासाठी प्रथम लॉगिन आवश्यक आहे!\",\"hide_details\":\"तपशील लपवा\",\"show_details\":\"तपशील दाखवा\",\"maximum_products_quantity_limit_reached_message\":\"कमाल प्रमाण मर्यादा पूर्ण झाली आहे!\",\"out_of_stock_message\":\"क्षमस्व, स्टॉक मर्यादित आहे!\",\"order_place_message\":\"ऑर्डर बुक झाली!\",\"order_place_description\":\"तुमची ऑर्डर यशस्वीरित्या बुक झाली आहे.\",\"cash_on_delivery\":\"कॅश ऑन डिलिव्हरी\",\"razorpay\":\"Razorpay\",\"paystack\":\"Paystack\",\"stripe\":\"Stripe\",\"by\":\"द्वारे\",\"continue_shopping\":\"खरेदी सुरू ठेवा\",\"view_all_orders\":\"सर्व ऑर्डर्स पहा\",\"logout_title\":\"लॉगआऊट!\",\"logout_message\":\"आपण खात्रीने लॉगआऊट करू इच्छिता?\",\"delete_user_account\":\"खाते हटवा\",\"delete_user_title\":\"खाते हटवा!\",\"delete_user_message\":\"आपण हे खाते हटवू इच्छिता? हटवल्यानंतर ते परत मिळणार नाही!\",\"ok\":\"ठीक आहे\",\"voice_to_search_product\":\"व्हॉईसने शोधा\",\"home_bottom_menu_home\":\"होम\",\"home_bottom_menu_category\":\"श्रेणी\",\"home_bottom_menu_wishlist\":\"री-ऑर्डर\",\"home_bottom_menu_profile\":\"प्रोफाइल\",\"theme_display_names_system_default\":\"सिस्टम डीफॉल्ट\",\"theme_display_names_light\":\"लाइट\",\"theme_display_names_dark\":\"डार्क\",\"week_days_names_sunday\":\"रवि\",\"week_days_names_monday\":\"सोम\",\"week_days_names_tuesday\":\"मंगळ\",\"week_days_names_wednesday\":\"बुध\",\"week_days_names_thursday\":\"गुरु\",\"week_days_names_friday\":\"शुक्र\",\"week_days_names_saturday\":\"शनि\",\"months_names_january\":\"जानेवारी\",\"months_names_february\":\"फेब्रुवारी\",\"months_names_march\":\"मार्च\",\"months_names_april\":\"एप्रिल\",\"months_names_may\":\"मे\",\"months_names_june\":\"जून\",\"months_names_july\":\"जुलै\",\"months_names_august\":\"ऑगस्ट\",\"months_names_september\":\"सप्टेंबर\",\"months_names_october\":\"ऑक्टोबर\",\"months_names_november\":\"नोव्हेंबर\",\"months_names_december\":\"डिसेंबर\",\"order_status_display_names_awaiting_payment\":\"पेमेंट प्रलंबित\",\"order_status_display_names_received\":\"प्राप्त\",\"order_status_display_names_processed\":\"प्रक्रिया झाली\",\"order_status_display_names_shipped\":\"पाठवली\",\"order_status_display_names_out_for_delivery\":\"डिलिव्हरीसाठी बाहेर पडली\",\"order_status_display_names_delivered\":\"डिलिव्हर झाली\",\"order_status_display_names_cancelled\":\"रद्द\",\"order_status_display_names_returned\":\"परत आली\",\"sorting_display_list_default\":\"डिफॉल्ट\",\"sorting_display_list_newest_first\":\"नवीन प्रथम\",\"sorting_display_list_oldest_first\":\"जुनी प्रथम\",\"sorting_display_list_price_high_to_low\":\"किंमत – जास्त ते कमी\",\"sorting_display_list_price_low_to_high\":\"किंमत – कमी ते जास्त\",\"sorting_display_list_discount_high_to_low\":\"सवलत – जास्त ते कमी\",\"sorting_display_list_popularity\":\"लोकप्रियता\",\"filter_types_list_category\":\"श्रेणी\",\"filter_types_list_brand\":\"ब्रँड\",\"filter_types_list_pack_size\":\"पॅक आकार\",\"filter_types_list_price\":\"किंमत\",\"settings\":\"सेटिंग्ज\",\"mail\":\"ईमेल\",\"mobile\":\"मोबाईल\",\"notifications_settings\":\"सूचना सेटिंग्ज\",\"update\":\"अपडेट\",\"get_Invoice\":\"चलन मिळवा\",\"oops\":\"अरे!\",\"show_file\":\"फाईल दाखवा\",\"file_saved_successfully\":\"फाईल यशस्वीरित्या जतन झाली!\",\"invoice\":\"चलन\",\"paytm\":\"Paytm\",\"app_under_maintenance\":\"अ‍ॅप देखभालीखाली आहे\",\"time_to_update\":\"अपडेटची वेळ!\",\"app_update_description\":\"आम्ही नवीन वैशिष्ट्ये जोडली आणि काही बग दुरुस्त केले आहेत.\",\"update_app\":\"अ‍ॅप अपडेट करा\",\"not_now\":\"आत्ता नाही\",\"add_to_cart\":\"कार्टमध्ये जोडा\",\"paypal_payment\":\"Paypal पेमेंट\",\"paypal\":\"Paypal\",\"payment_cancelled_by_user\":\"पेमेंट रद्द केले गेले. कृपया पुन्हा प्रयत्न करा.\",\"oops_order_item_cancelled_successfully\":\"ऑर्डर आयटम यशस्वीरित्या रद्द झाले!\",\"oops_order_item_unable_to_cancel\":\"अरे! आयटम रद्द करता आला नाही!\",\"minimum_selected_range\":\"किमान निवडलेली रेंज\",\"you_can_not_go_back_until_payment_cancel_or_success\":\"पेमेंट रद्द होईपर्यंत किंवा यशस्वी होईपर्यंत आपण मागे जाऊ शकत नाही.\",\"do_not_press_back_while_payment_and_double_tap_back_button_to_exit\":\"पेमेंटदरम्यान बॅक दाबू नका. बाहेर पडण्यासाठी दोनदा बॅक दाबा.\",\"fssai_lic_no\":\"FSSAI परवाना क्रमांक\",\"no_internet_message_title\":\"इंटरनेट नाही!\",\"no_internet_message_description\":\"कनेक्शन तुटले आहे. कृपया तुमचे नेटवर्क तपासा.\",\"something_went_wrong_message_title\":\"अरे! त्रुटी\",\"something_went_wrong_message_description\":\"अनपेक्षित त्रुटी आली आहे. कृपया नंतर पुन्हा प्रयत्न करा.\",\"shop_by_categories\":\"श्रेणीनुसार खरेदी करा\",\"shop_by_brands\":\"ब्रँडनुसार खरेदी करा\",\"brands\":\"ब्रँड्स\",\"shop_by_sellers\":\"विक्रेत्यानुसार खरेदी करा\",\"sellers\":\"विक्रेते\",\"please_select_timeslot\":\"कृपया टाइमस्लॉट निवडा\",\"remove_sold_out_items_first\":\"काही वस्तू स्टॉकमध्ये नाहीत, कृपया त्यांना काढल्यानंतरच चेकआउट करा!\",\"try_again\":\"पुन्हा प्रयत्न करा\",\"search_places\":\"ठिकाणे शोधा\",\"selected_address_is_not_deliverable\":\"क्षमस्व, निवडलेल्या पत्त्यावर डिलिव्हरी उपलब्ध नाही\",\"add_address_first\":\"कृपया प्रथम पत्ता जोडा!\",\"address_is_not_deliverable\":\"हा पत्ता डिलिव्हरेबल नाही!\",\"wallet_balance\":\"वॉलेट शिल्लक\",\"wallet_used\":\"वॉलेट वापरलेली रक्कम\",\"go_back\":\"मागे जा\",\"payment_method_not_available\":\"पेमेंट पद्धती उपलब्ध नाहीत\",\"return_requested\":\"परतावा विनंती केली\",\"wallet\":\"वॉलेट\",\"search_location_hint\":\"स्थान शोधा\",\"my_wallet\":\"माझे वॉलेट\",\"message\":\"संदेश\",\"empty_transaction_list_message\":\"कोणतेही व्यवहार आढळले नाहीत!\",\"empty_transaction_description\":\"तुमच्या खात्यात कोणतीही आर्थिक हालचाल आढळली नाही.\",\"empty_wallet_history_list_message\":\"वॉलेट इतिहास उपलब्ध नाही!\",\"empty_wallet_history_transaction_description\":\"तुमच्या वॉलेटमध्ये कोणताही व्यवहार रेकॉर्ड नाही.\",\"order_id\":\"ऑर्डर ID\",\"order_placed_on\":\"ऑर्डरची तारीख:\",\"credit\":\"क्रेडिट\",\"debit\":\"डेबिट\",\"seller_miss_match_item_message\":\"ही वस्तू सध्याच्या विक्रेत्याची नाही.\\nएकाच विक्रेत्याच्या वस्तूच जोडा.\\nनवीन वस्तू जोडण्यासाठी कार्ट साफ करायचा आहे का?\",\"attachments\":\"जोडणी\",\"ratings\":\"रेटिंग्ज\",\"rating\":\"रेटिंग\",\"review\":\"रिव्ह्यू\",\"write_your_reviews_here\":\"येथे तुमचा रिव्ह्यू लिहा\",\"ratings_and_reviews\":\"रेटिंग्ज आणि रिव्ह्यू\",\"customer_reviews\":\"ग्राहकांचे रिव्ह्यू\",\"customer_photos\":\"ग्राहकांचे फोटो\",\"country_of_origin\":\"मूळ देश\",\"shop_by_country_of_origin\":\"मूळ देशानुसार खरेदी करा\",\"view_all_reviews_title\":\"सर्व पहा\",\"reviews\":\"रिव्ह्यू\",\"read_more\":\"अधिक वाचा\",\"read_less\":\"कमी वाचा\",\"upload_images_here\":\"येथे छायाचित्रे अपलोड करा\",\"wallet_recharge\":\"वॉलेट रिचार्ज\",\"recharge_amount\":\"रिचार्ज रक्कम\",\"recharge\":\"रिचार्ज\",\"enter_valid_amount\":\"कृपया वैध रक्कम भरा!\",\"add\":\"जोडा\",\"exist_attachments\":\"असलेल्या जोडण्या\",\"new_attachments\":\"नवीन जोडण्या\",\"rating_added_successfully\":\"रेटिंग यशस्वीरित्या जोडले!\",\"rating_updated_successfully\":\"रेटिंग अपडेट केले!\",\"reason_required\":\"कारण आवश्यक आहे!\",\"enter_reason\":\"कारण भरा\",\"write_a_review\":\"रिव्ह्यू लिहा\",\"order_paypal_pending_message\":\"तुमचे PayPal पेमेंट अजूनही प्रलंबित आहे.\",\"wallet_recharge_paypal_pending_message\":\"तुमचे PayPal पेमेंट प्रलंबित आहे. पुष्टी झाल्यावर वॉलेटमध्ये रक्कम जमा होईल.\",\"order_midtrans_pending_message\":\"तुमचे Midtrans पेमेंट प्रलंबित आहे.\",\"wallet_recharge_midtrans_pending_message\":\"Midtrans पेमेंट प्रलंबित आहे. पुष्टी नंतर रक्कम मिळेल.\",\"order_phonepe_pending_message\":\"तुमचे PhonePe पेमेंट प्रलंबित आहे.\",\"order_phonepe_error_message\":\"PhonePe कडून त्रुटी आली. कृपया नंतर प्रयत्न करा!\",\"order_phonepe_declined_message\":\"PhonePe पेमेंट नाकारले गेले.\",\"order_phonepe_cancelled_message\":\"PhonePe पेमेंट वापरकर्त्याने रद्द केले.\",\"wallet_phonepe_pending_message\":\"PhonePe पेमेंट प्रलंबित आहे.\",\"wallet_phonepe_error_message\":\"PhonePe सेवेत त्रुटी. नंतर प्रयत्न करा!\",\"wallet_phonepe_declined_message\":\"PhonePe पेमेंट नाकारले गेले.\",\"wallet_phonepe_cancelled_message\":\"PhonePe पेमेंट रद्द झाले.\",\"visit_web_link\":\"वेब लिंक पहा\",\"edit\":\"संपादित करा\",\"personal_data\":\"वैयक्तिक माहिती\",\"other_information\":\"इतर माहिती\",\"product_overview\":\"उत्पादन आढावा\",\"product_specifications\":\"उत्पादन वैशिष्ट्ये\",\"vegetarian\":\"शाकाहारी\",\"non_vegetarian\":\"मांसाहारी\",\"returnable\":\"परत करता येण्याजोगे\",\"non_returnable\":\"परत न करता येण्याजोगे\",\"cancellable\":\"रद्द करता येण्याजोगे\",\"non_cancellable\":\"न रद्द करता येण्याजोगे\",\"product_is_returnable_till\":\"उत्पादन परत करता येईल — पर्यंत\",\"product_is_cancellable_till\":\"उत्पादन रद्द करता येईल — पर्यंत\",\"days\":\"दिवस\",\"category\":\"श्रेणी\",\"seller_name\":\"विक्रेता\",\"brand\":\"ब्रँड\",\"made_in\":\"निर्मित देश\",\"manufacturer\":\"निर्माता\",\"time_slots_expired_issue\":\"सर्व टाइमस्लॉट संपले आहेत. कृपया तारीख आणि वेळ बदला.\",\"midtrans\":\"Midtrans\",\"phonepe\":\"PhonePe\",\"select_option\":\"पर्याय निवडा\",\"take_photo\":\"फोटो घ्या\",\"gallery\":\"गॅलरी\",\"review_should_not_empty\":\"रिव्ह्यू रिकामा असू शकत नाही!\",\"order_is\":\"ऑर्डर आहे\",\"on\":\"यावर\",\"never_ask_again\":\"पुन्हा विचारू नका!\",\"close\":\"बंद करा\",\"go_to_setting\":\"सेटिंगमध्ये जा\",\"location_permission_title\":\"लोकेशन परवानगी\",\"notification_permission_title\":\"सूचना परवानगी\",\"storage_permission_title\":\"स्टोरेज परवानगी\",\"camera_permission_title\":\"कॅमेरा परवानगी\",\"camera_microphone_title\":\"मायक्रोफोन परवानगी\",\"location_permission_message\":\"लोकेशन वापरण्यासाठी परवानगी सक्षम करा.\",\"notification_permission_message\":\"सूचना मिळवण्यासाठी परवानगी सक्षम करा.\",\"storage_permission_message\":\"स्टोरेज वापरण्यासाठी परवानगी सक्षम करा.\",\"camera_permission_message\":\"कॅमेरा वापरण्यासाठी परवानगी द्या.\",\"location_microphone_message\":\"व्हॉईस सर्चसाठी मायक्रोफोन परवानगी द्या.\",\"product_is_either_unavailable_or_does_not_exist\":\"उत्पादन उपलब्ध नाही किंवा अस्तित्वात नाही!\",\"empty_payment_methods_message\":\"पेमेंट पर्याय उपलब्ध नाहीत\",\"empty_payment_methods_description\":\"वॉलेट रिचार्जसाठी पेमेंट पर्याय उपलब्ध नाहीत.\",\"mobile_number_and_alternate_mobile_number_cannot_be_same\":\"मुख्य आणि पर्यायी मोबाईल नंबर समान असू शकत नाहीत!\",\"order_note\":\"ऑर्डर नोट (पर्यायी)\",\"clear_note\":\"नोट साफ करा\",\"order_note_title\":\"ऑर्डर नोट\",\"order_note_hint\":\"कृपया पॅकिंग काळजीपूर्वक करा.\",\"estimate_delivery_date\":\"अंदाजे डिलिव्हरी तारीख\",\"similar_products\":\"समान उत्पादने\",\"or_\":\"किंवा\",\"continue_with_apple\":\"Apple ने पुढे जा\",\"continue_with_google\":\"Google ने पुढे जा\",\"skip\":\"वगळा\",\"next\":\"पुढे\",\"back\":\"मागे\",\"add_note\":\"नोट जोडा...\",\"cashfree\":\"Cashfree\",\"cashfree_sandbox_warning\":\"टायमर पूर्ण होईपर्यंत पेमेंट स्क्रीन सोडू नका.\",\"wallet_recharge_cashfree_pending_message\":\"Cashfree पेमेंट प्रलंबित आहे.\",\"order_cashfree_pending_message\":\"Cashfree पेमेंट प्रलंबित आहे.\",\"order_cashfree_cancelled_message\":\"Cashfree पेमेंट रद्द झाले आहे.\",\"order_cashfree_error_message\":\"Cashfree सेवेत समस्या आली आहे.\",\"order_cashfree_declined_message\":\"Cashfree पेमेंट नाकारले गेले आहे.\",\"wallet_cashfree_pending_message\":\"तुमचे Cashfree पेमेंट अजूनही प्रलंबित आहे. पुष्टी झाल्यावर वॉलेटमध्ये रक्कम जमा होईल.\",\"wallet_cashfree_error_message\":\"Cashfree सेवेत काही त्रुटी आहे. कृपया नंतर पुन्हा प्रयत्न करा!\",\"wallet_cashfree_declined_message\":\"Cashfree पेमेंट नाकारले गेले आहे.\",\"wallet_cashfree_cancelled_message\":\"Cashfree पेमेंट वापरकर्त्याने रद्द केले आहे.\",\"view_cart\":\"कार्ट पहा\",\"clear_cart_title\":\"कार्ट साफ करा\",\"clear_cart_message\":\"आपण कार्ट पूर्णपणे साफ करू इच्छिता का?\",\"custom_send_sms_error_message\":\"SMS गेटवे मध्ये त्रुटी आली आहे. कृपया नंतर पुन्हा प्रयत्न करा!\",\"show_more\":\"अधिक पहा\",\"total_pay\":\"एकूण पेमेंट\",\"see_all_updates\":\"सर्व अपडेट्स पहा\",\"download_invoice\":\"चलन डाउनलोड करा\",\"delivery_location\":\"डिलिव्हरी स्थान\",\"delivery_boy_name\":\"डिलिव्हरी बॉयचे नाव\",\"delivery_boy_mobile\":\"डिलिव्हरी बॉय मोबाईल\",\"delivery_boy_is_not_live_yet\":\"डिलिव्हरी बॉय अद्याप लाइव्ह नाही\",\"order_awaiting_payment_track_order_message\":\"ऑर्डर अद्याप प्राप्त झालेली नाही. प्राप्त झाल्यावर तुम्ही ट्रॅक करू शकता.\",\"order_information\":\"ऑर्डर माहिती\",\"all_products\":\"सर्व उत्पादने\",\"order_otp\":\"ऑर्डर OTP\",\"continue_with_email\":\"ईमेलद्वारे पुढे जा\",\"continue_with_phone\":\"मोबाईलद्वारे पुढे जा\",\"password\":\"पासवर्ड\",\"enter_valid_password\":\"कृपया वैध पासवर्ड भरा\",\"confirm_password\":\"पासवर्डची खात्री करा\",\"enter_valid_confirm_password\":\"कृपया पासवर्ड जुळत असल्याची खात्री करा\",\"user_not_registered\":\"वापरकर्ता नोंदणीकृत नाही\",\"password_length_is_too_short\":\"पासवर्ड खूप लहान आहे\",\"enter_valid_user_name\":\"कृपया वैध वापरकर्ता नाव भरा\",\"password_and_confirm_password_not_match\":\"पासवर्ड आणि कन्फर्म पासवर्ड जुळत नाही\",\"dont_have_an_account\":\"खाते नाही?\",\"wants_to_register\":\"नोंदणी करा\",\"forgot_password\":\"पासवर्ड विसरलात?\",\"forgot_password_title\":\"पासवर्ड रीसेट\",\"user_exist_with_google\":\"हा वापरकर्ता Google लॉगिनद्वारे नोंदणीकृत आहे. कृपया Google ने लॉगिन करा.\",\"user_exist_with_email\":\"हा वापरकर्ता ईमेलने नोंदणीकृत आहे. कृपया ईमेलने लॉगिन करा.\",\"user_exist_with_apple\":\"हा वापरकर्ता Apple लॉगिनद्वारे नोंदणीकृत आहे. कृपया Apple ने लॉगिन करा.\",\"user_exist_with_phone\":\"हा वापरकर्ता फोनने नोंदणीकृत आहे. कृपया फोनद्वारे लॉगिन करा.\",\"verification_mail_sent_successfully\":\"प्रमाणीकरण मेल यशस्वीरित्या पाठवला\",\"send_otp\":\"OTP पाठवा\",\"email_not_verified\":\"खाते नोंदणीकृत आहे पण OTP अद्याप सत्यापित नाही. कृपया सत्यापित करा!\",\"otp_required\":\"OTP आवश्यक आहे\",\"email_is_not_registered\":\"कृपया प्रथम तुमचा ईमेल नोंदणी करा\",\"reorder\":\"पुन्हा ऑर्डर करा\",\"reorder_warning\":\"फक्त स्टॉकमध्ये उपलब्ध वस्तूच कार्टमध्ये जोडल्या जातील.\",\"all_cart_products_have_not_same_seller\":\"कार्टमधील सर्व उत्पादने एकाच विक्रेत्याची नाहीत!\",\"change_password\":\"पासवर्ड बदला\",\"search_product\":\"उत्पादन शोधा\",\"unable_to_open_camera\":\"कॅमेरा उघडता आला नाही!\",\"please_allow_camera_permission_to_scan_qr_code\":\"QR कोड स्कॅन करण्यासाठी कॅमेरा परवानगी द्या.\",\"sorry_we_are_not_delivering_on_selected_address\":\"क्षमस्व! निवडलेल्या पत्त्यावर डिलिव्हरी उपलब्ध नाही.\",\"items_not_available\":\"काही वस्तू उपलब्ध नसू शकतात!\",\"is_from_disabled_seller\":\"काही वस्तू उपलब्ध नसू शकतात!\",\"phone_number_hint\":\"मोबाईल नंबर\",\"system_upgrad_message\":\"📢 सुरक्षेसाठी आता लॉगिनसाठी पासवर्ड आवश्यक आहे. पासवर्ड नसल्यास खाते उघडता येणार नाही.\",\"invalid_password\":\"पासवर्ड चुकीचा आहे. कृपया पुन्हा प्रयत्न करा.\",\"user_already_exist\":\"खाते आधीच अस्तित्वात आहे. कृपया लॉगिन करा.\",\"succesfull_register_message\":\"नोंदणी यशस्वी झाली. आता तुम्ही लॉगिन करू शकता.\",\"old_password\":\"जुना पासवर्ड\",\"return_rejected\":\"परतावा नाकारला\",\"return_reason\":\"परताव्याचे कारण\",\"user_deactivated\":\"तुमचे खाते निष्क्रिय केले आहे. कृपया अधिक माहितीसाठी अॅडमिनला संपर्क करा.\",\"user_not_exist\":\"दिलेला मोबाईल नंबर अस्तित्वात नाही. कृपया प्रथम नोंदणी करा.\",\"friends_code\":\"मित्राचा रेफरल कोड\",\"enter_friends_code\":\"मित्राचा रेफरल कोड भरा\",\"sorry_didnt_hear_try_again\":\"क्षमस्व! ऐकू आले नाही. पुन्हा प्रयत्न करा!\",\"listening\":\"ऐकत आहे...\",\"refer_and_earn_share_prefix_description\":\"तुमचे मित्र ॲपमध्ये सामील झाल्यावर तुम्हाला बक्षीस मिळेल.\",\"paytabs\":\"PayTabs\",\"tap_microphone_to_try_again\":\"पुन्हा प्रयत्न करण्यासाठी मायक्रोफोनवर टॅप करा\",\"locations\":\"स्थान\",\"no_coupon_available_title\":\"कूपन उपलब्ध नाही\",\"no_coupon_available_message\":\"सध्या कोणतेही कूपन उपलब्ध नाहीत.\",\"off\":\"सवलत\",\"description_goes_here\":\"वर्णन येथे दिसेल\",\"settings_saved_successfully\":\"सेटिंग्ज यशस्वीरित्या जतन केली\",\"please_add_timeslot_in_admin_panel\":\"कृपया अॅडमिन पॅनेलमध्ये टाइमस्लॉट जोडा\",\"order_placed\":\"ऑर्डर यशस्वीरित्या ठेवली\",\"pay\":\"पे करा\",\"your_order_is\":\"तुमची ऑर्डर\",\"your_order_is_in\":\"तुमची ऑर्डर\",\"order_number\":\"ऑर्डर #\",\"location_not_serviceable\":\"स्थान सेवा क्षेत्रात नाही\",\"location_not_serviceable_description\":\"आमची टीम तुमच्या परिसरातही 10 मिनिटांची डिलिव्हरी आणण्यासाठी काम करत आहे.\",\"try_changing_location\":\"कृपया स्थान बदला\",\"view\":\"पहा\",\"active_plan\":\"सक्रिय योजना :-\",\"join_ecoleaf_message\":\"EcoLeaf मध्ये सामील व्हा – ताजेपणा आणि बचत एकत्र!\",\"dont_miss_out_message\":\"विशेष बचतीसाठी आजच सामील व्हा!\",\"delivers_in\":\"डिलिव्हरी होईल\",\"no_suggestions_found\":\"सूचना आढळल्या नाहीत.\",\"confirmation\":\"पुष्टीकरण\",\"cod_confirmation_message\":\"तुम्ही कॅश ऑन डिलिव्हरी निवडू इच्छिता याची खात्री आहे का?\",\"delete\":\"हटवा\",\"saved_addresses\":\"जतन केलेले पत्ते\",\"add_new_address_uppercase\":\"नवीन पत्ता जोडा\",\"selected\":\"निवडलेले\",\"membership_options\":\"सदस्यता पर्याय\",\"order_details\":\"ऑर्डर तपशील\",\"order_no\":\"ऑर्डर क्रमांक:\",\"estimated_delivery_date_label\":\"अंदाजे\\nडिलिव्हरी तारीख\",\"quick_actions\":\"त्वरित क्रिया\",\"delivery_address\":\"डिलिव्हरी पत्ता\",\"arriving\":\"पोहोचत आहे\",\"no_categories\":\"श्रेणी उपलब्ध नाहीत\",\"no_status_available\":\"स्थिती उपलब्ध नाही\",\"mobile_label\":\"मोबाईल:\",\"total_credited\":\"एकूण जमा: ₹\",\"on_label\":\"यावर:\",\"error_label\":\"त्रुटी:\",\"my_referrals\":\"माझे रेफरल\",\"please_login_first\":\"कृपया प्रथम लॉगिन करा.\",\"wallet_label\":\"वॉलेट:\",\"cards\":\"कार्ड्स\",\"gpay\":\"GPay\",\"paytm_label\":\"PayTM\",\"phonepay\":\"PhonePay\",\"items_uppercase\":\"वस्तू\",\"item_uppercase\":\"वस्तू\",\"saved\":\"बचत ₹\",\"my_referral_code\":\"माझा रेफरल कोड\\n\",\"sold_out\":\"स्टॉक संपला\",\"notify\":\"सूचित करा\",\"alert_on\":\"अलर्ट चालू!\",\"mins\":\"मिनिटे\",\"total_refrral_amount\":\"एकूण रेफरल रक्कम\",\"become_member\":\"सदस्य बना\",\"ecoleaf_support\":\"EcoLeaf समर्थन\",\"online_transaction\":\"ऑनलाइन व्यवहार इतिहास\",\"account\":\"खाते\",\"deal_of_day\":\"आजचा खास सौदा\",\"explore_more\":\"अधिक तपासा\",\"invite_and_earn\":\"आमंत्रित करा आणि आता कमवा\",\"buy_now\":\"खरेदी आता\",\"active\":\"सक्रिय\",\"delivery_issues\":\"वितरण समस्या\",\"product_missing\":\"उत्पादन गायब\",\"product_complaint\":\"उत्पादन तक्रार\",\"feedback\":\"प्रतिसाद\",\"complaint_refund_status\":\"तक्रार आणि परताव्याची स्थिती\",\"how_may_i_help_you\":\"मी तुम्हाला कशी मदत करू?\",\"type_message\":\"संदेश टाइप करा...\"}', 'मराठी', 0, 1, '2025-11-17 17:07:53', '2025-11-28 13:00:51');

-- --------------------------------------------------------

--
-- Table structure for table `bl_live_tracking`
--

CREATE TABLE `bl_live_tracking` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `tracked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_live_tracking`
--

INSERT INTO `bl_live_tracking` (`id`, `order_id`, `latitude`, `longitude`, `tracked_at`, `created_at`, `updated_at`) VALUES
(75, 2, '17.6867704', '74.0231892', NULL, '2025-11-03 18:23:06', '2025-11-03 18:26:21'),
(76, 8, '17.6867696', '74.0231934', NULL, '2025-11-04 10:37:56', '2025-11-04 10:38:36'),
(77, 7, '17.6914390', '73.9831503', NULL, '2025-11-04 11:12:02', '2025-11-04 11:28:12'),
(78, 10, '17.6822764', '73.9974556', NULL, '2025-11-04 12:07:49', '2025-11-04 12:19:21'),
(79, 9, '17.6865943', '74.0250547', NULL, '2025-11-04 14:56:56', '2025-11-04 14:57:19'),
(80, 12, '17.6933121', '74.0281668', NULL, '2025-11-04 16:50:09', '2025-11-04 16:57:08'),
(81, 13, '17.6867727', '74.0231933', NULL, '2025-11-04 17:36:31', '2025-11-04 17:36:44'),
(82, 15, '17.6867732', '74.0231922', NULL, '2025-11-04 17:42:43', '2025-11-04 17:42:43'),
(83, 16, '17.6867953', '74.0232646', NULL, '2025-11-06 11:16:00', '2025-11-06 11:16:37'),
(84, 18, '17.6867948', '74.0232850', NULL, '2025-11-06 11:16:30', '2025-11-06 11:16:30'),
(85, 17, '17.7251288', '74.0398747', NULL, '2025-11-06 11:44:49', '2025-11-06 11:44:49'),
(86, 19, '17.6941175', '74.0389811', NULL, '2025-11-06 14:42:19', '2025-11-06 14:55:12'),
(87, 20, '17.6890351', '74.0276831', NULL, '2025-11-06 15:45:52', '2025-11-06 15:55:42'),
(88, 21, '17.7255164', '74.0411247', NULL, '2025-11-06 18:36:57', '2025-11-06 18:36:57'),
(89, 34, '17.6863558', '74.0255904', NULL, '2025-11-07 10:44:01', '2025-11-07 10:47:41'),
(90, 33, '17.7021335', '74.0306256', NULL, '2025-11-07 11:00:13', '2025-11-07 11:15:56'),
(91, 25, '17.7048092', '74.0258180', NULL, '2025-11-07 11:22:33', '2025-11-07 11:22:33'),
(92, 22, '17.7047405', '74.0258782', NULL, '2025-11-07 11:23:28', '2025-11-07 11:23:28'),
(93, 37, '17.6867745', '74.0231836', NULL, '2025-11-07 12:02:22', '2025-11-07 12:03:59'),
(94, 38, '17.6996802', '74.0260380', NULL, '2025-11-07 12:31:49', '2025-11-07 12:36:47'),
(95, 40, '21.2108654', '72.8894072', NULL, '2025-11-07 12:43:48', '2025-11-18 15:58:17'),
(96, 41, '21.2108183', '72.8897150', NULL, '2025-11-07 12:46:15', '2025-11-11 12:12:37'),
(97, 42, '17.6995426', '74.0259791', NULL, '2025-11-07 12:50:25', '2025-11-07 12:50:40'),
(98, 43, '17.7003288', '74.0164640', NULL, '2025-11-07 14:55:26', '2025-11-07 15:09:14'),
(99, 44, '17.6867199', '74.0232115', NULL, '2025-11-07 16:49:06', '2025-11-07 16:49:06'),
(100, 51, '17.6774798', '74.0205964', NULL, '2025-11-08 17:47:08', '2025-11-08 17:53:03'),
(101, 53, '17.6854215', '74.0147895', NULL, '2025-11-11 10:24:20', '2025-11-11 10:29:16'),
(102, 54, '21.2108183', '72.8897150', NULL, '2025-11-11 15:45:34', '2025-11-12 11:31:07'),
(103, 56, '17.7255920', '74.0411822', NULL, '2025-11-13 18:11:02', '2025-11-13 18:57:35'),
(104, 61, '17.6776597', '74.0205161', NULL, '2025-11-14 17:19:37', '2025-11-14 17:25:35'),
(105, 63, '17.7250608', '74.0398453', NULL, '2025-11-15 17:23:13', '2025-11-15 17:23:25'),
(106, 74, '17.6867767', '74.0231204', NULL, '2025-11-17 12:28:17', '2025-11-17 12:28:17'),
(107, 45, '17.6867423', '74.0231986', NULL, '2025-11-17 12:31:12', '2025-11-17 12:31:12'),
(108, 77, '17.6867664', '74.0231292', NULL, '2025-11-17 12:43:47', '2025-11-17 12:43:55'),
(109, 81, '17.7250055', '74.0398757', NULL, '2025-11-20 11:21:44', '2025-11-20 11:28:35'),
(110, 82, '17.6867520', '74.0233346', NULL, '2025-11-20 11:39:30', '2025-11-20 16:41:51'),
(111, 83, '17.7250945', '74.0398460', NULL, '2025-11-20 12:22:21', '2025-11-20 12:22:21'),
(112, 35, '21.2108183', '72.8897150', NULL, '2025-11-20 15:48:04', '2025-11-20 15:48:04'),
(113, 92, '17.7250635', '74.0398103', NULL, '2025-11-20 17:22:25', '2025-11-20 17:22:56'),
(114, 93, '17.6867049', '74.0232274', NULL, '2025-11-20 18:14:42', '2025-11-20 18:14:42'),
(115, 97, '17.6867213', '74.0232747', NULL, '2025-11-21 11:31:07', '2025-11-21 11:31:07'),
(116, 96, '17.7252123', '74.0407417', NULL, '2025-11-21 11:31:23', '2025-11-21 11:47:23'),
(117, 104, '17.6940033', '74.0364384', NULL, '2025-11-22 15:22:54', '2025-11-22 15:22:54'),
(118, 107, '17.7250172', '74.0398387', NULL, '2025-11-24 12:47:42', '2025-11-24 12:48:38'),
(119, 108, '17.6867367', '74.0232579', NULL, '2025-11-25 11:04:45', '2025-11-25 11:13:11'),
(120, 109, '17.6867120', '74.0232448', NULL, '2025-11-26 17:04:21', '2025-11-26 17:04:39'),
(121, 110, '17.6867080', '74.0232328', NULL, '2025-11-27 17:15:31', '2025-11-27 17:15:59'),
(122, 125, '17.6867633', '74.0231778', NULL, '2025-12-19 11:25:00', '2025-12-19 11:25:00'),
(123, 134, '17.6868698', '74.0232546', NULL, '2025-12-19 13:45:02', '2025-12-19 13:45:19'),
(124, 139, '17.6996424', '74.0194457', NULL, '2025-12-19 14:40:33', '2025-12-19 14:40:33'),
(125, 136, '17.6996003', '74.0191278', NULL, '2025-12-19 14:43:10', '2025-12-19 14:43:10'),
(126, 131, '17.6868105', '74.0231890', NULL, '2025-12-19 15:11:32', '2025-12-19 15:11:32'),
(127, 135, '17.6867368', '74.0231837', NULL, '2025-12-19 15:19:51', '2025-12-19 15:19:51'),
(128, 152, '17.6770447', '74.0214336', NULL, '2025-12-27 16:52:35', '2025-12-27 16:52:35'),
(129, 166, '17.7251454', '74.0399115', NULL, '2026-01-03 15:17:36', '2026-01-03 15:26:05'),
(130, 167, '17.7250479', '74.0398413', NULL, '2026-01-03 16:35:10', '2026-01-03 16:35:59'),
(131, 168, '17.7250339', '74.0398619', NULL, '2026-01-03 16:39:58', '2026-01-03 16:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `bl_mail_settings`
--

CREATE TABLE `bl_mail_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` int(11) NOT NULL COMMENT '0:user, 1:Admin',
  `user_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `mail_status` int(11) NOT NULL COMMENT '0:false, 1:true',
  `mobile_status` int(11) NOT NULL COMMENT '0:false, 1:true',
  `sms_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Disabled, 1: Enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_mail_settings`
--

INSERT INTO `bl_mail_settings` (`id`, `user_type`, `user_id`, `order_status_id`, `mail_status`, `mobile_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 1, 0, 0, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(2, 0, 1, 2, 1, 1, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(3, 0, 1, 3, 1, 1, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(4, 0, 1, 4, 1, 1, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(5, 0, 1, 5, 1, 1, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(6, 0, 1, 6, 1, 1, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(7, 0, 1, 7, 1, 1, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(8, 0, 1, 8, 1, 1, 0, '2025-08-13 11:23:15', '2025-08-13 11:23:15'),
(9, 0, 2, 1, 0, 0, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(10, 0, 2, 2, 1, 1, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(11, 0, 2, 3, 1, 1, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(12, 0, 2, 4, 1, 1, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(13, 0, 2, 5, 1, 1, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(14, 0, 2, 6, 1, 1, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(15, 0, 2, 7, 1, 1, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(16, 0, 2, 8, 1, 1, 0, '2025-08-13 16:04:42', '2025-08-13 16:04:42'),
(17, 0, 4, 1, 0, 0, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(18, 0, 4, 2, 1, 1, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(19, 0, 4, 3, 1, 1, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(20, 0, 4, 4, 1, 1, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(21, 0, 4, 5, 1, 1, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(22, 0, 4, 6, 1, 1, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(23, 0, 4, 7, 1, 1, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(24, 0, 4, 8, 1, 1, 0, '2025-08-14 18:30:17', '2025-08-14 18:30:17'),
(25, 0, 5, 1, 0, 0, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(26, 0, 5, 2, 1, 1, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(27, 0, 5, 3, 1, 1, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(28, 0, 5, 4, 1, 1, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(29, 0, 5, 5, 1, 1, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(30, 0, 5, 6, 1, 1, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(31, 0, 5, 7, 1, 1, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(32, 0, 5, 8, 1, 1, 0, '2025-08-16 14:03:26', '2025-08-16 14:03:26'),
(33, 0, 7, 1, 0, 0, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(34, 0, 7, 2, 1, 1, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(35, 0, 7, 3, 1, 1, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(36, 0, 7, 4, 1, 1, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(37, 0, 7, 5, 1, 1, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(38, 0, 7, 6, 1, 1, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(39, 0, 7, 7, 1, 1, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(40, 0, 7, 8, 1, 1, 0, '2025-08-18 15:32:58', '2025-08-18 15:32:58'),
(41, 0, 8, 1, 0, 0, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(42, 0, 8, 2, 1, 1, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(43, 0, 8, 3, 1, 1, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(44, 0, 8, 4, 1, 1, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(45, 0, 8, 5, 1, 1, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(46, 0, 8, 6, 1, 1, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(47, 0, 8, 7, 1, 1, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(48, 0, 8, 8, 1, 1, 0, '2025-08-18 17:44:41', '2025-08-18 17:44:41'),
(49, 0, 9, 1, 0, 0, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(50, 0, 9, 2, 1, 1, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(51, 0, 9, 3, 1, 1, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(52, 0, 9, 4, 1, 1, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(53, 0, 9, 5, 1, 1, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(54, 0, 9, 6, 1, 1, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(55, 0, 9, 7, 1, 1, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(56, 0, 9, 8, 1, 1, 0, '2025-08-20 18:28:32', '2025-08-20 18:28:32'),
(57, 0, 10, 1, 0, 0, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(58, 0, 10, 2, 1, 1, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(59, 0, 10, 3, 1, 1, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(60, 0, 10, 4, 1, 1, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(61, 0, 10, 5, 1, 1, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(62, 0, 10, 6, 1, 1, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(63, 0, 10, 7, 1, 1, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(64, 0, 10, 8, 1, 1, 0, '2025-08-21 21:26:05', '2025-08-21 21:26:05'),
(65, 0, 12, 1, 0, 0, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(66, 0, 12, 2, 1, 1, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(67, 0, 12, 3, 1, 1, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(68, 0, 12, 4, 1, 1, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(69, 0, 12, 5, 1, 1, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(70, 0, 12, 6, 1, 1, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(71, 0, 12, 7, 1, 1, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(72, 0, 12, 8, 1, 1, 0, '2025-08-23 11:24:20', '2025-08-23 11:24:20'),
(73, 0, 13, 1, 0, 0, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(74, 0, 13, 2, 1, 1, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(75, 0, 13, 3, 1, 1, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(76, 0, 13, 4, 1, 1, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(77, 0, 13, 5, 1, 1, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(78, 0, 13, 6, 1, 1, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(79, 0, 13, 7, 1, 1, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(80, 0, 13, 8, 1, 1, 0, '2025-08-23 13:54:38', '2025-08-23 13:54:38'),
(81, 0, 14, 1, 0, 0, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(82, 0, 14, 2, 1, 1, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(83, 0, 14, 3, 1, 1, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(84, 0, 14, 4, 1, 1, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(85, 0, 14, 5, 1, 1, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(86, 0, 14, 6, 1, 1, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(87, 0, 14, 7, 1, 1, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(88, 0, 14, 8, 1, 1, 0, '2025-08-23 14:13:19', '2025-08-23 14:13:19'),
(89, 0, 15, 1, 0, 0, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(90, 0, 15, 2, 1, 1, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(91, 0, 15, 3, 1, 1, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(92, 0, 15, 4, 1, 1, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(93, 0, 15, 5, 1, 1, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(94, 0, 15, 6, 1, 1, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(95, 0, 15, 7, 1, 1, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(96, 0, 15, 8, 1, 1, 0, '2025-08-27 21:26:24', '2025-08-27 21:26:24'),
(97, 0, 16, 1, 0, 0, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(98, 0, 16, 2, 1, 1, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(99, 0, 16, 3, 1, 1, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(100, 0, 16, 4, 1, 1, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(101, 0, 16, 5, 1, 1, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(102, 0, 16, 6, 1, 1, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(103, 0, 16, 7, 1, 1, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(104, 0, 16, 8, 1, 1, 0, '2025-08-29 17:39:33', '2025-08-29 17:39:33'),
(105, 0, 17, 1, 0, 0, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(106, 0, 17, 2, 1, 1, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(107, 0, 17, 3, 1, 1, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(108, 0, 17, 4, 1, 1, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(109, 0, 17, 5, 1, 1, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(110, 0, 17, 6, 1, 1, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(111, 0, 17, 7, 1, 1, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(112, 0, 17, 8, 1, 1, 0, '2025-08-29 18:37:58', '2025-08-29 18:37:58'),
(113, 0, 18, 1, 0, 0, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(114, 0, 18, 2, 1, 1, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(115, 0, 18, 3, 1, 1, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(116, 0, 18, 4, 1, 1, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(117, 0, 18, 5, 1, 1, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(118, 0, 18, 6, 1, 1, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(119, 0, 18, 7, 1, 1, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(120, 0, 18, 8, 1, 1, 0, '2025-09-02 06:36:04', '2025-09-02 06:36:04'),
(121, 0, 19, 1, 0, 0, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(122, 0, 19, 2, 1, 1, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(123, 0, 19, 3, 1, 1, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(124, 0, 19, 4, 1, 1, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(125, 0, 19, 5, 1, 1, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(126, 0, 19, 6, 1, 1, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(127, 0, 19, 7, 1, 1, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(128, 0, 19, 8, 1, 1, 0, '2025-09-03 12:44:29', '2025-09-03 12:44:29'),
(129, 0, 20, 1, 0, 0, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(130, 0, 20, 2, 1, 1, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(131, 0, 20, 3, 1, 1, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(132, 0, 20, 4, 1, 1, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(133, 0, 20, 5, 1, 1, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(134, 0, 20, 6, 1, 1, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(135, 0, 20, 7, 1, 1, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(136, 0, 20, 8, 1, 1, 0, '2025-09-05 18:07:13', '2025-09-05 18:07:13'),
(137, 0, 21, 1, 0, 0, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(138, 0, 21, 2, 1, 1, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(139, 0, 21, 3, 1, 1, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(140, 0, 21, 4, 1, 1, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(141, 0, 21, 5, 1, 1, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(142, 0, 21, 6, 1, 1, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(143, 0, 21, 7, 1, 1, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(144, 0, 21, 8, 1, 1, 0, '2025-09-05 18:08:51', '2025-09-05 18:08:51'),
(145, 0, 22, 1, 0, 0, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(146, 0, 22, 2, 1, 1, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(147, 0, 22, 3, 1, 1, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(148, 0, 22, 4, 1, 1, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(149, 0, 22, 5, 1, 1, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(150, 0, 22, 6, 1, 1, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(151, 0, 22, 7, 1, 1, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(152, 0, 22, 8, 1, 1, 0, '2025-09-05 18:16:03', '2025-09-05 18:16:03'),
(153, 0, 23, 1, 0, 0, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(154, 0, 23, 2, 1, 1, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(155, 0, 23, 3, 1, 1, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(156, 0, 23, 4, 1, 1, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(157, 0, 23, 5, 1, 1, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(158, 0, 23, 6, 1, 1, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(159, 0, 23, 7, 1, 1, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(160, 0, 23, 8, 1, 1, 0, '2025-09-06 20:06:23', '2025-09-06 20:06:23'),
(161, 0, 24, 1, 0, 0, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(162, 0, 24, 2, 1, 1, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(163, 0, 24, 3, 1, 1, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(164, 0, 24, 4, 1, 1, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(165, 0, 24, 5, 1, 1, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(166, 0, 24, 6, 1, 1, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(167, 0, 24, 7, 1, 1, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(168, 0, 24, 8, 1, 1, 0, '2025-09-08 12:37:39', '2025-09-08 12:37:39'),
(169, 0, 25, 1, 0, 0, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(170, 0, 25, 2, 1, 1, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(171, 0, 25, 3, 1, 1, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(172, 0, 25, 4, 1, 1, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(173, 0, 25, 5, 1, 1, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(174, 0, 25, 6, 1, 1, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(175, 0, 25, 7, 1, 1, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(176, 0, 25, 8, 1, 1, 0, '2025-09-08 14:18:33', '2025-09-08 14:18:33'),
(177, 0, 26, 1, 0, 0, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(178, 0, 26, 2, 1, 1, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(179, 0, 26, 3, 1, 1, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(180, 0, 26, 4, 1, 1, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(181, 0, 26, 5, 1, 1, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(182, 0, 26, 6, 1, 1, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(183, 0, 26, 7, 1, 1, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(184, 0, 26, 8, 1, 1, 0, '2025-09-08 15:32:40', '2025-09-08 15:32:40'),
(185, 0, 27, 1, 0, 0, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(186, 0, 27, 2, 1, 1, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(187, 0, 27, 3, 1, 1, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(188, 0, 27, 4, 1, 1, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(189, 0, 27, 5, 1, 1, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(190, 0, 27, 6, 1, 1, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(191, 0, 27, 7, 1, 1, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(192, 0, 27, 8, 1, 1, 0, '2025-09-08 18:48:29', '2025-09-08 18:48:29'),
(193, 0, 28, 1, 0, 0, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(194, 0, 28, 2, 1, 1, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(195, 0, 28, 3, 1, 1, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(196, 0, 28, 4, 1, 1, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(197, 0, 28, 5, 1, 1, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(198, 0, 28, 6, 1, 1, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(199, 0, 28, 7, 1, 1, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(200, 0, 28, 8, 1, 1, 0, '2025-09-12 07:10:34', '2025-09-12 07:10:34'),
(201, 0, 29, 1, 0, 0, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(202, 0, 29, 2, 1, 1, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(203, 0, 29, 3, 1, 1, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(204, 0, 29, 4, 1, 1, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(205, 0, 29, 5, 1, 1, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(206, 0, 29, 6, 1, 1, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(207, 0, 29, 7, 1, 1, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(208, 0, 29, 8, 1, 1, 0, '2025-09-12 07:54:06', '2025-09-12 07:54:06'),
(209, 0, 30, 1, 0, 0, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(210, 0, 30, 2, 1, 1, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(211, 0, 30, 3, 1, 1, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(212, 0, 30, 4, 1, 1, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(213, 0, 30, 5, 1, 1, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(214, 0, 30, 6, 1, 1, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(215, 0, 30, 7, 1, 1, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(216, 0, 30, 8, 1, 1, 0, '2025-09-12 09:27:56', '2025-09-12 09:27:56'),
(217, 0, 31, 1, 0, 0, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(218, 0, 31, 2, 1, 1, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(219, 0, 31, 3, 1, 1, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(220, 0, 31, 4, 1, 1, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(221, 0, 31, 5, 1, 1, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(222, 0, 31, 6, 1, 1, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(223, 0, 31, 7, 1, 1, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(224, 0, 31, 8, 1, 1, 0, '2025-09-12 15:24:55', '2025-09-12 15:24:55'),
(225, 0, 32, 1, 0, 0, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(226, 0, 32, 2, 1, 1, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(227, 0, 32, 3, 1, 1, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(228, 0, 32, 4, 1, 1, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(229, 0, 32, 5, 1, 1, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(230, 0, 32, 6, 1, 1, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(231, 0, 32, 7, 1, 1, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(232, 0, 32, 8, 1, 1, 0, '2025-09-13 16:22:55', '2025-09-13 16:22:55'),
(233, 0, 33, 1, 0, 0, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(234, 0, 33, 2, 1, 1, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(235, 0, 33, 3, 1, 1, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(236, 0, 33, 4, 1, 1, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(237, 0, 33, 5, 1, 1, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(238, 0, 33, 6, 1, 1, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(239, 0, 33, 7, 1, 1, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(240, 0, 33, 8, 1, 1, 0, '2025-09-17 20:24:39', '2025-09-17 20:24:39'),
(241, 0, 34, 1, 0, 0, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(242, 0, 34, 2, 1, 1, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(243, 0, 34, 3, 1, 1, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(244, 0, 34, 4, 1, 1, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(245, 0, 34, 5, 1, 1, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(246, 0, 34, 6, 1, 1, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(247, 0, 34, 7, 1, 1, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(248, 0, 34, 8, 1, 1, 0, '2025-09-24 10:58:57', '2025-09-24 10:58:57'),
(249, 0, 35, 1, 0, 0, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(250, 0, 35, 2, 1, 1, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(251, 0, 35, 3, 1, 1, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(252, 0, 35, 4, 1, 1, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(253, 0, 35, 5, 1, 1, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(254, 0, 35, 6, 1, 1, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(255, 0, 35, 7, 1, 1, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(256, 0, 35, 8, 1, 1, 0, '2025-09-24 18:04:03', '2025-09-24 18:04:03'),
(257, 0, 36, 1, 0, 0, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(258, 0, 36, 2, 1, 1, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(259, 0, 36, 3, 1, 1, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(260, 0, 36, 4, 1, 1, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(261, 0, 36, 5, 1, 1, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(262, 0, 36, 6, 1, 1, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(263, 0, 36, 7, 1, 1, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(264, 0, 36, 8, 1, 1, 0, '2025-09-25 15:48:21', '2025-09-25 15:48:21'),
(265, 0, 37, 1, 0, 0, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(266, 0, 37, 2, 1, 1, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(267, 0, 37, 3, 1, 1, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(268, 0, 37, 4, 1, 1, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(269, 0, 37, 5, 1, 1, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(270, 0, 37, 6, 1, 1, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(271, 0, 37, 7, 1, 1, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(272, 0, 37, 8, 1, 1, 0, '2025-09-25 16:48:32', '2025-09-25 16:48:32'),
(273, 0, 38, 1, 0, 0, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(274, 0, 38, 2, 1, 1, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(275, 0, 38, 3, 1, 1, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(276, 0, 38, 4, 1, 1, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(277, 0, 38, 5, 1, 1, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(278, 0, 38, 6, 1, 1, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(279, 0, 38, 7, 1, 1, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(280, 0, 38, 8, 1, 1, 0, '2025-09-25 18:20:43', '2025-09-25 18:20:43'),
(281, 0, 39, 1, 0, 0, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(282, 0, 39, 2, 1, 1, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(283, 0, 39, 3, 1, 1, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(284, 0, 39, 4, 1, 1, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(285, 0, 39, 5, 1, 1, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(286, 0, 39, 6, 1, 1, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(287, 0, 39, 7, 1, 1, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(288, 0, 39, 8, 1, 1, 0, '2025-09-25 19:23:10', '2025-09-25 19:23:10'),
(289, 0, 40, 1, 0, 0, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(290, 0, 40, 2, 1, 1, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(291, 0, 40, 3, 1, 1, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(292, 0, 40, 4, 1, 1, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(293, 0, 40, 5, 1, 1, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(294, 0, 40, 6, 1, 1, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(295, 0, 40, 7, 1, 1, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(296, 0, 40, 8, 1, 1, 0, '2025-09-25 22:05:05', '2025-09-25 22:05:05'),
(297, 0, 41, 1, 0, 0, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(298, 0, 41, 2, 1, 1, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(299, 0, 41, 3, 1, 1, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(300, 0, 41, 4, 1, 1, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(301, 0, 41, 5, 1, 1, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(302, 0, 41, 6, 1, 1, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(303, 0, 41, 7, 1, 1, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(304, 0, 41, 8, 1, 1, 0, '2025-09-26 10:27:11', '2025-09-26 10:27:11'),
(305, 0, 42, 1, 0, 0, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(306, 0, 42, 2, 1, 1, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(307, 0, 42, 3, 1, 1, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(308, 0, 42, 4, 1, 1, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(309, 0, 42, 5, 1, 1, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(310, 0, 42, 6, 1, 1, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(311, 0, 42, 7, 1, 1, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(312, 0, 42, 8, 1, 1, 0, '2025-09-26 12:15:53', '2025-09-26 12:15:53'),
(313, 0, 43, 1, 0, 0, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(314, 0, 43, 2, 1, 1, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(315, 0, 43, 3, 1, 1, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(316, 0, 43, 4, 1, 1, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(317, 0, 43, 5, 1, 1, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(318, 0, 43, 6, 1, 1, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(319, 0, 43, 7, 1, 1, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(320, 0, 43, 8, 1, 1, 0, '2025-09-26 15:50:14', '2025-09-26 15:50:14'),
(321, 0, 46, 1, 0, 0, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(322, 0, 46, 2, 1, 1, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(323, 0, 46, 3, 1, 1, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(324, 0, 46, 4, 1, 1, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(325, 0, 46, 5, 1, 1, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(326, 0, 46, 6, 1, 1, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(327, 0, 46, 7, 1, 1, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(328, 0, 46, 8, 1, 1, 0, '2025-09-26 18:07:56', '2025-09-26 18:07:56'),
(329, 0, 47, 1, 0, 0, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(330, 0, 47, 2, 1, 1, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(331, 0, 47, 3, 1, 1, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(332, 0, 47, 4, 1, 1, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(333, 0, 47, 5, 1, 1, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(334, 0, 47, 6, 1, 1, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(335, 0, 47, 7, 1, 1, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(336, 0, 47, 8, 1, 1, 0, '2025-09-27 11:20:24', '2025-09-27 11:20:24'),
(337, 0, 48, 1, 0, 0, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(338, 0, 48, 2, 1, 1, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(339, 0, 48, 3, 1, 1, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(340, 0, 48, 4, 1, 1, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(341, 0, 48, 5, 1, 1, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(342, 0, 48, 6, 1, 1, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(343, 0, 48, 7, 1, 1, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(344, 0, 48, 8, 1, 1, 0, '2025-09-27 11:38:16', '2025-09-27 11:38:16'),
(345, 0, 49, 1, 0, 0, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(346, 0, 49, 2, 1, 1, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(347, 0, 49, 3, 1, 1, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(348, 0, 49, 4, 1, 1, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(349, 0, 49, 5, 1, 1, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(350, 0, 49, 6, 1, 1, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(351, 0, 49, 7, 1, 1, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(352, 0, 49, 8, 1, 1, 0, '2025-09-27 12:26:35', '2025-09-27 12:26:35'),
(353, 0, 50, 1, 0, 0, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(354, 0, 50, 2, 1, 1, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(355, 0, 50, 3, 1, 1, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(356, 0, 50, 4, 1, 1, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(357, 0, 50, 5, 1, 1, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(358, 0, 50, 6, 1, 1, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(359, 0, 50, 7, 1, 1, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(360, 0, 50, 8, 1, 1, 0, '2025-09-27 12:49:53', '2025-09-27 12:49:53'),
(361, 0, 3, 1, 0, 0, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(362, 0, 3, 2, 1, 1, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(363, 0, 3, 3, 1, 1, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(364, 0, 3, 4, 1, 1, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(365, 0, 3, 5, 1, 1, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(366, 0, 3, 6, 1, 1, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(367, 0, 3, 7, 1, 1, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(368, 0, 3, 8, 1, 1, 0, '2025-09-27 15:28:39', '2025-09-27 15:28:39'),
(369, 0, 6, 1, 0, 0, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(370, 0, 6, 2, 1, 1, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(371, 0, 6, 3, 1, 1, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(372, 0, 6, 4, 1, 1, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(373, 0, 6, 5, 1, 1, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(374, 0, 6, 6, 1, 1, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(375, 0, 6, 7, 1, 1, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(376, 0, 6, 8, 1, 1, 0, '2025-09-27 16:30:41', '2025-09-27 16:30:41'),
(377, 0, 11, 1, 0, 0, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41'),
(378, 0, 11, 2, 1, 1, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41'),
(379, 0, 11, 3, 1, 1, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41'),
(380, 0, 11, 4, 1, 1, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41'),
(381, 0, 11, 5, 1, 1, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41'),
(382, 0, 11, 6, 1, 1, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41'),
(383, 0, 11, 7, 1, 1, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41'),
(384, 0, 11, 8, 1, 1, 0, '2025-09-27 17:13:41', '2025-09-27 17:13:41');

-- --------------------------------------------------------

--
-- Table structure for table `bl_media`
--

CREATE TABLE `bl_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `extension` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `sub_directory` text NOT NULL,
  `size` text NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_media`
--

INSERT INTO `bl_media` (`id`, `name`, `extension`, `type`, `sub_directory`, `size`, `seller_id`, `created_at`, `updated_at`) VALUES
(1, '1758704403_premium_plan.png', 'png', 'image/png', 'products/media/', '83.8 KB', 0, '2025-09-24 14:30:03', '2025-09-24 14:30:03'),
(2, '1758704412_standard_plan.png', 'png', 'image/png', 'products/media/', '91.75 KB', 0, '2025-09-24 14:30:12', '2025-09-24 14:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `bl_migrations`
--

CREATE TABLE `bl_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_migrations`
--

INSERT INTO `bl_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_04_19_162005_create_admins_table', 1),
(6, '2022_04_19_162451_create_areas_table', 1),
(7, '2022_04_19_162712_create_carts_table', 1),
(8, '2022_04_19_162902_create_categories_table', 1),
(9, '2022_04_19_163557_create_cities_table', 1),
(10, '2022_04_19_163656_create_delivery_boys_table', 1),
(11, '2022_04_19_164613_create_delivery_boy_notifications_table', 1),
(12, '2022_04_19_164915_create_devices_table', 1),
(13, '2022_04_19_165016_create_faqs_table', 1),
(14, '2022_04_19_165227_create_favorites_table', 1),
(15, '2022_04_19_165315_create_fund_transfers_table', 1),
(16, '2022_04_19_165516_create_invoices_table', 1),
(17, '2022_04_19_165749_create_media_table', 1),
(18, '2022_04_19_165926_create_newsletters_table', 1),
(19, '2022_04_19_170143_create_notifications_table', 1),
(20, '2022_04_19_170450_create_offers_table', 1),
(21, '2022_04_19_170910_create_orders_table', 1),
(22, '2022_04_19_172151_create_order_bank_transfers_table', 1),
(23, '2022_04_19_172308_create_order_items_table', 1),
(24, '2022_04_19_172843_create_order_trackings_table', 1),
(25, '2022_04_20_151502_create_payments_table', 1),
(26, '2022_04_20_151611_create_payment_requests_table', 1),
(27, '2022_04_20_151716_create_pickup_locations_table', 1),
(28, '2022_04_20_151845_create_pincodes_table', 1),
(29, '2022_04_20_151954_create_products_table', 1),
(30, '2022_04_20_152511_create_product_variants_table', 1),
(31, '2022_04_20_152844_create_promo_codes_table', 1),
(32, '2022_04_20_153012_create_return_requests_table', 1),
(33, '2022_04_20_153129_create_sections_table', 1),
(34, '2022_04_20_153246_create_sellers_table', 1),
(35, '2022_04_20_154006_create_seller_commissions_table', 1),
(36, '2022_04_20_154147_create_seller_transactions_table', 1),
(37, '2022_04_20_154148_create_delivery_boy_transactions_table', 1),
(38, '2022_04_20_154343_create_seller_wallet_transactions_table', 1),
(39, '2022_04_20_154514_create_settings_table', 1),
(40, '2022_04_20_154550_create_sliders_table', 1),
(41, '2022_04_20_154642_create_social_media_table', 1),
(42, '2022_04_20_154726_create_sub_categories_table', 1),
(43, '2022_04_20_154923_create_taxes_table', 1),
(44, '2022_04_20_155025_create_time_slots_table', 1),
(45, '2022_04_20_155123_create_transactions_table', 1),
(46, '2022_04_20_155303_create_units_table', 1),
(47, '2022_04_20_155359_create_updates_table', 1),
(48, '2022_04_20_155800_create_user_addresses_table', 1),
(49, '2022_04_20_160100_create_wallet_transactions_table', 1),
(50, '2022_04_20_160235_create_withdrawal_requests_table', 1),
(51, '2022_05_23_061317_create_permission_categories_table', 1),
(52, '2022_05_23_165755_create_permission_tables', 1),
(53, '2022_06_04_070341_create_product_images_table', 1),
(54, '2022_06_04_103202_create_user_tokens_table', 1),
(55, '2022_07_05_174502_create_order_status_lists_table', 1),
(56, '2022_07_09_074747_create_panel_notifications_table', 1),
(57, '2022_08_16_180725_create_brands_table', 1),
(58, '2022_08_24_160823_create_countries_table', 1),
(59, '2022_10_01_055428_create_app_usages_table', 1),
(60, '2022_11_15_062504_create_sessions_table', 1),
(61, '2022_12_03_071819_add_remark_to_sellers_table', 1),
(62, '2022_12_03_071820_add_fssai_lic_no_to_sellers_table', 1),
(63, '2022_12_03_094442_add_remark_to_delivery_boys_table', 1),
(64, '2022_12_03_104000_create_mail_settings_table', 1),
(65, '2022_12_17_095005_create_admin_tokens_table', 1),
(66, '2022_12_27_113410_create_jobs_table', 1),
(67, '2022_19_01_060237_create_order_statuses_table', 1),
(68, '2023_01_23_122915_add_row_order_to_sections_table', 1),
(69, '2023_02_03_062618_add_type_link_to_notifications_table', 1),
(70, '2023_04_04_101932_add_bonus_fields_delivery_boys_table', 1),
(71, '2023_04_10_095427_add_delivery_boy_bonus_details_to_orders_table', 1),
(72, '2023_04_17_114556_add_remark_to_withdrawal_requests_table', 1),
(73, '2023_06_05_103829_create_supported_languages_table', 1),
(74, '2023_06_05_110120_create_languages_table', 1),
(75, '2023_07_12_091437_add_login_info_to_admins_table', 1),
(76, '2023_08_21_091438_add_fssai_lic_no_to_products_table', 1),
(77, '2023_08_25_091446_add_promo_code_id_to_orders_table', 1),
(78, '2023_08_25_091447_add_display_name_to_languages_table', 1),
(79, '2023_08_25_091448_make_alternate_mobile_nullable_in_user_addresses_table', 1),
(80, '2023_08_25_091449_add_reason_to_return_requests_table', 1),
(81, '2023_11_21_091448_create_product_ratings_table', 1),
(82, '2023_11_21_091449_create_rating_images_table', 1),
(83, '2023_11_22_091438_change_fssai_lic_no_to_sellers_table', 1),
(84, '2023_11_22_091439_change_balance_to_sellers_table', 1),
(85, '2024_02_08_071157_add_database_backup_to_permission_categories_table', 1),
(86, '2024_02_08_073229_add_database_backup_download_to_permissions_table', 1),
(87, '2024_02_13_073230_add_logo_to_countries_table', 1),
(88, '2024_02_13_073231_add_type_to_offers_table', 1),
(89, '2024_02_21_073231_add_transaction_to_wallet_transactions_table', 1),
(90, '2024_05_03_073231_chnage_transaction_to_wallet_transactions_table', 1),
(91, '2024_05_15_193349_update_category_slugs', 1),
(92, '2024_05_30_191339_add_receipt_image_to_withdrawal_requests_table', 1),
(93, '2024_06_05_185723_change_message_field_to_text_in_withdrawal_requests_table', 1),
(94, '2024_06_25_100707_add_platform_to_user_tokens_table', 1),
(95, '2024_06_25_130635_add_platform_to_admin_tokens_table', 1),
(96, '2024_07_13_115457_add_type_to_users_table', 1),
(97, '2024_07_17_164832_add_settings_login_data', 1),
(98, '2024_07_23_171435_create_tags_table', 1),
(99, '2024_07_23_182103_create_product_tag_table', 1),
(100, '2024_07_23_182126_populate_tags_and_product_tag_table', 1),
(101, '2024_07_29_111452_add_zone_to_cities_table', 1),
(102, '2024_07_29_174919_change_city_id_type_in_sellers_table', 1),
(103, '2024_08_11_142038_create_cart_notifications_table', 1),
(104, '2024_08_27_145716_create_sms_verifications_table', 1),
(105, '2024_08_31_115932_add_sms_status_to_mail_settings_table', 1),
(106, '2024_08_31_145736_create_sms_templates_table', 1),
(107, '2024_09_09_124731_remove_auth_id_from_users_table', 1),
(108, '2024_09_27_123118_add_fields_to_sections_table', 1),
(109, '2024_10_01_192703_create_live_tracking_table', 1),
(110, '2024_10_02_163103_alter_fixed_charge_and_per_km_charge_in_cities_table', 1),
(111, '2024_10_23_172210_add_email_verification_to_users_table', 1),
(112, '2024_10_28_160050_add_barcode_to_products_table', 1),
(113, '2025_01_09_145736_create_email_templates_table', 1),
(114, '2025_01_09_170143_create_emails_table', 1),
(115, '2025_02_05_225134_add_cancellation_reason_to_order_items_table', 1),
(116, '2025_03_03_191815_add_meta_fields_to_categories_table', 1),
(117, '2025_03_03_191815_add_meta_fields_to_products_table', 1),
(118, '2025_05_28_191221_create_web_seo_pages_table', 1),
(119, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(120, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(121, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(122, '2016_06_01_000004_create_oauth_clients_table', 2),
(123, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(124, '2025_05_06_104350_create_pos_users_table', 3),
(125, '2025_05_06_104501_create_pos_orders_table', 3),
(126, '2025_05_06_104856_create_pos_order_items_table', 3),
(127, '2025_07_21_000000_add_additional_charges_to_orders_table', 3),
(128, '2025_07_28_add_original_total_to_orders_table', 3),
(129, '2025_07_29_add_remaining_final_to_orders_table', 3),
(130, '2025_08_13_000000_create_api_call_tracking_table', 3),
(131, '2019_05_03_000001_create_customer_columns', 4),
(132, '2019_05_03_000002_create_subscriptions_table', 4),
(133, '2019_05_03_000003_create_subscription_items_table', 4),
(134, '2025_08_27_171918_add_image_to_plans_table', 4),
(135, '2025_08_30_115558_create_user_plans_table', 5),
(136, '2025_08_30_120100_add_free_delivery_to_plans_table', 6),
(137, '2025_09_01_111704_add_expire_date_to_user_plans_table', 7),
(138, '2025_09_19_164926_add_cashback_point_to_products_table', 8),
(139, '2025_09_19_174348_create_wallet_point_transactions_table', 9),
(140, '2025_09_22_153842_create_stories_table', 10),
(141, '2025_09_23_110407_create_stories_table', 11),
(142, '2025_09_23_114604_create_home_settings_table', 12),
(143, '2025_09_24_125954_add_max_cashback_use_to_products_table', 13),
(144, '2025_09_24_163400_add_become_member_to_home_settings_table', 14),
(145, '2025_09_25_101526_add_become_member_image_to_plans_table', 15),
(146, '2025_09_25_111653_add_refer_earn_to_home_settings_table', 16),
(147, '2025_09_26_112517_add_user_by_to_wallet_transactions_table', 17),
(148, '2025_09_26_114824_add_message_to_wallet_point_transactions_table', 18),
(149, '2025_09_26_123701_add_packing_fields_to_orders_table', 19),
(150, '2025_09_27_133230_add_reg_self_ecocoin_to_home_settings_table', 20),
(151, '2025_09_27_142523_add_user_by_to_wallet_transactions_table', 21),
(152, '2025_09_29_163335_add_feed_the_needy_to_orders_table', 22),
(153, '2025_10_02_103223_add_credit_point_to_orders_table', 23),
(154, '2025_10_10_103558_add_cancelled_by_to_orders_table', 24),
(155, '2025_10_10_123934_add_cod_payment_status_to_orders_table', 25),
(156, '2025_10_31_163842_add_only_category_to_sections_table', 26),
(157, '2025_11_03_101857_create_farm_preneurs_table', 27),
(158, '2025_11_03_133151_create_feature_products_table', 28),
(159, '2025_11_03_155719_add_special_to_feature_products_table', 28),
(160, '2025_11_03_173034_create_why_ecoleaf_table', 29),
(161, '2025_11_03_182756_create_customer_feedback_table', 30),
(162, '2025_11_04_121655_create_stock_notify_table', 31),
(163, '2025_11_15_120929_create_chat_table', 32),
(164, '2025_11_22_124859_add_sequence_to_sections_table', 33),
(165, '2025_12_30_101246_add_offer_product_to_products_table', 34);

-- --------------------------------------------------------

--
-- Table structure for table `bl_model_has_permissions`
--

CREATE TABLE `bl_model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_model_has_roles`
--

CREATE TABLE `bl_model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_model_has_roles`
--

INSERT INTO `bl_model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bl_newsletters`
--

CREATE TABLE `bl_newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_notifications`
--

CREATE TABLE `bl_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type_link` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_oauth_access_tokens`
--

CREATE TABLE `bl_oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_oauth_access_tokens`
--

INSERT INTO `bl_oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('007324d4b0b5afbc98d707b45f737ddb51bdac073d222d3ce8e1d13df46a4dbae8b790097a07f53c', 45, 1, 'authToken', '[]', 0, '2025-11-11 11:17:20', '2025-11-11 11:17:20', '2026-11-11 11:17:20'),
('007ffd882499fc82ef1508bf0e0cc5a25632f21ae5716e6bf53710c9f3900e565abc212f1ffd820d', 19, 1, 'authToken', '[]', 0, '2025-11-18 19:15:48', '2025-11-18 19:15:48', '2026-11-18 19:15:48'),
('017366ee647d4f742fb9532c64266046b6142eca9d91bcd6b07119aa306d72089bfe8bdd7087f64c', 31, 1, 'authToken', '[]', 0, '2025-11-15 12:42:47', '2025-11-15 12:42:47', '2026-11-15 12:42:47'),
('01c284d2e8bf0725c533c4f40144ad30f76db1b0f9df82902491b578713362a2e6bca5515aa25d4c', 21, 1, 'authToken', '[]', 0, '2025-11-04 15:55:33', '2025-11-04 15:55:33', '2026-11-04 15:55:33'),
('01e551f4586b38bc14d6ae70a36595481d79b7491c4279d91b6b81d91d8ead9b6b3ef3f99e271801', 1, 1, 'authToken', '[]', 0, '2025-11-20 21:51:21', '2025-11-20 21:51:21', '2026-11-20 21:51:21'),
('02545e239ea21ff7c12ff1f4e3e35b840c396a6efd645846e3d0dd4c5a7cb882514ef00b4e14c733', 10, 1, 'authToken', '[]', 0, '2025-12-31 16:25:49', '2025-12-31 16:25:49', '2026-12-31 16:25:49'),
('0262b87e8319c57e3fd75e39476a8a22992c50911217d42b6b28ee56090e15280f3c7b24573027bb', 147, 1, 'authToken', '[]', 0, '2025-12-25 13:00:46', '2025-12-25 13:00:46', '2026-12-25 13:00:46'),
('02f8fbbd473055fe0a1982706fa0dcf7c3d85d4cedc4b749f953e382ad354340a1ee72494e16eb3b', 10, 1, 'authToken', '[]', 0, '2025-11-06 18:23:21', '2025-11-06 18:23:21', '2026-11-06 18:23:21'),
('032cb7497ddcf4f4c2f8a7fcdfc8c0b47bbac313c6e011d7b7fc15d30f27f8109ab33c0587aaa15e', 16, 1, 'authToken', '[]', 0, '2025-11-28 15:28:56', '2025-11-28 15:28:56', '2026-11-28 15:28:56'),
('033923ae1955d659cb10a73d3e9e0ee78c0f055565884928a699fc9b27dce26b81e389876f517a4b', 16, 1, 'authToken', '[]', 0, '2025-11-15 14:11:24', '2025-11-15 14:11:24', '2026-11-15 14:11:24'),
('036c0430a2cac6c0a5adabe4f9b7765387bf333c8be27689308a52ab172cd9ea60204662d64cdc09', 13, 1, 'authToken', '[]', 0, '2025-11-04 09:03:38', '2025-11-04 09:03:38', '2026-11-04 09:03:38'),
('03cdb40179232344e0ab95e6491a56d3bce397b35151e6249208ce4997b7b8a82237d34ee8bf3e6b', 1, 1, 'authToken', '[]', 0, '2025-11-07 05:01:13', '2025-11-07 05:01:13', '2026-11-07 05:01:13'),
('043de955bc47499426a94faa5d144b3ba67536b54ac6dbc23e3a679e8de5a2dfad8fcc6712b5f2bb', 16, 1, 'authToken', '[]', 0, '2025-12-04 17:42:37', '2025-12-04 17:42:37', '2026-12-04 17:42:37'),
('048734eda3429eaa2d984d56f27ead21857224c2b17c30ec81bea7be5f8075f2cbc5ac2279459a6a', 166, 1, 'authToken', '[]', 0, '2026-01-05 14:59:27', '2026-01-05 14:59:27', '2027-01-05 14:59:27'),
('05096502c57e96b5745b78668199ae09c5b3534efe6aa87d26f3897ec1a23d8db8938c4b74dc78fd', 123, 1, 'authToken', '[]', 0, '2025-12-22 15:56:17', '2025-12-22 15:56:17', '2026-12-22 15:56:17'),
('0595aad5f643e0aa4ec40b7370180cd498f46237fcc12d8e161887c2b34b12177a8ea2730f00f746', 44, 1, 'authToken', '[]', 0, '2025-11-09 11:14:21', '2025-11-09 11:14:21', '2026-11-09 11:14:21'),
('05bce74e400c365a6e6433c5c1a1e2d824184e4920b852006cefbbbacd1b4045c6fe173eba888bc5', 10, 1, 'authToken', '[]', 0, '2025-12-03 15:22:45', '2025-12-03 15:22:45', '2026-12-03 15:22:45'),
('060c64f56fe4320053b0463a5b1fb04a815b9663897b9ded7accacdef511139cc56bc32765ee876e', 19, 1, 'authToken', '[]', 0, '2025-11-19 17:19:43', '2025-11-19 17:19:43', '2026-11-19 17:19:43'),
('0639d7b7db9012a24c755a902a9aa130466e64e76255a01933ce7e6069c4a29169af55ca747d21cb', 12, 1, 'authToken', '[]', 0, '2025-11-03 17:49:36', '2025-11-03 17:49:36', '2026-11-03 17:49:36'),
('064c3d7725162d78ccbebb491f19f34598ad51456b587d55b9258d35fdbb92e1c6d6fdd5cb954be8', 8, 1, 'authToken', '[]', 0, '2025-11-20 15:24:20', '2025-11-20 15:24:20', '2026-11-20 15:24:20'),
('066d6457517d29f90adb781da17e6386242ec6cb5536f652aa7d1f94e9849e1abdb15cc2b4fcb8c5', 160, 1, 'authToken', '[]', 0, '2026-01-01 19:08:20', '2026-01-01 19:08:20', '2027-01-01 19:08:20'),
('06df5c084856b81e37cd166acafa968bbc06865a7a438cab21af9956bc8982165b4da314a2f64af8', 19, 1, 'authToken', '[]', 0, '2025-11-19 14:05:13', '2025-11-19 14:05:13', '2026-11-19 14:05:13'),
('06f81fe16d51723865436da4d9e8f1453de2d1a3aea7d841c1520ef48a5d45ecfc183942f1a9a9de', 1, 1, 'authToken', '[]', 0, '2025-12-06 10:05:14', '2025-12-06 10:05:14', '2026-12-06 10:05:14'),
('07772291ae25462554dedad36c685a0c8fd164a9d35f7b3e15b5c7bde376bb123e4127ec77c3ce51', 10, 1, 'authToken', '[]', 1, '2025-11-21 15:26:30', '2025-11-21 15:26:30', '2026-11-21 15:26:30'),
('0780cc530c3ce9148eb2d73bcb42e38cc8cfc6d5712401e879af12e597f04d813c67872839f0e19b', 1, 1, 'authToken', '[]', 0, '2025-12-31 15:31:59', '2025-12-31 15:31:59', '2026-12-31 15:31:59'),
('07ade5a34267ead1c47684de82f93176951c36efce06c9836c0104f6111855f41ffc038884ad5df6', 1, 1, 'authToken', '[]', 0, '2025-12-21 20:31:56', '2025-12-21 20:31:56', '2026-12-21 20:31:56'),
('086703ec484da8911fe283434cfacb8adec31af70ab7a57f6e0d8bdae869af4034cec6e9c0ce98b9', 10, 1, 'authToken', '[]', 0, '2025-11-08 11:57:19', '2025-11-08 11:57:19', '2026-11-08 11:57:19'),
('092e46a972951cf65b3dda1b6bf5d412ba50ab065ae79b8c777fd9422a5dfd3ec71ca16d698d2fdd', 1, 1, 'authToken', '[]', 0, '2025-11-05 16:46:29', '2025-11-05 16:46:29', '2026-11-05 16:46:29'),
('098338e92539a46ff37dbe043a26263831a35f6c0c57a77248e4659fd5e42ce989462ee829f5abb7', 10, 1, 'authToken', '[]', 0, '2025-11-09 11:36:42', '2025-11-09 11:36:42', '2026-11-09 11:36:42'),
('0aaaea18d91ad56a8f75a484cc22c292d5c4f6df5cfde7f4db56c12772625c59e7b87f8b580ee72d', 10, 1, 'authToken', '[]', 0, '2026-01-08 10:26:21', '2026-01-08 10:26:21', '2027-01-08 10:26:21'),
('0b17d7c3af5467d293c9c63f499f7edd99279ddfaf55427f02687316c16ea28022bd0e96a8b92ef4', 124, 1, 'authToken', '[]', 0, '2025-12-23 11:23:28', '2025-12-23 11:23:28', '2026-12-23 11:23:28'),
('0c0236f522f61b121b7a6f360ac85f99809fb6dab95dde8bdde6c8cad280afd567142b0d384d0f9a', 21, 1, 'authToken', '[]', 0, '2025-11-05 16:15:47', '2025-11-05 16:15:47', '2026-11-05 16:15:47'),
('0c7dd0f93f9fac5d05f007863d53af3408918aada155e6fa7c749dc04138ed451350f419e014e2f1', 21, 1, 'authToken', '[]', 0, '2025-11-04 13:19:18', '2025-11-04 13:19:18', '2026-11-04 13:19:18'),
('0c7e58a45058808008629f3edb86138f76c052aee72473bdf70d44e0703472b8e8f9c6aecbbbfd8b', 1, 1, 'authToken', '[]', 0, '2025-12-22 16:38:50', '2025-12-22 16:38:50', '2026-12-22 16:38:50'),
('0cbda866c578e5b2ae5519138cbfc5256eea097da533ca4035b0f4af741bdd0347e961725e4e4cf3', 19, 1, 'authToken', '[]', 0, '2025-11-19 14:08:17', '2025-11-19 14:08:17', '2026-11-19 14:08:17'),
('0cdec436e9f8da1b351561c00d98dab13f647bea97ec965dd77fc2d6e3f2f1a12d94f0123f5a23d0', 21, 1, 'authToken', '[]', 0, '2025-11-06 13:49:50', '2025-11-06 13:49:50', '2026-11-06 13:49:50'),
('0ce98d1c44d68a2b71e135b3ce7717fcf35cdc6e07ace798118cbfe2b0adf0282fbf8e1810948ae0', 1, 1, 'authToken', '[]', 0, '2025-12-18 16:40:31', '2025-12-18 16:40:31', '2026-12-18 16:40:31'),
('0d1612fac6dc85a4ab78143a921490a63c7c7f6918029b50d7c1ed769c36b3d15ac97a54cefd8e24', 1, 1, 'authToken', '[]', 0, '2025-12-10 16:04:46', '2025-12-10 16:04:46', '2026-12-10 16:04:46'),
('0e17e1b03d1fa6d796824ceae8842b76a49a234b32f6cae83a3eaa32d7ba0355500bf4ab1aec46c2', 11, 1, 'authToken', '[]', 0, '2025-11-17 07:12:39', '2025-11-17 07:12:39', '2026-11-17 07:12:39'),
('0e623416e6c2d5ef6d7fc1bef9b389897349f5f590c47df246071b4791f9e7e3bc1063039b2dac81', 10, 1, 'authToken', '[]', 0, '2025-11-22 16:21:49', '2025-11-22 16:21:49', '2026-11-22 16:21:49'),
('0e72e18b846c45fa42a4e99e0180e5b2ee93ef7f333e69f9f6dc9fa81183fe7f0754bf62b46303da', 1, 1, 'authToken', '[]', 0, '2025-11-05 07:51:08', '2025-11-05 07:51:08', '2026-11-05 07:51:08'),
('0e885d2df78b3769e9ea168fbd5f126b2985b5f9d16d171c16f663aef220f89d22eca1781571fa4d', 1, 1, 'authToken', '[]', 0, '2025-11-26 18:10:11', '2025-11-26 18:10:11', '2026-11-26 18:10:11'),
('0ed0e46f75ccf365219c1b17c0799fc69ef2bc2f2687be57bfa15b946a2fc19ee6b7ff5799caa71e', 1, 1, 'authToken', '[]', 0, '2025-11-22 12:28:16', '2025-11-22 12:28:16', '2026-11-22 12:28:16'),
('0fe176fb526863d250da5aae8f170ecb9d97c3d9c5eca7819b0b72b9edb50cc30641bf759acf9e1d', 22, 1, 'authToken', '[]', 0, '2025-11-20 10:00:49', '2025-11-20 10:00:49', '2026-11-20 10:00:49'),
('1011330839d202f3beddff1ef51d24e3acc9ced7495f98a281f4776a4edf8c0ac48bfbef4b451cf3', 157, 1, 'authToken', '[]', 0, '2025-12-29 12:56:23', '2025-12-29 12:56:23', '2026-12-29 12:56:23'),
('108b089f2eab5244bb38429b6d4d201f961c5e92022fd8748e8b0d2ff0435f7edc52a2dcab64b0d9', 21, 1, 'authToken', '[]', 0, '2025-11-18 11:05:14', '2025-11-18 11:05:14', '2026-11-18 11:05:14'),
('10d6a6c9da66f475776f724134c9df0bf804a945ef08f98bd576f0fe3f23abb9753c05c6744c1d7a', 80, 1, 'authToken', '[]', 0, '2025-11-25 05:37:35', '2025-11-25 05:37:35', '2026-11-25 05:37:35'),
('110056daa2eaad30ef809e1b966cd266742970503c4fffdc6bcd9398d4999a46be173fa5909e134d', 173, 1, 'authToken', '[]', 0, '2026-01-06 14:02:21', '2026-01-06 14:02:21', '2027-01-06 14:02:21'),
('110b0c3bd54f49a06af41ad7170c424e2c129831374d0256fda00ae9b22787a72f1f79d582c3ea51', 22, 1, 'authToken', '[]', 0, '2025-11-07 12:30:04', '2025-11-07 12:30:04', '2026-11-07 12:30:04'),
('112d500c230574fc0d46ae2addbf78e1ce51f928758805cf7b02335fd36bb9e894924b84910adaf2', 1, 1, 'authToken', '[]', 0, '2025-12-31 13:01:28', '2025-12-31 13:01:28', '2026-12-31 13:01:28'),
('115911dea708a79dc1eddb89c0b6c7c47c8374ef4ad85f7b754ba9dbacb31d6609fa55b5b34b83cd', 136, 1, 'authToken', '[]', 0, '2025-12-24 15:33:55', '2025-12-24 15:33:55', '2026-12-24 15:33:55'),
('117010a3b54fbcdcfaf238a9668b8e0daf93e23a39c2da67c8d6fbcf2dfbbcc3138942eb9a7954e9', 91, 1, 'authToken', '[]', 0, '2025-11-20 21:30:37', '2025-11-20 21:30:37', '2026-11-20 21:30:37'),
('11bc7eee1babb5c9ae49068b2b94f92501fe7b97ed7bbccd594c2a294a7916bcbf476d000763c4ef', 1, 1, 'authToken', '[]', 0, '2025-12-08 13:32:27', '2025-12-08 13:32:27', '2026-12-08 13:32:27'),
('120721cd456277a3d38c7109b86f74ee2b0da1fde0311d420c4124727e335da79abfaeb5eba37e71', 2, 1, 'authToken', '[]', 0, '2025-12-04 13:51:20', '2025-12-04 13:51:20', '2026-12-04 13:51:20'),
('120c8a0ade725cb40ff2468618c06e51b5ddaef30a1f99f9726427e84d6ce57143ee5face6fc5973', 1, 1, 'authToken', '[]', 0, '2026-01-08 16:54:56', '2026-01-08 16:54:56', '2027-01-08 16:54:56'),
('125276314b60fca4bfdc93ae9153338d7e3a5eeec695f20eea17611cffa313ac1ddf220d8a9e0bca', 19, 1, 'authToken', '[]', 0, '2025-11-09 05:53:28', '2025-11-09 05:53:28', '2026-11-09 05:53:28'),
('1269c17584a63bda2fc68ee4a9a6346edabaff752cc1b747cf496fb243de3c251b24c805d1419fdd', 50, 1, 'authToken', '[]', 0, '2025-11-06 23:30:18', '2025-11-06 23:30:18', '2026-11-06 23:30:18'),
('12d464770ac517d7d1b1ef5ed9797e27870ed9861fa89c14c2411c2b0887c0c65ae00c156f12c050', 1, 1, 'authToken', '[]', 0, '2025-11-03 17:47:32', '2025-11-03 17:47:32', '2026-11-03 17:47:32'),
('13406e0abc95c6523fd77040ec374fb5717c008233034fd7a8fd09a32940f3e3faa4b3317d542a7b', 21, 1, 'authToken', '[]', 0, '2025-11-17 10:43:02', '2025-11-17 10:43:02', '2026-11-17 10:43:02'),
('137d1189fc4b794d7f73df6c1d45ec0f54e49aa0e3336ed522c5a4b18ba6e3aca0906fc9bf51022b', 10, 1, 'authToken', '[]', 0, '2025-12-23 15:11:40', '2025-12-23 15:11:40', '2026-12-23 15:11:40'),
('1461fa252b756c67b1c9a74a137b247bad78102125606602d848e049d2f2f41b3f1b08e5671640d6', 1, 1, 'authToken', '[]', 0, '2025-12-04 10:04:51', '2025-12-04 10:04:51', '2026-12-04 10:04:51'),
('14687758050511e8907ac0fd82f4119d05a3074ecc04d3fcd47250ef8058a1028ef98dfb5decd318', 94, 1, 'authToken', '[]', 0, '2025-11-24 10:39:30', '2025-11-24 10:39:30', '2026-11-24 10:39:30'),
('14bf1f17be50b1be978301df1530d72703365752e750a832d406e8735d28c49a5f2bb5d53ca3c1e7', 38, 1, 'authToken', '[]', 0, '2025-11-03 21:53:15', '2025-11-03 21:53:15', '2026-11-03 21:53:15'),
('151a868c7b1e66fb6109a5c7adf1912eb8b1d27393cbe6e4fabee9f8c662e80d8e9eab4f7298e5bd', 16, 1, 'authToken', '[]', 0, '2025-11-30 10:06:56', '2025-11-30 10:06:56', '2026-11-30 10:06:56'),
('15ec6b8d4af386f33a47af99d86a4e07225af4618779636d09c25bda700d7673e77032982b8fc867', 10, 1, 'authToken', '[]', 0, '2025-11-08 11:42:01', '2025-11-08 11:42:01', '2026-11-08 11:42:01'),
('1641d52167d94e818fe83ae0fbabff948ee3e09ba1e573cdb36ad59744aaa07ae86edad490fcf50b', 12, 1, 'authToken', '[]', 0, '2025-11-08 14:18:03', '2025-11-08 14:18:03', '2026-11-08 14:18:03'),
('165767a32894c5f2afe6dd1e319d6c88886432349fc2a22bb9391df9545384f935b59626eb01a99b', 16, 1, 'authToken', '[]', 0, '2025-12-04 10:08:55', '2025-12-04 10:08:55', '2026-12-04 10:08:55'),
('1670d6e7a43a2a31ad074b3e2b675373d422049e03a6ac7baac80de1b12dc6eed58f855377a0b843', 1, 1, 'authToken', '[]', 0, '2025-11-08 10:54:24', '2025-11-08 10:54:24', '2026-11-08 10:54:24'),
('16bdf80642dbc2ce361ec81e72cb86cd746dba889c94ab37a0216173e6807030b28b06064a805b6c', 133, 1, 'authToken', '[]', 0, '2025-12-24 12:51:50', '2025-12-24 12:51:50', '2026-12-24 12:51:50'),
('172538ebd2315f891c4dcfdfadb33248bd4388aa522b7d79ab1350ec4223e8625861419799debb8e', 10, 1, 'authToken', '[]', 0, '2026-01-07 15:14:35', '2026-01-07 15:14:35', '2027-01-07 15:14:35'),
('174c842186e354e2edb73ead083ab44f9562092acd0acc0041a8ea97d7f41da46fe4fb1ed09202ad', 115, 1, 'authToken', '[]', 0, '2025-12-16 20:00:37', '2025-12-16 20:00:37', '2026-12-16 20:00:37'),
('17c78a87ac983108eb123d27b43a775f4bd238758b8211d6748dc2b5092abc9926bcd619e08aac24', 1, 1, 'authToken', '[]', 0, '2025-11-25 12:42:10', '2025-11-25 12:42:10', '2026-11-25 12:42:10'),
('181d05d280e6b95443b32c2650eba112b1b780d924b7d2889ff2858d64b0d419ae34fd4ccc09317e', 1, 1, 'authToken', '[]', 0, '2025-11-13 18:38:26', '2025-11-13 18:38:26', '2026-11-13 18:38:26'),
('1923d79eb1823e321096bb731f1fb197ada683a09ee8ddb1d8b47e53773c2c1b7510fbdef76b175e', 1, 1, 'authToken', '[]', 0, '2025-11-22 13:23:23', '2025-11-22 13:23:23', '2026-11-22 13:23:23'),
('19a49019571f4721d29ddaf8501cc74bbf287f262862c2e69dd23d14dad26874d989fe6011b478b2', 176, 1, 'authToken', '[]', 0, '2026-01-08 11:58:56', '2026-01-08 11:58:56', '2027-01-08 11:58:56'),
('19e9416146273c42d1736346d56e676fc136d73a229d1a36303428419fd12a28bcf8094aa94f1fbc', 8, 1, 'authToken', '[]', 0, '2025-11-18 10:48:48', '2025-11-18 10:48:48', '2026-11-18 10:48:48'),
('1a0dd914641e51fcaf0c589428b91673c35627edc2ac407307b76bf73c998593861675be6406f079', 1, 1, 'authToken', '[]', 0, '2025-12-27 17:02:47', '2025-12-27 17:02:47', '2026-12-27 17:02:47'),
('1adf7119cf860875ed5f95ddc2adeec7ec50130bb2ee0d69acccced54d1f06896a5785bfcdaf7248', 1, 1, 'authToken', '[]', 0, '2025-12-10 16:14:49', '2025-12-10 16:14:49', '2026-12-10 16:14:49'),
('1ae6630e271dafc1dea7e9e2e8e51739e999c2907abe73de911ca62f69346cde45dfa9ea08bce219', 10, 1, 'authToken', '[]', 0, '2025-12-18 16:36:15', '2025-12-18 16:36:15', '2026-12-18 16:36:15'),
('1af48526bf65d4b4f40d453da2da0c8ce6e87ede65da9b1ea2179351837a95e716a72f3e589f6f40', 10, 1, 'authToken', '[]', 0, '2025-11-10 10:44:41', '2025-11-10 10:44:41', '2026-11-10 10:44:41'),
('1b5dee0df7f71ccd37ac4ea5f23e0eb14fec31ca1c6ba52806bb53bfb1d891bde1116715b6f4a896', 1, 1, 'authToken', '[]', 0, '2025-11-20 22:04:07', '2025-11-20 22:04:07', '2026-11-20 22:04:07'),
('1bd27ca8c8bff79c3bd1e72905500fbcaef27046db2e3828dd690d1d8949f225c920b21b3d276a9e', 1, 1, 'authToken', '[]', 0, '2025-11-11 10:16:02', '2025-11-11 10:16:02', '2026-11-11 10:16:02'),
('1cbc72db2df3f4bca3c8b73b93c7ac12ba4ace28add64e8b7bf58bab031f9b6330d79b3e5a3ef166', 11, 1, 'authToken', '[]', 0, '2025-11-09 16:53:52', '2025-11-09 16:53:52', '2026-11-09 16:53:52'),
('1d36e316a8477fc2c7914d284beaa1282ef6d87c6b9aa74e1c3cd5a2b8a36637408e27393f7c7562', 10, 1, 'authToken', '[]', 0, '2025-11-09 12:08:22', '2025-11-09 12:08:22', '2026-11-09 12:08:22'),
('1e98aad8c42697dd904d53a76ffcb4793fa8a120408dd448f1b818eb0d7c05183914a1d349256043', 16, 1, 'authToken', '[]', 0, '2025-11-08 13:02:39', '2025-11-08 13:02:39', '2026-11-08 13:02:39'),
('1ea1091f2a22fc8e59bbc8826ec0821fb4d0f31f51369f20c47663bc4a53099d0a76db852a6a5bae', 1, 1, 'authToken', '[]', 0, '2025-11-20 09:58:43', '2025-11-20 09:58:43', '2026-11-20 09:58:43'),
('1efe5498c64ca5f2860bb038b434aebc32930c07a20d273c222ff33dc1d687ae9f1a7a65f11b993a', 44, 1, 'authToken', '[]', 0, '2025-11-05 10:35:24', '2025-11-05 10:35:24', '2026-11-05 10:35:24'),
('1f3c10dc948348ab44679dc47587a4d209561b585359662c7a01452287e1d6544fbae10ed1f74784', 79, 1, 'authToken', '[]', 0, '2025-11-11 12:15:50', '2025-11-11 12:15:50', '2026-11-11 12:15:50'),
('1f8029e2f9749559c1f3d0fd07ff41e0fd6fa91d44b03803102787c851c8f3d877c1df193b7be0a4', 152, 1, 'authToken', '[]', 0, '2025-12-25 17:39:59', '2025-12-25 17:39:59', '2026-12-25 17:39:59'),
('20307f81fc1bebabe1dac5aa96616b9dba9a7412f1c9fd5bf2e5bcf3be083ccf8b9640d48c772e9b', 1, 1, 'authToken', '[]', 0, '2025-12-17 18:03:22', '2025-12-17 18:03:22', '2026-12-17 18:03:22'),
('204ea7b82559957904be6c51b89220ad4cafcbcd619a03aae70eeb607593a7e2fc2e2faae25cb2cb', 19, 1, 'authToken', '[]', 0, '2025-11-12 19:31:56', '2025-11-12 19:31:56', '2026-11-12 19:31:56'),
('20d736b27a4ef07e80b051daecce5ed49c0488696242782c1168bb429c9df35c6f56e65a2f8e5c83', 1, 1, 'authToken', '[]', 0, '2025-11-25 18:08:42', '2025-11-25 18:08:42', '2026-11-25 18:08:42'),
('20dc9df0d1de5e214f8e48ff1422b2b6109939c35aa41c9c12965bf63936657bf79da887d8afc4c4', 19, 1, 'authToken', '[]', 0, '2025-11-09 02:42:10', '2025-11-09 02:42:10', '2026-11-09 02:42:10'),
('20dd40a767e5158db210af30bfd4b1740df363f54b57b9f0c84ee4134863aa001ec87983f6eb4464', 19, 1, 'authToken', '[]', 0, '2025-11-18 16:08:16', '2025-11-18 16:08:16', '2026-11-18 16:08:16'),
('2115f07cf75f1b033ee516e692d91955920f61398b5ac51e78a9f10218a3e0a5f30f251de5e0a60b', 106, 1, 'authToken', '[]', 0, '2025-12-05 21:00:27', '2025-12-05 21:00:27', '2026-12-05 21:00:27'),
('211992093c7833e4468e261e147abf0110874fa40c86fa2805cf362c149efbcce72e64cb501a6017', 107, 1, 'authToken', '[]', 0, '2025-12-09 09:31:40', '2025-12-09 09:31:40', '2026-12-09 09:31:40'),
('2271f37c5840d9970669af9bac6a65163fd6fe9742c5a605d4786ae019360d68a3466360d4fa53c9', 1, 1, 'authToken', '[]', 0, '2025-11-09 12:11:57', '2025-11-09 12:11:57', '2026-11-09 12:11:57'),
('22923fae5562bf6d225d138be5bd3ea66854dc90cea512b1bb2eeac2861acf3420b05adb8b8210fd', 16, 1, 'authToken', '[]', 1, '2026-01-07 10:02:49', '2026-01-07 10:02:49', '2027-01-07 10:02:49'),
('230b3303b315c962001475ef8609c88140c17ca6195bc211800c2d2781b16cc74475595286f38d59', 1, 1, 'authToken', '[]', 0, '2025-12-15 11:28:52', '2025-12-15 11:28:52', '2026-12-15 11:28:52'),
('230b70ba5402752fa1c4ce342ea022d997af62e15bae0b5cb2227dc92c32d0eb52594de3a5f15925', 154, 1, 'authToken', '[]', 0, '2025-12-27 13:25:39', '2025-12-27 13:25:39', '2026-12-27 13:25:39'),
('233f28ed45be0c11b3ee4a4fc1306391f7292f5193b7807334f731c9f8111405d1853a717ec3336a', 27, 1, 'authToken', '[]', 0, '2025-11-21 17:32:24', '2025-11-21 17:32:24', '2026-11-21 17:32:24'),
('235545b12a2cb36b62dd019574462b673cfcc8bccf7d464cbaf60a7bf964247829c0cc02a0ba8094', 1, 1, 'authToken', '[]', 0, '2025-11-10 16:49:37', '2025-11-10 16:49:37', '2026-11-10 16:49:37'),
('23d0de55a3eb6546368fd600c520f1d07114f857cf219890ca8ee9ea2e3426747ce7d3c396d45e72', 77, 1, 'authToken', '[]', 0, '2025-11-11 11:42:43', '2025-11-11 11:42:43', '2026-11-11 11:42:43'),
('241d3d49636d776d36cb579b291e28307d050b8a49c3345da77a81f32c7101299d74fc5caeb1263d', 1, 1, 'authToken', '[]', 0, '2025-11-21 09:49:49', '2025-11-21 09:49:49', '2026-11-21 09:49:49'),
('244cb015d56fc3a11e1eba9bb69d33e64d17fc6697bea0d5fec4f8674a76e9e6ccff721d6d42bca1', 78, 1, 'authToken', '[]', 0, '2025-12-01 12:55:44', '2025-12-01 12:55:44', '2026-12-01 12:55:44'),
('2465894a465994f834ff8e3500165332671f58dc01e0f71054fcb32ed13077222797f65c32229343', 11, 1, 'authToken', '[]', 0, '2025-11-04 08:52:38', '2025-11-04 08:52:38', '2026-11-04 08:52:38'),
('247467a41449b85f60c0c426daeb178b97e362d282b17f404e8f9e39f26eb13317ff1d36055acc42', 10, 1, 'authToken', '[]', 0, '2025-11-27 15:03:44', '2025-11-27 15:03:44', '2026-11-27 15:03:44'),
('254725985b668b9927066a6b4d006ac9d755dca731ff14d2006df29838b01f2f3ccd063cec711f32', 87, 1, 'authToken', '[]', 0, '2025-11-19 18:21:37', '2025-11-19 18:21:37', '2026-11-19 18:21:37'),
('25d4a4cdee0b43be24d06665e95d3ce5161eb16818432b7edff734d10eb6d97c2b308633efe75f79', 21, 1, 'authToken', '[]', 0, '2025-11-20 16:29:53', '2025-11-20 16:29:53', '2026-11-20 16:29:53'),
('26a9e5e465933541559d89c8a512e4f89a36ebe8df29270cfeddbd3bf7f5316cddd5e4d54f75dabc', 10, 1, 'authToken', '[]', 0, '2025-12-05 21:29:22', '2025-12-05 21:29:22', '2026-12-05 21:29:22'),
('26b561f942a3610a2423e7bb2beba361df91208e9222e09f3210e7b675908201a7d564197aaf7907', 1, 1, 'authToken', '[]', 0, '2025-11-27 15:08:58', '2025-11-27 15:08:58', '2026-11-27 15:08:58'),
('26ec0029097f9d2c8e0ac984be820cbb9930ae04c818c79d5b2b417fa1ce2ab93888093cdf9bd3f9', 1, 1, 'authToken', '[]', 0, '2025-11-30 11:32:54', '2025-11-30 11:32:54', '2026-11-30 11:32:54'),
('271ea1af102d9c4c2a99fbdaf5de3d7464b29210973088a020b512c730670cb423e100be3f597abe', 21, 1, 'authToken', '[]', 0, '2025-11-05 15:50:45', '2025-11-05 15:50:45', '2026-11-05 15:50:45'),
('278fb733b4aeda669f2e3446471e41902fb50546327837338f3d66ca400002bf79819d38514ac31e', 84, 1, 'authToken', '[]', 1, '2025-11-14 21:07:30', '2025-11-14 21:07:30', '2026-11-14 21:07:30'),
('279ffd83203d2af1e6a01451e4510a92f8b8b4dd2ecd8da326dca775c890b61ff783bda374258227', 21, 1, 'authToken', '[]', 0, '2025-11-25 10:47:56', '2025-11-25 10:47:56', '2026-11-25 10:47:56'),
('281547b841e40c28a0bb91bb5081224f8b1937f8a0ea300df00267d6cac7b5d7a330665f6827d42e', 10, 1, 'authToken', '[]', 0, '2025-11-04 16:53:02', '2025-11-04 16:53:02', '2026-11-04 16:53:02'),
('28207dd1605e6c7a7e38eb0f99422ca052e373684ebebe38ff5210e416c67c32ab2dc0170325d010', 1, 1, 'authToken', '[]', 0, '2025-11-13 17:31:01', '2025-11-13 17:31:01', '2026-11-13 17:31:01'),
('2825b8075345bb9d3104f03a157a4d55d30e8cd6ad9310aca92fb6c2afdde0455629e5f03581b338', 1, 1, 'authToken', '[]', 0, '2025-11-22 09:40:21', '2025-11-22 09:40:21', '2026-11-22 09:40:21'),
('283e05ff307e79faff8fe6e8def570c593266a48347f140202cbdc71d27318b7d6b4ff3dc4045724', 1, 1, 'authToken', '[]', 0, '2025-12-30 10:01:25', '2025-12-30 10:01:25', '2026-12-30 10:01:25'),
('2869ccc0fb9501d8885b88cef854eae920c9058cbebda52562f9a792bbbabc3ea551de43bab95b70', 22, 1, 'authToken', '[]', 0, '2025-11-07 11:51:50', '2025-11-07 11:51:50', '2026-11-07 11:51:50'),
('28a29deb3d4a55bd99ae5d3152ff30676cbaf30a0a98bbdd6a2be3881e5afb9783ac9d65a62b9f32', 10, 1, 'authToken', '[]', 0, '2026-01-02 16:44:25', '2026-01-02 16:44:25', '2027-01-02 16:44:25'),
('28d2c284a14f6d09ac7358e1be4dab45c909bdf6baa04551849f562efe6cc12488a381cd46a9520d', 1, 1, 'authToken', '[]', 0, '2025-12-04 13:37:03', '2025-12-04 13:37:03', '2026-12-04 13:37:03'),
('28d70b86a30bbfc30330f7e33e99c3c21d4e353856fdc563ae76e7a4926907f98a77b8b6acc4a185', 21, 1, 'authToken', '[]', 0, '2025-12-22 16:33:56', '2025-12-22 16:33:56', '2026-12-22 16:33:56'),
('2a42d00a34a678ec0b7b6f7e31a65a4734c3d3ceeb30c801cf30790977e4959f5c9ee56b4920090d', 10, 1, 'authToken', '[]', 0, '2025-12-04 16:18:45', '2025-12-04 16:18:45', '2026-12-04 16:18:45'),
('2a55a4e3c1e31fcc6abe2e08a5da51a31023eda5942b50d05132bdf6fc89c8e41a0fc7c0ccccd8cb', 1, 1, 'authToken', '[]', 0, '2025-12-24 17:49:32', '2025-12-24 17:49:32', '2026-12-24 17:49:32'),
('2ab3950a553a001916e793b4db6aeb5cc779798558b4b33af294d5c77de2143e92b903b6ccb3d2ba', 1, 1, 'authToken', '[]', 0, '2025-12-30 18:10:39', '2025-12-30 18:10:39', '2026-12-30 18:10:39'),
('2b498c54d54e1e4f3f30a5a7c612be4314cbaaf1fdeb8a9fad6706529faa2a37ea4b06e1a0322931', 16, 1, 'authToken', '[]', 1, '2025-12-14 09:54:06', '2025-12-14 09:54:06', '2026-12-14 09:54:06'),
('2bbddd3648cd8effe9f54a3f711af22f230f3de739d3da827d2e52009fafd701f4317c642ca7bd27', 179, 1, 'authToken', '[]', 0, '2026-01-08 14:08:48', '2026-01-08 14:08:48', '2027-01-08 14:08:48'),
('2c3f7a37281b8f74146448c22020037a4199cbd23887b84472ec7ad686321c8f72cedc39a3f9edf7', 73, 1, 'authToken', '[]', 0, '2025-11-11 10:26:18', '2025-11-11 10:26:18', '2026-11-11 10:26:18'),
('2c4c849c5d40e3ce9d063ccd844faa7d7f137f3b2b832a4e4a4c898b49ef882e8702628dcaf69dd4', 31, 1, 'authToken', '[]', 0, '2025-11-17 11:47:09', '2025-11-17 11:47:09', '2026-11-17 11:47:09'),
('2d1a3bed36a3ea7d42e8265801797ac79ff396f6eb56f497d8e8add38edc21287d63df065e13ee4d', 19, 1, 'authToken', '[]', 0, '2025-11-18 15:21:20', '2025-11-18 15:21:20', '2026-11-18 15:21:20'),
('2d2487dad862d2889f791def9ccf3cbc29d8e0fbd3ceb2119df315b5e5b18760a73faa3a088050e8', 1, 1, 'authToken', '[]', 0, '2026-01-08 10:10:47', '2026-01-08 10:10:47', '2027-01-08 10:10:47'),
('2d4fa08c283f05ac1352f9eda140e4bdd15f625d908b8fdcc816c096ed82b49d9a12cbc42ee64e39', 1, 1, 'authToken', '[]', 0, '2025-12-04 13:46:34', '2025-12-04 13:46:34', '2026-12-04 13:46:34'),
('2dd0a1cb353d3f13de591a923e71443bbdfcd955011fd6da2c20e6fd747bb05cff6362e59a06c7bd', 1, 1, 'authToken', '[]', 0, '2025-11-13 12:23:06', '2025-11-13 12:23:06', '2026-11-13 12:23:06'),
('2e5038fc681f0b592d7f71c2262cf527bf62ef129c5f7314d830f9f3f49238571fa925a79710e4cd', 21, 1, 'authToken', '[]', 0, '2025-11-20 11:01:00', '2025-11-20 11:01:00', '2026-11-20 11:01:00'),
('2ed4d65b57fabfa6e738a9c0ac617bee5f2fa12cc7140744801c70a18bae6c1b5e14af37c8dc6413', 25, 1, 'authToken', '[]', 0, '2025-11-16 11:10:01', '2025-11-16 11:10:01', '2026-11-16 11:10:01'),
('2f4c039bea4fa14940cc34ef9579f06b5622a32a778381a894c502dc3b595d0cfbb7bf1dc346b573', 12, 1, 'authToken', '[]', 0, '2025-11-17 15:33:40', '2025-11-17 15:33:40', '2026-11-17 15:33:40'),
('2f9a12d98a9e0d8036a70608c039880ec1f413e59d53053408945b72ef3f67db7651fe8a521cbf8e', 19, 1, 'authToken', '[]', 0, '2025-11-18 15:21:54', '2025-11-18 15:21:54', '2026-11-18 15:21:54'),
('30993882d1453b4765e3c53314300d27a27698c9392077e50e7774cff2736fa1b6dc0bb2938f0486', 1, 1, 'authToken', '[]', 0, '2025-11-14 12:21:47', '2025-11-14 12:21:47', '2026-11-14 12:21:47'),
('30ffc2d509572191f5ad49ef1f915972028457478093690b1b496d36c03dc7689f28cf92640526db', 10, 1, 'authToken', '[]', 0, '2025-12-05 15:47:10', '2025-12-05 15:47:10', '2026-12-05 15:47:10'),
('3125e9170b15b21019dd0940370c7b3346c27bbd29a5ea175846ead9b2d446a7344fd560db934efb', 88, 1, 'authToken', '[]', 0, '2025-11-20 16:33:10', '2025-11-20 16:33:10', '2026-11-20 16:33:10'),
('31d9cc8d5251a9e12a5834cff1740cda41167c5dfecda05913014dfaf3a5332a6b2daabff9b1ac9a', 1, 1, 'authToken', '[]', 0, '2025-11-06 20:17:41', '2025-11-06 20:17:41', '2026-11-06 20:17:41'),
('31f91519b8bceff03175d4c56545e6542fa96cde98876dbe4b3faa1659d49121707abb98e734b739', 1, 1, 'authToken', '[]', 0, '2025-11-26 18:09:43', '2025-11-26 18:09:43', '2026-11-26 18:09:43'),
('32447f849d0674a905144dd388f352c51ed0b15cc4e6870d44d7f213ecb9235da8f15aa259112f4e', 10, 1, 'authToken', '[]', 0, '2025-11-26 17:11:51', '2025-11-26 17:11:51', '2026-11-26 17:11:51'),
('32785fdb80399ad1a0c7c48eb82bd173f6631ff78722ea3153af45da1a6f0dc7b4c6ca1837359ebf', 180, 1, 'authToken', '[]', 0, '2026-01-08 14:48:01', '2026-01-08 14:48:01', '2027-01-08 14:48:01'),
('3292b5c88894eb31f4eb855568fdc33aa4a9ffdb7674af5a49066f28f0955dafc90e9f0b5568a031', 1, 1, 'authToken', '[]', 0, '2025-11-10 12:18:11', '2025-11-10 12:18:11', '2026-11-10 12:18:11'),
('32eb3dddc144cff3d48750c7101b9dd4773675430b9d5847f4ec7602c55288cbc240dccf64c05cd1', 1, 1, 'authToken', '[]', 0, '2025-11-15 18:51:17', '2025-11-15 18:51:17', '2026-11-15 18:51:17'),
('332ae80cb8753ed98de46c55ff3e60b629e5ea9966bee753a0b7c27f6d83f136162ac49a4af5479f', 172, 1, 'authToken', '[]', 0, '2026-01-06 14:00:11', '2026-01-06 14:00:11', '2027-01-06 14:00:11'),
('3377e3f57904943c76566486e61b972de207b2fc4addef01a7c4ad4b039e49a31de4ebd0cffaaa0b', 12, 1, 'authToken', '[]', 0, '2025-11-07 09:54:31', '2025-11-07 09:54:31', '2026-11-07 09:54:31'),
('344ed73dcc308330659e07f87d512236513e5edb1918d001446b7a2fd73c9438122826691026c9a6', 47, 1, 'authToken', '[]', 0, '2025-11-06 16:57:54', '2025-11-06 16:57:54', '2026-11-06 16:57:54'),
('34c3a08b70c216408e4509bbe9fb32bd88c3162466dd595e66835551a0177c91f500bad1ee8a980e', 48, 1, 'authToken', '[]', 0, '2025-11-06 17:58:51', '2025-11-06 17:58:51', '2026-11-06 17:58:51'),
('34fa58befb028527f941a6252c2e00dbcec9ff162405a3f23582e40410ed477d7371639dc6c68d3d', 1, 1, 'authToken', '[]', 0, '2025-11-29 09:54:09', '2025-11-29 09:54:09', '2026-11-29 09:54:09'),
('3512c53708406c693d7442964924e02bc73bed9a4dea8ad40c465083b5a01a721c3d7c861d406329', 10, 1, 'authToken', '[]', 0, '2025-12-15 16:13:09', '2025-12-15 16:13:09', '2026-12-15 16:13:09'),
('352bd9072a1dffdf1c16a06d5e31f1a5782fa8c42d02aae0428c010c6c16d2c8eb77c272681c9d7e', 1, 1, 'authToken', '[]', 0, '2025-11-09 09:47:06', '2025-11-09 09:47:06', '2026-11-09 09:47:06'),
('354d023179109a0ea15d58d6bf52f0dc971358557feb399584d1b92082c7f4edde6ae0ad5164f3c9', 10, 1, 'authToken', '[]', 0, '2025-11-14 12:55:36', '2025-11-14 12:55:36', '2026-11-14 12:55:36'),
('36f34408f05a25ce97128bf04fc0ab65f41256276cf70e88af04e26a61a6a0aea02a8f3eb1832487', 16, 1, 'authToken', '[]', 0, '2025-12-29 18:29:35', '2025-12-29 18:29:35', '2026-12-29 18:29:35'),
('379c60d38b825daf4deda9c5278173891c0b9a0bd36910a34592a974836da43d9c0f917bbecd4a0c', 10, 1, 'authToken', '[]', 0, '2025-11-20 17:03:55', '2025-11-20 17:03:55', '2026-11-20 17:03:55'),
('37eaa464f7b7dd5ab13161baaa0c1d78ae7d262011d41f831b5e789b3d4ee9cab89f906c64e439a8', 65, 1, 'authToken', '[]', 0, '2025-11-08 21:48:46', '2025-11-08 21:48:46', '2026-11-08 21:48:46'),
('381f13f056111e4097d9daccca4c6e89337eb25cee21b4e60bdef60fa89ac66ac3089a069a57f9fb', 113, 1, 'authToken', '[]', 0, '2025-12-14 10:10:20', '2025-12-14 10:10:20', '2026-12-14 10:10:20'),
('39451744a9d37e08887dfcd039af03d282504fe3bac5faacbc98a075044e1142023ee58194f58b08', 21, 1, 'authToken', '[]', 0, '2025-11-21 10:56:58', '2025-11-21 10:56:58', '2026-11-21 10:56:58'),
('39859830d454441d43989b5e398f9266a3dc6389e5e95c19a0a72923958b4ecb24bac93fd0edec05', 1, 1, 'authToken', '[]', 0, '2025-11-17 14:39:10', '2025-11-17 14:39:10', '2026-11-17 14:39:10'),
('39a9d1c565da18fbf23ee99e85844a2e030e16ff0e319c18a2df7be91a03c7bc56dfb8be0d455fad', 1, 1, 'authToken', '[]', 0, '2026-01-02 09:54:39', '2026-01-02 09:54:39', '2027-01-02 09:54:39'),
('3b08e7e3bee601077b3b28a453c3ce3d4ce2db9b19a8b10b90b8f3843874de4190e602a5c4086fdb', 82, 1, 'authToken', '[]', 0, '2025-11-12 15:24:12', '2025-11-12 15:24:12', '2026-11-12 15:24:12'),
('3ba7047dee5711b221b37f294da780dcdbd3815ed0819f60fa7ebac3df2ec31664e1731ab33f5f5b', 10, 1, 'authToken', '[]', 1, '2025-11-24 20:28:20', '2025-11-24 20:28:20', '2026-11-24 20:28:20'),
('3c1bb5805b3646de1116e4c3698c4a8a074e729bddb5aacb076207bb7ee83c6819de5f84d0f2c3a7', 21, 1, 'authToken', '[]', 0, '2025-11-11 15:22:50', '2025-11-11 15:22:50', '2026-11-11 15:22:50'),
('3c7b5762dd5677a3a47a7098e26fb7505bd409cf9312d2c285401db47a50136f3ea2d517ea1b5152', 1, 1, 'authToken', '[]', 0, '2025-12-10 16:10:58', '2025-12-10 16:10:58', '2026-12-10 16:10:58'),
('3c916f86132b60cd2f899213ef915bc9b05781b9f52fba22dc4d38592d0a1d164ce497b8c42b255d', 37, 1, 'authToken', '[]', 0, '2025-12-18 17:20:40', '2025-12-18 17:20:40', '2026-12-18 17:20:40'),
('3c9da41b6cc98c8fb979777661c88404a85943b32ed9d1053362d2bd836c911bfe766d9ca0ebbd01', 1, 1, 'authToken', '[]', 0, '2025-11-22 13:21:13', '2025-11-22 13:21:13', '2026-11-22 13:21:13'),
('3cb0a044d1b57e39e9d4699e1e4860d3e668b823e6138af65c50eeef8cdd6eafca3c8ad2bcf55908', 1, 1, 'authToken', '[]', 0, '2026-01-03 13:40:39', '2026-01-03 13:40:39', '2027-01-03 13:40:39'),
('3d110d5572d5ed8be96bb00bf75f74cb78128f1f17226292dfd2dc0649da9074c9b63b3e6cd5592f', 1, 1, 'authToken', '[]', 0, '2025-11-06 18:36:26', '2025-11-06 18:36:26', '2026-11-06 18:36:26'),
('3d552df19549bdae6cbb7ae5caecf14c122bffd14cc75d9278678c16ed8b961ec09d8d701de43f09', 19, 1, 'authToken', '[]', 0, '2025-11-08 17:35:58', '2025-11-08 17:35:58', '2026-11-08 17:35:58'),
('3ef72c40b3de15aee6c5106cfc7b2479b38880c11a084de9b9c86dac04b16b3fb5a0f3ca31b6790c', 16, 1, 'authToken', '[]', 1, '2025-12-30 17:29:23', '2025-12-30 17:29:23', '2026-12-30 17:29:23'),
('3efe8b72fc09c91ec0c4a033ed35dff332ba1d1c84a69b8ecf2f238543d345ddfdddd1fabf289338', 125, 1, 'authToken', '[]', 0, '2025-12-23 11:31:43', '2025-12-23 11:31:43', '2026-12-23 11:31:43'),
('3f2628d273ae295d0f8d1961f04f11c37da5cf2c2af76d32cd6f899a60b3ba6fd2129502a569e2aa', 10, 1, 'authToken', '[]', 0, '2025-11-05 18:22:06', '2025-11-05 18:22:06', '2026-11-05 18:22:06'),
('3fae586bfcecd9059f43e50e1294f97d961d5d7d6e69e55b86f4561a0db4f32eec542dc5bc176c6e', 21, 1, 'authToken', '[]', 0, '2025-11-04 12:40:44', '2025-11-04 12:40:44', '2026-11-04 12:40:44'),
('40014b0cad4a3ab57b18fd5753d721a66b216e5d9c7311c0d813060b3f93f624e629b95b66b7258d', 10, 1, 'authToken', '[]', 1, '2025-11-05 12:07:02', '2025-11-05 12:07:02', '2026-11-05 12:07:02'),
('40504564189b5732570eca366d28e52dcdb2dc783e2694823058f33177e3d56ab0d0d68895e1c0a8', 1, 1, 'authToken', '[]', 0, '2025-11-17 15:42:18', '2025-11-17 15:42:18', '2026-11-17 15:42:18'),
('411aee8702ea0473bb20dff6cf6265610101f45e0efffc7a36d775d195ba74126ebac92282e45ecb', 109, 1, 'authToken', '[]', 0, '2025-12-09 11:09:40', '2025-12-09 11:09:40', '2026-12-09 11:09:40'),
('4144fd2441a0f7646906f45e1a666e38286b822abef1d1e56cdd774d28538621f79fbaf31e9d4010', 111, 1, 'authToken', '[]', 0, '2025-12-09 11:50:24', '2025-12-09 11:50:24', '2026-12-09 11:50:24'),
('41728623b6cef1e5921cc5c8b54a7e4d4bc2b184112613d2672a68fe8db690d4e7e45fc9207b2082', 21, 1, 'authToken', '[]', 0, '2025-11-04 13:05:38', '2025-11-04 13:05:38', '2026-11-04 13:05:38'),
('4184f10d968fb2a636ab3ebb3a1bfdf1f1fdb3e65c463dcbc8f7df8f92d51cebc204de9c45a69f89', 104, 1, 'authToken', '[]', 0, '2025-12-02 13:27:50', '2025-12-02 13:27:50', '2026-12-02 13:27:50'),
('4198e0b61c8e3617f3e371e925b0e84958012f4b446858e663bd55bc17f6633e5b83a56dd3407606', 21, 1, 'authToken', '[]', 0, '2025-11-18 16:19:07', '2025-11-18 16:19:07', '2026-11-18 16:19:07'),
('4209663d4c068625dff2606616b7c3c3bf1e718015395d129842cdea9d55a1067d9fad111932be52', 1, 1, 'authToken', '[]', 0, '2025-11-11 11:28:52', '2025-11-11 11:28:52', '2026-11-11 11:28:52'),
('42a3915acd74a44af363dcdf4fb7661eb1f61654ffd4d3b6fd915da4db8c504951c83f1295cc5acc', 10, 1, 'authToken', '[]', 0, '2025-11-03 18:14:40', '2025-11-03 18:14:40', '2026-11-03 18:14:40'),
('43279487754b855660e48da1ffaffbac106c62d652c677411f87067b4041da067a08c0316d25a9e4', 158, 1, 'authToken', '[]', 0, '2025-12-29 12:58:33', '2025-12-29 12:58:33', '2026-12-29 12:58:33'),
('4332361c723e50abe9a3fdebefd37dd7f337273b4fc1a615c9944df40bd3f4d3578a8adae13793a7', 1, 1, 'authToken', '[]', 0, '2025-11-13 15:34:23', '2025-11-13 15:34:23', '2026-11-13 15:34:23'),
('43a26f576abdf9dbff843d33f60f5c2da77debbfb0f441b3e983b4232c7c6260ba82d4a4b6e39bc4', 43, 1, 'authToken', '[]', 0, '2025-11-04 20:02:12', '2025-11-04 20:02:12', '2026-11-04 20:02:12'),
('4421e5259ff5caada94e420c5d6d79ec33aa2bdffb7bdf51a38df89c030b359d99cc7251a5581fa6', 25, 1, 'authToken', '[]', 0, '2025-11-16 11:28:41', '2025-11-16 11:28:41', '2026-11-16 11:28:41'),
('453f69d0faddfe2e97f2a4368c78c0226e4ac4f98f1c20a536a0a40c839a309f2c0e5c39cf7bc47f', 13, 1, 'authToken', '[]', 0, '2025-11-21 10:45:08', '2025-11-21 10:45:08', '2026-11-21 10:45:08'),
('45e152c45f3921181db9f97a8c87a597fec9b7a4a75ebfe7807ecdb9e71fac49bcd686e054bc9322', 117, 1, 'authToken', '[]', 0, '2025-12-18 12:08:31', '2025-12-18 12:08:31', '2026-12-18 12:08:31'),
('4639bdfbf2120c3a106570a9631513de4698b6ab6f182c6185f5818ece2d5e0de98bd5ce3e48e27e', 1, 1, 'authToken', '[]', 0, '2025-12-10 09:44:58', '2025-12-10 09:44:58', '2026-12-10 09:44:58'),
('465f3497b488cdee861dab391de27089e63245cbaef61ab3b6097f93aeb47023c8933fa9de6150aa', 61, 1, 'authToken', '[]', 0, '2025-11-08 13:44:03', '2025-11-08 13:44:03', '2026-11-08 13:44:03'),
('46c0ec219eeb9ded4f442839431af716f5edac5176a01b317cc8ff51e8d4819f8d6cbe9668075377', 9, 1, 'authToken', '[]', 0, '2025-11-05 10:22:59', '2025-11-05 10:22:59', '2026-11-05 10:22:59'),
('478f72b4b9263d9a8d7b639b0df2689f4b69d35d9d900518a76fb9d510af2868f62a7a7f8f029a56', 86, 1, 'authToken', '[]', 0, '2025-11-17 15:19:20', '2025-11-17 15:19:20', '2026-11-17 15:19:20'),
('47ac5c7de60a925944d9d581a2aef088c2b8e2cf580dae115c1db2e17f26b1ec3898568f318c046e', 10, 1, 'authToken', '[]', 0, '2026-01-07 12:41:22', '2026-01-07 12:41:22', '2027-01-07 12:41:22'),
('47f6fa37defdfe5e43a7c35dcb43c3aa4995329085e5d8fb8525ef5ad942c2e96b75dea2f4ac4817', 120, 1, 'authToken', '[]', 0, '2025-12-19 17:41:12', '2025-12-19 17:41:12', '2026-12-19 17:41:12'),
('47f78510ba8604b0ea02ead2402afa368199b00c2f814371d6a11bed07e9695d63ef7b0b8bbeae95', 22, 1, 'authToken', '[]', 0, '2025-11-03 17:57:46', '2025-11-03 17:57:46', '2026-11-03 17:57:46'),
('4800d9e68dad514d7b6976eb30e4b09f80bde47940f281d41cd17a2bd9efd206d30a52acef8fede7', 1, 1, 'authToken', '[]', 0, '2025-11-14 13:30:12', '2025-11-14 13:30:12', '2026-11-14 13:30:12'),
('48a7b66805bc1d972f25339a2db8fb73553d7b214321cebdef4b4cf987bb9c5016c501ca177f17a5', 21, 1, 'authToken', '[]', 0, '2025-11-21 15:16:51', '2025-11-21 15:16:51', '2026-11-21 15:16:51'),
('490977128381a0f65df89f1c6953f033af51e2d1e33c9ecfc83119caef20cd679a80a0adba3b87e1', 24, 1, 'authToken', '[]', 0, '2025-11-16 11:14:48', '2025-11-16 11:14:48', '2026-11-16 11:14:48'),
('499619069b3f8fdfeac7a93fa32b539b14675bde3151ed2624378efa9a2060c57c29986778c0a7b0', 1, 1, 'authToken', '[]', 0, '2025-11-22 13:12:18', '2025-11-22 13:12:18', '2026-11-22 13:12:18'),
('499e2b86a0a156f090de4d4d2ac0fbf6c7f00ea1292a9395ae5f4608178356dc3faef2be56acdec0', 1, 1, 'authToken', '[]', 0, '2025-11-04 12:16:05', '2025-11-04 12:16:05', '2026-11-04 12:16:05'),
('4a3c27a1158228f935bc49c87393db4fea5c7623f3f930fc2eb934f0921ea23017ca74a428084661', 1, 1, 'authToken', '[]', 0, '2025-11-07 12:41:59', '2025-11-07 12:41:59', '2026-11-07 12:41:59'),
('4a834c39f97d1a59b604d88bacab6dde49f4e8921320a591a688555c1217add91310b7c999dd0268', 1, 1, 'authToken', '[]', 0, '2025-11-16 10:00:56', '2025-11-16 10:00:56', '2026-11-16 10:00:56'),
('4b1244c5ac147e449f832ff973adec307ffa8899cf549e8af57f6d42fc43e90135a13004252e06d6', 1, 1, 'authToken', '[]', 0, '2025-12-10 16:04:46', '2025-12-10 16:04:46', '2026-12-10 16:04:46'),
('4c98d09d52b6a5e8dbf634e0c6199876d5a9b0fa53fd467f0cf0d8af5826da4f8b9c72918a084df2', 1, 1, 'authToken', '[]', 0, '2025-11-06 17:29:32', '2025-11-06 17:29:32', '2026-11-06 17:29:32'),
('4e42fe95cbedac28c72282e88b4ac33e09eaa1fe71c719f5584a76a36590689b1efe38a7e880eea3', 16, 1, 'authToken', '[]', 0, '2025-11-03 18:49:16', '2025-11-03 18:49:16', '2026-11-03 18:49:16'),
('4f068a91043e4a94f76d436c198b9d5a94dccacd7bce82618e1567a5af1377f42f6978649e70b771', 21, 1, 'authToken', '[]', 0, '2025-11-07 11:53:49', '2025-11-07 11:53:49', '2026-11-07 11:53:49'),
('4f6b818611901780266d0b6ccafcfa76c1a29cc91e9687ccf1949ce0e1ac546e3152fd5e47e38912', 1, 1, 'authToken', '[]', 0, '2025-12-23 14:35:40', '2025-12-23 14:35:40', '2026-12-23 14:35:40'),
('4f9488e5ffd45c09930ba1ac536fa7dbfffd44119d13cbea1e43a3a69b1d30d59c2eccd49a2f44ee', 16, 1, 'authToken', '[]', 1, '2025-11-27 16:05:03', '2025-11-27 16:05:03', '2026-11-27 16:05:03'),
('504462fc17999001a297a2b46611a3230247ac3ca9f9df30517ccbe47770c15fe22a4c95e775530f', 1, 1, 'authToken', '[]', 0, '2025-11-25 16:42:18', '2025-11-25 16:42:18', '2026-11-25 16:42:18'),
('50a8f00b4462038699dcf764fd70a2a6f3de6d6d1a9455dbe2d45ab102a0ce2588ecaec4b3d0227e', 10, 1, 'authToken', '[]', 0, '2025-12-20 12:18:23', '2025-12-20 12:18:23', '2026-12-20 12:18:23'),
('5123200aac8ab2a788775cd49034243856cc5fb094b21bc0c2bd121ae97c92667ac30731686bacd6', 1, 1, 'authToken', '[]', 0, '2025-11-15 13:41:59', '2025-11-15 13:41:59', '2026-11-15 13:41:59'),
('5191038ee931b34ddd7a5e9adcd15392956f425597a67aa9d43ee94d8715ca8bec774e264816de58', 22, 1, 'authToken', '[]', 0, '2025-11-06 19:02:58', '2025-11-06 19:02:58', '2026-11-06 19:02:58'),
('51c629732379904be9983737e91d7fafd8372dd5ede27dfc08b618b673d3721c64364a76ca80c9f9', 10, 1, 'authToken', '[]', 0, '2025-12-29 11:40:23', '2025-12-29 11:40:23', '2026-12-29 11:40:23'),
('51d1460ac27322457a7670e4f653c4974b749de4858ec45959867b558c999115e32d227b344ce0c0', 10, 1, 'authToken', '[]', 1, '2025-11-04 12:55:25', '2025-11-04 12:55:25', '2026-11-04 12:55:25'),
('51eff10e2cacaaacac90013471752d7aba94b230c6a2f6f8575e880d26190e88269040f1b3745ce4', 1, 1, 'authToken', '[]', 0, '2025-11-21 17:10:10', '2025-11-21 17:10:10', '2026-11-21 17:10:10'),
('52e47e3b647b68fd0a23b0ee2a8e6cdfacdc0a7e7fb9dbec05240faae50a4f0ce4c39e2373adb008', 1, 1, 'authToken', '[]', 0, '2025-11-15 13:39:16', '2025-11-15 13:39:16', '2026-11-15 13:39:16'),
('5396487ca9f05f8cfeba2de08c8e411b13ba3b0eac91822f5dde9ef04dec2db136439e180328673f', 40, 1, 'authToken', '[]', 0, '2025-11-04 10:30:12', '2025-11-04 10:30:12', '2026-11-04 10:30:12'),
('539ec57a0f40194e87f3c90172a9959683f291710ab91600cb6afe4d46fa6114365bdf576e0580f1', 1, 1, 'authToken', '[]', 0, '2026-01-04 18:10:22', '2026-01-04 18:10:22', '2027-01-04 18:10:22'),
('53d53df4734dfc46e6c51c5cdc908954d0c873e2a9ebfee82aa1c76fa770c71b44d1d0f9c6c9c467', 1, 1, 'authToken', '[]', 0, '2026-01-08 09:57:59', '2026-01-08 09:57:59', '2027-01-08 09:57:59'),
('544b713064d3d0f1c72fdee1c0dd28d84f31bfcf3380703493c3c90f7bb47677cdf682dfdd1cb94d', 1, 1, 'authToken', '[]', 0, '2025-11-24 20:19:00', '2025-11-24 20:19:00', '2026-11-24 20:19:00'),
('55ca131182f9a33a7312b3f74ef0dd8a5d507ac6e2a1f9f0b8dad043ee00257bbac78390412bf460', 159, 1, 'authToken', '[]', 0, '2025-12-31 21:45:21', '2025-12-31 21:45:21', '2026-12-31 21:45:21'),
('55febb1299f1833b7f0f82d7c90cc03e4654ccafdd956cc1ba2f850157ea95b4d20c17f79e38b4ce', 141, 1, 'authToken', '[]', 0, '2025-12-24 16:36:21', '2025-12-24 16:36:21', '2026-12-24 16:36:21'),
('5628c7d76f8c8ed9ca21a25c6a009f9430ff5c2522fbf1665a55664ec3f503044addb2f9ae278436', 1, 1, 'authToken', '[]', 0, '2025-11-04 12:06:55', '2025-11-04 12:06:55', '2026-11-04 12:06:55'),
('56780d46fddd011317375669c301e3c0bef07f08275bdf37732af1a03b4be627dbcfe03f82b2a7c3', 1, 1, 'authToken', '[]', 0, '2025-11-13 14:50:49', '2025-11-13 14:50:49', '2026-11-13 14:50:49'),
('56806d9877cbdb8b1ac0613fb11e403f4346067e407e4c04f621e375d0985d6ec9da35cb7521533f', 53, 1, 'authToken', '[]', 0, '2025-11-08 09:48:29', '2025-11-08 09:48:29', '2026-11-08 09:48:29'),
('568803afcbbc4fa3736e085f6120e1c7efdba77434f9b732132722709ff82e65c21e05f21ebbacf7', 1, 1, 'authToken', '[]', 0, '2025-12-01 16:00:14', '2025-12-01 16:00:14', '2026-12-01 16:00:14'),
('5705c0b64e84d6413120e6d838827bf53aa919de4cf25eca5fd659c2c0d86aead6e5f71ac242d776', 10, 1, 'authToken', '[]', 0, '2025-11-28 20:31:35', '2025-11-28 20:31:35', '2026-11-28 20:31:35'),
('57a19e2d7e62a0262c02b944c4296637c34be18b89f05910b1de67d2795b9247cef3c61018dbdd0e', 77, 1, 'authToken', '[]', 0, '2025-11-11 11:48:14', '2025-11-11 11:48:14', '2026-11-11 11:48:14'),
('57c040a4f3206e991c325bc0857b809020e518a83e64bcb7dacad3a1e2bfd95c12b5d120c5d863f4', 1, 1, 'authToken', '[]', 0, '2025-12-30 13:20:33', '2025-12-30 13:20:33', '2026-12-30 13:20:33'),
('57c74c7c53b07c4331638eaeb6354a6df094c2e7c5611906f79e4c7cb5040c0e3bc26f2024e183d6', 1, 1, 'authToken', '[]', 0, '2025-11-20 22:02:35', '2025-11-20 22:02:35', '2026-11-20 22:02:35'),
('57d36e523e277a56d9bb7673dd170e07bf98e9a8f506d2d8cf799df1d9f084bdf09e5c3542b6c62b', 10, 1, 'authToken', '[]', 0, '2025-11-20 15:29:29', '2025-11-20 15:29:29', '2026-11-20 15:29:29'),
('57eb5ec5d4887e65363083406a58850ae0918039d18f1ee076348a9078593239b40e52de60b7fc50', 21, 1, 'authToken', '[]', 0, '2025-12-25 16:08:17', '2025-12-25 16:08:17', '2026-12-25 16:08:17'),
('58a52eda465b3db3c43034c0294e6ca72c1056b6f84ae7b37559c693531a88438f2d72fe4d782dc4', 12, 1, 'authToken', '[]', 0, '2025-11-30 12:53:53', '2025-11-30 12:53:53', '2026-11-30 12:53:53'),
('597e9bb2ee1c1ba04be0cf3333948bf563284277b9c82f1e0eb9b313bf08637856f6c9e145d6726a', 1, 1, 'authToken', '[]', 0, '2025-12-14 09:49:57', '2025-12-14 09:49:57', '2026-12-14 09:49:57'),
('5b5125d65347094f07937d84a573a2cd90ef0c62d7d0cdfe1175871cc3542e346d8f47132aa04a90', 10, 1, 'authToken', '[]', 0, '2025-11-08 11:35:36', '2025-11-08 11:35:36', '2026-11-08 11:35:36'),
('5b65b5e4532323d7b15ea088b6bb77d6f2a4f44e6a6c237a8cdce3a653817f07d78bbb61c93ab4ee', 1, 1, 'authToken', '[]', 0, '2025-11-04 11:28:39', '2025-11-04 11:28:39', '2026-11-04 11:28:39'),
('5c6078d9dbfe205d167c44da4224c7bea3bdc67a21fa008d8b2b075a7ad709594f528205dd2e938a', 1, 1, 'authToken', '[]', 0, '2025-11-08 16:41:21', '2025-11-08 16:41:21', '2026-11-08 16:41:21'),
('5c64998577a08c247221483ea1d008ef236a0d023753136bac2e9557580a96154152cf5b4639b4bb', 10, 1, 'authToken', '[]', 0, '2026-01-06 22:33:12', '2026-01-06 22:33:12', '2027-01-06 22:33:12'),
('5c871a10a87dc2282c758f15c143b222385a9bb16caebf95f3216df1e6a754d2b8ac1022187068b3', 21, 1, 'authToken', '[]', 0, '2025-12-18 16:21:46', '2025-12-18 16:21:46', '2026-12-18 16:21:46'),
('5cb6c99ded5b0df569f717a6e2dedeca3f5e5d0db7ad778f2b59e9d74c49f0e2bb7515b226af8841', 1, 1, 'authToken', '[]', 0, '2025-11-06 17:05:26', '2025-11-06 17:05:26', '2026-11-06 17:05:26'),
('5d2e4a848df66938feadc72bc661b989560dca98119abfdf92c973e308a69b06a688cd43ed1f12c3', 153, 1, 'authToken', '[]', 0, '2025-12-26 11:58:21', '2025-12-26 11:58:21', '2026-12-26 11:58:21'),
('5d78d73df29e62bd365b8c26c1d396dec9dfc39581c39bf84a78ae749fed83abac2305f19946f51e', 142, 1, 'authToken', '[]', 0, '2025-12-24 16:38:59', '2025-12-24 16:38:59', '2026-12-24 16:38:59'),
('5e3bf983ba6317a5261ae5d72cb15e7c4476ada7a382adc5c14298367f2f917fd76766c0876efa24', 149, 1, 'authToken', '[]', 0, '2025-12-25 16:52:50', '2025-12-25 16:52:50', '2026-12-25 16:52:50'),
('5f2d7effa354f8d663e3dc682b1f00492588345cac4c8bee63238e467c250a3ffd134d2a67db43b5', 114, 1, 'authToken', '[]', 0, '2025-12-16 12:25:10', '2025-12-16 12:25:10', '2026-12-16 12:25:10'),
('5f4f8fd9daaeb3610e258fa31fd6391e4e2bd3cdd725fdd34d325fa6825224267c26ee0194e3df78', 1, 1, 'authToken', '[]', 0, '2025-12-16 13:11:37', '2025-12-16 13:11:37', '2026-12-16 13:11:37'),
('5fc89e87f3d45231d9c0b3546da9d2593d824627d85dfa41b29b298f7f80c654140153b50bd98568', 164, 1, 'authToken', '[]', 0, '2026-01-05 13:35:44', '2026-01-05 13:35:44', '2027-01-05 13:35:44'),
('60523b7ecf207de553f5c88d55d98f1fc83b7d1d300fe5e5ebc1e53a36e4ffab1aeee9f343614caa', 1, 1, 'authToken', '[]', 0, '2025-12-18 09:58:04', '2025-12-18 09:58:04', '2026-12-18 09:58:04'),
('610741942e2a5103d2ed378422a51abfcd22ce0f3277b8a28f7c55e5141d6cf37fec61ff4019b139', 19, 1, 'authToken', '[]', 0, '2025-11-19 19:12:31', '2025-11-19 19:12:31', '2026-11-19 19:12:31'),
('610f98973ca017aaf15d22d86ff608cf554583d45f20a62dac7fc784699ead23ec84c1deee671577', 132, 1, 'authToken', '[]', 0, '2025-12-24 12:42:57', '2025-12-24 12:42:57', '2026-12-24 12:42:57'),
('61567436454a0416bb81d60b9283d1f2a3aec6bfc6b9c17801c90bd9389162c066ca93d802234a67', 41, 1, 'authToken', '[]', 0, '2025-11-04 11:09:38', '2025-11-04 11:09:38', '2026-11-04 11:09:38'),
('61d360784f6100d2eef3a1e492223abe56f7c609b98cf80953c38e1a8b57c00f98f13babf9c81fdc', 10, 1, 'authToken', '[]', 0, '2026-01-01 11:31:12', '2026-01-01 11:31:12', '2027-01-01 11:31:12'),
('628ff36ee557dd9709092c137ccfcd5972c0dd1ef547dc2a9950864d8d88a38a6fe73141349628bc', 1, 1, 'authToken', '[]', 0, '2026-01-05 09:40:01', '2026-01-05 09:40:01', '2027-01-05 09:40:01'),
('62accf9d7be2251372f0b44479df864af5a4d3ce1f419922616b8c149755d18d8446cec5562ba604', 1, 1, 'authToken', '[]', 0, '2025-12-31 11:32:54', '2025-12-31 11:32:54', '2026-12-31 11:32:54'),
('637b393a313211dd8d02768d617e724f80b6366619877c1fbdd4eb0dfa8db18a56a81b4adec69292', 10, 1, 'authToken', '[]', 0, '2025-11-27 10:00:02', '2025-11-27 10:00:02', '2026-11-27 10:00:02'),
('64aa410bc4ba7f901718b07f7ba72a804174395370c3eb904c924b71802227b1cb90ccdca96121a3', 2, 1, 'authToken', '[]', 0, '2025-11-11 12:34:34', '2025-11-11 12:34:34', '2026-11-11 12:34:34'),
('666b340a8beea417d502f2585bb1b5fe1eda4c23ccc7e535e47db4b08e7c7e15812bd738dfb7566c', 1, 1, 'authToken', '[]', 0, '2025-11-08 06:25:16', '2025-11-08 06:25:16', '2026-11-08 06:25:16'),
('668a088810e8f66adfd90f43b3466bc36a7108e7231ed464f3abaf6f4b7d7ede3af9dbe0c6d71293', 10, 1, 'authToken', '[]', 0, '2025-11-11 10:18:13', '2025-11-11 10:18:13', '2026-11-11 10:18:13'),
('669fb273760777d93b4628fae509a6a5c44d5a47988ae6baf0bbfa7eea496213aff496c9a9e6a4f0', 1, 1, 'authToken', '[]', 0, '2026-01-09 09:54:01', '2026-01-09 09:54:01', '2027-01-09 09:54:01'),
('66b79a7003bd2a01c00ad8272d11caa821c95fa1934ab443a1361fee8009e4c233ba3ad13d544774', 21, 1, 'authToken', '[]', 0, '2025-11-05 15:50:45', '2025-11-05 15:50:45', '2026-11-05 15:50:45'),
('6837e03c56e37fd3e979fa73565e5f75381b8c4beecacaa4ed16f222e855c0f62f9e1e1ae02db76f', 42, 1, 'authToken', '[]', 0, '2025-11-04 12:04:37', '2025-11-04 12:04:37', '2026-11-04 12:04:37'),
('69b01af5672054a1f99bb1a07755acc18ac965d29a98b103359df7550507bdfc4eb48300607a30cb', 21, 1, 'authToken', '[]', 0, '2025-12-01 11:00:56', '2025-12-01 11:00:56', '2026-12-01 11:00:56'),
('6a38a3653c682437af0b962dcd31547e9e30108d38eff197bf18a1a4a3a78df059c8ddac0535b442', 21, 1, 'authToken', '[]', 0, '2025-12-10 16:12:13', '2025-12-10 16:12:13', '2026-12-10 16:12:13'),
('6a8d07d73ad33ce303eac087ef2b513e97ee4f13be7e368d3e94e5ea0b783be033fc2d2e88d162d7', 1, 1, 'authToken', '[]', 0, '2025-11-24 11:40:55', '2025-11-24 11:40:55', '2026-11-24 11:40:55'),
('6ad2c6c671cc7980ba2b84400f09ff6cea03ff6e2fc2bc20f8f1364f1bba4060dabfdd67470dca3f', 98, 1, 'authToken', '[]', 0, '2025-11-27 16:31:51', '2025-11-27 16:31:51', '2026-11-27 16:31:51'),
('6b59b5c3b6468763961a41a37eeb3005255aad07ae13f4464236f79cdb05464b457fe97b2ac04457', 1, 1, 'authToken', '[]', 0, '2025-11-04 08:18:25', '2025-11-04 08:18:25', '2026-11-04 08:18:25'),
('6b5dc779ce4ce5ca7c59e75d71a59ce0d151089ce9d52863c6d523020b5c90fd13b93bf1c331f592', 36, 1, 'authToken', '[]', 0, '2025-11-03 18:13:55', '2025-11-03 18:13:55', '2026-11-03 18:13:55'),
('6bc0d7134128f1baede630af180276a6c2c071271bfb3bf8a5fba9a6845c01898a230b3c3080f19e', 21, 1, 'authToken', '[]', 0, '2025-11-04 10:04:04', '2025-11-04 10:04:04', '2026-11-04 10:04:04'),
('6c244fcb292c6c89c5e2c8778e1ea05f7496743e52583c71dd8e13658791070f2b5f8ec58a97b1e3', 12, 1, 'authToken', '[]', 0, '2025-12-03 15:31:18', '2025-12-03 15:31:18', '2026-12-03 15:31:18'),
('6c4bdaa8fb0624f438a71dbdc286a5089d9313fdbf907a84af46239d6fb693c0e01845427f37ffdc', 10, 1, 'authToken', '[]', 0, '2026-01-08 10:23:50', '2026-01-08 10:23:50', '2027-01-08 10:23:50'),
('6ccfc8ea17fa891f7b3d3aa1d4a898160a6bcc856fffd303f61ec14f906fe51aa5a90c3d30526f4b', 24, 1, 'authToken', '[]', 0, '2025-11-16 10:39:47', '2025-11-16 10:39:47', '2026-11-16 10:39:47'),
('6cd84987bb4b53a94c2da1b7c48706e806966d22340aa3d71bea81c6b598befe6801d5952ee4e4af', 1, 1, 'authToken', '[]', 0, '2025-11-25 10:02:39', '2025-11-25 10:02:39', '2026-11-25 10:02:39'),
('6d16b5248e2406b401c15447976d3c34c011bfee9bd85ce10bcf7478f079470f0ccf2fec2c5788d2', 1, 1, 'authToken', '[]', 0, '2025-12-26 09:55:58', '2025-12-26 09:55:58', '2026-12-26 09:55:58');
INSERT INTO `bl_oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6df1e5895d38e58670593cfe87badf554099a5aec739db4aa5ddefc5dc3175b9187b8847497dd6e4', 1, 1, 'authToken', '[]', 0, '2025-11-09 08:05:04', '2025-11-09 08:05:04', '2026-11-09 08:05:04'),
('6e10f5c6ba455bf02882e767925abaf42532506cdf576878a9b7e9d4e1d201cf8f64d6c2d30fca4d', 171, 1, 'authToken', '[]', 0, '2026-01-06 13:30:15', '2026-01-06 13:30:15', '2027-01-06 13:30:15'),
('6e645da0c783bdba442d85abc7759bbbbf9c5270f6fd637608067c5e1a1dc14d9db6e16f9e174aa3', 45, 1, 'authToken', '[]', 0, '2025-11-06 15:24:06', '2025-11-06 15:24:06', '2026-11-06 15:24:06'),
('6ea10137f3e681969f08050cb6883319f0f3c469269ad1f7115f0c878eee172242a4041411e1a6ce', 1, 1, 'authToken', '[]', 0, '2025-11-04 10:10:17', '2025-11-04 10:10:17', '2026-11-04 10:10:17'),
('6fd6910bf286e3661befa0afd1e876a80a23179bb867640674aa7d3ea9624d46c3250eb9e2aa6ba8', 1, 1, 'authToken', '[]', 0, '2026-01-08 10:43:17', '2026-01-08 10:43:17', '2027-01-08 10:43:17'),
('6fdec8a07088f6cd197f8a88ba684f123e48c3eda925fc16684d5563e408931be537acd548da2127', 11, 1, 'authToken', '[]', 0, '2025-11-10 22:59:34', '2025-11-10 22:59:34', '2026-11-10 22:59:34'),
('6ff005ee3f17cdf67c34e1ea990721670c442d8226d0d6788197ab0bc9f9c8b233379fd522e35d64', 1, 1, 'authToken', '[]', 0, '2025-11-11 10:45:26', '2025-11-11 10:45:26', '2026-11-11 10:45:26'),
('70a12d229e6cf89e5abd971f010549d7cdf092995ec2b373edecef5dd17d0c07219586694aa15520', 1, 1, 'authToken', '[]', 0, '2025-11-28 09:52:23', '2025-11-28 09:52:23', '2026-11-28 09:52:23'),
('70fc81e7991869e81362cd205b9c3855e7c9c6f1be58ddf2f616f03c7594301ae2f0266a810ba1d5', 167, 1, 'authToken', '[]', 0, '2026-01-05 17:13:42', '2026-01-05 17:13:42', '2027-01-05 17:13:42'),
('712d9b549516fae6f73ffe689cc436f3f15183656f57392f1476d4ae164d7b0a061d69fb14170920', 1, 1, 'authToken', '[]', 0, '2025-12-15 13:43:51', '2025-12-15 13:43:51', '2026-12-15 13:43:51'),
('7629d8b01a76b8e75e266c1ec91c7ddd50cc8e8110a6eb95944f0ef56fe99b3c65b174f7c658eb9d', 1, 1, 'authToken', '[]', 0, '2025-11-26 12:00:41', '2025-11-26 12:00:41', '2026-11-26 12:00:41'),
('76ac2d27c58b18b99683f3937637c544958d00681532a7ab64f612351d32b5b0a1db67119c4e4bd6', 10, 1, 'authToken', '[]', 0, '2025-11-04 08:54:53', '2025-11-04 08:54:53', '2026-11-04 08:54:53'),
('7703ec5849c8c99bc1e7c880be45284ff752dee213d11e4f3815f0e9732414ed3ba725aa3505ecaf', 21, 1, 'authToken', '[]', 0, '2025-11-20 15:52:10', '2025-11-20 15:52:10', '2026-11-20 15:52:10'),
('773c6aaccde70b479b471ce5aecaa88014bbff4e255e8608c3e98b869dd54beb3e0b9bdc261a0512', 12, 1, 'authToken', '[]', 0, '2025-11-17 16:19:13', '2025-11-17 16:19:13', '2026-11-17 16:19:13'),
('7749e3989c3e81285d2d16024c59da770c41f194e4348197c5a3a451351004a8885e312a1341e5a8', 1, 1, 'authToken', '[]', 0, '2025-11-04 11:28:38', '2025-11-04 11:28:38', '2026-11-04 11:28:38'),
('77cdc18420995daac4231fc88957f7754370a5d2aa61e0b23472cd2c2b86516dcdfaaebbe657a68f', 37, 1, 'authToken', '[]', 0, '2025-11-03 19:09:43', '2025-11-03 19:09:43', '2026-11-03 19:09:43'),
('785a64dc4755cf53c050fd06ca3ac747d8991fc9fb897cb4fc0bdc96570226b9dff0ad527473e88c', 10, 1, 'authToken', '[]', 0, '2026-01-08 06:42:29', '2026-01-08 06:42:29', '2027-01-08 06:42:29'),
('78d8fd595072f8b08057bee914f9e9d5930bb61eb9cfd5e68d6127af3e5c63d6296868fded49aefb', 21, 1, 'authToken', '[]', 0, '2025-11-13 10:57:55', '2025-11-13 10:57:55', '2026-11-13 10:57:55'),
('78dea23fefc46d3cf71f08afbaaeab4e5123dda844c8917325fa56cb26d6d7498736908578534728', 1, 1, 'authToken', '[]', 0, '2025-11-04 20:53:30', '2025-11-04 20:53:30', '2026-11-04 20:53:30'),
('791281477a755e8bb91294a15f4570d9b77076423a90fa27c9bd46cf2ab829443486e9a27384aefe', 21, 1, 'authToken', '[]', 0, '2025-11-15 16:33:00', '2025-11-15 16:33:00', '2026-11-15 16:33:00'),
('79446d9d2529bd2510e421e3f1cc94e1ed12bc0c2fb0766cc60f0554a7b443142d21ed08a450d3b0', 1, 1, 'authToken', '[]', 0, '2025-12-22 08:50:23', '2025-12-22 08:50:23', '2026-12-22 08:50:23'),
('7973c31bd18ba6e58262c0d84488c825e8e6f79a6239cb8d87ed1dd65d3d97a21c44f8c44fbb67ef', 85, 1, 'authToken', '[]', 0, '2025-11-15 21:03:42', '2025-11-15 21:03:42', '2026-11-15 21:03:42'),
('797a71db12638c85230d51271ce6ce7055d845e6a0fe3213f68c4b015dce485c8270fa1ede1e0d8f', 16, 1, 'authToken', '[]', 0, '2025-11-28 18:13:55', '2025-11-28 18:13:55', '2026-11-28 18:13:55'),
('79c118b90d10bf881016edccf901481040aef7eff9d722fcd33b24460f79c6fa6da1743a05d22176', 1, 1, 'authToken', '[]', 0, '2025-12-01 13:31:31', '2025-12-01 13:31:31', '2026-12-01 13:31:31'),
('7a6dc6d9e37d6d86069685b19c30987bccc1e55ae86477fcea5f9c2a8409ca390886f0b7bc979948', 21, 1, 'authToken', '[]', 0, '2025-11-10 11:45:27', '2025-11-10 11:45:27', '2026-11-10 11:45:27'),
('7ae5c2d978da031e2232163ffb0d09c4285802d28aacc952c5bf403aa5d2bfe9de7575dab2095b0a', 174, 1, 'authToken', '[]', 0, '2026-01-06 15:07:42', '2026-01-06 15:07:42', '2027-01-06 15:07:42'),
('7b73b029d7d2750407fafe208064dab8820084870512c516a6e02b42413886adf7ec47b3e521f775', 1, 1, 'authToken', '[]', 0, '2025-12-01 10:56:28', '2025-12-01 10:56:28', '2026-12-01 10:56:28'),
('7cfe22fb3ef167b034d934b42e606d2e8d145e4893383c85932b00f14d7cbdc24cf7df6ab84b9345', 12, 1, 'authToken', '[]', 0, '2025-11-30 11:23:15', '2025-11-30 11:23:15', '2026-11-30 11:23:15'),
('7d92edffd87c75eb8da45446be4d5eec3758ae7f064abc1198d369240e8c846d3e7672a60cf37df9', 1, 1, 'authToken', '[]', 0, '2025-11-19 09:51:32', '2025-11-19 09:51:32', '2026-11-19 09:51:32'),
('7d9cc59bdff85770e4f51ce3651a01b40ab64d6b36c01b2277720439a7eaa03fcb6c936f90b2dd0e', 1, 1, 'authToken', '[]', 0, '2025-12-17 09:55:28', '2025-12-17 09:55:28', '2026-12-17 09:55:28'),
('7e0b45c7c0c2bd53ef66af7a80e0527f5523b3f19099a75934d861584b7b7a7559466682e43d90f5', 10, 1, 'authToken', '[]', 0, '2025-11-04 12:56:02', '2025-11-04 12:56:02', '2026-11-04 12:56:02'),
('7ebf1f4747a937e1649aacfabff80f164938d84dfc9acd0ebc237009ec4fa8970c0323a5b3e9a20e', 21, 1, 'authToken', '[]', 0, '2025-11-11 13:47:14', '2025-11-11 13:47:14', '2026-11-11 13:47:14'),
('7eed8a9cd3ef60ef8dfb86bcdd3ed3ee680e9e19afe409da9cdf38ccef4cf8f91d23d66463029137', 139, 1, 'authToken', '[]', 0, '2025-12-24 16:01:09', '2025-12-24 16:01:09', '2026-12-24 16:01:09'),
('7f0f9a3541b655769b8ad9006db89de9f998b6e21631a08cd3f226aca52b09bc75899c5dd166d873', 21, 1, 'authToken', '[]', 0, '2025-11-10 11:51:16', '2025-11-10 11:51:16', '2026-11-10 11:51:16'),
('7f96ea3958e2376e053539c086ff3d41dcdd76a7662c48b444295f9792b9b7865b515e8eefe28dbe', 46, 1, 'authToken', '[]', 0, '2025-11-06 15:27:54', '2025-11-06 15:27:54', '2026-11-06 15:27:54'),
('8023cfa74f62155f157e09ccd3c811e81cca38ae2dd7fa2da54a08f3d7d846a38d5d599e718e49ad', 10, 1, 'authToken', '[]', 0, '2025-11-08 15:58:31', '2025-11-08 15:58:31', '2026-11-08 15:58:31'),
('802fe3462a9e481cb92403d949c31cc21e889c572895c4b199020908c6a4148add639cb2ab9f2380', 10, 1, 'authToken', '[]', 0, '2025-11-11 07:49:07', '2025-11-11 07:49:07', '2026-11-11 07:49:07'),
('8047edd7b994eecbf8e931bf360e07335ae79a13571f090c2f40d03a6a6f41ba3390ba43ece84d9d', 10, 1, 'authToken', '[]', 0, '2026-01-07 12:13:45', '2026-01-07 12:13:45', '2027-01-07 12:13:45'),
('80d77868da76d27c9cbd08f68c9a8f0877a2f027c4de577f72b2e0d440111b3dfd7c03e79193ee81', 1, 1, 'authToken', '[]', 0, '2025-12-27 15:40:29', '2025-12-27 15:40:29', '2026-12-27 15:40:29'),
('816174ff4e6f04dbd6fd64efecc34960ee52c70459dab528799dd9197d844e80a69c342dc613d006', 1, 1, 'authToken', '[]', 0, '2025-11-22 18:11:56', '2025-11-22 18:11:56', '2026-11-22 18:11:56'),
('81fc48c24c2866029e90ddf68107d78647bd3ff7d3d3dfde2cd8fc5ce81ae9a0f0390a13074b889b', 1, 1, 'authToken', '[]', 0, '2025-11-20 21:41:09', '2025-11-20 21:41:09', '2026-11-20 21:41:09'),
('821275572b0fa8db9b3219a23a5f3f4d1d2d14b642ccaf6a695617efede855aaed1a5f29c5b55b7e', 16, 1, 'authToken', '[]', 0, '2025-11-07 09:50:06', '2025-11-07 09:50:06', '2026-11-07 09:50:06'),
('823cffb5913e5071ef145637fb4672329c758fbd81e0abd8ea51368f4d2e046b599526a49232feeb', 1, 1, 'authToken', '[]', 0, '2025-12-24 09:54:48', '2025-12-24 09:54:48', '2026-12-24 09:54:48'),
('82484c0f7f46885a0dd652efcce5d6727865a36d4caf1607a8dd1c4727e471d7c60ae7dcd0daf4d4', 21, 1, 'authToken', '[]', 0, '2025-12-17 18:08:47', '2025-12-17 18:08:47', '2026-12-17 18:08:47'),
('82ffc1f0d979e0f6a6342568b783b8573500d9a2d735d4bac98ecb3f9858a2242e6a770bf0c72204', 10, 1, 'authToken', '[]', 0, '2025-11-15 13:42:46', '2025-11-15 13:42:46', '2026-11-15 13:42:46'),
('832d7d4e3cbda5d28842a13ffbd4460f602817c6dd10ef32ce5c75977cf3e1765827b4d46fd225a1', 1, 1, 'authToken', '[]', 0, '2025-12-19 17:19:14', '2025-12-19 17:19:14', '2026-12-19 17:19:14'),
('836daaff189e91beea4a2235f736e32f7aaf33c656a64b27ed40efe6405e734a739fdee6a1e70fb2', 10, 1, 'authToken', '[]', 0, '2025-12-03 16:10:04', '2025-12-03 16:10:04', '2026-12-03 16:10:04'),
('8373f6e3ca2d5839bfe50eeaa0c0625f025c43fc1521e0226820e6a2f49f5933bf5e561c1fb11e97', 10, 1, 'authToken', '[]', 0, '2026-01-07 15:57:48', '2026-01-07 15:57:48', '2027-01-07 15:57:48'),
('83ecb3b8fa0703cef46262f03ff23573d7c2d60edce23d0415721c0937f702c90fadf5ff89ac14b3', 10, 1, 'authToken', '[]', 0, '2025-11-08 16:39:25', '2025-11-08 16:39:25', '2026-11-08 16:39:25'),
('8415bb53dd7511e1d96e642998a8e9ff4d2df00a5cbb2e3c6c9d9eed9e937d40d734ea9a55ce1a78', 1, 1, 'authToken', '[]', 0, '2025-11-07 11:56:29', '2025-11-07 11:56:29', '2026-11-07 11:56:29'),
('84b0cf299e5769bfcdc27dfb54ac9382a59d91435f4b539996d76601baa268871b5181320e994a96', 1, 1, 'authToken', '[]', 0, '2025-11-08 14:35:16', '2025-11-08 14:35:16', '2026-11-08 14:35:16'),
('85d8b1781e808c7e51b3fbd1d8b8844523a0a6e60a666e42525676a73e3fb860b759e1c5e8af9dba', 1, 1, 'authToken', '[]', 0, '2025-11-04 13:11:04', '2025-11-04 13:11:04', '2026-11-04 13:11:04'),
('8605850d47eb08ee554018a0bbd47979e8e11329af25a7f7d2ba49ee17a8fd4b97937e4cd9a4da62', 1, 1, 'authToken', '[]', 0, '2025-11-04 10:18:17', '2025-11-04 10:18:17', '2026-11-04 10:18:17'),
('864644749b603d60885850019be0401689b9580ad187b9eea6c4dbb36a55bf1e09b9802ede1a0262', 16, 1, 'authToken', '[]', 0, '2025-12-31 10:41:39', '2025-12-31 10:41:39', '2026-12-31 10:41:39'),
('8655982af73d5f6b5bc21ad2f7cc93aaf33b78dd3ea436035427a2ad352b33e2fc6ff277c6844561', 21, 1, 'authToken', '[]', 0, '2025-12-27 10:59:03', '2025-12-27 10:59:03', '2026-12-27 10:59:03'),
('86ede4168fdba0cf28d3f118f87c9307bc48e89706a3c132281b30e278c3192a0d7d9bb9046ffdc0', 1, 1, 'authToken', '[]', 0, '2025-11-22 09:55:21', '2025-11-22 09:55:21', '2026-11-22 09:55:21'),
('8715da5e6c0907d7c951f54d4b9992f381999baf6b43279c1043f972f750670a71b9d5062d6d89c4', 10, 1, 'authToken', '[]', 0, '2025-11-07 11:26:53', '2025-11-07 11:26:53', '2026-11-07 11:26:53'),
('8740e9e8eaee2f13a8003b6209e1169f279d7a48aadf4f0aab2586fc941ac2b4c3ecc7a2363dcc08', 51, 1, 'authToken', '[]', 0, '2025-11-07 13:12:43', '2025-11-07 13:12:43', '2026-11-07 13:12:43'),
('87556e425885975d19fabbbc612732ad02d9cbe9d5d5cc1fd0cd31804e708cfdf4f627253381d45d', 103, 1, 'authToken', '[]', 0, '2025-12-02 13:23:49', '2025-12-02 13:23:49', '2026-12-02 13:23:49'),
('87630bcae127b5190b6c17a209913566fedbd4ac0143a9001d47da04515e3f0c706d2f429959b8f8', 10, 1, 'authToken', '[]', 0, '2025-11-21 16:54:06', '2025-11-21 16:54:06', '2026-11-21 16:54:06'),
('893ddbc10469af81255d5ff55621d92daebc8bb6c7ccaeadb0dc1dfc6fa4d37cc88cb8d0f1a601e4', 1, 1, 'authToken', '[]', 0, '2025-11-12 17:27:25', '2025-11-12 17:27:25', '2026-11-12 17:27:25'),
('8969de52e5b1661a1239d31be250412102168f122bf697986abdbc5e58a2fe2173ae90e215ab4deb', 10, 1, 'authToken', '[]', 0, '2026-01-03 13:44:10', '2026-01-03 13:44:10', '2027-01-03 13:44:10'),
('898ed746acd0857eb0163e87fefbd0dbdf1842b8bd55ffde45998ba1adc6484c0cc655209f7840e7', 1, 1, 'authToken', '[]', 0, '2025-11-04 12:32:51', '2025-11-04 12:32:51', '2026-11-04 12:32:51'),
('89f349b3bad143db53b5254ab5b9e9614756a32b370df61887c844d3633d55e0c1a6ab8fa340fb51', 21, 1, 'authToken', '[]', 0, '2025-11-11 10:34:21', '2025-11-11 10:34:21', '2026-11-11 10:34:21'),
('8a17422a02a2f3e96c4b131634f2908075cd226835a158d8cf4190ff9ba7d55a1dc3e3bd009e3774', 83, 1, 'authToken', '[]', 0, '2025-11-14 15:17:25', '2025-11-14 15:17:25', '2026-11-14 15:17:25'),
('8b3de59b0cffcc48b2d4ee733b6f9fe72feed27b30bfb228019aa717dc788f5f863849b98bc65498', 93, 1, 'authToken', '[]', 0, '2025-11-23 19:31:26', '2025-11-23 19:31:26', '2026-11-23 19:31:26'),
('8bc8c164316fff487808167af1eb8eff82f4487547dc84fdc10c2b791f42e717ddcccb46440d73b3', 69, 1, 'authToken', '[]', 0, '2025-11-10 11:53:30', '2025-11-10 11:53:30', '2026-11-10 11:53:30'),
('8c05b5f92d4183966e467d639c6b433b9bc73e0fe86fec3713c8351fec6839decdeceb75ea42d721', 10, 1, 'authToken', '[]', 0, '2025-12-22 10:01:20', '2025-12-22 10:01:20', '2026-12-22 10:01:20'),
('8ccdad0f82705362bad60044fff91fae26fbb0ed804208e3dd1f6b54b0c028014c26042c8396308d', 19, 1, 'authToken', '[]', 0, '2025-11-18 16:08:34', '2025-11-18 16:08:34', '2026-11-18 16:08:34'),
('8d0ce7407a734728f9d3ad82fea314e07c132bc7c4a327354e8176e1aeae1bfbff641f2f89ed535d', 105, 1, 'authToken', '[]', 0, '2025-12-05 16:57:57', '2025-12-05 16:57:57', '2026-12-05 16:57:57'),
('8d2306d0cd25fa37f915c1224e7deaaa1739309ae5dac35d72c99349ee715cf1bf1f9a7420360957', 1, 1, 'authToken', '[]', 0, '2025-12-10 12:18:24', '2025-12-10 12:18:24', '2026-12-10 12:18:24'),
('8dc9389de3c66250eeddd40177d5e8b46c21e0417d4aec84d6e01099f0cbf7e49fe2dfd9475158f5', 1, 1, 'authToken', '[]', 0, '2025-11-03 17:45:05', '2025-11-03 17:45:05', '2026-11-03 17:45:05'),
('8e04c85e2e0c46cb9a2cbca579736d98155aa9b7fe0ab61b0c07f25939f235a7db0a84f94ce3d932', 118, 1, 'authToken', '[]', 0, '2025-12-18 13:15:46', '2025-12-18 13:15:46', '2026-12-18 13:15:46'),
('8f6df8765b38acb2f1bc664071fa8b2e2a63bbcd9cef27dc63b32c9ed9de8a2048d3f7b08caa31ef', 1, 1, 'authToken', '[]', 0, '2026-01-01 14:26:20', '2026-01-01 14:26:20', '2027-01-01 14:26:20'),
('9016707848805f543dd3a7056df0c4fa0b0c71980e5fbd743f809591cbf0fd2452c4b32b1b060250', 1, 1, 'authToken', '[]', 0, '2025-11-04 18:08:47', '2025-11-04 18:08:47', '2026-11-04 18:08:47'),
('90501a161ed9e0bba2dd52893985116e9bb1a06f541445beddb0e8f8324d39efd6025dc173f4e7df', 145, 1, 'authToken', '[]', 0, '2025-12-25 12:46:53', '2025-12-25 12:46:53', '2026-12-25 12:46:53'),
('90d2f3a34353683807ca227003933bc6773e211554522466df2cb5a74c1a04975d1f653860d258cf', 10, 1, 'authToken', '[]', 0, '2025-12-24 10:03:57', '2025-12-24 10:03:57', '2026-12-24 10:03:57'),
('91eb9ff8e9152c73f1cc29e6ef595d734d39c57841da7e442e89efdc754ac2d3f9e1bcf0f650868c', 1, 1, 'authToken', '[]', 0, '2025-12-02 13:52:43', '2025-12-02 13:52:43', '2026-12-02 13:52:43'),
('9263670c342c38c9ea9229af6be957259831d49063bf78f3e8117958ef38278f8c7cf0cc5264a6ee', 1, 1, 'authToken', '[]', 0, '2025-12-01 09:38:46', '2025-12-01 09:38:46', '2026-12-01 09:38:46'),
('927c2a5da45f31cf343b2a1ab8369fb7cb24f88a4e6976f53021a574269bfd51939c7ecc562bda06', 16, 1, 'authToken', '[]', 0, '2025-12-03 15:22:32', '2025-12-03 15:22:32', '2026-12-03 15:22:32'),
('9452f8d195438ed728252d1459728b366d4f05c82d608d431d0333c894d21f1c02d05876a287bb2b', 60, 1, 'authToken', '[]', 0, '2025-11-08 13:39:02', '2025-11-08 13:39:02', '2026-11-08 13:39:02'),
('9501a750a74790c6a25f1b9560b3b4db7aa359913828aa156751c7ecd82ea945b92abc42118e16c2', 90, 1, 'authToken', '[]', 0, '2025-11-20 21:26:51', '2025-11-20 21:26:51', '2026-11-20 21:26:51'),
('9650ee4df1e2a97e053a9f9526c280920ef4d2bb55d337f6d2d24dfe3ec19c8a3f70da38803da87c', 16, 1, 'authToken', '[]', 0, '2026-01-08 12:35:39', '2026-01-08 12:35:39', '2027-01-08 12:35:39'),
('974bd9f0c352e7916bf73eb25ea991ec09c1ce51f1d749782c5a7fc931a36b3098bbd9064eceecdf', 22, 1, 'authToken', '[]', 0, '2025-11-12 11:11:03', '2025-11-12 11:11:03', '2026-11-12 11:11:03'),
('98cdc41d250d9db02041af17a7cbca27c2cf8517f8191ac1d767e970395fc65b30744dd4a70c3d88', 155, 1, 'authToken', '[]', 0, '2025-12-27 14:18:43', '2025-12-27 14:18:43', '2026-12-27 14:18:43'),
('9912bed9d05822b4e5a9cdbb2600d01e57e6bc0cb42c7bfeef2382026e112e131b6da54848c524bb', 169, 1, 'authToken', '[]', 0, '2026-01-05 18:10:58', '2026-01-05 18:10:58', '2027-01-05 18:10:58'),
('99c1cadcaca7c6e4d40cf23e27bb6ec89c79e8860926d3021caeae2e3e80ee76ff5f278a57f2c5da', 74, 1, 'authToken', '[]', 0, '2025-11-11 10:33:17', '2025-11-11 10:33:17', '2026-11-11 10:33:17'),
('9a4397cc2ff2adeef61a847a1da3b61d7b3886b89c950f43964f27877f2ad2a08f5c5b57436714df', 102, 1, 'authToken', '[]', 0, '2025-12-02 13:22:27', '2025-12-02 13:22:27', '2026-12-02 13:22:27'),
('9a8671a2739ed182557376b79b78447a5e0fb7cc3d39251bc362128dda9f0a6334ee153625ac996a', 15, 1, 'authToken', '[]', 0, '2025-12-17 16:48:56', '2025-12-17 16:48:56', '2026-12-17 16:48:56'),
('9ad9cc0038f7531da4070941a9da3276b5415651d973ff6811a11c03305a59d50073f9db52fa40cb', 89, 1, 'authToken', '[]', 0, '2025-11-20 17:04:16', '2025-11-20 17:04:16', '2026-11-20 17:04:16'),
('9b81470cc95fe9ea0c0fe9a6374462269801e35837d85071d208e36f668644859a7d57c793d70e83', 21, 1, 'authToken', '[]', 0, '2025-11-24 16:56:58', '2025-11-24 16:56:58', '2026-11-24 16:56:58'),
('9cae3719c88b0a7fc345a6f25370c0e5cb7de752aca936a0e2831b1c0f1411db1ccec20e54a7272b', 1, 1, 'authToken', '[]', 0, '2025-12-19 09:35:33', '2025-12-19 09:35:33', '2026-12-19 09:35:33'),
('9cd62418ac1a8e6394f234dff8b9a44a975f59b3d5e92d236d2ac9d31aafb947ba7149cba1597e8b', 21, 1, 'authToken', '[]', 0, '2025-11-11 12:31:21', '2025-11-11 12:31:21', '2026-11-11 12:31:21'),
('9ce6a0604d51598ab1072f2ee52bb9de5468dcba6d23e9e2c51d9b001e64d16cc983edd225188f24', 1, 1, 'authToken', '[]', 0, '2025-11-13 18:10:37', '2025-11-13 18:10:37', '2026-11-13 18:10:37'),
('9da76a1cddce388232f604a0db850684159f9033799b193ae6bf82b96ab5f3e954b67c6e478ebc0a', 138, 1, 'authToken', '[]', 0, '2025-12-28 21:47:07', '2025-12-28 21:47:07', '2026-12-28 21:47:07'),
('9dab935edf2a1c2b9a568af795e4b7757a15af9bd0369bdcc463c3502183c654d9ef28d10aa64bac', 1, 1, 'authToken', '[]', 0, '2025-11-08 10:36:43', '2025-11-08 10:36:43', '2026-11-08 10:36:43'),
('9dddf466e30c08aec43a54f98afe6883ac0844c11d9360bd6e3da998c509c135ad8134b6371fd9c5', 12, 1, 'authToken', '[]', 0, '2025-11-14 12:33:39', '2025-11-14 12:33:39', '2026-11-14 12:33:39'),
('9e048d365187f605466d847ac4c98d3f6c3c4509203df7e677568a24d4016bb6f4ae15531885eea4', 21, 1, 'authToken', '[]', 0, '2025-11-06 10:34:16', '2025-11-06 10:34:16', '2026-11-06 10:34:16'),
('9e800a5c7a657e050c95794a499b5bbf98986ca714317fc45bcf89f8723ef2d2727510f81d64bfe3', 1, 1, 'authToken', '[]', 0, '2025-11-15 09:57:35', '2025-11-15 09:57:35', '2026-11-15 09:57:35'),
('9f60cdcc71f4493e98568a50b909da5db1b03a2c35e2ed8930ea93b6e3e9d6b58fb1e4e05bbc26b1', 1, 1, 'authToken', '[]', 0, '2025-11-13 15:34:23', '2025-11-13 15:34:23', '2026-11-13 15:34:23'),
('a0501caaf0a9235327f3bc91219b9b8147cc6bf65e71e1433fe2e06ede305df7aaf37e64c9641c11', 67, 1, 'authToken', '[]', 0, '2025-11-10 11:45:28', '2025-11-10 11:45:28', '2026-11-10 11:45:28'),
('a0bf311a9601286604dfd520687653b215c1d22b46c464362587353bd6866f5f463178fe0e6b7080', 12, 1, 'authToken', '[]', 0, '2025-11-04 18:04:42', '2025-11-04 18:04:42', '2026-11-04 18:04:42'),
('a192b0341527e24bf3c7a6b17837b01b85fb16eda2bed1a975ad7c764882c09430f1902771a07c2d', 1, 1, 'authToken', '[]', 0, '2025-12-24 11:38:37', '2025-12-24 11:38:37', '2026-12-24 11:38:37'),
('a22c099c3bde456f4566992ddab25767b3657e7ff7bc9517b96fb9ce6a34aa1a93400d613b4de239', 1, 1, 'authToken', '[]', 0, '2025-12-23 14:20:08', '2025-12-23 14:20:08', '2026-12-23 14:20:08'),
('a2fda4efe5c59bdd321939300f74922e404e06af8e21ed02c3a30d0c3f6881151c8a79e033448a4e', 8, 1, 'authToken', '[]', 0, '2025-11-20 16:20:33', '2025-11-20 16:20:33', '2026-11-20 16:20:33'),
('a3720adcf29f61e24fa4bc1e871e14d11b83ebc132bdb1d6e1d20afabe9ccbbe1da0ce17e8fff8cc', 1, 1, 'authToken', '[]', 0, '2026-01-07 09:51:29', '2026-01-07 09:51:29', '2027-01-07 09:51:29'),
('a40bd681b927f62a58963ca945b8d71f148501a88c9c05365a5c93c789b7de89c95056d48af114fd', 78, 1, 'authToken', '[]', 0, '2025-11-11 11:58:09', '2025-11-11 11:58:09', '2026-11-11 11:58:09'),
('a43acb5d6170b83a136e12c75cc91466b202b12390b7ad63f77ca1a61944a29c49741d36d2697b44', 21, 1, 'authToken', '[]', 0, '2025-11-06 17:13:07', '2025-11-06 17:13:07', '2026-11-06 17:13:07'),
('a453633c0149a87e630e7924b0ee227d5420ea154bf8afb657c8337d84935dc1a7402db87b97eb6b', 1, 1, 'authToken', '[]', 0, '2025-11-30 13:45:37', '2025-11-30 13:45:37', '2026-11-30 13:45:37'),
('a64ae4279ec3c2aa1972fff6c43cf94a5306ec24fc2fecf6840ac0cbe80cae9c245054f5cccc2b59', 12, 1, 'authToken', '[]', 0, '2025-11-07 12:21:56', '2025-11-07 12:21:56', '2026-11-07 12:21:56'),
('a65599c95cbd5b924bd4e541e16ebd17b465d147b811586cd8fb5bfdd8263f68e93f690d035ca937', 1, 1, 'authToken', '[]', 0, '2025-12-11 10:01:33', '2025-12-11 10:01:33', '2026-12-11 10:01:33'),
('a679d2598d02f095d1b0df80d013342a916294d64953180608b0ffb516feb8daf7dfcf6cd615cf20', 21, 1, 'authToken', '[]', 0, '2025-11-10 17:02:57', '2025-11-10 17:02:57', '2026-11-10 17:02:57'),
('a6ee6de44527b5c11cdcc5ac5090dee0da7f6c7518b4cb20f0464b88f5816f4c184ed6c0fa1cd5e5', 1, 1, 'authToken', '[]', 0, '2025-12-09 10:28:13', '2025-12-09 10:28:13', '2026-12-09 10:28:13'),
('a7ecabc92a9652429896dde5d1db8c4daa0957006eac6cfd54c57c1c0bdf6ab874c30a209f3e2323', 10, 1, 'authToken', '[]', 1, '2025-11-04 17:31:16', '2025-11-04 17:31:16', '2026-11-04 17:31:16'),
('a867ce307bb0e4aaa3ec247b073a4941ec3e1730a9c0a8789730b48ed4e8e885d7d2137c98f77cff', 170, 1, 'authToken', '[]', 0, '2026-01-06 12:29:43', '2026-01-06 12:29:43', '2027-01-06 12:29:43'),
('a869da82b71489c76402954c93744e499d8b9a07a95b51ebadbf37dcfffe2c8098fb04a9762623a0', 1, 1, 'authToken', '[]', 0, '2025-12-27 09:37:57', '2025-12-27 09:37:57', '2026-12-27 09:37:57'),
('a874b088156c8bcb6c5eb1655b5a3608ded6c9c39f398d6cabad631a2e124ac585657488fee4eed6', 1, 1, 'authToken', '[]', 0, '2025-11-03 17:44:18', '2025-11-03 17:44:18', '2026-11-03 17:44:18'),
('a8a13be7771f42298ec15c2cf891b8ad157d65b7484f943e8e6ff7ed69a2a8feead36c765fb2da0e', 21, 1, 'authToken', '[]', 0, '2025-11-04 10:17:01', '2025-11-04 10:17:01', '2026-11-04 10:17:01'),
('a94896a0a35f3d07e4c8b040e8fb9bbc295ec09ad57e9151461f8f651485a9a59f3190f6c1a763ef', 10, 1, 'authToken', '[]', 0, '2025-11-21 16:30:45', '2025-11-21 16:30:45', '2026-11-21 16:30:45'),
('a9f6127db5343eb988722f9ec832690c4caee70d20caaa4bbff4c8298d9635a91125e4c24e489f1e', 1, 1, 'authToken', '[]', 0, '2025-11-11 10:47:28', '2025-11-11 10:47:28', '2026-11-11 10:47:28'),
('aa16de4e723a0369fc0c90779cf93ced864ef67527dcef51244379f7abf79420b9f40a0690820033', 22, 1, 'authToken', '[]', 0, '2025-12-12 17:30:37', '2025-12-12 17:30:37', '2026-12-12 17:30:37'),
('aa9b97a2d364a6d475df533211ba97e8eea745a1a2ae8b9f0264dc036f531137c5c4e749ecf65aec', 118, 1, 'authToken', '[]', 0, '2025-12-18 13:41:27', '2025-12-18 13:41:27', '2026-12-18 13:41:27'),
('ab3c4eae411999dabf23f6477e1641940d98c2b2846aa67a2a393a257ed71f47287fffa2395f3904', 130, 1, 'authToken', '[]', 0, '2025-12-23 15:47:09', '2025-12-23 15:47:09', '2026-12-23 15:47:09'),
('ab565dcfd14d03c012ccfc29e678021b15a869b4379446246031d2411025236290f3418812f03244', 8, 1, 'authToken', '[]', 0, '2025-11-19 18:40:56', '2025-11-19 18:40:56', '2026-11-19 18:40:56'),
('abba55e50be0f402cec55dd8fc9b0fd8ee9e67da3834e3e72eca74cbf6258d283d7f80b30f626259', 10, 1, 'authToken', '[]', 0, '2025-11-18 07:24:48', '2025-11-18 07:24:48', '2026-11-18 07:24:48'),
('ac9c93cc11954a5afda32a725765c15e56a3359342a8f1e4babeadba3ec9c09e7d0649c37e82a165', 1, 1, 'authToken', '[]', 0, '2025-11-12 10:30:34', '2025-11-12 10:30:34', '2026-11-12 10:30:34'),
('acb6d4fcf0b5bbae8f19a552fb67aabbda133d7f3d94098a6081a292e5517138e0330412d246242e', 10, 1, 'authToken', '[]', 0, '2026-01-06 22:37:50', '2026-01-06 22:37:50', '2027-01-06 22:37:50'),
('adef6feb770b9810d83fd9ecb3e43ea37942f6e8be1c500647ca9f458b97d1364d76009195c3f2cc', 1, 1, 'authToken', '[]', 0, '2025-11-14 11:30:37', '2025-11-14 11:30:37', '2026-11-14 11:30:37'),
('ae164ae8cbd6b72345c26fdd826406a313bb8765b018866ff07ba8695b0fe94c8958018ff941c8fb', 1, 1, 'authToken', '[]', 0, '2025-12-16 16:00:55', '2025-12-16 16:00:55', '2026-12-16 16:00:55'),
('ae52b0927afff3d95bab8ab09cd3ab58d671ab8a4b0eacf194eacd22b6b7997ae5915e363c662fb2', 12, 1, 'authToken', '[]', 0, '2025-11-03 18:38:39', '2025-11-03 18:38:39', '2026-11-03 18:38:39'),
('aed6c1aa09890ef44d02aaf7f468cb4b8b74426e326a19f99286fe73f5a6bbae8d68d6ce47fb489c', 12, 1, 'authToken', '[]', 0, '2025-11-04 10:37:50', '2025-11-04 10:37:50', '2026-11-04 10:37:50'),
('afc0338185d8d64cac0b1f5f3859bf3863c123b0949ef2c46bf76f32c4059d9333c26140d0401804', 1, 1, 'authToken', '[]', 0, '2025-11-16 11:46:14', '2025-11-16 11:46:14', '2026-11-16 11:46:14'),
('b078a68e6b34f99cbdd51be94b8a56a2a8bdc12eac015ec7a088371dada721d844f340010a58d3dd', 1, 1, 'authToken', '[]', 0, '2025-11-10 12:15:41', '2025-11-10 12:15:41', '2026-11-10 12:15:41'),
('b0831fe1b0c8eb1eb2ef51aa7f650b19ebf975bd41425c06d691183684abf94a587915efd89a005d', 1, 1, 'authToken', '[]', 0, '2025-11-10 15:13:42', '2025-11-10 15:13:42', '2026-11-10 15:13:42'),
('b23f8b7ab8b02fdc9d1c30e6e011b01a370946080abd14376e1c70847cc93c6790f8207c4bfa3f89', 70, 1, 'authToken', '[]', 0, '2025-11-10 11:56:07', '2025-11-10 11:56:07', '2026-11-10 11:56:07'),
('b2887e7bc7163d8b951f87d2719d9c0313846b18d28ac166c2f93ba6607af0e5abdb74be013c939e', 22, 1, 'authToken', '[]', 0, '2025-11-20 10:02:45', '2025-11-20 10:02:45', '2026-11-20 10:02:45'),
('b3106fbb4d4785555ec020b60139119e49353ba3b93e6c069aea5103e5180a3ed66d0fa71aa46b1f', 16, 1, 'authToken', '[]', 1, '2025-12-31 19:25:53', '2025-12-31 19:25:53', '2026-12-31 19:25:53'),
('b380de8dafdeb6df3b922ee113d022e84ed1fc8c80899993342d9f04913e27eef979f61b14100f19', 21, 1, 'authToken', '[]', 0, '2025-11-06 17:54:12', '2025-11-06 17:54:12', '2026-11-06 17:54:12'),
('b3cc308be994f83df7bff3700123de567cea9d8c0e7ce5847a6d040af74971f7a6eb9b034fdfd3fd', 1, 1, 'authToken', '[]', 0, '2025-11-07 12:31:21', '2025-11-07 12:31:21', '2026-11-07 12:31:21'),
('b42c8e32e03435d368aa4263d4e01548f32d47442328a3710e5a9196b3383fc226518cc2a2064b26', 1, 1, 'authToken', '[]', 0, '2025-11-12 16:45:26', '2025-11-12 16:45:26', '2026-11-12 16:45:26'),
('b439d627c47b040c4d17306700dc28be64d1389b1a23133f62e1cabd2feaa075e8fdb01c5660a120', 1, 1, 'authToken', '[]', 0, '2025-12-15 10:17:38', '2025-12-15 10:17:38', '2026-12-15 10:17:38'),
('b45c4452ec0db77d28dfa1ae558d2295a60866d255da224f4281a40e7be4385980420a547ba3f35b', 10, 1, 'authToken', '[]', 0, '2026-01-08 10:34:53', '2026-01-08 10:34:53', '2027-01-08 10:34:53'),
('b4684c872e9e487947ccb898905896a3a17559a9532f5596d8734dcb3029a44c18b2231cd1209d3c', 10, 1, 'authToken', '[]', 0, '2025-11-10 14:12:43', '2025-11-10 14:12:43', '2026-11-10 14:12:43'),
('b4c1e992eb2766dfc1942f241e549a0bae90e87f26096dc18135c425a136712a33a2f7f7c16a16d1', 16, 1, 'authToken', '[]', 1, '2025-11-04 12:54:49', '2025-11-04 12:54:49', '2026-11-04 12:54:49'),
('b5dc8bcee425881df0df83e6318f38010a75ff93d7c67556579dafb2f78a2950275dc16e2fe81fbe', 21, 1, 'authToken', '[]', 0, '2025-11-19 10:35:35', '2025-11-19 10:35:35', '2026-11-19 10:35:35'),
('b60e6fe8db5d5d00d50aeb10f37c57a1aab451bd46c141978043581e4e7b9a1a770bd73ab6cc348a', 1, 1, 'authToken', '[]', 0, '2025-11-14 15:44:49', '2025-11-14 15:44:49', '2026-11-14 15:44:49'),
('b618a7e44eee2a7d239378f4028fd60b0d7ade62d5a531a4aff9e7fd7917a2d271176e2dd8c6a0a8', 10, 1, 'authToken', '[]', 0, '2025-12-30 12:19:27', '2025-12-30 12:19:27', '2026-12-30 12:19:27'),
('b67c8b1512b2a0ee0b8872ae9d5ce80b1bcb1cbad6e7453616587ba9dcab62c9510f9018d719c821', 2, 1, 'authToken', '[]', 0, '2025-11-11 13:45:56', '2025-11-11 13:45:56', '2026-11-11 13:45:56'),
('b763b95bd89341b142cb7236908e23be0b1bcb5d9aa3a912c916334e61c0c484ccfc4bddc3da656a', 57, 1, 'authToken', '[]', 0, '2025-11-08 13:22:19', '2025-11-08 13:22:19', '2026-11-08 13:22:19'),
('b765740310eba7b61e8c3664b4f197b0f542e764fbe9b46e582ef23f3fb5aa8cb39abf68008ff98c', 1, 1, 'authToken', '[]', 0, '2025-12-04 13:51:47', '2025-12-04 13:51:47', '2026-12-04 13:51:47'),
('b8945e75933d2eedd646e0b9b302dbab3fabefd66d3a2ee9e9722f04bfb62e911e91feb51356dd92', 1, 1, 'authToken', '[]', 0, '2025-12-28 10:13:31', '2025-12-28 10:13:31', '2026-12-28 10:13:31'),
('b8a38c2c42f32481b5b5b16f2ef6e93ea4c43f53f8ce6f3442801b8d38d92bf5fc668c225f6b534f', 1, 1, 'authToken', '[]', 0, '2026-01-01 09:50:48', '2026-01-01 09:50:48', '2027-01-01 09:50:48'),
('b903486b19309bb21613c0b5a991e4fff5297444f3144ea75ae18c3ff9d6b51ba28061bf8653f663', 81, 1, 'authToken', '[]', 0, '2025-11-12 11:29:12', '2025-11-12 11:29:12', '2026-11-12 11:29:12'),
('b9d3b1908fba76f4a586d3502d80211168995f6c52f5e5665a12b0e12005c9af8ce9cc6357c130a6', 121, 1, 'authToken', '[]', 0, '2025-12-20 20:29:54', '2025-12-20 20:29:54', '2026-12-20 20:29:54'),
('ba0ce6f4ace73be413172c64bf1623218462612c95fdfaf15807f1c964ec557d1eb26e114b3748da', 156, 1, 'authToken', '[]', 0, '2025-12-28 14:24:53', '2025-12-28 14:24:53', '2026-12-28 14:24:53'),
('ba52732508a7c4b03d9c24bbd150bc71ff9982bfc37e2076ac290c3242b82b4beaa49aea50b56867', 10, 1, 'authToken', '[]', 0, '2025-11-30 11:00:37', '2025-11-30 11:00:37', '2026-11-30 11:00:37'),
('bab19e4f266d02d002414ea39de5a9bc1cb8f1f4acd2efd7625bd5862336e966a61547aafadd3ae0', 113, 1, 'authToken', '[]', 0, '2026-01-07 10:24:13', '2026-01-07 10:24:13', '2027-01-07 10:24:13'),
('bb0e43468898c009bceab2c68b335d310ac88d5500e9145feafcd0457834d1506c924b0795c08bf5', 64, 1, 'authToken', '[]', 0, '2025-11-08 14:26:20', '2025-11-08 14:26:20', '2026-11-08 14:26:20'),
('bbb07136149011257d74786afd179ff377c12c896299e62f8a329ec996f34abe7ffe042665990c57', 127, 1, 'authToken', '[]', 0, '2025-12-23 12:35:17', '2025-12-23 12:35:17', '2026-12-23 12:35:17'),
('bcf9f3e5aed4e3e60d5106380a261e330bda55a3ec25c393d470090bb24faa10096a7985892666bb', 75, 1, 'authToken', '[]', 0, '2025-11-11 10:50:34', '2025-11-11 10:50:34', '2026-11-11 10:50:34'),
('bd04f2a775594a3cf587d6ea12ba56064c4821a771dcb5df104438cc05cd60272217046c9ef7a9ae', 55, 1, 'authToken', '[]', 0, '2025-11-08 12:53:31', '2025-11-08 12:53:31', '2026-11-08 12:53:31'),
('bd5069cc11c75d61f6f3cc42967c31ede43746c4d9b806d0638c70288af5f343a9120132967299f0', 128, 1, 'authToken', '[]', 0, '2025-12-23 12:53:03', '2025-12-23 12:53:03', '2026-12-23 12:53:03'),
('bd711e339d1b029b0ce0a1b453c51a9e7065919696d49c5a0f207b31764dad98ede08d418ce7a72f', 1, 1, 'authToken', '[]', 0, '2025-11-03 17:47:23', '2025-11-03 17:47:23', '2026-11-03 17:47:23'),
('bd972b1c065f1d1a5ec08b5d385806e67a28c70213ad06a6bfc28906cbc5d53af24eb94486745b55', 10, 1, 'authToken', '[]', 0, '2025-11-06 21:12:57', '2025-11-06 21:12:57', '2026-11-06 21:12:57'),
('bde4a34716c1dfaa9640cf38604e0d202d3541cdead8c622d5d690125b0d8ab478900f5b5bd2db01', 126, 1, 'authToken', '[]', 0, '2025-12-23 11:44:15', '2025-12-23 11:44:15', '2026-12-23 11:44:15'),
('be72a458237b3a78d3eb153adba47c1ab6cd4b37fa9e975c742811dff5b83c24e2af50c5dca16305', 1, 1, 'authToken', '[]', 0, '2026-01-01 11:32:32', '2026-01-01 11:32:32', '2027-01-01 11:32:32'),
('be81b15513bc1fca387b6f252dc79ef23b4a6c02e8b8eee046692c32736d06b5932b2ef5fe596e82', 1, 1, 'authToken', '[]', 0, '2025-12-23 20:31:41', '2025-12-23 20:31:41', '2026-12-23 20:31:41'),
('beaf90dbaa722896dffc890a0ab3a8e3d656e50d5e78735cb87571d4a53860ea9032235c9a7fac12', 1, 1, 'authToken', '[]', 0, '2025-11-28 12:54:13', '2025-11-28 12:54:13', '2026-11-28 12:54:13'),
('beeeaf9c3250517565c2544c957dce836c960771e59f62494e29869f53ffe7df368de789bb4ff4ef', 21, 1, 'authToken', '[]', 0, '2025-11-11 22:49:06', '2025-11-11 22:49:06', '2026-11-11 22:49:06'),
('bef4cc39d8c78444bce74dc5695db4c81ac215f2d0572a2fe35b0256521f45ac7b996e84f198337a', 10, 1, 'authToken', '[]', 0, '2025-11-25 11:16:51', '2025-11-25 11:16:51', '2026-11-25 11:16:51'),
('bf0c006b406237a98b901e5680fceb6c2a2c2c32880acd6d3694abfff761572f79509a3444f15064', 1, 1, 'authToken', '[]', 0, '2025-11-17 10:57:39', '2025-11-17 10:57:39', '2026-11-17 10:57:39'),
('bf2fcbccfd4f477706d0f1f097a49ebf521560db34b06b19e8cd3c0c12a90601774142512424c95b', 131, 1, 'authToken', '[]', 0, '2025-12-24 12:35:50', '2025-12-24 12:35:50', '2026-12-24 12:35:50'),
('bf5f0a6895556b94e3b4db8a4e031601b6781db2f720d680663e9a865d8050c6dc51cb1c57237ed4', 1, 1, 'authToken', '[]', 0, '2025-12-27 15:01:23', '2025-12-27 15:01:23', '2026-12-27 15:01:23'),
('bf85bb5307aa74deca4395175a9cbfab138b21f1076e802d948da4da41887059e148506461c1fe77', 24, 1, 'authToken', '[]', 0, '2025-11-16 11:11:05', '2025-11-16 11:11:05', '2026-11-16 11:11:05'),
('bfb413f842745ea0d635b0e839ed3c87f5baf0fe53cf1938df5658720f9f760d01fae42271547e71', 177, 1, 'authToken', '[]', 0, '2026-01-08 12:46:57', '2026-01-08 12:46:57', '2027-01-08 12:46:57'),
('bfcce06a1109e9760cda11bde26f1ffebdb28df1740a0c84492a6581038b3feee6b9515d77a88f62', 122, 1, 'authToken', '[]', 0, '2025-12-22 15:21:34', '2025-12-22 15:21:34', '2026-12-22 15:21:34'),
('c068430df6c573e6ed1d04b58b2a6bc33885a554e9a1e4975077f6a4261aed80407af68a1996173e', 1, 1, 'authToken', '[]', 0, '2026-01-04 10:01:21', '2026-01-04 10:01:21', '2027-01-04 10:01:21'),
('c0aae2a9f251fe8c3047692390192ca6d897706bfa8b7c4fd71fcff0d76ac4ed9da037a15dfa2f87', 116, 1, 'authToken', '[]', 0, '2025-12-17 14:24:07', '2025-12-17 14:24:07', '2026-12-17 14:24:07'),
('c123403947031f421e0ba1edfd619a927b0a68a8917cdb6f66168f2b4ebcf352763589ccea96f8e1', 137, 1, 'authToken', '[]', 0, '2025-12-24 15:40:33', '2025-12-24 15:40:33', '2026-12-24 15:40:33'),
('c19a411b1dd21106507f9f7cdf5e88ff9ebc7de0bf9b604f631336b098ab9a76ad418c9f1a6a502b', 100, 1, 'authToken', '[]', 0, '2025-12-01 13:40:42', '2025-12-01 13:40:42', '2026-12-01 13:40:42'),
('c22c5c6848de8190718fa3be82731293f07bf6f36df9c67f2c8476c6ee9149bb5efb3dfedb55838e', 21, 1, 'authToken', '[]', 0, '2025-12-19 11:06:13', '2025-12-19 11:06:13', '2026-12-19 11:06:13'),
('c25d1708f86f7663b09893026a62016d44f942e2ff878b66100cdad191608735a17278704115d1b6', 10, 1, 'authToken', '[]', 0, '2025-11-16 11:27:44', '2025-11-16 11:27:44', '2026-11-16 11:27:44'),
('c27be54dee0d8ba0c95c59e4d982d261679d276a70cd0881a4a6916a11f89e93e1c7855a9d15b23c', 1, 1, 'authToken', '[]', 0, '2025-11-15 21:16:42', '2025-11-15 21:16:42', '2026-11-15 21:16:42'),
('c28a9529ea2efe96f8e5258dbc5e9516213c5b7dfc22d41b48f03eef55b72560d9040bee488d376c', 21, 1, 'authToken', '[]', 0, '2025-11-14 15:47:56', '2025-11-14 15:47:56', '2026-11-14 15:47:56'),
('c310529132a42063e3045f15f57f6fc22e344141449369215e17deb35f61b8ae75151efc36c9f1c2', 1, 1, 'authToken', '[]', 0, '2026-01-01 18:14:51', '2026-01-01 18:14:51', '2027-01-01 18:14:51'),
('c32db7e76941f64c7f111f34d745309352c5cb076422fa5b372940e965762a440a650bb34df3dce1', 56, 1, 'authToken', '[]', 0, '2025-11-08 13:03:00', '2025-11-08 13:03:00', '2026-11-08 13:03:00'),
('c38cd919b17d152ff78db9cab8c68a67ab51a525bbfa6249a43a208c39bdc2811c226b4909bfbdd6', 1, 1, 'authToken', '[]', 0, '2026-01-01 17:21:57', '2026-01-01 17:21:57', '2027-01-01 17:21:57'),
('c44720bc79452de753763960735e6f06c56bbd06f8dca0ee93c57f851f9717ea0440ac855b035234', 1, 1, 'authToken', '[]', 0, '2025-11-13 15:21:26', '2025-11-13 15:21:26', '2026-11-13 15:21:26'),
('c4b957444164ae657df2ea8987cf27bbb201511692d00e719a84ae43fd6d6af19fe240874c9c6955', 151, 1, 'authToken', '[]', 0, '2025-12-25 17:17:39', '2025-12-25 17:17:39', '2026-12-25 17:17:39'),
('c4d0f596ab55e805b5c478f5bc5c5dbb5d0495f403ff783e06e35ec670b43556e2b2213fa16a9845', 1, 1, 'authToken', '[]', 0, '2025-11-17 14:07:02', '2025-11-17 14:07:02', '2026-11-17 14:07:02'),
('c52b6c4441a3e15303c6699dce1b0bd949dcb44304fb066e5d6cf5570e9e44aa0896fe90629e89ec', 165, 1, 'authToken', '[]', 0, '2026-01-05 14:38:45', '2026-01-05 14:38:45', '2027-01-05 14:38:45'),
('c5388a30e07d424e9217399a91060437f7be4090d36155870768d80e936ff8ce78ad34ebb0af32cf', 21, 1, 'authToken', '[]', 0, '2025-11-04 10:09:00', '2025-11-04 10:09:00', '2026-11-04 10:09:00'),
('c5eaf6a119ff534f63a820f9d3236abf19f0816b0982d08f3563daaac48db2613520e159b4014b4b', 1, 1, 'authToken', '[]', 0, '2025-12-29 09:47:52', '2025-12-29 09:47:52', '2026-12-29 09:47:52'),
('c5ffb72d5fbd4daaf485771c4e6732c37d3b19ab97c9d2559ad2aba4eb8fdf8204582bc7e7bb2230', 1, 1, 'authToken', '[]', 0, '2025-11-08 12:02:43', '2025-11-08 12:02:43', '2026-11-08 12:02:43'),
('c619a948c2610870ff7f436a54bfa0d62a8ed4576c52b2218b3cebbe3c1701b7386866b3f48b0c18', 161, 1, 'authToken', '[]', 0, '2026-01-03 11:27:11', '2026-01-03 11:27:11', '2027-01-03 11:27:11'),
('c6449b05500824e7fe21d18aec17791d32f2dc65a90236bcc0ee610d0d78e35bd9aea57967546def', 150, 1, 'authToken', '[]', 0, '2025-12-25 17:04:04', '2025-12-25 17:04:04', '2026-12-25 17:04:04'),
('c68fcf448f05d3efa1a6dacefaecd7bc9eda164900c0f0b0cde72ea83b7aa9fd4e1c376d1c43b7e9', 1, 1, 'authToken', '[]', 0, '2025-11-05 12:32:10', '2025-11-05 12:32:10', '2026-11-05 12:32:10'),
('c6c9e6165b51978f33a77baa6a63cac963c230501977b1aef33f91b11b12938f165bad9469424ce5', 78, 1, 'authToken', '[]', 1, '2025-12-16 20:51:54', '2025-12-16 20:51:54', '2026-12-16 20:51:54'),
('c785c44077c757625ba290d86e91d1f3dc80e68d4b011e26f990e9f2bf3493453c6a66ed763677bb', 10, 1, 'authToken', '[]', 0, '2025-12-31 10:08:03', '2025-12-31 10:08:03', '2026-12-31 10:08:03'),
('c788b03c3830b9fc0a7e88e6ce569c0b25915e66624e6d265c109fdeda9da4432bf307683c90ff4e', 138, 1, 'authToken', '[]', 0, '2025-12-24 15:48:40', '2025-12-24 15:48:40', '2026-12-24 15:48:40'),
('c79f0aaf9df8b4eb233bfa903affb6a7518dbc69b11b1c3a96e39be89d0232ff16e28314956f5438', 12, 1, 'authToken', '[]', 0, '2025-11-17 09:59:04', '2025-11-17 09:59:04', '2026-11-17 09:59:04'),
('c7e29c66f293d5d9973211e9c3435b832baa41255295349c7f6de6907c40758463e9349a76dd0436', 8, 1, 'authToken', '[]', 0, '2025-11-18 13:33:11', '2025-11-18 13:33:11', '2026-11-18 13:33:11'),
('c86d37bfc67b3c680885d93957d0e6d2906a099f46624d9adf50fc91969b5936a403af45f45c41a4', 1, 1, 'authToken', '[]', 0, '2025-11-10 10:46:49', '2025-11-10 10:46:49', '2026-11-10 10:46:49'),
('c928568280a634ae75da5eab4a0ca04f98cb11608e377420cbc0ee7e59867488f66c89546a066e03', 1, 1, 'authToken', '[]', 0, '2025-12-03 09:51:09', '2025-12-03 09:51:09', '2026-12-03 09:51:09'),
('ca786ffc488fa30312b2237244a05170ffe27bb96e7bf26550e86b9b50e9221a642fa93889837b88', 23, 1, 'authToken', '[]', 0, '2025-11-16 11:02:29', '2025-11-16 11:02:29', '2026-11-16 11:02:29'),
('cafb3a8a4face8b5fc0fbc58f06299695f81297cc61194d3fd7908c82189ed545fa32c147ba4741b', 1, 1, 'authToken', '[]', 0, '2026-01-03 09:52:47', '2026-01-03 09:52:47', '2027-01-03 09:52:47'),
('cb1768c552d94fa2bfaa84f86fe0aa53bfde615d1db8a0dbe82841988f7fcf11c151fd66e4e6df83', 112, 1, 'authToken', '[]', 0, '2025-12-12 14:05:20', '2025-12-12 14:05:20', '2026-12-12 14:05:20'),
('cb915e8f1b80275d5ce2ba2d3fa62b3c80f52130308deb01a248fcdfb33c65e978c1e958ad224467', 1, 1, 'authToken', '[]', 0, '2025-12-25 17:53:18', '2025-12-25 17:53:18', '2026-12-25 17:53:18'),
('cbb66977865a8ff864e5c1f86242ee127904c765acf6404c4229d2cfde9359365116c871b46d187c', 110, 1, 'authToken', '[]', 0, '2025-12-09 11:46:43', '2025-12-09 11:46:43', '2026-12-09 11:46:43'),
('cbf640c44739dcc499ca767dd32b08e255f9ec9340efec3f943d42f6033cd088c518a6cb4a9a8f25', 1, 1, 'authToken', '[]', 0, '2025-12-05 09:59:03', '2025-12-05 09:59:03', '2026-12-05 09:59:03'),
('cccab596ebdb98be13a9e0572b1bd91384b32c5d1d845499659012506f1126ddcbba0e10ff89049f', 101, 1, 'authToken', '[]', 0, '2025-12-02 13:04:44', '2025-12-02 13:04:44', '2026-12-02 13:04:44'),
('cd04ae238d34e03deaf96fbd4fa893500f85147f966bfce937b99a357362455992602ee703f39e85', 1, 1, 'authToken', '[]', 0, '2025-11-10 09:49:08', '2025-11-10 09:49:08', '2026-11-10 09:49:08'),
('ce104f71419ee173a7c30123616dc863fa108108b4c920ada10f1ed85181f5095f918604bc596608', 16, 1, 'authToken', '[]', 0, '2025-11-17 14:29:27', '2025-11-17 14:29:27', '2026-11-17 14:29:27'),
('ce1155583ad26af41f215383723dc87a09a62348693f34102878d0d5f0426102c950bde6afa329e3', 168, 1, 'authToken', '[]', 0, '2026-01-05 18:03:02', '2026-01-05 18:03:02', '2027-01-05 18:03:02'),
('ce5dca603af7354fc3fd2c0da792f292023c9b5ee2df98fcadc5de06de33326671a211ca021ef0ed', 68, 1, 'authToken', '[]', 0, '2025-11-10 11:51:22', '2025-11-10 11:51:22', '2026-11-10 11:51:22'),
('ce5de92b67a98833f15d68f1ca7cdf20cde2d25c4c07ec4f218c25f9b59964dcf68775fc55810cb7', 148, 1, 'authToken', '[]', 0, '2025-12-25 13:44:04', '2025-12-25 13:44:04', '2026-12-25 13:44:04'),
('ce859783f577b1a0ecd00e00e79b916fdd0155af8d3515d49748c2b267660f795099e505dd38e7b0', 21, 1, 'authToken', '[]', 0, '2025-11-17 16:54:37', '2025-11-17 16:54:37', '2026-11-17 16:54:37'),
('cec04203407b37841bf6bb26982f095e46ec7d73c7283a5398dfec77e9489001b0daa6d09ec4aa12', 1, 1, 'authToken', '[]', 0, '2025-11-18 10:21:03', '2025-11-18 10:21:03', '2026-11-18 10:21:03'),
('cfb13cd7ad969ea10dc3ca841d8d88e18a971062f3fa633ad73f06ba02ce26953b8ae02b002ecefa', 1, 1, 'authToken', '[]', 0, '2025-12-13 09:55:09', '2025-12-13 09:55:09', '2026-12-13 09:55:09'),
('cfd803b602f327c33ecae37ab7c734c8e30b0f974bb4b12483d1e6942765528ffc1b0f930c14a19d', 10, 1, 'authToken', '[]', 0, '2025-11-20 21:43:31', '2025-11-20 21:43:31', '2026-11-20 21:43:31'),
('d0106bc7538f087aac78d273911e37ee29d3176c151b9bbe8667699dbbe5e63f9825c69fec21445f', 11, 1, 'authToken', '[]', 0, '2025-11-19 10:33:27', '2025-11-19 10:33:27', '2026-11-19 10:33:27'),
('d02cc0b2c4708339353ec828f1bf778428701af850f1e49de0702c951f415015e723fee0d6a1abed', 1, 1, 'authToken', '[]', 0, '2025-12-24 17:34:33', '2025-12-24 17:34:33', '2026-12-24 17:34:33'),
('d0539ea1386866133add0bcd8b7071012ee5a95a5809afbf93f7f78c70ca9c3f92c9f20682b0a1a1', 21, 1, 'authToken', '[]', 0, '2025-12-11 11:53:04', '2025-12-11 11:53:04', '2026-12-11 11:53:04'),
('d06b8f859ee5298d37f5fb559327b5fabec58a6221f9e84784ff52b7ecf98e8c3e4330b169fc5853', 58, 1, 'authToken', '[]', 0, '2025-11-08 13:30:34', '2025-11-08 13:30:34', '2026-11-08 13:30:34'),
('d1e2cfc77ee167c14afcee5dfd216fb344e4a0782283a27a2313cb812b6fead6b6f7e731b84ab33d', 1, 1, 'authToken', '[]', 0, '2025-11-03 17:30:54', '2025-11-03 17:30:54', '2026-11-03 17:30:54'),
('d28e4669183c843e40f6c75a44c9d6eba010bd69f42067fb335337b31f17272521e9a08852af8fb1', 10, 1, 'authToken', '[]', 0, '2025-11-10 13:03:25', '2025-11-10 13:03:25', '2026-11-10 13:03:25'),
('d29ef8ed6bb2578312aaf73962558102eaaf9699b57c53d5273702ed8bdf11b0e1d945630c5ef11d', 10, 1, 'authToken', '[]', 0, '2025-11-12 15:28:55', '2025-11-12 15:28:55', '2026-11-12 15:28:55'),
('d2c8ec1a0076d27e1c39854f7b436b2407c75625f251eebfb9cc3c7fd4a8d27deaa38dbe7533c159', 26, 1, 'authToken', '[]', 0, '2025-11-04 13:13:48', '2025-11-04 13:13:48', '2026-11-04 13:13:48'),
('d2d10670f77cad618e3f3451b891542d1e082074d3ae2e4600234d38d1e1b1571e2bfce644d38078', 1, 1, 'authToken', '[]', 0, '2025-12-12 11:45:16', '2025-12-12 11:45:16', '2026-12-12 11:45:16'),
('d2f13347914e1662779dca64e4b3f1243b27a1dd6c8350d645b2032db55d668618d3aab2fea6d728', 16, 1, 'authToken', '[]', 0, '2025-11-03 18:16:41', '2025-11-03 18:16:41', '2026-11-03 18:16:41'),
('d327b442bdb9153a60d14ee3eed30b398b3c3e0eb0ec1bb750acc95d59e8c80e3eeb5fe7db833911', 1, 1, 'authToken', '[]', 0, '2025-11-22 15:16:23', '2025-11-22 15:16:23', '2026-11-22 15:16:23'),
('d3f9362865e214fbaa3573896efc7e519c3d4fff5695aefcd39db24c839948c80fcf81a71e15abcb', 92, 1, 'authToken', '[]', 0, '2025-11-22 12:08:20', '2025-11-22 12:08:20', '2026-11-22 12:08:20'),
('d414cce4c8779a6bfa5ddee7f9a653b2064cbd5d1a3e6c9cf41f59186a24ed0776d211da21c18f67', 28, 1, 'authToken', '[]', 0, '2025-11-04 15:57:17', '2025-11-04 15:57:17', '2026-11-04 15:57:17'),
('d4eb42082f70b5959d64ac0e0a50744a6736c289330d2fe1967c7f825a0d640884cf2484cb0c7588', 1, 1, 'authToken', '[]', 0, '2025-12-04 11:58:42', '2025-12-04 11:58:42', '2026-12-04 11:58:42'),
('d50a4fa466d9fc4326465e1fa28c8bd9dd8f954c74fd8417ff15ab6aafddd08d47721ffc011bd299', 10, 1, 'authToken', '[]', 0, '2025-11-14 17:12:13', '2025-11-14 17:12:13', '2026-11-14 17:12:13'),
('d60d2e9458ff6f451bc73f22df0e62421a65df927ac0a9b8c55fc649f6ccb78c7f0e3ed5a742d93a', 10, 1, 'authToken', '[]', 1, '2025-11-13 17:02:28', '2025-11-13 17:02:28', '2026-11-13 17:02:28'),
('d63c6cfed325b9d4df552deec8c27948cdb7bf61f8e07aaf5ec820b49180e1046e24f14985f27cb0', 21, 1, 'authToken', '[]', 0, '2025-11-07 10:26:59', '2025-11-07 10:26:59', '2026-11-07 10:26:59'),
('d696d5b5782e3c498746fbe316593622c2db80566b5192ece955c73cc75a59bb9cb319ad1adcb3b2', 10, 1, 'authToken', '[]', 0, '2025-11-28 12:06:53', '2025-11-28 12:06:53', '2026-11-28 12:06:53'),
('d6ef32bb2802216d8aaed952f382082e9b491bd56f0bf8b828bcd086d83682ae6b7bd8908af56a0e', 10, 1, 'authToken', '[]', 0, '2025-11-14 13:38:03', '2025-11-14 13:38:03', '2026-11-14 13:38:03'),
('d72bfb19a2e5a9ac7afb0008b6ebc50948855b915142111f4ab5d8f702c96b5d3dbb8bfaf861de81', 52, 1, 'authToken', '[]', 0, '2025-11-07 16:44:08', '2025-11-07 16:44:08', '2026-11-07 16:44:08'),
('d743543392fda4cbbcb85614e0184cc2f9cea4b2050669897591809a48ee8d3f48ca5bc454c54295', 163, 1, 'authToken', '[]', 0, '2026-01-05 13:14:45', '2026-01-05 13:14:45', '2027-01-05 13:14:45'),
('d75813b712faec5b33366c063ac7a99ae2e54487b0a5f97322ca74bc763b8c5d2c601a67f3571132', 1, 1, 'authToken', '[]', 0, '2025-11-26 17:03:16', '2025-11-26 17:03:16', '2026-11-26 17:03:16'),
('d7b380dd0c683653b556e650d0cbcf1e4f046071634b932cb24b5a5f6d1a4c7fff06ba7e59bc534b', 1, 1, 'authToken', '[]', 0, '2025-11-20 18:10:06', '2025-11-20 18:10:06', '2026-11-20 18:10:06'),
('d7ecb2549d4459795912c14e98f24111852ee73e4abf1ae67f9e0f9ea8a6eac4cb9976bf9d826c1b', 27, 1, 'authToken', '[]', 0, '2025-11-22 15:31:31', '2025-11-22 15:31:31', '2026-11-22 15:31:31'),
('d86ada4f36b25366950fc65ff2fe9bb000718c6fda7768293db608a3fdd815d9c3974f62212cb85a', 144, 1, 'authToken', '[]', 0, '2025-12-25 10:34:51', '2025-12-25 10:34:51', '2026-12-25 10:34:51'),
('d86bea2d0e8e235699aa65336fe010e5cc3af63e27dc2078367d203af970afd8901664d3bd12d9e1', 1, 1, 'authToken', '[]', 0, '2025-12-16 11:48:46', '2025-12-16 11:48:46', '2026-12-16 11:48:46'),
('d91866daee9ba488421e440206fa3e18bec8cffa4fd562fb5064a9ea36acf45fd353ad5fc11017bf', 108, 1, 'authToken', '[]', 0, '2025-12-09 09:45:44', '2025-12-09 09:45:44', '2026-12-09 09:45:44'),
('d926a1a65a38fad95380560d17449fc07a0f417960c0df61cdfb0c87bfb1fc4cca20b7d4c6544047', 16, 1, 'authToken', '[]', 0, '2025-11-17 10:43:54', '2025-11-17 10:43:54', '2026-11-17 10:43:54'),
('d96d3cc67ff79835024f86ef13f8362ecbfa20099dc05a6d7f96d8a94460c431db03b22427c27dee', 1, 1, 'authToken', '[]', 0, '2025-11-10 13:07:55', '2025-11-10 13:07:55', '2026-11-10 13:07:55'),
('d9d77caa1aac5f842ffae16c256ec1cda20435aeadeae83640f489610768ab21c9bd3a6e7be61886', 1, 1, 'authToken', '[]', 0, '2025-11-05 09:54:50', '2025-11-05 09:54:50', '2026-11-05 09:54:50'),
('d9eaabc3e868c42d3cafac02852f2db0ba82d5253f899b1207f49e7ed55a843dbd3c4360f26156a6', 8, 1, 'authToken', '[]', 0, '2025-11-18 15:54:11', '2025-11-18 15:54:11', '2026-11-18 15:54:11'),
('da03d6eb71491cba9a177658aeb1902d081e6c6bc13b400bb432ade82737212ae8927c130989260d', 119, 1, 'authToken', '[]', 0, '2025-12-19 12:51:41', '2025-12-19 12:51:41', '2026-12-19 12:51:41'),
('da96dbb1c0daeafe782ecde539f7b6d966aef796fdfb2357175973e7d7df57be5042aa1692b3b6f0', 16, 1, 'authToken', '[]', 1, '2025-11-17 11:07:19', '2025-11-17 11:07:19', '2026-11-17 11:07:19'),
('db0588e7ff7bc930a37df00f853103e316e03ce999864c1b00f9e233e0623ff73667fae1b6849e6c', 1, 1, 'authToken', '[]', 0, '2025-12-22 16:37:49', '2025-12-22 16:37:49', '2026-12-22 16:37:49'),
('db0a24fb16b8d48bf10bcef22227115f35300bc8f9075117ac5d88c701852635a61e4dd971eb0c28', 178, 1, 'authToken', '[]', 0, '2026-01-08 13:27:56', '2026-01-08 13:27:56', '2027-01-08 13:27:56'),
('db5a087714195b356463bd774117e5e092cae9677fcd693a227eb4b8774f63a6319774a42b23f052', 19, 1, 'authToken', '[]', 0, '2025-11-12 19:08:06', '2025-11-12 19:08:06', '2026-11-12 19:08:06'),
('dbeba0442eb8142255d342c42bc9eab4793f2c98275147d2bf2dc467ec3cb433218ed98222b61cc3', 1, 1, 'authToken', '[]', 0, '2025-11-28 12:59:43', '2025-11-28 12:59:43', '2026-11-28 12:59:43'),
('dd4ece875829749173175b98adf851302c34d0ce2663a0b28032df976a12a40da166d942a919f4a5', 1, 1, 'authToken', '[]', 0, '2025-11-17 10:56:05', '2025-11-17 10:56:05', '2026-11-17 10:56:05'),
('dd847b5abb20a7b0d13bd38e18373af3cf3fc213ac8f68c900758a19291a972502fa169fd7d20ca7', 10, 1, 'authToken', '[]', 0, '2025-11-24 13:33:21', '2025-11-24 13:33:21', '2026-11-24 13:33:21'),
('de59f344bfb1579f4217125f947ada08d975b45b48be86528e5ae5a717f69b99365fb5c9533e6e0d', 1, 1, 'authToken', '[]', 0, '2025-11-22 17:43:06', '2025-11-22 17:43:06', '2026-11-22 17:43:06'),
('ded6234c28c15e887f1e1c0716db80557c96b11e4b4b1cdd33903238c27048df603e1eeb20dfa13c', 71, 1, 'authToken', '[]', 0, '2025-11-10 12:05:22', '2025-11-10 12:05:22', '2026-11-10 12:05:22'),
('e1ef53631ba57ec3eda3de09c1fa011f3548ee73d17dfc54cd05e9bd590ab078b5695ed750f3633f', 10, 1, 'authToken', '[]', 0, '2025-12-17 17:29:39', '2025-12-17 17:29:39', '2026-12-17 17:29:39'),
('e1f3701af63ec29a7f713aafba29b2eae0ca4073569e47e5e2c722bb752fbbddc9dd41179f9355c6', 8, 1, 'authToken', '[]', 0, '2025-11-11 12:11:27', '2025-11-11 12:11:27', '2026-11-11 12:11:27'),
('e38d0d5ee2aa5471934934461e094af068a1135274fdbd3dc593a2b667db0cc2aa6e68c744ae94d3', 59, 1, 'authToken', '[]', 0, '2025-11-08 13:33:15', '2025-11-08 13:33:15', '2026-11-08 13:33:15'),
('e3b8fe77eb2c60e59c8e4840fe9f5ef808a70c74a0810d50ad6574e7be582f78deda62e56fb00af1', 21, 1, 'authToken', '[]', 0, '2025-12-23 14:30:02', '2025-12-23 14:30:02', '2026-12-23 14:30:02'),
('e3dd87dee070f2ccabe4f9f9d074aded68b1afdbc27b2bcb9fb790b8bf1c782f968c20a450174eb2', 1, 1, 'authToken', '[]', 0, '2025-11-10 15:42:55', '2025-11-10 15:42:55', '2026-11-10 15:42:55'),
('e468b8b221eb514af7e1a588558bd3d22a5131cdab29b2e669a4b1eeb28389295654b070ecfa3d4e', 1, 1, 'authToken', '[]', 0, '2025-12-15 10:21:29', '2025-12-15 10:21:29', '2026-12-15 10:21:29'),
('e4cfa8fbaa49049d40d7cb2b23d8b9a9e65e1932fe72dfd20364b81c52bc976353ffe3462396b878', 1, 1, 'authToken', '[]', 0, '2025-11-10 23:10:28', '2025-11-10 23:10:28', '2026-11-10 23:10:28'),
('e51105fde97f90a8edd2173d85eceaecd7725cb4520ee5f8b1aa45079f5862b630089c5b3f676be5', 1, 1, 'authToken', '[]', 0, '2025-11-26 10:18:56', '2025-11-26 10:18:56', '2026-11-26 10:18:56'),
('e585ebedcec80e21ec5ad5153bd1ed2766906694151720316b91d873a0b48913ae0d4e06d428ded5', 54, 1, 'authToken', '[]', 0, '2025-11-08 12:48:44', '2025-11-08 12:48:44', '2026-11-08 12:48:44'),
('e6adcf17924ff8ddf1dafc8a01b3c9f6f3343d673c7509ccb3e3e2a54c7e15b368bca90b03778374', 1, 1, 'authToken', '[]', 0, '2025-11-08 09:46:32', '2025-11-08 09:46:32', '2026-11-08 09:46:32'),
('e7f4ea8cbaac2fa19a4a592406a5ca44f11390a98392489e123c424c9d584b85bab0940b8757073b', 140, 1, 'authToken', '[]', 0, '2025-12-24 16:26:29', '2025-12-24 16:26:29', '2026-12-24 16:26:29'),
('e82412041741850b9227356e2f9a868a58299aea50a84817fb2b58b41d9750d89143766ef333800b', 10, 1, 'authToken', '[]', 0, '2026-01-08 10:09:13', '2026-01-08 10:09:13', '2027-01-08 10:09:13'),
('e8820cf6c18a6be27922d025dec1ca52eb874dc5d34bd7f78a5cab30608342e0e847bfad1b9e71ae', 1, 1, 'authToken', '[]', 0, '2025-11-20 16:46:32', '2025-11-20 16:46:32', '2026-11-20 16:46:32');
INSERT INTO `bl_oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('e8965b4a3c90d041cbf8f426a8d39ab75d7a21c25edfdaceae75dbb6d242c7e068250b37da63d5d5', 1, 1, 'authToken', '[]', 0, '2025-11-07 09:36:53', '2025-11-07 09:36:53', '2026-11-07 09:36:53'),
('e8cca78b0b2cc1b4089ff1fb6dbaa2b82a4afa90c5d1354e7081a18dae12db0ef58760a1cd1a0d90', 1, 1, 'authToken', '[]', 0, '2025-11-17 15:18:40', '2025-11-17 15:18:40', '2026-11-17 15:18:40'),
('e902bd7be924afd826243fd857d77991e6a72440cff71541d9250d6ed42573a6daf58d5e9a675d2e', 10, 1, 'authToken', '[]', 0, '2026-01-08 12:23:29', '2026-01-08 12:23:29', '2027-01-08 12:23:29'),
('e92e89d158d828fee3654bd1cca414a6027b0d8ea5921fd746c67562cbc1974dcc957ae7750a63d9', 10, 1, 'authToken', '[]', 0, '2025-11-10 12:08:03', '2025-11-10 12:08:03', '2026-11-10 12:08:03'),
('e9d3d79032803b1a1300306e45760db761534564ab4a5ac71dcbb1549b5276a3ed872282f489031a', 1, 1, 'authToken', '[]', 0, '2025-11-24 11:41:04', '2025-11-24 11:41:04', '2026-11-24 11:41:04'),
('e9d6a5a5e2cdfebe5e809b1ec124f79d6b954b1e93aa62901aa3c20ced657215ecdbd3cb231ca883', 19, 1, 'authToken', '[]', 0, '2025-11-12 19:05:29', '2025-11-12 19:05:29', '2026-11-12 19:05:29'),
('e9e89ede0358ccb861417bf128db13219c771056bdabd5576d4a2758aff84324f8e34c8ccfbfc1eb', 10, 1, 'authToken', '[]', 0, '2025-12-20 16:37:16', '2025-12-20 16:37:16', '2026-12-20 16:37:16'),
('ea5180b8cc0a5dfdcdacd60134c20e5c74e6b1191a1b51fb348f55b71827591d07f9b73337fe8fc1', 80, 1, 'authToken', '[]', 0, '2025-11-11 12:46:03', '2025-11-11 12:46:03', '2026-11-11 12:46:03'),
('eb197651dcd38b45f611894731e950f35216c67872c9c0b4d7d276d457019b5ab491a9e905660619', 10, 1, 'authToken', '[]', 0, '2025-11-29 10:30:08', '2025-11-29 10:30:08', '2026-11-29 10:30:08'),
('eb4040ec2dfbb26fd06a8109e43b28d95616d2fb02aed7d5e6b4858cb3b8f3b344970f93926374b5', 22, 1, 'authToken', '[]', 0, '2025-11-07 10:09:04', '2025-11-07 10:09:04', '2026-11-07 10:09:04'),
('eb429ca13372d6b14dcedee7d4f1a8aa77d65e245de0d1bc581ef073822c3e80f97a2a41c4ee50f3', 62, 1, 'authToken', '[]', 0, '2025-11-08 13:51:31', '2025-11-08 13:51:31', '2026-11-08 13:51:31'),
('eb8a767f0f1e6eb82158be9d8c5b1736b47983e48e0e300a3163c4cebf601c278a224005c0d9d63c', 25, 1, 'authToken', '[]', 0, '2025-11-16 10:55:07', '2025-11-16 10:55:07', '2026-11-16 10:55:07'),
('eb8f3d85b24c3d2ee2714cfca88dd79f489cd933eb45f11c83c6c6c8b4d7fd0abd9cb0c46009ef64', 22, 1, 'authToken', '[]', 0, '2025-11-06 18:35:26', '2025-11-06 18:35:26', '2026-11-06 18:35:26'),
('eb9793c8c054b16d1963fadc7bcbd299b38a4441afa160bc12afae37c7b0dcf281db8f56bc14a62f', 21, 1, 'authToken', '[]', 0, '2025-11-05 10:25:34', '2025-11-05 10:25:34', '2026-11-05 10:25:34'),
('ebfe656fe9bbf42196ca90153ff49e2c44277444641dc37883b902423b4e174c1d350fe57c05f5be', 95, 1, 'authToken', '[]', 0, '2025-11-24 18:01:16', '2025-11-24 18:01:16', '2026-11-24 18:01:16'),
('ec4798231f0445b6299b9cb1e4d7e118e9477c20861a72d904eda2fc1b2ad365e8df35be3b8a5ee8', 21, 1, 'authToken', '[]', 0, '2025-11-07 14:32:47', '2025-11-07 14:32:47', '2026-11-07 14:32:47'),
('ec7c8e1b1bac47946ed83ce91c51872f3ff1556869b6244b1565e52ec2a87291dd11386c015300bf', 39, 1, 'authToken', '[]', 0, '2025-11-04 06:57:04', '2025-11-04 06:57:04', '2026-11-04 06:57:04'),
('eca5629c038cec54a0a6fbb9d80562c48301d54d8f84136f0e7a8d45e5fc6114e9cebbe79b114aac', 1, 1, 'authToken', '[]', 0, '2025-11-17 09:48:35', '2025-11-17 09:48:35', '2026-11-17 09:48:35'),
('ecba38c4c72750fa2e75d482aba060d70cae59d32430abbe8a5e3b9f5dcdd739ff6b312c4e1bb414', 135, 1, 'authToken', '[]', 0, '2025-12-24 14:38:31', '2025-12-24 14:38:31', '2026-12-24 14:38:31'),
('ecd8af93fd1fe5f1eab1028552f21f1e882ec4900f82c7ccc0605338d55bfc987c9d06b8240fb4fc', 12, 1, 'authToken', '[]', 0, '2025-11-17 14:22:07', '2025-11-17 14:22:07', '2026-11-17 14:22:07'),
('ecea04333e8484c226bb8a9c7cdc7ebcafb20763ed8907c55b7d9565a09ae00d7c57f456bde1527b', 10, 1, 'authToken', '[]', 0, '2025-11-13 11:10:39', '2025-11-13 11:10:39', '2026-11-13 11:10:39'),
('ed7989100fb5f9e68a66b4938ef4697c0f54568c35fe83fbf971d37c03a51377c48dd3aab0f66497', 97, 1, 'authToken', '[]', 0, '2025-11-26 14:51:36', '2025-11-26 14:51:36', '2026-11-26 14:51:36'),
('ed9b4dc438528bdbbd7f584abaeb5747f3ac0570f2be00d0a1b1dcb84bc1ca21befc95ba162d9c05', 22, 1, 'authToken', '[]', 0, '2025-11-11 12:12:00', '2025-11-11 12:12:00', '2026-11-11 12:12:00'),
('ee42f7e94d0fa74347de5bc5d57d4011d5368b92d90a21a8ab10d9747d6893ca64783c858eee5a15', 21, 1, 'authToken', '[]', 0, '2025-11-24 10:53:52', '2025-11-24 10:53:52', '2026-11-24 10:53:52'),
('ee5e6ff4b4c8414fcd2e8f0cb92017c40c0b1cbe2d677fc1ff4ad7347aab8b6e9148a9e845e7c046', 1, 1, 'authToken', '[]', 0, '2025-11-20 15:33:09', '2025-11-20 15:33:09', '2026-11-20 15:33:09'),
('ee8ab0f6e61e14935421127dcc97f4aaf7018f5a3be2289f0ad2774626d2ed13468f2c5480cacaad', 1, 1, 'authToken', '[]', 0, '2025-12-16 13:08:41', '2025-12-16 13:08:41', '2026-12-16 13:08:41'),
('ef675037c3af71397b170545315e1e221f259454c89f012c3d523334b30d46df6e558254b250181f', 20, 1, 'authToken', '[]', 0, '2026-01-07 18:30:28', '2026-01-07 18:30:28', '2027-01-07 18:30:28'),
('efb22124b4c925b4bec4d94b3f9bc58d954bad3d52397ce91ca7d39b2337fdddfdf84240c7d21416', 16, 1, 'authToken', '[]', 0, '2025-12-03 15:20:54', '2025-12-03 15:20:54', '2026-12-03 15:20:54'),
('eff7c85fcf856a90b0e95a6804afe71658cdd3f872fa1a21caba24a37b913ee2bcb80eea681f1fe0', 134, 1, 'authToken', '[]', 0, '2025-12-24 13:42:20', '2025-12-24 13:42:20', '2026-12-24 13:42:20'),
('f1057371f29b667041e65b277914a0cc1248407fa17829a2cd313dcdb77eb659d43c4a598df6c068', 83, 1, 'authToken', '[]', 0, '2025-12-20 17:19:49', '2025-12-20 17:19:49', '2026-12-20 17:19:49'),
('f13283badb946d4b9177b45287b78c0c2d75d339348c5c022102d27ea469b9410296137235201d2b', 49, 1, 'authToken', '[]', 0, '2025-11-06 18:58:14', '2025-11-06 18:58:14', '2026-11-06 18:58:14'),
('f17f282e0a4d474733152f61f999d38aeef3373b211360615ef5ea27211e9692860d3732965adf8c', 1, 1, 'authToken', '[]', 0, '2025-11-24 10:04:14', '2025-11-24 10:04:14', '2026-11-24 10:04:14'),
('f1a50fadc5bdec527b1b84a65f42670c40ef93b7ac4ef1023b336e709e4238b381731e2e88ed09de', 21, 1, 'authToken', '[]', 0, '2025-12-18 16:55:49', '2025-12-18 16:55:49', '2026-12-18 16:55:49'),
('f1da12cd8d798cb44ecf85c77cf894bf7858ae4e76f06b7ad07e818e217ad4094a6146a5e6e3b2d1', 1, 1, 'authToken', '[]', 0, '2025-11-12 10:22:33', '2025-11-12 10:22:33', '2026-11-12 10:22:33'),
('f1eaecdead30530f987e17601dc648599c632399c2a549fbe2200b5bcd0464e813f25fcbcf925357', 1, 1, 'authToken', '[]', 0, '2026-01-01 17:42:07', '2026-01-01 17:42:07', '2027-01-01 17:42:07'),
('f1f489d5e660bf7553c3bfc8b17c314232db28de8a1d3a58f2cb0d96e9a9091f64b032a3a6cf657e', 45, 1, 'authToken', '[]', 0, '2025-11-08 14:45:11', '2025-11-08 14:45:11', '2026-11-08 14:45:11'),
('f2905d446ee3ecaf37d1631778b856909b8285c023fc647aa96058233b9491baedd57ea340f5cb20', 1, 1, 'authToken', '[]', 0, '2025-11-20 15:31:30', '2025-11-20 15:31:30', '2026-11-20 15:31:30'),
('f3342a3400fb9970d342134e71c87c7db43ec2db7db82609ca6a1126b7ba6f7179cc1587c59df0a1', 63, 1, 'authToken', '[]', 0, '2025-11-08 13:55:20', '2025-11-08 13:55:20', '2026-11-08 13:55:20'),
('f34877e3a099d10772f73108f230a6ccc81fe2e1946afb38ca5258655bad00796db5aaad5632b47f', 1, 1, 'authToken', '[]', 0, '2025-11-30 09:55:27', '2025-11-30 09:55:27', '2026-11-30 09:55:27'),
('f36baa5388beacd1fadea57609d856fa50cec6eefb78bc4506757f93ef6f62c57c01ee59c34aed00', 10, 1, 'authToken', '[]', 0, '2026-01-05 15:53:03', '2026-01-05 15:53:03', '2027-01-05 15:53:03'),
('f4259e158a1c005f0c8b5013ec736be9f6e612b7d7aa142c29945c9ba14686defa32814c24e39708', 76, 1, 'authToken', '[]', 0, '2025-11-11 11:29:14', '2025-11-11 11:29:14', '2026-11-11 11:29:14'),
('f5909638b1cb1d685c78bb927d8916dc704a87ab9be9d556d517bb1fb9be4d6587a29f08c6898329', 10, 1, 'authToken', '[]', 0, '2025-11-08 15:33:54', '2025-11-08 15:33:54', '2026-11-08 15:33:54'),
('f5c3ac028f6fcbf3158b031ff34ef05000de5346e9ec5ceec678278c860d8deeb9043dcfac7bdadf', 74, 1, 'authToken', '[]', 0, '2025-12-08 12:37:59', '2025-12-08 12:37:59', '2026-12-08 12:37:59'),
('f5d43e77e2ec00827a82e9e211671133a2778291f6003c413b26d9829051ac558c8be024bc284c37', 1, 1, 'authToken', '[]', 0, '2025-12-30 17:25:39', '2025-12-30 17:25:39', '2026-12-30 17:25:39'),
('f6e4341a7bd37ef395070596f9d6b12d38e2212b2ef82de8f5cd4c39c5fb6ee66de7fbae65ced426', 1, 1, 'authToken', '[]', 0, '2025-11-30 11:16:29', '2025-11-30 11:16:29', '2026-11-30 11:16:29'),
('f710835fb1572be9968951b9378bca3285e066039c452360be6a679b5e833aa1d8ef086806a85c8c', 162, 1, 'authToken', '[]', 0, '2026-01-05 12:53:38', '2026-01-05 12:53:38', '2027-01-05 12:53:38'),
('f78eb87e5c2e060cd0baebc83fc3169da099889557c7f484186337383dd3678957f0e263ff039a66', 1, 1, 'authToken', '[]', 0, '2025-11-07 08:51:55', '2025-11-07 08:51:55', '2026-11-07 08:51:55'),
('f790f026be1e5ec88ab8adf5c87fc79df470240ebb5770649410917ae2bfa82207b2f1b844814266', 1, 1, 'authToken', '[]', 0, '2025-11-22 16:27:55', '2025-11-22 16:27:55', '2026-11-22 16:27:55'),
('f79f83f16d5e562a799a64fdd842ceef39a41a9bf37a038a0b0a4d87ec96f266f47a19986546fb50', 1, 1, 'authToken', '[]', 0, '2025-11-27 09:48:55', '2025-11-27 09:48:55', '2026-11-27 09:48:55'),
('f7da516e98cc36c1681a277d6be34c1ef5cd10c5f1225fc19f843eee66254c35c5d95e491fc86b6b', 24, 1, 'authToken', '[]', 0, '2025-11-06 14:17:30', '2025-11-06 14:17:30', '2026-11-06 14:17:30'),
('f817b82445b25f444819d6792599c9f4685c7a3cae19aac6388bd4e5f3a9326d48c5efa00fc73116', 21, 1, 'authToken', '[]', 0, '2025-11-15 10:41:35', '2025-11-15 10:41:35', '2026-11-15 10:41:35'),
('f81fb425495604b24f9026cc496203f2ddbebba845ee8c3987291c8843ca45da54336cb48c2f6cc8', 99, 1, 'authToken', '[]', 0, '2025-11-27 20:16:43', '2025-11-27 20:16:43', '2026-11-27 20:16:43'),
('f846b9bdae2aeebe7010c1b47a051ba4910294d66da644c5d4d788684e34d458bee4f8db015af2b7', 96, 1, 'authToken', '[]', 0, '2025-11-25 12:51:30', '2025-11-25 12:51:30', '2026-11-25 12:51:30'),
('f85ae0b22dac835a675bde2fc68a9800bf8e80d1126b989cdbb019a5d1f0faaa48991d6fefc59cde', 1, 1, 'authToken', '[]', 0, '2025-11-07 11:23:51', '2025-11-07 11:23:51', '2026-11-07 11:23:51'),
('f8ad4bfe880aa3eaf2ec2f2e830965f5a45e5c6f070a7041bbb74008e6e9034fdde5112e4ce12326', 10, 1, 'authToken', '[]', 0, '2025-12-23 15:22:55', '2025-12-23 15:22:55', '2026-12-23 15:22:55'),
('f8c09bb06a68c76b2cc2eab5d16a00c3f229ec72710b676ca349f3b683599622fd7a83f50d0722cd', 1, 1, 'authToken', '[]', 0, '2025-11-26 18:11:38', '2025-11-26 18:11:38', '2026-11-26 18:11:38'),
('f8c4c5dd0802fb4f8e484b59c3ee8ec64eb777a2fd69ed1a7af86874369372be4c88c26d88a65503', 11, 1, 'authToken', '[]', 1, '2025-11-08 20:01:40', '2025-11-08 20:01:40', '2026-11-08 20:01:40'),
('f9435eb17c02d333bf8ece691b952e10ab56ef8c99a84c41d9d42e5c936a60229c0e2f70dd33cfcc', 129, 1, 'authToken', '[]', 0, '2025-12-23 13:05:41', '2025-12-23 13:05:41', '2026-12-23 13:05:41'),
('f977264daf2fe06fbb67ea7c2524c441f8077bb5344b4231a719a62e733a97927a6d322a14900cda', 1, 1, 'authToken', '[]', 0, '2025-11-11 12:39:21', '2025-11-11 12:39:21', '2026-11-11 12:39:21'),
('fa6b8366d5c077d772a6b661fe43052f0d74bba96e89337d68f884950ba95f53ca800c8b933113a0', 1, 1, 'authToken', '[]', 0, '2025-12-25 10:18:40', '2025-12-25 10:18:40', '2026-12-25 10:18:40'),
('faa14fa36d7fbc80b93db834a9b05a5f291b0350a97be7b43de0df028a8f5860fa977d2363a7f1a3', 1, 1, 'authToken', '[]', 0, '2025-11-08 12:47:00', '2025-11-08 12:47:00', '2026-11-08 12:47:00'),
('fc04c7e73233323c97cbc7c5197eff4486b78f737d3805124aa448412967b8f1812b75a93432a7de', 1, 1, 'authToken', '[]', 0, '2025-12-31 19:43:55', '2025-12-31 19:43:55', '2026-12-31 19:43:55'),
('fc1ed37ffa362506e6c74a57e3c44edd8279da17d3fdc918821fb6f149f4f2294ffc50cf1e58bcdc', 1, 1, 'authToken', '[]', 0, '2025-11-04 10:03:18', '2025-11-04 10:03:18', '2026-11-04 10:03:18'),
('fc418c90c52d36166afa3a1209cdba5d21830af080ace50de8af998183bd8719ce5f2dc02f3689ee', 175, 1, 'authToken', '[]', 0, '2026-01-06 17:44:35', '2026-01-06 17:44:35', '2027-01-06 17:44:35'),
('fc5b5548308a1a389f879a53925ffc42279472b5c86add82a1ed1c021788c68c86df42496d70a2b5', 143, 1, 'authToken', '[]', 0, '2025-12-24 19:57:23', '2025-12-24 19:57:23', '2026-12-24 19:57:23'),
('fc76ecfc7b7c4c5de8aaf484066a9b33b315c737c2a38cc4e4fbad2f0a94c64f96acda717bd86f2f', 21, 1, 'authToken', '[]', 0, '2025-11-20 16:30:32', '2025-11-20 16:30:32', '2026-11-20 16:30:32'),
('fd00e65470bda6d849c841d36b1ee3be7b968939df4c82830ce9d3727291e4297eb4d9c88ac67cab', 66, 1, 'authToken', '[]', 0, '2025-11-10 11:07:56', '2025-11-10 11:07:56', '2026-11-10 11:07:56'),
('fd21773f26b96a48d60b5950b6284c9f9cb50df7e53d31e25494208e5ada91ad0165cd82744732ad', 1, 1, 'authToken', '[]', 0, '2025-11-06 09:51:54', '2025-11-06 09:51:54', '2026-11-06 09:51:54'),
('fd9820c621c73cf1e3ac1baef7ed5930993292f63238e443a80f90832ce63978544f9afba5d82d22', 1, 1, 'authToken', '[]', 0, '2025-12-30 10:54:08', '2025-12-30 10:54:08', '2026-12-30 10:54:08'),
('fdb2ae126748368d24f94d2290d837919284a9101773e825696e94739f6b827151f9d63c084c6152', 146, 1, 'authToken', '[]', 0, '2025-12-25 12:52:03', '2025-12-25 12:52:03', '2026-12-25 12:52:03'),
('fecb5d5f0b298288352cd58f278a4b6bf5abb843b698bb4cfdf7ad475f9098bc686b136d7f67ea4c', 21, 1, 'authToken', '[]', 0, '2025-11-11 22:49:32', '2025-11-11 22:49:32', '2026-11-11 22:49:32'),
('ff36c45fe618f324b1469ad7d2a0168bae3436517f2877f5e2c2b25aa1d6384d5385422d87cfab1d', 1, 1, 'authToken', '[]', 0, '2025-11-06 16:57:03', '2025-11-06 16:57:03', '2026-11-06 16:57:03'),
('ff5364fa83d57818de1e2f91972b5f5bf211a32108010d97578698a6da348f1f6f69afc17bcdb5fc', 2, 1, 'authToken', '[]', 0, '2025-12-04 13:46:18', '2025-12-04 13:46:18', '2026-12-04 13:46:18'),
('fff778e953a68b3df6d2b6baeef909ebd56daa34aa9218fe01853b99a297959a5b42a109c6dce157', 72, 1, 'authToken', '[]', 0, '2025-11-10 14:57:14', '2025-11-10 14:57:14', '2026-11-10 14:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `bl_oauth_auth_codes`
--

CREATE TABLE `bl_oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_oauth_clients`
--

CREATE TABLE `bl_oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_oauth_clients`
--

INSERT INTO `bl_oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'eGrocer Personal Access Client', 'DC38iTSVFev2LVyNzscyzip8XCOTrAzS0IfrAWtc', NULL, 'http://localhost', 1, 0, 0, '2025-08-12 12:01:27', '2025-08-12 12:01:27'),
(2, NULL, 'eGrocer Password Grant Client', 'EOQyJB87i39YDTHSYDInC8pZbGVi3Sln76v0AIHl', 'users', 'http://localhost', 0, 1, 0, '2025-08-12 12:01:27', '2025-08-12 12:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `bl_oauth_personal_access_clients`
--

CREATE TABLE `bl_oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_oauth_personal_access_clients`
--

INSERT INTO `bl_oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-08-12 12:01:27', '2025-08-12 12:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `bl_oauth_refresh_tokens`
--

CREATE TABLE `bl_oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_offers`
--

CREATE TABLE `bl_offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) NOT NULL,
  `position` varchar(191) NOT NULL,
  `section_position` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` varchar(191) NOT NULL,
  `offer_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_offers`
--

INSERT INTO `bl_offers` (`id`, `image`, `position`, `section_position`, `type`, `type_id`, `offer_url`, `created_at`, `updated_at`) VALUES
(1, 'offers/1758796361_7265.jpg', 'below_section', '2', 'default', '', '', '2025-08-18 13:54:22', '2025-09-25 16:15:50'),
(2, 'offers/1758793650_85684.jpg', 'below_section', '3', 'default', '', '', '2025-08-18 18:37:39', '2025-09-25 15:17:30'),
(4, 'offers/1758798815_9025.jpg', 'below_section', '6', 'default', '', '', '2025-08-18 19:09:11', '2025-09-25 16:43:35'),
(6, 'offers/1756644573_87853.jpg', 'below_section', '7', 'default', '', '', '2025-08-31 18:19:33', '2025-08-31 18:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `bl_orders`
--

CREATE TABLE `bl_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_boy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_boy_bonus_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Delivery boy bonus Details for bonus commission amount' CHECK (json_valid(`delivery_boy_bonus_details`)),
  `delivery_boy_bonus_amount` double DEFAULT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `orders_id` varchar(191) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `order_note` text DEFAULT NULL,
  `total` double(8,2) NOT NULL,
  `delivery_charge` double(8,2) NOT NULL,
  `tax_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `tax_percentage` double(8,2) NOT NULL DEFAULT 0.00,
  `wallet_balance` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `additional_charges` text DEFAULT NULL,
  `promo_code_id` int(11) NOT NULL DEFAULT 0,
  `promo_code` varchar(191) DEFAULT NULL,
  `promo_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `final_total` double(8,2) DEFAULT NULL,
  `payment_method` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `delivery_time` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `active_status` varchar(191) NOT NULL,
  `order_from` int(11) DEFAULT 0,
  `pincode_id` int(11) DEFAULT 0,
  `address_id` int(11) NOT NULL DEFAULT 0,
  `area_id` int(11) DEFAULT NULL,
  `remaining_total` double(8,2) DEFAULT NULL,
  `remaining_final` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `packing_type` varchar(191) DEFAULT NULL,
  `packing_charge` varchar(191) DEFAULT NULL,
  `feed_the_needy` varchar(191) DEFAULT NULL,
  `credit_point` varchar(191) DEFAULT NULL,
  `debit_point` varchar(191) DEFAULT NULL,
  `cancelled_by` varchar(191) DEFAULT NULL,
  `cod_payment_status` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_orders`
--

INSERT INTO `bl_orders` (`id`, `user_id`, `delivery_boy_id`, `delivery_boy_bonus_details`, `delivery_boy_bonus_amount`, `transaction_id`, `orders_id`, `otp`, `mobile`, `order_note`, `total`, `delivery_charge`, `tax_amount`, `tax_percentage`, `wallet_balance`, `discount`, `additional_charges`, `promo_code_id`, `promo_code`, `promo_discount`, `final_total`, `payment_method`, `address`, `latitude`, `longitude`, `delivery_time`, `status`, `active_status`, `order_from`, `pincode_id`, `address_id`, `area_id`, `remaining_total`, `remaining_final`, `created_at`, `updated_at`, `deleted_at`, `packing_type`, `packing_charge`, `feed_the_needy`, `credit_point`, `debit_point`, `cancelled_by`, `cod_payment_status`) VALUES
(1, 36, 7, '{\"final_total\":98,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-456882794', 354743, '8329098457', '', 98.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 98.00, 'COD', '9, Bhairavnath Colony, Yashwant Nagar, Malwadi, Satara, Maharashtra 415002, India   Satara Maharashtra India- Smita Kajarekar 8329098457/', '17.6915032', '73.9831397', '3-11-2025', '[[2,\"03-11-2025 06:15:49pm\"]]', '7', 0, NULL, 83, 0, 98.00, 98.00, '2025-11-03 18:15:49', '2025-11-03 19:16:06', NULL, '1', '0', '0', '15', '0.0', 'by System', NULL),
(2, 16, 7, '{\"final_total\":60,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1873140197', 111399, '9356484061', '', 60.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 60.00, 'COD', 'SHOP NO B 08 LAXMI PLAZA VISAWA NAKA SATARA 001, Kalyani Nagar, Powai Naka, Satara, Maharashtra 415001, India Powai Naka  Satara Maharashtra India-415001 anju 9356484061/', '17.6864468', '74.01839869999999', '3-11-2025', '[[2,\"03-11-2025 06:17:43pm\"]]', '7', 0, NULL, 82, 0, 0.00, 0.00, '2025-11-03 18:17:43', '2025-11-15 14:22:07', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(3, 37, 7, '{\"final_total\":150,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '243542465', 795293, '7420802133', '', 150.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 155.00, 'COD', 'M2Q4+F7F, Sadar Bazar, Satara, Maharashtra 415001, India   Satara Maharashtra India- Ganesh Patil 7420802133/', '17.688671', '74.005667', '3-11-2025', '[[2,\"03-11-2025 07:12:57pm\"]]', '7', 0, NULL, 85, 0, 150.00, 155.00, '2025-11-03 19:12:57', '2025-11-03 20:13:06', NULL, '3', '15', '0', '25', '10.0', 'by System', NULL),
(4, 11, 0, NULL, NULL, 0, '1462188790', 603648, '9373713238', '', 143.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 143.00, 'COD', 'SHOP NO B 08 LAXMI PLAZA VISAWA NAKA SATARA 001, Kalyani Nagar, Powai Naka, Satara, Maharashtra 415001, India Powai Naka satara Satara Maharashtra India-415001 sachin 9373713238/', '17.6864468', '74.01839869999999', '4-11-2025 10:00 AM - 11:00 AM', '[[2,\"04-11-2025 08:55:26am\"]]', '7', 0, NULL, 2, 0, 143.00, 143.00, '2025-11-04 08:55:26', '2025-11-04 09:56:06', NULL, '1', '0', '0', '15', '0.0', 'by System', NULL),
(5, 13, 7, '{\"final_total\":95,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '646216014', 938515, '9552616114', '', 95.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 115.00, 'COD', '7, Sadar Bazar, Satara, Chahur, Maharashtra 415001, India Sadar Bazar  Satara Maharashtra India-415001 Nilam sabale 9552616114/', '17.6976427', '74.0183014', '4-11-2025 10:00 AM - 11:00 AM', '[[2,\"04-11-2025 09:08:32am\"]]', '7', 0, NULL, 89, 0, 95.00, 115.00, '2025-11-04 09:08:32', '2025-11-04 10:09:06', NULL, '3', '15', '5', '10', '0.0', 'by System', NULL),
(6, 36, 7, '{\"final_total\":98,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '155686206', 284659, '8329098457', '', 98.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 98.00, 'COD', '9, Bhairavnath Colony, Yashwant Nagar, Malwadi, Satara, Maharashtra 415002, India   Satara Maharashtra India- Smita Kajarekar 8329098457/', '17.6915032', '73.9831397', '4-11-2025 11:00 AM - 12:00 PM', '[[2,\"04-11-2025 10:23:22am\"]]', '7', 0, NULL, 83, 0, 98.00, 98.00, '2025-11-04 10:23:22', '2025-11-04 11:24:06', NULL, '1', '0', '0', '15', '0.0', 'by System', NULL),
(7, 36, 7, '{\"final_total\":98,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 1, '-300203155', 801161, '8329098457', '', 98.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 98.00, 'COD', '9, Bhairavnath Colony, Yashwant Nagar, Malwadi, Satara, Maharashtra 415002, India   Satara Maharashtra India- Smita Kajarekar 8329098457/', '17.6915032', '73.9831397', '4-11-2025 11:00 AM - 12:00 PM', '[[2,\"04-11-2025 10:23:48am\"]]', '6', 0, NULL, 83, 0, 98.00, 98.00, '2025-11-04 10:23:48', '2025-11-04 11:59:53', NULL, '1', '0', '0', '15', '0.0', NULL, NULL),
(8, 40, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1481421920', 207285, '7558777778', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'M2RP+V2G, Vikasnagar, Sangamnagar, Satara, Maharashtra 415003, India   Satara Maharashtra India- Devika bhandari 7558777778/', '17.6924433', '74.0350653', '4-11-2025 11:00 AM - 12:00 PM', '[[2,\"04-11-2025 10:35:49am\"]]', '5', 0, NULL, 90, 0, 38.00, 38.00, '2025-11-04 10:35:49', '2025-11-04 10:37:53', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(9, 40, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 2, '1678819577', 691684, '7558777778', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'M2RP+V2G, Vikasnagar, Sangamnagar, Satara, Maharashtra 415003, India   Satara Maharashtra India- Devika bhandari 7558777778/', '17.6924433', '74.0350653', '4-11-2025 11:00 AM - 12:00 PM', '[[2,\"04-11-2025 10:49:41am\"]]', '6', 0, NULL, 90, 0, 38.00, 38.00, '2025-11-04 10:49:41', '2025-11-04 14:57:25', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(10, 41, 7, '{\"final_total\":150,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '479577210', 839276, '9130915157', '', 150.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 140.00, 'COD', '46, Tarf, kesarkar peth, Guruwar Peth, Satara, Maharashtra 415002, India   Satara Maharashtra India- Ujwala Katkar 9130915157/', '17.6821062', '73.9973808', '4-11-2025 12:00 PM - 1:00 PM', '[[2,\"04-11-2025 11:17:29am\"]]', '6', 0, NULL, 91, 0, 150.00, 140.00, '2025-11-04 11:17:29', '2025-11-04 12:07:47', NULL, '1', '0', '0', '25', '10.0', NULL, 'UPI Paid'),
(11, 37, 7, '{\"final_total\":90,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1013385289', 720053, '7420802133', '', 90.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 65.00, 'COD', 'P/4/7, MIDC, Satara, Maharashtra 415004, India MIDC  Satara Maharashtra India-415004 Ganesh Patil 7420802133/', '17.661695487796447', '74.04906325042248', '4-11-2025 12:00 PM - 1:00 PM', '[[2,\"04-11-2025 11:33:43am\"]]', '7', 0, NULL, 93, 0, 0.00, 0.00, '2025-11-04 11:33:43', '2025-11-04 12:01:27', NULL, '1', '0', '0', '15', '25.0', NULL, NULL),
(12, 10, 7, '{\"final_total\":113,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1825484201', 625957, '9665027030', '', 113.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 113.00, 'COD', '29, Pirwadi, Satara, Pirwadi, Maharashtra 415003, India Pirwadi  Satara Maharashtra India-415003 arif khan 9665027030/', '17.6933055', '74.0281539', '4-11-2025 5:00 PM - 6:00 PM', '[[2,\"04-11-2025 04:04:24pm\"]]', '6', 0, NULL, 95, 0, 113.00, 113.00, '2025-11-04 16:04:24', '2025-11-18 10:52:50', NULL, '1', '0', '0', '10', '0.0', NULL, 'UPI Paid'),
(13, 10, 7, '{\"final_total\":16,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '624078805', 886785, '9665027030', '', 16.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 16.00, 'COD', '29, Pirwadi, Satara, Pirwadi, Maharashtra 415003, India Pirwadi  Satara Maharashtra India-415003 arif khan 9665027030/', '17.6933055', '74.0281539', '4-11-2025', '[[2,\"04-11-2025 05:32:16pm\"]]', '6', 0, NULL, 95, 0, 16.00, 16.00, '2025-11-04 17:32:16', '2025-11-04 17:36:29', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(14, 10, 7, '{\"final_total\":20,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '777248815', 187255, '9665027030', '', 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 10.00, 'Razorpay', '29, Pirwadi, Satara, Pirwadi, Maharashtra 415003, India Pirwadi  Satara Maharashtra India-415003 arif khan 9665027030/', '17.6933055', '74.0281539', '4-11-2025', '[[1,\"04-11-2025 05:40:09pm\"]]', '1', 0, NULL, 95, 0, 20.00, 10.00, '2025-11-04 17:40:09', '2025-11-04 17:40:21', '2025-11-04 17:40:21', '1', '0', '0', '5', '10.0', NULL, NULL),
(15, 10, 7, '{\"final_total\":20,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 1, '1643536805', 270989, '9665027030', '', 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 20.00, 'Razorpay', '29, Pirwadi, Satara, Pirwadi, Maharashtra 415003, India Pirwadi  Satara Maharashtra India-415003 arif khan 9665027030/', '17.6933055', '74.0281539', '4-11-2025', '[[1,\"04-11-2025 05:40:23pm\"]]', '6', 0, NULL, 95, 0, 20.00, 20.00, '2025-11-04 17:40:23', '2025-11-04 17:43:33', NULL, '1', '0', '0', '5', '10.0', NULL, NULL),
(16, 13, 7, '{\"final_total\":95,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1501051363', 290761, '9552616114', '', 95.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 95.00, 'COD', 'sahyadri ayurvedic life pvt ltd.       310,1/C,At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India near cyclo transmission  satara Maharashtra India-415011 Nilam sabale 9552616114/', '17.7251303', '74.0398771', '6-11-2025 11:00 AM - 12:00 PM', '[[2,\"06-11-2025 10:30:35am\"]]', '6', 0, NULL, 97, 0, 95.00, 95.00, '2025-11-06 10:30:35', '2025-11-06 11:15:53', NULL, '3', '15', '0', '10', '0.0', NULL, 'UPI Paid'),
(17, 10, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '30836060', 215350, '9665027030', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'sahyadri ayurvedic life pvt ltd, Patkhal, near cyclo company cyclo company cyclo company satara Maharashtra India-415011 test test 9665027030/', '17.7367704', '74.0359041', '6-11-2025 11:00 AM - 12:00 PM', '[[2,\"06-11-2025 10:59:28am\"]]', '6', 0, NULL, 98, 0, 38.00, 38.00, '2025-11-06 10:59:28', '2025-11-06 11:44:46', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(18, 44, 7, '{\"final_total\":70,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1597682301', 836920, '9665604316', '', 70.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 70.00, 'COD', 'sahyadri aayurvedik pvt cyclo company cyclo company satara Maharashtra India-415011 Puja Ghorpade 9665604316/', '17.7367704', '74.0359041', '6-11-2025 12:00 PM - 1:00 PM', '[[2,\"06-11-2025 11:01:44am\"]]', '6', 0, NULL, 99, 0, 70.00, 70.00, '2025-11-06 11:01:44', '2025-11-06 11:16:27', NULL, '1', '0', '0', '10', '0.0', NULL, 'UPI Paid'),
(19, 24, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-301126021', 567382, '9503743458', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'flat no 306 B wing 64 Avenue New vikas nagar satara mane hights vikas nagar Satara Maharashtra India-415003 Amol shinde 9503743458/8080764034', '17.6942183', '74.038956', '6-11-2025 3:00 PM - 4:00 PM', '[[2,\"06-11-2025 02:37:00pm\"]]', '6', 0, NULL, 100, 0, 38.00, 38.00, '2025-11-06 14:37:00', '2025-11-06 14:42:16', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(20, 46, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-374152164', 392769, '9561274026', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'M2QG+773, Krishnanagar, Aditya Nagari, Satara, Maharashtra 415003, India Aditya Nagari  Satara Maharashtra India-415003 Ajay Nakwal 9561274026/', '17.6881393', '74.02567719999999', '6-11-2025 4:00 PM - 5:00 PM', '[[2,\"06-11-2025 03:39:47pm\"]]', '6', 0, NULL, 101, 0, 38.00, 38.00, '2025-11-06 15:39:47', '2025-11-06 15:45:44', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(21, 11, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 3, '1151575203', 480765, '9373713238', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 sachin sawant 9373713238/', '17.725176', '74.0396871', '6-11-2025 5:00 PM - 6:00 PM', '[[2,\"06-11-2025 04:53:34pm\"]]', '6', 0, NULL, 87, 0, 38.00, 38.00, '2025-11-06 16:53:34', '2025-11-06 18:37:23', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(22, 45, 7, '{\"final_total\":20,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-252343218', 460254, '8087864013', '', 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 20.00, 'COD', 'M2X9+43J, Sadar Bazar, Chahur, Satara, Maharashtra 415001, India Sadar Bazar sadar bazar Chahur Maharashtra India-415001 ulkesh amane 8087864013/9529290250', '17.697841471631953', '74.01762407273054', '07-11-2025 10:00 AM - 11:00 AM', '[[2,\"06-11-2025 05:21:40pm\"]]', '6', 0, NULL, 102, 0, 20.00, 20.00, '2025-11-06 17:21:40', '2025-11-07 11:23:26', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(23, 10, 7, '{\"final_total\":126,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 2, '625879250', 991566, '9665027030', '', 126.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 126.00, 'Razorpay', 'sahyadri ayurvedic life pvt ltd, Patkhal, near cyclo company cyclo company cyclo company satara Maharashtra India-415011 test test 9665027030/', '17.7367704', '74.0359041', '6-11-2025', '[[1,\"06-11-2025 06:03:39pm\"]]', '6', 0, NULL, 98, 0, 126.00, 126.00, '2025-11-06 18:03:39', '2025-11-06 18:05:19', NULL, '1', '0', '0', '15', '0.0', NULL, NULL),
(24, 10, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 3, '-1903879293', 772252, '9665027030', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'Razorpay', 'sahyadri ayurvedic life pvt ltd, Patkhal, near cyclo company cyclo company cyclo company satara Maharashtra India-415011 test test 9665027030/', '17.7367704', '74.0359041', '6-11-2025', '[[1,\"06-11-2025 06:08:09pm\"]]', '6', 0, NULL, 98, 0, 38.00, 38.00, '2025-11-06 18:08:09', '2025-11-06 18:09:40', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(25, 47, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-552909046', 355782, '9028486515', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'P22H+W24, NH 4, Sangamnagar, Satara, Khed, Maharashtra 415003, India   Satara Maharashtra India- Aditya pisal 9028486515/', '17.7022238', '74.0274865', '6-11-2025', '[[2,\"06-11-2025 06:20:14pm\"]]', '6', 0, NULL, 103, 0, 38.00, 38.00, '2025-11-06 18:20:14', '2025-11-07 11:22:31', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(26, 10, 0, NULL, NULL, 0, '594983123', 270775, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 65.00, 'Razorpay', 'M2XG+RC Satara, Maharashtra, India   Satara Maharashtra India- mhindra 9665027030/', '17.6995199', '74.0260646', '6-11-2025', '[[1,\"06-11-2025 06:29:02pm\"]]', '1', 0, NULL, 64, 0, 75.00, 65.00, '2025-11-06 18:29:02', '2025-11-06 18:29:26', '2025-11-06 18:29:26', '1', '0', '0', '5', '10.0', NULL, NULL),
(27, 10, 0, NULL, NULL, 0, '288784409', 645673, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 65.00, 'Razorpay', 'M2XG+RC Satara, Maharashtra, India   Satara Maharashtra India- mhindra 9665027030/', '17.6995199', '74.0260646', '6-11-2025', '[[1,\"06-11-2025 06:39:09pm\"]]', '1', 0, NULL, 64, 0, 75.00, 65.00, '2025-11-06 18:39:09', '2025-11-06 18:39:35', '2025-11-06 18:39:35', '1', '0', '0', '5', '10.0', NULL, NULL),
(28, 10, 0, NULL, NULL, 0, '-1836991736', 337911, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 75.00, 'Razorpay', 'M2XG+RC Satara, Maharashtra, India   Satara Maharashtra India- mhindra 9665027030/', '17.6995199', '74.0260646', '6-11-2025', '[[1,\"06-11-2025 06:39:46pm\"]]', '1', 0, NULL, 64, 0, 75.00, 75.00, '2025-11-06 18:39:47', '2025-11-06 18:39:57', '2025-11-06 18:39:57', '1', '0', '0', '5', '10.0', NULL, NULL),
(29, 10, 0, NULL, NULL, 0, '-2057845104', 207389, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 65.00, 'Razorpay', 'M2XG+RC Satara, Maharashtra, India   Satara Maharashtra India- mhindra 9665027030/', '17.6995199', '74.0260646', '6-11-2025', '[[1,\"06-11-2025 06:43:28pm\"]]', '1', 0, NULL, 64, 0, 75.00, 65.00, '2025-11-06 18:43:28', '2025-11-06 18:43:39', '2025-11-06 18:43:39', '1', '0', '0', '5', '10.0', NULL, NULL),
(30, 10, 0, NULL, NULL, 0, '-106411239', 715796, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 65.00, 'Razorpay', 'M2XG+RC Satara, Maharashtra, India   Satara Maharashtra India- mhindra 9665027030/', '17.6995199', '74.0260646', '6-11-2025', '[[1,\"06-11-2025 06:45:15pm\"]]', '1', 0, NULL, 64, 0, 75.00, 65.00, '2025-11-06 18:45:15', '2025-11-06 18:45:30', '2025-11-06 18:45:30', '1', '0', '0', '5', '10.0', NULL, NULL),
(31, 10, 0, NULL, NULL, 0, '-789144103', 234548, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 65.00, 'Razorpay', 'M2XG+RC Satara, Maharashtra, India   Satara Maharashtra India- mhindra 9665027030/', '17.6995199', '74.0260646', '6-11-2025', '[[1,\"06-11-2025 06:46:00pm\"]]', '1', 0, NULL, 64, 0, 75.00, 65.00, '2025-11-06 18:46:00', '2025-11-06 18:46:13', '2025-11-06 18:46:13', '1', '0', '0', '5', '10.0', NULL, NULL),
(32, 10, 0, NULL, NULL, 0, '-49806620', 650408, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 65.00, 'Razorpay', 'M2XG+RC Satara, Maharashtra, India   Satara Maharashtra India- mhindra 9665027030/', '17.6995199', '74.0260646', '6-11-2025', '[[1,\"06-11-2025 06:46:29pm\"]]', '1', 0, NULL, 64, 0, 75.00, 65.00, '2025-11-06 18:46:29', '2025-11-06 18:46:41', '2025-11-06 18:46:41', '1', '0', '0', '5', '10.0', NULL, NULL),
(33, 49, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-2081641768', 768462, '9604897580', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'P22J+V8X, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar sangamnagar khed Khed Maharashtra India-415003 Rohit Pisal 9604897580/8208260064', '17.70223009066958', '74.031056240201', '6-11-2025', '[[2,\"06-11-2025 07:01:19pm\"]]', '6', 0, NULL, 104, 0, 38.00, 38.00, '2025-11-06 19:01:19', '2025-11-07 11:00:10', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(34, 24, 7, '{\"final_total\":30,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1938971733', 296265, '9503743458', '', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 30.00, 'COD', 'flat no 306 B wing 64 Avenue New vikas nagar satara mane hights vikas nagar Satara Maharashtra India-415003 Amol shinde 9503743458/8080764034', '17.6942183', '74.038956', '7-11-2025 10:00 AM - 11:00 AM', '[[2,\"07-11-2025 09:42:05am\"]]', '6', 0, NULL, 100, 0, 30.00, 30.00, '2025-11-07 09:42:05', '2025-11-07 10:43:58', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(35, 10, 1, '{\"final_total\":64,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 15, '921710262', 217683, '9665027030', '', 64.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 64.00, 'COD', 'sahyadri ayurvedic life pvt ltd, Patkhal, near cyclo company cyclo company cyclo company satara Maharashtra India-415011 test test 9665027030/', '17.7367704', '74.0359041', '7-11-2025 12:00 PM - 1:00 PM', '[[2,\"07-11-2025 11:18:19am\"]]', '6', 0, NULL, 98, 0, 64.00, 64.00, '2025-11-07 11:18:19', '2025-11-20 15:48:21', NULL, '1', '0', '0', '20', '0.0', NULL, NULL),
(36, 10, 7, '{\"final_total\":225,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-256395824', 810405, '9665027030', '', 225.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 225.00, 'Razorpay', 'sahyadri ayurvedic life pvt ltd, Patkhal, near cyclo company cyclo company cyclo company satara Maharashtra India-415011 test test 9665027030/', '17.7367704', '74.0359041', '7-11-2025 12:00 PM - 1:00 PM', '[[1,\"07-11-2025 11:19:14am\"]]', '1', 0, NULL, 98, 0, 225.00, 225.00, '2025-11-07 11:19:14', '2025-11-07 11:19:24', '2025-11-07 11:19:24', '1', '0', '0', '15', '0.0', NULL, NULL),
(37, 10, 7, '{\"final_total\":16,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-124757249', 138114, '9665027030', '', 16.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 16.00, 'COD', 'M2Q4+F7F, Sadar Bazar, Satara, Maharashtra 415001, India   Satara Maharashtra India- test test 9665027030/', '17.688671', '74.005667', '7-11-2025 1:00 PM - 2:00 PM', '[[2,\"07-11-2025 12:01:33pm\"]]', '5', 0, NULL, 106, 0, 16.00, 16.00, '2025-11-07 12:01:33', '2025-11-07 12:02:18', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(38, 16, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 4, '1397355017', 315582, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 75.00, 'COD', 'M2M7+XJ2, Powai Naka, Satara, Maharashtra 415001, India Powai Naka  Satara Maharashtra India-415001 anju 9356484061/', '17.685468438104806', '74.01389244943857', '7-11-2025 1:00 PM - 2:00 PM', '[[2,\"07-11-2025 12:30:48pm\"]]', '6', 0, NULL, 84, 0, 75.00, 75.00, '2025-11-07 12:30:48', '2025-11-07 12:37:03', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(39, 10, 0, NULL, NULL, 0, '-1155228696', 926023, '9665027030', '', 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 20.00, 'COD', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '7-11-2025 1:00 PM - 2:00 PM', '[[2,\"07-11-2025 12:38:19pm\"]]', '3', 0, NULL, 56, 0, 20.00, 20.00, '2025-11-07 12:38:19', '2025-11-07 12:39:21', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(40, 10, 1, '{\"final_total\":40,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1811566474', 530021, '9665027030', '', 40.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 40.00, 'COD', 'M2Q4+F7F, Sadar Bazar, Satara, Maharashtra 415001, India   Satara Maharashtra India- test test 9665027030/', '17.688671', '74.005667', '7-11-2025 1:00 PM - 2:00 PM', '[[2,\"07-11-2025 12:42:43pm\"]]', '5', 0, NULL, 106, 0, 40.00, 40.00, '2025-11-07 12:42:43', '2025-11-18 11:11:12', NULL, '1', '0', '0', '10', '0.0', NULL, NULL),
(41, 10, 1, '{\"final_total\":20,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 11, '-1287410507', 167509, '9665027030', '', 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 20.00, 'COD', 'M2Q4+F7F, Sadar Bazar, Satara, Maharashtra 415001, India   Satara Maharashtra India- test test 9665027030/', '17.688671', '74.005667', '7-11-2025 1:00 PM - 2:00 PM', '[[2,\"07-11-2025 12:45:35pm\"]]', '6', 0, NULL, 106, 0, 20.00, 20.00, '2025-11-07 12:45:35', '2025-11-18 11:10:40', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(42, 10, 7, '{\"final_total\":20,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 5, '-933496735', 988152, '9665027030', '', 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 20.00, 'COD', 'Bombay Restaurant Chowk, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 11 9665027030/', '17.6867617', '74.0231848', '7-11-2025 1:00 PM - 2:00 PM', '[[2,\"07-11-2025 12:49:22pm\"]]', '6', 0, NULL, 108, 0, 20.00, 20.00, '2025-11-07 12:49:22', '2025-11-07 12:56:09', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(43, 45, 7, '{\"final_total\":76,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 4, '87388307', 957896, '8087864013', '', 76.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 76.00, 'Razorpay', 'Torna Plot no 16, Kanga Colony, Cooper Colony, Sadar Bazar, Satara, Maharashtra 415001, India opp mona school  Satara Maharashtra India-415001 parth khable 8087864013/919987400808', '17.700393527342804', '74.01638187468052', '07-11-2025 3:00 PM - 4:00 PM', '[[1,\"07-11-2025 02:50:01pm\"]]', '6', 0, NULL, 109, 0, 76.00, 76.00, '2025-11-07 14:50:01', '2025-11-07 15:10:28', NULL, '1', '0', '0', '10', '0.0', NULL, NULL),
(44, 52, 7, '{\"final_total\":150,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1932153609', 177906, '8830296326', '', 150.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 150.00, 'COD', 'Bombay Restaurant Chowk, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- s k 8830296326/', '17.6867555', '74.0231805', '7-11-2025 5:00 PM - 6:00 PM', '[[2,\"07-11-2025 04:48:38pm\"]]', '6', 0, NULL, 110, 0, 150.00, 150.00, '2025-11-07 16:48:38', '2025-11-07 16:49:02', NULL, '1', '0', '0', '25', '0.0', NULL, 'UPI Paid'),
(45, 40, 7, '{\"final_total\":211,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '815628877', 818835, '7558777778', '', 211.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 211.00, 'COD', 'M2RP+V2G, Vikasnagar, Sangamnagar, Satara, Maharashtra 415003, India   Satara Maharashtra India- Devika bhandari 7558777778/', '17.6924433', '74.0350653', '7-11-2025', '[[2,\"07-11-2025 08:28:01pm\"]]', '6', 0, NULL, 90, 0, 211.00, 211.00, '2025-11-07 20:28:01', '2025-11-17 12:31:08', NULL, '1', '0', '0', '25', '0.0', NULL, 'UPI Paid'),
(46, 45, 7, '{\"final_total\":190,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1961569999', 319428, '8087864013', '', 190.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 190.00, 'Razorpay', 'M2X9+43J, Sadar Bazar, Chahur, Satara, Maharashtra 415001, India Sadar Bazar sadar bazar Chahur Maharashtra India-415001 ulkesh amane 8087864013/9529290250', '17.697841471631953', '74.01762407273054', '8-11-2025 3:00 PM - 4:00 PM', '[[1,\"08-11-2025 02:46:23pm\"]]', '1', 0, NULL, 102, 0, 190.00, 190.00, '2025-11-08 14:46:23', '2025-11-08 14:46:23', NULL, '1', '0', '0', '25', '0.0', NULL, NULL),
(47, 16, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 5, '-760347688', 250403, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 75.00, 'Razorpay', 'Koyna Sosayti, near Mahendra Hotel, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar  Khed Maharashtra India-415003 anju 9356484061/', '17.699738428643037', '74.02542963624', '8-11-2025 4:00 PM - 5:00 PM', '[[1,\"08-11-2025 03:31:21pm\"]]', '7', 0, NULL, 107, 0, 0.00, 0.00, '2025-11-08 15:31:21', '2025-11-15 14:21:39', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(48, 10, 1, '{\"final_total\":16,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 6, '-610464677', 650235, '9665027030', '', 16.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 16.00, 'Razorpay', 'Bombay Restaurant Chowk, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 11 9665027030/', '17.6867617', '74.0231848', '8-11-2025 4:00 PM - 5:00 PM', '[[1,\"08-11-2025 03:35:32pm\"]]', '6', 0, NULL, 108, 0, 16.00, 16.00, '2025-11-08 15:35:32', '2025-11-20 15:49:47', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(49, 44, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '620529434', 728910, '9665604316', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'sahyadri aayurvedik pvt cyclo company cyclo company satara Maharashtra India-415011 Puja Ghorpade 9665604316/', '17.7367704', '74.0359041', '8-11-2025 5:00 PM - 6:00 PM', '[[2,\"08-11-2025 04:54:59pm\"]]', '7', 0, NULL, 99, 0, 0.00, 0.00, '2025-11-08 16:54:59', '2025-11-08 16:56:02', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(50, 44, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1291364212', 560130, '9665604316', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', 'sahyadri aayurvedik pvt cyclo company cyclo company satara Maharashtra India-415011 Puja Ghorpade 9665604316/', '17.7367704', '74.0359041', '8-11-2025 5:00 PM - 6:00 PM', '[[2,\"08-11-2025 04:57:03pm\"]]', '7', 0, NULL, 99, 0, 0.00, 0.00, '2025-11-08 16:57:03', '2025-11-08 16:57:41', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(51, 44, 7, '{\"final_total\":38,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1785386611', 596766, '9665604316', '', 38.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 38.00, 'COD', '46-B, Godoli, Pune Kolhapur Highway Ajantha Chowk, Talathi Nagar, Godoli, Satara, Maharashtra 415004, India Talathi Nagar  Satara Maharashtra India-415004 Puja Ghorpade 9665604316/', '17.6775924', '74.0204442', '8-11-2025 5:00 PM - 6:00 PM', '[[2,\"08-11-2025 04:58:55pm\"]]', '6', 0, NULL, 115, 0, 38.00, 38.00, '2025-11-08 16:58:55', '2025-11-08 17:47:04', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(52, 16, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '627898644', 550910, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 112.00, 'COD', 'Koyna Sosayti, near Mahendra Hotel, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar  Khed Maharashtra India-415003 anju 9356484061/', '17.699738428643037', '74.02542963624', '9-11-2025 3:00 PM - 4:00 PM', '[[2,\"09-11-2025 03:02:24pm\"]]', '7', 0, NULL, 107, 0, 0.00, 0.00, '2025-11-09 15:02:24', '2025-11-09 15:03:41', NULL, '2', '45', '2', '5', '10.0', NULL, NULL),
(53, 38, 7, '{\"final_total\":30,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 6, '-169387883', 591284, '9422607658', '', 30.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 30.00, 'COD', 'M2P8+425, Powai Naka, Satara, Maharashtra 415001, India  D.G.College Satara Maharashtra India-415001 Purushottam Patil 9422607658/9421686045', '17.6854839', '74.0146974', '10-11-2025', '[[2,\"10-11-2025 06:18:33pm\"]]', '6', 0, NULL, 121, 0, 30.00, 30.00, '2025-11-10 18:18:33', '2025-11-11 10:39:47', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(54, 80, 7, '{\"final_total\":125,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '654441036', 511241, '9146187201', '', 125.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 125.00, 'COD', '112 /1 sahyog society pirwadi satara , Satara, Pirwadi, Maharashtra 415003, India pirwadi pirwadi Satara Maharashtra India-415003 Gurudatta kale 9146187201/', '17.6867392', '74.0231956', '11-11-2025 1:00 PM - 2:00 PM', '[[2,\"11-11-2025 12:49:36pm\"]]', '6', 0, NULL, 122, 0, 125.00, 125.00, '2025-11-11 12:49:36', '2025-11-11 15:45:32', NULL, '1', '0', '0', '10', '0.0', NULL, 'UPI Paid'),
(55, 16, 7, '{\"final_total\":16,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1735430323', 697376, '9356484061', '', 16.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 16.00, 'Razorpay', 'Koyna Sosayti, near Mahendra Hotel, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar  Khed Maharashtra India-415003 anju 9356484061/', '17.699738428643037', '74.02542963624', '12-11-2025 10:00 AM - 11:00 AM', '[[1,\"12-11-2025 08:02:32am\"]]', '1', 0, NULL, 107, 0, 16.00, 16.00, '2025-11-12 08:02:32', '2025-11-12 08:03:16', '2025-11-12 08:03:16', '1', '0', '0', '5', '0.0', NULL, NULL),
(56, 11, 7, '{\"final_total\":314,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 7, '-1875414553', 213496, '9373713238', '', 314.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 294.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 sachin sawant 9373713238/', '17.725176', '74.0396871', '13-11-2025 10:00 AM - 11:00 AM', '[[2,\"13-11-2025 04:56:01am\"]]', '6', 0, NULL, 87, 0, 314.00, 294.00, '2025-11-13 04:56:01', '2025-11-13 18:57:43', NULL, '3', '15', '5', '20', '40.0', NULL, NULL),
(57, 10, 0, NULL, NULL, 0, '462987665', 837758, '9665027030', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 84.15, 'Razorpay', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '13-11-2025 3:00 PM - 4:00 PM', '[[1,\"13-11-2025 03:23:33pm\"]]', '1', 0, NULL, 56, 0, 85.00, 84.15, '2025-11-13 15:23:33', '2025-11-13 15:23:51', '2025-11-13 15:23:51', '1', '0', '0', '5', '0.0', NULL, NULL),
(58, 10, 0, NULL, NULL, 0, '-1776215368', 753537, '9665027030', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'Razorpay', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '13-11-2025 5:00 PM - 6:00 PM', '[[1,\"13-11-2025 04:23:27pm\"]]', '1', 0, NULL, 56, 0, 85.00, 85.00, '2025-11-13 16:23:27', '2025-11-13 16:23:39', '2025-11-13 16:23:39', '1', '0', '0', '5', '0.0', NULL, NULL),
(59, 10, 0, NULL, NULL, 0, '97996191', 496931, '9665027030', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 84.15, 'Razorpay', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '13-11-2025 5:00 PM - 6:00 PM', '[[1,\"13-11-2025 04:46:33pm\"]]', '1', 0, NULL, 56, 0, 85.00, 84.15, '2025-11-13 16:46:33', '2025-11-13 16:46:47', '2025-11-13 16:46:47', '1', '0', '0', '5', '0.0', NULL, NULL),
(60, 10, 0, NULL, NULL, 0, '-900113845', 518201, '9665027030', '', 170.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 168.30, 'Razorpay', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '13-11-2025', '[[1,\"13-11-2025 05:05:26pm\"]]', '1', 0, NULL, 56, 0, 170.00, 168.30, '2025-11-13 17:05:26', '2025-11-13 17:05:36', '2025-11-13 17:05:36', '1', '0', '0', '10', '0.0', NULL, NULL),
(61, 83, 7, '{\"final_total\":44,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-101191408', 882298, '9823594627', '', 44.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 39.00, 'COD', '46-B, Godoli, Pune Kolhapur Highway Ajantha Chowk, Talathi Nagar, Godoli, Satara, Maharashtra 415004, India Talathi Nagar  Satara Maharashtra India-415004 puja kale 9823594627/9665604316', '17.6775924', '74.0204442', '14-11-2025 4:00 PM - 5:00 PM', '[[2,\"14-11-2025 03:24:27pm\"]]', '5', 0, NULL, 123, 0, 44.00, 39.00, '2025-11-14 15:24:27', '2025-11-14 17:19:31', NULL, '1', '0', '0', '5', '10.0', NULL, NULL),
(62, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1276885286', 912872, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 80.00, 'COD', 'Koyna Sosayti, near Mahendra Hotel, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar  Khed Maharashtra India-415003 anju 9356484061/', '17.699738428643037', '74.02542963624', '15-11-2025 4:00 PM - 5:00 PM', '[[2,\"15-11-2025 03:49:20pm\"]]', '7', 0, NULL, 107, 0, 0.00, 5.00, '2025-11-15 15:49:20', '2025-11-15 16:34:59', NULL, '1', '0', '0', '5', '10.0', NULL, NULL),
(63, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 8, '1445781794', 583403, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 90.00, 'COD', 'Koyna Sosayti, near Mahendra Hotel, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar  Khed Maharashtra India-415003 anju 9356484061/', '17.699738428643037', '74.02542963624', '16-11-2025 10:00 AM - 11:00 AM', '[[2,\"15-11-2025 05:06:23pm\"]]', '6', 0, NULL, 107, 0, 85.00, 90.00, '2025-11-15 17:06:23', '2025-11-15 17:25:20', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(64, 16, 7, '{\"final_total\":170,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 9, '2113226703', 889293, '9356484061', '', 170.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 175.00, 'COD', 'Koyna Sosayti, near Mahendra Hotel, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar  Khed Maharashtra India-415003 anju 9356484061/', '17.699738428643037', '74.02542963624', '16-11-2025 11:00 AM - 12:00 PM', '[[2,\"15-11-2025 05:27:22pm\"]]', '6', 0, NULL, 107, 0, 170.00, 175.00, '2025-11-15 17:27:22', '2025-11-15 17:46:03', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(65, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 10, '-666940531', 395587, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 90.00, 'COD', 'Koyna Sosayti, near Mahendra Hotel, Sangamnagar, Khed, Satara, Maharashtra 415003, India Sangamnagar  Khed Maharashtra India-415003 anju 9356484061/', '17.699738428643037', '74.02542963624', '16-11-2025 11:00 AM - 12:00 PM', '[[2,\"15-11-2025 05:48:35pm\"]]', '6', 0, NULL, 107, 0, 85.00, 90.00, '2025-11-15 17:48:35', '2025-11-15 17:57:28', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(66, 16, 0, NULL, NULL, 0, '-520045316', 604935, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 90.00, 'COD', 'Powai Plaza, 358, Central Ave, Hiranandani Gardens, Sainath Nagar, Powai, Mumbai, Maharashtra 400076, India   Mumbai Maharashtra India- anju 9356484061/', '19.1235451', '72.91303839999999', '16-11-2025 11:00 AM - 12:00 PM', '[[2,\"16-11-2025 10:40:17am\"]]', '2', 0, NULL, 129, 0, 85.00, 90.00, '2025-11-16 10:40:17', '2025-11-16 10:40:17', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(67, 16, 8, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-378339195', 644754, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 90.00, 'COD', 'Powai Plaza, 358, Central Ave, Hiranandani Gardens, Sainath Nagar, Powai, Mumbai, Maharashtra 400076, India   Mumbai Maharashtra India- anju 9356484061/', '19.1235451', '72.91303839999999', '16-11-2025 11:00 AM - 12:00 PM', '[[2,\"16-11-2025 10:43:36am\"]]', '2', 0, NULL, 129, 0, 85.00, 90.00, '2025-11-16 10:43:36', '2025-11-16 10:43:36', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(68, 16, 0, NULL, NULL, 0, '1998536342', 638630, '9356484061', '', 170.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 175.00, 'COD', 'Mumbai Central Station, Marzban Parsi Colony, Dalal Estate, Mumbai Central, Mumbai, Maharashtra 400008, India Mumbai Central  Mumbai Maharashtra India- anju 9356484061/', '18.9690247', '72.8205292', '16-11-2025 11:00 AM - 12:00 PM', '[[2,\"16-11-2025 10:44:46am\"]]', '2', 0, NULL, 126, 0, 170.00, 175.00, '2025-11-16 10:44:46', '2025-11-16 10:44:46', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(69, 16, 9, '{\"final_total\":88,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1939700194', 443853, '9356484061', '', 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 93.00, 'COD', 'Powai Plaza, 358, Central Ave, Hiranandani Gardens, Sainath Nagar, Powai, Mumbai, Maharashtra 400076, India   Mumbai Maharashtra India- anju 9356484061/', '19.1235451', '72.91303839999999', '16-11-2025 11:00 AM - 12:00 PM', '[[2,\"16-11-2025 10:55:43am\"]]', '7', 0, NULL, 129, 0, 0.00, 5.00, '2025-11-16 10:55:43', '2025-11-24 12:50:58', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(70, 16, 8, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1088226770', 690585, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 80.00, 'COD', 'Mumbai Central Station, Marzban Parsi Colony, Dalal Estate, Mumbai Central, Mumbai, Maharashtra 400008, India Mumbai Central  Mumbai Maharashtra India- anju 9356484061/', '18.9690247', '72.8205292', '16-11-2025 12:00 PM - 1:00 PM', '[[2,\"16-11-2025 11:13:18am\"]]', '2', 0, NULL, 126, 0, 75.00, 80.00, '2025-11-16 11:13:18', '2025-11-16 11:13:18', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(71, 16, 9, '{\"final_total\":16,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1910551496', 547008, '9356484061', '', 16.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 21.00, 'COD', '4W94+29Q, Sector V2, Jalvayu Vihar, Powai, Mumbai, Maharashtra 400076, India Sector V2  Mumbai Maharashtra India-400076 anju 9356484061/', '19.1175993', '72.9059747', '16-11-2025 12:00 PM - 1:00 PM', '[[2,\"16-11-2025 11:32:05am\"]]', '2', 0, NULL, 130, 0, 16.00, 21.00, '2025-11-16 11:32:05', '2025-11-16 11:32:05', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(72, 16, 9, '{\"final_total\":16,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 7, '-1122342216', 270047, '9356484061', '', 16.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 20.79, 'Razorpay', '4W94+29Q, Sector V2, Jalvayu Vihar, Powai, Mumbai, Maharashtra 400076, India Sector V2  Mumbai Maharashtra India-400076 anju 9356484061/', '19.1175993', '72.9059747', '17-11-2025 12:00 PM - 1:00 PM', '[[1,\"17-11-2025 11:08:34am\"]]', '2', 0, NULL, 130, 0, 16.00, 20.79, '2025-11-17 11:08:34', '2025-11-17 11:09:09', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(73, 16, 9, '{\"final_total\":10,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 8, '-1327617298', 316890, '9356484061', '', 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 14.85, 'Razorpay', '4W94+29Q, Sector V2, Jalvayu Vihar, Powai, Mumbai, Maharashtra 400076, India Sector V2  Mumbai Maharashtra India-400076 anju 9356484061/', '19.1175993', '72.9059747', '17-11-2025 12:00 PM - 1:00 PM', '[[1,\"17-11-2025 11:18:46am\"]]', '2', 0, NULL, 130, 0, 10.00, 14.85, '2025-11-17 11:18:46', '2025-11-17 11:19:35', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(74, 78, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '557479910', 364782, '8087864013', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 80.00, 'COD', 'M2RQ+C3H, Vikasnagar, Sangamnagar, Satara, Maharashtra 415003, India Sangamnagar  Satara Maharashtra India-415003 ulkesh eco 8087864013/', '17.69100855518528', '74.03778456151485', '17-11-2025 12:00 PM - 1:00 PM', '[[2,\"17-11-2025 11:34:22am\"]]', '6', 0, NULL, 132, 0, 75.00, 80.00, '2025-11-17 11:34:22', '2025-11-17 12:28:13', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(75, 16, 7, '{\"final_total\":10,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 9, '-460528764', 771108, '9356484061', '', 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 14.85, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '17-11-2025 12:00 PM - 1:00 PM', '[[1,\"17-11-2025 11:36:48am\"]]', '2', 0, NULL, 133, 0, 10.00, 14.85, '2025-11-17 11:36:48', '2025-11-17 11:37:14', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(76, 16, 7, '{\"final_total\":10,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1408520609', 803916, '9356484061', '', 10.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 14.85, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '17-11-2025 1:00 PM - 2:00 PM', '[[1,\"17-11-2025 12:39:58pm\"]]', '1', 0, NULL, 133, 0, 10.00, 14.85, '2025-11-17 12:39:58', '2025-11-17 12:40:59', '2025-11-17 12:40:59', '1', '0', '0', '5', '0.0', NULL, NULL),
(77, 78, 7, '{\"final_total\":88,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-944829827', 173567, '8087864013', '', 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"5\\\"}]\"', 0, '', 0.00, 93.00, 'COD', 'M2RQ+C3H, Vikasnagar, Sangamnagar, Satara, Maharashtra 415003, India Sangamnagar  Satara Maharashtra India-415003 ulkesh eco 8087864013/', '17.69100855518528', '74.03778456151485', '17-11-2025 1:00 PM - 2:00 PM', '[[2,\"17-11-2025 12:40:00pm\"]]', '6', 0, NULL, 132, 0, 88.00, 93.00, '2025-11-17 12:40:00', '2025-11-17 12:43:44', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(78, 16, 1, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-2007017289', 657711, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-11-2025 12:00 PM - 1:00 PM', '[[2,\"20-11-2025 11:02:49am\"]]', '2', 0, NULL, 133, 0, 85.00, 85.00, '2025-11-20 11:02:49', '2025-11-20 11:02:49', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(79, 31, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1890813990', 718017, '7021603265', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 tejashree 7021603265/', '17.7251382', '74.0397995', '20-11-2025 12:00 PM - 1:00 PM', '[[2,\"20-11-2025 11:04:03am\"]]', '2', 0, NULL, 134, 0, 85.00, 85.00, '2025-11-20 11:04:03', '2025-11-20 11:04:03', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(80, 31, 1, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '350455698', 229447, '7021603265', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 84.15, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 tejashree 7021603265/', '17.7251382', '74.0397995', '20-11-2025 12:00 PM - 1:00 PM', '[[1,\"20-11-2025 11:09:09am\"]]', '1', 0, NULL, 134, 0, 85.00, 84.15, '2025-11-20 11:09:09', '2025-11-20 11:11:06', '2025-11-20 11:11:06', '1', '0', '0', '5', '0.0', NULL, NULL),
(81, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 12, '-817972500', 187045, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-11-2025 12:00 PM - 1:00 PM', '[[2,\"20-11-2025 11:12:50am\"]]', '6', 0, NULL, 133, 0, 85.00, 85.00, '2025-11-20 11:12:50', '2025-11-20 11:28:41', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(82, 16, 7, '{\"final_total\":88,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-2057782514', 425599, '9356484061', '', 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 88.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-11-2025 12:00 PM - 1:00 PM', '[[2,\"20-11-2025 11:38:12am\"]]', '5', 0, NULL, 133, 0, 88.00, 88.00, '2025-11-20 11:38:12', '2025-11-20 11:39:20', NULL, '1', '0', '0', '5', '0.0', NULL, NULL);
INSERT INTO `bl_orders` (`id`, `user_id`, `delivery_boy_id`, `delivery_boy_bonus_details`, `delivery_boy_bonus_amount`, `transaction_id`, `orders_id`, `otp`, `mobile`, `order_note`, `total`, `delivery_charge`, `tax_amount`, `tax_percentage`, `wallet_balance`, `discount`, `additional_charges`, `promo_code_id`, `promo_code`, `promo_discount`, `final_total`, `payment_method`, `address`, `latitude`, `longitude`, `delivery_time`, `status`, `active_status`, `order_from`, `pincode_id`, `address_id`, `area_id`, `remaining_total`, `remaining_final`, `created_at`, `updated_at`, `deleted_at`, `packing_type`, `packing_charge`, `feed_the_needy`, `credit_point`, `debit_point`, `cancelled_by`, `cod_payment_status`) VALUES
(83, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 13, '1370274755', 410902, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-11-2025 1:00 PM - 2:00 PM', '[[2,\"20-11-2025 12:16:45pm\"]]', '6', 0, NULL, 133, 0, 85.00, 85.00, '2025-11-20 12:16:45', '2025-11-20 12:22:54', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(84, 10, 0, NULL, NULL, 0, '1650089148', 563611, '9665027030', '', 170.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 170.00, 'COD', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '20-11-2025 4:00 PM - 5:00 PM', '[[2,\"20-11-2025 03:30:21pm\"]]', '2', 0, NULL, 56, 0, 170.00, 170.00, '2025-11-20 15:30:21', '2025-11-20 15:42:05', NULL, '1', '0', '0', '10', '0.0', NULL, NULL),
(85, 10, 0, NULL, NULL, 0, '-621250385', 103428, '9665027030', '', 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 78.00, 'COD', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '20-11-2025 4:00 PM - 5:00 PM', '[[2,\"20-11-2025 03:54:36pm\"]]', '2', 0, NULL, 56, 0, 88.00, 78.00, '2025-11-20 15:54:36', '2025-11-20 15:54:36', NULL, '1', '0', '0', '5', '10.0', NULL, NULL),
(86, 10, 0, NULL, NULL, 0, '-1108718949', 414423, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 65.00, 0.00, '\"[]\"', 0, '', 0.00, 0.00, 'Wallet', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '20-11-2025 5:00 PM - 6:00 PM', '[[2,\"20-11-2025 04:15:47pm\"]]', '2', 0, NULL, 56, 0, 75.00, 0.00, '2025-11-20 16:15:48', '2025-11-20 16:15:48', NULL, '1', '0', '0', '5', '10.0', NULL, NULL),
(87, 10, 0, NULL, NULL, 0, '844694814', 877005, '9665027030', '', 86.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 106.00, 'COD', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '20-11-2025 5:00 PM - 6:00 PM', '[[2,\"20-11-2025 04:29:15pm\"]]', '7', 0, NULL, 56, 0, 0.00, 0.00, '2025-11-20 16:29:15', '2025-11-24 13:39:03', NULL, '3', '15', '5', '5', '0.0', NULL, NULL),
(88, 16, 1, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1767311713', 663789, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 84.15, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-11-2025 5:00 PM - 6:00 PM', '[[1,\"20-11-2025 04:37:52pm\"]]', '1', 0, NULL, 133, 0, 85.00, 84.15, '2025-11-20 16:37:52', '2025-11-20 16:39:39', '2025-11-20 16:39:39', '1', '0', '0', '5', '0.0', NULL, NULL),
(89, 88, 7, '{\"final_total\":88,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 10, '1519675143', 227377, '7391075666', '', 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 88.00, 'Razorpay', 'M2PF+M8J, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- Geeta Patil 7391075666/', '17.6867054', '74.0232396', '20-11-2025 5:00 PM - 6:00 PM', '[[1,\"20-11-2025 04:46:58pm\"]]', '6', 0, NULL, 135, 0, 88.00, 88.00, '2025-11-20 16:46:58', '2025-11-20 16:51:06', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(90, 10, 0, NULL, NULL, 0, '-1591216672', 865336, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 75.00, 'Razorpay', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- ecoleaf 9665027030/', '17.6867551', '74.0231713', '20-11-2025 5:00 PM - 6:00 PM', '[[1,\"20-11-2025 04:52:43pm\"]]', '1', 0, NULL, 56, 0, 75.00, 75.00, '2025-11-20 16:52:43', '2025-11-20 16:52:52', '2025-11-20 16:52:52', '1', '0', '0', '5', '0.0', NULL, NULL),
(91, 16, 10, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '308197164', 418434, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '21-11-2025 10:00 AM - 11:00 AM', '[[2,\"20-11-2025 05:18:22pm\"]]', '7', 0, NULL, 133, 0, 0.00, 0.00, '2025-11-20 17:18:22', '2025-11-24 12:53:15', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(92, 16, 7, '{\"final_total\":86,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 16, '1187321100', 152427, '9356484061', '', 86.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 86.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '21-11-2025 10:00 AM - 11:00 AM', '[[2,\"20-11-2025 05:21:10pm\"]]', '6', 0, NULL, 133, 0, 86.00, 86.00, '2025-11-20 17:21:10', '2025-11-20 17:23:34', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(93, 74, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-412930410', 249397, '8956677937', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'COD', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- Prajakta sonawane 8956677937/', '17.6867381', '74.0231922', '21-11-2025 10:00 AM - 11:00 AM', '[[2,\"20-11-2025 06:12:43pm\"]]', '6', 0, NULL, 136, 0, 85.00, 85.00, '2025-11-20 18:12:43', '2025-11-20 18:14:39', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(94, 91, 7, '{\"final_total\":307,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-264719983', 647853, '9373713238', '', 307.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 322.00, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 sachin sawant 9373713238/', '17.7253119', '74.041091', '21-11-2025 10:00 AM - 11:00 AM', '[[1,\"20-11-2025 09:46:57pm\"]]', '1', 0, NULL, 137, 0, 307.00, 322.00, '2025-11-20 21:46:57', '2025-11-20 21:47:10', '2025-11-20 21:47:10', '3', '15', '0', '20', '0.0', NULL, NULL),
(95, 91, 7, '{\"final_total\":307,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-166592901', 399848, '9373713238', '', 307.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 307.00, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 sachin sawant 9373713238/', '17.7253119', '74.041091', '21-11-2025 10:00 AM - 11:00 AM', '[[1,\"20-11-2025 09:47:32pm\"]]', '1', 0, NULL, 137, 0, 307.00, 307.00, '2025-11-20 21:47:32', '2025-11-20 21:47:38', '2025-11-20 21:47:38', '1', '0', '0', '20', '0.0', NULL, NULL),
(96, 91, 7, '{\"final_total\":259,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-989496880', 557149, '9373713238', '', 259.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 244.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 sachin sawant 9373713238/', '17.7253119', '74.041091', '21-11-2025 10:00 AM - 11:00 AM', '[[2,\"20-11-2025 10:04:04pm\"]]', '6', 0, NULL, 137, 0, 259.00, 244.00, '2025-11-20 22:04:04', '2025-11-21 11:31:19', NULL, '3', '15', '0', '15', '30.0', NULL, 'UPI Paid'),
(97, 13, 7, '{\"final_total\":173,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1155849147', 298605, '9552616114', '', 173.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 173.00, 'COD', 'sahyadri ayurvedic life pvt ltd.       310,1/C,At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India near cyclo transmission  satara Maharashtra India-415011 Nilam sabale 9552616114/', '17.7251303', '74.0398771', '21-11-2025 11:00 AM - 12:00 PM', '[[2,\"21-11-2025 10:33:46am\"]]', '6', 0, NULL, 97, 0, 173.00, 173.00, '2025-11-21 10:33:46', '2025-11-21 11:31:05', NULL, '1', '0', '0', '10', '0.0', NULL, 'UPI Paid'),
(98, 16, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1243997282', 292188, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 75.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '21-11-2025 12:00 PM - 1:00 PM', '[[2,\"21-11-2025 11:47:40am\"]]', '2', 0, NULL, 133, 0, 75.00, 75.00, '2025-11-21 11:47:40', '2025-11-21 11:47:40', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(99, 16, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-551042384', 579167, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 74.25, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '21-11-2025 12:00 PM - 1:00 PM', '[[1,\"21-11-2025 11:50:47am\"]]', '1', 0, NULL, 133, 0, 75.00, 74.25, '2025-11-21 11:50:47', '2025-11-21 11:51:52', '2025-11-21 11:51:52', '1', '0', '0', '5', '0.0', NULL, NULL),
(100, 16, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1912879186', 546266, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 74.25, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '21-11-2025 12:00 PM - 1:00 PM', '[[2,\"21-11-2025 11:53:44am\"]]', '7', 0, NULL, 133, 0, 0.00, 0.00, '2025-11-21 11:53:44', '2025-11-24 12:51:56', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(101, 10, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1978895480', 890059, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 75.00, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 test test 9665027030/', '17.7249333', '74.0399533', '21-11-2025 4:00 PM - 5:00 PM', '[[1,\"21-11-2025 03:30:03pm\"]]', '7', 0, NULL, 138, 0, 0.00, 0.00, '2025-11-21 15:30:03', '2025-11-24 13:35:36', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(102, 10, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '1642574324', 262340, '9665027030', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 84.15, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 test test 9665027030/', '17.7249333', '74.0399533', '21-11-2025 5:00 PM - 6:00 PM', '[[1,\"21-11-2025 04:52:43pm\"]]', '1', 0, NULL, 138, 0, 85.00, 84.15, '2025-11-21 16:52:43', '2025-11-21 16:52:58', '2025-11-21 16:52:58', '1', '0', '0', '5', '0.0', NULL, NULL),
(103, 16, 7, '{\"final_total\":75,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 27, '692308005', 457944, '9356484061', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 75.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '22-11-2025 4:00 PM - 5:00 PM', '[[2,\"22-11-2025 03:09:48pm\"]]', '6', 0, NULL, 133, 0, 75.00, 75.00, '2025-11-22 15:09:48', '2025-12-04 10:59:54', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(104, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 26, '-962364627', 549542, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '22-11-2025 4:00 PM - 5:00 PM', '[[2,\"22-11-2025 03:22:10pm\"]]', '6', 0, NULL, 133, 0, 85.00, 85.00, '2025-11-22 15:22:10', '2025-12-04 10:58:55', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(105, 16, 11, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-1440410499', 563125, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 84.15, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '23-11-2025 10:00 AM - 11:00 AM', '[[1,\"22-11-2025 05:14:21pm\"]]', '1', 0, NULL, 133, 0, 85.00, 84.15, '2025-11-22 17:14:21', '2025-11-22 17:15:07', '2025-11-22 17:15:07', '1', '0', '0', '5', '0.0', NULL, NULL),
(106, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '-796914389', 229095, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '23-11-2025 10:00 AM - 11:00 AM', '[[2,\"22-11-2025 05:41:12pm\"]]', '7', 0, NULL, 133, 0, 0.00, 0.00, '2025-11-22 17:41:12', '2025-11-24 12:50:01', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(107, 16, 7, '{\"final_total\":85,\"bonus_type\":\"0\",\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 17, '81373755', 157282, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '24-11-2025 1:00 PM - 2:00 PM', '[[2,\"24-11-2025 12:46:21pm\"]]', '6', 0, NULL, 133, 0, 85.00, 85.00, '2025-11-24 12:46:21', '2025-11-24 12:48:47', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(108, 80, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10104360681566', 306165, '9146187201', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 75.00, 'COD', '112 /1 sahyog society pirwadi satara , Satara, Pirwadi, Maharashtra 415003, India pirwadi pirwadi Satara Maharashtra India-415003 Gurudatta kale 9146187201/', '17.6867392', '74.0231956', '25-11-2025 10:00 AM - 11:00 AM', '[[2,\"25-11-2025 05:40:48am\"]]', '5', 0, NULL, 122, 0, 85.00, 75.00, '2025-11-25 05:40:48', '2025-11-25 11:04:36', NULL, '1', '0', '0', '5', '10.0', NULL, NULL),
(109, 97, 7, '{\"final_total\":88,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '11539298694952', 637756, '9421582666', '', 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 88.00, 'COD', 'M2FV+MG6, MIDC, Satara, Maharashtra 415004, India   Satara Maharashtra India- Aniket Adsul 9421582666/', '17.6740087', '74.0440012', '26-11-2025 3:00 PM - 4:00 PM', '[[2,\"26-11-2025 02:53:33pm\"]]', '6', 0, NULL, 139, 0, 88.00, 88.00, '2025-11-26 14:53:33', '2025-11-26 17:04:17', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(110, 78, 7, '{\"final_total\":75,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '4098338356670', 749315, '8087864013', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 75.00, 'COD', 'M2RQ+C3H, Vikasnagar, Sangamnagar, Satara, Maharashtra 415003, India Sangamnagar  Satara Maharashtra India-415003 ulkesh eco 8087864013/', '17.69100855518528', '74.03778456151485', '27-11-2025 6:00 PM - 7:00 PM', '[[2,\"27-11-2025 05:13:23pm\"]]', '6', 0, NULL, 132, 0, 75.00, 75.00, '2025-11-27 17:13:23', '2025-11-27 17:15:28', NULL, '1', '0', '0', '5', '0.0', NULL, 'UPI Paid'),
(111, 16, 11, '{\"final_total\":258,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 24, '6820807516246', 318706, '9356484061', '', 258.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 258.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '28-11-2025 11:00 AM - 12:00 PM', '[[2,\"28-11-2025 10:32:14am\"]]', '6', 0, NULL, 133, 0, 0.00, 0.00, '2025-11-28 10:32:14', '2025-12-04 10:57:30', NULL, '1', '0', '0', '10', '0.0', NULL, NULL),
(112, 16, 7, '{\"final_total\":36,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 25, '17352126373554', 696317, '9356484061', '', 36.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 36.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '28-11-2025 4:00 PM - 5:00 PM', '[[2,\"28-11-2025 03:29:43pm\"]]', '6', 0, NULL, 133, 0, 36.00, 36.00, '2025-11-28 15:29:43', '2025-12-04 10:57:48', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(113, 16, 11, '{\"final_total\":36,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 22, '5434120765326', 849856, '9356484061', '', 36.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 36.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '28-11-2025 4:00 PM - 5:00 PM', '[[2,\"28-11-2025 03:45:23pm\"]]', '6', 0, NULL, 133, 0, 36.00, 36.00, '2025-11-28 15:45:23', '2025-12-04 10:56:40', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(114, 16, 7, '{\"final_total\":36,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 23, '3899158271427', 471301, '9356484061', '', 36.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 36.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '28-11-2025 4:00 PM - 5:00 PM', '[[2,\"28-11-2025 03:46:49pm\"]]', '6', 0, NULL, 133, 0, 36.00, 36.00, '2025-11-28 15:46:49', '2025-12-04 10:56:56', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(115, 16, 11, '{\"final_total\":20,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 20, '3544535719731', 253788, '9356484061', '', 20.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 20.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '28-11-2025 5:00 PM - 6:00 PM', '[[2,\"28-11-2025 04:43:02pm\"]]', '6', 0, NULL, 133, 0, 20.00, 20.00, '2025-11-28 16:43:02', '2025-12-04 10:55:51', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(116, 16, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 21, '6929110386187', 864093, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '30-11-2025 11:00 AM - 12:00 PM', '[[2,\"30-11-2025 10:39:04am\"]]', '6', 0, NULL, 133, 0, 85.00, 85.00, '2025-11-30 10:39:04', '2025-12-04 10:56:07', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(117, 16, 11, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 18, '2879767985275', 419816, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 80.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '1-12-2025 11:00 AM - 12:00 PM', '[[2,\"01-12-2025 10:05:16am\"]]', '6', 0, NULL, 133, 0, 85.00, 80.00, '2025-12-01 10:05:16', '2025-12-04 10:39:33', NULL, '1', '0', '0', '5', '5.0', NULL, NULL),
(118, 16, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 19, '11727292212054', 642736, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 80.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '1-12-2025 11:00 AM - 12:00 PM', '[[2,\"01-12-2025 10:09:40am\"]]', '6', 0, NULL, 133, 0, 85.00, 80.00, '2025-12-01 10:09:40', '2025-12-04 10:40:12', NULL, '1', '0', '0', '5', '5.0', NULL, NULL),
(119, 16, 11, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '16512790143933', 771300, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 85.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '1-12-2025 11:00 AM - 12:00 PM', '[[2,\"01-12-2025 10:10:24am\"]]', '2', 0, NULL, 133, 0, 85.00, 85.00, '2025-12-01 10:10:24', '2025-12-01 10:10:24', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(120, 16, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 28, '16346924513798', 998069, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 80.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '1-12-2025 11:00 AM - 12:00 PM', '[[2,\"01-12-2025 10:16:30am\"]]', '6', 0, NULL, 133, 0, 85.00, 80.00, '2025-12-01 10:16:30', '2025-12-04 11:00:36', NULL, '1', '0', '0', '2', '5.0', NULL, NULL),
(121, 16, 11, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '14146515382943', 534644, '9356484061', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 80.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '1-12-2025 11:00 AM - 12:00 PM', '[[2,\"01-12-2025 10:22:02am\"]]', '7', 0, NULL, 133, 0, 0.00, 0.00, '2025-12-01 10:22:02', '2025-12-01 10:24:35', NULL, '1', '0', '0', '2', '5.0', NULL, NULL),
(122, 104, 7, '{\"final_total\":50,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7536874661474', 906553, '8329576511', '', 50.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 50.00, 'COD', 'M2VF+33J, Gajanan Nagari, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India Amba Niwas pirwadi Satara Maharashtra India-435001 Sakshi PatilKale 8329576511/9011196986', '17.6926975', '74.0226823', '2-12-2025 2:00 PM - 3:00 PM', '[[2,\"02-12-2025 01:36:03pm\"]]', '2', 0, NULL, 142, 0, 50.00, 50.00, '2025-12-02 13:36:03', '2025-12-02 13:36:03', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(123, 16, 11, '{\"final_total\":170,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '14450430932163', 899698, '9356484061', '', 170.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 195.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '4-12-2025 1:00 PM - 2:00 PM', '[[2,\"04-12-2025 12:09:13pm\"]]', '2', 0, NULL, 133, 0, 170.00, 195.00, '2025-12-04 12:09:13', '2025-12-04 12:09:13', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(124, 78, 7, '{\"final_total\":88,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10171055058652', 955803, '8087864013', '', 88.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 88.00, 'COD', 'M2X9+43J, Sadar Bazar, Chahur, Satara, Maharashtra 415001, India Sadar Bazar  Chahur Maharashtra India-415001 ulkesh eco 8087864013/', '17.69776417476033', '74.01761937886477', '09-12-2025 10:00 AM - 11:00 AM', '[[2,\"08-12-2025 05:30:54pm\"]]', '7', 0, NULL, 145, 0, 0.00, 0.00, '2025-12-08 17:30:54', '2025-12-10 17:14:27', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(125, 74, 7, '{\"final_total\":406,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 11, '3645482917327', 834610, '8956677937', '', 406.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 406.00, 'Razorpay', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- Prajakta sonawane 8956677937/', '17.6867381', '74.0231922', '11-12-2025 10:00 AM - 11:00 AM', '[[1,\"10-12-2025 05:13:50pm\"]]', '6', 0, NULL, 136, 0, 406.00, 406.00, '2025-12-10 17:13:50', '2025-12-19 11:38:32', NULL, '1', '0', '0', '15', '0.0', NULL, NULL),
(126, 10, 7, '{\"final_total\":100,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '9453542766763', 711151, '9665027030', '', 100.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 100.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 test test 9665027030/', '17.7249333', '74.0399533', '11-12-2025 11:00 AM - 12:00 PM', '[[2,\"10-12-2025 05:21:03pm\"]]', '2', 0, NULL, 138, 0, 100.00, 100.00, '2025-12-10 17:21:03', '2025-12-10 17:21:03', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(127, 16, 11, '{\"final_total\":50,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '12714177581383', 155871, '9356484061', '', 50.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 75.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '11-12-2025 10:00 AM - 11:00 AM', '[[2,\"10-12-2025 05:23:37pm\"]]', '2', 0, NULL, 133, 0, 50.00, 75.00, '2025-12-10 17:23:37', '2025-12-10 17:23:37', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(128, 16, 7, '{\"final_total\":15,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '3303003078013', 908156, '9356484061', '', 15.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 40.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '11-12-2025 11:00 AM - 12:00 PM', '[[2,\"10-12-2025 05:25:59pm\"]]', '2', 0, NULL, 133, 0, 15.00, 40.00, '2025-12-10 17:25:59', '2025-12-10 17:25:59', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(129, 113, 11, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '11658845441802', 314339, '9665387587', '', 85.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 125.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 janki s 9665387587/', '17.7251099', '74.0398125', '14-12-2025 1:00 PM - 2:00 PM', '[[2,\"14-12-2025 10:42:27am\"]]', '2', 0, NULL, 149, 0, 85.00, 125.00, '2025-12-14 10:42:27', '2025-12-14 10:42:27', NULL, '2', '45', '0', '2', '5.0', NULL, NULL),
(130, 16, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '11000247382458', 325566, '9356484061', '', 85.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 110.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '14-12-2025 11:00 AM - 12:00 PM', '[[2,\"14-12-2025 10:53:08am\"]]', '2', 0, NULL, 133, 0, 85.00, 110.00, '2025-12-14 10:53:08', '2025-12-14 10:53:08', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(131, 10, 7, '{\"final_total\":75,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 12, '14471394639373', 734063, '9665027030', '', 75.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 75.00, 'Razorpay', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 test test 9665027030/', '17.7249333', '74.0399533', '17-12-2025 4:00 PM - 5:00 PM', '[[1,\"16-12-2025 03:59:40pm\"]]', '6', 0, NULL, 138, 0, 75.00, 75.00, '2025-12-16 15:59:41', '2025-12-19 15:19:24', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(132, 116, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '11282729529684', 141898, '7219883064', '', 85.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 110.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 sandip pawar 7219883064/', '17.7250987', '74.039746', '17-12-2025 3:00 PM - 4:00 PM', '[[2,\"17-12-2025 02:25:35pm\"]]', '2', 0, NULL, 151, 0, 85.00, 110.00, '2025-12-17 14:25:35', '2025-12-17 14:25:35', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(133, 16, 11, '{\"final_total\":86,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '12538339972699', 681034, '9356484061', '', 86.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 111.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '17-12-2025 3:00 PM - 4:00 PM', '[[2,\"17-12-2025 02:52:56pm\"]]', '2', 0, NULL, 133, 0, 86.00, 111.00, '2025-12-17 14:52:56', '2025-12-17 14:52:56', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(134, 15, 7, '{\"final_total\":116,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 29, '4157094745344', 228070, '9420742077', '', 116.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 116.00, 'COD', 'M2VF+33J, Gajanan Nagari, Visawa Park, Sadar Bazar, Pirwadi, Satara, Maharashtra 415003, India Visawa Park  Pirwadi Maharashtra India-415003 Rohan kale 9420742077/', '17.6927847', '74.0226906', '18-12-2025 11:00 AM - 12:00 PM', '[[2,\"17-12-2025 04:52:59pm\"]]', '6', 0, NULL, 152, 0, 116.00, 116.00, '2025-12-17 16:53:00', '2025-12-19 13:54:07', NULL, '1', '0', '0', '7', '0.0', NULL, NULL),
(135, 117, 7, '{\"final_total\":106,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 32, '6338321171425', 537145, '7083065644', '', 106.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 106.00, 'COD', 'M2W9+X84, C.T.S. No. 7, Sadar Bazar, Satara, Chahur, Maharashtra 415001, India Sadar Bazar  Satara Maharashtra India-415001 sandesh kadam 7083065644/', '17.69765685342886', '74.01833049952984', '18-12-2025 1:00 PM - 2:00 PM', '[[2,\"18-12-2025 12:26:46pm\"]]', '6', 0, NULL, 153, 0, 0.00, 0.00, '2025-12-18 12:26:46', '2025-12-19 15:46:04', NULL, '1', '0', '0', '15', '0.0', NULL, NULL),
(136, 117, 7, '{\"final_total\":238,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 31, '15050222983335', 456728, '7083065644', '', 238.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 238.00, 'COD', 'M2W9+X84, C.T.S. No. 7, Sadar Bazar, Satara, Chahur, Maharashtra 415001, India Sadar Bazar  Satara Maharashtra India-415001 sandesh kadam 7083065644/', '17.69765685342886', '74.01833049952984', '19-12-2025 11:00 AM - 12:00 PM', '[[2,\"18-12-2025 01:08:52pm\"]]', '6', 0, NULL, 153, 0, 238.00, 238.00, '2025-12-18 13:08:52', '2025-12-19 14:43:46', NULL, '1', '0', '0', '15', '0.0', NULL, NULL),
(137, 118, 7, '{\"final_total\":199,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '6884042358292', 742917, '9356340490', '', 199.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 199.00, 'COD', '85, 0ld Mahada Colony, Sadar Bazar, Satara, Chahur, Maharashtra 415001, India  sadarbazar Satara Maharashtra India-415001 sujata Deshmukh 9356340490/', '17.7019796', '74.0243203', '18-12-2025 2:00 PM - 3:00 PM', '[[2,\"18-12-2025 01:28:50pm\"]]', '2', 0, NULL, 154, 0, 0.00, 0.00, '2025-12-18 13:28:50', '2025-12-18 13:36:51', NULL, '1', '0', '0', '20', '0.0', NULL, NULL),
(138, 118, 7, '{\"final_total\":106,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10038199011498', 306064, '9356340490', '', 106.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 121.00, 'COD', '85, 0ld Mahada Colony, Sadar Bazar, Satara, Chahur, Maharashtra 415001, India  sadarbazar Satara Maharashtra India-415001 sujata Deshmukh 9356340490/', '17.7019796', '74.0243203', '19-12-2025 11:00 AM - 12:00 PM', '[[2,\"18-12-2025 01:31:04pm\"]]', '2', 0, NULL, 154, 0, 0.00, 0.00, '2025-12-18 13:31:04', '2025-12-18 13:38:35', NULL, '1', '0', '0', '10', '10.0', NULL, NULL),
(139, 118, 7, '{\"final_total\":216,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 30, '12383513309372', 196403, '9356340490', '', 216.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 196.00, 'COD', '85, 0ld Mahada Colony, Sadar Bazar, Satara, Chahur, Maharashtra 415001, India  sadarbazar Satara Maharashtra India-415001 sujata Deshmukh 9356340490/', '17.7019796', '74.0243203', '19-12-2025 11:00 AM - 12:00 PM', '[[2,\"18-12-2025 01:47:02pm\"]]', '6', 0, NULL, 154, 0, 216.00, 196.00, '2025-12-18 13:47:02', '2025-12-19 14:41:39', NULL, '1', '0', '0', '20', '20.0', NULL, NULL),
(140, 118, 7, '{\"final_total\":50,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7964881677497', 276775, '9356340490', '', 50.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 75.00, 'COD', '85, 0ld Mahada Colony, Sadar Bazar, Satara, Chahur, Maharashtra 415001, India  sadarbazar Satara Maharashtra India-415001 sujata Deshmukh 9356340490/', '17.7019796', '74.0243203', '19-12-2025 11:00 AM - 12:00 PM', '[[2,\"18-12-2025 02:42:32pm\"]]', '2', 0, NULL, 154, 0, 50.00, 75.00, '2025-12-18 14:42:32', '2025-12-18 14:42:32', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(141, 16, 11, '{\"final_total\":18,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '13453802067515', 741812, '9356484061', '', 18.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 43.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '19-12-2025 11:00 AM - 12:00 PM', '[[2,\"18-12-2025 04:09:13pm\"]]', '2', 0, NULL, 156, 0, 18.00, 43.00, '2025-12-18 16:09:13', '2025-12-18 16:09:13', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(142, 16, 7, '{\"final_total\":86,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7938701410933', 680070, '9356484061', '', 86.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 111.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-12-2025 10:00 AM - 11:00 AM', '[[2,\"19-12-2025 09:53:42am\"]]', '2', 0, NULL, 156, 0, 86.00, 111.00, '2025-12-19 09:53:42', '2025-12-19 09:53:42', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(143, 119, 7, '{\"final_total\":88,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '5852951733278', 945389, '9075002409', '', 88.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 113.00, 'COD', 'M2HF+437, MIDC, Satara, Maharashtra 415004, India MIDC  Satara Maharashtra India-415004 minaz shekh 9075002409/', '17.6777878', '74.0226099', '19-12-2025 1:00 PM - 2:00 PM', '[[2,\"19-12-2025 12:54:28pm\"]]', '3', 0, NULL, 157, 0, 88.00, 113.00, '2025-12-19 12:54:28', '2025-12-19 17:10:19', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(144, 16, 7, '{\"final_total\":100,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '9060672479326', 584282, '9356484061', '', 100.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 125.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-12-2025 1:00 PM - 2:00 PM', '[[2,\"20-12-2025 12:12:38pm\"]]', '2', 0, NULL, 156, 0, 100.00, 125.00, '2025-12-20 12:12:38', '2025-12-20 12:12:38', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(145, 16, 11, '{\"final_total\":100,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '6766361929409', 740953, '9356484061', '', 100.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 125.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '20-12-2025 1:00 PM - 2:00 PM', '[[2,\"20-12-2025 12:13:00pm\"]]', '2', 0, NULL, 156, 0, 100.00, 125.00, '2025-12-20 12:13:00', '2025-12-20 12:13:00', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(146, 16, 7, '{\"final_total\":50,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10588546015258', 583108, '9356484061', '', 50.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 75.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '21-12-2025 11:00 AM - 12:00 PM', '[[2,\"20-12-2025 04:48:47pm\"]]', '2', 0, NULL, 156, 0, 50.00, 75.00, '2025-12-20 16:48:47', '2025-12-20 16:48:47', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(147, 74, 11, '{\"final_total\":356,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '8411602316155', 338651, '8956677937', '', 356.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 356.00, 'Razorpay', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- Prajakta sonawane 8956677937/', '17.6867381', '74.0231922', '23-12-2025 10:00 AM - 11:00 AM', '[[1,\"22-12-2025 04:29:18pm\"]]', '1', 0, NULL, 136, 0, 356.00, 356.00, '2025-12-22 16:29:18', '2025-12-22 16:30:57', '2025-12-22 16:30:57', '1', '0', '0', '27', '0.0', NULL, NULL),
(148, 74, 7, '{\"final_total\":356,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '12872317285323', 223124, '8956677937', '', 356.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 356.00, 'COD', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- Prajakta sonawane 8956677937/', '17.6867381', '74.0231922', '23-12-2025 2:00 PM - 3:00 PM', '[[2,\"23-12-2025 01:31:55pm\"]]', '2', 0, NULL, 136, 0, 356.00, 356.00, '2025-12-23 13:31:55', '2025-12-23 13:31:55', NULL, '1', '0', '0', '27', '0.0', NULL, NULL),
(149, 91, 7, '{\"final_total\":200,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10590329379496', 295704, '9373713238', '', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 195.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 sachin sawant 9373713238/', '17.7253119', '74.041091', '24-12-2025 11:00 AM - 12:00 PM', '[[2,\"24-12-2025 03:26:42am\"]]', '3', 0, NULL, 137, 0, 0.00, 0.00, '2025-12-24 03:26:42', '2026-01-01 07:11:45', NULL, '3', '15', '5', '21', '25.0', NULL, NULL),
(150, 16, 7, '{\"final_total\":100,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '5944780412104', 431386, '9356484061', '', 100.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 125.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '25-12-2025 1:00 PM - 2:00 PM', '[[2,\"25-12-2025 01:52:19pm\"]]', '2', 0, NULL, 156, 0, 100.00, 125.00, '2025-12-25 13:52:19', '2025-12-25 13:52:19', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(151, 16, 7, '{\"final_total\":200,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '8330137985013', 799859, '9356484061', '', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 200.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '26-12-2025 12:00 PM - 1:00 PM', '[[2,\"26-12-2025 12:11:19pm\"]]', '2', 0, NULL, 156, 0, 200.00, 200.00, '2025-12-26 12:11:19', '2025-12-27 09:57:02', NULL, '1', '0', '0', '4', '0.0', NULL, NULL),
(152, 154, 7, '{\"final_total\":625,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '16477392037807', 746219, '9518785080', '', 625.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 625.00, 'COD', '14B, Ambedare Rd, Shahupuri, Satara, Maharashtra 415002, India Shahupuri Ambedare Road Satara Maharashtra India-415002 Sachin Gurav 9518785080/7820865133', '17.694704', '73.97899', '27-12-2025 1:00 PM - 2:00 PM', '[[2,\"27-12-2025 01:41:19pm\"]]', '6', 0, NULL, 164, 0, 625.00, 625.00, '2025-12-27 13:41:19', '2025-12-27 16:52:32', NULL, '1', '0', '0', '125', '0.0', NULL, 'UPI Paid'),
(153, 16, 7, '{\"final_total\":35,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '15369659364920', 874536, '9356484061', '', 35.00, 25.00, 0.00, 0.00, 60.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 0.00, 'Wallet', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '27-12-2025 3:00 PM - 4:00 PM', '[[2,\"27-12-2025 03:46:37pm\"]]', '3', 0, NULL, 156, 0, 35.00, 0.00, '2025-12-27 15:46:37', '2025-12-27 16:08:55', NULL, '1', '0', '0', '2', '0.0', NULL, NULL),
(154, 86, 7, '{\"final_total\":200,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7519651295511', 495471, '7666377587', '', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 200.00, 'COD', 'M2PF+M7P, Visawa Park, Sadar Bazar, Satara, Pirwadi, Maharashtra 415003, India   Satara Maharashtra India- Maharashtra Organic 7666377587/', '17.6867696', '74.0231371', '28-12-2025 10:00 AM - 11:00 AM', '[[2,\"27-12-2025 05:06:00pm\"]]', '7', 0, NULL, 167, 0, 0.00, 0.00, '2025-12-27 17:06:00', '2025-12-27 17:08:41', NULL, '1', '0', '0', '4', '0.0', NULL, NULL),
(155, 16, 11, '{\"final_total\":1,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '5784831485763', 103713, '9356484061', '', 1.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 26.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '28-12-2025 11:00 AM - 12:00 PM', '[[2,\"28-12-2025 11:07:50am\"]]', '2', 0, NULL, 156, 0, 1.00, 26.00, '2025-12-28 11:07:50', '2025-12-28 11:07:50', NULL, '1', '0', '0', '5', '0.0', NULL, NULL),
(156, 16, 7, '{\"final_total\":201,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7968721507819', 986963, '9356484061', '', 201.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 201.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '28-12-2025 11:00 AM - 12:00 PM', '[[2,\"28-12-2025 11:12:36am\"]]', '2', 0, NULL, 156, 0, 201.00, 201.00, '2025-12-28 11:12:36', '2025-12-28 11:12:36', NULL, '1', '0', '0', '9', '0.0', NULL, NULL),
(157, 16, 11, '{\"final_total\":200,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '7366576049674', 541743, '9356484061', '', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 200.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '29-12-2025 11:00 AM - 12:00 PM', '[[2,\"29-12-2025 11:42:18am\"]]', '7', 0, NULL, 156, 0, 0.00, 0.00, '2025-12-29 11:42:18', '2025-12-29 11:42:30', NULL, '1', '0', '0', '4', '0.0', NULL, NULL),
(158, 16, 7, '{\"final_total\":201,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10927149005410', 770064, '9356484061', '', 201.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 201.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '29-12-2025 3:00 PM - 4:00 PM', '[[2,\"29-12-2025 03:46:36pm\"]]', '2', 0, NULL, 156, 0, 201.00, 201.00, '2025-12-29 15:46:36', '2025-12-29 15:46:36', NULL, '1', '0', '0', '9', '0.0', NULL, NULL);
INSERT INTO `bl_orders` (`id`, `user_id`, `delivery_boy_id`, `delivery_boy_bonus_details`, `delivery_boy_bonus_amount`, `transaction_id`, `orders_id`, `otp`, `mobile`, `order_note`, `total`, `delivery_charge`, `tax_amount`, `tax_percentage`, `wallet_balance`, `discount`, `additional_charges`, `promo_code_id`, `promo_code`, `promo_discount`, `final_total`, `payment_method`, `address`, `latitude`, `longitude`, `delivery_time`, `status`, `active_status`, `order_from`, `pincode_id`, `address_id`, `area_id`, `remaining_total`, `remaining_final`, `created_at`, `updated_at`, `deleted_at`, `packing_type`, `packing_charge`, `feed_the_needy`, `credit_point`, `debit_point`, `cancelled_by`, `cod_payment_status`) VALUES
(159, 16, 11, '{\"final_total\":201,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '11443718447457', 623086, '9356484061', '', 201.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 206.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '31-12-2025 11:00 AM - 12:00 PM', '[[2,\"30-12-2025 05:42:13pm\"]]', '2', 0, NULL, 156, 0, 201.00, 206.00, '2025-12-30 17:42:13', '2025-12-30 17:42:13', NULL, '1', '5', '0', '9', '0.0', NULL, NULL),
(160, 16, 7, '{\"final_total\":201,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '14996103427025', 777585, '9356484061', '', 201.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 201.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '31-12-2025 10:00 AM - 11:00 AM', '[[2,\"31-12-2025 10:44:35am\"]]', '2', 0, NULL, 156, 0, 201.00, 201.00, '2025-12-31 10:44:35', '2025-12-31 10:44:35', NULL, '1', '5', '0', '9', '0.0', NULL, NULL),
(161, 16, 11, '{\"final_total\":1,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '8486045467961', 834174, '9356484061', '', 1.00, 25.00, 0.00, 0.00, 31.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 0.00, 'Wallet', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '01-01-2026 10:00 AM - 11:00 AM', '[[2,\"31-12-2025 07:33:30pm\"]]', '2', 0, NULL, 156, 0, 1.00, 0.00, '2025-12-31 19:33:30', '2025-12-31 19:33:30', NULL, '1', '5', '0', '5', '0.0', NULL, NULL),
(162, 16, 7, '{\"final_total\":1,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '3612136178542', 146634, '9356484061', '', 1.00, 25.00, 0.00, 0.00, 31.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 0.00, 'Wallet', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '01-01-2026 11:00 AM - 12:00 PM', '[[2,\"31-12-2025 07:35:11pm\"]]', '2', 0, NULL, 156, 0, 1.00, 0.00, '2025-12-31 19:35:11', '2025-12-31 19:35:11', NULL, '1', '5', '0', '5', '0.0', NULL, NULL),
(163, 16, 11, '{\"final_total\":201,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '12137061200956', 875568, '9356484061', '', 201.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 206.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '01-01-2026 10:00 AM - 11:00 AM', '[[2,\"31-12-2025 07:37:20pm\"]]', '2', 0, NULL, 156, 0, 201.00, 206.00, '2025-12-31 19:37:20', '2025-12-31 19:37:20', NULL, '1', '5', '0', '11', '0.0', NULL, NULL),
(164, 16, 7, '{\"final_total\":201,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '12176473495087', 246947, '9356484061', '', 201.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 206.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '02-01-2026 11:00 AM - 12:00 PM', '[[2,\"01-01-2026 05:09:20pm\"]]', '2', 0, NULL, 156, 0, 201.00, 206.00, '2026-01-01 17:09:20', '2026-01-01 17:09:20', NULL, '1', '5', '0', '8', '0.0', NULL, NULL),
(165, 16, 11, '{\"final_total\":201,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10512105367754', 768298, '9356484061', '', 201.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 206.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '2-1-2026 11:00 AM - 12:00 PM', '[[2,\"02-01-2026 11:44:19am\"]]', '2', 0, NULL, 156, 0, 201.00, 206.00, '2026-01-02 11:44:19', '2026-01-02 11:44:19', NULL, '1', '5', '0', '6', '0.0', NULL, NULL),
(166, 155, 7, '{\"final_total\":50,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '3858294950311', 111129, '9850500077', '', 50.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 75.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 Sachin sawant 9850500077/', '17.725176', '74.0396871', '3-1-2026 1:00 PM - 2:00 PM', '[[2,\"03-01-2026 01:40:28pm\"]]', '5', 0, NULL, 165, 0, 50.00, 75.00, '2026-01-03 13:40:28', '2026-01-03 14:42:06', NULL, '1', '5', '0', '2', '0.0', NULL, NULL),
(167, 155, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '2857947521097', 362704, '9850500077', '', 85.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 110.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 Sachin sawant 9850500077/', '17.725176', '74.0396871', '3-1-2026 4:00 PM - 5:00 PM', '[[2,\"03-01-2026 04:32:50pm\"]]', '5', 0, NULL, 165, 0, 85.00, 110.00, '2026-01-03 16:32:50', '2026-01-03 16:33:51', NULL, '1', '5', '0', '2', '0.0', NULL, NULL),
(168, 16, 7, '{\"final_total\":85,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '5450780231140', 509681, '9356484061', '', 85.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 115.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '3-1-2026 4:00 PM - 5:00 PM', '[[2,\"03-01-2026 04:37:46pm\"]]', '5', 0, NULL, 156, 0, 85.00, 115.00, '2026-01-03 16:37:46', '2026-01-03 16:38:32', NULL, '1', '5', '0', '2', '0.0', NULL, NULL),
(169, 155, 11, '{\"final_total\":88,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '5841384790005', 600617, '9850500077', '', 88.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 113.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 Sachin sawant 9850500077/', '17.725176', '74.0396871', '3-1-2026 4:00 PM - 5:00 PM', '[[2,\"03-01-2026 04:41:05pm\"]]', '5', 0, NULL, 165, 0, 88.00, 113.00, '2026-01-03 16:41:05', '2026-01-03 16:41:40', NULL, '1', '5', '0', '5', '0.0', NULL, NULL),
(170, 16, 7, '{\"final_total\":53,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '10704010034445', 980298, '9356484061', '', 53.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 83.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '4-1-2026 11:00 AM - 12:00 PM', '[[2,\"04-01-2026 11:05:59am\"]]', '2', 0, NULL, 156, 0, 53.00, 83.00, '2026-01-04 11:05:59', '2026-01-04 11:05:59', NULL, '1', '5', '0', '2', '0.0', NULL, NULL),
(171, 16, 11, '{\"final_total\":200,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '16100783933181', 133053, '9356484061', '', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 0.00, 'Wallet', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '7-1-2026 10:00 AM - 11:00 AM', '[[2,\"07-01-2026 10:43:58am\"]]', '7', 0, NULL, 156, 0, 0.00, 0.00, '2026-01-07 10:43:58', '2026-01-07 10:45:38', NULL, '3', '15', '2', '8', '20.0', NULL, NULL),
(173, 10, 11, '{\"final_total\":50,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '15773755994062', 230989, '9665027030', '', 50.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 0.00, 'Wallet', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 test test 9665027030/', '17.7249333', '74.0399533', '7-1-2026 10:00 AM - 11:00 AM', '[[2,\"07-01-2026 10:59:15am\"]]', '2', 0, NULL, 138, 0, 50.00, 0.00, '2026-01-07 10:59:15', '2026-01-07 10:59:15', NULL, '3', '15', '2', '2', '5.0', NULL, NULL),
(174, 16, 7, '{\"final_total\":44,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '2598615847797', 335314, '9356484061', '', 44.00, 25.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 74.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '7-1-2026 11:00 AM - 12:00 PM', '[[2,\"07-01-2026 11:34:42am\"]]', '7', 0, NULL, 156, 0, 0.00, 0.00, '2026-01-07 11:34:42', '2026-01-07 11:34:56', NULL, '1', '5', '0', '5', '0.0', NULL, NULL),
(175, 16, 11, '{\"final_total\":200,\"bonus_type\":0,\"bonus_type_name\":\"Fixed\\/Salaried\",\"bonus_amount\":0}', 0, 0, '13879441895655', 225638, '9356484061', '', 200.00, 0.00, 0.00, 0.00, 0.00, 0.00, '\"[{\\\"title\\\":\\\"Handling Charge\\\",\\\"amount\\\":\\\"0\\\"}]\"', 0, '', 0.00, 205.00, 'COD', 'P2GQ+3V7, At POst Patkhal, Tal Dist, tal, Patkhal, Wasole, Maharashtra 415011, India   Wasole Maharashtra India-415011 anju 9356484061/', '17.7251443', '74.0397878', '8-1-2026 12:00 PM - 1:00 PM', '[[2,\"08-01-2026 12:46:05pm\"]]', '2', 0, NULL, 156, 0, 200.00, 205.00, '2026-01-08 12:46:05', '2026-01-08 12:46:05', NULL, '1', '5', '0', '8', '0.0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_order_bank_transfers`
--

CREATE TABLE `bl_order_bank_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `attachment` longtext NOT NULL,
  `message` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_order_items`
--

CREATE TABLE `bl_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `orders_id` varchar(191) NOT NULL,
  `product_name` text DEFAULT NULL,
  `variant_name` text DEFAULT NULL,
  `product_variant_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT 0,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `discounted_price` double NOT NULL,
  `tax_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `tax_percentage` double(8,2) NOT NULL DEFAULT 0.00,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `sub_total` double(8,2) NOT NULL,
  `status` varchar(191) NOT NULL,
  `active_status` varchar(191) NOT NULL,
  `cancellation_reason` text DEFAULT NULL,
  `canceled_at` timestamp NULL DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  `is_credited` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_order_items`
--

INSERT INTO `bl_order_items` (`id`, `user_id`, `order_id`, `orders_id`, `product_name`, `variant_name`, `product_variant_id`, `delivery_boy_id`, `quantity`, `price`, `discounted_price`, `tax_amount`, `tax_percentage`, `discount`, `sub_total`, `status`, `active_status`, `cancellation_reason`, `canceled_at`, `seller_id`, `is_credited`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 36, 1, '-456882794', 'Green Peas (Loose)', '500.00 gm', 98, 0, 1, 35.00, 30, 0.00, 0.00, 0.00, 30.00, '[[2,\"03-11-2025 06:15:49pm\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-03 19:16:06', 14, 0, '2025-11-03 18:15:49', '2025-11-03 19:16:06', NULL),
(2, 36, 1, '-456882794', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"03-11-2025 06:15:49pm\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-03 19:16:06', 14, 0, '2025-11-03 18:15:49', '2025-11-03 19:16:06', NULL),
(3, 36, 1, '-456882794', 'Onion', '1.00 kg', 111, 0, 1, 40.00, 30, 0.00, 0.00, 0.00, 30.00, '[[2,\"03-11-2025 06:15:49pm\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-03 19:16:06', 14, 0, '2025-11-03 18:15:49', '2025-11-03 19:16:06', NULL),
(4, 16, 2, '-1873140197', 'Green Peas (Loose)', '1.00 kg', 58, 0, 1, 70.00, 60, 0.00, 0.00, 0.00, 60.00, '[[2,\"03-11-2025 06:17:43pm\"]]', '7', 'I placed duplicate order', '2025-11-15 14:22:07', 14, 0, '2025-11-03 18:17:43', '2025-11-15 14:22:07', NULL),
(5, 37, 3, '243542465', 'Onion', '1.00 kg', 111, 0, 5, 40.00, 30, 0.00, 0.00, 0.00, 150.00, '[[2,\"03-11-2025 07:12:57pm\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-03 20:13:06', 14, 0, '2025-11-03 19:12:57', '2025-11-03 20:13:06', NULL),
(6, 11, 4, '1462188790', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"04-11-2025 08:55:26am\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-04 09:56:06', 14, 0, '2025-11-04 08:55:26', '2025-11-04 09:56:06', NULL),
(7, 11, 4, '1462188790', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"04-11-2025 08:55:26am\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-04 09:56:06', 14, 0, '2025-11-04 08:55:26', '2025-11-04 09:56:06', NULL),
(8, 11, 4, '1462188790', 'Onion', '1.00 kg', 111, 0, 1, 40.00, 30, 0.00, 0.00, 0.00, 30.00, '[[2,\"04-11-2025 08:55:26am\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-04 09:56:06', 14, 0, '2025-11-04 08:55:26', '2025-11-04 09:56:06', NULL),
(9, 13, 5, '646216014', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"04-11-2025 09:08:32am\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-04 10:09:06', 14, 0, '2025-11-04 09:08:33', '2025-11-04 10:09:06', NULL),
(10, 13, 5, '646216014', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"04-11-2025 09:08:32am\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-04 10:09:06', 14, 0, '2025-11-04 09:08:33', '2025-11-04 10:09:06', NULL),
(11, 36, 6, '155686206', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"04-11-2025 10:23:22am\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-04 11:24:06', 14, 0, '2025-11-04 10:23:22', '2025-11-04 11:24:06', NULL),
(12, 36, 6, '155686206', 'Onion', '1.00 kg', 111, 0, 2, 40.00, 30, 0.00, 0.00, 0.00, 60.00, '[[2,\"04-11-2025 10:23:22am\"]]', '7', 'Auto-cancelled after 60 minutes (Payment not completed)', '2025-11-04 11:24:06', 14, 0, '2025-11-04 10:23:22', '2025-11-04 11:24:06', NULL),
(13, 36, 7, '-300203155', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"04-11-2025 10:23:48am\"]]', '6', NULL, NULL, 14, 1, '2025-11-04 10:23:48', '2025-11-06 09:51:55', NULL),
(14, 36, 7, '-300203155', 'Onion', '1.00 kg', 111, 0, 2, 40.00, 30, 0.00, 0.00, 0.00, 60.00, '[[2,\"04-11-2025 10:23:48am\"]]', '6', NULL, NULL, 14, 1, '2025-11-04 10:23:48', '2025-11-06 09:51:55', NULL),
(15, 40, 8, '-1481421920', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"04-11-2025 10:35:49am\"]]', '5', NULL, NULL, 14, 0, '2025-11-04 10:35:49', '2025-11-04 10:37:53', NULL),
(16, 40, 9, '1678819577', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"04-11-2025 10:49:41am\"]]', '6', NULL, NULL, 14, 1, '2025-11-04 10:49:41', '2025-11-06 09:51:55', NULL),
(17, 41, 10, '479577210', 'Onion', '1.00 kg', 111, 0, 5, 40.00, 30, 0.00, 0.00, 0.00, 150.00, '[[2,\"04-11-2025 11:17:29am\"]]', '5', NULL, NULL, 14, 0, '2025-11-04 11:17:29', '2025-11-04 12:07:47', NULL),
(18, 37, 11, '-1013385289', 'Onion', '1.00 kg', 111, 0, 3, 40.00, 30, 0.00, 0.00, 0.00, 90.00, '[[2,\"04-11-2025 11:33:43am\"]]', '7', 'I am not at home', '2025-11-04 12:01:27', 14, 0, '2025-11-04 11:33:43', '2025-11-04 12:01:27', NULL),
(19, 10, 12, '1825484201', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"04-11-2025 04:04:24pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-04 16:04:24', '2025-11-04 16:50:06', NULL),
(20, 10, 12, '1825484201', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"04-11-2025 04:04:24pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-04 16:04:24', '2025-11-04 16:50:06', NULL),
(21, 10, 13, '624078805', 'Onion', '0.50 kg', 2, 0, 1, 20.00, 16, 0.00, 0.00, 0.00, 16.00, '[[2,\"04-11-2025 05:32:16pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-04 17:32:16', '2025-11-04 17:36:29', NULL),
(23, 10, 15, '1643536805', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[1,\"04-11-2025 05:40:23pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-04 17:40:23', '2025-11-06 09:51:55', NULL),
(24, 13, 16, '-1501051363', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"06-11-2025 10:30:35am\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 10:30:35', '2025-11-06 11:15:53', NULL),
(25, 13, 16, '-1501051363', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"06-11-2025 10:30:35am\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 10:30:35', '2025-11-06 11:15:53', NULL),
(26, 10, 17, '30836060', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"06-11-2025 10:59:28am\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 10:59:28', '2025-11-06 11:44:46', NULL),
(27, 44, 18, '-1597682301', 'Garlic', '0.25 kg', 126, 0, 1, 75.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"06-11-2025 11:01:44am\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 11:01:44', '2025-11-06 11:16:27', NULL),
(28, 44, 18, '-1597682301', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"06-11-2025 11:01:44am\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 11:01:44', '2025-11-06 11:16:27', NULL),
(29, 24, 19, '-301126021', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"06-11-2025 02:37:00pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 14:37:00', '2025-11-06 14:42:16', NULL),
(30, 46, 20, '-374152164', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"06-11-2025 03:39:47pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 15:39:47', '2025-11-06 15:45:44', NULL),
(31, 11, 21, '1151575203', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"06-11-2025 04:53:34pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-06 16:53:34', '2025-11-08 06:25:17', NULL),
(32, 45, 22, '-252343218', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"06-11-2025 05:21:40pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 17:21:40', '2025-11-07 11:23:26', NULL),
(33, 10, 23, '625879250', 'Garlic', '0.25 kg', 126, 0, 1, 75.00, 50, 0.00, 0.00, 0.00, 50.00, '[[1,\"06-11-2025 06:03:39pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-06 18:03:39', '2025-11-08 06:25:17', NULL),
(34, 10, 23, '625879250', 'Potato', '1.00 kg', 106, 0, 2, 50.00, 38, 0.00, 0.00, 0.00, 76.00, '[[1,\"06-11-2025 06:03:39pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-06 18:03:39', '2025-11-08 06:25:17', NULL),
(35, 10, 24, '-1903879293', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[1,\"06-11-2025 06:08:09pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-06 18:08:09', '2025-11-08 06:25:17', NULL),
(36, 47, 25, '-552909046', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"06-11-2025 06:20:14pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 18:20:14', '2025-11-07 11:22:31', NULL),
(44, 49, 33, '-2081641768', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"06-11-2025 07:01:19pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-06 19:01:19', '2025-11-07 11:00:10', NULL),
(45, 24, 34, '1938971733', 'Onion', '1.00 kg', 111, 0, 1, 40.00, 30, 0.00, 0.00, 0.00, 30.00, '[[2,\"07-11-2025 09:42:05am\"]]', '5', NULL, NULL, 14, 0, '2025-11-07 09:42:05', '2025-11-07 10:43:58', NULL),
(46, 10, 35, '921710262', 'Onion', '0.50 kg', 2, 0, 4, 20.00, 16, 0.00, 0.00, 0.00, 64.00, '[[2,\"07-11-2025 11:18:19am\"]]', '6', NULL, NULL, 14, 1, '2025-11-07 11:18:19', '2025-11-20 16:19:02', NULL),
(48, 10, 37, '-124757249', 'Onion', '0.50 kg', 2, 0, 1, 20.00, 16, 0.00, 0.00, 0.00, 16.00, '[[2,\"07-11-2025 12:01:33pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-07 12:01:33', '2025-11-07 12:02:18', NULL),
(49, 16, 38, '1397355017', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"07-11-2025 12:30:48pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-07 12:30:49', '2025-11-09 08:05:05', NULL),
(50, 10, 39, '-1155228696', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"07-11-2025 12:38:19pm\"]]', '3', NULL, NULL, 14, 0, '2025-11-07 12:38:19', '2025-11-07 12:39:21', NULL),
(51, 10, 40, '-1811566474', 'Potato', '0.50 kg', 3, 0, 2, 25.00, 20, 0.00, 0.00, 0.00, 40.00, '[[2,\"07-11-2025 12:42:43pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-07 12:42:43', '2025-11-07 12:43:46', NULL),
(52, 10, 41, '-1287410507', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"07-11-2025 12:45:35pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-07 12:45:35', '2025-11-18 16:19:08', NULL),
(53, 10, 42, '-933496735', 'Potato', '0.50 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"07-11-2025 12:49:22pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-07 12:49:22', '2025-11-09 08:05:05', NULL),
(54, 45, 43, '87388307', 'Potato', '1.00 kg', 106, 0, 2, 50.00, 38, 0.00, 0.00, 0.00, 76.00, '[[1,\"07-11-2025 02:50:01pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-07 14:50:01', '2025-11-09 08:05:05', NULL),
(55, 52, 44, '1932153609', 'Onion', '1.00 kg', 111, 0, 5, 40.00, 30, 0.00, 0.00, 0.00, 150.00, '[[2,\"07-11-2025 04:48:38pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-07 16:48:38', '2025-11-07 16:49:02', NULL),
(56, 40, 45, '815628877', 'Onion', '1.00 kg', 111, 0, 2, 40.00, 30, 0.00, 0.00, 0.00, 60.00, '[[2,\"07-11-2025 08:28:01pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-07 20:28:01', '2025-11-17 12:31:08', NULL),
(57, 40, 45, '815628877', 'Potato', '1.00 kg', 106, 0, 2, 50.00, 38, 0.00, 0.00, 0.00, 76.00, '[[2,\"07-11-2025 08:28:01pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-07 20:28:01', '2025-11-17 12:31:08', NULL),
(58, 40, 45, '815628877', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"07-11-2025 08:28:01pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-07 20:28:01', '2025-11-17 12:31:08', NULL),
(59, 45, 46, '-1961569999', 'Potato', '1.00 kg', 106, 0, 5, 50.00, 38, 0.00, 0.00, 0.00, 190.00, '[[1,\"08-11-2025 02:46:23pm\"]]', '1', NULL, NULL, 14, 0, '2025-11-08 14:46:23', '2025-11-08 14:46:23', NULL),
(60, 16, 47, '-760347688', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[1,\"08-11-2025 03:31:21pm\"]]', '7', 'I forgot to add additional products/items', '2025-11-15 14:21:39', 14, 0, '2025-11-08 15:31:21', '2025-11-15 14:21:39', NULL),
(61, 10, 48, '-610464677', 'Onion', '0.50 kg', 2, 0, 1, 20.00, 16, 0.00, 0.00, 0.00, 16.00, '[[1,\"08-11-2025 03:35:32pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-08 15:35:32', '2025-11-20 16:19:02', NULL),
(62, 44, 49, '620529434', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"08-11-2025 04:54:59pm\"]]', '7', 'I placed a wrong order', '2025-11-08 16:56:02', 14, 0, '2025-11-08 16:54:59', '2025-11-08 16:56:02', NULL),
(63, 44, 50, '1291364212', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"08-11-2025 04:57:03pm\"]]', '7', 'I placed a wrong order', '2025-11-08 16:57:41', 14, 0, '2025-11-08 16:57:03', '2025-11-08 16:57:41', NULL),
(64, 44, 51, '1785386611', 'Potato', '1.00 kg', 106, 0, 1, 50.00, 38, 0.00, 0.00, 0.00, 38.00, '[[2,\"08-11-2025 04:58:55pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-08 16:58:55', '2025-11-08 17:47:04', NULL),
(65, 16, 52, '627898644', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"09-11-2025 03:02:24pm\"]]', '7', 'I am not available to pickup', '2025-11-09 15:03:41', 14, 0, '2025-11-09 15:02:24', '2025-11-09 15:03:41', NULL),
(66, 38, 53, '-169387883', 'Onion', '1.00 kg', 111, 0, 1, 40.00, 30, 0.00, 0.00, 0.00, 30.00, '[[2,\"10-11-2025 06:18:33pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-10 18:18:33', '2025-11-12 10:22:29', NULL),
(67, 80, 54, '654441036', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"11-11-2025 12:49:36pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-11 12:49:37', '2025-11-11 15:45:32', NULL),
(68, 80, 54, '654441036', 'Garlic', '0.25 kg', 126, 0, 1, 75.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"11-11-2025 12:49:36pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-11 12:49:37', '2025-11-11 15:45:32', NULL),
(70, 11, 56, '-1875414553', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"13-11-2025 04:56:01am\"]]', '6', NULL, NULL, 14, 1, '2025-11-13 04:56:01', '2025-11-16 10:00:57', NULL),
(71, 11, 56, '-1875414553', 'Turmeric Powder', '200.00 gm', 151, 0, 1, 95.00, 66, 0.00, 0.00, 0.00, 66.00, '[[2,\"13-11-2025 04:56:01am\"]]', '6', NULL, NULL, 14, 1, '2025-11-13 04:56:01', '2025-11-14 11:30:35', NULL),
(72, 11, 56, '-1875414553', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"13-11-2025 04:56:01am\"]]', '6', NULL, NULL, 14, 1, '2025-11-13 04:56:01', '2025-11-16 10:00:57', NULL),
(73, 11, 56, '-1875414553', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"13-11-2025 04:56:01am\"]]', '6', NULL, NULL, 14, 1, '2025-11-13 04:56:01', '2025-11-15 09:57:36', NULL),
(78, 83, 61, '-101191408', 'Indrayani Rice', '500.00 gm', 133, 0, 1, 45.00, 44, 0.00, 0.00, 0.00, 44.00, '[[2,\"14-11-2025 03:24:27pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-14 15:24:27', '2025-11-14 17:19:31', NULL),
(79, 16, 62, '-1276885286', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"15-11-2025 03:49:20pm\"]]', '7', 'I placed a wrong order', '2025-11-15 16:34:59', 14, 0, '2025-11-15 15:49:20', '2025-11-15 16:34:59', NULL),
(80, 16, 63, '1445781794', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"15-11-2025 05:06:23pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-15 17:06:23', '2025-11-18 10:21:00', NULL),
(81, 16, 64, '2113226703', 'Turmeric Powder', '500.00 gm', 92, 0, 1, 235.00, 170, 0.00, 0.00, 0.00, 170.00, '[[2,\"15-11-2025 05:27:22pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-15 17:27:22', '2025-11-15 17:48:19', NULL),
(82, 16, 65, '-666940531', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"15-11-2025 05:48:35pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-15 17:48:35', '2025-11-18 10:21:00', NULL),
(83, 16, 66, '-520045316', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"16-11-2025 10:40:17am\"]]', '2', NULL, NULL, 15, 0, '2025-11-16 10:40:17', '2025-11-16 10:40:17', NULL),
(84, 16, 67, '-378339195', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"16-11-2025 10:43:36am\"]]', '2', NULL, NULL, 15, 0, '2025-11-16 10:43:36', '2025-11-16 10:43:36', NULL),
(85, 16, 68, '1998536342', 'Turmeric Powder', '500.00 gm', 92, 0, 1, 235.00, 170, 0.00, 0.00, 0.00, 170.00, '[[2,\"16-11-2025 10:44:46am\"]]', '2', NULL, NULL, 15, 0, '2025-11-16 10:44:46', '2025-11-16 10:44:46', NULL),
(86, 16, 69, '-1939700194', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"16-11-2025 10:55:43am\"]]', '7', 'I placed duplicate order', '2025-11-24 12:50:58', 15, 0, '2025-11-16 10:55:43', '2025-11-24 12:50:58', NULL),
(87, 16, 70, '-1088226770', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"16-11-2025 11:13:18am\"]]', '2', NULL, NULL, 15, 0, '2025-11-16 11:13:18', '2025-11-16 11:13:18', NULL),
(88, 16, 71, '1910551496', 'Onion', '0.50 kg', 2, 0, 1, 20.00, 16, 0.00, 0.00, 0.00, 16.00, '[[2,\"16-11-2025 11:32:05am\"]]', '2', NULL, NULL, 15, 0, '2025-11-16 11:32:05', '2025-11-16 11:32:05', NULL),
(89, 16, 72, '-1122342216', 'Onion', '0.50 kg', 2, 0, 1, 20.00, 16, 0.00, 0.00, 0.00, 16.00, '[[1,\"17-11-2025 11:08:34am\"]]', '1', NULL, NULL, 15, 0, '2025-11-17 11:08:34', '2025-11-17 11:08:34', NULL),
(90, 16, 73, '-1327617298', 'Onion', '0.50 kg', 2, 0, 1, 20.00, 10, 0.00, 0.00, 0.00, 10.00, '[[1,\"17-11-2025 11:18:46am\"]]', '1', NULL, NULL, 15, 0, '2025-11-17 11:18:46', '2025-11-17 11:18:46', NULL),
(91, 78, 74, '557479910', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"17-11-2025 11:34:22am\"]]', '5', NULL, NULL, 14, 0, '2025-11-17 11:34:22', '2025-11-17 12:28:13', NULL),
(92, 16, 75, '-460528764', 'Onion', '0.50 kg', 2, 0, 1, 20.00, 10, 0.00, 0.00, 0.00, 10.00, '[[1,\"17-11-2025 11:36:48am\"]]', '1', NULL, NULL, 14, 0, '2025-11-17 11:36:48', '2025-11-17 11:36:48', NULL),
(94, 78, 77, '-944829827', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"17-11-2025 12:40:00pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-17 12:40:00', '2025-11-17 12:43:44', NULL),
(95, 16, 78, '-2007017289', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"20-11-2025 11:02:49am\"]]', '2', NULL, NULL, 14, 0, '2025-11-20 11:02:49', '2025-11-20 11:02:49', NULL),
(96, 31, 79, '1890813990', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"20-11-2025 11:04:03am\"]]', '2', NULL, NULL, 14, 0, '2025-11-20 11:04:03', '2025-11-20 11:04:03', NULL),
(98, 16, 81, '-817972500', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"20-11-2025 11:12:50am\"]]', '6', NULL, NULL, 14, 1, '2025-11-20 11:12:50', '2025-11-24 10:04:14', NULL),
(99, 16, 82, '-2057782514', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"20-11-2025 11:38:12am\"]]', '5', NULL, NULL, 14, 0, '2025-11-20 11:38:12', '2025-11-20 11:39:20', NULL),
(100, 16, 83, '1370274755', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"20-11-2025 12:16:45pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-20 12:16:45', '2025-11-24 10:04:14', NULL),
(101, 10, 84, '1650089148', 'Rajma', '500.00 gm', 171, 0, 2, 121.00, 85, 0.00, 0.00, 0.00, 170.00, '[[2,\"20-11-2025 03:30:21pm\"]]', '2', NULL, NULL, 14, 0, '2025-11-20 15:30:21', '2025-11-20 15:42:05', NULL),
(102, 10, 85, '-621250385', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"20-11-2025 03:54:36pm\"]]', '2', NULL, NULL, 14, 0, '2025-11-20 15:54:36', '2025-11-20 15:54:36', NULL),
(103, 10, 86, '-1108718949', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"20-11-2025 04:15:47pm\"]]', '2', NULL, NULL, 14, 0, '2025-11-20 16:15:48', '2025-11-20 16:15:48', NULL),
(104, 10, 87, '844694814', 'Whole Moong', '500.00 gm', 51, 0, 1, 92.00, 86, 0.00, 0.00, 0.00, 86.00, '[[2,\"20-11-2025 04:29:15pm\"]]', '7', 'I am unable to make payment', '2025-11-24 13:39:03', 14, 0, '2025-11-20 16:29:15', '2025-11-24 13:39:03', NULL),
(106, 88, 89, '1519675143', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[1,\"20-11-2025 04:46:58pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-20 16:46:59', '2025-11-24 10:04:15', NULL),
(108, 16, 91, '308197164', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"20-11-2025 05:18:22pm\"]]', '7', 'I placed duplicate order', '2025-11-24 12:53:15', 14, 0, '2025-11-20 17:18:22', '2025-11-24 12:53:15', NULL),
(109, 16, 92, '1187321100', 'Whole Moong', '500.00 gm', 51, 0, 1, 92.00, 86, 0.00, 0.00, 0.00, 86.00, '[[2,\"20-11-2025 05:21:10pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-20 17:21:10', '2025-11-20 17:44:18', NULL),
(110, 74, 93, '-412930410', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"20-11-2025 06:12:43pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-20 18:12:43', '2025-11-20 18:14:39', NULL),
(119, 91, 96, '-989496880', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"20-11-2025 10:04:04pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-20 22:04:04', '2025-11-21 11:31:19', NULL),
(120, 91, 96, '-989496880', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"20-11-2025 10:04:04pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-20 22:04:04', '2025-11-21 11:31:19', NULL),
(121, 91, 96, '-989496880', 'Whole Moong', '500.00 gm', 51, 0, 1, 92.00, 86, 0.00, 0.00, 0.00, 86.00, '[[2,\"20-11-2025 10:04:04pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-20 22:04:04', '2025-11-21 11:31:19', NULL),
(122, 13, 97, '1155849147', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"21-11-2025 10:33:46am\"]]', '5', NULL, NULL, 14, 0, '2025-11-21 10:33:46', '2025-11-21 11:31:05', NULL),
(123, 13, 97, '1155849147', 'Indrayani Rice', '1.00 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"21-11-2025 10:33:46am\"]]', '5', NULL, NULL, 14, 0, '2025-11-21 10:33:46', '2025-11-21 11:31:05', NULL),
(124, 16, 98, '-1243997282', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"21-11-2025 11:47:40am\"]]', '2', NULL, NULL, 14, 0, '2025-11-21 11:47:40', '2025-11-21 11:47:40', NULL),
(126, 16, 100, '-1912879186', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"21-11-2025 11:53:44am\"]]', '7', 'I am not available to pickup', '2025-11-24 12:51:56', 14, 0, '2025-11-21 11:53:44', '2025-11-24 12:51:56', NULL),
(127, 10, 101, '-1978895480', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[1,\"21-11-2025 03:30:03pm\"]]', '7', 'I am unable to make payment', '2025-11-24 13:35:36', 14, 0, '2025-11-21 15:30:03', '2025-11-24 13:35:36', NULL),
(129, 16, 103, '692308005', 'Garlic', '0.50 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"22-11-2025 03:09:48pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-22 15:09:48', '2025-12-04 11:58:36', NULL),
(130, 16, 104, '-962364627', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"22-11-2025 03:22:10pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-22 15:22:10', '2025-12-04 11:58:36', NULL),
(132, 16, 106, '-796914389', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"22-11-2025 05:41:12pm\"]]', '7', 'I placed a wrong order', '2025-11-24 12:50:01', 14, 0, '2025-11-22 17:41:12', '2025-11-24 12:50:01', NULL),
(133, 16, 107, '81373755', 'Rajma', '500.00 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"24-11-2025 12:46:21pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-24 12:46:21', '2025-11-27 09:48:56', NULL),
(134, 80, 108, '10104360681566', 'Rajma', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"25-11-2025 05:40:48am\"]]', '5', NULL, NULL, 14, 0, '2025-11-25 05:40:48', '2025-11-25 11:04:36', NULL),
(135, 97, 109, '11539298694952', 'Indrayani Rice', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"26-11-2025 02:53:33pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-26 14:53:33', '2025-11-26 17:04:17', NULL),
(136, 78, 110, '4098338356670', 'Garlic', '0.5 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"27-11-2025 05:13:23pm\"]]', '5', NULL, NULL, 14, 0, '2025-11-27 17:13:24', '2025-11-27 17:15:28', NULL),
(137, 16, 111, '6820807516246', 'Turmeric Powder', '500 gm', 92, 0, 1, 235.00, 170, 0.00, 0.00, 0.00, 170.00, '[[2,\"28-11-2025 10:32:14am\"]]', '7', 'I placed a wrong order', '2025-11-28 10:35:57', 14, 0, '2025-11-28 10:32:14', '2025-11-28 10:35:57', NULL),
(138, 16, 111, '6820807516246', 'Indrayani Rice', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"28-11-2025 10:32:14am\"]]', '7', 'I placed a wrong order', '2025-11-28 10:35:58', 14, 0, '2025-11-28 10:32:14', '2025-11-28 10:35:58', NULL),
(139, 16, 112, '17352126373554', 'Bottle Gourd*|*दुधी भोपळा', '1 unit', 25, 0, 1, 62.00, 36, 0.00, 0.00, 0.00, 36.00, '[[2,\"28-11-2025 03:29:43pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-28 15:29:43', '2025-12-04 11:58:36', NULL),
(140, 16, 113, '5434120765326', 'Bottle Gourd*|*दुधी भोपळा', '1 unit', 25, 0, 1, 62.00, 36, 0.00, 0.00, 0.00, 36.00, '[[2,\"28-11-2025 03:45:23pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-28 15:45:23', '2025-12-04 11:58:36', NULL),
(141, 16, 114, '3899158271427', 'Bottle Gourd*|*दुधी भोपळा', '1 unit', 25, 0, 1, 62.00, 36, 0.00, 0.00, 0.00, 36.00, '[[2,\"28-11-2025 03:46:49pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-28 15:46:49', '2025-12-04 11:58:36', NULL),
(142, 16, 115, '3544535719731', 'Potato*|*बटाटा', '0.5 kg', 3, 0, 1, 25.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"28-11-2025 04:43:02pm\"]]', '6', NULL, NULL, 14, 1, '2025-11-28 16:43:02', '2025-12-04 11:58:36', NULL),
(143, 16, 116, '6929110386187', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"30-11-2025 10:39:04am\"]]', '6', NULL, NULL, 14, 1, '2025-11-30 10:39:04', '2025-12-04 11:58:36', NULL),
(144, 16, 117, '2879767985275', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"01-12-2025 10:05:16am\"]]', '6', NULL, NULL, 14, 1, '2025-12-01 10:05:16', '2025-12-04 10:55:33', NULL),
(145, 16, 118, '11727292212054', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"01-12-2025 10:09:40am\"]]', '6', NULL, NULL, 14, 1, '2025-12-01 10:09:40', '2025-12-04 10:55:33', NULL),
(146, 16, 119, '16512790143933', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"01-12-2025 10:10:24am\"]]', '2', NULL, NULL, 14, 0, '2025-12-01 10:10:24', '2025-12-01 10:10:24', NULL),
(147, 16, 120, '16346924513798', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"01-12-2025 10:16:30am\"]]', '6', NULL, NULL, 14, 1, '2025-12-01 10:16:30', '2025-12-04 11:58:36', NULL),
(148, 16, 121, '14146515382943', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"01-12-2025 10:22:02am\"]]', '7', 'I am not available to pickup', '2025-12-01 10:24:35', 14, 0, '2025-12-01 10:22:02', '2025-12-01 10:24:35', NULL),
(149, 104, 122, '7536874661474', 'Garlic*|*लसूण', '0.25 kg', 126, 0, 1, 75.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"02-12-2025 01:36:03pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-02 13:36:03', '2025-12-02 13:36:03', NULL),
(150, 16, 123, '14450430932163', 'Turmeric Powder*|*हळद पावडर', '500 gm', 92, 0, 1, 235.00, 170, 0.00, 0.00, 0.00, 170.00, '[[2,\"04-12-2025 12:09:13pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-04 12:09:13', '2025-12-04 12:09:13', NULL),
(151, 78, 124, '10171055058652', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"08-12-2025 05:30:54pm\"]]', '7', 'I am not at home', '2025-12-10 17:14:27', 14, 0, '2025-12-08 17:30:54', '2025-12-10 17:14:27', NULL),
(152, 74, 125, '3645482917327', 'Turmeric Powder*|*हळद पावडर', '200 gm', 151, 0, 1, 95.00, 66, 0.00, 0.00, 0.00, 66.00, '[[1,\"10-12-2025 05:13:50pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-10 17:13:50', '2025-12-19 17:19:15', NULL),
(153, 74, 125, '3645482917327', 'Turmeric Powder*|*हळद पावडर', '500 gm', 92, 0, 2, 235.00, 170, 0.00, 0.00, 0.00, 340.00, '[[1,\"10-12-2025 05:13:50pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-10 17:13:50', '2025-12-19 17:19:15', NULL),
(154, 10, 126, '9453542766763', 'Dry Ginger Powder *|*सुंठ पावडर', '200 gm', 184, 0, 1, 120.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"10-12-2025 05:21:03pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-10 17:21:03', '2025-12-10 17:21:03', NULL),
(155, 16, 127, '12714177581383', 'Dry Ginger Powder *|*सुंठ पावडर', '100 gm', 183, 0, 1, 60.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"10-12-2025 05:23:37pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-10 17:23:37', '2025-12-10 17:23:37', NULL),
(156, 16, 128, '3303003078013', 'Potato*|*बटाटा', '1 gm', 3, 0, 1, 30.00, 15, 0.00, 0.00, 0.00, 15.00, '[[2,\"10-12-2025 05:25:59pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-10 17:25:59', '2025-12-10 17:25:59', NULL),
(157, 113, 129, '11658845441802', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"14-12-2025 10:42:27am\"]]', '2', NULL, NULL, 14, 0, '2025-12-14 10:42:27', '2025-12-14 10:42:27', NULL),
(158, 16, 130, '11000247382458', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"14-12-2025 10:53:08am\"]]', '2', NULL, NULL, 14, 0, '2025-12-14 10:53:08', '2025-12-14 10:53:08', NULL),
(159, 10, 131, '14471394639373', 'Garlic*|*लसूण', '0.5 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[1,\"16-12-2025 03:59:40pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-16 15:59:41', '2025-12-19 17:19:15', NULL),
(160, 116, 132, '11282729529684', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"17-12-2025 02:25:35pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-17 14:25:35', '2025-12-17 14:25:35', NULL),
(161, 16, 133, '12538339972699', 'Whole Moong*|*मूग संपूर्ण', '500 gm', 51, 0, 1, 92.00, 86, 0.00, 0.00, 0.00, 86.00, '[[2,\"17-12-2025 02:52:56pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-17 14:52:56', '2025-12-17 14:52:56', NULL),
(162, 15, 134, '4157094745344', 'Turmeric Powder*|*हळद पावडर', '200 gm', 151, 0, 1, 95.00, 66, 0.00, 0.00, 0.00, 66.00, '[[2,\"17-12-2025 04:52:59pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-17 16:53:00', '2025-12-19 17:19:15', NULL),
(163, 15, 134, '4157094745344', 'Dry Ginger Powder *|*सुंठ पावडर', '100 gm', 183, 0, 1, 60.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"17-12-2025 04:52:59pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-17 16:53:00', '2025-12-19 17:19:15', NULL),
(164, 117, 135, '6338321171425', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '0.5 kg', 133, 0, 2, 45.00, 44, 0.00, 0.00, 0.00, 88.00, '[[2,\"18-12-2025 12:26:46pm\"]]', '7', 'Order is delayed', '2025-12-18 12:53:25', 14, 0, '2025-12-18 12:26:46', '2025-12-18 12:53:25', NULL),
(165, 117, 135, '6338321171425', 'Onion', '0.5 kg', 2, 0, 1, 25.00, 18, 0.00, 0.00, 0.00, 18.00, '[[2,\"18-12-2025 12:26:46pm\"]]', '7', 'Order is delayed', '2025-12-18 12:53:26', 14, 0, '2025-12-18 12:26:46', '2025-12-18 12:53:26', NULL),
(166, 117, 136, '15050222983335', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"18-12-2025 01:08:52pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-18 13:08:52', '2025-12-21 20:31:59', NULL),
(167, 117, 136, '15050222983335', 'Garlic*|*लसूण', '0.5 kg', 28, 0, 2, 100.00, 75, 0.00, 0.00, 0.00, 150.00, '[[2,\"18-12-2025 01:08:52pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-18 13:08:52', '2025-12-21 20:31:59', NULL),
(168, 118, 137, '6884042358292', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"18-12-2025 01:28:50pm\"]]', '7', 'Order is delayed', '2025-12-18 13:29:12', 14, 0, '2025-12-18 13:28:50', '2025-12-18 13:29:12', NULL),
(169, 118, 137, '6884042358292', 'Onion', '0.5 kg', 2, 0, 2, 25.00, 18, 0.00, 0.00, 0.00, 36.00, '[[2,\"18-12-2025 01:28:50pm\"]]', '7', 'Order is delayed', '2025-12-18 13:29:13', 14, 0, '2025-12-18 13:28:50', '2025-12-18 13:29:13', NULL),
(170, 118, 137, '6884042358292', 'Garlic*|*लसूण', '0.5 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"18-12-2025 01:28:50pm\"]]', '7', 'Order is delayed', '2025-12-18 13:29:14', 14, 0, '2025-12-18 13:28:50', '2025-12-18 13:29:14', NULL),
(171, 118, 138, '10038199011498', 'Onion', '0.5 kg', 2, 0, 1, 25.00, 18, 0.00, 0.00, 0.00, 18.00, '[[2,\"18-12-2025 01:31:04pm\"]]', '7', 'Order is delayed', '2025-12-18 13:38:34', 14, 0, '2025-12-18 13:31:04', '2025-12-18 13:38:34', NULL),
(172, 118, 138, '10038199011498', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"18-12-2025 01:31:04pm\"]]', '7', 'Order is delayed', '2025-12-18 13:38:35', 14, 0, '2025-12-18 13:31:04', '2025-12-18 13:38:35', NULL),
(173, 118, 139, '12383513309372', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"18-12-2025 01:47:02pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-18 13:47:02', '2025-12-21 20:31:59', NULL),
(174, 118, 139, '12383513309372', 'Onion', '1 kg', 111, 0, 1, 50.00, 35, 0.00, 0.00, 0.00, 35.00, '[[2,\"18-12-2025 01:47:02pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-18 13:47:02', '2025-12-21 20:31:59', NULL),
(175, 118, 139, '12383513309372', 'Onion', '0.5 kg', 2, 0, 1, 25.00, 18, 0.00, 0.00, 0.00, 18.00, '[[2,\"18-12-2025 01:47:02pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-18 13:47:02', '2025-12-21 20:31:59', NULL),
(176, 118, 139, '12383513309372', 'Garlic*|*लसूण', '0.5 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"18-12-2025 01:47:02pm\"]]', '6', NULL, NULL, 14, 1, '2025-12-18 13:47:02', '2025-12-21 20:31:59', NULL),
(177, 118, 140, '7964881677497', 'Dry Ginger Powder *|*सुंठ पावडर', '100 gm', 183, 0, 1, 60.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"18-12-2025 02:42:32pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-18 14:42:32', '2025-12-18 14:42:32', NULL),
(178, 16, 141, '13453802067515', 'Onion', '0.5 kg', 2, 0, 1, 25.00, 18, 0.00, 0.00, 0.00, 18.00, '[[2,\"18-12-2025 04:09:13pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-18 16:09:13', '2025-12-18 16:09:13', NULL),
(179, 16, 142, '7938701410933', 'Whole Moong*|*मूग संपूर्ण', '500 gm', 51, 0, 1, 92.00, 86, 0.00, 0.00, 0.00, 86.00, '[[2,\"19-12-2025 09:53:42am\"]]', '2', NULL, NULL, 14, 0, '2025-12-19 09:53:42', '2025-12-19 09:53:42', NULL),
(180, 119, 143, '5852951733278', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"19-12-2025 12:54:28pm\"]]', '3', NULL, NULL, 14, 0, '2025-12-19 12:54:28', '2025-12-19 17:10:19', NULL),
(181, 16, 144, '9060672479326', 'Moringa Powder', '100 gm', 188, 0, 1, 130.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"20-12-2025 12:12:38pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-20 12:12:38', '2025-12-20 12:12:38', NULL),
(182, 16, 145, '6766361929409', 'Moringa Powder', '100 gm', 188, 0, 1, 130.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"20-12-2025 12:13:00pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-20 12:13:00', '2025-12-20 12:13:00', NULL),
(183, 16, 146, '10588546015258', 'Dry Ginger Powder *|*सुंठ पावडर', '100 gm', 183, 0, 1, 60.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"20-12-2025 04:48:47pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-20 16:48:47', '2025-12-20 16:48:47', NULL),
(188, 74, 148, '12872317285323', 'Garlic*|*लसूण', '0.5 kg', 28, 0, 1, 100.00, 75, 0.00, 0.00, 0.00, 75.00, '[[2,\"23-12-2025 01:31:55pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-23 13:31:55', '2025-12-23 13:31:55', NULL),
(189, 74, 148, '12872317285323', 'Cabbage*|*कोबी', '500 gm', 18, 0, 1, 40.00, 35, 0.00, 0.00, 0.00, 35.00, '[[2,\"23-12-2025 01:31:55pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-23 13:31:55', '2025-12-23 13:31:55', NULL),
(190, 74, 148, '12872317285323', 'Onion', '1 kg', 111, 0, 2, 50.00, 35, 0.00, 0.00, 0.00, 70.00, '[[2,\"23-12-2025 01:31:55pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-23 13:31:55', '2025-12-23 13:31:55', NULL),
(191, 74, 148, '12872317285323', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 2, 90.00, 88, 0.00, 0.00, 0.00, 176.00, '[[2,\"23-12-2025 01:31:55pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-23 13:31:55', '2025-12-23 13:31:55', NULL),
(192, 91, 149, '10590329379496', 'Cabbage*|*कोबी', '500 gm', 18, 0, 1, 40.00, 35, 0.00, 0.00, 0.00, 35.00, '[[2,\"24-12-2025 03:26:42am\"]]', '7', 'I placed a wrong order', '2026-01-01 07:11:41', 14, 0, '2025-12-24 03:26:42', '2026-01-01 07:11:41', NULL),
(193, 91, 149, '10590329379496', 'Beetroot*|*बीट', '500 gm', 16, 0, 1, 35.00, 30, 0.00, 0.00, 0.00, 30.00, '[[2,\"24-12-2025 03:26:42am\"]]', '7', 'I placed a wrong order', '2026-01-01 07:11:43', 14, 0, '2025-12-24 03:26:42', '2026-01-01 07:11:43', NULL),
(194, 91, 149, '10590329379496', 'Chilli- Green*|*हिरवी मिरची', '250 gm', 29, 0, 1, 30.00, 20, 0.00, 0.00, 0.00, 20.00, '[[2,\"24-12-2025 03:26:42am\"]]', '7', 'I placed a wrong order', '2026-01-01 07:11:43', 14, 0, '2025-12-24 03:26:42', '2026-01-01 07:11:43', NULL),
(195, 91, 149, '10590329379496', 'Capsicum Green*|* शिमला मिरची', '500 gm', 12, 0, 1, 35.00, 30, 0.00, 0.00, 0.00, 30.00, '[[2,\"24-12-2025 03:26:42am\"]]', '7', 'I placed a wrong order', '2026-01-01 07:11:44', 14, 0, '2025-12-24 03:26:42', '2026-01-01 07:11:44', NULL),
(196, 91, 149, '10590329379496', 'Onion', '1 kg', 111, 0, 1, 50.00, 35, 0.00, 0.00, 0.00, 35.00, '[[2,\"24-12-2025 03:26:42am\"]]', '7', 'I placed a wrong order', '2026-01-01 07:11:45', 14, 0, '2025-12-24 03:26:42', '2026-01-01 07:11:45', NULL),
(197, 91, 149, '10590329379496', 'Garlic*|*लसूण', '0.25 kg', 126, 0, 1, 75.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"24-12-2025 03:26:42am\"]]', '7', 'I placed a wrong order', '2026-01-01 07:11:45', 14, 0, '2025-12-24 03:26:42', '2026-01-01 07:11:45', NULL),
(198, 16, 150, '5944780412104', 'Moringa Powder', '100 gm', 188, 0, 1, 130.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"25-12-2025 01:52:19pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-25 13:52:19', '2025-12-25 13:52:19', NULL),
(199, 16, 151, '8330137985013', 'Moringa Powder', '100 gm', 188, 0, 2, 130.00, 100, 0.00, 0.00, 0.00, 200.00, '[[2,\"26-12-2025 12:11:19pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-26 12:11:19', '2025-12-26 12:11:19', NULL),
(200, 154, 152, '16477392037807', 'Onion*|*कांदा', '1 kg', 111, 0, 25, 50.00, 25, 0.00, 0.00, 0.00, 625.00, '[[2,\"27-12-2025 01:41:19pm\"]]', '5', NULL, NULL, 14, 0, '2025-12-27 13:41:19', '2025-12-27 16:52:32', NULL),
(201, 16, 153, '15369659364920', 'Cabbage*|*कोबी', '500 gm', 18, 0, 1, 40.00, 35, 0.00, 0.00, 0.00, 35.00, '[[2,\"27-12-2025 03:46:37pm\"]]', '3', NULL, NULL, 14, 0, '2025-12-27 15:46:37', '2025-12-27 16:08:55', NULL),
(202, 86, 154, '7519651295511', 'Moringa Powder', '100 gm', 188, 0, 2, 130.00, 100, 0.00, 0.00, 0.00, 200.00, '[[2,\"27-12-2025 05:06:00pm\"]]', '7', 'I am unable to make payment', '2025-12-27 17:08:41', 14, 0, '2025-12-27 17:06:00', '2025-12-27 17:08:41', NULL),
(203, 16, 155, '5784831485763', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"28-12-2025 11:07:50am\"]]', '2', NULL, NULL, 14, 0, '2025-12-28 11:07:50', '2025-12-28 11:07:50', NULL),
(204, 16, 156, '7968721507819', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"28-12-2025 11:12:36am\"]]', '2', NULL, NULL, 14, 0, '2025-12-28 11:12:36', '2025-12-28 11:12:36', NULL),
(205, 16, 156, '7968721507819', 'Moringa Powder', '100 gm', 188, 0, 1, 130.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"28-12-2025 11:12:36am\"]]', '2', NULL, NULL, 14, 0, '2025-12-28 11:12:36', '2025-12-28 11:12:36', NULL),
(206, 16, 156, '7968721507819', 'Beetroot Powder', '100 gm', 187, 0, 1, 125.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"28-12-2025 11:12:36am\"]]', '2', NULL, NULL, 14, 0, '2025-12-28 11:12:36', '2025-12-28 11:12:36', NULL),
(207, 16, 157, '7366576049674', 'Moringa Powder*|*मोरिंगा पावडर', '100 gm', 188, 0, 2, 130.00, 100, 0.00, 0.00, 0.00, 200.00, '[[2,\"29-12-2025 11:42:18am\"]]', '7', 'I am not available to pickup', '2025-12-29 11:42:30', 14, 0, '2025-12-29 11:42:18', '2025-12-29 11:42:30', NULL),
(208, 16, 158, '10927149005410', 'Moringa Powder*|*मोरिंगा पावडर', '100 gm', 188, 0, 2, 130.00, 100, 0.00, 0.00, 0.00, 200.00, '[[2,\"29-12-2025 03:46:36pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-29 15:46:36', '2025-12-29 15:46:36', NULL),
(209, 16, 158, '10927149005410', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"29-12-2025 03:46:36pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-29 15:46:36', '2025-12-29 15:46:36', NULL),
(210, 16, 159, '11443718447457', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"30-12-2025 05:42:13pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-30 17:42:13', '2025-12-30 17:42:13', NULL),
(211, 16, 159, '11443718447457', 'Moringa Powder*|*मोरिंगा पावडर', '100 gm', 188, 0, 2, 130.00, 100, 0.00, 0.00, 0.00, 200.00, '[[2,\"30-12-2025 05:42:13pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-30 17:42:13', '2025-12-30 17:42:13', NULL),
(212, 16, 160, '14996103427025', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"31-12-2025 10:44:35am\"]]', '2', NULL, NULL, 14, 0, '2025-12-31 10:44:35', '2025-12-31 10:44:35', NULL),
(213, 16, 160, '14996103427025', 'Moringa Powder*|*मोरिंगा पावडर', '100 gm', 188, 0, 2, 130.00, 100, 0.00, 0.00, 0.00, 200.00, '[[2,\"31-12-2025 10:44:35am\"]]', '2', NULL, NULL, 14, 0, '2025-12-31 10:44:35', '2025-12-31 10:44:35', NULL),
(214, 16, 161, '8486045467961', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"31-12-2025 07:33:30pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-31 19:33:30', '2025-12-31 19:33:30', NULL),
(215, 16, 162, '3612136178542', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"31-12-2025 07:35:11pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-31 19:35:11', '2025-12-31 19:35:11', NULL),
(216, 16, 163, '12137061200956', 'Onion*|*कांदा', '0.5 kg', 2, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"31-12-2025 07:37:20pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-31 19:37:20', '2025-12-31 19:37:20', NULL),
(217, 16, 163, '12137061200956', 'Moringa Powder*|*मोरिंगा पावडर', '50 gm', 188, 0, 2, 70.00, 50, 0.00, 0.00, 0.00, 100.00, '[[2,\"31-12-2025 07:37:20pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-31 19:37:20', '2025-12-31 19:37:20', NULL),
(218, 16, 163, '12137061200956', 'Beetroot Powder*|*बीटरूट पावडर', '100 gm', 187, 0, 1, 125.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"31-12-2025 07:37:20pm\"]]', '2', NULL, NULL, 14, 0, '2025-12-31 19:37:20', '2025-12-31 19:37:20', NULL),
(219, 16, 164, '12176473495087', 'Onion Super Saver', '500 gm', 194, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"01-01-2026 05:09:20pm\"]]', '2', NULL, NULL, 14, 0, '2026-01-01 17:09:20', '2026-01-01 17:09:20', NULL),
(220, 16, 164, '12176473495087', 'Moringa Powder*|*मोरिंगा पावडर', '50 gm', 188, 0, 2, 70.00, 50, 0.00, 0.00, 0.00, 100.00, '[[2,\"01-01-2026 05:09:20pm\"]]', '2', NULL, NULL, 14, 0, '2026-01-01 17:09:20', '2026-01-01 17:09:20', NULL),
(221, 16, 164, '12176473495087', 'Beetroot Powder*|*बीटरूट पावडर', '100 gm', 187, 0, 1, 125.00, 100, 0.00, 0.00, 0.00, 100.00, '[[2,\"01-01-2026 05:09:20pm\"]]', '2', NULL, NULL, 14, 0, '2026-01-01 17:09:20', '2026-01-01 17:09:20', NULL),
(222, 16, 165, '10512105367754', 'Onion Super Saver', '500 gm', 194, 0, 1, 25.00, 1, 0.00, 0.00, 0.00, 1.00, '[[2,\"02-01-2026 11:44:19am\"]]', '2', NULL, NULL, 14, 0, '2026-01-02 11:44:19', '2026-01-02 11:44:19', NULL),
(223, 16, 165, '10512105367754', 'Beetroot Powder*|*बीटरूट पावडर', '100 gm', 187, 0, 2, 125.00, 100, 0.00, 0.00, 0.00, 200.00, '[[2,\"02-01-2026 11:44:19am\"]]', '2', NULL, NULL, 14, 0, '2026-01-02 11:44:19', '2026-01-02 11:44:19', NULL),
(224, 155, 166, '3858294950311', 'Moringa Powder*|*मोरिंगा पावडर', '50 gm', 188, 0, 1, 70.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"03-01-2026 01:40:28pm\"]]', '5', NULL, NULL, 14, 0, '2026-01-03 13:40:28', '2026-01-03 14:42:06', NULL),
(225, 155, 167, '2857947521097', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"03-01-2026 04:32:50pm\"]]', '5', NULL, NULL, 14, 0, '2026-01-03 16:32:50', '2026-01-03 16:33:51', NULL),
(226, 16, 168, '5450780231140', 'Rajma*|*राजमा', '500 gm', 171, 0, 1, 121.00, 85, 0.00, 0.00, 0.00, 85.00, '[[2,\"03-01-2026 04:37:46pm\"]]', '5', NULL, NULL, 14, 0, '2026-01-03 16:37:46', '2026-01-03 16:38:32', NULL),
(227, 155, 169, '5841384790005', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '1 kg', 82, 0, 1, 90.00, 88, 0.00, 0.00, 0.00, 88.00, '[[2,\"03-01-2026 04:41:05pm\"]]', '5', NULL, NULL, 14, 0, '2026-01-03 16:41:05', '2026-01-03 16:41:40', NULL),
(228, 16, 170, '10704010034445', 'Tomato Ozone Washed', '1 kg', 193, 0, 1, 60.00, 53, 0.00, 0.00, 0.00, 53.00, '[[2,\"04-01-2026 11:05:59am\"]]', '2', NULL, NULL, 14, 0, '2026-01-04 11:05:59', '2026-01-04 11:05:59', NULL),
(229, 16, 171, '16100783933181', 'Moringa Powder*|*मोरिंगा पावडर', '50 gm', 188, 0, 4, 70.00, 50, 0.00, 0.00, 0.00, 200.00, '[[2,\"07-01-2026 10:43:58am\"]]', '7', 'I am not available to pickup', '2026-01-07 10:45:38', 14, 0, '2026-01-07 10:43:58', '2026-01-07 10:45:38', NULL),
(231, 10, 173, '15773755994062', 'Moringa Powder*|*मोरिंगा पावडर', '50 gm', 188, 0, 1, 70.00, 50, 0.00, 0.00, 0.00, 50.00, '[[2,\"07-01-2026 10:59:15am\"]]', '2', NULL, NULL, 14, 0, '2026-01-07 10:59:15', '2026-01-07 10:59:15', NULL),
(232, 16, 174, '2598615847797', 'Indrayani Rice*|*इंद्रायणी तांदूळ', '0.5 kg', 133, 0, 1, 45.00, 44, 0.00, 0.00, 0.00, 44.00, '[[2,\"07-01-2026 11:34:42am\"]]', '7', 'I am getting a better price elsewhere', '2026-01-07 11:34:56', 14, 0, '2026-01-07 11:34:42', '2026-01-07 11:34:56', NULL),
(233, 16, 175, '13879441895655', 'Moringa Powder*|*मोरिंगा पावडर', '50 gm', 188, 0, 4, 70.00, 50, 0.00, 0.00, 0.00, 200.00, '[[2,\"08-01-2026 12:46:05pm\"]]', '2', NULL, NULL, 14, 0, '2026-01-08 12:46:05', '2026-01-08 12:46:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_order_statuses`
--

CREATE TABLE `bl_order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL COMMENT '0 - Script, if not 0 id of related table',
  `user_type` int(11) NOT NULL COMMENT '0 - Script, 1 - Admin, 2 - User',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_order_statuses`
--

INSERT INTO `bl_order_statuses` (`id`, `order_id`, `order_item_id`, `status`, `created_by`, `user_type`, `created_at`) VALUES
(1, '1', 0, '2', 36, 2, '2025-11-03 18:15:49'),
(2, '2', 0, '2', 16, 2, '2025-11-03 18:17:43'),
(3, '2', 0, '3', 1, 1, '2025-11-03 18:22:55'),
(4, '2', 0, '5', 22, 4, '2025-11-03 18:23:01'),
(5, '3', 0, '2', 37, 2, '2025-11-03 19:12:57'),
(6, '4', 0, '2', 11, 2, '2025-11-04 08:55:26'),
(7, '5', 0, '2', 13, 2, '2025-11-04 09:08:33'),
(8, '6', 0, '2', 36, 2, '2025-11-04 10:23:22'),
(9, '7', 0, '2', 36, 2, '2025-11-04 10:23:48'),
(10, '8', 0, '2', 40, 2, '2025-11-04 10:35:49'),
(11, '8', 0, '3', 21, 3, '2025-11-04 10:37:32'),
(12, '8', 0, '5', 22, 4, '2025-11-04 10:37:53'),
(13, '7', 0, '3', 21, 3, '2025-11-04 10:39:36'),
(14, '9', 0, '2', 40, 2, '2025-11-04 10:49:41'),
(15, '9', 0, '3', 21, 3, '2025-11-04 10:50:26'),
(16, '7', 0, '5', 22, 4, '2025-11-04 11:11:59'),
(17, '10', 0, '2', 41, 2, '2025-11-04 11:17:29'),
(18, '10', 0, '3', 21, 3, '2025-11-04 11:30:06'),
(19, '11', 0, '2', 37, 2, '2025-11-04 11:33:43'),
(20, '11', 0, '3', 21, 3, '2025-11-04 11:57:22'),
(21, '7', 0, '6', 22, 4, '2025-11-04 11:59:53'),
(22, '11', 18, '7', 37, 2, '2025-11-04 12:01:27'),
(23, '10', 0, '5', 22, 4, '2025-11-04 12:07:47'),
(24, '10', 0, '6', 0, 4, '2025-11-04 06:53:47'),
(25, '9', 0, '5', 22, 4, '2025-11-04 14:56:38'),
(26, '9', 0, '6', 22, 4, '2025-11-04 14:57:25'),
(27, '12', 0, '2', 10, 2, '2025-11-04 16:04:24'),
(28, '12', 0, '3', 21, 3, '2025-11-04 16:20:25'),
(29, '12', 0, '5', 22, 4, '2025-11-04 16:50:06'),
(30, '12', 0, '6', 0, 4, '2025-11-04 11:28:33'),
(31, '12', 0, '6', 0, 4, '2025-11-04 11:29:11'),
(32, '13', 0, '2', 10, 2, '2025-11-04 17:32:16'),
(33, '13', 0, '3', 21, 3, '2025-11-04 17:36:01'),
(34, '13', 0, '5', 22, 4, '2025-11-04 17:36:29'),
(35, '13', 0, '6', 0, 4, '2025-11-04 12:07:52'),
(36, '15', 0, '3', 21, 3, '2025-11-04 17:42:20'),
(37, '15', 0, '5', 22, 4, '2025-11-04 17:42:41'),
(38, '15', 0, '6', 22, 4, '2025-11-04 17:43:33'),
(39, '16', 0, '2', 13, 2, '2025-11-06 10:30:35'),
(40, '16', 0, '3', 21, 3, '2025-11-06 10:34:35'),
(41, '17', 0, '2', 10, 2, '2025-11-06 10:59:28'),
(42, '17', 0, '3', 21, 3, '2025-11-06 11:00:03'),
(43, '18', 0, '2', 44, 2, '2025-11-06 11:01:44'),
(44, '18', 0, '3', 21, 3, '2025-11-06 11:02:18'),
(45, '16', 0, '5', 22, 4, '2025-11-06 11:15:53'),
(46, '18', 0, '5', 22, 4, '2025-11-06 11:16:27'),
(47, '16', 0, '6', 0, 4, '2025-11-06 06:13:13'),
(48, '17', 0, '5', 22, 4, '2025-11-06 11:44:46'),
(49, '18', 0, '6', 0, 4, '2025-11-06 06:18:42'),
(50, '17', 0, '6', 0, 4, '2025-11-06 06:19:28'),
(51, '19', 0, '2', 24, 2, '2025-11-06 14:37:00'),
(52, '19', 0, '3', 21, 3, '2025-11-06 14:42:11'),
(53, '19', 0, '5', 22, 4, '2025-11-06 14:42:16'),
(54, '19', 0, '6', 0, 4, '2025-11-06 09:26:54'),
(55, '20', 0, '2', 46, 2, '2025-11-06 15:39:47'),
(56, '20', 0, '3', 21, 3, '2025-11-06 15:40:34'),
(57, '20', 0, '5', 22, 4, '2025-11-06 15:45:44'),
(58, '20', 0, '6', 0, 4, '2025-11-06 10:26:36'),
(59, '21', 0, '2', 11, 2, '2025-11-06 16:53:34'),
(60, '21', 0, '3', 21, 3, '2025-11-06 17:14:07'),
(61, '22', 0, '2', 45, 2, '2025-11-06 17:21:40'),
(62, '22', 0, '3', 1, 1, '2025-11-06 17:29:53'),
(63, '23', 0, '3', 21, 3, '2025-11-06 18:05:03'),
(64, '23', 0, '5', 21, 3, '2025-11-06 18:05:11'),
(65, '23', 0, '6', 21, 3, '2025-11-06 18:05:19'),
(66, '24', 0, '6', 21, 3, '2025-11-06 18:09:40'),
(67, '25', 0, '2', 47, 2, '2025-11-06 18:20:14'),
(68, '21', 0, '5', 22, 4, '2025-11-06 18:36:53'),
(69, '21', 0, '6', 22, 4, '2025-11-06 18:37:23'),
(70, '33', 0, '2', 49, 2, '2025-11-06 19:01:19'),
(71, '33', 0, '3', 1, 1, '2025-11-07 08:52:10'),
(72, '34', 0, '2', 24, 2, '2025-11-07 09:42:05'),
(73, '34', 0, '3', 1, 1, '2025-11-07 09:44:21'),
(74, '25', 0, '3', 21, 3, '2025-11-07 10:32:25'),
(75, '34', 0, '5', 22, 4, '2025-11-07 10:43:58'),
(76, '34', 0, '6', 0, 4, '2025-11-07 05:27:35'),
(77, '33', 0, '5', 22, 4, '2025-11-07 11:00:10'),
(78, '33', 0, '6', 0, 4, '2025-11-07 05:47:05'),
(79, '35', 0, '2', 10, 2, '2025-11-07 11:18:19'),
(80, '25', 0, '5', 22, 4, '2025-11-07 11:22:31'),
(81, '25', 0, '6', 0, 4, '2025-11-07 05:53:09'),
(82, '22', 0, '5', 22, 4, '2025-11-07 11:23:26'),
(83, '22', 0, '6', 0, 4, '2025-11-07 05:53:54'),
(84, '37', 0, '2', 10, 2, '2025-11-07 12:01:33'),
(85, '37', 0, '3', 1, 1, '2025-11-07 12:02:12'),
(86, '37', 0, '5', 22, 4, '2025-11-07 12:02:18'),
(87, '38', 0, '2', 16, 2, '2025-11-07 12:30:49'),
(88, '38', 0, '3', 1, 1, '2025-11-07 12:31:33'),
(89, '38', 0, '5', 22, 4, '2025-11-07 12:31:41'),
(90, '38', 0, '6', 22, 4, '2025-11-07 12:37:03'),
(91, '39', 0, '2', 10, 2, '2025-11-07 12:38:19'),
(92, '39', 0, '3', 1, 1, '2025-11-07 12:39:21'),
(93, '40', 0, '2', 10, 2, '2025-11-07 12:42:43'),
(94, '40', 0, '3', 1, 1, '2025-11-07 12:43:18'),
(95, '40', 0, '5', 22, 4, '2025-11-07 12:43:46'),
(96, '41', 0, '2', 10, 2, '2025-11-07 12:45:35'),
(97, '41', 0, '3', 1, 1, '2025-11-07 12:45:59'),
(98, '41', 0, '5', 22, 4, '2025-11-07 12:46:12'),
(99, '42', 0, '2', 10, 2, '2025-11-07 12:49:22'),
(100, '42', 0, '3', 1, 1, '2025-11-07 12:50:08'),
(101, '42', 0, '5', 22, 4, '2025-11-07 12:50:22'),
(102, '42', 0, '6', 22, 4, '2025-11-07 12:56:09'),
(103, '43', 0, '3', 21, 3, '2025-11-07 14:54:02'),
(104, '43', 0, '5', 22, 4, '2025-11-07 14:55:23'),
(105, '43', 0, '6', 22, 4, '2025-11-07 15:10:28'),
(106, '44', 0, '2', 52, 2, '2025-11-07 16:48:38'),
(107, '44', 0, '3', 21, 3, '2025-11-07 16:48:57'),
(108, '44', 0, '5', 22, 4, '2025-11-07 16:49:02'),
(109, '44', 0, '6', 0, 4, '2025-11-07 11:20:37'),
(110, '45', 0, '2', 40, 2, '2025-11-07 20:28:01'),
(111, '45', 0, '3', 1, 1, '2025-11-08 10:59:09'),
(112, '49', 0, '2', 44, 2, '2025-11-08 16:54:59'),
(113, '49', 62, '7', 44, 2, '2025-11-08 16:56:02'),
(114, '50', 0, '2', 44, 2, '2025-11-08 16:57:03'),
(115, '50', 63, '7', 44, 2, '2025-11-08 16:57:41'),
(116, '51', 0, '2', 44, 2, '2025-11-08 16:58:55'),
(117, '51', 0, '3', 1, 1, '2025-11-08 17:32:00'),
(118, '51', 0, '5', 22, 4, '2025-11-08 17:47:04'),
(119, '51', 0, '6', 0, 4, '2025-11-08 12:26:18'),
(120, '52', 0, '2', 16, 2, '2025-11-09 15:02:24'),
(121, '52', 65, '7', 16, 2, '2025-11-09 15:03:41'),
(122, '47', 0, '3', 1, 1, '2025-11-10 10:34:04'),
(123, '53', 0, '2', 38, 2, '2025-11-10 18:18:33'),
(124, '53', 0, '3', 1, 1, '2025-11-11 10:16:16'),
(125, '53', 0, '5', 22, 4, '2025-11-11 10:24:15'),
(126, '53', 0, '6', 22, 4, '2025-11-11 10:39:47'),
(127, '54', 0, '2', 80, 2, '2025-11-11 12:49:37'),
(128, '54', 0, '3', 21, 3, '2025-11-11 15:44:06'),
(129, '54', 0, '5', 22, 4, '2025-11-11 15:45:32'),
(130, '54', 0, '6', 0, 4, '2025-11-12 06:48:52'),
(131, '56', 0, '2', 11, 2, '2025-11-13 04:56:01'),
(132, '56', 0, '3', 21, 3, '2025-11-13 10:58:46'),
(133, '56', 0, '5', 22, 4, '2025-11-13 18:10:45'),
(134, '56', 0, '6', 22, 4, '2025-11-13 18:57:43'),
(135, '61', 0, '2', 83, 2, '2025-11-14 15:24:27'),
(136, '61', 0, '3', 21, 3, '2025-11-14 15:48:19'),
(137, '61', 0, '5', 22, 4, '2025-11-14 17:19:31'),
(138, '47', 60, '7', 16, 2, '2025-11-15 14:21:39'),
(139, '2', 4, '7', 16, 2, '2025-11-15 14:22:07'),
(140, '62', 0, '2', 16, 2, '2025-11-15 15:49:20'),
(141, '62', 79, '7', 16, 2, '2025-11-15 16:34:59'),
(142, '63', 0, '2', 16, 2, '2025-11-15 17:06:23'),
(143, '63', 0, '3', 1, 1, '2025-11-15 17:06:57'),
(144, '63', 0, '5', 1, 1, '2025-11-15 17:21:45'),
(145, '63', 0, '6', 1, 1, '2025-11-15 17:25:20'),
(146, '64', 0, '2', 16, 2, '2025-11-15 17:27:22'),
(147, '64', 0, '3', 1, 1, '2025-11-15 17:29:37'),
(148, '64', 0, '5', 1, 1, '2025-11-15 17:33:15'),
(149, '64', 0, '6', 1, 1, '2025-11-15 17:46:03'),
(150, '65', 0, '2', 16, 2, '2025-11-15 17:48:35'),
(151, '65', 0, '3', 1, 1, '2025-11-15 17:50:19'),
(152, '65', 0, '5', 1, 1, '2025-11-15 17:53:35'),
(153, '65', 0, '6', 1, 1, '2025-11-15 17:57:28'),
(154, '66', 0, '2', 16, 2, '2025-11-16 10:40:17'),
(155, '67', 0, '2', 16, 2, '2025-11-16 10:43:36'),
(156, '68', 0, '2', 16, 2, '2025-11-16 10:44:46'),
(157, '69', 0, '2', 16, 2, '2025-11-16 10:55:43'),
(158, '70', 0, '2', 16, 2, '2025-11-16 11:13:18'),
(159, '71', 0, '2', 16, 2, '2025-11-16 11:32:05'),
(160, '74', 0, '2', 78, 2, '2025-11-17 11:34:22'),
(161, '74', 0, '3', 21, 3, '2025-11-17 11:34:41'),
(162, '74', 0, '5', 22, 4, '2025-11-17 12:28:13'),
(163, '74', 0, '6', 0, 4, '2025-11-17 06:58:42'),
(164, '45', 0, '5', 22, 4, '2025-11-17 12:31:08'),
(165, '45', 0, '6', 0, 4, '2025-11-17 07:01:33'),
(166, '77', 0, '2', 78, 2, '2025-11-17 12:40:00'),
(167, '77', 0, '3', 21, 3, '2025-11-17 12:43:16'),
(168, '77', 0, '5', 22, 4, '2025-11-17 12:43:44'),
(169, '77', 0, '6', 0, 4, '2025-11-17 07:14:32'),
(170, '41', 0, '6', 8, 4, '2025-11-18 11:10:40'),
(171, '78', 0, '2', 16, 2, '2025-11-20 11:02:49'),
(172, '79', 0, '2', 31, 2, '2025-11-20 11:04:03'),
(173, '81', 0, '2', 16, 2, '2025-11-20 11:12:50'),
(174, '81', 0, '3', 1, 1, '2025-11-20 11:16:38'),
(175, '81', 0, '5', 22, 4, '2025-11-20 11:21:39'),
(176, '81', 0, '6', 22, 4, '2025-11-20 11:28:41'),
(177, '82', 0, '2', 16, 2, '2025-11-20 11:38:12'),
(178, '82', 0, '3', 1, 1, '2025-11-20 11:38:52'),
(179, '82', 0, '5', 22, 4, '2025-11-20 11:39:20'),
(180, '83', 0, '2', 16, 2, '2025-11-20 12:16:45'),
(181, '83', 0, '3', 1, 1, '2025-11-20 12:19:22'),
(182, '83', 0, '5', 22, 4, '2025-11-20 12:22:09'),
(183, '83', 0, '6', 22, 4, '2025-11-20 12:22:54'),
(184, '84', 0, '2', 10, 2, '2025-11-20 15:30:21'),
(185, '84', 0, '3', 1, 1, '2025-11-20 15:32:04'),
(186, '84', 0, '2', 1, 1, '2025-11-20 15:32:08'),
(187, '84', 0, '5', 1, 1, '2025-11-20 15:41:55'),
(188, '84', 0, '2', 1, 1, '2025-11-20 15:42:05'),
(189, '35', 0, '3', 1, 1, '2025-11-20 15:47:42'),
(190, '35', 0, '5', 8, 4, '2025-11-20 15:47:58'),
(191, '35', 0, '6', 8, 4, '2025-11-20 15:48:21'),
(192, '48', 0, '3', 1, 1, '2025-11-20 15:49:36'),
(193, '48', 0, '6', 1, 1, '2025-11-20 15:49:47'),
(194, '85', 0, '2', 10, 2, '2025-11-20 15:54:36'),
(195, '87', 0, '2', 10, 2, '2025-11-20 16:29:15'),
(196, '89', 0, '3', 21, 3, '2025-11-20 16:47:45'),
(197, '89', 0, '6', 1, 1, '2025-11-20 16:51:06'),
(198, '91', 0, '2', 16, 2, '2025-11-20 17:18:22'),
(199, '92', 0, '2', 16, 2, '2025-11-20 17:21:10'),
(200, '92', 0, '3', 1, 1, '2025-11-20 17:22:00'),
(201, '92', 0, '5', 22, 4, '2025-11-20 17:22:22'),
(202, '92', 0, '6', 22, 4, '2025-11-20 17:23:34'),
(203, '93', 0, '2', 74, 2, '2025-11-20 18:12:43'),
(204, '93', 0, '3', 21, 3, '2025-11-20 18:14:22'),
(205, '93', 0, '5', 22, 4, '2025-11-20 18:14:39'),
(206, '93', 0, '6', 0, 4, '2025-11-20 12:45:20'),
(207, '96', 0, '2', 91, 2, '2025-11-20 22:04:04'),
(208, '97', 0, '2', 13, 2, '2025-11-21 10:33:46'),
(209, '97', 0, '3', 21, 3, '2025-11-21 11:00:58'),
(210, '96', 0, '3', 21, 3, '2025-11-21 11:01:31'),
(211, '97', 0, '5', 22, 4, '2025-11-21 11:31:05'),
(212, '96', 0, '5', 22, 4, '2025-11-21 11:31:19'),
(213, '98', 0, '2', 16, 2, '2025-11-21 11:47:40'),
(214, '97', 0, '6', 0, 4, '2025-11-21 06:22:48'),
(215, '100', 0, '2', 16, 2, '2025-11-21 11:53:44'),
(216, '96', 0, '6', 0, 4, '2025-11-21 06:29:37'),
(217, '103', 0, '2', 16, 2, '2025-11-22 15:09:48'),
(218, '103', 0, '3', 1, 1, '2025-11-22 15:20:14'),
(219, '103', 0, '5', 1, 1, '2025-11-22 15:20:25'),
(220, '104', 0, '2', 16, 2, '2025-11-22 15:22:10'),
(221, '104', 0, '3', 1, 1, '2025-11-22 15:22:33'),
(222, '104', 0, '5', 22, 4, '2025-11-22 15:22:50'),
(223, '106', 0, '2', 16, 2, '2025-11-22 17:41:12'),
(224, '107', 0, '2', 16, 2, '2025-11-24 12:46:21'),
(225, '107', 0, '3', 1, 1, '2025-11-24 12:47:11'),
(226, '107', 0, '5', 22, 4, '2025-11-24 12:47:33'),
(227, '107', 0, '6', 22, 4, '2025-11-24 12:48:47'),
(228, '106', 132, '7', 16, 2, '2025-11-24 12:50:01'),
(229, '69', 86, '7', 16, 2, '2025-11-24 12:50:58'),
(230, '100', 126, '7', 16, 2, '2025-11-24 12:51:56'),
(231, '91', 108, '7', 16, 2, '2025-11-24 12:53:15'),
(232, '101', 127, '7', 10, 2, '2025-11-24 13:35:36'),
(233, '87', 104, '7', 10, 2, '2025-11-24 13:39:03'),
(234, '108', 0, '2', 80, 2, '2025-11-25 05:40:48'),
(235, '108', 0, '3', 21, 3, '2025-11-25 10:49:31'),
(236, '108', 0, '5', 22, 4, '2025-11-25 11:04:36'),
(237, '109', 0, '2', 97, 2, '2025-11-26 14:53:33'),
(238, '109', 0, '3', 1, 1, '2025-11-26 17:04:04'),
(239, '109', 0, '5', 22, 4, '2025-11-26 17:04:17'),
(240, '109', 0, '6', 0, 4, '2025-11-26 11:50:37'),
(241, '110', 0, '2', 78, 2, '2025-11-27 17:13:24'),
(242, '110', 0, '3', 1, 1, '2025-11-27 17:15:11'),
(243, '110', 0, '5', 22, 4, '2025-11-27 17:15:28'),
(244, '110', 0, '6', 0, 4, '2025-11-27 11:46:37'),
(245, '111', 0, '2', 16, 2, '2025-11-28 10:32:14'),
(246, '112', 0, '2', 16, 2, '2025-11-28 15:29:43'),
(247, '113', 0, '2', 16, 2, '2025-11-28 15:45:23'),
(248, '114', 0, '2', 16, 2, '2025-11-28 15:46:49'),
(249, '115', 0, '2', 16, 2, '2025-11-28 16:43:02'),
(250, '116', 0, '2', 16, 2, '2025-11-30 10:39:04'),
(251, '117', 0, '2', 16, 2, '2025-12-01 10:05:16'),
(252, '118', 0, '2', 16, 2, '2025-12-01 10:09:40'),
(253, '119', 0, '2', 16, 2, '2025-12-01 10:10:24'),
(254, '120', 0, '2', 16, 2, '2025-12-01 10:16:30'),
(255, '121', 0, '2', 16, 2, '2025-12-01 10:22:02'),
(256, '121', 148, '7', 16, 2, '2025-12-01 10:24:35'),
(257, '122', 0, '2', 104, 2, '2025-12-02 13:36:03'),
(258, '117', 0, '6', 1, 1, '2025-12-04 10:39:33'),
(259, '118', 0, '6', 1, 1, '2025-12-04 10:40:12'),
(260, '115', 0, '6', 1, 1, '2025-12-04 10:55:51'),
(261, '116', 0, '6', 1, 1, '2025-12-04 10:56:07'),
(262, '113', 0, '6', 1, 1, '2025-12-04 10:56:40'),
(263, '114', 0, '6', 1, 1, '2025-12-04 10:56:56'),
(264, '111', 0, '6', 1, 1, '2025-12-04 10:57:30'),
(265, '112', 0, '6', 1, 1, '2025-12-04 10:57:48'),
(266, '104', 0, '6', 1, 1, '2025-12-04 10:58:55'),
(267, '103', 0, '6', 1, 1, '2025-12-04 10:59:54'),
(268, '120', 0, '6', 1, 1, '2025-12-04 11:00:36'),
(269, '123', 0, '2', 16, 2, '2025-12-04 12:09:13'),
(270, '124', 0, '2', 78, 2, '2025-12-08 17:30:54'),
(271, '124', 151, '7', 78, 2, '2025-12-10 17:14:27'),
(272, '125', 0, '3', 1, 1, '2025-12-10 17:21:00'),
(273, '126', 0, '2', 10, 2, '2025-12-10 17:21:03'),
(274, '127', 0, '2', 16, 2, '2025-12-10 17:23:37'),
(275, '128', 0, '2', 16, 2, '2025-12-10 17:25:59'),
(276, '129', 0, '2', 113, 2, '2025-12-14 10:42:27'),
(277, '130', 0, '2', 16, 2, '2025-12-14 10:53:08'),
(278, '132', 0, '2', 116, 2, '2025-12-17 14:25:35'),
(279, '133', 0, '2', 16, 2, '2025-12-17 14:52:56'),
(280, '134', 0, '2', 15, 2, '2025-12-17 16:53:00'),
(281, '135', 0, '2', 117, 2, '2025-12-18 12:26:46'),
(282, '135', 0, '3', 1, 1, '2025-12-18 12:43:48'),
(283, '136', 0, '2', 117, 2, '2025-12-18 13:08:52'),
(284, '137', 0, '2', 118, 2, '2025-12-18 13:28:50'),
(285, '138', 0, '2', 118, 2, '2025-12-18 13:31:04'),
(286, '139', 0, '2', 118, 2, '2025-12-18 13:47:02'),
(287, '140', 0, '2', 118, 2, '2025-12-18 14:42:32'),
(288, '141', 0, '2', 16, 2, '2025-12-18 16:09:13'),
(289, '142', 0, '2', 16, 2, '2025-12-19 09:53:42'),
(290, '125', 0, '5', 22, 4, '2025-12-19 11:24:56'),
(291, '125', 0, '6', 22, 4, '2025-12-19 11:38:32'),
(292, '136', 0, '3', 21, 3, '2025-12-19 11:39:32'),
(293, '134', 0, '3', 21, 3, '2025-12-19 11:40:21'),
(294, '139', 0, '3', 21, 3, '2025-12-19 11:42:04'),
(295, '143', 0, '2', 119, 2, '2025-12-19 12:54:28'),
(296, '134', 0, '5', 22, 4, '2025-12-19 13:44:59'),
(297, '134', 0, '6', 22, 4, '2025-12-19 13:54:07'),
(298, '139', 0, '5', 22, 4, '2025-12-19 14:40:29'),
(299, '139', 0, '6', 22, 4, '2025-12-19 14:41:39'),
(300, '136', 0, '5', 22, 4, '2025-12-19 14:43:07'),
(301, '136', 0, '6', 22, 4, '2025-12-19 14:43:46'),
(302, '131', 0, '3', 21, 3, '2025-12-19 15:11:21'),
(303, '131', 0, '5', 22, 4, '2025-12-19 15:11:29'),
(304, '131', 0, '6', 22, 4, '2025-12-19 15:19:24'),
(305, '135', 0, '5', 22, 4, '2025-12-19 15:19:47'),
(306, '135', 0, '6', 22, 4, '2025-12-19 15:46:04'),
(307, '143', 0, '3', 21, 3, '2025-12-19 17:10:19'),
(308, '144', 0, '2', 16, 2, '2025-12-20 12:12:38'),
(309, '145', 0, '2', 16, 2, '2025-12-20 12:13:00'),
(310, '146', 0, '2', 16, 2, '2025-12-20 16:48:47'),
(311, '148', 0, '2', 74, 2, '2025-12-23 13:31:55'),
(312, '149', 0, '2', 91, 2, '2025-12-24 03:26:42'),
(313, '149', 0, '3', 1, 1, '2025-12-24 09:57:01'),
(314, '150', 0, '2', 16, 2, '2025-12-25 13:52:19'),
(315, '151', 0, '2', 16, 2, '2025-12-26 12:11:19'),
(316, '152', 0, '2', 154, 2, '2025-12-27 13:41:19'),
(317, '152', 0, '3', 21, 3, '2025-12-27 13:44:49'),
(318, '153', 0, '3', 21, 3, '2025-12-27 16:08:55'),
(319, '152', 0, '5', 22, 4, '2025-12-27 16:52:32'),
(320, '152', 0, '6', 0, 4, '2025-12-27 11:23:13'),
(321, '154', 0, '2', 86, 2, '2025-12-27 17:06:00'),
(322, '154', 202, '7', 86, 2, '2025-12-27 17:08:41'),
(323, '155', 0, '2', 16, 2, '2025-12-28 11:07:50'),
(324, '156', 0, '2', 16, 2, '2025-12-28 11:12:36'),
(325, '157', 0, '2', 16, 2, '2025-12-29 11:42:18'),
(326, '157', 207, '7', 16, 2, '2025-12-29 11:42:30'),
(327, '158', 0, '2', 16, 2, '2025-12-29 15:46:36'),
(328, '159', 0, '2', 16, 2, '2025-12-30 17:42:13'),
(329, '160', 0, '2', 16, 2, '2025-12-31 10:44:35'),
(330, '163', 0, '2', 16, 2, '2025-12-31 19:37:20'),
(331, '164', 0, '2', 16, 2, '2026-01-01 17:09:21'),
(332, '165', 0, '2', 16, 2, '2026-01-02 11:44:19'),
(333, '166', 0, '2', 155, 2, '2026-01-03 13:40:28'),
(334, '166', 0, '5', 1, 1, '2026-01-03 14:42:06'),
(335, '167', 0, '2', 155, 2, '2026-01-03 16:32:50'),
(336, '167', 0, '5', 1, 1, '2026-01-03 16:33:51'),
(337, '168', 0, '2', 16, 2, '2026-01-03 16:37:46'),
(338, '168', 0, '3', 1, 1, '2026-01-03 16:38:28'),
(339, '168', 0, '5', 1, 1, '2026-01-03 16:38:32'),
(340, '169', 0, '2', 155, 2, '2026-01-03 16:41:05'),
(341, '169', 0, '3', 1, 1, '2026-01-03 16:41:36'),
(342, '169', 0, '5', 1, 1, '2026-01-03 16:41:40'),
(343, '170', 0, '2', 16, 2, '2026-01-04 11:05:59'),
(344, '171', 229, '7', 16, 2, '2026-01-07 10:45:38'),
(345, '174', 0, '2', 16, 2, '2026-01-07 11:34:42'),
(346, '174', 232, '7', 16, 2, '2026-01-07 11:34:56'),
(347, '175', 0, '2', 16, 2, '2026-01-08 12:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `bl_order_status_lists`
--

CREATE TABLE `bl_order_status_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_order_status_lists`
--

INSERT INTO `bl_order_status_lists` (`id`, `status`) VALUES
(1, 'Payment Pending'),
(2, 'Received'),
(3, 'Processed'),
(5, 'Out For Delivery'),
(6, 'Delivered'),
(7, 'Cancelled'),
(8, 'Returned');

-- --------------------------------------------------------

--
-- Table structure for table `bl_order_trackings`
--

CREATE TABLE `bl_order_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `shiprocket_order_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `courier_company_id` int(11) DEFAULT NULL,
  `awb_code` varchar(191) DEFAULT NULL,
  `tracking_url` varchar(191) DEFAULT NULL,
  `pickup_status` int(11) NOT NULL,
  `pickup_scheduled_date` varchar(191) NOT NULL,
  `pickup_token_number` varchar(191) NOT NULL,
  `status` int(11) NOT NULL,
  `others` varchar(191) NOT NULL,
  `pickup_generated_date` varchar(191) NOT NULL,
  `data` varchar(191) NOT NULL,
  `date` varchar(191) NOT NULL,
  `is_canceled` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_panel_notifications`
--

CREATE TABLE `bl_panel_notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_password_resets`
--

CREATE TABLE `bl_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_payments`
--

CREATE TABLE `bl_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `txnid` varchar(191) NOT NULL,
  `payment_amount` decimal(8,2) NOT NULL,
  `payment_status` varchar(191) NOT NULL,
  `itemid` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_payment_requests`
--

CREATE TABLE `bl_payment_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(191) NOT NULL,
  `payment_address` varchar(191) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_permissions`
--

CREATE TABLE `bl_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_permissions`
--

INSERT INTO `bl_permissions` (`id`, `name`, `guard_name`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'manage_dashboard', 'web', 1, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(2, 'order_list', 'web', 2, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(3, 'order_update', 'web', 2, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(4, 'order_delete', 'web', 2, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(5, 'category_list', 'web', 3, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(6, 'category_create', 'web', 3, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(7, 'category_update', 'web', 3, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(8, 'category_delete', 'web', 3, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(9, 'manage_categories_order', 'web', 3, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(10, 'product_list', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(11, 'product_create', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(12, 'product_update', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(13, 'product_delete', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(14, 'manage_media', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(15, 'manage_product_bulk_upload', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(16, 'manage_product_order', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(17, 'approve_requests', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(18, 'product_ratings', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(19, 'taxes', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(20, 'brands', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(21, 'stock_management', 'web', 4, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(22, 'seller_list', 'web', 5, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(23, 'seller_create', 'web', 5, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(24, 'seller_update', 'web', 5, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(25, 'seller_delete', 'web', 5, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(26, 'seller_requests', 'web', 5, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(27, 'seller_wallet_transactions', 'web', 5, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(28, 'home_slider_image_list', 'web', 6, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(29, 'home_slider_image_create', 'web', 6, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(30, 'home_slider_image_update', 'web', 6, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(31, 'home_slider_image_delete', 'web', 6, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(32, 'new_offer_image_list', 'web', 7, '2025-08-12 12:01:24', '2025-08-12 12:01:24'),
(33, 'new_offer_image_create', 'web', 7, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(34, 'new_offer_image_update', 'web', 7, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(35, 'new_offer_image_delete', 'web', 7, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(36, 'promo_code_list', 'web', 8, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(37, 'promo_code_create', 'web', 8, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(38, 'promo_code_update', 'web', 8, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(39, 'promo_code_delete', 'web', 8, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(40, 'return_request_list', 'web', 9, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(41, 'return_request_update', 'web', 9, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(42, 'return_request_delete', 'web', 9, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(43, 'withdrawal_request_list', 'web', 10, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(44, 'withdrawal_request_update', 'web', 10, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(45, 'withdrawal_request_delete', 'web', 10, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(46, 'delivery_boy_list', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(47, 'delivery_boy_create', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(48, 'delivery_boy_update', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(49, 'delivery_boy_delete', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(50, 'fund_transfers_list', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(51, 'fund_transfers_create', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(52, 'cash_collection_list', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(53, 'cash_collection_create', 'web', 11, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(54, 'notification_list', 'web', 12, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(55, 'notification_create', 'web', 12, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(56, 'notification_delete', 'web', 12, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(57, 'email_templates', 'web', 13, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(58, 'create_email_template', 'web', 13, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(59, 'delete_email_template', 'web', 13, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(60, 'manage_emails', 'web', 13, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(61, 'create_email', 'web', 13, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(62, 'delete_email', 'web', 13, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(63, 'manage_time_slots', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(64, 'time_slot_create', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(65, 'time_slot_update', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(66, 'time_slot_delete', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(67, 'manage_store_settings', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(68, 'manage_units', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(69, 'unit_create', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(70, 'unit_update', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(71, 'manage_payment_methods', 'web', 14, '2025-08-12 12:01:25', '2025-08-12 12:01:25'),
(72, 'manage_Notification_settings', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(73, 'manage_contact_us', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(74, 'manage_about_us', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(75, 'manage_privacy_policy', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(76, 'manage_privacy_policy_delivery_boy', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(77, 'manage_privacy_policy_manager_app', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(78, 'manage_privacy_policy_seller_app', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(79, 'manage_secret_key', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(80, 'manage_shipping_methods', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(81, 'manage_system_registration', 'web', 14, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(82, 'general_settings', 'web', 15, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(83, 'manage_social_media_list', 'web', 15, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(84, 'manage_social_media_create', 'web', 15, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(85, 'manage_social_media_delete', 'web', 15, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(86, 'manage_social_media_update', 'web', 15, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(87, 'manage_about', 'web', 15, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(88, 'manage_policies', 'web', 15, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(89, 'city_list', 'web', 16, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(90, 'city_create', 'web', 16, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(91, 'city_update', 'web', 16, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(92, 'city_delete', 'web', 16, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(93, 'manage_deliverable_area', 'web', 16, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(94, 'featured_section_list', 'web', 17, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(95, 'featured_section_create', 'web', 17, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(96, 'featured_section_update', 'web', 17, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(97, 'featured_section_delete', 'web', 17, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(98, 'customer_list', 'web', 18, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(99, 'customer_update', 'web', 18, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(100, 'customer_delete', 'web', 18, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(101, 'manage_wishlists', 'web', 18, '2025-08-12 12:01:26', '2025-08-12 12:01:26'),
(102, 'transaction_list', 'web', 18, '2025-08-12 12:01:27', '2025-08-12 12:01:27'),
(103, 'manage_customer_wallet', 'web', 18, '2025-08-12 12:01:27', '2025-08-12 12:01:27'),
(104, 'product_sales_reports', 'web', 19, '2025-08-12 12:01:27', '2025-08-12 12:01:27'),
(105, 'sales_reports', 'web', 19, '2025-08-12 12:01:27', '2025-08-12 12:01:27'),
(106, 'faq_list', 'web', 20, '2025-08-12 12:01:27', '2025-08-12 12:01:27'),
(107, 'faq_create', 'web', 20, '2025-08-12 12:01:27', '2025-08-12 12:01:27'),
(108, 'faq_update', 'web', 20, '2025-08-12 12:01:27', '2025-08-12 12:01:27');

-- --------------------------------------------------------

--
-- Table structure for table `bl_permission_categories`
--

CREATE TABLE `bl_permission_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_permission_categories`
--

INSERT INTO `bl_permission_categories` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', NULL, NULL),
(2, 'order', 'web', NULL, NULL),
(3, 'category', 'web', NULL, NULL),
(4, 'product', 'web', NULL, NULL),
(5, 'seller', 'web', NULL, NULL),
(6, 'home_slider_image', 'web', NULL, NULL),
(7, 'new_offer_image', 'web', NULL, NULL),
(8, 'promo_code', 'web', NULL, NULL),
(9, 'return_request', 'web', NULL, NULL),
(10, 'withdrawal_request', 'web', NULL, NULL),
(11, 'delivery_boy', 'web', NULL, NULL),
(12, 'send_notification', 'web', NULL, NULL),
(13, 'email_template', 'web', NULL, NULL),
(14, 'system', 'web', NULL, NULL),
(15, 'web_settings', 'web', NULL, NULL),
(16, 'location', 'web', NULL, NULL),
(17, 'featured_section', 'web', NULL, NULL),
(18, 'customer', 'web', NULL, NULL),
(19, 'report', 'web', NULL, NULL),
(20, 'faq', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_personal_access_tokens`
--

CREATE TABLE `bl_personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_pickup_locations`
--

CREATE TABLE `bl_pickup_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) NOT NULL,
  `pickup_location` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `address` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `pin_code` varchar(191) NOT NULL,
  `latitude` varchar(191) NOT NULL,
  `longitude` varchar(191) NOT NULL,
  `verified` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_pincodes`
--

CREATE TABLE `bl_pincodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pincode` varchar(191) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_plans`
--

CREATE TABLE `bl_plans` (
  `id` int(11) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `free_delivery` varchar(191) NOT NULL DEFAULT '0',
  `min_order_for_free_delivery` varchar(191) NOT NULL,
  `reward_wallet_amount` varchar(191) NOT NULL,
  `gift_worth` varchar(191) NOT NULL,
  `become_member_image` varchar(191) DEFAULT NULL,
  `parent_ecocoin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_pos_additional_charges`
--

CREATE TABLE `bl_pos_additional_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pos_order_id` int(11) NOT NULL,
  `charge_name` varchar(191) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_pos_orders`
--

CREATE TABLE `bl_pos_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pos_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_pos_order_items`
--

CREATE TABLE `bl_pos_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pos_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_pos_users`
--

CREATE TABLE `bl_pos_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_pos_users`
--

INSERT INTO `bl_pos_users` (`id`, `name`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'test', '33333', '2025-09-29 15:28:36', '2025-09-29 15:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `bl_products`
--

CREATE TABLE `bl_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `row_order` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `tax_id` tinyint(4) DEFAULT 0,
  `brand_id` int(11) DEFAULT 0,
  `slug` varchar(191) NOT NULL,
  `category_id` int(11) NOT NULL,
  `cashback_point` varchar(191) DEFAULT NULL,
  `indicator` tinyint(4) DEFAULT NULL COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `manufacturer` varchar(191) DEFAULT NULL,
  `made_in` varchar(191) DEFAULT NULL,
  `return_status` tinyint(4) DEFAULT NULL,
  `cancelable_status` tinyint(4) DEFAULT NULL,
  `till_status` varchar(191) DEFAULT NULL,
  `image` text NOT NULL,
  `other_images` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `is_approved` int(11) DEFAULT NULL,
  `return_days` int(11) NOT NULL DEFAULT 0,
  `type` text DEFAULT NULL,
  `is_unlimited_stock` int(11) NOT NULL DEFAULT 0 COMMENT '0 = Limited & 1 = Unlimited',
  `cod_allowed` tinyint(4) NOT NULL,
  `total_allowed_quantity` int(11) NOT NULL,
  `tax_included_in_price` tinyint(4) NOT NULL DEFAULT 0,
  `fssai_lic_no` varchar(191) NOT NULL,
  `barcode` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `max_cashback_use` varchar(191) DEFAULT NULL,
  `offer_product` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_products`
--

INSERT INTO `bl_products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `cashback_point`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `fssai_lic_no`, `barcode`, `created_at`, `updated_at`, `deleted_at`, `meta_title`, `meta_keywords`, `schema_markup`, `meta_description`, `max_cashback_use`, `offer_product`) VALUES
(1, 1, 1348, 'Dragon Fruit*|*ड्रॅगन फळ', '', 0, 0, 'dragon-fruit-1-1-1-1-1-1', 9, '5', NULL, 'null', '0', 0, 1, '2', 'products/1762146319_74197.jpg', NULL, '<p>Dragon fruit, also known as pitaya, is a vibrant tropical fruit from the cactus family, prized for its striking appearance, refreshing taste, and impressive health benefits. With bright pink or yellow skin and green, flame-like scales, it reveals a soft white or deep magenta flesh speckled with tiny black seeds. Naturally low in calories yet rich in fiber, vitamin C, magnesium, and antioxidants, dragon fruit supports digestion, boosts immunity, and promotes healthy skin. Its mildly sweet, subtly floral flavor makes it perfect for eating fresh, blending into smoothies, or adding to salads and desserts. Easy to store and appealing to the eye, dragon fruit is both a nutritious superfood and a beautiful addition to any fresh produce offering.</p>', 1, 1, 0, 'loose', 0, 0, 5, 0, '', 'EFV0007', '2025-08-12 21:11:19', '2026-01-08 10:44:58', NULL, '', '', '', '', '5', 0),
(2, 1, 2, 'Onion*|*कांदा', '', 0, 0, 'onion-2-1-1-1-1-1-1-1-1', 1, '2', NULL, 'null', '0', 1, 1, '2', 'products/1760417412_68040.jpg', NULL, '<p data-start=\"202\" data-end=\"507\"><strong>Onions</strong> are a true kitchen essential, adding depth, aroma, and character to countless dishes. In Indian cuisine, they&rsquo;re more than just an ingredient &mdash; they&rsquo;re a tradition. From raw salads to sizzling curries, crispy pakoras to zesty salsas, onions bring a burst of freshness and flavour to every recipe.</p>\r\n<p data-start=\"509\" data-end=\"917\">Our onions are <strong data-start=\"524\" data-end=\"560\">fresh, firm, and naturally sweet</strong>, sourced directly from trusted local farms. Slice them into rings for burgers and sandwiches, dice them for a crunchy salad, or fry them to unlock their rich, pungent aroma &mdash; a result of their natural sulphur compounds. Packed with <strong data-start=\"793\" data-end=\"835\">biotin and antioxidant-rich flavonoids</strong>, especially in their outer layers, they&rsquo;re as nutritious as they are delicious.</p>\r\n<p data-start=\"919\" data-end=\"1158\">Whether you&rsquo;re preparing a comforting home-style curry or experimenting with global flavours, our handpicked onions promise <strong data-start=\"1043\" data-end=\"1088\">unmatched taste, quality, and versatility</strong> &mdash; bringing the authentic essence of India straight to your kitchen.</p>', 1, 1, 1, 'loose', 0, 1, 1000, 0, '', 'EcoOnion', '2025-08-13 12:14:15', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(3, 1, 16, 'Potato*|*बटाटा', '', 0, 0, 'potato-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1', 1, '5', NULL, 'null', '0', 1, 1, '2', 'products/1760417598_82991.jpg', NULL, '<p>Potato &mdash; the humble underground superstar of the vegetable world. 🥔</p>\r\n<p>It&rsquo;s a starchy tuber from the plant Solanum tuberosum, native to South America, but now loved in every corner of the globe. Boil it, mash it, fry it, roast it &mdash; it shapeshifts into comfort food in a thousand ways, from French fries to samosas. Nutritionally, it&rsquo;s a good source of carbs, potassium, vitamin C, and fiber (if you keep the skin).</p>', 1, 1, 1, 'loose', 0, 1, 1000, 0, '', 'VEG0009', '2025-08-13 12:58:08', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(4, 1, 1139, 'Pomegranates*|*डाळिंब', '', 0, 0, 'pomegranates-1-1', 2, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760364690_47323.jpg', NULL, '<p>Pomegranate is fresh, juicy, and naturally vibrant red inside with a burst of tangy sweetness. It can be enjoyed as fresh fruit, in salads, juices, smoothies, or used in traditional recipes. Carefully harvested and neatly packed, it brings the pure taste of nature&rsquo;s goodness straight from the farm to your table.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'FRU0005', '2025-08-13 14:11:25', '2025-11-29 19:04:25', NULL, '', '', '', '', '5', 0),
(5, 1, 1144, 'Coriander Leaves*|*कोथिंबीर', '', 0, 0, 'coriander-leaves-1-1', 4, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760502708_87604.jpg', NULL, '<p><strong>Coriander leaves</strong> &ndash; fresh, vibrant, and ready to use. Packed with a subtle citrusy flavour, they add aroma, taste, and a burst of green to your favourite dishes &ndash; no roots, no waste, just pure freshness.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'HBS0004', '2025-08-13 16:25:41', '2025-11-29 19:11:21', NULL, '', '', '', '', '5', 0),
(6, 1, 1141, 'Ginger*|*आले', '', 0, 0, 'ginger-1-1', 4, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760418453_60425.jpg', NULL, '<p><strong>Ginger </strong>brings you pure, aromatic, and zesty freshness. Known for its warm, spicy flavor and countless health benefits, it&rsquo;s perfect for adding depth to teas, curries, and stir-fries. Freshly sourced to retain its natural oils and pungent taste, our ginger is your go-to for both cooking and wellness.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'HBS0001', '2025-08-13 17:00:01', '2025-11-29 19:09:04', NULL, '', '', '', '', '5', 0),
(8, 1, 18, 'Tomato*|*टोमॅटो', '', 0, 0, 'tomato-2-1-1-1-1', 1, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760416964_47405.jpg', NULL, '<p><strong>Tomatoes</strong> &ndash; juicy, vibrant, and full of flavor. Packed with vitamins A, C, and antioxidants like lycopene, they boost immunity and promote heart health. Perfect for salads, curries, sauces, and sandwiches &ndash; bringing natural freshness to every meal!</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0010', '2025-08-13 17:42:14', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(9, 1, 1291, 'Chana Dal*|*चना डाळ', '', 0, 0, 'chana-dal-1-1-1-1-1-1', 6, '2', NULL, 'null', '0', 0, 1, '2', 'products/1766055783_44932.jpg', NULL, '<p><strong>Chana Dal </strong>&ndash; rich in protein, fiber, and essential minerals. A wholesome choice for dals, soups, and curries, it supports digestion, boosts energy, and keeps you full for longer. Pure, fresh, and perfect for healthy home-cooked meals.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0004', '2025-08-13 18:07:43', '2025-12-18 16:33:03', NULL, '', '', '', '', '5', 0),
(10, 1, 1293, 'Masoor Dal*|* मसूर डाळ', '', 0, 0, 'masoor-dal-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1766055934_9961.jpg', NULL, '<p>Masoor Dal &ndash; packed with plant-based protein, iron, and dietary fiber. This quick-cooking dal is perfect for making nutritious soups, dals, and khichdis, helping boost immunity, improve digestion, and maintain heart health.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0006', '2025-08-13 18:25:21', '2025-12-18 16:35:34', NULL, '', '', '', '', '5', 0),
(12, 1, 12, 'Capsicum Green*|* शिमला मिरची', '', 0, 0, 'capsicum-green-1-1-1-1-1', 1, '2', NULL, 'null', '0', 0, 0, 'null', 'products/1760360695_19847.jpg', NULL, '<p><strong data-start=\"80\" data-end=\"139\">Capsicum Green&nbsp;</strong><br data-start=\"139\" data-end=\"142\">Fresh, crisp, and vibrantly green, Capsicum offers a mild yet slightly tangy flavor that complements every dish. Perfect for salads, stir-fries, pizzas, and curries, they bring both crunch and nutrition to your plate. Packed with vitamins A &amp; C and rich in antioxidants, our green capsicum supports immunity, boosts overall health, and adds a burst of natural color and taste to your meals &mdash; straight from farm to table.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0007', '2025-08-14 10:21:40', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(13, 1, 6, 'Cauliflower - Small*|*फूलकोबी', '', 0, 0, 'cauliflower---small-1', 1, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760345791_69594.jpg', NULL, '<p><strong data-start=\"73\" data-end=\"124\">Cauliflower&nbsp;</strong></p>\r\n<p>Snowy white, crisp, and naturally fresh, Cauliflower is a versatile vegetable loved in kitchens worldwide. With its mild flavor and tender texture, it&rsquo;s perfect for making curries, stir-fries, parathas, soups, and even healthy snacks. Rich in vitamin C, fiber, and antioxidants, cauliflower supports immunity, aids digestion, and promotes overall wellness. Hand-picked with care, cauliflower brings wholesome nutrition and farm-fresh quality straight to your plate.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'VEG0011', '2025-08-14 10:46:44', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(14, 1, 10, 'Palak*|*पालक', '', 0, 0, 'palak-1-1-1', 1, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760360845_40009.jpg', NULL, '<p><strong data-start=\"70\" data-end=\"118\">Palak&nbsp;</strong><br data-start=\"118\" data-end=\"121\">Fresh, tender, and vibrantly green, packed with earthy flavor and essential nutrients. A powerhouse of iron, vitamins A, C &amp; K, calcium, and antioxidants, it helps boost immunity, improve bone health, and support overall wellness. Perfect for making palak paneer, parathas, soups, smoothies, and curries, our spinach is hand-picked to ensure maximum freshness and nutrition &mdash; bringing farm-fresh goodness straight to your kitchen.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'VEG0002', '2025-08-14 11:08:56', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(15, 1, 23, 'Drumstick / Moringa*|*शेवगा', '', 0, 0, 'drumstick-moringa-1-1-1-1-1-1', 1, '5', NULL, 'null', '0', 0, 1, '3', 'products/1760360354_88974.jpg', NULL, '<article class=\"text-token-text-primary w-full focus:outline-none scroll-mt-[calc(var(--header-height)+min(200px,max(70px,20svh)))]\" dir=\"auto\" tabindex=\"-1\" data-turn-id=\"request-WEB:41b47800-81fb-441f-bf05-b62e6db7830d-5\" data-testid=\"conversation-turn-12\" data-scroll-anchor=\"true\" data-turn=\"assistant\">\r\n<div class=\"text-base my-auto mx-auto pb-10 [--thread-content-margin:--spacing(4)] @[37rem]:[--thread-content-margin:--spacing(6)] @[72rem]:[--thread-content-margin:--spacing(16)] px-(--thread-content-margin)\">\r\n<div class=\"[--thread-content-max-width:32rem] @[34rem]:[--thread-content-max-width:40rem] @[64rem]:[--thread-content-max-width:48rem] mx-auto max-w-(--thread-content-max-width) flex-1 group/turn-messages focus-visible:outline-hidden relative flex w-full min-w-0 flex-col agent-turn\" tabindex=\"-1\">\r\n<div class=\"flex max-w-full flex-col grow\">\r\n<div class=\"min-h-8 text-message relative flex w-full flex-col items-end gap-2 text-start break-words whitespace-normal [.text-message+&amp;]:mt-5\" dir=\"auto\" data-message-author-role=\"assistant\" data-message-id=\"f3f2b204-bfa8-404f-945b-b7faaed8be4f\" data-message-model-slug=\"gpt-5\">\r\n<div class=\"flex w-full flex-col gap-1 empty:hidden first:pt-[3px]\">\r\n<div class=\"markdown prose dark:prose-invert w-full break-words light markdown-new-styling\">\r\n<p data-start=\"74\" data-end=\"557\" data-is-last-node=\"\" data-is-only-node=\"\"><strong data-start=\"74\" data-end=\"127\">Drumstick (Moringa) &ndash;&nbsp; Wholesome Goodness</strong><br data-start=\"127\" data-end=\"130\">Long, slender, and nutrient-rich,&nbsp; Drumsticks are prized for their unique flavor and incredible health benefits. Packed with vitamin C, calcium, iron, and antioxidants, they help strengthen immunity, support bone health, and promote digestion. Perfect for sambar, curries, soups, and stews, our farm-fresh drumsticks bring a delightful taste and wholesome nutrition to your meals &mdash; straight from nature to your plate.</p>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"flex min-h-[46px] justify-start\">&nbsp;</div>\r\n</div>\r\n</div>\r\n</article>\r\n<div class=\"pointer-events-none h-px w-px\" aria-hidden=\"true\" data-edge=\"true\">&nbsp;</div>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0006', '2025-08-14 12:52:15', '2026-01-02 10:06:28', NULL, '', '', '', '', '5', 0),
(16, 1, 13, 'Beetroot*|*बीट', '', 0, 0, 'beetroot-1-1-1-1-1-1-1', 1, '2', NULL, 'null', '0', 0, 1, '2', 'products/1760364022_79249.jpg', NULL, '<p><strong data-start=\"63\" data-end=\"116\">Beetroot &ndash; Natural Sweetness &amp; Nutrition</strong><br data-start=\"116\" data-end=\"119\">Deep red, naturally sweet, and loaded with goodness, Beetroot is a true superfood for your health. Rich in iron, folate, fiber, and antioxidants, it helps boost stamina, improve blood health, and support heart wellness. Perfect for salads, juices, soups, and curries, our farm-fresh beetroots add vibrant color, earthy sweetness, and powerful nutrition to your plate &mdash; straight from the fields to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0013', '2025-08-14 13:00:28', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(18, 1, 17, 'Cabbage*|*कोबी', '', 0, 0, 'cabbage-1-1-1-1-1-1-1-1', 1, '2', NULL, 'null', '0', 1, 1, '2', 'products/1760338368_89858.jpg', NULL, '<p><strong data-start=\"76\" data-end=\"96\">Cabbage</strong> is fresh, green, and naturally layered with crisp leaves. It can be used in salads, stir-fries, soups, or a variety of everyday dishes. Harvested with care and neatly packed, it brings wholesome freshness from the farm to your kitchen.</p>', 1, 1, 1, 'packet', 0, 0, 1000, 0, '', 'VEG0012', '2025-08-17 13:50:54', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(19, 1, 1140, 'Banana*|*केळी', '', 0, 0, 'banana-2-1', 2, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760363235_51635.jpg', NULL, '<p><strong data-start=\"85\" data-end=\"104\">Banana</strong> is naturally sweet and soft in texture. It can be enjoyed on its own, blended into smoothies, or added to a variety of dishes and desserts. Harvested with care and neatly packed, it brings natural goodness from the farm to your table.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'FRU0006', '2025-08-17 14:02:47', '2025-11-29 19:04:51', NULL, '', '', '', '', '5', 0),
(21, 1, 1352, 'Lady Finger*|*भेंडी', '', 0, 0, 'lady-finger-1-1-1-1', 1, '5', NULL, 'null', '0', 0, 1, '5', 'products/1760348255_66412.jpg', NULL, '<p><strong data-start=\"86\" data-end=\"110\">Lady Finger</strong> is fresh, tender, and green, known for its smooth texture and slim shape. It can be cooked in a variety of dishes, from traditional curries to stir-fries, adding wholesome taste to everyday meals. Carefully harvested and packed, it brings simple farm freshness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0004', '2025-08-17 14:48:50', '2026-01-08 17:45:12', NULL, '', '', '', '', '5', 0),
(22, 1, 9, 'Brinjal*|*वांगे', '', 0, 0, 'brinjal-1-1-1', 1, '5', NULL, 'null', '0', 1, 1, '2', 'products/1760358345_61736.jpg', NULL, '<p><strong data-start=\"89\" data-end=\"123\">Brinjal &ndash; Green Round</strong> is fresh and firm, with a smooth green skin and round shape. Commonly used in curries, stir-fries, and traditional recipes, it blends well with spices and flavors in everyday cooking. Harvested with care and neatly packed, it brings natural freshness to your meals.</p>', 1, 1, 0, 'packet', 0, 1, 1000, 0, '', 'VEG0001', '2025-08-17 15:05:24', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(23, 1, 8, 'Carrot*|* गाजर', '', 0, 0, 'carrot-1-1', 1, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760347614_38253.jpg', NULL, '<p><strong data-start=\"74\" data-end=\"93\">Carrot</strong> is fresh, firm, and naturally orange in color with a crisp texture. It can be enjoyed raw, in salads, juices, or cooked in a variety of dishes and desserts. Carefully harvested and packed, it adds simple farm freshness to your kitchen.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'VEG0015', '2025-08-17 15:10:54', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(24, 1, 11, 'Bitter Gourd*|*कारले', '', 0, 0, 'bitter-gourd-1-1-1-1', 1, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760346753_2218.jpg', NULL, '<p><strong data-start=\"80\" data-end=\"105\">Bitter Gourd</strong> is fresh and green with a distinct ridged texture. Commonly used in traditional curries, stir-fries, and stuffed preparations, it adds variety to everyday cooking. Harvested with care and neatly packed, it brings natural freshness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0003', '2025-08-17 15:18:29', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(25, 1, 15, 'Bottle Gourd*|*दुधी भोपळा', '', 0, 0, 'bottle-gourd-1-1-1-1-1-1-1-1-1-1-1-1', 1, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760361056_24507.jpg', NULL, '<p><strong data-start=\"80\" data-end=\"105\">Bottle Gourd</strong> is fresh, light green, and cylindrical in shape with a smooth texture. It is commonly used in curries, soups, and traditional dishes, adding a mild flavor to everyday meals. Harvested with care and neatly packed, it brings simple farm freshness to your kitchen.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'VEG0008', '2025-08-17 15:30:34', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(27, 1, 1146, 'Lemon*|*लिंबू', '', 0, 0, 'lemon-1-1', 4, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760418079_9053.jpg', NULL, '<p><strong data-start=\"73\" data-end=\"91\">Lemon</strong> is fresh, bright yellow, and firm with a natural tangy flavor. Commonly used in beverages, salads, marinades, and everyday cooking, it adds a refreshing touch to various dishes. Carefully picked and neatly packed, it brings simple farm freshness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'HBS0006', '2025-08-17 16:00:25', '2025-11-29 19:13:29', NULL, '', '', '', '', '5', 0),
(28, 1, 1340, 'Garlic*|*लसूण', '', 0, 0, 'garlic-1-1-1', 4, '5', NULL, 'null', '0', 1, 1, '2', 'products/1760502396_38174.jpg', NULL, '<p><strong data-start=\"74\" data-end=\"93\">Garlic</strong> is fresh, firm, and neatly clustered into white cloves with a natural pungent aroma. Commonly used in cooking, seasoning, and traditional recipes, it adds depth and flavor to a wide variety of dishes. Harvested with care and packed fresh, it brings natural simplicity to your kitchen.</p>', 1, 1, 1, 'loose', 0, 1, 1000, 0, '', 'HBS0002', '2025-08-17 16:27:42', '2025-12-30 13:20:57', NULL, '', '', '', '', '5', 1),
(29, 1, 1324, 'Chilli- Green*|*हिरवी मिरची', '', 0, 0, 'chilli--green-1-1-1-1', 4, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760418693_95108.jpg', NULL, '<p><strong data-start=\"85\" data-end=\"110\">Green Chilli</strong> is fresh, slender, and bright green in color with a natural pungent aroma. Commonly used in curries, pickles, tadkas, and seasonings, it adds a spicy touch to everyday cooking. Carefully picked and neatly packed, it brings simple freshness to your kitchen.</p>\r\n<p>&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'HBS0003', '2025-08-17 16:35:15', '2025-12-27 10:51:21', NULL, '', '', '', '', '5', 0),
(33, 1, 19, 'Beans*|*बीन्स', '', 0, 0, 'beans-1', 1, '5', NULL, 'null', '0', 0, 1, '2', 'products/1766645458_28458.jpg', NULL, '<p><strong data-start=\"82\" data-end=\"107\">&nbsp;Beans</strong> are fresh, slender, and tender with a smooth green texture. They are widely used in stir-fries, curries, pulao, and a variety of everyday dishes. Harvested with care and neatly packed, they bring natural freshness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0017', '2025-08-17 17:06:14', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(34, 1, 1145, 'Curry Leaves*|*कढीपत्ता', '', 0, 0, 'curry-leaves-1-1', 4, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760503658_80476.jpg', NULL, '<p><strong data-start=\"80\" data-end=\"105\">Curry Leaves</strong> are fresh, green, and aromatic with a natural leafy texture. Commonly used in tadkas, curries, dals, and chutneys, they add a traditional touch to everyday cooking. Carefully handpicked and neatly packed, they bring simple freshness to your kitchen.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'HBS0005', '2025-08-17 17:16:01', '2025-11-29 19:13:11', NULL, '', '', '', '', '5', 0),
(35, 1, 834, 'Neem Stem', '', 0, 0, 'Neem-Stem-1', 11, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1755431815_28528.jpg', NULL, '<p><strong data-start=\"77\" data-end=\"99\">Ecofresh Neem Stem</strong> is fresh, firm, and naturally woody. It is traditionally used for oral care and other household purposes. Carefully collected and neatly packed, it comes in its natural form from the farm.</p>', 1, 0, 0, 'loose', 0, 0, 1000, 0, '', '', '2025-08-17 17:26:55', '2025-10-15 14:01:57', NULL, '', '', '', '', '5', 0),
(36, 1, 3, 'Aloe Vera', '', 0, 0, 'Aloe-Vera-1-1', 1, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1755432326_46874.jpg', NULL, '<p><strong data-start=\"77\" data-end=\"99\">&nbsp;Aloe Vera</strong> is fresh, thick-leaved, and naturally green with a fleshy texture. It is widely used in household, culinary, and traditional purposes. Harvested with care and neatly packed, it comes in its natural form from the farm.</p>', 1, 0, 0, 'loose', 0, 0, 1000, 0, '', '', '2025-08-17 17:35:26', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(37, 1, 5, 'Ridge Gourd*|*दोडका', '', 0, 0, 'ridge-gourd-1-1', 1, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760358874_69074.jpg', NULL, '<p><strong data-start=\"79\" data-end=\"103\">Ridge Gourd</strong> is fresh, green, and ridged in texture with a tender inside. It is commonly used in curries, dals, and stir-fries, blending well with everyday recipes. Harvested with care and neatly packed, it brings natural freshness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'VEG0005', '2025-08-17 17:43:32', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(43, 1, 1136, 'Apple*|*सफरचंद', '', 0, 0, 'apple-1-1', 2, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760361930_22534.jpg', NULL, '<p><strong data-start=\"73\" data-end=\"91\">Apple</strong> is fresh, firm, and naturally crisp with a smooth outer skin. It can be enjoyed as a whole fruit, sliced into salads, or used in desserts and beverages. Carefully picked and neatly packed, it brings natural freshness to your table.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'FRU0002', '2025-08-17 18:31:03', '2025-11-29 19:03:16', NULL, '', '', '', '', '5', 0),
(44, 1, 1060, 'Papaya*|*पपई', '', 0, 0, 'papaya-1', 2, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760364180_15580.jpg', NULL, '<p><strong data-start=\"74\" data-end=\"93\">Papaya</strong> is fresh, firm, and naturally orange inside with a soft texture. It can be enjoyed as a ripe fruit, in salads, smoothies, or used in traditional recipes. Carefully picked and neatly packed, it brings simple farm freshness to your table.&nbsp;</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', '', '2025-08-17 18:33:41', '2025-11-28 18:17:22', NULL, '', '', '', '', '5', 0),
(45, 1, 1138, 'Guava*|*पेरू', '', 0, 0, 'guava-1-1-1', 2, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760365174_30613.jpg', NULL, '<p><strong data-start=\"73\" data-end=\"91\">Guava</strong> is fresh, round, and naturally green on the outside with a soft, juicy inside. It can be enjoyed as a whole fruit, sliced into salads, or used in juices and traditional recipes. Carefully picked and neatly packed, it brings natural freshness to your table.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'FRU0004', '2025-08-17 18:44:36', '2025-11-29 19:04:05', NULL, '', '', '', '', '5', 0),
(46, 1, 6, 'Pear - Green*|*नाशपती (हिरवी)', '', 0, 0, 'pear---green-1', 9, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760507364_60515.jpg', NULL, '<p><strong data-start=\"80\" data-end=\"105\">Pear &ndash; Green</strong> is fresh, firm, and naturally juicy with a smooth green skin and soft texture inside. It can be enjoyed as a whole fruit, sliced into salads, or used in desserts and beverages. Carefully picked and neatly packed, it brings simple farm freshness to your table.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'EFV0005', '2025-08-17 18:48:41', '2026-01-02 12:19:14', NULL, '', '', '', '', '5', 0),
(47, 1, 5, 'Kiwi - Green*|*कीवी', '', 0, 0, 'kiwi---green-1', 9, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760506456_14128.jpg', NULL, '<p><strong data-start=\"80\" data-end=\"105\">Kiwi &ndash; Green</strong> is fresh, oval-shaped, and naturally brown on the outside with a bright green, juicy inside. It can be enjoyed as a whole fruit, scooped fresh, or added to salads, smoothies, and desserts. Carefully picked and neatly packed, it brings natural freshness to your table.&nbsp;</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'EFV0004', '2025-08-17 18:50:30', '2026-01-02 12:19:14', NULL, '', '', '', '', '5', 0),
(48, 1, 1135, 'Orange*|*संत्रा', '', 0, 0, 'orange-1-1-1', 2, '5', NULL, 'null', '0', 0, 1, 'null', 'products/1760361406_50688.jpg', NULL, '<p><strong data-start=\"74\" data-end=\"93\">Orange</strong> is fresh, round, and bright with a naturally juicy inside. It can be enjoyed as a whole fruit, in fresh juices, or added to salads and desserts. Carefully picked and neatly packed, it brings simple farm freshness to your table.&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'FRU0001', '2025-08-17 18:53:33', '2025-11-29 19:02:55', NULL, '', '', '', '', '5', 0),
(50, 1, 1137, 'Custard Apple*|*सीताफळ', '', 0, 0, 'custard-apple-1-1', 2, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760362316_88610.jpg', NULL, '<p><strong data-start=\"81\" data-end=\"107\">Custard Apple</strong> is fresh, round, and green with a naturally segmented outer skin and soft, creamy pulp inside. It can be enjoyed as a whole fruit or scooped out for a sweet treat. Carefully picked and neatly packed, it brings natural farm freshness to your table.&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'FRU0003', '2025-08-17 18:59:44', '2025-11-29 19:03:44', NULL, '', '', '', '', '5', 0),
(51, 1, 1294, 'Raw Peanuts*|*कच्चे शेंगदाणे', '', 0, 0, 'raw-peanuts-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1766055997_59503.jpg', NULL, '<p><strong data-start=\"93\" data-end=\"119\">Peanuts (Raw)</strong> are fresh, whole, and naturally crunchy with a light brown shell. They can be used for roasting, cooking, making chutneys, or enjoyed as a snack. Carefully harvested and neatly packed, they bring simple farm freshness to your kitchen.&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0009', '2025-08-17 19:12:56', '2025-12-18 16:36:37', NULL, '', '', '', '', '5', 0),
(52, 1, 1297, 'Moong Dal*|*मूग डाळ', '', 0, 0, 'moong-dal-1-1-1-1', 6, '5', NULL, 'null', '0', 0, 1, '2', 'products/1766056266_19844.jpg', NULL, '<p><strong data-start=\"77\" data-end=\"99\">Moong Dal</strong> is clean, polished, and naturally yellow in color with a soft texture when cooked. It is commonly used in dals, khichdi, soups, and a variety of everyday recipes. Carefully processed and neatly packed, it brings simple farm freshness to your kitchen.&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0008', '2025-08-17 19:15:39', '2025-12-18 16:41:06', NULL, '', '', '', '', '5', 0),
(53, 1, 1282, 'Whole Moong*|*मूग संपूर्ण', '', 0, 0, 'whole-moong-1-1-1', 6, '5', NULL, 'null', '0', 0, 1, '2', 'products/1766053743_63862.jpg', NULL, '<p><strong data-start=\"66\" data-end=\"81\">Whole Moong</strong> is naturally green, clean, and unpolished, known for its rich nutrients and soft texture after cooking. It cooks quickly to a light, wholesome consistency, making it ideal for dals, sprouted salads, khichdi, and a variety of everyday recipes. Carefully processed and hygienically packed, it brings the pure goodness of fresh farm produce straight to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0011', '2025-08-17 19:17:39', '2025-12-18 15:59:03', NULL, '', '', '', '', '5', 0),
(57, 1, 2, 'Broccoli*|*ब्रोकली', '', 0, 0, 'broccoli-1-1', 9, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760504044_31864.jpg', NULL, '<p><strong>Broccoli </strong>&ndash; crisp, green, and packed with goodness. Rich in vitamins C, K, and folate along with fiber and powerful antioxidants, it supports immunity, bone strength, and heart health. Perfect for salads, stir-fries, soups, and pastas &ndash; bringing vibrant nutrition and freshness to every meal!</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'EFV0001', '2025-08-20 14:35:01', '2026-01-02 12:19:14', NULL, '', '', '', '', '5', 0),
(58, 1, 4, 'Dill Leaves*|*शेपू', '', 0, 0, 'dill-leaves-1-1', 9, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760506238_3000.jpg', NULL, '<p><strong>Dill Leaves</strong> &ndash; aromatic, delicate, and bursting with flavor. Rich in vitamins A and C, calcium, and antioxidants, they aid digestion, support bone health, and boost immunity. Perfect for garnishing curries, dals, salads, and pickles &ndash; adding a fresh, herby touch to every dish!</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'EFV0003', '2025-08-20 14:42:47', '2026-01-02 12:19:14', NULL, '', '', '', '', '5', 0),
(59, 1, 9, 'Sweet Corn*|*मक्का', '', 0, 0, 'sweet-corn-1-1-1', 9, '5', NULL, 'null', '0', 1, 1, '2', 'products/1760507599_48757.jpg', NULL, '<p><strong>Sweet Corn</strong> &ndash; golden, juicy, and naturally sweet. Packed with fiber, vitamins B &amp; C, and essential antioxidants, it supports digestion, boosts energy, and promotes overall wellness. Perfect for soups, salads, chaats, pastas, and snacks &ndash; bringing sweetness and nutrition to every bite!&nbsp;</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'EFV0006', '2025-08-20 14:49:16', '2026-01-02 12:19:14', NULL, '', '', '', '', '5', 0),
(60, 1, 7, 'Green Peas*|*हिरवा वाटाणा', '', 0, 0, 'green-peas-1-1', 1, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760345221_51052.jpg', NULL, '<p><strong data-start=\"63\" data-end=\"322\">Green Peas &ndash; </strong>Naturally sweet, tender, and farm-fresh! Packed with protein, fiber, and vitamins, they boost energy and immunity while adding taste to your meals. Perfect for curries, pulao, parathas, or salads &ndash; freshness that melts in every bite!</p>', 1, 1, 0, 'packet', 1, 1, 1000, 0, '', 'VEG0014', '2025-08-21 17:39:24', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(63, 1, 3, 'Capsicum Red*|*लाल शिमला मिरची', '', 0, 0, 'capsicum-red-1-1', 9, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760504569_61512.jpg', NULL, '<p><strong data-start=\"108\" data-end=\"165\">Capsicum Red&nbsp;</strong><br data-start=\"165\" data-end=\"168\">Bright, juicy, and naturally sweet, Red Capsicum is a vibrant delight for your kitchen. With its crisp texture and rich flavor, it&rsquo;s perfect for salads, pastas, stir-fries, pizzas, and roasted dishes. Bursting with vitamins A &amp; C, antioxidants like beta-carotene and lycopene, our red capsicum helps strengthen immunity, promotes healthy skin and eyes, and supports overall wellness. Add a splash of bold color, taste, and nutrition to your meals &mdash; straight from farm to table with purity.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'EFV0002', '2025-08-24 12:42:54', '2026-01-02 12:19:14', NULL, '', '', '', '', '5', 0),
(64, 1, 8, 'Capsicum Yellow*|*पिवळी शिमला मिरची', '', 0, 0, 'capsicum-yellow-1', 9, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760505990_94667.jpg', NULL, '<p data-start=\"70\" data-end=\"611\"><strong data-start=\"70\" data-end=\"130\">Capsicum Yellow&nbsp;</strong><br data-start=\"130\" data-end=\"133\">Sunny, sweet, and irresistibly crisp, Yellow Capsicum brings a cheerful burst of flavor and color to every dish. Its mild sweetness makes it ideal for salads, stir-fries, sandwiches, pizzas, and grilled recipes. Packed with vitamins A &amp; C, and rich in powerful antioxidants, our yellow capsicum helps boost immunity, supports eye health, and adds natural energy to your meals. Brighten up your plate with the golden goodness of straight from farm to table.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', '', '2025-08-24 14:28:41', '2026-01-02 12:19:14', NULL, '', '', '', '', '5', 0),
(65, 1, 1148, 'Moong (Green Gram) Sprouts*|*मूग', '', 0, 0, 'moong-green-gram-sprouts-1-1', 5, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760523098_33081.jpg', NULL, '<p><strong data-start=\"128\" data-end=\"199\">Moong (Green Gram) Sprouts&nbsp;</strong><br data-start=\"199\" data-end=\"202\">Fresh, crunchy, and power-packed with nutrition, Moong Sprouts are the ultimate superfood for your healthy lifestyle. Naturally rich in plant-based protein, dietary fiber, vitamins, and minerals, these sprouts are perfect for salads, chaats, curries, soups, and wholesome breakfasts. A natural source of Vitamin C, folate, and antioxidants, they boost immunity, aid digestion, support heart health, and keep you energized all day. Low in calories yet high in nourishment, Moong Sprouts bring you nature&rsquo;s goodness straight from farm to table &mdash; pure, fresh, and full of vitality.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'CTS0001', '2025-08-24 15:46:30', '2025-11-30 10:55:13', NULL, '', '', '', '', '5', 0),
(66, 1, 1149, 'Chana Sprouts*|*चना', '', 0, 0, 'chana-sprouts-1-1', 5, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760522514_70401.jpg', NULL, '<p><strong data-start=\"138\" data-end=\"210\">Chana (Bengal Gram) Sprouts&nbsp;</strong><br data-start=\"210\" data-end=\"213\">Nutty, filling, and packed with energy, Chana Sprouts are a powerhouse of plant-based nutrition. Loaded with protein, iron, fiber, and essential vitamins, they make an excellent choice for strengthening muscles, improving digestion, and boosting stamina. Rich in antioxidants, folate, and minerals, chana sprouts support heart health, regulate blood sugar, and keep you active through the day. Enjoy them in salads, chaats, curries, or as a wholesome snack Chana Sprouts bring you pure goodness, straight from farm to table, for a healthier tomorrow.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'CTS0002', '2025-08-24 16:06:52', '2025-11-30 10:55:35', NULL, '', '', '', '', '5', 0),
(67, 1, 859, 'Matki (Moth Beans) Sprouts', '', 0, 0, 'matki-moth-beans-sprouts-1-1-1-1', 5, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1759141513_99800.jpg', NULL, '<p data-start=\"133\" data-end=\"791\"><strong data-start=\"133\" data-end=\"204\">Matki (Moth Beans) Sprouts &ndash;&nbsp; Promise of Purity &amp; Freshness</strong><br data-start=\"204\" data-end=\"207\">Light, flavorful, and nutritionally dense,&nbsp; Matki Sprouts are a traditional favorite packed with health benefits. Rich in protein, dietary fiber, iron, and essential minerals, they help build strength, improve digestion, and maintain energy levels. Low in fat yet high in antioxidants and B vitamins, matki sprouts support heart health, regulate blood sugar, and promote overall wellness. Perfect for sprout salads, usal, misal, curries, or quick snacks, Matki Sprouts bring you authentic taste and farm-fresh purity in every bite &mdash; wholesome nutrition made simple.</p>', 1, 0, 0, 'loose', 0, 0, 1000, 0, '', '', '2025-08-24 16:42:46', '2025-10-15 15:47:10', NULL, '', '', '', '', '5', 0),
(68, 1, 1201, 'Marigold Flower Orange*|*झेंडू फ्लॉवर ऑरेंज', '', 0, 0, 'marigold-flower-orange-1-1-1', 10, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760518692_76854.jpg', NULL, '<p><strong data-start=\"131\" data-end=\"200\">Marigold Flower (Orange) &ndash; Promise of Purity &amp; Freshness</strong><br data-start=\"200\" data-end=\"203\">Bright, fragrant, and auspicious, Orange Marigold Flowers bring natural beauty and positivity to every occasion. Known for their vibrant color and refreshing aroma, marigolds are a traditional choice for pooja, decorations, and festive celebrations. Symbolizing purity, devotion, and good fortune, these flowers are carefully handpicked to ensure freshness and long-lasting charm. Whether for daily worship, weddings, or festive d&eacute;cor, Orange Marigolds add a touch of grace, vibrancy, and divine energy &mdash; straight from nature to your home.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'PFE0001', '2025-08-24 18:28:57', '2025-11-30 16:04:29', NULL, '', '', '', '', '5', 0),
(70, 1, 1202, 'Red Rose*|*लाल गुलाब', '', 0, 0, 'red-rose-1-1-1', 10, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760518904_13538.jpg', NULL, '<p><strong data-start=\"102\" data-end=\"155\">Red Rose &ndash;&nbsp; Promise of Purity &amp; Freshness</strong><br data-start=\"155\" data-end=\"158\">Elegant, fragrant, and timeless,&nbsp; Red Roses are the ultimate symbol of love, beauty, and devotion. With their deep crimson petals and natural aroma, these roses are perfect for expressing emotions, enhancing d&eacute;cor, or offering in pooja and rituals. Rich in tradition and sentiment, red roses bring grace to every occasion &mdash; from weddings and celebrations to daily prayers. Handpicked for purity and freshness,&nbsp; Red Roses deliver natural charm and heartfelt beauty &mdash; straight from the garden to your home.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'PFE0003', '2025-08-24 18:36:58', '2025-11-30 16:05:11', NULL, '', '', '', '', '5', 0),
(71, 1, 1183, 'Banana Leaf*|*केळीचे पान', '', 0, 0, 'banana-leaf-1-1', 10, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760516820_86320.jpg', NULL, '<p><strong data-start=\"119\" data-end=\"175\">Banana Leaf &ndash; Promise of Purity &amp; Freshness</strong><br data-start=\"175\" data-end=\"178\">Natural, eco-friendly, and versatile, Banana Leaves are a symbol of tradition and purity in Indian culture. Widely used for pooja, rituals, and festive offerings, they are also valued for serving food in a hygienic and sustainable way. With their large size, freshness, and durability, banana leaves enhance the presentation of meals, retain natural aroma, and add an authentic touch to celebrations. Handpicked and carefully handled, Banana Leaves bring you purity, tradition, and sustainability &mdash; straight from nature to your home.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'PFE0004', '2025-08-24 18:40:02', '2025-11-30 11:32:39', NULL, '', '', '', '', '5', 0),
(72, 1, 1181, 'Betel Leaf*|* विड्याचे पान', '', 0, 0, 'betel-leaf-1-1', 10, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760518464_15630.jpg', NULL, '<p data-start=\"116\" data-end=\"711\"><br data-start=\"171\" data-end=\"174\">Sacred, aromatic, and culturally significant, Betel Leaves hold a special place in Indian tradition. Used in pooja rituals, festive offerings, and auspicious ceremonies, betel leaves symbolize freshness, purity, and prosperity. They are also cherished for their natural digestive properties and are widely enjoyed as part of traditional paan. Carefully handpicked for their vibrant green color, smooth texture, and long-lasting freshness, Betel Leaves bring you authenticity and purity &mdash; straight from farm to temple.</p>', 1, 1, 0, 'loose', 0, 0, 1000, 0, '', 'PFE0002', '2025-08-24 18:46:26', '2025-11-30 11:31:24', NULL, '', '', '', '', '5', 0),
(77, 1, 836, 'Besan  Peeth', '', 0, 0, 'besan-peeth-1-1-1-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1759125412_24441.jpg', NULL, '<p data-start=\"188\" data-end=\"520\">Wholesome, aromatic, and naturally protein-rich, Besan Peeth (Gram Flour) is made from the finest quality chana dal, finely milled to bring you purity and nutrition in every spoonful. Light and versatile, it&rsquo;s perfect for preparing pakoras, dhokla, chillas, laddus, and a variety of traditional as well as modern recipes.</p>\r\n<p data-start=\"522\" data-end=\"784\">Rich in <strong data-start=\"530\" data-end=\"598\">plant-based protein, fiber, folate, iron, and essential minerals</strong>, Besan supports digestion, boosts energy, helps manage weight, and keeps you fuller for longer. Its low glycemic index also makes it a smart choice for maintaining blood sugar levels.</p>\r\n<p data-start=\"786\" data-end=\"934\">Make every dish healthier and tastier with Besan Peeth &mdash; <strong data-start=\"852\" data-end=\"931\">a true blend of purity, nutrition, and farm-fresh goodness for your kitchen</strong>.</p>', 1, 0, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-08-25 15:41:29', '2025-10-15 14:03:26', NULL, '', '', '', '', '5', 0),
(78, 1, 837, 'Maida', '', 0, 0, 'maida-1-1-1-1-1-1-1-1-1', 6, '5', NULL, 'null', '0', 0, 1, '3', 'products/1759125679_51272.jpg', NULL, '<h3 data-start=\"133\" data-end=\"192\"><strong data-start=\"140\" data-end=\"190\">Maida&nbsp;</strong></h3>\r\n<p data-start=\"193\" data-end=\"729\">Finely milled and silky smooth, Maida is your perfect choice for soft, fluffy, and delicious bakery creations. Whether it&rsquo;s bread, cakes, pastries, biscuits, puris, or parathas, our pure and refined maida ensures a light texture and perfect taste in every bite. Processed from premium quality wheat and carefully packed to preserve freshness, Maida brings versatility to your kitchen. From everyday cooking to festive delicacies, trust for purity, consistency, and great taste &ndash; straight from farm to table.</p>', 1, 0, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-08-25 16:08:10', '2025-10-15 14:03:37', NULL, '', '', '', '', '5', 0),
(79, 1, 767, 'Bajra Flour', '', 0, 0, 'bajra-flour-1-1-1-1-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1759125926_93193.jpg', NULL, '<p><strong data-start=\"110\" data-end=\"166\">Bajra Flour&nbsp;</strong><br data-start=\"166\" data-end=\"169\">Wholesome, hearty, and packed with goodness, Bajra Flour is a natural powerhouse for your kitchen. Ground from premium quality pearl millet, it is rich in iron, fiber, protein, and essential minerals that help boost energy, support digestion, and strengthen immunity. Its earthy flavor and soft texture make it perfect for preparing traditional&nbsp;<strong data-start=\"523\" data-end=\"570\">bhakri, rotla, khichdi, porridge, or ladoos</strong>. Gluten-free and diabetic-friendly, Bajra Flour is an ideal choice for healthy, everyday meals. Bring home the strength of millets &mdash; straight from farm to table with purity.</p>', 1, 0, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-08-25 16:55:13', '2025-10-13 17:13:51', NULL, '', '', '', '', '5', 0),
(80, 1, 843, 'Bajara', '', 0, 0, 'bajara-1-1-1-1-1-1-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1756123683_7438.jpg', NULL, '<p><strong data-start=\"100\" data-end=\"149\">Bajra&nbsp;</strong><br data-start=\"149\" data-end=\"152\">Nutritious, wholesome, and packed with natural strength, Bajra is a traditional millet that brings health to your plate. Rich in iron, fiber, protein, and essential minerals, it helps improve digestion, boosts immunity, supports heart health, and provides lasting energy. Bajra is gluten-free and diabetic-friendly, making it a perfect choice for everyday meals. Enjoy its earthy taste in <strong data-start=\"550\" data-end=\"613\">bhakri, rotla, khichdi, porridge, or traditional delicacies</strong>. Choose Bajra for a healthier lifestyle &mdash; straight from farm to table with purity.</p>', 1, 0, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-08-25 17:08:35', '2025-10-15 14:36:21', NULL, '', '', '', '', '5', 0),
(81, 1, 835, 'Ragi Whole', '', 0, 0, 'ragi-whole-1-1-1-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1756124214_37141.jpg', NULL, '<p><strong data-start=\"104\" data-end=\"159\">Ragi Whole&nbsp;</strong><br data-start=\"159\" data-end=\"162\">Naturally wholesome and power-packed, Ragi (Finger Millet) is a traditional superfood for modern healthy living. Rich in calcium, iron, fiber, and essential amino acids, Ragi supports strong bones, improves digestion, manages weight, and helps control blood sugar levels. Its earthy flavor and nutrient density make it perfect for porridges, dosas, rotis, laddus, and baked recipes. From farm to table purity &mdash; nourish your family with the goodness of Ragi Whole.</p>', 1, 0, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-08-25 17:46:54', '2025-10-15 14:03:10', NULL, '', '', '', '', '5', 0),
(83, 1, 1281, 'Indrayani Rice*|*इंद्रायणी तांदूळ', '', 0, 0, 'indrayani-rice-1-1-1-1-1', 6, '5', NULL, 'null', '0', 1, 1, '2', 'products/1766053420_32305.jpg', NULL, '<p><strong data-start=\"82\" data-end=\"137\">Indrayani Rice&nbsp;</strong><br data-start=\"137\" data-end=\"140\">Indrayani Rice is a premium quality, aromatic variety native to Maharashtra, known for its natural fragrance, soft texture, and rich taste. With its medium grains and slightly sticky consistency after cooking, it&rsquo;s perfect for daily meals, pulao, khichdi, and traditional Maharashtrian dishes. Packed with essential nutrients and easy to digest, Indrayani Rice not only satisfies your taste buds but also supports wholesome nutrition. Bring home the purity of&nbsp; Indrayani Rice &mdash; straight from farm to plate, filled with authentic aroma and goodness.</p>', 1, 1, 2, 'loose', 0, 1, 1000, 0, '', 'GRG0012', '2025-08-25 18:24:20', '2025-12-18 15:53:41', NULL, '', '', '', '', '5', 0),
(84, 1, 1154, 'Sunflower Oil*|*सूर्यफूल तेल', '', 0, 0, 'sunflower-oil-1-1-1', 18, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760516364_71791.jpg', NULL, '<p data-start=\"172\" data-end=\"231\"><strong data-start=\"172\" data-end=\"229\">Sunflower Oil&nbsp;</strong></p>\r\n<p data-start=\"233\" data-end=\"949\">Sunflower Oil is a premium quality, cold-pressed oil extracted from organically grown sunflower seeds, known for its light texture, mild taste, and rich nutritional value. Naturally packed with Vitamin E and essential fatty acids, it helps promote heart health, supports glowing skin, and boosts overall immunity. With its high smoke point and neutral flavor, it is ideal for everyday cooking &mdash; from stir-fries and saut&eacute;s to deep-frying and baking. Free from preservatives and chemicals, Sunflower Oil brings you pure nourishment and wellness in every drop. Bring home the goodness of&nbsp; Sunflower Oil &mdash; straight from nature to your kitchen, filled with purity, health, and authentic taste.&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'CPO0001', '2025-08-28 18:32:25', '2025-11-30 11:03:44', NULL, '', '', '', '', '5', 0),
(85, 1, 1155, 'Groundnut Oil*|*शेंगदाणा तेल', '', 0, 0, 'groundnut-oil-1-1-1', 18, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760513437_62871.jpg', NULL, '<p data-start=\"85\" data-end=\"144\"><strong data-start=\"85\" data-end=\"142\">Groundnut Oil</strong></p>\r\n<p data-start=\"146\" data-end=\"567\">Groundnut Oil is a premium cold-pressed oil extracted from organically grown groundnuts, renowned for its rich aroma, nutty flavor, and wholesome nutrition. Packed with heart-healthy monounsaturated fats, plant sterols, and essential antioxidants, it helps support cardiovascular wellness, enhances immunity, and promotes overall vitality. Naturally rich in Vitamin E, it also nourishes skin and boosts energy.</p>\r\n<p data-start=\"569\" data-end=\"866\">With its high smoke point and distinctive taste, Groundnut Oil is perfect for a variety of cooking styles &mdash; from traditional Indian curries and deep-frying to saut&eacute;ing and roasting. Free from chemicals and preservatives, it ensures every drop is filled with purity and natural goodness.</p>\r\n<p data-start=\"868\" data-end=\"1035\">Bring home the authentic taste and strength of&nbsp; Groundnut Oil &mdash; straight from nature to your kitchen, offering health, flavor, and nourishment in every meal.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'CPO0002', '2025-08-29 16:56:26', '2025-11-30 11:04:04', NULL, '', '', '', '', '5', 0),
(87, 1, 1321, 'Coconut Oil*|*नारळ तेल', '', 0, 0, 'coconut-oil-1-1-1', 18, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760507750_89600.jpg', NULL, '<p data-start=\"91\" data-end=\"144\"><strong data-start=\"91\" data-end=\"142\">Coconut Oil&nbsp;</strong></p>\r\n<p data-start=\"146\" data-end=\"547\">Coconut Oil is a premium cold-pressed oil extracted from organically grown coconuts, cherished for its natural aroma, smooth texture, and rich nutritional benefits. Packed with healthy medium-chain fatty acids (MCFAs) and Vitamin E, it helps boost energy, strengthen immunity, and support heart health. Its nourishing properties also promote healthy skin, strong hair, and overall wellness.</p>\r\n<p data-start=\"549\" data-end=\"798\">Versatile in use, Coconut Oil is perfect for everyday cooking, baking, and frying, as well as for traditional skin and hair care rituals. Free from chemicals, preservatives, and refining, it brings you 100% natural goodness in every drop.</p>\r\n<p data-start=\"800\" data-end=\"971\">Bring home the purity and care of&nbsp; Coconut Oil &mdash; straight from nature to your kitchen and wellness routine, filled with authentic taste, health, and nourishment.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'CPO0003', '2025-08-29 18:29:49', '2025-12-26 16:38:43', NULL, '', '', '', '', '5', 0);
INSERT INTO `bl_products` (`id`, `seller_id`, `row_order`, `name`, `tags`, `tax_id`, `brand_id`, `slug`, `category_id`, `cashback_point`, `indicator`, `manufacturer`, `made_in`, `return_status`, `cancelable_status`, `till_status`, `image`, `other_images`, `description`, `status`, `is_approved`, `return_days`, `type`, `is_unlimited_stock`, `cod_allowed`, `total_allowed_quantity`, `tax_included_in_price`, `fssai_lic_no`, `barcode`, `created_at`, `updated_at`, `deleted_at`, `meta_title`, `meta_keywords`, `schema_markup`, `meta_description`, `max_cashback_use`, `offer_product`) VALUES
(91, 1, 1351, 'Chilli Powder*|*मिरची पावडर', '', 0, 0, 'chilli-powder-1-1-1', 7, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1766053956_55343.jpg', NULL, '<p data-start=\"84\" data-end=\"144\"><strong data-start=\"88\" data-end=\"142\">Chilli Powder&nbsp;</strong></p>\r\n<p data-start=\"146\" data-end=\"407\">Chilli Powder is made from carefully handpicked, sun-dried red chillies, finely ground to preserve their natural color, aroma, and fiery flavor. Free from artificial colors and additives, it brings authentic taste and a vibrant red hue to every dish.</p>\r\n<p data-start=\"409\" data-end=\"595\">Rich in <strong data-start=\"417\" data-end=\"459\">Vitamin C, antioxidants, and capsaicin</strong>, it not only adds zest to your curries, dals, and snacks but also helps boost immunity, improve metabolism, and support heart health.</p>\r\n<p data-start=\"597\" data-end=\"797\">From traditional Indian gravies to modern recipes, Chilli Powder is your perfect kitchen companion &mdash; bringing the right balance of&nbsp;<strong data-start=\"737\" data-end=\"766\">spice, flavor, and purity</strong> straight from farm to table.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'MDF0001', '2025-08-31 15:23:21', '2026-01-08 16:33:48', NULL, '', '', '', '', '5', 0),
(92, 1, 1280, 'Turmeric Powder*|*हळद पावडर', '', 0, 0, 'turmeric-powder-1-1-1-1-1-1-1-1-1-1', 7, '5', NULL, 'null', '0', 0, 1, '2', 'products/1766053302_18572.jpg', NULL, '<p data-start=\"72\" data-end=\"135\"><strong data-start=\"74\" data-end=\"133\">Turmeric Powder&nbsp;</strong></p>\r\n<p data-start=\"137\" data-end=\"431\">Turmeric Powder is made from the finest quality turmeric roots, naturally sun-dried and finely ground to preserve its golden color, earthy aroma, and rich medicinal properties. Free from artificial colors and chemicals, it brings authentic taste and natural goodness to your kitchen.</p>\r\n<p data-start=\"433\" data-end=\"607\">Packed with <strong data-start=\"445\" data-end=\"505\">curcumin, antioxidants, and anti-inflammatory properties</strong>, it helps boost immunity, supports digestion, promotes healthy skin, and improves overall wellness.</p>\r\n<p data-start=\"609\" data-end=\"777\">Perfect for curries, dals, milk, and everyday cooking, Turmeric Powder not only enhances flavor and color but also adds a daily dose of health to your meals.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'MDF0002', '2025-08-31 15:27:33', '2025-12-18 15:51:42', NULL, '', '', '', '', '5', 0),
(93, 1, 1285, 'Cumin / Jeera Powder*|*जिरा पावडर', '', 0, 0, 'cumin-jeera-powder-1-1-1', 7, '2', NULL, 'null', '0', 0, 0, 'null', 'products/1766054107_22060.jpg', NULL, '<p data-start=\"84\" data-end=\"143\"><strong data-start=\"87\" data-end=\"141\">Cumin Powder&nbsp;</strong></p>\r\n<p data-start=\"145\" data-end=\"412\">Cumin Powder is made from the finest quality cumin seeds, carefully cleaned, sun-dried, and freshly ground to preserve its natural aroma and earthy flavor. Free from additives and adulteration, it brings authentic taste and purity straight to your kitchen.</p>\r\n<p data-start=\"414\" data-end=\"589\">Packed with <strong data-start=\"426\" data-end=\"474\">iron, antioxidants, and digestive properties</strong>, cumin powder helps improve metabolism, supports gut health, boosts immunity, and adds warmth to everyday meals.</p>\r\n<p data-start=\"591\" data-end=\"742\">Perfect for curries, dals, chaas, raitas, soups, and spice blends, Cumin Powder enhances flavor while also offering natural health benefits.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'MDF0003', '2025-08-31 15:40:54', '2025-12-18 16:05:07', NULL, '', '', '', '', '5', 0),
(94, 1, 1284, 'Coriander Powder*|*धनिया पावडर', '', 0, 0, 'coriander-powder-1-1-1-1', 7, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1766054030_85803.jpg', NULL, '<p data-start=\"89\" data-end=\"155\"><strong data-start=\"92\" data-end=\"153\">Coriander Powder&nbsp;</strong></p>\r\n<p data-start=\"157\" data-end=\"429\">Coriander Powder is made from the finest quality coriander seeds, carefully cleaned, sun-dried, and freshly ground to retain its natural aroma, flavor, and essential oils. Free from additives and adulteration, it adds authentic taste and purity to your kitchen.</p>\r\n<p data-start=\"431\" data-end=\"706\">Rich in <strong data-start=\"439\" data-end=\"479\">vitamins, minerals, and antioxidants</strong>, coriander powder helps improve digestion, supports immunity, and enhances overall wellness. Its mild, earthy, and slightly citrusy flavor makes it a versatile spice for Indian curries, dals, vegetables, soups, and chutneys.</p>\r\n<p data-start=\"708\" data-end=\"792\">&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'MDF0004', '2025-08-31 15:45:57', '2025-12-18 16:03:50', NULL, '', '', '', '', '5', 0),
(95, 1, 850, 'Cumin', '', 0, 0, 'cumin-1-1-1-1-1-1-1-1-1', 7, '5', NULL, 'null', '0', 0, 1, '2', 'products/1759067252_68349.jpg', NULL, '<p data-start=\"203\" data-end=\"254\"><strong data-start=\"206\" data-end=\"252\">&nbsp;Cumi&nbsp; (Jeera)</strong></p>\r\n<p data-start=\"256\" data-end=\"483\">Jeera (Cumin Seeds) are handpicked from the best farms, carefully cleaned, and packed to preserve their natural aroma and authentic flavor. Known for its warm, earthy taste, jeera is a staple in every Indian kitchen.</p>\r\n<p data-start=\"485\" data-end=\"637\">Rich in <strong data-start=\"493\" data-end=\"535\">iron, antioxidants, and essential oils</strong>, jeera helps improve digestion, boosts immunity, supports metabolism, and keeps the body energized.</p>\r\n<p data-start=\"639\" data-end=\"798\">From tempering dals, curries, and vegetables to flavoring chaas, soups, and spice blends, Jeera brings a touch of purity and wellness to every meal.</p>', 1, 0, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-08-31 15:50:29', '2025-10-15 15:06:01', NULL, '', '', '', '', '5', 0),
(96, 1, 851, 'Mohari', '', 0, 0, 'mohari-1-1-1-1-1-1', 7, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1759067523_83299.jpg', NULL, '<p data-start=\"138\" data-end=\"187\"><strong data-start=\"138\" data-end=\"185\">Mohari</strong></p>\r\n<p data-start=\"189\" data-end=\"421\">Mohari (Mustard Seeds) are sourced from trusted farms, carefully cleaned, and packed to retain their natural pungency and freshness. With their sharp, nutty flavor, mustard seeds are an essential spice in Indian kitchens.</p>\r\n<p data-start=\"423\" data-end=\"569\">Rich in selenium, omega-3 fatty acids, and antioxidants, mustard seeds help boost digestion, improve heart health, and support overall wellness.</p>\r\n<p data-start=\"571\" data-end=\"735\">From tadkas in dals, pickles, and curries to enhancing vegetables, chutneys, and spice blends, Mohari adds a punch of flavor and nutrition to every dish.</p>', 1, 0, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-08-31 18:10:08', '2025-10-15 15:06:17', NULL, '', '', '', '', '5', 0),
(97, 1, 1178, 'Malai Paneer*|* मलाई पनीर', '', 0, 0, 'malai-paneer-1-1-1', 14, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760521704_78109.jpg', NULL, '<h3 data-start=\"97\" data-end=\"161\"><strong data-start=\"104\" data-end=\"161\">Malai Paneer &ndash; EcoLeaf Promise of Purity &amp; Freshness</strong></h3>\r\n<p data-start=\"163\" data-end=\"382\">Malai Paneer is made from fresh, full cream milk sourced from trusted dairy farms. It is prepared using traditional methods without any preservatives, ensuring pure taste and soft, creamy texture in every bite.</p>\r\n<p data-start=\"384\" data-end=\"515\">Rich in protein and calcium, EcoFresh Malai Paneer supports healthy bones, muscle strength, and balanced nutrition for your family.</p>\r\n<p data-start=\"517\" data-end=\"728\">Perfect for preparing delicious Indian dishes like Paneer Butter Masala, Malai Kofta, Shahi Paneer, or enjoyed in salads and sandwiches, EcoFresh Malai Paneer adds freshness and wholesome goodness to your meals.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'DAF0002', '2025-09-14 17:59:07', '2025-11-30 11:25:23', NULL, '', '', '', '', '5', 0),
(98, 1, 1176, 'Dahi*|*दही', '', 0, 0, 'dahi-1-1', 14, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1760521672_4810.jpg', NULL, '<h3 data-start=\"88\" data-end=\"151\"><strong data-start=\"95\" data-end=\"151\">EcoLeaf Dahi &ndash; Promise of Purity &amp; Natural Goodness</strong></h3>\r\n<p data-start=\"153\" data-end=\"389\">Dahi (Curd) is made from fresh, hygienically sourced full cream milk, fermented with pure culture to bring you smooth, creamy, and naturally tangy yogurt. No preservatives, no artificial flavors &ndash; just pure, wholesome goodness.</p>\r\n<p data-start=\"391\" data-end=\"517\">Rich in probiotics, calcium, and proteins, EcoFresh Dahi supports digestion, strengthens bones, and promotes overall wellness.</p>\r\n<p data-start=\"519\" data-end=\"670\">Perfect as a side dish, in raitas, smoothies, desserts, or enjoyed plain, EcoFresh Dahi brings freshness, nutrition, and authentic taste to every meal.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'DAF0001', '2025-09-14 18:08:21', '2025-11-30 11:24:56', NULL, '', '', '', '', '5', 0),
(99, 1, 562, 'Salad Mix', '', 0, 0, 'salad-mix-1', 16, '5', NULL, 'null', '0', 0, 1, '2', 'products/1758442867_82878.jpg', NULL, '<p>Our Fresh Salad Mix is a convenient blend of crisp, fresh leafy greens and vegetables, carefully packed to bring natural freshness to your meals. This ready-to-use mix includes a variety of seasonal greens such as lettuce, spinach, cabbage, and carrot, making it perfect for salads, sandwiches, or wraps. Packaged to maintain quality, it should be stored in the refrigerator and enjoyed within a few days for the best taste and texture. Ideal for anyone looking to add a fresh, wholesome touch to everyday meals.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', '', '2025-09-21 13:51:07', '2025-09-21 13:51:57', NULL, '', '', '', '', '5', 0),
(100, 1, 1189, 'Tomato Chutney*|*टोमॅटो चटणी', '', 0, 0, 'tomato-chutney-1-1', 15, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760521218_61032.jpg', NULL, '<p data-start=\"81\" data-end=\"447\">Our Tomato Chutney is a flavorful blend of ripe tomatoes and traditional spices, crafted to add a tangy and savory touch to your meals. Perfect as a dip, spread, or accompaniment, this chutney brings a burst of taste to sandwiches, snacks, or main dishes. Packaged to preserve freshness, it can be stored in a cool, dry place and enjoyed as part of everyday meals.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'BAC0001', '2025-09-21 14:09:34', '2025-11-30 11:39:23', NULL, '', '', '', '', '5', 0),
(101, 1, 1259, 'Onion- Organically Grown*|*कांदा', '', 0, 0, 'onion--organically-grown-1-1-1-1', 11, '5', NULL, 'null', '0', 0, 1, '2', 'products/1760511519_99484.jpg', NULL, '<p>Our organically grown onions are cultivated without synthetic pesticides or fertilizers, ensuring natural growth and freshness. These onions are hand-picked at the right maturity to deliver crisp texture and authentic flavor, perfect for cooking, salads, or garnishing your favorite dishes. Store in a cool, dry place to maintain quality and enjoy the natural goodness in every meal.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'OFV0001', '2025-09-21 14:46:23', '2025-12-14 10:23:59', NULL, '', '', '', '', '5', 0),
(103, 1, 1279, 'Rajma*|*राजमा', '', 0, 0, 'rajma-1-1-1-1-1-1-1-1', 6, '2', NULL, 'null', '0', 1, 1, '2', 'products/1766053146_41893.jpg', NULL, '<p data-start=\"153\" data-end=\"480\"><strong data-start=\"153\" data-end=\"162\">Rajma</strong> is rich, nutritious, and naturally red in color with a firm texture that turns soft and creamy when cooked. It is commonly used in curries, gravies, rice dishes, and a variety of wholesome recipes. Carefully cleaned, processed, and neatly packed, it brings authentic farm freshness and hearty taste to your kitchen.</p>', 1, 1, 2, 'packet', 0, 0, 1000, 0, '', 'GRG0001', '2025-10-13 15:42:43', '2025-12-18 15:49:06', NULL, '', '', '', '', '5', 0),
(104, 1, 1286, 'Toor Dal*|*तूर डाळ', '', 0, 0, 'toor-dal-1-1-1-1', 6, '2', NULL, 'null', '0', 0, 0, 'null', 'products/1766055341_9961.jpg', NULL, '<p data-start=\"96\" data-end=\"390\"><strong data-start=\"96\" data-end=\"108\">Toor Dal</strong> is bright yellow, clean, and naturally polished, with a smooth texture that cooks to a soft and fluffy consistency. Commonly used in dals, sambar, khichdi, and everyday Indian recipes, it is carefully processed and neatly packed to bring wholesome farm-freshness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0002', '2025-10-13 16:00:38', '2025-12-18 16:25:41', NULL, '', '', '', '', '5', 0),
(105, 1, 1287, 'Unpolished Urad Dal*|*उडदाची डाळ', '', 0, 0, 'unpolished-urad-dal-1-1-1', 6, '2', NULL, 'null', '0', 0, 0, 'null', 'products/1766055408_78823.jpg', NULL, '<p><strong data-start=\"73\" data-end=\"85\">Urad Dal</strong> is naturally white, clean, and polished, with a soft texture that becomes creamy when cooked. Commonly used in dals, idli, dosa batter, and a variety of everyday recipes, it is carefully processed and neatly packed to bring fresh farm quality to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0003', '2025-10-13 16:13:50', '2025-12-18 16:26:48', NULL, '', '', '', '', '5', 0),
(106, 1, 1289, 'Unpolished Kabuli Chana*|*काबुली चना', '', 0, 0, 'unpolished-kabuli-chana-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1766055555_38474.jpg', NULL, '<p><strong data-start=\"119\" data-end=\"146\">Unpolished Kabuli Chana</strong> is naturally beige, clean, and unpolished, retaining its wholesome nutrients. It has a firm texture that softens perfectly when cooked, making it ideal for curries, salads, stews, and everyday recipes. Carefully cleaned and neatly packed, it brings natural farm-fresh goodness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0005', '2025-10-13 16:23:18', '2025-12-18 16:29:15', NULL, '', '', '', '', '5', 0),
(107, 1, 1292, 'Whole Masoor*|*मसूर संपूर्ण', '', 0, 0, 'whole-masoor-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1766055850_25564.jpg', NULL, '<p><strong data-start=\"81\" data-end=\"101\">Whole Masoor Dal</strong> is naturally reddish-brown, clean, and unpolished, with a firm texture that cooks to a soft and wholesome consistency. Commonly used in dals, soups, khichdi, and everyday recipes, it is carefully processed and neatly packed to bring fresh farm goodness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0007', '2025-10-13 16:55:27', '2025-12-18 16:34:10', NULL, '', '', '', '', '5', 0),
(108, 1, 1295, 'Unpolished Green Chana*|*चना', '', 0, 0, 'unpolished-green-chana-1-1-1-1-1', 6, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1766056064_50275.jpg', NULL, '<p><strong data-start=\"87\" data-end=\"113\">Unpolished Green Chana</strong> is naturally green, clean, and unpolished, retaining its rich nutrients and natural flavor. It has a firm texture that softens perfectly when cooked, making it ideal for curries, snacks, salads, and everyday recipes. Carefully cleaned and neatly packed, it brings wholesome farm-fresh goodness to your kitchen.</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GRG0010', '2025-10-13 17:01:10', '2025-12-18 16:37:44', NULL, '', '', '', '', '5', 0),
(109, 1, 1204, 'Admax-90*|*ॲडमॅक्स 90', '', 0, 0, 'admax-90-90-1-1-1', 19, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1764218560_72032.jpg', NULL, '<p>Admax-90 is an all-in-one spraying assistant that acts as a spreader, sticker, activator, penetrator, pH balancer, and hardness reducer. It helps the spray solution stick to the leaves, spread evenly, and improve coverage, which reduces the overall quantity of solution required. Admax-90 enhances the entry of active molecules into plant cells, increasing their bio-efficacy. It also balances the pH and reduces the hardness of water, thereby improving overall water quality. Recommended dosage: 0.5 to 1.5 ml per liter of water for spraying.</p>', 1, 1, 0, 'packet', 1, 0, 1000, 0, '', 'GAN0003', '2025-11-24 17:04:29', '2025-11-30 16:13:25', NULL, '', '', '', '', '5', 0),
(110, 1, 1203, 'Bhoomi Sattva*|*भूमी सत्त्व', '', 0, 0, 'bhoomi-sattva-1-1-1', 19, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1764157663_24793.jpg', NULL, '<p>Bhoomisatva helps to improve soil health and makes available the nutrients from soil to plant. It promotes the production of beneficial hormones essential for healthy plant growth. The product also helps improve the physical structure of the soil and provides a supportive habitat for beneficial microbes such as bacteria and fungi.</p>', 1, 1, 0, 'packet', 1, 0, 1000, 0, '', 'GAN0001', '2025-11-24 17:42:35', '2025-11-30 16:13:09', NULL, '', '', '', '', '5', 0),
(112, 1, 1205, 'Trisattva NPK Consortia*|*त्रिसत्व एन पी के कन्सोर्शिया', '', 0, 0, 'trisattva-npk-consortia-1-1-1-1', 19, '5', NULL, 'null', '0', 0, 0, 'null', 'products/1764218789_47900.jpg', NULL, '<p>Trisatva is a complete nutrient package for healthy growth of plants. It is rich in bacteria which help plants to get nitrogen, phosphorus, and potash for healthy plants.&nbsp;</p>', 1, 1, 0, 'packet', 0, 0, 1000, 0, '', 'GAN0002', '2025-11-27 10:16:29', '2025-11-30 16:13:38', NULL, '', '', '', '', '5', 0),
(113, 1, 1278, 'Dry Ginger Powder *|*सुंठ पावडर', '', 0, 0, 'dry-ginger-powder-1-1-1-1-1-1-1', 7, '2', NULL, 'null', '0', 0, 1, '2', 'products/1766052771_31676.jpg', NULL, '<p data-start=\"177\" data-end=\"198\"><strong data-start=\"177\" data-end=\"198\">Dry Ginger Powder</strong></p>\r\n<p data-start=\"200\" data-end=\"516\">Dry Ginger Powder is made from high-quality, mature ginger rhizomes that are thoroughly cleaned, naturally dried, and finely ground to retain their authentic aroma, warm flavor, and natural freshness. It is free from additives, artificial colors, and adulteration, ensuring pure and premium quality for your kitchen.</p>\r\n<p data-start=\"518\" data-end=\"825\">With its rich, spicy, and slightly sweet taste, dry ginger powder adds depth and warmth to a variety of dishes. It is widely used in traditional recipes such as herbal teas, kadha, sweets, gravies, chutneys, snacks, and homemade masalas. Its natural aroma enhances both taste and overall cooking experience.</p>', 1, 1, 0, 'packet', 0, 1, 1000, 0, '', 'MDF0005', '2025-12-06 12:45:30', '2025-12-18 15:42:51', NULL, '', '', '', '', '2', 0),
(114, 1, 1296, 'NutriMeal Box', '', 0, 0, 'nutrimeal-box-1', 6, '2', NULL, 'null', '0', 1, 1, '2', 'products/1766056144_9727.jpg', NULL, '<p>NutriMeal Box&nbsp;</p>\r\n<p data-start=\"199\" data-end=\"601\">A thoughtfully curated meal box featuring everyday kitchen essentials in convenient pouches. This box includes rice, rajma, moong, and turmeric, carefully packed to maintain quality and freshness. Designed for ease of use and simple meal preparation, the Protein Meal Box brings together staple grains, pulses, and spice in balanced quantities&mdash;ideal for quick, hassle-free cooking at home or on the go.</p>\r\n<p data-start=\"603\" data-end=\"616\"><strong data-start=\"603\" data-end=\"616\">Contents:</strong></p>\r\n<ul data-start=\"617\" data-end=\"717\">\r\n<li data-start=\"617\" data-end=\"640\">\r\n<p data-start=\"619\" data-end=\"640\">Rice Pouch &ndash; 100 gm</p>\r\n</li>\r\n<li data-start=\"641\" data-end=\"665\">\r\n<p data-start=\"643\" data-end=\"665\">Rajma Pouch &ndash; 100 gm</p>\r\n</li>\r\n<li data-start=\"666\" data-end=\"690\">\r\n<p data-start=\"668\" data-end=\"690\">Moong Pouch &ndash; 100 gm</p>\r\n</li>\r\n<li data-start=\"691\" data-end=\"717\">\r\n<p data-start=\"693\" data-end=\"717\">Turmeric Pouch &ndash; 25 gm</p>\r\n</li>\r\n</ul>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', '', '2025-12-17 14:43:32', '2025-12-18 16:39:04', NULL, '', '', '', '', '5', 0),
(115, 1, 1334, 'Beetroot Powder*|*बीटरूट पावडर', '', 0, 0, 'beetroot-powder-1', 7, '2', NULL, 'null', '0', 1, 1, '2', 'products/1766122746_93080.jpg', NULL, '<h3 data-start=\"151\" data-end=\"174\"><strong data-start=\"155\" data-end=\"174\">Beetroot Powder</strong></h3>\r\n<p data-start=\"176\" data-end=\"459\">Beetroot Powder is prepared from carefully selected beetroots that are thoroughly cleaned, naturally dried, and finely ground to maintain their natural colour, flavour, and freshness. It contains no additives, artificial colours, or adulterants, ensuring pure and consistent quality.</p>\r\n<p data-start=\"461\" data-end=\"850\">With its naturally vibrant red colour and mild earthy taste, beetroot powder is used as a food ingredient in a variety of preparations. It is commonly added to smoothies, juices, bakery items, soups, sauces, gravies, desserts, and homemade recipes. Its natural colour and flavour enhance the appearance and taste of dishes, making it suitable for both traditional and contemporary cooking.</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'MDF0006', '2025-12-19 11:09:06', '2025-12-29 10:27:14', NULL, '', '', '', '', '5', 0),
(116, 1, 1341, 'Moringa Powder*|*मोरिंगा पावडर', '', 0, 0, 'moringa-powder-1-1', 7, '2', NULL, 'null', '0', 1, 1, '2', 'products/1766123277_59978.jpg', NULL, '<h3 data-start=\"126\" data-end=\"148\"><strong data-start=\"130\" data-end=\"148\">Moringa Powder</strong></h3>\r\n<p data-start=\"150\" data-end=\"437\">Moringa Powder is prepared from carefully selected moringa leaves that are thoroughly cleaned, naturally dried, and finely ground to maintain their natural colour, texture, and freshness. It contains no additives, artificial colours, or adulterants, ensuring pure and consistent quality.</p>\r\n<p data-start=\"439\" data-end=\"754\">With its natural green colour and characteristic taste, moringa powder is used as a food ingredient in a variety of preparations. It can be added to smoothies, soups, sauces, gravies, dough, and other homemade recipes. Its fine texture allows easy mixing and uniform blending in both traditional and modern recipes.</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'MDF0007', '2025-12-19 11:17:57', '2025-12-31 15:42:31', NULL, '', '', '', '', '5', 0),
(117, 1, 14, 'Sweet Potato*|* रताळे', '', 0, 0, 'sweet-potato', 1, '2', NULL, NULL, '0', 1, 1, '2', 'products/1766644983_38915.jpg', NULL, '<p><strong data-start=\"336\" data-end=\"352\">Sweet Potato</strong> is carefully selected for its freshness, firm texture, and naturally rich taste. Ideal for a variety of dishes, it adds wholesome nutrition and authentic farm freshness to every meal.</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'VEG0016', '2025-12-25 12:13:03', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(118, 1, 20, 'Cucumber Green*|*काकडी', '', 0, 0, 'cucumber-green-1', 1, '2', NULL, 'null', '0', 1, 1, '2', 'products/1766646213_66257.jpg', NULL, '<p><strong data-start=\"59\" data-end=\"77\">Cucumber Green</strong> is fresh, firm, and naturally crisp with a refreshing taste. Perfect for salads, raita, juices, or everyday meals, it brings cool, farm-fresh goodness straight to your kitchen.</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'VEG0018', '2025-12-25 12:33:33', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 0),
(119, 1, 21, 'Methi*|*मेथी', '', 0, 0, 'methi-1', 1, '2', NULL, 'null', '0', 1, 1, '2', 'products/1766647336_84579.jpg', NULL, '<p><strong data-start=\"69\" data-end=\"103\">Fresh Methi (Fenugreek Leaves)</strong> is green, tender, and naturally aromatic with a mildly bitter, earthy flavor. Perfect for sabzi, parathas, curries, or healthy meals, it brings wholesome, farm-fresh goodness straight to your kitchen.&nbsp;</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'VEG0019', '2025-12-25 12:52:16', '2026-01-02 10:15:05', NULL, '', '', '', '', '2', 0),
(120, 1, 22, 'Gavar (Cluster Beans)*|*गवार', '', 0, 0, 'gavar-cluster-beans-1-1-1-1-1', 1, '2', NULL, 'null', '0', 1, 1, '2', 'products/1766647934_53957.jpg', NULL, '<p><strong data-start=\"74\" data-end=\"99\">Gavar (Cluster Beans)</strong> is fresh, tender, and naturally green with a mild, earthy flavor. Perfect for sabzi, stir-fries, and traditional dishes, it brings simple, farm-fresh goodness straight to your kitchen.</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'VEG0020', '2025-12-25 13:02:20', '2026-01-02 10:06:28', NULL, '', '', '', '', '5', 0),
(121, 1, 1347, 'Tomato Ozone Washed', '', 0, 0, 'tomato-ozone-washed', 20, '2', NULL, 'null', '0', 1, 1, '2', 'products/1767256045_51136.png', NULL, '<p><strong>Tomatoes</strong> &ndash; juicy, vibrant, and full of flavor. Packed with vitamins A, C, and antioxidants like lycopene, they boost immunity and promote heart health. Perfect for salads, curries, sauces, and sandwiches &ndash; bringing natural freshness to every meal!</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'OFW0001', '2026-01-01 13:57:25', '2026-01-04 12:33:14', NULL, '', '', '', '', '5', 0),
(122, 1, 1, 'Onion Super Saver', '', 0, 0, 'onion-super-saver-1-1-1-1', 1, '2', NULL, 'null', '0', 1, 1, '2', 'products/1767256751_90666.jpg', NULL, '<p data-start=\"202\" data-end=\"507\"><strong>Onions</strong> are a true kitchen essential, adding depth, aroma, and character to countless dishes. In Indian cuisine, they&rsquo;re more than just an ingredient &mdash; they&rsquo;re a tradition. From raw salads to sizzling curries, crispy pakoras to zesty salsas, onions bring a burst of freshness and flavour to every recipe.</p>\r\n<p data-start=\"509\" data-end=\"917\">Our onions are <strong data-start=\"524\" data-end=\"560\">fresh, firm, and naturally sweet</strong>, sourced directly from trusted local farms. Slice them into rings for burgers and sandwiches, dice them for a crunchy salad, or fry them to unlock their rich, pungent aroma &mdash; a result of their natural sulphur compounds. Packed with <strong data-start=\"793\" data-end=\"835\">biotin and antioxidant-rich flavonoids</strong>, especially in their outer layers, they&rsquo;re as nutritious as they are delicious.</p>\r\n<p data-start=\"919\" data-end=\"1158\">Whether you&rsquo;re preparing a comforting home-style curry or experimenting with global flavours, our handpicked onions promise <strong data-start=\"1043\" data-end=\"1088\">unmatched taste, quality, and versatility</strong> &mdash; bringing the authentic essence of India straight to your kitchen.</p>', 1, 1, 1, 'packet', 0, 1, 1, 0, '', 'VEG0021', '2026-01-01 14:09:11', '2026-01-02 10:15:05', NULL, '', '', '', '', '5', 1),
(123, 1, 1350, 'Strawberry*|*स्ट्रॉबेरी', '', 0, 0, 'strawberry-1-1', 9, '2', NULL, 'null', '0', 1, 1, '2', 'products/1767336504_31472.jpg', NULL, '<p>Fresh strawberries with a vibrant color and soft, juicy texture. Perfect for enjoying as they are or adding to desserts, beverages, and recipes.</p>', 1, 1, 1, 'packet', 0, 1, 1000, 0, '', 'EFV0008', '2026-01-02 12:18:24', '2026-01-08 16:23:28', NULL, '', '', '', '', '5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `bl_product_images`
--

CREATE TABLE `bl_product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_product_images`
--

INSERT INTO `bl_product_images` (`id`, `product_id`, `product_variant_id`, `image`) VALUES
(21, 20, 0, 'products/1755420449_61522.jpg'),
(26, 55, 0, 'products/1755520219_38192.jpg'),
(29, 8, 0, 'products/1755577960_92617.png'),
(31, 3, 0, 'products/1755578123_96956.jpg'),
(32, 3, 0, 'products/1755578174_70515.png'),
(35, 2, 0, 'products/1755578801_10468.jpg'),
(36, 2, 0, 'products/1755578860_54479.png'),
(38, 21, 0, 'products/1755579435_65730.jpg'),
(39, 21, 0, 'products/1755579477_8999.png'),
(40, 17, 0, 'products/1755580764_48921.jpg'),
(41, 17, 0, 'products/1755580804_39121.jpg'),
(42, 17, 0, 'products/1755580862_79534.png'),
(45, 13, 0, 'products/1755581085_48184.png'),
(48, 12, 0, 'products/1755581371_29529.png'),
(51, 18, 0, 'products/1755581608_4072.png'),
(54, 24, 0, 'products/1755686560_6170.png'),
(56, 25, 0, 'products/1755686919_46523.jpg'),
(62, 22, 0, 'products/1755687618_39848.png'),
(63, 23, 0, 'products/1755687963_88901.png'),
(66, 15, 0, 'products/1755689134_84872.png'),
(69, 6, 0, 'products/1755695184_3306.png'),
(90, 27, 0, 'products/1755767060_46414.png'),
(94, 29, 0, 'products/1755768554_56603.png'),
(96, 34, 0, 'products/1755769355_62323.png'),
(98, 5, 0, 'products/1755771038_7920.png'),
(100, 28, 0, 'products/1755771638_47792.png'),
(104, 4, 0, 'products/1755775479_98234.png'),
(107, 45, 0, 'products/1755776412_12279.png'),
(109, 33, 0, 'products/1755777205_34324.jpg'),
(110, 33, 0, 'products/1755777238_45549.png'),
(113, 14, 0, 'products/1755778310_86956.jpg'),
(114, 14, 0, 'products/1755778345_87467.png'),
(116, 60, 0, 'products/1755778554_97078.png'),
(119, 37, 0, 'products/1755778757_61405.png'),
(122, 1, 0, 'products/1755868945_42336.png'),
(125, 47, 0, 'products/1755869221_97683.png'),
(128, 46, 0, 'products/1755869311_3975.png'),
(131, 44, 0, 'products/1755869474_52344.png'),
(132, 61, 0, 'products/1755922693_60349.png'),
(133, 62, 0, 'products/1755926059_35293.png'),
(136, 16, 0, 'products/1756011498_51689.png'),
(138, 59, 0, 'products/1756011761_67844.jpg'),
(139, 59, 0, 'products/1756011789_77190.png'),
(142, 19, 0, 'products/1756012477_61836.png'),
(145, 43, 0, 'products/1756013282_97718.png'),
(150, 50, 0, 'products/1756017341_49568.png'),
(153, 57, 0, 'products/1756018175_66754.png'),
(157, 64, 0, 'products/1756025965_80260.png'),
(160, 65, 0, 'products/1756030717_32777.png'),
(166, 66, 0, 'products/1756032536_2195.png'),
(167, 67, 0, 'products/1756033966_1972.png'),
(172, 58, 0, 'products/1756037173_95819.png'),
(177, 68, 0, 'products/1756040604_9663.png'),
(178, 69, 0, 'products/1756040625_48217.png'),
(181, 70, 0, 'products/1756040877_47553.png'),
(183, 71, 0, 'products/1756041181_43937.jpg'),
(184, 71, 0, 'products/1756041220_37910.png'),
(205, 80, 0, 'products/1756123683_48047.jpg'),
(206, 80, 0, 'products/1756123708_81141.jpg'),
(207, 81, 0, 'products/1756124214_58476.jpg'),
(208, 81, 0, 'products/1756124244_60599.jpg'),
(210, 83, 0, 'products/1756126460_21435.jpg'),
(260, 73, 0, 'products/1759124561_1905.jpg'),
(261, 73, 0, 'products/1759124588_81750.jpg'),
(262, 74, 0, 'products/1759124737_86918.jpg'),
(263, 75, 0, 'products/1759125170_83535.jpg'),
(264, 75, 0, 'products/1759125196_87597.jpg'),
(265, 78, 0, 'products/1759125679_95761.jpg'),
(266, 79, 0, 'products/1759125926_85688.jpg'),
(278, 18, 0, 'products/1760338690_79740.jpg'),
(279, 18, 0, 'products/1760338757_46141.jpg'),
(280, 3, 0, 'products/1760339616_35399.jpg'),
(282, 2, 0, 'products/1760339924_45729.jpg'),
(283, 8, 0, 'products/1760340458_15285.jpg'),
(284, 8, 0, 'products/1760340711_1716.jpg'),
(285, 13, 0, 'products/1760344453_17891.jpg'),
(286, 13, 0, 'products/1760344587_54246.jpg'),
(287, 60, 0, 'products/1760345221_87797.jpg'),
(288, 60, 0, 'products/1760345248_56077.jpg'),
(289, 24, 0, 'products/1760346753_6395.jpg'),
(290, 24, 0, 'products/1760346778_84923.jpg'),
(291, 23, 0, 'products/1760347614_42633.jpg'),
(292, 23, 0, 'products/1760347639_28164.jpg'),
(293, 22, 0, 'products/1760358444_73728.jpg'),
(294, 37, 0, 'products/1760358874_16974.jpg'),
(295, 37, 0, 'products/1760358902_71051.jpg'),
(296, 15, 0, 'products/1760360354_28361.jpg'),
(297, 12, 0, 'products/1760360695_30737.jpg'),
(298, 25, 0, 'products/1760361056_73293.jpg'),
(299, 48, 0, 'products/1760361288_3362.jpg'),
(300, 48, 0, 'products/1760361313_86614.jpg'),
(301, 43, 0, 'products/1760361930_2548.jpg'),
(302, 43, 0, 'products/1760361957_59838.jpg'),
(303, 50, 0, 'products/1760362316_66532.jpg'),
(304, 19, 0, 'products/1760363235_2238.jpg'),
(305, 16, 0, 'products/1760364022_43645.jpg'),
(306, 44, 0, 'products/1760364180_69016.jpg'),
(307, 4, 0, 'products/1760364690_30976.jpg'),
(308, 27, 0, 'products/1760418079_93845.jpg'),
(309, 6, 0, 'products/1760418381_82749.jpg'),
(310, 29, 0, 'products/1760418694_92620.jpg'),
(311, 28, 0, 'products/1760502396_17201.jpg'),
(312, 5, 0, 'products/1760502708_62575.jpg'),
(313, 34, 0, 'products/1760503658_75856.jpg'),
(314, 57, 0, 'products/1760504044_1542.jpg'),
(315, 63, 0, 'products/1760504422_85685.jpg'),
(316, 64, 0, 'products/1760505549_21381.jpg'),
(317, 47, 0, 'products/1760506456_41250.jpg'),
(318, 46, 0, 'products/1760507289_78039.jpg'),
(319, 25, 0, 'products/1766566552_64591.png'),
(320, 117, 0, 'products/1766644983_48298.png'),
(321, 119, 0, 'products/1766647336_38945.png'),
(322, 120, 0, 'products/1766647940_74501.png'),
(323, 121, 0, 'products/1767256045_28714.png'),
(324, 122, 0, 'products/1767256751_93083.png'),
(325, 123, 0, 'products/1767336504_69779.jpg'),
(326, 123, 0, 'products/1767336811_24155.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `bl_product_ratings`
--

CREATE TABLE `bl_product_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rate` tinyint(4) NOT NULL,
  `review` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_product_tag`
--

CREATE TABLE `bl_product_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_product_variants`
--

CREATE TABLE `bl_product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '(1: Available, 0: Sold Out)',
  `measurement` double(8,2) NOT NULL,
  `price` double(11,2) NOT NULL,
  `discounted_price` double(11,2) NOT NULL DEFAULT 0.00,
  `stock` double(11,2) NOT NULL DEFAULT 0.00,
  `stock_unit_id` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_product_variants`
--

INSERT INTO `bl_product_variants` (`id`, `product_id`, `type`, `status`, `measurement`, `price`, `discounted_price`, `stock`, `stock_unit_id`, `deleted_at`) VALUES
(1, 1, 'loose', 1, 500.00, 110.00, 82.00, 5.00, 3, NULL),
(2, 2, 'loose', 1, 0.50, 25.00, 15.00, 18.00, 2, NULL),
(3, 3, 'loose', 0, 1.00, 52.00, 40.00, 15.00, 2, NULL),
(4, 4, 'packet', 0, 1.00, 233.00, 159.00, 1.00, 2, NULL),
(5, 5, 'loose', 1, 100.00, 24.00, 18.00, 0.00, 3, NULL),
(6, 6, 'packet', 0, 500.00, 76.00, 60.00, 1.00, 3, NULL),
(8, 8, 'packet', 0, 500.00, 25.00, 23.00, 1.00, 3, NULL),
(9, 9, 'packet', 0, 1.00, 148.00, 125.00, 1.00, 2, NULL),
(10, 10, 'packet', 0, 1.00, 156.00, 128.00, 1.00, 2, NULL),
(12, 12, 'packet', 0, 500.00, 35.00, 30.00, 4.00, 3, NULL),
(13, 13, 'loose', 1, 500.00, 50.00, 32.00, 0.00, 3, NULL),
(14, 14, 'loose', 1, 250.00, 44.00, 30.00, 0.00, 3, NULL),
(15, 15, 'packet', 0, 250.00, 25.00, 20.00, 1.00, 3, NULL),
(16, 16, 'packet', 0, 500.00, 35.00, 30.00, 2.00, 3, NULL),
(18, 18, 'packet', 0, 500.00, 40.00, 35.00, 2998.00, 3, NULL),
(19, 19, 'loose', 1, 1.00, 70.00, 60.00, 0.00, 8, NULL),
(21, 21, 'packet', 0, 500.00, 26.00, 20.80, 1.00, 3, NULL),
(22, 22, 'packet', 0, 1.00, 108.00, 95.04, 1.00, 2, NULL),
(23, 23, 'loose', 0, 250.00, 29.50, 16.50, 0.00, 3, NULL),
(24, 24, 'packet', 0, 500.00, 49.00, 32.00, 1.00, 3, NULL),
(25, 25, 'loose', 0, 1.00, 62.00, 36.00, 0.00, 6, NULL),
(27, 27, 'packet', 0, 250.00, 26.00, 20.00, 1.00, 3, NULL),
(28, 28, 'loose', 1, 0.50, 100.00, 75.00, 20.75, 2, NULL),
(29, 29, 'packet', 0, 250.00, 30.00, 20.00, 4.00, 3, NULL),
(31, 33, 'packet', 0, 1.00, 75.00, 70.00, 100.00, 2, NULL),
(32, 34, 'loose', 1, 100.00, 16.00, 12.00, 0.00, 3, NULL),
(33, 35, 'loose', 1, 20.00, 29.00, 25.52, 0.00, 5, NULL),
(34, 36, 'loose', 1, 1.00, 26.00, 22.88, 0.00, 5, NULL),
(35, 37, 'packet', 0, 500.00, 68.00, 41.00, 1.00, 3, NULL),
(41, 43, 'packet', 0, 1.00, 135.00, 120.00, 4.00, 2, NULL),
(42, 44, 'loose', 0, 1.00, 72.00, 40.00, 0.00, 5, NULL),
(43, 45, 'packet', 0, 500.00, 66.00, 39.00, 1.00, 3, NULL),
(44, 46, 'loose', 1, 4.00, 270.00, 178.00, 0.00, 5, NULL),
(45, 47, 'loose', 1, 3.00, 190.00, 100.00, 0.00, 5, NULL),
(46, 48, 'packet', 0, 500.00, 64.00, 50.00, 1.00, 3, NULL),
(48, 50, 'packet', 0, 2.00, 97.00, 65.00, 1.00, 5, NULL),
(49, 51, 'packet', 0, 1.00, 269.00, 223.00, 1.00, 2, NULL),
(50, 52, 'packet', 0, 1.00, 200.00, 160.00, 1.00, 2, NULL),
(51, 53, 'packet', 1, 500.00, 92.00, 86.00, 9996.00, 3, NULL),
(55, 57, 'loose', 1, 300.00, 62.00, 32.00, 0.00, 3, NULL),
(56, 58, 'loose', 1, 250.00, 37.00, 32.00, 0.00, 3, NULL),
(57, 59, 'packet', 0, 1.00, 25.00, 20.00, 100.00, 1, NULL),
(58, 60, 'packet', 0, 1.00, 70.00, 60.00, 0.00, 2, NULL),
(61, 12, 'packet', 0, 1.00, 70.00, 60.00, 2.00, 2, NULL),
(62, 63, 'loose', 1, 350.00, 151.00, 120.00, 0.00, 3, NULL),
(63, 64, 'loose', 0, 500.00, 236.00, 207.00, 2.00, 3, NULL),
(64, 65, 'loose', 1, 200.00, 68.00, 59.84, 0.00, 3, NULL),
(65, 66, 'loose', 1, 200.00, 52.00, 45.00, 0.00, 3, NULL),
(66, 67, 'loose', 1, 200.00, 55.00, 48.00, 0.00, 3, NULL),
(67, 68, 'loose', 1, 1.00, 100.00, 90.00, 0.00, 2, NULL),
(69, 70, 'loose', 1, 100.00, 30.00, 25.00, 0.00, 3, NULL),
(70, 71, 'loose', 0, 1.00, 20.00, 17.00, 1.00, 5, NULL),
(71, 72, 'loose', 1, 10.00, 36.00, 31.00, 0.00, 5, NULL),
(76, 77, 'packet', 1, 1.00, 199.00, 102.00, 0.00, 2, NULL),
(77, 78, 'packet', 1, 1.00, 75.00, 61.00, 0.00, 2, NULL),
(78, 79, 'packet', 1, 1.00, 117.00, 78.00, 0.00, 2, NULL),
(79, 80, 'packet', 1, 500.00, 229.00, 171.00, 0.00, 3, NULL),
(80, 81, 'packet', 1, 1.00, 149.00, 87.00, 0.00, 2, NULL),
(82, 83, 'loose', 1, 1.00, 90.00, 88.00, 3987.50, 2, NULL),
(83, 84, 'packet', 0, 1.00, 425.00, 327.00, 1.00, 7, NULL),
(84, 85, 'packet', 0, 1.00, 650.00, 600.00, 1.00, 7, NULL),
(86, 87, 'packet', 0, 1.00, 600.00, 590.00, 1.00, 7, NULL),
(91, 91, 'packet', 0, 500.00, 260.00, 252.00, 1.00, 3, NULL),
(92, 92, 'packet', 1, 500.00, 235.00, 170.00, 8.00, 3, NULL),
(93, 93, 'packet', 0, 500.00, 599.00, 246.00, 1.00, 3, NULL),
(94, 94, 'packet', 0, 500.00, 205.00, 153.00, 1.00, 3, NULL),
(95, 95, 'packet', 1, 1.00, 890.00, 400.00, 0.00, 2, NULL),
(96, 96, 'packet', 1, 500.00, 144.00, 126.00, 0.00, 3, NULL),
(98, 60, 'packet', 0, 500.00, 35.00, 30.00, 0.00, 3, NULL),
(99, 24, 'packet', 0, 250.00, 26.00, 16.00, 1.00, 3, NULL),
(100, 23, 'loose', 0, 500.00, 59.00, 33.00, 0.00, 3, NULL),
(101, 22, 'packet', 0, 500.00, 54.00, 47.52, 1.00, 3, NULL),
(102, 15, 'packet', 0, 500.00, 50.00, 40.00, 1.00, 3, NULL),
(103, 15, 'packet', 0, 1.00, 100.00, 80.00, 1.00, 2, NULL),
(105, 8, 'packet', 0, 1.00, 50.00, 43.00, 1.00, 2, NULL),
(106, 3, 'loose', 0, 0.50, 26.00, 20.00, 15.00, 2, NULL),
(107, 21, 'packet', 0, 1.00, 52.00, 41.60, 1.00, 2, NULL),
(109, 37, 'packet', 0, 1.00, 136.00, 82.00, 1.00, 2, NULL),
(110, 33, 'packet', 0, 500.00, 40.00, 35.00, 100.00, 3, NULL),
(111, 2, 'loose', 1, 1.00, 50.00, 25.00, 18.00, 2, NULL),
(116, 4, 'packet', 0, 500.00, 117.00, 93.60, 1.00, 3, NULL),
(118, 45, 'packet', 0, 1.00, 132.00, 78.00, 1.00, 2, NULL),
(119, 16, 'packet', 0, 1.00, 70.00, 50.00, 2.00, 2, NULL),
(120, 48, 'packet', 0, 1.00, 127.00, 99.00, 1.00, 2, NULL),
(124, 27, 'packet', 0, 500.00, 48.00, 38.40, 1.00, 3, NULL),
(125, 6, 'packet', 0, 250.00, 39.00, 27.00, 1.00, 3, NULL),
(126, 28, 'loose', 1, 0.25, 75.00, 50.00, 21.75, 2, NULL),
(128, 51, 'packet', 0, 500.00, 134.00, 111.00, 1.00, 3, NULL),
(129, 53, 'packet', 1, 1.00, 180.00, 160.00, 5.00, 2, NULL),
(130, 52, 'packet', 0, 500.00, 100.00, 80.00, 1.00, 3, NULL),
(131, 9, 'packet', 0, 500.00, 74.00, 62.00, 1.00, 3, NULL),
(132, 10, 'packet', 0, 500.00, 79.00, 70.00, 1.00, 3, NULL),
(133, 83, 'loose', 1, 0.50, 45.00, 44.00, 3988.50, 2, NULL),
(145, 84, 'packet', 0, 5.00, 2075.00, 1597.00, 1.00, 7, NULL),
(146, 85, 'packet', 0, 500.00, 350.00, 300.00, 1.00, 4, NULL),
(147, 87, 'packet', 0, 500.00, 315.00, 307.00, 1.00, 4, NULL),
(150, 91, 'packet', 0, 200.00, 115.00, 108.00, 1.00, 3, NULL),
(151, 92, 'packet', 1, 200.00, 95.00, 66.00, 998.00, 3, NULL),
(152, 95, 'packet', 1, 200.00, 178.00, 88.00, 0.00, 3, NULL),
(153, 95, 'packet', 1, 100.00, 89.00, 48.00, 0.00, 3, NULL),
(154, 94, 'packet', 0, 100.00, 43.00, 40.00, 1.00, 3, NULL),
(155, 94, 'packet', 0, 200.00, 86.00, 68.00, 1.00, 3, NULL),
(156, 93, 'packet', 0, 100.00, 125.00, 56.00, 1.00, 3, NULL),
(157, 96, 'packet', 1, 100.00, 32.00, 31.00, 0.00, 3, NULL),
(158, 97, 'packet', 0, 200.00, 110.00, 89.00, 1.00, 3, NULL),
(159, 98, 'packet', 0, 400.00, 80.00, 45.00, 1.00, 3, NULL),
(160, 99, 'packet', 1, 200.00, 170.00, 99.00, 0.00, 3, NULL),
(161, 100, 'packet', 0, 100.00, 95.00, 70.00, 1.00, 3, NULL),
(162, 101, 'packet', 0, 1.00, 42.00, 25.00, 1.00, 2, NULL),
(165, 22, 'packet', 0, 250.00, 16.00, 14.00, 1.00, 3, NULL),
(169, 68, 'loose', 1, 0.50, 50.00, 49.00, 0.00, 2, NULL),
(171, 103, 'packet', 1, 500.00, 121.00, 85.00, 9974.00, 3, NULL),
(172, 104, 'packet', 0, 1.00, 210.00, 155.00, 1.00, 2, NULL),
(173, 105, 'packet', 0, 1.00, 220.00, 208.00, 1.00, 2, NULL),
(174, 106, 'packet', 0, 1.00, 187.00, 153.00, 1.00, 2, NULL),
(175, 107, 'packet', 0, 1.00, 189.00, 119.00, 1.00, 2, NULL),
(176, 108, 'packet', 0, 1.00, 260.00, 236.00, 1.00, 2, NULL),
(177, 103, 'packet', 1, 200.00, 50.00, 48.00, 10000.00, 3, NULL),
(178, 109, 'packet', 1, 250.00, 350.00, 245.00, 14.00, 7, NULL),
(179, 110, 'packet', 1, 1.00, 900.00, 630.00, 0.00, 2, NULL),
(180, 110, 'packet', 1, 500.00, 450.00, 315.00, 0.00, 3, NULL),
(182, 112, 'packet', 1, 500.00, 600.00, 420.00, 10.00, 4, NULL),
(183, 113, 'packet', 1, 100.00, 60.00, 50.00, 37.00, 3, NULL),
(184, 113, 'packet', 1, 200.00, 120.00, 100.00, 50.00, 3, NULL),
(185, 114, 'packet', 1, 1.00, 150.00, 125.00, 50.00, 1, NULL),
(186, 29, 'packet', 0, 500.00, 60.00, 50.00, 2.00, 3, NULL),
(187, 115, 'packet', 1, 100.00, 125.00, 100.00, 35.00, 3, NULL),
(188, 116, 'packet', 1, 50.00, 70.00, 50.00, 28.00, 3, NULL),
(189, 117, 'packet', 0, 500.00, 55.00, 35.00, 100.00, 3, NULL),
(190, 118, 'packet', 0, 500.00, 55.00, 35.00, 200.00, 3, NULL),
(191, 119, 'packet', 0, 1.00, 40.00, 20.00, 100.00, 1, NULL),
(192, 120, 'packet', 0, 250.00, 70.00, 40.00, 99.00, 3, NULL),
(193, 121, 'packet', 0, 1.00, 60.00, 53.00, 24.00, 2, NULL),
(194, 122, 'packet', 1, 500.00, 25.00, 1.00, 98.00, 3, NULL),
(195, 123, 'packet', 0, 200.00, 130.00, 100.00, 24.00, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_promo_codes`
--

CREATE TABLE `bl_promo_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `promo_code` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `no_of_users` int(11) NOT NULL,
  `minimum_order_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `discount_type` varchar(191) NOT NULL,
  `max_discount_amount` int(11) NOT NULL,
  `repeat_usage` tinyint(4) NOT NULL COMMENT '1-allowed, 0-Not Allowed',
  `no_of_repeat_usage` int(11) NOT NULL DEFAULT 0 COMMENT 'if repeat_usage = allowed(1) else NULL',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-active, 0-deactive',
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_purchase_requests`
--

CREATE TABLE `bl_purchase_requests` (
  `id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_variant_id` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=approved',
  `created_by` int(10) NOT NULL,
  `request_date` datetime NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_by` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bl_purchase_requests`
--

INSERT INTO `bl_purchase_requests` (`id`, `product_id`, `product_variant_id`, `qty`, `status`, `created_by`, `request_date`, `approved_date`, `approved_by`) VALUES
(15, 109, 178, 1, 0, 2, '2026-01-12 11:45:15', NULL, NULL),
(16, 36, 34, 1, 0, 2, '2026-01-12 11:45:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_rating_images`
--

CREATE TABLE `bl_rating_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_rating_id` int(11) NOT NULL,
  `image` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_return_requests`
--

CREATE TABLE `bl_return_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_roles`
--

CREATE TABLE `bl_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_roles`
--

INSERT INTO `bl_roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', NULL, NULL),
(2, 'Admin', 'web', NULL, NULL),
(3, 'Seller', 'web', NULL, NULL),
(4, 'Delivery Boy', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_role_has_permissions`
--

CREATE TABLE `bl_role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_role_has_permissions`
--

INSERT INTO `bl_role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2),
(9, 1),
(9, 2),
(10, 1),
(10, 2),
(10, 3),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 3),
(13, 1),
(13, 2),
(13, 3),
(14, 1),
(14, 2),
(14, 3),
(15, 1),
(15, 2),
(15, 3),
(16, 1),
(16, 2),
(16, 3),
(17, 1),
(17, 2),
(17, 3),
(18, 1),
(18, 2),
(18, 3),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2),
(20, 3),
(21, 1),
(21, 2),
(21, 3),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(40, 3),
(41, 1),
(41, 2),
(41, 3),
(42, 1),
(42, 2),
(42, 3),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(83, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(86, 1),
(86, 2),
(87, 1),
(87, 2),
(88, 1),
(88, 2),
(89, 1),
(89, 2),
(90, 1),
(90, 2),
(91, 1),
(91, 2),
(92, 1),
(92, 2),
(93, 1),
(93, 2),
(94, 1),
(94, 2),
(95, 1),
(95, 2),
(96, 1),
(96, 2),
(97, 1),
(97, 2),
(98, 1),
(98, 2),
(99, 1),
(99, 2),
(100, 1),
(100, 2),
(101, 1),
(101, 2),
(102, 1),
(102, 2),
(103, 1),
(103, 2),
(104, 1),
(104, 2),
(104, 3),
(104, 4),
(105, 1),
(105, 2),
(105, 3),
(105, 4),
(106, 1),
(106, 2),
(107, 1),
(107, 2),
(108, 1),
(108, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bl_sections`
--

CREATE TABLE `bl_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sequence` int(11) NOT NULL DEFAULT 0,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(191) NOT NULL,
  `short_description` varchar(191) NOT NULL,
  `product_type` varchar(191) NOT NULL,
  `product_ids` text DEFAULT NULL,
  `category_ids` text DEFAULT NULL,
  `only_category` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `position` varchar(191) NOT NULL,
  `style_app` varchar(191) NOT NULL,
  `banner_app` varchar(191) DEFAULT NULL,
  `style_web` varchar(191) NOT NULL,
  `banner_web` varchar(191) DEFAULT NULL,
  `background_color_for_light_theme` varchar(191) NOT NULL,
  `background_color_for_dark_theme` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_sections`
--

INSERT INTO `bl_sections` (`id`, `sequence`, `row_order`, `title`, `short_description`, `product_type`, `product_ids`, `category_ids`, `only_category`, `created_at`, `updated_at`, `position`, `style_app`, `banner_app`, `style_web`, `banner_web`, `background_color_for_light_theme`, `background_color_for_dark_theme`) VALUES
(1, 13, 0, 'Farm Fresh Picks', 'Wholesome freshness, unbeatable value', 'custom_products', '60,25,24,23,22,15,13,12,12,8,3', '', 0, '2025-08-13 10:50:18', '2025-11-27 11:02:32', 'custom_below_shop_by_brands', 'style_1', 'banner_section_style/1755062418_48626.jpg', 'style_4', 'banner_section_style/1755062418_70780.png', '', ''),
(2, 6, 0, 'The Leafy Corner', 'Your Green Shield to Healthy Living', 'custom_products', '58,34,14,5', '1', 0, '2025-08-18 13:46:35', '2025-11-24 12:23:15', 'below_category', 'style_1', '', 'style_1', '', '', ''),
(3, 7, 0, 'Eco Protein Basket', 'Nature’s protein, fresh from farms', 'custom_products', '107,104,103,52,52,51,10,10', '7', 0, '2025-08-18 13:58:48', '2025-11-24 12:26:17', 'below_category', 'style_1', '', 'style_1', '', '', ''),
(4, 3, 0, 'Natural Nourish', 'Fuel Your Day, the Natural Way', 'custom_products', '102,102,69,69,68,68,45,45,44,12', '', 0, '2025-08-18 14:00:53', '2025-11-24 12:16:26', 'below_category', 'style_1', '', 'style_1', '', '', ''),
(5, 5, 0, 'Mansoon bounty', 'Seasonal fruits for wellness', 'products_on_sale', NULL, '', 0, '2025-08-18 14:05:40', '2025-11-22 14:27:46', 'custom_below_shop_by_brands', 'style_1', '', 'style_1', '', '#80ffff', '#80ffff'),
(6, 6, 0, 'World of Exotics', 'A journey of taste with exotic fruits', 'all_products', NULL, '2,9', 0, '2025-08-18 14:06:29', '2025-11-22 14:27:52', 'custom_below_shop_by_brands', 'style_1', '', 'style_1', '', '', ''),
(7, 7, 0, 'Everyday Wellness', 'Bringing purity to everyday life', 'custom_products', '94,94,94,93,92,92,91,91,12,12,8,8,3,3,2,2', '', 0, '2025-08-31 18:18:15', '2025-11-22 14:27:56', 'custom_below_shop_by_brands', 'style_1', '', 'style_1', '', '', ''),
(8, 1, 0, 'Today\'s Deals', 'Grab freshness, grab happiness', 'custom_products', '123,116,115,114,113,113,103,103,92,92,83,83,53,53,29,29,28,28,18,16,16,12,12,2,2', '2', 0, '2025-09-22 09:31:23', '2026-01-02 12:20:33', 'top', 'style_5', '', 'style_1', '', '', ''),
(11, 9, 0, 'You might also like', 'You might also like', 'all_products', NULL, '9,11', 0, '2025-10-09 16:01:37', '2025-11-22 14:28:09', 'top', 'style_cart_3', '', 'style_1', '', '', ''),
(16, 2, 0, 'Fruit Paradise', 'Where every bite is pure bliss!', 'custom_products', '50,48,48,45,19,4,4', '2', 0, '2025-11-05 16:52:14', '2025-11-24 12:07:12', 'below_category', 'style_6', 'banner_section_style/1762590687_59565.png', 'style_1', '', '', ''),
(17, 4, 0, 'Special for you', 'Special for you', 'all_products', NULL, '2', 0, '2025-11-10 15:36:37', '2025-11-24 12:09:45', 'below_category', 'special_for_you_style', '', 'style_1', '', '', ''),
(18, 8, 0, 'Featured products', 'Featured products', 'all_products', NULL, '4', 0, '2025-11-10 15:37:38', '2025-11-24 12:27:49', 'below_category', 'featured_product_style', '', 'style_2', '', '', ''),
(19, 16, 0, 'why ecoleaf', 'why ecoleaf', 'all_products', NULL, '5', 0, '2025-11-10 15:38:21', '2025-11-24 18:12:45', 'custom_below_shop_by_brands', 'why_ecoleaf_style', '', 'style_1', '', '', ''),
(20, 14, 0, 'farmers', 'farmers', 'all_products', NULL, '6', 0, '2025-11-10 15:39:03', '2025-11-22 14:28:41', 'top', 'out_farmer_style', '', 'style_1', '', '', ''),
(21, 15, 0, 'feed back', 'feed back', 'all_products', NULL, '6', 0, '2025-11-10 15:39:30', '2025-11-22 14:28:47', 'top', 'customer_feedback_style', '', 'style_1', '', '', ''),
(22, 13, 0, 'Garden Nourish', 'Nourish Your Green World', 'custom_products', '112,110,110,109', '19', 0, '2025-11-24 18:03:54', '2025-12-24 10:37:03', 'custom_below_shop_by_brands', 'style_1', '', 'style_1', '', '', ''),
(23, 14, 0, 'test', 'test', 'custom_products', '121,120,119', '', 0, '2026-01-08 16:11:36', '2026-01-08 16:41:33', 'below_slider', 'style_cart_3', '', 'style_2', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `bl_sellers`
--

CREATE TABLE `bl_sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` text DEFAULT NULL,
  `store_name` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `store_url` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `store_description` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `pincode_id` int(11) DEFAULT NULL,
  `city_id` text DEFAULT NULL,
  `state` text DEFAULT NULL,
  `categories` text DEFAULT NULL,
  `account_number` text DEFAULT NULL,
  `bank_ifsc_code` text DEFAULT NULL,
  `account_name` text DEFAULT NULL,
  `bank_name` text DEFAULT NULL,
  `commission` int(11) DEFAULT 0,
  `status` tinyint(4) NOT NULL,
  `require_products_approval` tinyint(4) NOT NULL DEFAULT 0,
  `fcm_id` text DEFAULT NULL,
  `national_identity_card` text DEFAULT NULL,
  `address_proof` text DEFAULT NULL,
  `pan_number` text DEFAULT NULL,
  `tax_name` text DEFAULT NULL,
  `tax_number` text DEFAULT NULL,
  `customer_privacy` tinyint(4) DEFAULT 0,
  `latitude` varchar(191) DEFAULT NULL,
  `longitude` varchar(191) DEFAULT NULL,
  `place_name` varchar(191) DEFAULT NULL,
  `formatted_address` varchar(191) DEFAULT NULL,
  `forgot_password_code` varchar(191) DEFAULT NULL,
  `view_order_otp` tinyint(4) NOT NULL DEFAULT 0,
  `assign_delivery_boy` tinyint(4) NOT NULL DEFAULT 0,
  `fssai_lic_no` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `change_order_status_delivered` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_sellers`
--

INSERT INTO `bl_sellers` (`id`, `admin_id`, `name`, `store_name`, `slug`, `email`, `mobile`, `balance`, `store_url`, `logo`, `store_description`, `street`, `pincode_id`, `city_id`, `state`, `categories`, `account_number`, `bank_ifsc_code`, `account_name`, `bank_name`, `commission`, `status`, `require_products_approval`, `fcm_id`, `national_identity_card`, `address_proof`, `pan_number`, `tax_name`, `tax_number`, `customer_privacy`, `latitude`, `longitude`, `place_name`, `formatted_address`, `forgot_password_code`, `view_order_otp`, `assign_delivery_boy`, `fssai_lic_no`, `created_at`, `updated_at`, `deleted_at`, `remark`, `change_order_status_delivered`) VALUES
(1, 2, 'EcoLeaf Main Hub', 'EcoLeaf', 'ecoleaf-main-hub', 'farmer@ecofresh.in', '999999999', 0, 'null', 'sellers/1757916494_62213.png', 'null', 'Satara  Maharashtra', 0, '22,21,20,19,16', 'null', '20,19,18,15,14,11,10,9,7,6,5,4,2,1', '11111', '11111', '11111', 'TEST', 1, 1, 0, NULL, 'sellers/1755012685_26327.png', 'sellers/1755012685_39772.png', 'abcda1234a', 'null', 'null', 1, '17.688671', '74.005667', 'Satara', 'Satara, Maharashtra, India', NULL, 0, 0, NULL, '2025-08-12 21:01:25', '2026-01-01 12:52:20', NULL, 'null', '0'),
(14, 21, 'Ecoleaf Satara', 'Ecoleaf', 'ecoleaf-satara', 'satara@ecoleaf.store', '9876543210', 3386.79, 'null', 'sellers/1762075283_43617.jpg', 'null', 'Satara  Maharashtra', 0, '20', 'null', '17,9', '2345671890', 'HDFC4321', 'HDFC', 'HDFC', 1, 1, 0, NULL, 'sellers/1762075283_69885.jpg', 'sellers/1762075283_35358.jpg', 'TREC2345', '432', '12345678', 0, '17.688671', '74.005667', 'Satara', 'Satara, Maharashtra, India', NULL, 0, 0, NULL, '2025-11-02 14:51:23', '2025-12-21 20:31:59', NULL, 'null', '0'),
(15, 23, 'Ecoleaf Mumbai', 'Ecoleaf Mumbai', 'ecoleaf-mumbai', 'mumbai@gmail.com', '8976543210', 0, 'null', 'sellers/1763268130_64497.png', 'null', 'Devidas Building  Charni Road East', 0, '22,21', 'null', '17', '1234567890', 'TEDG', '123455678', 'hdfc', 1, 1, 0, NULL, 'sellers/1763268130_61183.png', 'sellers/1763268130_25951.jpg', 'GFRT43', '11', '3445', 0, '18.95775201101572', '72.8267084819702', 'Charni Road East', 'Devidas Building, Charni Road East, Cawasji Patel Tank, Bhuleshwar, Mumbai, Maharashtra 400004, India', NULL, 0, 0, NULL, '2025-11-16 10:12:10', '2025-11-16 10:34:35', NULL, 'null', '0');

-- --------------------------------------------------------

--
-- Table structure for table `bl_seller_commissions`
--

CREATE TABLE `bl_seller_commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_seller_commissions`
--

INSERT INTO `bl_seller_commissions` (`id`, `seller_id`, `category_id`, `commission`) VALUES
(1, 14, 17, 0),
(2, 14, 9, 0),
(3, 1, 18, 0),
(4, 1, 15, 0),
(5, 1, 14, 0),
(6, 1, 11, 0),
(7, 1, 10, 0),
(8, 1, 9, 0),
(9, 1, 7, 0),
(10, 1, 6, 0),
(11, 1, 5, 0),
(12, 1, 4, 0),
(13, 1, 2, 0),
(14, 1, 1, 0),
(15, 15, 17, 0),
(16, 1, 19, 0),
(17, 1, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bl_seller_transactions`
--

CREATE TABLE `bl_seller_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `type` text DEFAULT NULL,
  `txn_id` text DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `status` text DEFAULT NULL,
  `message` text DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_seller_wallet_transactions`
--

CREATE TABLE `bl_seller_wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_seller_wallet_transactions`
--

INSERT INTO `bl_seller_wallet_transactions` (`id`, `order_id`, `order_item_id`, `seller_id`, `type`, `amount`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 13, 14, 'credit', 37.62, 'Order Item Commission', 1, '2025-11-06 09:51:55', '2025-11-06 09:51:55'),
(2, 7, 14, 14, 'credit', 59.4, 'Order Item Commission', 1, '2025-11-06 09:51:55', '2025-11-06 09:51:55'),
(3, 9, 16, 14, 'credit', 37.62, 'Order Item Commission', 1, '2025-11-06 09:51:55', '2025-11-06 09:51:55'),
(4, 15, 23, 14, 'credit', 19.8, 'Order Item Commission', 1, '2025-11-06 09:51:55', '2025-11-06 09:51:55'),
(5, 21, 31, 14, 'credit', 37.62, 'Order Item Commission', 1, '2025-11-08 06:25:17', '2025-11-08 06:25:17'),
(6, 23, 33, 14, 'credit', 49.5, 'Order Item Commission', 1, '2025-11-08 06:25:17', '2025-11-08 06:25:17'),
(7, 23, 34, 14, 'credit', 75.24, 'Order Item Commission', 1, '2025-11-08 06:25:17', '2025-11-08 06:25:17'),
(8, 24, 35, 14, 'credit', 37.62, 'Order Item Commission', 1, '2025-11-08 06:25:17', '2025-11-08 06:25:17'),
(9, 38, 49, 14, 'credit', 74.25, 'Order Item Commission', 1, '2025-11-09 08:05:05', '2025-11-09 08:05:05'),
(10, 42, 53, 14, 'credit', 19.8, 'Order Item Commission', 1, '2025-11-09 08:05:05', '2025-11-09 08:05:05'),
(11, 43, 54, 14, 'credit', 75.24, 'Order Item Commission', 1, '2025-11-09 08:05:05', '2025-11-09 08:05:05'),
(12, 53, 66, 14, 'credit', 29.7, 'Order Item Commission', 1, '2025-11-12 10:22:29', '2025-11-12 10:22:29'),
(13, 56, 71, 14, 'credit', 65.34, 'Order Item Commission', 1, '2025-11-14 11:30:35', '2025-11-14 11:30:35'),
(14, 56, 73, 14, 'credit', 74.25, 'Order Item Commission', 1, '2025-11-15 09:57:36', '2025-11-15 09:57:36'),
(15, 64, 81, 14, 'credit', 168.3, 'Order Item Commission', 1, '2025-11-15 17:48:19', '2025-11-15 17:48:19'),
(16, 56, 70, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-11-16 10:00:57', '2025-11-16 10:00:57'),
(17, 56, 72, 14, 'credit', 87.12, 'Order Item Commission', 1, '2025-11-16 10:00:57', '2025-11-16 10:00:57'),
(18, 63, 80, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-11-18 10:21:00', '2025-11-18 10:21:00'),
(19, 65, 82, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-11-18 10:21:00', '2025-11-18 10:21:00'),
(20, 41, 52, 14, 'credit', 19.8, 'Order Item Commission', 1, '2025-11-18 16:19:08', '2025-11-18 16:19:08'),
(21, 35, 46, 14, 'credit', 63.36, 'Order Item Commission', 1, '2025-11-20 16:19:02', '2025-11-20 16:19:02'),
(22, 48, 61, 14, 'credit', 15.84, 'Order Item Commission', 1, '2025-11-20 16:19:02', '2025-11-20 16:19:02'),
(23, 92, 109, 14, 'credit', 85.14, 'Order Item Commission', 1, '2025-11-20 17:44:18', '2025-11-20 17:44:18'),
(24, 81, 98, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-11-24 10:04:14', '2025-11-24 10:04:14'),
(25, 83, 100, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-11-24 10:04:14', '2025-11-24 10:04:14'),
(26, 89, 106, 14, 'credit', 87.12, 'Order Item Commission', 1, '2025-11-24 10:04:14', '2025-11-24 10:04:14'),
(27, 107, 133, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-11-27 09:48:56', '2025-11-27 09:48:56'),
(28, 117, 144, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-12-04 10:55:33', '2025-12-04 10:55:33'),
(29, 118, 145, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-12-04 10:55:33', '2025-12-04 10:55:33'),
(30, 103, 129, 14, 'credit', 74.25, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(31, 104, 130, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(32, 112, 139, 14, 'credit', 35.64, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(33, 113, 140, 14, 'credit', 35.64, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(34, 114, 141, 14, 'credit', 35.64, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(35, 115, 142, 14, 'credit', 19.8, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(36, 116, 143, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(37, 120, 147, 14, 'credit', 84.15, 'Order Item Commission', 1, '2025-12-04 11:58:36', '2025-12-04 11:58:36'),
(38, 125, 152, 14, 'credit', 65.34, 'Order Item Commission', 1, '2025-12-19 17:19:15', '2025-12-19 17:19:15'),
(39, 125, 153, 14, 'credit', 336.6, 'Order Item Commission', 1, '2025-12-19 17:19:15', '2025-12-19 17:19:15'),
(40, 131, 159, 14, 'credit', 74.25, 'Order Item Commission', 1, '2025-12-19 17:19:15', '2025-12-19 17:19:15'),
(41, 134, 162, 14, 'credit', 65.34, 'Order Item Commission', 1, '2025-12-19 17:19:15', '2025-12-19 17:19:15'),
(42, 134, 163, 14, 'credit', 49.5, 'Order Item Commission', 1, '2025-12-19 17:19:15', '2025-12-19 17:19:15'),
(43, 136, 166, 14, 'credit', 87.12, 'Order Item Commission', 1, '2025-12-21 20:31:59', '2025-12-21 20:31:59'),
(44, 136, 167, 14, 'credit', 148.5, 'Order Item Commission', 1, '2025-12-21 20:31:59', '2025-12-21 20:31:59'),
(45, 139, 173, 14, 'credit', 87.12, 'Order Item Commission', 1, '2025-12-21 20:31:59', '2025-12-21 20:31:59'),
(46, 139, 174, 14, 'credit', 34.65, 'Order Item Commission', 1, '2025-12-21 20:31:59', '2025-12-21 20:31:59'),
(47, 139, 175, 14, 'credit', 17.82, 'Order Item Commission', 1, '2025-12-21 20:31:59', '2025-12-21 20:31:59'),
(48, 139, 176, 14, 'credit', 74.25, 'Order Item Commission', 1, '2025-12-21 20:31:59', '2025-12-21 20:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `bl_sessions`
--

CREATE TABLE `bl_sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_settings`
--

CREATE TABLE `bl_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variable` text NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_settings`
--

INSERT INTO `bl_settings` (`id`, `variable`, `value`) VALUES
(1, 'app_name', 'EcoLeaf'),
(2, 'support_number', '7666377587'),
(3, 'support_email', 'support@ecoleaf.in'),
(4, 'logo', 'logo/1762600335_71147.png'),
(5, 'purchase_code', '32f0d8ce-a8ee-45fd-bfc9-d3733915a1a2'),
(6, 'stripe_secret_key', '0'),
(7, 'stripe_publishable_key', '0'),
(8, 'stripe_webhook_secret_key', '0'),
(9, 'google_place_api_key', 'U2FsdGVkX1+uAZctZ4HSqk18V7ikpSDkDcsSdLZvFRTIylnQvkv0gBTdmmrDUtoliNt4+fZdwVEDSYeUpuz4IQ=='),
(10, 'apiKey', 'AIzaSyD7eUp0Ykd5D33crXhjkoRUA484axhT5q8'),
(11, 'app_mode_customer', '0'),
(12, 'app_mode_customer_remark', 'Customer App'),
(13, 'app_mode_seller', '0'),
(14, 'app_mode_seller_remark', ' '),
(15, 'app_mode_delivery_boy', '0'),
(16, 'app_mode_delivery_boy_remark', ' '),
(17, 'playstore_url', 'https://play.google.com/store/apps/details?id=com.agricoss.ecoleaf'),
(18, 'appstore_url', ' '),
(19, 'is_version_system_on', '1'),
(20, 'required_force_update', '1'),
(21, 'current_version', '1.1.2'),
(22, 'ios_is_version_system_on', '0'),
(23, 'ios_required_force_update', '0'),
(24, 'ios_current_version', '1.0.0'),
(25, 'system_configurations', '1'),
(26, 'system_timezone_gmt', '+05:30'),
(27, 'system_configurations_id', '13'),
(28, 'copyright_details', ''),
(29, 'store_address', 'satara'),
(30, 'map_latitude', '17.730598883764078'),
(31, 'map_longitude', '74.03994764035825'),
(32, 'currency', '₹'),
(33, 'currency_code', 'INR'),
(34, 'decimal_point', '0'),
(35, 'system_timezone', 'Asia/Kolkata'),
(36, 'default_city_id', '1'),
(37, 'site_title', 'ECOLEAF'),
(38, 'website_url', 'https://ecofresh.in/'),
(39, 'color', '#008000'),
(40, 'light_color', '#00e300'),
(41, 'dark_color', '#008000'),
(42, 'app_title', 'EcoLeaf'),
(43, 'app_tagline', ''),
(44, 'app_short_description', 'Ecoleaf is your trusted platform for buying farm-fresh, vegetables directly from local farmers, ensuring you receive the best quality produce at fair and honest prices.\r\nWe are an initiative of Maharashtra Organic Farmers Producer Company Limited, working with a mission to bridge the gap between farmers and consumers. By sourcing directly from our network of dedicated farmers, we eliminate unnecessary middlemen, guarantee transparency, and bring the goodness of fresh, naturally grown produce straight to your doorstep.\r\nOur commitment goes beyond just delivering vegetables — we strive to support sustainable farming practices, empower farmers with fair value for their hard work, and provide our customers with chemical-free, nutritious food that contributes to a healthier lifestyle.'),
(45, 'is_android_app', '1'),
(46, 'android_app_url', 'https://play.google.com/store/apps/details?id=com.user.ecofresh'),
(47, 'is_ios_app', '0'),
(48, 'ios_app_url', ''),
(49, 'ios_store_logo', ''),
(50, 'common_meta_title', 'ECOLEAF'),
(51, 'common_meta_description', 'Ecoleaf is your trusted platform for buying farm-fresh, vegetables directly from local farmers, ensuring you receive the best quality produce at fair and honest prices.'),
(52, 'show_color_picker_in_website', 'false'),
(53, 'placeholder_image', ''),
(54, 'loading', ''),
(55, 'website_mode', ''),
(56, 'website_mode_remark', ''),
(57, 'play_store_logo', 'front_end/play_store_logo/1759324456_75838.png'),
(58, 'favicon', 'front_end/favicon/1759324398_29808.png'),
(59, 'web_logo', 'front_end/web_logo/1759324456_71908.png'),
(60, 'one_seller_cart', '0'),
(61, 'seller_commission', '1'),
(62, 'payment_method_settings', '0'),
(63, 'cod_payment_method', '1'),
(64, 'cod_mode', 'global'),
(65, 'paypal_payment_method', 'undefined'),
(66, 'paypal_mode', '0'),
(67, 'paypal_currency_code', '0'),
(68, 'paypal_business_email', 'undefined'),
(69, 'paypal_notification_url', 'https://admin.ecofresh.in/customer/ipn'),
(70, 'payumoney_payment_method', 'undefined'),
(71, 'payumoney_mode', '0'),
(72, 'payumoney_merchant_key', 'undefined'),
(73, 'payumoney_merchant_id', 'undefined'),
(74, 'payumoney_salt', 'undefined'),
(75, 'razorpay_payment_method', '1'),
(76, 'razorpay_key', 'rzp_live_RBwBww6KE7IwTR'),
(77, 'razorpay_secret_key', 'CBmxAS4iRiugPK7CM6MNnlwL'),
(78, 'paystack_payment_method', 'undefined'),
(79, 'paystack_public_key', 'undefined'),
(80, 'paystack_secret_key', 'undefined'),
(81, 'paystack_currency_code', '0'),
(82, 'flutterwave_payment_method', 'undefined'),
(83, 'flutterwave_public_key', 'undefined'),
(84, 'flutterwave_secret_key', 'undefined'),
(85, 'flutterwave_encryption_key', 'undefined'),
(86, 'flutterwave_currency_code', '0'),
(87, 'stripe_payment_method', 'undefined'),
(88, 'stripe_webhook_url', 'https://admin.ecofresh.in/webhook/stripe'),
(89, 'stripe_currency_code', 'undefined'),
(90, 'stripe_mode', 'undefined'),
(91, 'paytm_payment_method', 'undefined'),
(92, 'paytm_mode', '0'),
(93, 'paytm_merchant_key', 'undefined'),
(94, 'paytm_merchant_id', 'undefined'),
(95, 'ssl_commerce_payment_method', 'undefined'),
(96, 'ssl_commerece_mode', '0'),
(97, 'ssl_commerece_store_id', 'undefined'),
(98, 'ssl_commerece_secret_key', 'undefined'),
(99, 'direct_bank_transfer', 'undefined'),
(100, 'account_name', 'undefined'),
(101, 'account_number', 'undefined'),
(102, 'bank_name', 'undefined'),
(103, 'bank_code', 'undefined'),
(104, 'notes', 'undefined'),
(105, 'midtrans_payment_method', 'undefined'),
(106, 'midtrans_mode', 'undefined'),
(107, 'midtrans_server_key', 'undefined'),
(108, 'midtrans_notification_url', 'https://admin.ecofresh.in/midtrans/callback'),
(109, 'midtrans_return_url', 'https://ecofresh.in//web-payment-status'),
(110, 'phonepay_payment_method', '0'),
(111, 'phonepay_mode', 'undefined'),
(112, 'phonepay_merchant_id', 'undefined'),
(113, 'phonepay_client_id', 'undefined'),
(114, 'phonepay_client_version', 'undefined'),
(115, 'phonepay_client_secret', 'undefined'),
(116, 'phonepay_payment_endpoint_url', 'undefined'),
(117, 'cashfree_payment_method', '0'),
(118, 'cashfree_mode', 'production'),
(119, 'cashfree_app_id', '106076542dd2e75137c0c29bcba5670601'),
(120, 'cashfree_secret_key', 'cfsk_ma_prod_0155846092971d1401246051ad1ab020_66ca6f3d'),
(121, 'cashfree_notification_url', 'https://admin.ecofresh.in/cashfree/callback'),
(122, 'paytabs_payment_method', 'undefined'),
(123, 'paytabs_mode', 'undefined'),
(124, 'paytabs_profile_id', 'undefined'),
(125, 'paytabs_secret_key', 'undefined'),
(126, 'paytabs_notification_url', 'https://admin.ecofresh.in/paytabs/callback'),
(127, 'max_cart_items_count', '1000'),
(128, 'min_order_amount', '50'),
(129, 'low_stock_limit', '0'),
(130, 'is_category_section_in_homepage', '1'),
(131, 'count_category_section_in_homepage', '100'),
(132, 'is_brand_section_in_homepage', ' '),
(133, 'count_brand_section_in_homepage', ' '),
(134, 'is_seller_section_in_homepage', '1'),
(135, 'count_seller_section_in_homepage', '100'),
(136, 'is_country_section_in_homepage', ' '),
(137, 'count_country_section_in_homepage', ' '),
(138, 'phone_login', '1'),
(139, 'phone_auth_otp', '1'),
(140, 'phone_auth_password', '0'),
(141, 'firebase_authentication', '1'),
(142, 'custom_sms_gateway_otp_based', '0'),
(143, 'google_login', '0'),
(144, 'smtp_from_mail', 'support@ecofresh.in'),
(145, 'smtp_reply_to', 'support@ecofresh.in'),
(146, 'smtp_email_password', 'Ecofresh$password'),
(147, 'smtp_host', 'mail.ecofresh.in'),
(148, 'smtp_port', '465'),
(149, 'smtp_content_type', 'text'),
(150, 'smtp_encryption_type', 'ssl'),
(151, 'authDomain', 'ecofresh-ca549.firebaseapp.com'),
(152, 'databaseURL', ' '),
(153, 'projectId', 'ecofresh-ca549'),
(154, 'storageBucket', 'ecofresh-ca549.firebasestorage.app'),
(155, 'messagingSenderId', '267370666300'),
(156, 'appId', '1:267370666300:web:f1fdac87c8e27d9211a639'),
(157, 'measurementId', 'G-JFWC1PHTWQ'),
(158, 'jsonFile', '{\"type\":\"service_account\",\"project_id\":\"ecofresh-ca549\",\"private_key_id\":\"5b24ec5b72ec1611bea83fae27ccda1353603feb\",\"private_key\":\"-----BEGIN PRIVATE KEY-----\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC+OtVARSxGYeqH\\nd1hyaq5hzFrUoUB+QfkJd4KMpH5oEkdcqGrznGZ1PekrYHhtjWojzXhl3jlsQCbe\\nwFObrL8ygANAqOQ2XeW6YnpZePtWPc7fuyLoPyeFmjJ2KKNR36uI3xY1e\\/LbIFKl\\nOXKbyvAcyz25b+g8q+UITPD\\/fG0R2UuQQn5hp78I\\/wDLtLvOUWgmsQ\\/y+GXnDhyE\\nNYWlvpMjnxanRNbRTpvsS+YbIdnAO8nnqCox036B+MPQeLEhO4dbZ\\/XcOKJ1RZYD\\nxg6Lmx+F\\/V6YP4i2VJ7wMgyiLTh\\/5KQ7CVUAWIgCvzT9ZEE0O1JwSH3rITvAwqse\\n8PFvmVFzAgMBAAECggEAH8YO6YHET+s586+M\\/+tuvhoWj85xScV2Nc0W6qvtCzAG\\naGUfHBqjCHEzWZHu+4lz0ZAXzJgOKlUayPkB3g5AD0zPfkTXfXc4kGWzfu9Ut8Zy\\nH++PeJBX5xpm1FKcWOgNrDpq6LsPyOcAtuU+DeSbL4wI\\/sjA1yV1B2pmlJ3xT9oc\\nSsirbVfZqR3Rq9SE9\\/wUl4FBSTud4AVVmMWDu9lQCxuq2vMSmQTcNgODkXqJ5FHN\\n4eVC4eoy6IhEk1GkPxuqMv80Ec9yk2OAS5kwJddRnPJwXg17mFxfVzUrGryiJOOO\\nOer3B5wymYIMZClArYDmQfSgb2CouHPjVGtWHwGh0QKBgQDp\\/g45LVahRkU3hGyK\\nLZzX+pqYeWdPFiC1xhQcUmWqLirlObYRaK0pL41Bj7nRBvLXRJJh\\/WGOlmlR63Jq\\n8UFOo1M\\/f7hV6HVK5jJOMhJDcEQqlEIaDdEdhxXRP9oLxjVR33YEh0IIsT+5OF6b\\nmTGGNmVsphR0o6\\/i++cX9zDlkQKBgQDQHxXN9NnnVFSTFqg2MyB6brgqZ7CoiLR8\\n1ChwXjuNAUtQe4JpB67a3lWHxIZ8fXgvCiVZ1wmgP61mg9w\\/RVfRl7dgGZqQj84p\\nM+xeXxb0\\/DgjOWt8S9V4aqdQ0etpZqiAefkv4deeLwXaUPOepGQcNhPjp4E3e6JP\\nRLYLCqk0wwKBgQCdzOSAsM+8YWxqfVbJdOtSSEIb07vU\\/QJAM\\/35\\/6NqOkpZXisn\\n4GTu4o+riCbzDXGVtTvW847oHw2V3mfCMUMuqjyJFTQWU3dOdKG2VFQ2wK5n3KYb\\ndffxptkSzbHZwOjSdxXbBfCFdiuYWKiM3KombebGd9ZRttX2CJWXdu+10QKBgBPB\\nb6NuQ6T211RjCTKj5chZbDfyQc2ttFxJE1GfUE3ROqH4J2fq58k046+QkyeMDXWB\\npAwEIpDImqApkiWbYnutyCViKM7iJ7K3kA9hPV+h9X46fB5\\/YFMe5KUCWDNYIFSZ\\nv3KxIHOOiSKxHn8Hoc0fwQGSK+zlWoHlxtYDfA5bAoGBAN4WX09oHEAMkhH5\\/wlq\\nywBJ+kXUOdYhRK32nymUq11z1Smq03m709O5vnEL8fuFbC7gmlCGflNDTmFY1Nk+\\n5nD2qx5U6HMAq+plMGTXXYb0\\/oTvDgCtjsfFgRdUeETEi5FdJkav9c\\/rsvWkZZ7M\\nQ1r4u58u\\/8YbNO2Rv0V3O2WQ\\n-----END PRIVATE KEY-----\\n\",\"client_email\":\"firebase-adminsdk-fbsvc@ecofresh-ca549.iam.gserviceaccount.com\",\"client_id\":\"106453529472801305210\",\"auth_uri\":\"https:\\/\\/accounts.google.com\\/o\\/oauth2\\/auth\",\"token_uri\":\"https:\\/\\/oauth2.googleapis.com\\/token\",\"auth_provider_x509_cert_url\":\"https:\\/\\/www.googleapis.com\\/oauth2\\/v1\\/certs\",\"client_x509_cert_url\":\"https:\\/\\/www.googleapis.com\\/robot\\/v1\\/metadata\\/x509\\/firebase-adminsdk-fbsvc%40ecofresh-ca549.iam.gserviceaccount.com\",\"universe_domain\":\"googleapis.com\"}'),
(159, 'privacy_policy', '<p>Privacy Policy</p>\n<p>Introduction<br>This Privacy Policy describes how AYURSANSKAR WELLNESS CENTER and its affiliates (collectively &amp;quot;AYURSANSKAR WELLNESS CENTER, we, our, us&amp;quot;) collect, use, share, protect or otherwise process your information/ personal data through our website https://ecofresh.in (hereinafter referred to as Platform). Please note that you may be able to browse certain sections of the Platform without registering with us.We do not offer any product/service under this Platform outside India and your personal data will primarily be stored and processed in India. By visiting this Platform, providing your information or availing any product/service offered on the Platform, you expressly agree to be bound by the terms and conditions of this Privacy Policy, the Terms of Use and the applicable service/product terms and conditions, and agree to be governed by the laws of India including but not limited to the laws applicable to data protection and privacy. If you do not agree please do not use or access our Platform.</p>\n<p>Collection-We collect your personal data when you use our Platform, services or otherwise interact with us during the course of our relationship.and related information provided from time to time. Some of the information that we may collect includes but is not limited to personal data / information provided to us during sign-up/registering or using our Platform such as name, date of birth, address, telephone/mobile number, email IDand/or any such information shared as proof of identity or address. Some of the sensitive personal data may be collected with your consent, such as your bank account or credit or debit card or other payment instrument information or biometric information such as your facial features or physiological information (in order to enable use of certain features when opted for, available on the Platform) etc all of the above being in accordance with applicable law(s) You always have the option to not provide information, by choosing not to use a particular service or feature on the Platform. We may track your behaviour, preferences, and other information that you choose to provide on our Platform. This information is compiled and analysed on an aggregated basis. We will also collect your information related to your transactions on Platform and such third-party business partner platforms. When such a third-party business partner collects your personal data directly from you, you will be governed by their privacy policies. We shall not be responsible for the third-party business partner?s privacy practices or the content of their privacy policies, and we request you to read their privacy policies prior to disclosing any information. If you receive an email, a call from a person/association claiming to be AYURSANSKAR WELLNESS CENTER seeking any personal data like debit/credit card PIN, net-banking or mobile banking password, we request you to never provide such information. If you have already revealed such information, report it immediately to an appropriate law enforcement agency.</p>\n<p>Usage- We use personal data to provide the services you request. To the extent we use your personal data to market to you, we will provide you the ability to opt-out of such uses. We use your personal data to assist sellers and business partners in handling and fulfilling orders; enhancing customer experience; to resolve disputes; troubleshoot problems; inform you about online and offline offers, products, services, and updates; customise your experience; detect and protect us against error, fraud and other criminal activity; enforce our terms and conditions; conduct marketing research, analysis and surveys; and as otherwise described to you at the time of collection of information. You understand that your access to these products/services may be affected in the event permission is not provided to us.</p>\n<p>Sharing- We may share your personal data internally within our group entities, our other corporate entities, and affiliates to provide you access to the services and products offered by them. These entities and affiliates may market to you as a result of such sharing unless you explicitly opt-out. We may disclose personal data to third parties such as sellers, business partners, third party service providers including logistics partners, prepaid payment instrument issuers, third-party reward programs and other payment opted by you. These disclosure may be required for us to provide you access to our services and products offered to you, to comply with our legal obligations, to enforce our user agreement, to facilitate our marketing and advertising activities, to prevent, detect, mitigate, and investigate fraudulent or illegal activities related to our services. We may disclose personal and sensitive personal data to government agencies or other authorised law enforcement agencies if required to do so by law or in the good faith belief that such disclosure is reasonably necessary to respond to subpoenas, court orders, or other legal process. We may disclose personal data to law enforcement offices, third party rights owners, or others in the good faith belief that such disclosure is reasonably necessary to: enforce our Terms of Use or Privacy Policy; respond to claims that an advertisement, posting or other content violates the rights of a third party; or protect the rights, property or personal safety of our users or the general public.</p>\n<p>Security Precautions- To protect your personal data from unauthorised access or disclosure, loss or misuse we adopt reasonable security practices and procedures. Once your information is in our possession or whenever you access your account information, we adhere to our security guidelines to protect it against unauthorised access and offer the use of a secure server. However, the transmission of information is not completely secure for reasons beyond our control. By using the Platform, the users accept the security implications of data transmission over the internet and the World Wide Web which cannot always be guaranteed as completely secure, and therefore, there would always remain certain inherent risks regarding use of the Platform. Users are responsible for ensuring the protection of login and password records for their account.</p>\n<p>Data Deletion and Retention- You have an option to delete your account by visiting your profile and settings on our Platform , this action would result in you losing all information related to your account. You may also write to us at the contact information provided below to assist you with these requests. We may in event of any pending grievance, claims, pending shipments or any other services we may refuse or delay deletion of the account. Once the account is deleted, you will lose access to the account. We retain your personal data information for a period no longer than is required for the purpose for which it was collected or as required under any applicable law. However, we may retain data related to you if we believe it may be necessary to prevent fraud or future abuse or for other legitimate purposes. We may continue to retain your data in anonymised form for analytical and research purposes.</p>\n<p>Your Rights- You may access, rectify, and update your personal data directly through the functionalities provided on the Platform.</p>\n<p>Consent- By visiting our Platform or by providing your information, you consent to the collection, use, storage, disclosure and otherwise processing of your information on the Platform in accordance with this Privacy Policy. If you disclose to us any personal data relating to other people, you represent that you have the authority to do so and permit us to use the information in accordance with this Privacy Policy. You, while providing your personal data over the Platform or any partner platforms or establishments, consent to us (including our other corporate entities, affiliates, lending partners, technology partners, marketing channels, business partners and other third parties) to contact you through SMS, instant messaging apps, call and/or e-mail for the purposes specified in this Privacy Policy. You have an option to withdraw your consent that you have already provided by writing to the Grievance Officer at the contact information provided below. Please mention ?Withdrawal of consent for processing personal data? in your subject line of your communication. We may verify such requests before acting on our request. However, please note that your withdrawal of consent will not be retrospective and will be in accordance with the Terms of Use, this Privacy Policy, and applicable laws. In the event you withdraw consent given to us under this Privacy Policy, we reserve the right to restrict or deny the provision of our services for which we consider such information to be necessary.</p>\n<p>Changes to this Privacy Policy- Please check our Privacy Policy periodically for changes. We may update this Privacy Policy to reflect changes to our information practices. We may alert / notify you about the significant changes to the Privacy Policy, in the manner as may be required under applicable laws.</p>\n<p>Grievance Officer</p>\n<p>Name of the Officer: Janhvi Sawant</p>\n<p>Designation: Grievance Officer</p>\n<p>At Post Pathkal, Tal. Dist. Satara - 415011 Maharashtra</p>\n<p>Contact us:&nbsp;</p>\n<p>Time: Monday - Friday(9:00 AM- 6:00 PM)<br>Refund and Cancellation policy</p>\n<p>This refund and cancellation policy outlines how you can cancel or seek a refund for a product / service that you have purchased through the Platform. Under this policy:</p>\n<p>Cancellations will only be considered if the request is made 3 days of placing the order. However, cancellation requests may not be entertained if the orders have been communicated to such sellers / merchant(s) listed on the Platform and they have initiated the process of shipping them, or the product is out for delivery. In such an event, you may choose to reject the product at the doorstep.&nbsp;</p>\n<p>AYURSANSKAR WELLNESS CENTER does not accept cancellation requests for perishable items like flowers, eatables, etc. However, the refund / replacement can be made if the user establishes that the quality of the product delivered is not good.&nbsp;</p>\n<p>In case of receipt of damaged or defective items, please report to our customer service team. The request would be entertained once the seller/ merchant listed on the Platform, has checked and determined the same at its own end. This should be reported within 3 days of receipt of products. In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within 3 days of receiving the product. The customer service team after looking into your complaint will take an appropriate decision.&nbsp;</p>\n<p>In case of complaints regarding the products that come with a warranty from the manufacturers, please refer the issue to them.&nbsp;</p>\n<p>In case of any refunds approved by AYURSANSKAR WELLNESS CENTER, it will take 3 days for the refund to be processed to you.<br>Return&nbsp;</p>'),
(160, 'returns_and_exchanges_policy', '<p>The fruits and vegetables and flowers the return will be considered with in 24 hours&nbsp;<br>the rest of the products which are storable will be considered after inspecting we will process the return in 1-2 days.</p>'),
(161, 'shipping_policy', '<p>The orders for the user are delivery through registered domestic courier companies and/or speed post only. Orders &nbsp;will be delivered within 4 days from the date of the order and/or payment or as per the delivery date agreed at the time of order confirmation and delivering of the shipment, subject to courier company / post office norms. Platform Owner shall not be liable for any delay in delivery by the courier company / postal authority. Delivery of all orders will be made to the address provided by the buyer at the time of purchase. Delivery of our services will be confirmed on your email ID as specified at the time of registration. If there are any shipping cost(s) levied by the seller or the Platform Owner (as the case be), the same is not refundable.</p>\n<p>The fruits and flowers will be delivered with in 24- hours once we accepted the order.</p>'),
(162, 'cancellation_policy', '<p class=\"MsoNormal\">Refund and Cancellation policy</p>\n<p class=\"MsoNormal\">This refund and cancellation policy outlines how you can cancel or seek a refund for a product / service</p>\n<p class=\"MsoNormal\">that you have purchased through the Platform. Under this policy:</p>\n<ol>\n<li class=\"MsoNormal\">Cancellations will only be considered if the request is made of placing the order. However,3 days cancellation requests may not be entertained if the orders have been communicated to such sellers / merchant(s) listed on the Platform and they have initiated the process of shipping them, or the product is out for delivery. In such an event, you may choose to reject the product at the doorstep.</li>\n<li class=\"MsoNormal\">In case of receipt of damaged or defective items, please report to our customer service team. The request would be entertained once the seller/ merchant listed on the Platform, has checked and determined the same at its own end. This should be reported within of receipt of products.3 days In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within of receiving the product. The3 days customer service team after looking into your complaint will take an appropriate decision.</li>\n<li class=\"MsoNormal\">In case of complaints regarding the products that come with a warranty from the manufacturers, please refer the issue to them.</li>\n<li class=\"MsoNormal\">In case of any refunds approved by , it will takeAYURSANSKAR WELLNESS CENTER 3 days</li>\n<li class=\"MsoNormal\">The fruits and flowers&nbsp; will be delivered with in 24- hours once we accepted the oder</li>\n</ol>\n<p class=\"MsoNormal\">for the refund to be processed to you</p>'),
(163, 'terms_conditions', '<p>Terms &amp; Conditions</p>\n<p><br>This document is an electronic record in terms of Information Technology Act, 2000 and rules there under as applicable and the amended provisions pertaining to electronic records in various statutes as amended by the Information Technology Act, 2000. This electronic record is generated by a computer system and does not require any physical or digital signatures.</p>\n<p>This document is published in accordance with the provisions of Rule 3 (1) of the Information Technology (Intermediaries guidelines) Rules, 2011 that require publishing the rules and regulations, privacy policy and Terms of Use for access or usage of domain name https://ecofresh.in (\'Website\'), including the related mobile site and mobile application (hereinafter referred to as \'Platform\').</p>\n<p>The Platform is owned by AYURSANSKAR WELLNESS CENTER, a company incorporated under the Companies Act, 1956 with its registered office at 310 1 C, AT PATKHAL, POST PATKHAL SATARA PATKHAL ,Satara ,India (hereinafter referred to as ?Platform Owner?, \'we\', \'us\', \'our\')..</p>\n<p>Your use of the Platform and services and tools are governed by the following terms and conditions (?Terms of Use?) as applicable to the Platform including the applicable policies which are incorporated herein by way of reference. If You transact on the Platform, You shall be subject to the policies that are applicable to the Platform for such transaction. By mere use of the Platform, You shall be contracting with the Platform Owner and these terms and conditions including the policies constitute Your binding obligations, with Platform Owner. These Terms of Use relate to your use of our website, goods (as applicable) or services (as applicable) (collectively, \'Services\'). Any terms and conditions proposed by You which are in addition to or which conflict with these Terms of Use are expressly rejected by the Platform Owner and shall be of no force or effect. These Terms of Use can be modified at any time without assigning any reason. It is your responsibility to periodically review these Terms of Use to stay informed of updates..</p>\n<p>&nbsp;For the purpose of these Terms of Use, wherever the context so requires ?you?, \'your\' or ?user? shall mean any natural or legal person who has agreed to become a user/buyer on the Platform..</p>\n<p>ACCESSING, BROWSING OR OTHERWISE USING THE PLATFORM INDICATES YOUR AGREEMENT TO ALL THE TERMS AND CONDITIONS UNDER THESE TERMS OF USE, SO PLEASE READ THE TERMS OF USE CAREFULLY BEFORE PROCEEDING..</p>\n<p>The use of Platform and/or availing of our Services is subject to the following Terms of Use:</p>\n<p>To access and use the Services, you agree to provide true, accurate and complete information to us during and after registration, and you shall be responsible for all acts done through the use of your registered account on the Platform..</p>\n<p>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials offered on this website or through the Services, for any specific purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law..</p>\n<p>Your use of our Services and the Platform is solely and entirely at your own risk and discretion for which we shall not be liable to you in any manner. You are required to independently assess and ensure that the Services meet your requirements..</p>\n<p>The contents of the Platform and the Services are proprietary to us and are licensed to us. You will not have any authority to claim any intellectual property rights, title, or interest in its contents. The contents includes and is not limited to the design, layout, look and graphics..</p>\n<p>You acknowledge that unauthorized use of the Platform and/or the Services may lead to action against you as per these Terms of Use and/or applicable laws..</p>\n<p>You agree to pay us the charges associated with availing the Services..</p>\n<p>You agree not to use the Platform and/ or Services for any purpose that is unlawful, illegal or forbidden by these Terms, or Indian or local laws that might apply to you.</p>\n<p>You agree and acknowledge that website and the Services may contain links to other third party websites. On accessing these links, you will be governed by the terms of use, privacy policy and such other policies of such third party websites. These links are provided for your convenience for provide further information..</p>\n<p>You understand that upon initiating a transaction for availing the Services you are entering into a legally binding and enforceable contract with the Platform Owner for the Services..</p>\n<p>You shall indemnify and hold harmless Platform Owner, its affiliates, group companies (as applicable) and their respective officers, directors, agents, and employees, from any claim or demand, or actions including reasonable attorney\'s fees, made by any third party or penalty imposed due to or arising out of Your breach of this Terms of Use, privacy Policy and other Policies, or Your violation of any law, rules or regulations or the rights (including infringement of intellectual property rights) of a third party.</p>\n<p>Notwithstanding anything contained in these Terms of Use, the parties shall not be liable for any failure to perform an obligation under these Terms if performance is prevented or delayed by a force majeure event..</p>\n<p>These Terms and any dispute or claim relating to it, or its enforceability, shall be governed by and construed in accordance with the laws of India..</p>\n<p>All disputes arising out of or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts in Satara and Maharashtra.</p>\n<p>All concerns or communications relating to these Terms must be communicated to us using the contact information provided on this website</p>'),
(164, 'about_us', '<p class=\"MsoNormal\"><strong>Ecoleaf</strong> is your trusted platform for buying <strong>farm-fresh vegetables directly from local farmers</strong>, ensuring you receive the <strong>best quality produce at fair and honest prices</strong>.</p>\n<p class=\"MsoNormal\">We are an initiative of <strong>Maharashtra Organic Farmers Producer Company Limited</strong>, working with a mission to <strong>bridge the gap between farmers and consumers</strong>. By sourcing directly from our network of dedicated farmers, we eliminate unnecessary middlemen, guarantee transparency, and bring the goodness of fresh, naturally grown produce straight to your doorstep.</p>\n<p class=\"MsoNormal\">Our commitment goes beyond just delivering vegetables &mdash; we strive to <strong>support sustainable farming practices</strong>, empower farmers with fair value for their hard work, and provide our customers with chemical-free, nutritious food that contributes to a healthier lifestyle.</p>\n<p class=\"MsoNormal\">With Ecoleaf, you are not just purchasing vegetables; you are also supporting the livelihoods of farmers and contributing to the growth of a cleaner, healthier, and more sustainable future.</p>\n<p class=\"MsoNormal\">&nbsp;</p>\n<p class=\"MsoNormal\"><strong>Company Details</strong></p>\n<p class=\"MsoNormal\"><strong>Company Name:</strong> Maharashtra Organic Farmers Producer Company Limited (Ecoleaf)<br><strong>FSSAI License Number:</strong> 11525039000226</p>\n<p class=\"MsoNormal\"><strong>Registered Address:</strong><br>Maharashtra Organic Farmers Producer Company Limited<br>S.No 19-20/A, Plot No.92, LG-5, Sakhargad below Hotel Pride Excecutive Godoli, Satara, Maharashtra- 415001</p>'),
(165, 'contact_us', '<p data-start=\"162\" data-end=\"378\">At <strong data-start=\"165\" data-end=\"177\">EcoLeaf</strong>, we value your trust and are always here to assist you. Whether you have a question about our fresh produce, need help with your order, or simply want to share feedback, our team is ready to listen.</p>\n<hr data-start=\"380\" data-end=\"383\">\n<h3 data-start=\"385\" data-end=\"407\"><strong data-start=\"389\" data-end=\"405\">Get in Touch</strong></h3>\n<p data-start=\"408\" data-end=\"537\">📍 <strong data-start=\"411\" data-end=\"423\">Address:</strong> S.No 19-20/A, Plot No.92, LG-5, Sakhargad below Hotel Pride Excecutive Godoli, Satara, Maharashtra- 415001<br data-start=\"458\" data-end=\"461\">📧 <strong data-start=\"464\" data-end=\"474\">Email:</strong> <a class=\"cursor-pointer\" rel=\"noopener\" data-start=\"475\" data-end=\"495\">support@ecoleaf.com</a><br data-start=\"495\" data-end=\"498\">📞 <strong data-start=\"501\" data-end=\"520\">Phone/WhatsApp:</strong> +91-7666377587</p>'),
(166, 'email_login', '0'),
(167, 'google_map_api_key', 'U2FsdGVkX1/EhcrjMl12BNSIvoNe2ks2RGHVTJo76FoH10cnX7XsZu3whZv/YZ8CLvxSQcn1U6z2/os3YN/+iQ=='),
(168, 'googleMapApiKey', 'AIzaSyD7eUp0Ykd5D33crXhjkoRUA484axhT5q8'),
(169, 'time_slots_is_enabled', 'true'),
(170, 'time_slots_allowed_days', '7'),
(171, 'delivery_estimate_days', '1'),
(172, 'referral_min_order_amount', '0'),
(173, 'referral_credit_first_order', '0'),
(174, 'delivery_boy_bonus_settings', '0'),
(175, 'delivery_boy_bonus_type', '0'),
(176, 'delivery_boy_bonus_percentage', '0'),
(177, 'delivery_boy_bonus_min_amount', '0'),
(178, 'delivery_boy_bonus_max_amount', '0'),
(179, 'generate_otp', '1'),
(180, 'enable_road_path_tracking', '1'),
(181, 'apple_login', '1'),
(182, 'popup_enabled', '1'),
(183, 'popup_always_show_home', '0'),
(184, 'popup_type', 'category'),
(185, 'popup_type_id', '1'),
(186, 'popup_url', ''),
(187, 'popup_image', 'offers/1766899315_popup_8401.png'),
(188, 'point_convert', '1'),
(189, 'packaging_data', '[{\"id\":\"1\",\"title\":\"Paper Bag\",\"price\":\"5\"},{\"id\":\"2\",\"title\":\"Carton Box\",\"price\":\"45\"},{\"id\":\"3\",\"title\":\"Cotton Bag\",\"price\":\"15\"}]'),
(190, 'phonepe_mid', 'M236PQSHJG53N'),
(191, 'cancelled_order_min', '0'),
(192, 'cart_notification', '0'),
(193, 'prepaid_discount', '1'),
(194, 'additional_charges', '[{\"title\":\"Handling Charge\",\"amount\":\"0\"}]'),
(195, 'min_amount_for_offer_order', '199');

-- --------------------------------------------------------

--
-- Table structure for table `bl_sliders`
--

CREATE TABLE `bl_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `type_id` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `slider_url` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-active, 0-deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_sliders`
--

INSERT INTO `bl_sliders` (`id`, `type`, `type_id`, `image`, `slider_url`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', '0', 'sliders/1757337171_12621.jpg', 'null', 0, '2025-08-13 12:24:01', '2025-09-08 18:42:51'),
(2, 'category', '20', 'sliders/1767349838_75175.jpg', 'null', 1, '2025-08-13 14:52:13', '2026-01-02 16:09:03'),
(3, 'default', '0', 'sliders/1756128319_93728.jpg', 'null', 0, '2025-08-13 17:55:38', '2026-01-01 17:46:49'),
(4, 'category', '2', 'sliders/1758720654_64969.jpeg', 'null', 0, '2025-08-23 18:52:05', '2026-01-02 16:02:08'),
(6, 'category', '20', 'sliders/1767264803_51985.jpg', 'null', 1, '2026-01-01 12:18:26', '2026-01-01 16:23:23'),
(7, 'category', '9', 'sliders/1767347864_92724.jpg', 'null', 1, '2026-01-02 14:31:10', '2026-01-02 15:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `bl_sms_templates`
--

CREATE TABLE `bl_sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_sms_templates`
--

INSERT INTO `bl_sms_templates` (`id`, `title`, `message`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Your Order Has Been Placed - Order #{order.id}', 'Dear [Customer Name], your order #[Order ID] has been successfully placed. You will receive updates as your order is processed. Thank you for shopping with us!', 'customer_place_order', '2025-08-12 12:01:24', NULL),
(2, 'Payment Pending for Order #{order.id}', 'Dear [Customer Name], your order [Order ID] is awaiting payment. Please complete the payment to process your order. If you need assistance, contact [Support Contact].', 'customer_order_payment_pending', '2025-08-12 12:01:24', NULL),
(3, 'Your Order Has Been Received - Order #{order.id}', 'Dear [Customer Name], we have received your order [Order ID] and it\'s now being processed. You will receive updates on shipping soon. Thank you for choosing [Store Name]!', 'customer_order_received', '2025-08-12 12:01:24', NULL),
(4, 'Your Order Has Been Processed - Order #{order.id}', 'Dear [Customer Name], your order [Order ID] has been processed and is ready for shipment. You will be notified once it\'s on the way. Thank you for shopping with us!', 'customer_order_processed', '2025-08-12 12:01:24', NULL),
(5, 'Your Order Has Been Shipped - Order #{order.id}', 'Dear [Customer Name], your order [Order ID] has been shipped. Thank you for choosing [Store Name]!', 'customer_order_shipped', '2025-08-12 12:01:24', NULL),
(6, 'Your Order is Out for Delivery - Order #{order.id}', 'Dear [Customer Name], your order [Order ID] is out for delivery and will reach you soon. Please be available to receive your package. Thank you!', 'customer_order_out_for_delivery', '2025-08-12 12:01:24', NULL),
(7, 'Your Order Has Been Delivered - Order #{order.id}', 'Dear [Customer Name], your order [Order ID] has been successfully delivered. We hope you enjoy your purchase. Thank you for shopping at [Store Name]!', 'customer_order_delivered', '2025-08-12 12:01:24', NULL),
(8, 'Your Order Has Been Cancelled - Order #{order.id}', 'Dear [Customer Name], your order Item [Product Name] from Order [Order ID] has been cancelled. If you have any questions or wish to place a new order, please contact [Support Contact].', 'customer_order_cancelled', '2025-08-12 12:01:24', NULL),
(9, 'Return Request Received for Order #{order.id}', 'Dear [Customer Name], we have received your return request for order Item [Product Name] from Order [Order ID]. Our team will review it and get back to you shortly with the next steps.', 'customer_order_return_request', '2025-08-12 12:01:24', NULL),
(10, 'Return Request Approved - Order #{order.id}', 'Dear [Customer Name], your return request for order Item [Product Name] from Order [Order ID] has been approved. The refund amount will be credited to your wallet. Thank you!', 'customer_order_confirm_return_request', '2025-08-12 12:01:24', NULL),
(11, 'Return Request Rejected - Order #{order.id}', 'Dear [Customer Name], your return request for order Item [Product Name] from Order [Order ID] has been rejected. Reason: [Reason]. If you have any questions, please contact our support team. Thank you for understanding.', 'customer_order_reject_return_request', '2025-08-12 12:01:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_sms_verifications`
--

CREATE TABLE `bl_sms_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(191) NOT NULL,
  `otp` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_social_media`
--

CREATE TABLE `bl_social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` text NOT NULL,
  `link` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_stock_notify`
--

CREATE TABLE `bl_stock_notify` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_stock_notify`
--

INSERT INTO `bl_stock_notify` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '2025-11-04 12:41:58', '2025-11-04 12:41:58'),
(2, 11, 1, '2025-11-04 12:42:41', '2025-11-04 12:42:41'),
(3, 12, 1, '2025-11-04 12:44:42', '2025-11-04 12:44:42'),
(4, 68, 10, '2025-11-11 11:16:18', '2025-11-11 11:16:18'),
(5, 45, 10, '2025-11-11 11:16:59', '2025-11-11 11:16:59'),
(6, 43, 10, '2025-11-11 11:17:08', '2025-11-11 11:17:08'),
(7, 101, 16, '2025-11-15 15:52:21', '2025-11-15 15:52:21'),
(8, 16, 12, '2025-11-17 11:10:54', '2025-11-17 11:10:54'),
(9, 104, 12, '2025-11-17 11:25:15', '2025-11-17 11:25:15'),
(10, 83, 88, '2025-11-20 16:34:03', '2025-11-20 16:34:03'),
(11, 83, 74, '2025-11-20 16:38:39', '2025-11-20 16:38:39'),
(12, 83, 78, '2025-11-20 16:39:36', '2025-11-20 16:39:36'),
(13, 3, 49, '2025-11-21 09:13:28', '2025-11-21 09:13:28'),
(14, 58, 83, '2025-11-22 07:48:07', '2025-11-22 07:48:07'),
(15, 14, 83, '2025-11-22 07:48:14', '2025-11-22 07:48:14'),
(16, 5, 83, '2025-11-22 07:48:22', '2025-11-22 07:48:22'),
(17, 24, 16, '2025-11-24 12:44:30', '2025-11-24 12:44:30'),
(18, 21, 16, '2025-11-24 12:44:31', '2025-11-24 12:44:31'),
(19, 37, 10, '2025-11-24 20:28:35', '2025-11-24 20:28:35'),
(20, 15, 10, '2025-11-24 20:28:36', '2025-11-24 20:28:36'),
(21, 21, 10, '2025-11-24 20:28:40', '2025-11-24 20:28:40'),
(22, 45, 97, '2025-11-26 18:37:45', '2025-11-26 18:37:45'),
(23, 12, 16, '2025-11-29 09:58:35', '2025-11-29 09:58:35'),
(24, 59, 16, '2025-11-29 15:12:33', '2025-11-29 15:12:33'),
(25, 18, 16, '2025-11-30 14:11:53', '2025-11-30 14:11:53'),
(26, 16, 16, '2025-11-30 14:12:03', '2025-11-30 14:12:03'),
(27, 92, 49, '2025-12-02 19:51:12', '2025-12-02 19:51:12'),
(28, 58, 49, '2025-12-02 19:51:33', '2025-12-02 19:51:33'),
(29, 92, 16, '2025-12-03 14:27:04', '2025-12-03 14:27:04'),
(30, 8, 106, '2025-12-06 07:39:12', '2025-12-06 07:39:12'),
(31, 15, 107, '2025-12-09 09:34:48', '2025-12-09 09:34:48'),
(32, 43, 107, '2025-12-09 09:34:59', '2025-12-09 09:34:59'),
(33, 4, 107, '2025-12-09 09:35:08', '2025-12-09 09:35:08'),
(34, 6, 107, '2025-12-09 09:35:11', '2025-12-09 09:35:11'),
(35, 27, 107, '2025-12-09 09:35:23', '2025-12-09 09:35:23'),
(36, 34, 107, '2025-12-09 09:35:24', '2025-12-09 09:35:24'),
(37, 45, 78, '2025-12-11 17:49:32', '2025-12-11 17:49:32'),
(38, 12, 78, '2025-12-11 17:49:37', '2025-12-11 17:49:37'),
(39, 2, 78, '2025-12-16 10:34:52', '2025-12-16 10:34:52'),
(40, 15, 136, '2025-12-25 08:54:13', '2025-12-25 08:54:13'),
(41, 101, 154, '2025-12-27 13:28:53', '2025-12-27 13:28:53'),
(42, 19, 157, '2025-12-29 16:37:22', '2025-12-29 16:37:22'),
(43, 15, 157, '2025-12-29 16:41:13', '2025-12-29 16:41:13'),
(44, 22, 114, '2025-12-29 19:28:48', '2025-12-29 19:28:48'),
(45, 60, 114, '2025-12-29 19:29:05', '2025-12-29 19:29:05'),
(46, 25, 106, '2026-01-01 00:24:14', '2026-01-01 00:24:14'),
(47, 51, 37, '2026-01-02 17:33:03', '2026-01-02 17:33:03'),
(48, 34, 37, '2026-01-02 17:33:03', '2026-01-02 17:33:03'),
(49, 123, 106, '2026-01-04 22:10:24', '2026-01-04 22:10:24'),
(50, 123, 10, '2026-01-08 06:56:56', '2026-01-08 06:56:56'),
(51, 57, 10, '2026-01-08 06:57:00', '2026-01-08 06:57:00'),
(52, 47, 10, '2026-01-08 06:57:08', '2026-01-08 06:57:08'),
(53, 46, 10, '2026-01-08 06:57:14', '2026-01-08 06:57:14'),
(54, 13, 10, '2026-01-08 06:57:15', '2026-01-08 06:57:15'),
(55, 57, 16, '2026-01-08 13:51:58', '2026-01-08 13:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `bl_stories`
--

CREATE TABLE `bl_stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `story_image` varchar(191) DEFAULT NULL,
  `media` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`media`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_stories`
--

INSERT INTO `bl_stories` (`id`, `title`, `story_image`, `media`, `created_at`, `updated_at`) VALUES
(1, 'Eco Farmer', 'https://admin.ecofresh.in/storage/stories_homepage/story_data1.jpeg', '[\"https://admin.ecofresh.in/storage/stories_homepage/story_data1.mp4\"]', '2025-09-23 05:59:23', '2025-09-23 05:59:23'),
(2, 'Eco Farmer', 'https://admin.ecofresh.in/storage/stories_homepage/story_data2.jpeg', '[\"https://admin.ecofresh.in/storage/stories_homepage/story_data2.mp4\"]', '2025-09-23 05:59:23', '2025-09-23 05:59:23'),
(3, 'Eco Farmer', 'https://admin.ecofresh.in/storage/stories_homepage/story_data3.jpeg', '[\"https://admin.ecofresh.in/storage/stories_homepage/story_data3.mp4\"]', '2025-09-23 05:59:23', '2025-09-23 05:59:23'),
(4, 'Eco Farmer', 'https://admin.ecofresh.in/storage/stories_homepage/story_data4.jpeg', '[\"https://admin.ecofresh.in/storage/stories_homepage/story_data4.mp4\"]', '2025-09-23 05:59:23', '2025-09-23 05:59:23'),
(10, 'Eco Farmer', 'https://admin.ecofresh.in/storage/stories_homepage/1761821280_45584.jpg', '[\"https:\\/\\/admin.ecofresh.in\\/storage\\/stories_homepage\\/1761821052_2131.mp4\"]', '2025-10-30 16:14:12', '2025-10-30 16:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `bl_sub_categories`
--

CREATE TABLE `bl_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `subtitle` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_supported_languages`
--

CREATE TABLE `bl_supported_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_supported_languages`
--

INSERT INTO `bl_supported_languages` (`id`, `name`, `code`, `type`) VALUES
(1, 'Afrikaans', 'af', 'ltr'),
(2, 'Amharic', 'am', 'ltr'),
(3, 'Arabic', 'ar', 'rtl'),
(4, 'Assamese', 'as', 'ltr'),
(5, 'Azerbaijani', 'az', 'ltr'),
(6, 'Belarusian', 'be', 'ltr'),
(7, 'Bulgarian', 'bg', 'ltr'),
(8, 'Bengali (Bangla)', 'bn', 'ltr'),
(9, 'Bosnian', 'bs', 'ltr'),
(10, 'Catalan (Valencian)', 'ca', 'ltr'),
(11, 'Czech', 'cs', 'ltr'),
(12, 'Welsh', 'cy', 'ltr'),
(13, 'Danish', 'da', 'ltr'),
(14, 'German', 'de', 'ltr'),
(15, 'Modern Greek', 'el', 'ltr'),
(16, 'English', 'en', 'ltr'),
(17, 'Spanish (Castilian)', 'es', 'ltr'),
(18, 'Estonian', 'et', 'ltr'),
(19, 'Basque', 'eu', 'ltr'),
(20, 'Persian', 'fa', 'rtl'),
(21, 'Finnish', 'fi', 'ltr'),
(22, 'Filipino (Pilipino)', 'fil', 'ltr'),
(23, 'French', 'fr', 'ltr'),
(24, 'Galician', 'gl', 'ltr'),
(25, 'Swiss German (Alemannic, Alsatian)', 'gsw', 'ltr'),
(26, 'Gujarati', 'gu', 'ltr'),
(27, 'Hebrew', 'he', 'rtl'),
(28, 'Hindi', 'hi', 'ltr'),
(29, 'Croatian', 'hr', 'ltr'),
(30, 'Hungarian', 'hu', 'ltr'),
(31, 'Armenian', 'hy', 'ltr'),
(32, 'Indonesian', 'id', 'ltr'),
(33, 'Icelandic', 'is', 'ltr'),
(34, 'Italian', 'it', 'ltr'),
(35, 'Japanese', 'ja', 'ltr'),
(36, 'Georgian', 'ka', 'ltr'),
(37, 'Kazakh', 'kk', 'ltr'),
(38, 'Khmer (Central Khmer)', 'km', 'ltr'),
(39, 'Kannada', 'kn', 'ltr'),
(40, 'Korean', 'ko', 'ltr'),
(41, 'Kirghiz (Kyrgyz)', 'ky', 'ltr'),
(42, 'Lao', 'lo', 'ltr'),
(43, 'Lithuanian', 'lt', 'ltr'),
(44, 'Latvian', 'lv', 'ltr'),
(45, 'Macedonian', 'mk', 'ltr'),
(46, 'Malayalam', 'ml', 'ltr'),
(47, 'Mongolian', 'mn', 'ltr'),
(48, 'Marathi', 'mr', 'ltr'),
(49, 'Malay', 'ms', 'ltr'),
(50, 'Burmese', 'my', 'ltr'),
(51, 'Norwegian Bokmål', 'nb', 'ltr'),
(52, 'Nepali', 'ne', 'ltr'),
(53, 'Dutch (Flemish)', 'nl', 'ltr'),
(54, 'Norwegian', 'no', 'ltr'),
(55, 'Oriya', 'or', 'ltr'),
(56, 'Panjabi (Punjabi)', 'pa', 'ltr'),
(57, 'Polish', 'pl', 'ltr'),
(58, 'Pushto (Pashto)', 'ps', 'rtl'),
(59, 'Portuguese', 'pt', 'ltr'),
(60, 'Romanian (Moldavian, Moldovan)', 'ro', 'ltr'),
(61, 'Russian', 'ru', 'ltr'),
(62, 'Sinhala (Sinhalese)', 'si', 'ltr'),
(63, 'Slovak', 'sk', 'ltr'),
(64, 'Slovenian', 'sl', 'ltr'),
(65, 'Albanian', 'sq', 'ltr'),
(66, 'Serbian', 'sr', 'ltr'),
(67, 'Swedish', 'sv', 'ltr'),
(68, 'Swahili', 'sw', 'ltr'),
(69, 'Tamil', 'ta', 'ltr'),
(70, 'Telugu', 'te', 'ltr'),
(71, 'Thai', 'th', 'ltr'),
(72, 'Tagalog', 'tl', 'ltr'),
(73, 'Turkish', 'tr', 'ltr'),
(74, 'Ukrainian', 'uk', 'ltr'),
(75, 'Urdu', 'ur', 'rtl'),
(76, 'Uzbek', 'uz', 'ltr'),
(77, 'Vietnamese', 'vi', 'ltr'),
(78, 'Chinese', 'zh', 'ltr'),
(79, 'Zulu', 'zu', 'ltr');

-- --------------------------------------------------------

--
-- Table structure for table `bl_tags`
--

CREATE TABLE `bl_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_tags`
--

INSERT INTO `bl_tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'floweer', '2025-08-18 18:00:19', '2025-08-18 18:00:19');

-- --------------------------------------------------------

--
-- Table structure for table `bl_taxes`
--

CREATE TABLE `bl_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `percentage` double NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_time_slots`
--

CREATE TABLE `bl_time_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-active, 0-deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_time_slots`
--

INSERT INTO `bl_time_slots` (`id`, `title`, `from_time`, `to_time`, `last_order_time`, `status`, `created_at`, `updated_at`) VALUES
(4, '6:00 AM - 7:00 AM', '06:00:00', '07:00:00', '07:00:00', 0, '2025-09-14 11:00:30', '2025-11-03 09:58:29'),
(5, '7:00 AM - 8:00 AM', '07:00:00', '08:00:00', '08:00:00', 0, '2025-09-14 11:03:47', '2025-11-03 09:58:38'),
(6, '8:00 AM - 9:00 AM', '08:00:00', '09:00:00', '09:00:00', 0, '2025-09-14 11:05:33', '2025-11-03 09:58:46'),
(7, '9:00 AM - 10:00 AM', '09:00:00', '10:00:00', '10:00:00', 0, '2025-09-14 11:12:52', '2025-11-03 09:58:59'),
(8, '10:00 AM - 11:00 AM', '10:00:00', '11:00:00', '11:00:00', 1, '2025-09-14 11:13:34', '2025-09-14 11:13:34'),
(9, '11:00 AM - 12:00 PM', '11:00:00', '12:00:00', '12:00:00', 1, '2025-09-14 11:14:07', '2025-09-14 11:14:43'),
(10, '12:00 PM - 1:00 PM', '12:00:00', '13:00:00', '13:00:00', 1, '2025-09-14 11:15:31', '2025-09-14 11:22:01'),
(11, '1:00 PM - 2:00 PM', '13:00:00', '14:00:00', '14:00:00', 1, '2025-09-14 11:21:07', '2025-09-14 11:21:07'),
(12, '2:00 PM - 3:00 PM', '14:00:00', '15:00:00', '15:00:00', 1, '2025-09-14 11:28:51', '2025-09-14 11:28:51'),
(13, '3:00 PM - 4:00 PM', '15:00:00', '16:00:00', '16:00:00', 1, '2025-09-14 11:35:44', '2025-09-14 11:35:44'),
(14, '4:00 PM - 5:00 PM', '16:00:00', '17:00:00', '17:00:00', 1, '2025-09-14 11:44:28', '2025-09-14 12:28:51'),
(15, '5:00 PM - 6:00 PM', '17:00:00', '18:00:00', '18:00:00', 0, '2025-09-14 11:56:03', '2025-12-04 14:29:27'),
(16, '6:00 PM - 7:00 PM', '18:00:00', '19:00:00', '19:00:00', 0, '2025-09-14 11:59:16', '2025-12-04 14:26:39'),
(17, '7:00 PM - 8:00 PM', '19:00:00', '20:00:00', '20:00:00', 0, '2025-09-14 12:01:16', '2025-11-03 09:59:48'),
(18, '8:00 PM - 9:00 PM', '20:00:00', '21:00:00', '21:00:00', 0, '2025-09-14 12:32:13', '2025-11-03 09:59:55'),
(19, '9:00 PM - 10:00 PM', '21:00:00', '22:00:00', '22:00:00', 0, '2025-09-14 12:45:14', '2025-11-03 10:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `bl_transactions`
--

CREATE TABLE `bl_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `txn_id` varchar(191) NOT NULL,
  `payu_txn_id` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(191) NOT NULL,
  `message` varchar(191) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_transactions`
--

INSERT INTO `bl_transactions` (`id`, `user_id`, `order_id`, `type`, `txn_id`, `payu_txn_id`, `amount`, `status`, `message`, `transaction_date`, `created_at`, `updated_at`) VALUES
(1, 10, '15', 'Razorpay', 'pay_RbesMyHKgszCla', '', 20, 'success', '', '2025-11-04 17:41:49', '2025-11-04 17:41:49', '2025-11-04 17:41:49'),
(2, 10, '23', 'Razorpay', 'pay_RcSKUwxxvuJGaG', '', 126, 'success', '', '2025-11-06 18:04:30', '2025-11-06 18:04:30', '2025-11-06 18:04:30'),
(3, 10, '24', 'Razorpay', 'pay_RcSPIA4GGSenll', '', 38, 'success', '', '2025-11-06 18:09:00', '2025-11-06 18:09:00', '2025-11-06 18:09:00'),
(4, 45, '43', 'Razorpay', 'pay_RcnZ5EeIPBA1vZ', '', 76, 'success', '', '2025-11-07 14:50:38', '2025-11-07 14:50:38', '2025-11-07 14:50:38'),
(5, 16, '47', 'Razorpay', 'pay_RdCnlPydZe6Ffr', '', 75, 'success', '', '2025-11-08 15:31:57', '2025-11-08 15:31:57', '2025-11-08 15:31:57'),
(6, 10, '48', 'Razorpay', 'pay_RdCshl4MjYvEwB', '', 16, 'success', '', '2025-11-08 15:36:36', '2025-11-08 15:36:36', '2025-11-08 15:36:36'),
(7, 16, '72', 'Razorpay', 'pay_Rgh8KQdvromlkS', '', 20.79, 'success', '', '2025-11-17 11:09:09', '2025-11-17 11:09:09', '2025-11-17 11:09:09'),
(8, 16, '73', 'Razorpay', 'pay_RghJJFogiWINAw', '', 14.85, 'success', '', '2025-11-17 11:19:35', '2025-11-17 11:19:35', '2025-11-17 11:19:35'),
(9, 16, '75', 'Razorpay', 'pay_Rghc5l3NYGt16L', '', 14.85, 'success', '', '2025-11-17 11:37:14', '2025-11-17 11:37:14', '2025-11-17 11:37:14'),
(10, 88, '89', 'Razorpay', 'pay_RhyV5uRmmlxjKA', '', 88, 'success', '', '2025-11-20 16:47:31', '2025-11-20 16:47:31', '2025-11-20 16:47:31'),
(11, 74, '125', 'Razorpay', 'pay_Rpte6egIJ5aNoF', '', 406, 'success', '', '2025-12-10 17:14:40', '2025-12-10 17:14:40', '2025-12-10 17:14:40'),
(12, 10, '131', 'Razorpay', 'pay_RsFaY2Dug4JUhR', '', 75, 'success', '', '2025-12-16 16:00:29', '2025-12-16 16:00:29', '2025-12-16 16:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `bl_units`
--

CREATE TABLE `bl_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `short_code` varchar(191) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `conversion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_units`
--

INSERT INTO `bl_units` (`id`, `name`, `short_code`, `parent_id`, `conversion`) VALUES
(1, 'Nos', 'nos', 0, 1),
(2, 'Kg', 'kg', 0, 1),
(3, 'gm', 'gm', 2, 1000),
(4, 'ml', 'ml', 7, 1),
(5, 'pc', 'pc', 0, 1),
(6, 'Unit', 'unit', 0, 1),
(7, 'Ltr', 'Ltr', 0, 1),
(8, 'Dozen', 'dozen', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bl_updates`
--

CREATE TABLE `bl_updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_users`
--

CREATE TABLE `bl_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verification_code` varchar(191) DEFAULT NULL,
  `profile` varchar(191) DEFAULT NULL,
  `country_code` varchar(191) NOT NULL DEFAULT '91',
  `mobile` varchar(191) NOT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `referral_code` varchar(191) DEFAULT NULL,
  `friends_code` varchar(191) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` enum('email','google','apple','phone') NOT NULL DEFAULT 'phone',
  `stripe_id` varchar(191) DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_users`
--

INSERT INTO `bl_users` (`id`, `name`, `email`, `password`, `is_verified`, `email_verification_code`, `profile`, `country_code`, `mobile`, `balance`, `referral_code`, `friends_code`, `status`, `created_at`, `updated_at`, `deleted_at`, `type`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(9, 'Anil Dharane', 'info.foodcons@gmail.com', NULL, 0, NULL, '', '+91', '7719277976', 0, 'EEAF92', NULL, 1, '2025-10-01 21:38:51', '2025-10-01 21:38:51', NULL, 'phone', NULL, NULL, NULL, NULL),
(10, 'test test', 'test@ugugu.jfj', '$2y$10$I0eMTEa4bUYTcrxMTWvp8OVsHSMDlgKvtSYhkGRoCZ3jBu7JdRRva', 0, NULL, '', '', '9665027030', 110, '2179CA', NULL, 1, '2025-10-01 21:39:21', '2025-11-24 13:35:36', NULL, 'phone', NULL, NULL, NULL, NULL),
(11, 'sachin ', 'ayur@gmail.com', NULL, 0, NULL, '', '+91', '9474713238', 100, '90179C', NULL, 1, '2025-10-01 21:53:08', '2025-11-20 21:16:49', '2025-11-20 21:16:49', 'phone', NULL, NULL, NULL, NULL),
(12, 'test user', 'testuser@gmail.com', NULL, 0, NULL, '', '+91', '9614500391', 10, '07A741', NULL, 1, '2025-10-02 09:35:29', '2025-11-08 14:27:05', NULL, 'phone', NULL, NULL, NULL, NULL),
(13, 'Nilam ', 'nilsabale@gmail.com', NULL, 0, NULL, '', '+91', '9522616614', 0, '6DE051', NULL, 1, '2025-10-02 10:18:06', '2025-10-02 10:18:06', NULL, 'phone', NULL, NULL, NULL, NULL),
(14, 'Priyanka ', 'priyitri@gmail.com', '$2y$10$jL.UaTGYTRLl4TJnaoUluONYpd5wbifYqAjn8cah7o8k9FIwsJzca', 0, '977086', '', '', '9021363756', 0, '5B587A', '90179C', 1, '2025-10-02 11:08:14', '2025-10-02 11:08:14', NULL, 'email', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_user_plans`
--

CREATE TABLE `bl_user_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `plan_id` int(11) NOT NULL DEFAULT 0,
  `remaining_free_delivery` varchar(191) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_user_tokens`
--

CREATE TABLE `bl_user_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `fcm_token` varchar(255) NOT NULL,
  `platform` varchar(191) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_user_tokens`
--

INSERT INTO `bl_user_tokens` (`id`, `user_id`, `type`, `fcm_token`, `platform`) VALUES
(1, 12, 'customer', 'eXFuw9ePSJC4py1dsrcZxQ:APA91bGNS9JRy-Oo7vT3Z4rVhZMVzdJoSoBdZ1zhZg2QUBhA92UTs9KD6klawdCllWnFCF1WJ088nF3orTGuyhjhOc40IJ01GAneO2tezdwiA1Y4pNARjSI', 'android'),
(2, 36, 'customer', 'ckn1asZPTM6vfNSTdZUCYB:APA91bHsWtqLmRoYcOgbWWZ1fILGw3k1c95v4M37CTn1zuJPqLd6bMAc0XGFZYYTyay5MkatDYTuKQHfVlj3vbaJ9GPdtoavLFIaAhEgZ_B4xNEeeYDshpc', 'android'),
(3, 10, 'customer', 'd_ErrfjHR-CRol71F6HRTN:APA91bFc4KIPRiBshqKyvI9MrWPpK8cxmjxvGSbg6Dt2ABefecjJ3SmY2dcHGfCJc1-DvVwewk3wlxWMCAl6iEeZBSZgnn_DM38Cm6AGzvLgFuRYfk_DgZ4', 'android'),
(4, 16, 'customer', 'e_YegDbTTWqBPgEI9MILeL:APA91bHYrIV0b15A-ygHhoB1zR85ddn_E7IRZr7VIRfXJfxop705Zz12lYPmDRKi69PenWtJLL5YYmUt6sA-NEr8izn2n-9YXvSmJVc1s1NR89UjylUyib8', 'android'),
(5, 12, 'customer', 'chSUTwBySQ-wgk3ZAYTbpV:APA91bH3rV13MNJMrjN2L_i2SamcXvCF1ZkPY3974fTiDr4sySC8QeyJm3gXHtHtP3MP8NyYeGKUo8xMmHKL2xnBtXDe79LPZ4O2e3Y2aSlC61-GmdpquX8', 'android'),
(6, 16, 'customer', 'da5vr07qQWOHAZgfglu69q:APA91bF4SPeN8OapHB1wGl0FZ_4PKTry44nuYxk-0BVOqNBQtnabr4HOPLrOwRFn-LSDfj-172-FZxkDROr8QqAXtuMQggaQWZubSNeyu3hM1manwn8NEqE', 'android'),
(7, 37, 'customer', 'dTxvYrJPRmKePfPqvb3AMF:APA91bFbwYh317hL23W53WOQB4YDzNNq99zRPnhhqj5rprx1XS9sn4xAmYdFvODAe-MaWmPsKLfMv6QimeT-v0YNXINlSIcfzrNv4Lk1RUVWE3nSeKLbHFo', 'android'),
(8, 38, 'customer', 'dbFE5ehsSVK-satL_0pcx-:APA91bFVy0g2e5Zdla4jUe-cpnnbvJB6zpNjfL-oKV3SWWyvY9gNLAEUIAzqsHi1X8lkxsseL6ELNE-EsPZzkezY-CRbGgczorrLaNT8xr531xz9Trowk3w', 'android'),
(9, 39, 'customer', 'eqSu-sbJSsOMeaPx3l_mKQ:APA91bFGIA4YIKxW3sSEDnzlL6cOjQwC-gGvPlKjGm6WGqs18e7wNu9oQDqllKe949Xy3CehUNvrXUeZ3Ga91kDRklG_UuyFjAPvfk1zjhptCr_qGonsFN8', 'android'),
(10, 11, 'customer', 'csYakufeTamU7ST0CsRE9c:APA91bGuzAB4VxoKV-fj7fTqp3ml05pSbYGZIEzBWQFPNkKBVXjaNNj6gXU6s6G_2FsIIDvkViNSFR7AcWYvxvz43UWSYIv8rXhgei85DYj8D7OaGdMJ08M', 'android'),
(11, 10, 'customer', 'eBxvgL8lQdCRHaSO89_XbH:APA91bFnoZJRzEipn-hx9E4uVmRmSnpTUAX2pAa1itcoxRe-bA7hI6D8aAg1vTMbDJxM_jyjYNw__C19zIZvOdlOPPhcoayllekV--o3YKegRHOzPN7RoDQ', 'android'),
(12, 13, 'customer', 'd0RrdIK0SdmXnj7Ks1Y53l:APA91bEB6u2PRqWHHvSYN-LDVqa8QfaNzYWaIzYe37XGQhsjMbMWKkZWgLHvJnsnuGAV3keiDPi-1rDg_T1HjDU0b0B0Se81D8Wrm-TzXjTQ29dHwOUWOrQ', 'android'),
(13, 40, 'customer', 'eaki862HTgebYN4F2T_XlR:APA91bEQHLxzqYlnmYcWVc5owY3R8fwfWKHbyiyvTsbLFCx-vczem-boxq1YHQMofyw8tK-J9olHPzyZw4Rb6UdfRUj6qhrThBYQxiCr_di-KULl6W1GDDk', 'android'),
(14, 12, 'customer', 'chBvm6L7Sgq81fiwmugXff:APA91bElziVxjzrdINjnrdmQx0EOI9d_8_nxlWMnUNNO8G81I2pnMfUjiVb-jXA1AoHV0Rtp6rrsyPeuAqAf3ITHVUYMajDeSVCHwCiiRppFSJ1QVlzFIT0', 'android'),
(15, 41, 'customer', 'eZZKkmuKTSS5RYAOFxWuNS:APA91bGs8WKtaMDICkl-SDzLgAvK34bQJ_UYjMRjKpN81FgvadLcrX-MhjY8T4Qk3HOXVx8DBDXHaYnebeH_gmqrqa862YaKN2wq_ob5omPSqUWmL6_fJxw', 'android'),
(16, 42, 'customer', 'cJ4cPSJ4SbeR8upCYVzCGV:APA91bGmvOkKbcsWFojo4RC8CltQwhGkJWD03ZPdRsCq0V7sEG5o_ptfFpPROueDi3Jr0Ow743Q9myslrZ-krR9LA1u_49SsufiqBootUpiIiJbijZhQx94', 'android'),
(19, 10, 'customer', 'cHs1u52ERMqfa7ct7mUmcY:APA91bHrhJ4ORgUGn8-S24jaIsxFqH9GvRwC8NoNqdJzFRhr3G-E7zQA4KLrlzioenFjt9_EmjmXiX42Ye6tglhD4tq4NXTBQE-Zc6h6la5WAQbMOKMAaZw', 'android'),
(20, 26, 'customer', 'cKuPowNDTyiDII6gqZJxfe:APA91bEogeKrQqyKUrwvXHK9xGVTIx7QffB-V_Y70oVLlOfq1oPhfHhpvLb7HRimqioFgRwX3ezCCC2F945rI59-670UwRAA5Ky4lEM0FeCmGtzZdIdj9No', 'android'),
(21, 28, 'customer', 'cjvqYg_vSl6spggPkL5S2-:APA91bHXnpnh8U56STYOOTTpZdxrzDRSmiXYBoByOlSXy8uCZWbAhvTdXhc0nNZG9YW-37NFYorUqv0qZyr0rD49hgdW3JtidhORmPeWfs1rbypLIfY9e18', 'android'),
(22, 0, 'customer', 'f1isngk_SCefrD6Mw-na9s:APA91bHekpdbp1umNjXPNK1nCMfTqnU85IDBXtPyPkdoDAF_reaG5FuVgSjQ_VsqrBS8corpEz1oCkco_PpOH8_YSzici4giLAg3oDK1kyl9N1h0cfFrb2c', 'android'),
(23, 10, 'customer', 'ddm42OSQRiO1_iO-nyAiQV:APA91bEka6ihG73F-xO-iZZRe6qtGEftW0sGlQXkoNCGjTLq7gehngC3Vvw49ffdueq8usVwYNSDWWF9dfmGIdVsCHIfU3dxTNYUwZ1p1e1gbd6Q6P_26qI', 'android'),
(25, 12, 'customer', 'e5QjF8_EQoy85zHOyQbvjZ:APA91bG83cnlUnNA9v_Xv_ZZEePFqwik89K2ipqhoPBx1t3SI8KsNm0HNZu-vF5Kh1Gmjndeh4qQnh3XCL_nVKf51Y3ZU-WXO-kFxmxQUPQEf5AqArsKICY', 'android'),
(26, 43, 'customer', 'cfxOfHQCTYqdSZugoyzEtc:APA91bH87etUPNXD3J4bpL93rbwCEhdwsevbsZjeTvdaZEd33TMl2HdDafLBvRdNmIo4BPKT-rt2AGLWp1HrCjBNQbr4Vhc8Z6Snvugzt7bbrWoaZcVyTt0', 'android'),
(27, 9, 'customer', 'dhbphRj3RNymr5jEU95k9i:APA91bFKFCkGuHAC5dYXROx3-DYI6SaWFN9j6pLlPawvZ-KCNV6SQHGSxdAr5e9hGybEroEYZlpjTARNapc7oLtMmbg3kdr5fuLV7erelWq520Bj2R6sZt4', 'android'),
(28, 44, 'customer', 'dfwgpyNvQEObFLuymJ6U35:APA91bGG8p87bJioSn9J9pYxERnCeKoNCyWOxnrepsS7r3JZx7S5Z-rmy9KezhJvJ3jo1WJT3LvKCVT5n4nhpkMcNowX3im-mzGH5wt6pAT1WaCxicINBh8', 'android'),
(30, 10, 'customer', 'du6xEkaOSqOJOI2ar-dRmy:APA91bE9Mzj_KFbModRyuQKXibOrrs5z1UBj4sufvIUxgJloUoYkGi3xe-KJLBYews4qyqASvcLa5qWbLQ7FbOTIUSode4t0HXSluioqfZs_-GQfvAvYapc', 'android'),
(31, 24, 'customer', 'epNzZ1rjRgC_2HSzMXhA0-:APA91bFnK3A1zGyjxQ2vj42aq4swxawK2zcahqGmrvBYICGhLIaW6hnkJgtU83FJtxanoiimDR3VlcQKaM57VtdDeDFCWpxAxdhIdtc4FNE601mLTbYXCMM', 'android'),
(32, 45, 'customer', 'fym0CUqWSmaqrkd0PepeDu:APA91bGADLDUhbNbg61hkzF9wKxKQsOHND1hPGdzA-hv3gA37fN6LcwgevQWONQfqaO-R0ANVAdjn1dM7IOOXpPkF_53zEMhCxyN19Zscw2y5hK30LG768Q', 'android'),
(33, 46, 'customer', 'cUI3zsZCQ1-8E5e4jvJP-z:APA91bGIPY3SbXZqasTXG3Bm8n842n7Xw0W8Czjis1sFC4V7n7wClE9p2dXPLVKQrBwSdgCHBPQ1axxVEatObMKmkaBjk-uWXaisyQlv1t2OVK2YuLgVifw', 'android'),
(34, 47, 'customer', 'e_D5ZkWQQKCDxQ8NEbg3AT:APA91bGx7zS5Tk8gY8WjsqgK-kIIpFGP29u5KdjfJ1fOO18QoAdk1o87BTtSKtdIeODB0PGkrBakOK0ygLKgNUxO3mhmdxCE3QPElWJRE8waqB3IbaIVrCg', 'android'),
(35, 48, 'customer', 'f_WG5CtXR1q1QKgu4U7xGo:APA91bF5W1N-5ABTNt8Z-L9cbad3jAiI-H1UJ5cp8qWz6BOmja_sh2cJmj5yfMEuft-dGMdqVRMw5APbvb9GIKJd7M10-JwgHaGrOccR_-IIVee0Q8KlxDo', 'android'),
(36, 0, 'customer', 'fdcahaXeTke_sEgset49nY:APA91bHejXiaOc-wtT4DvvnnW60nPIAzcUpjnPSaUIktnIy_eosL9qn_jueVGK_uQpx9d7Ca5PAs3-YaEQfehENDsH2OD7cNEKwz4fPBEY8nZ_T_NCrKCVU', 'android'),
(37, 10, 'customer', 'ddWaU69mTPqfkvEcyypWyS:APA91bGreUrXL4VtJPDbphI4-O2lwqwj2_CGn_pwfBT97ztkw-F43yyP-D5VY_KFi2264p5dg4TQFSR_3jjSt5S33p5ExtHJOvItO8LJC1-36HL1i1bZ1II', 'android'),
(38, 49, 'customer', 'cYzKFgE4R2eJ6DavxFZeUT:APA91bEhrFOYV0JOiZE7B-Xa0YjRpMv8zktxgnzv3hGLcL7DaQXRkwDlM2ZGwfwutWFFnRsDm9y3GUrWxNaORZHj-XaLUKNJPgZlMxh6KucqXBoMEnvqTrE', 'android'),
(39, 0, 'customer', 'cRVRvPydSkOK8k4AVHAwOr:APA91bE-jia9R8_Hti2E2wV6kJM2WOODvWoDx8jRcZ6dH7xpftHNFSOEJeT22PpT47VnoFFTox_hps-Zw5bv-ZZeKqol9uXD0KY2Sb5XxYiC8aT3ObHv1s0', 'android'),
(40, 50, 'customer', 'fYovXOq0QWy21E4D21-fsL:APA91bGa-3SF5lVnPPpLL-x9DfyH9uquO9_FE6ztIIntEOOaSovamjQY2iQ_pGmuD9XlxRTeglfX-WyWCndAGjARLijxDm2ClVpSrNZdv1lClO_dhKa1RWg', 'android'),
(41, 16, 'customer', 'cNFcI62VTFyo7ppDicYn0h:APA91bEMj_3B-TPmegIDVKDRsdMbsY9pjrr4WJXIcaKTVroOvUE0LUvcw8L5s-Pxv_uhRJYWmworrV55b8okvIzWjvOLgXtlse0-gJR0Cye9obvN2_F88-4', 'android'),
(42, 12, 'customer', 'exx4yHZ8RbSC3s1uGLEB1c:APA91bFA3Hgt-iWaugEh6aLSqrwxOmdV1sEhMezfgCVSffuI5MCjkgcC5LD5UsYtuaPN4QdIdfMs9TgfETYslfIOHvuFGRdxGKZfX-XU8xJmVe8ExR2gv9s', 'android'),
(43, 10, 'customer', 'dxfzKACcTzauHLEr33h_L9:APA91bGM9KZ7Qp6x698jdt6PDQq_jFJlPoKrx_CfjmegaKvxpFGj9HzDWoTXBqzVMyO_4gBB-9A_i2CZbd6Wt3-0gPohXsIuTAvW4kWRb5APSrG_Njc0HZ0', 'android'),
(44, 12, 'customer', 'dEKxKioARMuEl-ccf224rP:APA91bFgqEMuxCoAasWgwHQOtrWF_MoAJZ0BK06F4m2OepBvW7aBbOmCYLwookml-HFdjzWC_c2a8HjZeBUz58Bh8TRhoBSlyvIGSvK0JPkbxs-CRf203R4', 'android'),
(45, 51, 'customer', 'destPsCWQGS9FTGJQS6_yo:APA91bF1lrLmT7rrlfWWETu5-L-nSKyP4eXI3feROdrF2iuNwrF75DTtYIdGqmks4yN0A4VabJYQNvrm9h2SSNgtlzWs2FSW8IXuSWkgqpiM1F-MOocpzcc', 'android'),
(46, 52, 'customer', 'fGb3_1DbTz2kYLF6KZOtn2:APA91bFoXUWc5o3xm4JWvlL6t17EMIZ175XinJ0WY7kRrO3PzH_3eB9T4xVIKJjqs4d_-7PlxbFIA1aE1CLom-QKsVK1lWAbu8BwwN5jbmPa7VzzTesXilw', 'android'),
(47, 0, 'customer', 'ceyRWJL8SlW46VmxIilMeC:APA91bFLYSp1W9Jny0RoAx5MOEwwxomKuce9sa5OmEKCgRf16iLrgBIRP9NVxASgeUkrINaEYLs9emjoxKP_xsFUrhtyQ5Sy6Gi5beUBJcen7zEyTQHqc24', 'android'),
(48, 53, 'customer', 'dzIisjlWTByDidDSoVXmRq:APA91bG3poIAA3ihuqiNoAsbKuCVPsfDoqTsqSv6lVTLmdhpEptgz9bvRSzCv5ai0-GW_BgDUeDrJOlvMLrkBhJHjW86YZI8RhXk8-cgNhPDNMNLp8xtik0', 'android'),
(49, 10, 'customer', 'dbWbCErPSu-KHCj_RHE9ST:APA91bGxsSIK8JR6hbBpKEEmz5owtlp4w2r5MWf8anC5A--i2ZOb-EhblSACpgGQ2TccbpyGNDhRDFrHKMSWH6vGCS5aaFmb0YItd2oc9A3jT7v_0_apa_w', 'android'),
(50, 10, 'customer', 'cu3JvpWOSnOYzY_45uGOc5:APA91bFDW-ArWYeUB5DIuTJmx1opNmvP5bh29I-S6O3AiGWBcxhTNNUtmwAEmea8LcMZ5gZQUIpT9bZKi_ANeQ5zW9d1I--s0exI17mfPJ0EAwJ4Ig-gcQ8', 'android'),
(51, 10, 'customer', 'fhQpPTDuSg2UB_fafSI6rp:APA91bGFCHYJnLrpigdbyhNMZ8Yj6zZBFhyv0Dj1TXfF_EYyYdWXsyYlPfbZfGfVxzwE8QooIa486uB46L5WMd313OAllg2LWYZoqgWh688Vno2ipDO2yrQ', 'android'),
(52, 16, 'customer', 'ex1Ht2cnTo-lJNbVqltMVE:APA91bGqSH8CWGmgRuHL0AFk53Kld8xvzZUl-mLPOdcyCjtsRkNj7zx7hAlzAvlr7Y02uOn98v0MdeWK8ga9ACAVk2opMv7ctUH5uyxk9PPMqKbUV4SeLKI', 'android'),
(53, 60, 'customer', 'fRP_cDBtTXa7W6AGKit_Af:APA91bFDEp1TyKSzE2nDVzAiIFLs_IS2rj7V62UcQWY17jSQmmDrVkxcP7ltK_NI8sEKu3Wo51AW2AEq5S_Po8JOer-dW03PwNS90uzgc9t6sp49UZ_011Y', 'android'),
(54, 61, 'customer', 'c82l7NvORzS-GxnMvwXfuB:APA91bFedD4MIOCAyyFHfXaPY5obgSbxx7ngRn3ANC8oJS_xZaDX53DzyqCdw2h62xAz3x_4EWP9mvDuICQ2fiQWr9cjH8VjRBeLWtBUpwYrvzTD5wLPYdE', 'android'),
(55, 63, 'customer', 'd3wWMAGRQI-o2ldsGtqDv5:APA91bFtlXvVHdTwowyl3cgOgzL16WtOM4Y62HxFtP-0--A6KsvnUoA51UcdWaI_N1Xf3W8RtiDWP6ru0bsz4dGVSXkTx_5gpwRZGO4hfdxBN0dTpvCUkYc', 'android'),
(56, 12, 'customer', 'cojnjaX9T5CoeBcSG-rqwm:APA91bE-7oi4DJTgIASRMdFPg9coVrgs-ohK5axbma82zjUy3mv0zQDbrP9XJKBubpcGwOyeMJpySngMMkxXMMe6AYob8JdrKmQvoe46uZ3BBmb5SIj_rek', 'android'),
(57, 64, 'customer', 'd_BpWYETTHOb5FDFs35KL1:APA91bGEVvQhsmcvewY_sqpNdzMq6F3D17K-McSaZ7I9-T5Er6-VB556iv5AgRyP6FbnW7xZPqV9sNIlz4HjnUHGN_capYJwtYelzCl5sv-2AGyOmjyoLng', 'android'),
(59, 45, 'customer', 'cs6dWy9UToOuZEa02QjIXp:APA91bFYWwd6eZxv58FKUAI7KPlvbyt_VTOkE9WUmOjCdiDOodKXR_UymrYOWBPlxAT_f09e32iedx7YjGxDrJxPMBggoKhqKcQpBz0kI14yqw1aFHTNDIw', 'android'),
(60, 10, 'customer', 'ferRkj6ITb-3dGl9jCzA1n:APA91bFGITH1Nzj6t6KcgG4F_cztjHHdHMEH9m1ncWunZvoO9K8hGA90RuwHtNcDgej5rzI2VoT8auA8CmUrQsVqokUXGEa98xUlx0Vba5L7gmpBL7zLmvA', 'android'),
(61, 10, 'customer', 'fTKgKWpEQ_SfH74bTfE1_9:APA91bFxJ0ysIp6wRaNVgMw_N94zaJ0VHKMx6hba8zz6auHXsqS9PkCfiS1bVJArJ50bb0hHj4f1qb1P2TUVxcCHEzOIqRxJAoeJXkyu4wy8JYrWxg0KHaE', 'android'),
(62, 10, 'customer', 'fymGR82gQdyVXF352uA18m:APA91bFbjPsFf0oHpI733EvIo5LWV9pFa6irjiDhYXZ4SfhEnHnOliuGBItKDRephDlOOsd_41n0yVNYJeeda_qYSU4OLf7LwJxa8-4dLNs15l65FY2_ZDo', 'android'),
(64, 65, 'customer', 'cDKp3NMySC-2z7SkxVBITi:APA91bGIaBsOQy-mLFAnKiVzWXd8RP5PthGWCA4Ynh2cn9HcCuMBbZUAEXFcgUW6iopk_LRrFNmYpbkhHnZXA1UgLAqv7JfCAns58QGf9vjNARqxHZpoml4', 'android'),
(65, 44, 'customer', 'dO_1XnldRH-OLISxWW1xai:APA91bF0qDSsOA8qy7mpAPC-D01Mjim1JWUi3FoY1lhtr-J-DjJTOMSPLfgryUnDdyWHxkgHr8dj_Bj5igHOoMROFPoWijNyfTfzBSGeMkGKJxX5PW6IeGk', 'android'),
(66, 10, 'customer', 'f1ygAsgmS5GdpXbPwFgsgJ:APA91bFcZKtGs7AkU3ZnrzTuVvnhTcaLlBppPcVqgfiR_x6twZOm5l48OyExgk-7S9kWLNYVilXni2ZxBwQwsH544D6PM8q6G6azSYStLBsoLbkze7YLWSc', 'android'),
(67, 11, 'customer', 'dOQ07YDXSxOdeHMqW6jBX3:APA91bEUsBFDkHY7R5jpYc4K6L0wzQ0oXsryLqypYw1YKfzaT5VLW25WPB7toQ4DgRvZlj7eXQgEA-ZJ5h6YkZzkDd6mUF5unZt58vBTTLpgey5Dc9VtFpI', 'android'),
(68, 10, 'customer', 'doBnZS-WTv-9FyW7ShZpd1:APA91bGiWBcIYxcAMAYTL_0w0rY0PW-tv0izOjtNXrorpRXGhPtmh--uY-w0N-5JvvgrqeVi_6hWcoktobDHGKeGievvZUHFLIw49PErStcQxriA4oL3KW0', 'android'),
(69, 66, 'customer', 'fJWM-SkpQYquTyHIj6WL9a:APA91bFggvtBkWTesyIUtmZsLHWxjyn1lwqU0Dsl0V7VKqv0a0KmvmykxpL_MmOzoY2Hh1aTOr1eLj86pcMs8Rk3r7qnr0sC1dQSuH9klG30lrHH6jjVFJE', 'android'),
(70, 69, 'customer', 'eRtxrSvPTZyAfsyHW04JvZ:APA91bE1CxgZlc8Dl388MsbtVhyr5reZ_VYketNtX2WsWipqtrzI-0W5DjKbvEVHHSdq7JryBivHO89ixZeHMWCCcDblj8D79qbyr_4zXx2iV0RA2Ad3w9c', 'android'),
(71, 70, 'customer', 'd-Y4MdXrSvqex7kMcZ6Xjj:APA91bEFJlF4idzcxxWILCDl16vY2qB3X-E8jNKWynkEEDaVAjyzfSO4ZCNGIn5wd4u9kZqESiqOPVNlevV7ipbLDFC41ab5ECITnEtnOE-jmcxprIpNWic', 'android'),
(72, 71, 'customer', 'dAqW16keSzamAHJC6BSpVy:APA91bFBdhGlcz90bLEC3ZaL49UMo6Zr_9CpIOiZeCPYEANt5rM8odB6m_Fwm239MYcU-IU7aO0l7pqSQ0vr5DbmcJobDaXVzifu9guPwyHT_V3Qr5AXuCA', 'android'),
(73, 10, 'customer', 'e98RZzpJTuuoXMRZWKLIp1:APA91bEZew-auQcktgHP84ezNYG8xqflrStbqCot9ALfoXea-z8__yQnmgWb_ptKVd6_RImb8QaTBuvddQ8SF5PlxeIfU_kpf-Gcx-1WUmmxaxJKQwJFLGQ', 'android'),
(74, 10, 'customer', 'c1e4-3gHQleWWq4wGw6--q:APA91bFkHkEEm_HwBISsomvJiTcrUi8DTHh7aasBoWB1Dy8z3owpoNp5iPZEkzkF23YWwQLMttWm4StJyFcO9g5Jkt32avp_tlWhqOJlIis6_xwljTXJDiY', 'android'),
(75, 10, 'customer', 'fBSoSIbiTf-tUUt2RQHUwH:APA91bGkgVcDNFZlbMdb7K5CoCvBnuc1Z0SGrY2uyE0ByPsniZk2hktNx845FhzhetHy1Wqm5aeOKNnPLbR6mv2lm1cfP3tJuIO3_t3sGVvykcGqX59bhSE', 'android'),
(76, 72, 'customer', 'cGDvmYNES1Sjqzmb-QmRbd:APA91bHDTIjhEdsgL3Jdu62WVRYfvpoAEhi0cJD8LcIGfkF56gSCXAPcLv6qTKvcSsoc5q_APfOOP59f2OSsGehwHhmRTZBkXdn2_8IiNnqw5KxBLbVgWqE', 'android'),
(77, 11, 'customer', 'fuXivU-uQWiQyGpV2vJm6p:APA91bGi02xrT72eIL5peuHLPkzZJr-O8vp42EMc8UnQyz_iuUb6IIkA-e93tTpxDd0fAofnOUcVlg2R_nBscKEb1VE8NzLKMpJ-KnPgNn7DcKXMtUKaSeo', 'android'),
(78, 0, 'customer', 'dSDegLloQeGAsnVOdYt2g8:APA91bHyU5kxDUxB9jMrt3O-32gt6KuBcN4AYEnA-kwMrAWgdkMfn_p2Cg_xY9tZAi76BHkMtqehjeBV4r95qYP--5swFY269JJX0Te2GpH1XAFpLYlphKM', 'android'),
(79, 10, 'customer', 'emibInxIQl29FnRGopdCPU:APA91bHO6lno0MvPHCprMnC_QNR6YjqI04EfpEmW01aWDN9XnNF2vD0huH4GLvhvzypX8HxBjeqLjiWHl1MA_xf0RiCE16JMpQvftTb8vFnynpzbaP3RbfA', 'android'),
(80, 0, 'customer', 'dvtySoRLTbGetPrszI72q0:APA91bFLwNyLAnm-esqAbhJqML13V_aDll9_qkrU_qA1LTC0Zc_4Fo46UcyZTSGEgk3ETqmK1ZC1-bQVwputzYv_BfVDvPHHFtKLk8_muDKxxQtMRCf6yfU', 'android'),
(81, 10, 'customer', 'c_15k6f5TumkOYt5o3jwqF:APA91bH3D9sFdreMvyRKQswFaWEP1HHSEzTppjV_k_LIoZTuk_WHpI9YTu8-8p7JX1wbwOrLNLR2zv31QJPUCUYYx52y0vdsgrPKrF14hKx5HQvDJLS54x8', 'android'),
(82, 73, 'customer', 'di7clRdlQiq96_x4Udw4Xz:APA91bHM8CVHypcFqg-z4YX3SCZlpUQmujoR5LwwRI8NYQSa94rXDRtMDtHLBOeW8wteXVKVtvOnAorJv7GMg5-55oGwrQeLLTr4u3WuciwzBv0_ycIDY0U', 'android'),
(83, 74, 'customer', 'fykjy8YdT_G6A560MZdtmw:APA91bEM_Txc2fbAlv4iLQUv4oj1UEo_h6L4SUcuKZM3az4viIU7f1vzZwiWEyaowgq04JmDKyDcYSGs-qr9OK8rjZJVy4gHVfHg0J2s1QpHJX_LNYvvkb4', 'android'),
(84, 75, 'customer', 'cVi8uzikQd2ZJtiAvCMTYi:APA91bF1swn09B0kdZZbinBYzdLep-uS-JdlW9BW2Jtlvp6JE-BsaOEsRBILpgBW2w-5-V3OoTU-utnT3zgXpbT1wEAhsrF-is6b7DL9RquR905bQw3_FNc', 'android'),
(85, 45, 'customer', 'e7lrPMBET5OZoRkcjvQJ-v:APA91bGYnQXDb32I4mZUI02JcOwfh9ZHOtFONB44zYDhtiO5BJ8EYhRil7ScLj4H3Clk5GLiFR4sfEo4m0RlvfBHCctnRNrdbfwru1WEPhElRWIKSPUo-fw', 'android'),
(86, 76, 'customer', 'daMeERdFQHmBGx4pqLfWRi:APA91bHnhapxiVmFempkm8bznB1aqjjYHwSJgeTIgofKBc-kL9rtz3IfDkfFydmV6jNI9ZpNrE2Ii0h3OrD9wn-iIP4L93FRDvxkkfxHrB55j3H1wyG45qk', 'android'),
(87, 77, 'customer', 'fbaHV3Y8QD-ueIQBfuCkS_:APA91bEg7qwjSEx_i_xsHlFGB1iDZSW8LXP_ZdgeagCBZZVMx2vKIjwYlIHi4uzhdsKsMMuNShDe7Cft8SbefPT2v-iC035aQU2qgoYhZl8WQFPhNHfkY80', 'android'),
(88, 77, 'customer', 'dk9rDYLmT4-B_S142igaSK:APA91bEKePF5DI-9LRjYHdGxmS5rpDBVnNoobxcErx2BHZcwtEoZs9_dhjcORntercVRuAXi7_ziZyHwxLoAD5UrrYyebtKW21e7lqc9MOkKlQhb8Dki19k', 'android'),
(89, 78, 'customer', 'fzEKWs2uSteRVGsSMv1-ID:APA91bHLZ6hNf9y4T0w63DPuhG9sPNvoBc1qyARrDowKKlF-T51XBT1pNutOIi6vkENWKDsB1W4-opEx2a4Z-7T5QGNH1oCGPy8Oi00psU5bkSjGPAAv4ic', 'android'),
(90, 79, 'customer', 'cJYXysNYSxatCjPph6YVyF:APA91bH62RRt9I_NcPVdbjkwo2wLu4SCJo7436BOa-qijIMC96syHzkMMfaXbw5AJJ5XIkPUzwVAfrd75MgN66rlcgpH_JdzpYcyCedRGWeGB7b6Qq0Hb2k', 'android'),
(91, 80, 'customer', 'fZF9817hS1ya8ZNkFCd4ub:APA91bHeKo_3BMUwykFaUwS-fXg9gRDGQqagsu5MxwXUxpJb-Szo8PzMSedTF1bEF9kPyS2rp2_IiHnA3YctK6XfPphtO-4ptZoBldmEbUk8wMjBcft9Fgg', 'android'),
(92, 81, 'customer', 'd6rKAIb4QMSxJYm9MYlNgq:APA91bGkI5r4v8zFcukQn-8QZQ7UdW1D3cocjQTJpxzlTHaPSN-gPvAs5cI3odjb4DOnSV5dS-j-xvsS_58q3EGZk57g7z7BN2ccRZ8YVnjvkp5_ldvEehA', 'android'),
(93, 82, 'customer', 'dLolrJwOScGHYvnVvL5VZB:APA91bHOkfJbZfMgIApVzYl2iYb-AMBVE9Qzh38eYhgS7_cZoPco8Gtx5nB1onuevxgW8xn6yNxt0dqrJO_xdv0JM-7davmdU3bpIF_fSLWT1zOEtr__7lE', 'android'),
(94, 10, 'customer', 'cVaM4-J9SLGdLcxTcG9PdT:APA91bEwvW68biAry3sqT9MHfFZ4pzapfeKXmPu3bUp5vLA9gTuoMzfKM2tmT7SHLcyUVK6YArLIAjH2hqKULT63qxxgX_iLbz7DGcI89otW0aZ1sfDB3aI', 'android'),
(95, 0, 'customer', 'fzTEbv7yTNaaHB_7_Oa99X:APA91bGDOsaar7_hZCLWN-F9pChKj2XVdWk2EmirdwbIFnXP4hm49Sp1zkfvLoK9_0A5qFoUsF8bKbxjifjXPKmTbz9t7CQp0kUCANT8ydtnwOpPgLXmNH4', 'android'),
(96, 10, 'customer', 'dJByfwaDSyuG5raXFjE9XN:APA91bGkCsf_pxQ7wsesx33TtPLjfHAIwobiEPLHw7gqvB4sG5m68sAyMtcysqPHHGRGwmKoeDR7IGDfcBgk-vhcGO8BKTI0iQE-OK-lQFo5FZ7IWgZYfXE', 'android'),
(98, 0, 'customer', 'eOaFJJeURaWi7zQ7divXrB:APA91bFwxT7IZQONBplYz85QjhbZ42qiwYKQvYs9j5epzedWQX7KbfXvCKU_13o7Fx9TwxWhkznLRxSkh3ZzZwyVtYBfWfyoi-cAwA2VC8YAhr8p-enkhWY', 'android'),
(99, 12, 'customer', 'conT6DK5Qm-L8BsyeETlym:APA91bHZnaydxOdkQiTNVcMWdf_j2-ZtFAp5-MyaQD0lK5kj9_5BiY_tO0p0iy64iN8DOaFWW4H5HvSaAaErGgI3C6HJhH9IeNUujT2dGT9n2alR5k8QkXg', 'android'),
(100, 10, 'customer', 'fs8nLa6kRxWByMG74oBY4T:APA91bHsx2NpDxUXTlJXp3W90GMCpmavS0YJN8w2aU_aGazwfCE8ytclTbroyP-h38eP4JMksSIZgqrUFuvjGAEn7WYb8liXu1hExSPeGTHOebJZI9YHrcw', 'android'),
(101, 0, 'customer', 'dS0UAmiNSdyPkWSA3guRrx:APA91bEkBV7LG8IuqzE9_wLPc6biO9sJDTRp6st5o3j3TwziDCM8xtsOClu8ukBz8t_O7y_YZBRVrjAhNWjg2wr1LRuQqDAwtLU-3B2qHljVIM0LsuTkge4', 'android'),
(102, 10, 'customer', 'cIUO9XULQtCif6bG4Apvx6:APA91bFzh4h6bc-pRkEE5f1gBbDtUEeumbEQpt-U7rKpjwajNwHQRymR1Qk0RuD9qiAi9QIrvMPAC2XEeRk4eZkE33yjxjoqA-wTO_QWFK_oZfo821wMvZI', 'android'),
(103, 83, 'customer', 'e3Ko6g7iR9mbRzm7imdTEW:APA91bFmfC1k-cq41EvQMDvYiG-RpYZ_CbPtl4_WV-d_lnQ-AZvO1sSsKLSxdIh5ZG_iKFo2_JoqjaeHFh_qdzg30c3R71cHdSInoGsAGoFsQg7JzmtPFoQ', 'android'),
(104, 10, 'customer', 'eMwmZuzQTHCao6QScuAzrE:APA91bGjo9hSwsUovPMamq0A_C5P8mhtkCVhTobM01TVR_Ju3C6FtmS9tQl8cnesyhTk_jL7Hcq9hUUMBVDwnTPnUsinYaseZvvFURgoKA8YoUo_egkb_o4', 'android'),
(105, 0, 'customer', 'f9FLpvVvQGSk3sbUyMyY6B:APA91bHuJeFzZlko1HXs3uswMuqcchdVUVOaP8VJPuBZ0Qf__vqeB2by6WM7aPT9lSn7U9TNazx6AXdhSi2lzWDW9KSrWtDwkvt-RI0GmxTMQc9plZWWhNs', 'android'),
(107, 31, 'customer', 'ebEjIkjdQ1WU39G-brVBgK:APA91bHGm0q29BWS8q2ly-Z_fopmHt1rUOxHJ2_gxjCc20FoHOAaD-hf37qTqQxR9al1yzCACTMq2T4ENEDcNh_IS-inpcLdlshPAA_UO_90cNm37YTbNVk', 'android'),
(108, 31, 'customer', 'd-14wOrnSD-LnM089ppUcH:APA91bH5MIaCZsb9QI1qT-I9YkBHRDZS4_HBFgbJ0gA3jIWMBZziPeXhwHVaRShPOHgkuoZ64EsFJrg5akJ6eKTS2iDCq4YCdueAkENEBZUW2rSOKRahNg0', 'android'),
(109, 10, 'customer', 'dv11YCVrQxasC8S4PRbc4X:APA91bGOq9ek7PVz-O8_O1bK0vGWKmct_ZQr5ULY5X4eg3D1ZASxw15F_wxNBf4gmswpyhMSf3uqvq1UQwLryhIDzKHWAoUfCiBVP0zlN1Sz0SPYhz-08BU', 'android'),
(110, 16, 'customer', 'fKOSWt__RZSe-Hluv9RgU6:APA91bHqUf6DR2af6HfYiXTXx_ous4e3jlphmbvTCeHGC-wo4BeU1ckaGwW6YPSBV9dsvxMkE_I77K8MvXQnmXvr7AkNgjeAH5rvE1qS6o21gWGESr68fXI', 'android'),
(111, 85, 'customer', 'dgudgQOORmW56IgJLtFNDQ:APA91bE89DVRx8Q6gaL5yn_Nnmacc43b2bz7RrcU4I7uUdndDysbtiPIeId3R-kL5J0Jnn9kQJXkiJDtGyPy37_gC_Ds7UP5VCyPKsSTm4A3o70oeZ9WqNY', 'android'),
(112, 10, 'customer', 'cpfRzAZSQ0m-XHF-jXQ3US:APA91bFtc9dSuiBGaYxe5Fwbq6YkdR7ty2DMSua-__HQ1exsgAPICyiP28B_nPrWKcxq_Cl_k2X04uKQlgMeES_AUuePcChcQXb_kwZY4CyAVXETKOeqW4M', 'android'),
(113, 11, 'customer', 'dGm7Dc2RTZ6ErrJ0g0Y0gB:APA91bEUeT2RV43UyFr_eZ8V086rPWcyeEwAP0awVPlG6OSJu22hPwOgFOKF_cR0jQFwXcJg8MBst25xyeaAHhkBw_3u0EjwR9xOiU6ilbDuhFcdYHGPPF8', 'android'),
(114, 12, 'customer', 'c_yO0V4lQkOBtptiP6fxoJ:APA91bG8v2_fovrKJ8IVPR6OJqMWNT9tL79IUwei5vD5MHucCggkWC7u4Rb4v9Tr-ZGjtSijAAqrzUluO25eHmpszOqQCfcYowge62rpHZCR1FZXQko4WjU', 'android'),
(115, 0, 'customer', 'd31kJ4cdRoOdV0Zc3-jVJU:APA91bHrm7AHFLpI9xNz6gQAD2932dQNJkwP4dRGaIYN8fSyI9datu5YA43XzMsXrYG4es2wH_wb_CRi8Jg0LZm65IpHLppnGlS86KEa03AV272PADu4d8A', 'android'),
(116, 16, 'customer', 'fioNr3gLTw-KWLIJKBWKpY:APA91bFmrnBuD55baehzAR7m2NAhZcd-6sWphXjpQa90Vs-ErqZmopQtO2W08XbZ--sSpKJbPmM-TNeK6V_6f13AjEjm6y_kVyA5DFFJ3B6MQJah8FdH28Q', 'android'),
(118, 12, 'customer', 'dDAxuP0GRnSUJsQ75a5ZWW:APA91bGU0UyEYK6JUtbW1Lb6NlMsTjFtOPi12bnCwjQDwg0UtXjmEVoeZ7qQ6zyghewYjIvy9XPmB6w_q9P1kbqwPF1oP4sCWbj7HpsZNn_Itz06j1kGIeQ', 'android'),
(119, 16, 'customer', 'dRJHwck8TaiMZmX1Ui0zFZ:APA91bHQQ7vLlCDx933f-YDxMOhA7jCPDYsHhuDRVpY4PgKZZaDFheb-ICQOIYHGeQT2KCKr7pzAsmpqE1GNJD-QTDAtDwqJ9knCSbHIW-28hr5AiydHP00', 'android'),
(120, 0, 'customer', 'cH3eEuWbRdGcm_63GyoPAr:APA91bE70XKc4g-MvEyf7neK1GXcBN8-0s4XXTGrr_FgwQZNVIBoerxo5flUQlHkuQhSmMBZABMLhBz3GnlS6VadaoGIWE1Tr-0QQF2DRK5VtqdDpteZ2rY', 'android'),
(121, 86, 'customer', 'fRxZnvv2RpOGk_tUDtRifV:APA91bFiG5ibVH9zhVafViLp69VcqYFxrz0l7Wd0oJrBuQBW8dz17enfzwhSnbBHrBXw46NgYCIrExsgw3EeatkjmMK1espt3LDaq3HkfIb25chgLdsXthk', 'android'),
(122, 0, 'customer', 'f57JTbTAT7qB_706UdpaxM:APA91bG72Ja4eMpVtRFfCKCIno_whggT-OcUtkV1BUfAzhIjbND76pjZT6jyz2Cw9BcOkbO3FhX4gGf_FGb_qDiNE2NFT1Gk6LNTyKfUoaaQO9jTA0U_UFE', 'android'),
(123, 12, 'customer', 'c7NXEq-wR1qgbT5w20nEwq:APA91bHm0y8U6_pXN01wlMxQuk0CaayltGBXpaiEqBBhkvCvbIf0mVclo2NcKDTmNuvhhN7a-DoxrJ7oJ7wII8YjuEj1ishbo0usNlOC-QKJoT-28Bzf0z0', 'android'),
(124, 12, 'customer', 'eIZMog8HSCSUEb_5dI6sxI:APA91bH1VRwgudpHpoGr-H6S-QBA90D-uSZEzpaJu7EEhXyBy09txS7Awm9rv7gzUdV22vUFHR-FySYjqXkkG-TxjM6j-tAsMjsCkip445Vks9WZWMhGkNE', 'android'),
(125, 10, 'customer', 'dgOt-oSCS0Kbnii4bNK8Hx:APA91bE7RRut_TA-cZxDjWd0XjL0AMVqALoduD8mJZDiiNTl3or3rhaSe8JWwLF00DWyOT8JCssA7FJRYODLBUQ0Q79lvMKnfHjwOfDsGC8RPqT6hFMwTdQ', 'android'),
(126, 11, 'customer', 'd-sq0dT6TOaOJHvL1_NX-X:APA91bFntt6Oqsoeze8XgYfU8Tu_xfPUocsZ6DD1C0poYCQX1px-iTtby4vWlUxDxOoieRZJCOKDYKnXIRFE_chEMW69FR24CJeYUv-8lTi8jEHG8prX9pE', 'android'),
(127, 0, 'customer', 'ck4G8TJCSj2pBvcHmYTx06:APA91bE8KB4XSnkIfhEBglj9IyZpV1ta8ZSbe6E6lainsm1GLxnnzfeMDnaNsA4ymAaq3iUl4aP7PVijaRAg-jjuiQkM0OqeRLbjoS4jPFN4USINWmL8nC4', 'android'),
(128, 87, 'customer', 'dMTxxD0NQDuHdoi_DSxpq7:APA91bGbUI53ZBzIUy32UeTpBIwJiuDmM370wpS-WgiDcqjxT1_PeOwkEVKFTixnrrzGPFaEwP1ilgRKB6MP8vqt5I1QbR3wzFf-oZjNlp_6cXazNVWxZAo', 'android'),
(129, 10, 'customer', 'cBS9PQtzTvSt1hr0onv6zq:APA91bFsGP1WruopkipWfJVCAbbei20xkjhNGswC8Qwgh8gGax7g7T53Rqr0lBIxusrGWmYOwR2gqbJT5MKis1Mtkdpr0RB_EWiyQ8Q48DUFkzL2Q7cdMpU', 'android'),
(130, 10, 'customer', 'eZsksrWPQBe0ONo4gnlwBe:APA91bGK8e0sztumUiwbtY0khifXmCMkFHuEuwXie3ybAcLIChJaxc91yepwzrvwrwUr6Th3__7-DOmhX5XG4MMgR9JVkMEN-D7quGxVzFVnMG7-3aeQfc8', 'android'),
(131, 88, 'customer', 'dIibRf0MSASjmUOjqwiCoG:APA91bF78Txssx6fy1E10-YTDR9NKI3EerxIUB2PKcL6yDOm0peTVksuTSVbSF18P-g8s97W_LJ3Mlt5tzuSbwjKLNQTvnndOnZ90LsNXKN36SEEWe31MM4', 'android'),
(132, 10, 'customer', 'egA3vDA9QhSlyGGFl1cINH:APA91bGLJy94b_TSVb1GEKRNnriY2Vom0B7iSFnW7DqdeZZJWXg1uW4QqCc658WE419xyYQWi01l3MF8xw9XckSgLg-DowzKYt2IqiwN7RxIt4r1tSV8Nyc', 'android'),
(133, 89, 'customer', 'fxibYhF6RZaV9HSNL3JjWv:APA91bHPKSKmDX6joApU_m6XhZJ9K0ZvIlr_-r5hT69Ddn6cyOa_Dpi58oTflOyxx53J9qDLTHOjSWjYOBKTplkGQO40uYYpWHtUdxO4vbckka2ugYSa70w', 'android'),
(134, 0, 'customer', 'fak0VrTPQMWXDwncOrm1Lx:APA91bGiPwX1mzc5MfxucM59tMizMV7I_4IpkTJFci8EgQ6VOpUJFteSdPl9bQN1HWs9Lm9wBDX1psisFnSJ_Ql4tQ4y6FDZ33ao3PTx1MCIRTYG2Tl5D88', 'android'),
(135, 0, 'customer', 'fd4LZxuHSsKXHIPyRGt91O:APA91bHSSuNE7L2mhWzUP7hdwWAzp6bp1iKzEIsiX6b4W_MisjeH8u1aMZpHwwqScXc30CoDJE15Ko7ilszEdW3NHWL3zIiYIGx1WwFfL2AGgxzlubu9jnA', 'android'),
(136, 90, 'customer', 'figwqpz2SCeDugchmcdYSb:APA91bEo4rXcf6ce5FRgatmQme4Hf7r9SVfYtuILH-jU5saSkwesFgs95URcOetN17KIIjZ3z1nTDUCDkCMU5hEyGDDzaEoj02evDUJi-qQf6XGQ75dIl8k', 'android'),
(137, 0, 'customer', 'eKYmD5QmQIe--qc-NMdi2W:APA91bHrlxhxd-LKzN52mfK8jW3wRJvnavglVa6bviyRyuejmFiwYdP5Y68iEZuejvoXWAAk2E742lZDzPm-BpFwyGqNUX4R1G-YCQwOX1Hxo72M2yy9I7Y', 'android'),
(138, 13, 'customer', 'dIMBgj5XQ3Cov0fBYyfbyI:APA91bEz8IT0viHovDXmlRxQvBwrfmdDOiP1GP26xwB5RY3FZOLKr4iRLbI97jUOCSVUYP-7q_cRCWlxM9iYxb1r2oTiotkMePLo_xCraAjpwmj1MunvVw4', 'android'),
(140, 10, 'customer', 'fzfRfaEgSxONy-z8dm3jLf:APA91bEwxKUxa4wl4c5YfeJVt8ii_UltNYKuCuFFC7R7Co_3K4jLdmUtHFJ5wUDUPP94KDjBMymjw2V5aQNS6KAqhMYFkw1TAWBVurqAm1NosL-iVt7V-tc', 'android'),
(141, 10, 'customer', 'fS28sf7dS4erXnrZbIvS10:APA91bHHZ9A6runr8DRY3BCkoJYkoCFVPSfi1YDm-UPPARQeS8rUIM_jxsDP0dkZdZZn97Z38OD0WHYgxGlu76hcQr70zGa-Fv_ZEmx5pbXcciqqyut7Okc', 'android'),
(142, 92, 'customer', 'dW2c4fxzQ4y7cV3qGhpWlI:APA91bE2-auTxUFqtrLmYIki7fGMLNF5hI5lzSCTG0J-JtJo6dTzXLgnJ27wAylBRXkBV2fiFbd64kglF7yWIHc19UoKbEqwz5g13VSFhEz2U9BYqwmZgtM', 'android'),
(143, 10, 'customer', 'dA71kdGlStq7sX2IWRtfGr:APA91bGasRc6mDR5BuvRTTVzLJALH3rOROiEr7KqE5lJai13gpxunLXQJ90a_bbbPNtgl52H3_w0Lqy8cqXUEw25FYkUNXMhsK6yzU6z00dRBzU_XA0fq7E', 'android'),
(144, 93, 'customer', 'dlWqmwx4RTqOphSfYsUL4Z:APA91bH5RPRHZG2UfawqoyzMgFgfKroext8VHNRccThw_PTWI0AX52wq3MLj34DVlKoSVifEBcYIK-ferQ2PMngZ3eBz5Ipr3E6iV_7UpsUPKKG6MvKiRps', 'android'),
(145, 94, 'customer', 'chAseSFbS0qzN_qssaXVMb:APA91bEQaoLq1j344OZVaxRMsOrKlx_qWy-s_pMZoDm5HyHVJf-0kxENQyy1JZE3TIlkMWHzOocg1E28_p74R4fPgC4b0coPG3GpHTKfsuNVXIIXVNdm-pA', 'android'),
(146, 10, 'customer', 'coWltno1Tfy8Av8esvxnAg:APA91bHY8Afz_vBU9arM-RsxkVsUgoJU2UZ2Nir79rrSzXuJY_7jrOY4elZkgc9xJrIP646PxEa1eV86fUWbz951lrbriDi8JCYan1eXdCeYwfp2JRuVRRg', 'android'),
(147, 95, 'customer', 'ck2Xd_-bQvqP73LWCfIQP7:APA91bGVMZTgpuMOvieWkc7eAJflvQCf3l4L8uQ3waVxjJOxIvhenGexyPFH9xXl7CZXEDcuRG9cRMfbGgrUiY6HPPRCCR0Fez_K-mpkCeaFuZvbeb1ClF8', 'android'),
(149, 80, 'customer', 'cvwbjQemQz2ZHfY40xxE4q:APA91bH0-QAqpCCbRIK_gLFRKmxu7aQ8CfUpADxe2_YnRaSPKMfDWCC-mn2Fp4yx4ERkTEgo9GOcjO11kG8w8NqciyZ6z1OG8UAy7geTMV0Wff8enPvDrW4', 'android'),
(150, 10, 'customer', 'e0OoQhvHQSuCAAQ7m0gKHE:APA91bEERoV2HRqAhxlzPnj4P8-MXHt8iTl65HyajdOK0CquWi3ceORh_2dfsH36DZ9lCCH91R5ZtRi_VErMOJADryjEJ_H_a6RXhAKRsg4KuBNJw0CjKUM', 'android'),
(151, 96, 'customer', 'cYkaw_MRSRmOllC7TxAOLY:APA91bG17uQGQHh32ZTe5ECOGc4dLZD5CjtprvQGxAgqbHgzo7YzblWkfSmfPr6rn37YcadMa3L9V7KgHZ9Wzh7E8bJt1pGlqAO_Yuw-jEglMklqIlscc7s', 'android'),
(152, 0, 'customer', 'eu-r7sBvT76tudX1_qL2H4:APA91bH6xiTIA-YjpJsNppEcBx_IJMbaWiq2Dq1bj-tOzzF_RcFDAcpA7597H_li3Ob5kMTEgzOYWpfB4V3lbWHSwQTgxzTGY2XZM63wSYFaE-VR-RG08AU', 'android'),
(153, 97, 'customer', 'c3t2dSbKQ1C5tquBSBtJg2:APA91bHbvJrgadjbjkdOBbrXBBN_Lp0IT_vrv1G0Dog5dQoCUUcm82-mHhtXJXhtn1aTk2ezcpHkqyDcD6Bdlm-dcBmcHVwkbwlA_IXgOpiA9xyF9b0WU00', 'android'),
(154, 10, 'customer', 'fYl2hlXXShOfVTLtRF5YnD:APA91bFgSYUesuOlJn9aPNvW3EtdGAS0l2RRO0_2jIL1vdVu8zfo5CiqJU31exhJcwLr2qm4kXC8MdS_GPuPHyxCzD_nCegG8Poj4RlpvLHCTM-je6T2vak', 'android'),
(155, 10, 'customer', 'e_6eEhImSpejvqksaaAYCl:APA91bFPPbPG970zRL-UDQ2rvE4Lbvkr24wBdwBBFsgc1k7_zJ2M1lAQ4gH1V8l8pWfoQUbG-8zSUUgYDEpnRfyIrHo_LTv66vZKXXMmhPdHQKkWKt2Un4E', 'android'),
(156, 10, 'customer', 'fTAUp9shQFCMIaRstLAHiN:APA91bEXD6T8gTUrdA1MZrBBWM-GQbDrrK560mEumhN49Ucs0eh75PzZJQyy5jEPaA2BfOt2x_Jt463XYfHh18cEewQm2VYaMd48I0ikw1l0H77yRTbKw-g', 'android'),
(158, 98, 'customer', 'd-nqCG_hTHaPo7ElcnO2b6:APA91bEfrEJkWFLYO4EU4Sx_8UQsxkk6FSdcbKp9ZFlFHOM3A6A32umwN6S1F85cYwbVTFNhFhFhKrkDBqjhh8papTGYAfsz2Bf_2ZlgNmzqKwbMC8IhL0I', 'android'),
(159, 99, 'customer', 'cNBxZiInRSCVV20AYRwE6h:APA91bGbzMgttiDrfIWUW0sCkMNXmLjZ2b3rPXrHY5zYGyTnDoiUcEiAQZe2JCCSr0USWLrvPp3MD1EHn3JDX6wp7ND2a58Day7SJG0y8Lw_iMW5Rke-xUs', 'android'),
(160, 0, 'customer', 'dZBusyozRE2rwDVw7_EyLE:APA91bFe-HilEPpVk0NURYFveIvY9cEM6o34Q0NXbd3P5CEu0phkrSmpWc3IfgqsxF3pc_DgZwj9NEdYyEaISvdcW6rvTwt4Z1WhLEHgqomL-TrpCaG_1Vc', 'android'),
(161, 10, 'customer', 'cmfKiccJTOORAwcoo5b6ta:APA91bEGG1ZLu--c07JpPajRCR7gvHcrJ9wdEULgDzEkdy7nIQPcsP1LNL7O6NEjS1WL-0C_x0Q8yE4OmcNq2W61ldOJ5DJO4rLws75fX0SWiCHvOqm6oBs', 'android'),
(162, 16, 'customer', 'f4HP9KVDQw-uY050FCc2Pn:APA91bHxRe2IWltEGBPx0HAfx5niQ1Ab0YUzeuR_fLahBqaI_Z288SgEZ4KDItlL_PDL1DQoEwrdyXwQHQokQKurerX8fvxaWkZLTAb3eJHSPvRdeMx1cIc', 'android'),
(163, 16, 'customer', 'eCFTZd_YTAWyboxJ2ILxIT:APA91bH9kJtDRJmFIIvwN8R1oF5Gdcebbk80c3b08TOGvKqJIGisqx11OPHjxbIXo3ABDaLPaOp9xfFlwj0Y0DE-6SpvQnj8ya9Hce7o02Ail_3Qcz-9Z2U', 'android'),
(164, 10, 'customer', 'cIXkbY9WTm67XMf8GU1dFv:APA91bHouSHh4EMkIqk1VHfbRyvZNZNVmHgBhttZvxxfspmH80PF-UchSVLAvCfFShXBnBi4BwF0jInRG0Rm1vNio6Y1PdfSVHquSZ0bfNNSclkyJEZ9zjM', 'android'),
(165, 10, 'customer', 'dKW3qPdTSUGmV8XBX00eY7:APA91bEuXiXLNBLu-3i8RPh8EMqBztNOyAedLI6ijRup39Jr29IBZSoEjjo6eQeANI-1UmHyEIZ6R7Mu3nt0tALtfBkyXGBmw-2Gy9M49lL_lzEYS4u9r2I', 'android'),
(166, 16, 'customer', 'f03Az_UBQsKfCAft-UKdsF:APA91bFx5s06kMtbv0SGr27EwzBsEEy_qVDAuZQMNb2ONL-HprPUgDR3euzgkvcLqIhY8DdimN_UR9FsEp7hepCHDrnpLIb7JQknlwNGaXcnbQ5hcuMXzJg', 'android'),
(167, 10, 'customer', 'fZkMjJCiSrie1hTMCZSlit:APA91bHFEsF4Csoao2WtAABISUgAJx3cnnwTIlEaCnpVSL6yyZTyF85DB5Pwjs2jxUVk5jbFNbd_skp60Ec4uYgirqLvqJ8lG3MTWWbDuaIn--W88vRVA4g', 'android'),
(168, 12, 'customer', 'cLfVic4wTS-VeSIY-OZAsn:APA91bGtjv9Yb387cR5z4ocwrWdz3EEEOHrZ2Y4h7mjkdMu7nQo3YFMcpihLF5gHpa9094EhuQNg4vG6OpRnvjy7y84CoQnZX9XBFN1h7x3Yegz_2qqcHyM', 'android'),
(169, 12, 'customer', 'et0IHtLeQ_SgPaC3tYZLHL:APA91bFDt-6xejVDbRG5SUA-pDDEfTZGeBmMEx-NmAOr2fQiEmgU7FK6ZoAMNJdQ6Pj9GsxU_O3l-YVWLvOVU0sQymfh1m5t39DAZ-dD1gs7R-pvNR61hV0', 'android'),
(170, 78, 'customer', 'cXqoOPkPS9qFifIUkcX9bY:APA91bFrtnAi6PlMMsjt4irR4A8tvjliu_rMqs9dn_YW5pVmuCFBCW4Of-W5YQ_uWlArSrYCMbomYi2BCskXhJxus20zHblZxExwirMyry8dEh0bZrMqsoo', 'android'),
(171, 100, 'customer', 'eQL_fagwQ6y86o5l0nrob1:APA91bEON-v-0U5IBG_6LH6Sy8aR1x245o19AQPCJC_5edInqSeQxY9XPCpLc5sTpZ3oRwztNKQWBAWwndH23Sp4Vkaus_DcCA85hUYYWCi7lWqSlQEKxmw', 'android'),
(172, 0, 'customer', 'f5f1zPNjRECwbpml9nv-Zl:APA91bG4uTxJxS0mtfAERyeNHem3j9vobTjwHVAechmo0L95SpcaNMYA3kE4o-0BpzIpjkN0QZvV7jFGfmi3NGos6RCvaB6jb4rZE265Xs32SiPtJnjIO_w', 'android'),
(173, 101, 'customer', 'c1qwelUJT2Csl_JOz7_zGk:APA91bHKdXqHOVsUcpzKvL043V2GBPKgxfJZ4wFNXxk-Suc-aCHyPD93zuolFX2DjzYidWUJQXQscTI5JDPcucPQfpdti8qqI4QQQUgK51L4wkcTFiTVPwQ', 'android'),
(174, 102, 'customer', 'f4XkXFUUQlKmua26QjUdgz:APA91bHOPNlhvBDpQPZA4BZMDr6e4X5_kTBGBUJeO6nf0qW2RI61DlPBqdp7o_Ww0xQ_ANUs5dWlEYNYsvMGpGi7-JqcLEHVvb3T5gr3QJKY69mbGPMHiE4', 'android'),
(175, 103, 'customer', 'cyM8A4O8SlC__mc4z2Olvr:APA91bHcVeHEwrqWKby2f4geN9vmNnoUVAVsSdbSY3d6hHwSJrEVUXL9KdhkrG9lAZO4xUXcIs5XFqIpmfShFqJUxIUuoO5f9yfcY_g-eAK_MdUzcXLQBzU', 'android'),
(176, 16, 'customer', 'exjmf6V8RPungkhVgDfIVQ:APA91bGAfyasyfdpWfuMCYvmqub6wF71pB1Uf2R9w4Rj0Y6q6mv1K9Ulq6ARkI_dBvJgqRlpUL2LD7JUEVhjRpUqvoG9psgt3ee9Z8GycFetr4hecTnFG3c', 'android'),
(177, 16, 'customer', 'eP3x6gCXRBuCRmebAm158p:APA91bGmRMLAU2ClWaMKXJ6jerk6fT1Uy-giiA8yjXPueeYf1ia1B9I1F8ckCa8rwderuoVdL2TT69_1wk_8JGd43jfERiVj5cPcjkczAxYEtI-GERutfPg', 'android'),
(178, 10, 'customer', 'flX83f8lRJycAA922iPQY2:APA91bFcCW-G4n8WXFQs-41_yH9x_orXvQ8TJ77TlDSiFeHf4VrdWVstImIwkU9AWpmbTGVrBevB_0B48H2VDI_1jyeI_GAj4Fc9G0yxhXXXfCc0ONoNfLc', 'android'),
(179, 12, 'customer', 'ciYqH03ZRhCPgkCea77sGg:APA91bEejTf6slSNQPxc3izeF5XwUi68mhPby8TBrILGunV2uFWvhkWEGJcrpUctZ_KYx6JDI6ZEZBMhLzr-XbSz1YXoH-lf8C1qZoCtQhpZRLgsZNZaPGw', 'android'),
(180, 10, 'customer', 'cCnTijlmQFuivgiUHZwCOR:APA91bE6tojSQrYLaI5HoSHUwU3bThDJHwo58wnC-ti2au7MDxTjqTYd3cgfMjpWf2CWeNVGMm9TR60UPWDdT6sb_MGUDIhmLxCOXc44xAE7FAc77kYVmUc', 'android'),
(181, 16, 'customer', 'dOb9IoT8RWCAeZ6S8-3DGb:APA91bEK4zuyq4OnurRtj-HmHDX67NZKhNjqnR3A1MoY2gyxABJDP06yPEZ2SULY0DcEs1dNKDR4usnOyl_auK4ygFFYPFKpYu9jrpJlYokGK7ypGy9HMD8', 'android'),
(182, 10, 'customer', 'e3Q4fxCCSKCDXVb2pevqE0:APA91bG20HYdIydGvi355awCvRAFVW5HiHI6YtMiS13xrPazLgnzmkHU9odgp0SkJmzluhdwvbyu7RN1B6AnlmBlcJjEUBIA6u34W51NvFuh_Gek9AcEfis', 'android'),
(183, 16, 'customer', 'd_q4Ih59RUWmCJ7ESOGu8l:APA91bHDjChjQiV-M5Zy-6-CPnOEoOea_C26eZr29LZWPvU2NXGgrheMNbD-XxCtT2LTXzVkZnGdDuRL0DxGAUZaEfaFSmrXvhhjVM6xhalNiIKqql_Dt3g', 'android'),
(184, 0, 'customer', 'fH5z1PA0QNWc8_kmvbkUU0:APA91bHEdyEVSITl-1eS5JEuqHUlmvpG8gzr3X6awfK9G8btFpL9k_IHy_u62k1aNm0frnP77gbReQd23BHMrmqMkHEUPZXj1hWBpVaTK9MoJ7TJmWl3NiA', 'android'),
(185, 0, 'customer', 'fbI77Gd3TTWRKf-n2XmN3p:APA91bF_OTQf6ml7rdBB2SQ71PKEciqtdancfylVtmkiXwnabNShjNAZgonhO6WaZLxaA-sa75Dgvp6wtmKBLlkeTCz-KFbLHpj6AJBHn6IXrsxUO2W03lA', 'android'),
(186, 10, 'customer', 'clXisoJYTQusmuXns7lP8a:APA91bHSfe8mhGkP_ylgo-Wez6eUXvBrlEhdaqtt6VdTCFZYBYsz_hLCWDLtWhyTv2SR5xTJPOFHevacC_TgRKnUa0u-L43OKqyMqixqZ2DgfTf-mAPjI2k', 'android'),
(187, 105, 'customer', 'dxDNW-kCTI-rtdUrLfr1m2:APA91bEtyYlezs3LmQJnKZrNNlRJ5BZSuKrFfxOg_jHyAAtC0_EkzwjrwIEyEFmB2oULoSUChJZzNOWivf6E0E0Lfi-Jaxl5z-sYR4H2Moa8xt7UjRAqd_Q', 'android'),
(188, 106, 'customer', 'cTU68qSdRWGJWV2rKLgsvN:APA91bFOhbiuQA40O_WS34snkooo1a8WU_WosJBrVI45j9Zr7l-8kikTYhDLv4Kz4Jw4-wPgSu09tHdA2YZzfPLa2vlpLntr_bPCf_I4Tu75FQAEy8NTJXA', 'android'),
(189, 0, 'customer', 'cEgW9-TcRq-PZCX9aGu30W:APA91bHrLZjyylQOA7MkNEl6A1AEi_0HP5433mzaBTvVenzhJaypCC7V3RLUPtr6ct_uLkJaK9f9P-fVQ1c12pPwYXykJGxJ20InQmaHGzAkMC0nKZL2K48', 'android'),
(190, 10, 'customer', 'eaieoPCERJ6gFO4oFSrdOY:APA91bFHKAqDpoyY0FjMRbi_Ql8ruT3lL5XqgK7hKUcd5m-NzQyhpcbP7I80cR9CqvpjSGOvGlTHW9oXHAdESDrC8HowlRrp59EvYzMvAQ6ckkseBfxbaRQ', 'android'),
(191, 74, 'customer', 'e6JK6F6yQR67r0j10rwuWd:APA91bGz_vStce1dI99RqP9pV4wnRnXEkxpcmffgjU4rJdr9WR76esJWezLJ-ALBAIjN9FzU8TAx5n2jqRxUJISiak1lL9aFsreOkt5A44MP8w13-C0s7zc', 'android'),
(192, 107, 'customer', 'cKEx1qYISteHqybONixGTe:APA91bHBmUq6-wEgYjsD2x5iErG0GUXgWorsiGiyB4briG_eNDinOO-eLxV594FHGqLxOJmZ1rAfFJBd64rFuEX2Ys3y4bF0gPb1bG04p2U32JQNk42jcLo', 'android'),
(193, 108, 'customer', 'eOi4215wRSqLQmIYM4EcB7:APA91bEH2Wc_o9-JILz7A6vZ23Hm-1J8CIdvd6o16BojvApHuIvRKe1ShO6doZ4KZ3x3PIPEZSilNb9jfwhfAlehG5Y9jjNM-TAGZKm6nQojmeblb-1nw3Q', 'android'),
(194, 109, 'customer', 'eIxQOaTpS4-ezmaTBGxOhf:APA91bFoVh7Ce6R6olhJ50UfBI2oNypkNi0LHHK24-KstqfygKr6QFXMxNMGRfoBM6SQ-YYIh36fwEijMsZilDvItftVetwCGSgPT4sI8NJayF74GnpUGbI', 'android'),
(195, 110, 'customer', 'foudV2kQTrGVpfyBErPLwK:APA91bHzuKBVg-XOm6UDUZ2dC9sMrR_MIokUMlQloWK22qZL024-2JpJp-HFM7k8l2Tuel78z_NW3JjCk6Gm7MWgxpDEm3Z_NRiwWXv4k60qAvB_L1HVx0E', 'android'),
(196, 0, 'customer', 'ddVl1BCOScy_udje-VB2Pr:APA91bF5EVb-kZ8JY1D_x2ALVyuf-O5z5LLjdWKy360fcsLo702NY_1sH7imRLxGKvpStj_TG22-I2nSFO2BrZoNbtirMtYN-2P_HZdEM4vSSwruRRU-3io', 'android'),
(197, 111, 'customer', 'eTYUoI2PQ_6ovVPNlzitis:APA91bHDpNO0rQqT-mlrgUT6_tXRQHurrEHAWQFXYyl5CS1vccSLQOB_BIyDgcgJRGY1mzxiIfJ8DPjh5AzaH7uD1sIbWzPxbddQh1tde8d7mCpfI_lslmU', 'android'),
(198, 0, 'customer', 'cx_tA7VdRnm68acz6JGPIi:APA91bEDSRhmTk2phfL95TvYiUW9Gp0GmTrE4TAOc-dCo5XQpWCipCRuYPJ267f7jopzzAYNbNmlA-zy8ngD_miYGEBFzuF-1Ze-zvFi-MMspa5xPxJGrhM', 'android'),
(199, 0, 'customer', 'cKKJoae7Tc2RVUvUrB1Ple:APA91bGGU__Y9voic_Q9qKAa7y92uSAcSG4s4udZnJtZufcrnCjPuBc-E0UZiHwhlcGOt3XpXP1cf9w3X--LkoKUb8_JAYKlt1_b5HOJLc7TI0fdhIuiQ6A', 'android'),
(200, 0, 'customer', 'fiCP83i2Q-m5vhVWttgniv:APA91bEBDR3oh-sYwrR9_U4bWlzeJpL8g2UDAwfHVPWsUmXgYapMS1YqBQMIS0MNB8JtW2rxpnM2MZ-75MeAmu3YGAaUKsgHREve5re6jYqNpe8jiXkUL8A', 'android'),
(201, 112, 'customer', 'fCJFpvN3QzuvixQDrASNNl:APA91bGR4bp2TDPhOOs8wOfaxVCro01DWTaQuop8nyh41WlU5yJTx_ioH0xJVoBWZ2L-GIEzGV8OiqvOiHzJbnkS6yPjIdE2cH4aiXnJRkl1Iq2coyHvOms', 'android'),
(202, 22, 'customer', 'cKTVZgqqRkaQye5qd_vM58:APA91bEtA4sj4IsUW4tXMSSneveamrFzkNhzHGp92xuFi6AUurABS2NFv5tvgpU1w2Cuedp-dCJryd8kL5epMXKrZLT8IFWzVJmN481soDSaKHRxz4mz8LU', 'android'),
(204, 113, 'customer', 'euzpnZ-4TUKLEt_VyHpHjK:APA91bFWR6zZYE15ck9TRf2iBXw6snb71_sIARvjbuv84uPG3kvhddjyS4a1-3FsWt-iWyZ_cX4SXPWx9uF8kHf3rP-4rkQGrvtvpJxQ0JLiH7F823vVdtM', 'android'),
(205, 10, 'customer', 'ckA9Hu6QRzeJfx_agoHc-r:APA91bHii8EpNFDiAW9v5q3AYPQnU3Xj2_sSr5PQ45uabxAIqX2grDqfOsPxqJ-6rn4WghzeFAinXAitSyMSgEml8BfIwPlhIwR16yeL7Jz02zP_2Vw6QbE', 'android'),
(206, 0, 'customer', 'eK5-tPcdRYuB_EqRY6pGw_:APA91bGPc7PBsS_nxWN-UdWIZUQMfFV21Q4Pd5FzAS587AAie4ybUf0MPwwVyzIoxEvcSqqCquLEh0WCZzJVfn3ly71s3Gm1rkMq4EBxfYUe_j4nJj4QLCY', 'android'),
(207, 114, 'customer', 'cEqujhCgSWCfItrXMhLg2m:APA91bGc4W7xiBpZuD7xzU3FO9NGMNjgWU--OdcmFVSD2sBWeoKg2enuO7zCS3-lmWfcx9OXjvPPzCnyF5ibp-d9e6YMCzRWiWiVI7LGKgl9mdQk4LI_wDU', 'android'),
(208, 0, 'customer', 'fUbmnXPyR3e9ghUBcT4IkB:APA91bGV13PtIC0ScPiLhvBLSprOmj7usPJ_qo2QjOrmE_DX55fFuVlSLPA_QCrNe_W32UYmcwjho55OMuss7k18HMehn5S-Vky7Nxzl0oR4cnAhodRqQPo', 'android'),
(209, 115, 'customer', 'dmalMtvAQcOwBr7gD1ID5h:APA91bGFyU0sTirVrHSaZhHcLUvgOn70Di6yExDe8byVhFUC6ffPa-_HN9CcSwth_lXliEQ-VAgXPXosPguqL3bu8NrlNRBhk4aSg9_rTjwPJKG1zlaa4Yc', 'android'),
(210, 116, 'customer', 'e0L_Ju9DTUqROTaMqG-H1x:APA91bEGX0kjMN47nZ7EI1MrV9GzvJBdgldGu1VfndNiaF-v75E3dT6xbVw7f1wAhqKpi8B5fP5ClpyGteAFjVUKcBgJPdxTNu9dkn6Euud7cbkIKiKgwjE', 'android'),
(211, 15, 'customer', 'dS2VLUV7SFe7TdlS9lkEt3:APA91bEl-bGUDgZhvP3tRNUL9VJzwHKCw3MLYbK9yZRJU0rqkFISpKsFu4q6GqJjCASRH6_y-h29hl8MKV4pjtZMMjSUgd0aYTNoHIpi5o1lTSizykAzjyM', 'android'),
(212, 10, 'customer', 'eBHSey6mTbue-bfrqXECpO:APA91bF_70wfjjBpmovTJrWel2hJDKGzc06-wWbRvY1Dpin7Gs2z1Z3X-ZuUc9HqLFjCqIV1l8carnlM2u5VqXRg3d9HrdBJWyUHcPdG0Ae1qNHRhm4qwhU', 'android'),
(213, 117, 'customer', 'cpltn3-8R2GHTLmCSfeST8:APA91bGTQYyKCksrOotRtDUDV4ejCOG6BrjcfxxnFhx3gguMiewzmLK9y_1MPJ6rG_2ZYlueV9PQENyTtKFXon_qnvkw40myXJ9h93ZU_jWWdrREkC2VwVQ', 'android'),
(214, 118, 'customer', 'czQi8cTDRxmp7eYXWCgKZK:APA91bHsrvwCKBZyBV-tkTK1T9vDY9qGHQikXQpU9g7V2pxLvuNCbSpM36s3IHhlFIysgH6kSZkWmlwhKI8JitCfFRhv7VaMrgSWWui6IHFQuAQfThpLc1o', 'android'),
(215, 118, 'customer', 'eggMgYlwT9qmG0oUmbtKra:APA91bHoxcpnFUEuzzwUMlAXxl7Uoi57gHvGHx2A7vwH1GjMXqym_OOLddN_MQIe4tOYk9ymKdmwqCcZNsN4kfF7XA_dfZRmvsmbDUuA-2hcE5fJ34STQGg', 'android'),
(216, 10, 'customer', 'f6vc7JIUSTaqmWYHRfnsud:APA91bEcm2KaMemdhpypXhy5vIEGFq_78oP_KBL47KZJQT9jmiLhDOZYiRMEVBfF8_1z9ZCcpvgqswtXtymur0TMlarbJCx1_bmz7A5euqFOklxrosomSNE', 'android'),
(217, 37, 'customer', 'cwQImbQRSayk-wzNnP1rNd:APA91bHQ9TcT-c3dXaXE36rYV6B1iQeFlamQ8lnzJvK11JuL3VavrAkQnsUa2IDBmOGew7aeMkaeyKWoPonUbcZYp_5VYfeeB8NlqLVygdmQjYbhrMIPPS4', 'android'),
(218, 119, 'customer', 'fHaSrmhGSh6ddpU7oqE2Iy:APA91bHHVfcMztDEV2ZK-tH5DBLZLVy90DRF_rjpdddW--YCuHzE1p4L_jsvaOQe-dLvTL988l-DsFabcV0Q266UDOrw65tOxYEJXQiN-1TZ0Dv1mUTm-Bw', 'android'),
(219, 120, 'customer', 'dH1GJkBhRJCqudvKm7Dfd7:APA91bFCYN6dUgqEV7hOO0TW_uWUx1dtT9gstQAP3omnubAZzrXETpCaKC8l2xDanosMydHRJKM4csF1gO5c1oeBWQo5rgm19ml0HgdWa9bZtZZruUdvyq4', 'android'),
(220, 10, 'customer', 'fYFQDnIyR5OQj9RMbKaJCa:APA91bFK1REyXrPi3_FmGst-Svtgh6uZJw4HhK2HmUbGnj1Ph-psueNWw2akKbYc9gRqyGHkLMPV6O1qdKek70N9fy4YuEjgM6A_5t8Of_OQmoGp8JJ5Ftw', 'android'),
(221, 10, 'customer', 'eRuMjNtJRV-lTMY_GZhcCM:APA91bEzy0BqK_QGaf9N7vcwEDVwpoGCR44JV5Qo-yWVWDl-mNeJs4kHq9-nSAtP2i1CTUdHgt_87x-8e7weKYVLvHvEOujWvEb_K1no057vO8Go9pKQm90', 'android'),
(222, 83, 'customer', 'dynsHXxkQ5a3YHMsV0dKav:APA91bHtfc9VSbR7sMQe0UOKvSur7CFvUYkG7ZTmP3xVxazwPFDd6-Onty0Z8iD51piX-ohHx9-aNWSBZGwAJCY7b3lrpfb1Ht_Dgc67VF3Oei8NB8XFWp4', 'android'),
(223, 121, 'customer', 'eKzpesNvRreE0GmGaFvU7H:APA91bGBCQbkCCfB9agbeBv0LAEO-TOKAsMoD_HagM0dUPdkOybpflywSwD8pzur10sbH-UDzXbW1unvI88ApGWnSNISnjm8m6a0gbjKphTv9l35ZLEMU_I', 'android'),
(224, 10, 'customer', 'f7g0EZcyTvuAnimm0620We:APA91bElgNSmCPbLPPOFmQlrqqknPjqznXQcLrhmTB9VLmvWItQ2VVuKWgPrHyy5WOiOyLGHP9MTUSrW9L2YfD6mAV-n8HCTBt-DhJRCUlbljWKtxLnX04s', 'android'),
(225, 122, 'customer', 'ej9ryOcRS76ThUjYoHe7Jo:APA91bEWQLRFkcwaIsl48gmVY4EjpOd9D5iblTVz4tj2A7Fkt2tqjQOfB3g3vU26pQ_-NrJ2X4B2nbJ6G8lZ8dnsGZxgI8k81rC5LsAS70GTezNt7tqZ9_Q', 'android'),
(226, 123, 'customer', 'czrv47W3RISvJp7aHT1cBR:APA91bFf52d8LfMuYyj1eNBLcGxUS53fToRs_G1Q3JxqwfU51d0Jy0y1X2sJb_UpQYJZzPkN11NG5YpDdVtAsDDGINMSZfS65j3MA9Utr-tFklHMc-RxB1g', 'android'),
(227, 124, 'customer', 'cxCR1-CMQd6e3m2N1CXCwE:APA91bHp3CvHyaWYIdYQzNtqRuz3IxLp1hNsKvY31e9UCKPE2qKd2Wow2MnKKW8hFH0yrYF7c2KRC_7za2KR3LX3aNDpMIvChSxocEWgt8NtgGW9BxSjRek', 'android'),
(228, 125, 'customer', 'eZhbOIPORnihHUPGhb8Hrn:APA91bGsN_vXOoW_DNW8vjFNSsxTHn9V7FAq1jiYUkVWnV95Rsr_WGBXVXRW64xLcBHKp4oca3k8vw0tIjkktLaRbwh20lKDfdl11g5iiZ33mwPthS_uNnI', 'android'),
(229, 126, 'customer', 'ed7iTJ9fSmiu8NP4Zz3fvj:APA91bF2w_tRFx3FTzjdRyFuAxiGUm7zOLUhh8ZwsIHImSbZeAXnVHoaUf-XeI0MNbbfD08bE2FmZNcTK9fnSdgxTJ9VcG1EgBgkGOUxL4_Aa0At19ZBMu4', 'android'),
(230, 127, 'customer', 'cb-xhV7QSkGG_hspEs7mpD:APA91bEWlM3T1y6kf56yOyo7TSUX9g7M1NFkg3ZkJDo6jGPSmgHcvTeACjV55ApgF-Kv_K4oQnldGjmhCZtX5rZOXEe3e8SmJerze_Vie8fTnJMKkl6161o', 'android'),
(231, 128, 'customer', 'e_rXtbl5RS6_iZy76pTrvF:APA91bGLEvvWLkPmzQqaEyBHoXPA99KIqpnEyxykE8hjJJWgTzQv0wh9gEmhPMoKzJp8masnPi9BDsNvdX7EPiFdBzzj7zFo5phJskuCOKlSvrD959uzzas', 'android'),
(232, 129, 'customer', 'flkZwWw3S4GPRIuc6T79CM:APA91bF7BdJuf8CrB-HzrXzibcP5YGmQqT1yckz8D1A45FMl2_wKgSZNKqW9gmgqWf5O3_SLDzbnt-EUKHT2sxoF67tObE20Dn19qfkYUKuE3hVcwoUoBt8', 'android'),
(233, 10, 'customer', 'e_dzNI8ATl2pwjMALXqX92:APA91bHTYgm4MYeWbL8j9ygTsElQV00nGLtkZww7-x5nXr2__w7OxQZ-dumitMdiDEy9luM7W-7IVQtWgk-DkCc1cGrkaenIzl7sMTnpwgl3Lo0bAONPrVc', 'android'),
(234, 10, 'customer', 'cqP8YPCdQDOYGVsG9Tiv54:APA91bENQLTKQgGwsVjGkNqwCB2XGpksghFTXSMj6SV8QpfKrwVpntpqr6zyHDOOpSonveBWCgdD90S_7YEkKljGFvvNp5wLTFxmajk92B3u7xXzGEimx7M', 'android'),
(235, 130, 'customer', 'cEqMksuqS_WZ6_ln7pyl0p:APA91bFXIwmEEWNknyUYjwzSyIfaFBNb_LNT2kG4Zzb1E2UbisN897jiDz9z2R5o9neP9DE_a1lnGq2tytF-xdElbVM2vLsFcfNzYapMxCNovPi7COdu784', 'android'),
(236, 10, 'customer', 'cXyiQkRGSz6NC9Fmusu-Nf:APA91bFrwDbJ3q0ashl1cNTvKhBCNuPgE33T0SoU2_jv38f4XJcfe3FpbCSdkwVhlGPfkrvDL-7O_e6LKf55ZqGcV-TzR15OftGhPXpHTlgsAnYpJJQGKO8', 'android'),
(237, 131, 'customer', 'cK8PMpQ-REG-Y7dH4_UKC3:APA91bGmgKToqCkp4W6eGQw5Uv4ykeV0vGsKO2qwxYV_VwZj3AkSOtn85oK-ZxwXm4PB6RGM-pW8NoN4eAKiFntpVdsivcfnErsZJVtIIxF6nUDFjQ011RY', 'android'),
(238, 132, 'customer', 'fKlzJyxCS2WkjAAmV-xPf-:APA91bG2_4RYj2wcuZ1wpLtL4GSS8Rh7aHHJd_vUcOuDguWnLMzm_q_n_Nba67jAOboMdlBi1leGSQriB6qR2pq1D5ySSeoxFLd-whRo1LJV2GjhKADb3OM', 'android'),
(239, 133, 'customer', 'cAID2Lr1R86IDnvoLWT0dw:APA91bEj6C5KCe2xhpcjTztg7-vb8tW5viiAeE87UqXrqE-uCpZAzyxJNDrJ8-E2EUrBmdzhkmCGOgb-ZKSGgJeT-FsvsZn6-OshglQF8kbLrze0Tl1FIKM', 'android'),
(240, 134, 'customer', 'fWC4vxprRwem6vGevJmigG:APA91bH2fRSHwamA_J_zTWj-OunWCBRvRXi8SnRVALhS3VPe-hJn3UEIeTxKFqNNnN-jaNdFB06j7bAD9XPKoiRnnBzoDD74a_UYCpv9EN8dBNINPNpUBXk', 'android'),
(241, 135, 'customer', 'eIsaGUQuRpa1JGRyNO7uep:APA91bGE1UrW_JhehZ_JFMzLaVVIjFG1ew06u5Oe6igTnZQJydASmFIw2jK4G_sxkruDoM1cU3Lll_lBsPGJI4T7GgFcRXleVIVpaZI5oe4CTFe5f5ouCl4', 'android'),
(242, 136, 'customer', 'crxNGpozRq6Z6trq2Y1lvF:APA91bFT-VT-lsLseAcvFXlI_5snLuIinkaUbyj7gkS1J4mCKSnlOtVMSzpUJnS8Gn0Gr9SzXvCiaIMlUJ9Sg1Kaywz7SDh0q27v2WVR8ywysyBwSoIXSZE', 'android'),
(243, 137, 'customer', 'cZ7QJsRHToOBL1St_GafrR:APA91bEhxgHI5ZL3fWi__oupuxa9jhCUg08JehbP_SqC6JbLU2peX_GwfibBBNubofnlMFduyveb6dUzL1VaHQ-z-9tS0yy_gnOzkzEO4KNzId_Vv8ZnPKc', 'android'),
(244, 138, 'customer', 'eyMK4wA9Tr-ZhVZxpvRdMs:APA91bG4x26Ia6zEGxdAlmfqxowRPmS-abqT8S46r5tDBnUWmOAoFl9IaoUZ5L7t6K8yMrik-JcvdKswe5ZH6Wtsh8MwSgmzlwxd5bEkcK9yGxtclCA4rGs', 'android'),
(245, 139, 'customer', 'fc8q8mmQRB64gxQwZTsBMn:APA91bFwlZHa4mHIuSOu8VOPDnB6ZMmSA1SRgKpfbFk9KrrJUwcEC2qHzZ6hpBXepmbSthzVXRq_wfWhAWTlcP10vdfpG6vB2_UUPcq9IoS9GdVfjxwCDSM', 'android'),
(246, 140, 'customer', 'dwD-ZDLTRwWOriJfZqw8TX:APA91bGdmUU0Ped4Vf-uSQcyXTS5I56YPrDIWVYB7mKbeLBITvRHTk9bXFPaUX6dGaL8lCRoVHN76qc8LnJVvYIrvi_CHbcowuAC60rsuCAJ8abR_Qy3R6Y', 'android'),
(247, 141, 'customer', 'dOCYqW1TSB6kcnMeTGF8Lt:APA91bG_TCwUOSD323cMBxnT9tlWa1dWtNh4CbEqAgluZoXvgR4v_CFof2ldadm2f63YjD24sMEMCTHaMVLUOMYxpufMCrHG7kYe6H6uSTQuNAEHybrrK2Q', 'android'),
(248, 142, 'customer', 'c6Z6TkFrTRet-tAmyIjzl5:APA91bH39VtKk8TXrfS-_uI6MQAi5PIY18gjGYbdsFAJ-qJd-DzPAhtHzmAkOdwqODrZ-JCeQue2pyBZSotNk6USdWDfaYgIxg8NA9V18FyqCn3c-73OGVM', 'android'),
(249, 143, 'customer', 'f1GsPdAMCUAvqWqgAoE0mm:APA91bEGufjdmVrIetHcCw0HFbhlyoFjkMNbIiluoowkAZqqHCc_7noJtyZIMmaJ79GbNOIFseu6uN6jXCIYrY5TeP0rPaVtoe2dA_dqKU2vBFAbSYt_KW8', 'ios'),
(250, 144, 'customer', 'donP2NYCQNqyP1avTneOVF:APA91bHWE8g2Y-8exgBnK1wNPKLUBp6wdBnTuDIbMr_qmywfD7o0P43e8IHHQMFAwgH-cAkdT0KpJmGpD1OAFoCL_kvaWCVLMkg_rqZumZMnTy9bY1A5t1I', 'android'),
(251, 145, 'customer', 'cHB53_CfTECl7rTw1mjhWo:APA91bF5LGeRGZkTk4d1i4KjRc3kvPo74eO9jMc336bJK6PGxMqR6E-LAXLI5OmvMBBTRlKhH2PJykr9N3IEvOGZ3eGvYWAJc-YfuidfgGUUngg4hT0z5OA', 'android'),
(252, 146, 'customer', 'fLoWCC7qQeG5-nblgg7MaK:APA91bFLM8DTi5bl72BRnuqYkODBkflJekWYIPfBpJ4hkNgduNbInmFu5zRuWocmIcSYISNLyXGpJFd4KswSp1dObzFVXPaBlHjeR7MmpC-hX6_EU-Ru638', 'android'),
(253, 147, 'customer', 'eQg2CO8eTqO6F2zOAhbt0X:APA91bG13Zf6bgXSnkECHjZHV-htescAAsrESKf1uVH8B5VRSgPliM9O_glAn2djdVZXehDaTN5v2lQjY5cnfZrxttjL_WXG16XcHMA-4U5GnUMc7RnEwB0', 'android'),
(254, 148, 'customer', 'cNuH4ksER9iqutwV_DOQMC:APA91bFurY5eTKCqO6nmG5eFzMFQyX4ZLoSw6t0vlriO48TfsnEn0efy9t9leesWO5EkZJFai0WYTliBYk5pCpaPkJ81sjtDr14vJ9Tf5Qs_b-qGO1MXuI0', 'android'),
(255, 149, 'customer', 'dk5_Kaq6SUSj5-Hp7VvSDx:APA91bEY_bFGSNUovpyyBmrXQ5-INAcJTtYOKCIhnQqulocVrGopqR3--IOf6TRaozILcqgPV2oD5A-v1MT23OZfxRgpYMTtAMzmpKIlxRqGRrcrPWCfUNE', 'android'),
(256, 150, 'customer', 'fAuriLDrT5yJRGtHuCQC8z:APA91bH0SX8w7V5aPH2jGaT7y6TrXwEgnQG8qxWhyDcb7MZkC9Lw9KPokbbQZbSL5v8hWRIRWGnmDAF_l_fNNgFfc7nGC9j5RJ-VopGzMJpmbyCsclu943k', 'android'),
(257, 151, 'customer', 'cZoJzbECQwqd_AJ0YEmHgT:APA91bF1XbRgsm1iKovIb38YHybXeJ8BAOFhR-Bu-72KcebqyKyaI_eLQGxrcnyhguPYDQbg_zHp75lVM5D3ksvgxqgYudC8OlTRLxPn6zHgjtY_v5ZnsBQ', 'android'),
(258, 152, 'customer', 'cJcan5jFSE2V3EJU94oXre:APA91bEjZ4dK__83eJnOkKVdspFEIT2urO6hQnIznyKdudkupb_VvzJD-tx1u9bfYxs9paRo5jm3jHatRGFxhAeWcDLIqVrxPjSQEPLuUYkIyFUwPcUiYSU', 'android'),
(259, 153, 'customer', 'dP8F23TYStmr1HLB8i4v3O:APA91bF2i9kWLZmgqjNu4SY5OoxXrvtrVTVNJMcmsodSlkJi1Nu4U12QbWho_gJB8u8e2yAaLiDZRM55zT4H-8Wp9_Bhtp_RtSwInSewwuhS5or7oK6RH7A', 'android'),
(260, 0, 'customer', 'emPBZ6MpVUS5g2Us6AVqzx:APA91bHyHSp9mVHN3IyjmPxdZYnO2GnLbULRRWfZyHoo_ShGkejOjPYJncBV5bEHSXgnyhkDDwR9Yar4mL6L7dg5pSLObv2T1nigTIapFYS5Hfuhozhr-5g', 'ios'),
(261, 154, 'customer', 'fgzFdNvsSGaR4GCfByoMiU:APA91bHuR6OfeRJmOXTxi9MrgeN9N6pgN1-Ag8iM4GTXChO-gUUS8pD0HbRN6DjGH-U7rFouX6c1bK1hBLZmzxSA_atNDYQNNqyFD3JcnpMqkvwp4skB1gI', 'android'),
(262, 155, 'customer', 'eyuO0GICukXksKMP1TtnPt:APA91bE1dOOZFw1V3e6eqH2CQ_OkYbjRXWX-1vY-ipnwkc9dzcTLtI6YMPTvkMmBafXSQokjDHN4gBTx9TSGwFUTOibOgpFP6f59MCePbA3ONU3Vy1sA6Kk', 'ios'),
(263, 0, 'customer', 'cNjKrAz5R1OrKGpFDCWAE-:APA91bGfn_WnmFeCArcjSZp7BMDkRIWGGXmStRVc_yV1NZFYBwPWg4YvVbvaBSVFlPIVkYWIFpsUtMpXdYp-IxRikEr_pkJCHCv7bnDHa09C-nISfbczi74', 'android'),
(264, 0, 'customer', 'djSHF-YbCkiVssnubVon9T:APA91bHXaXqL8JD1gC-h8YrfLaA6wtIj0fFp0mouS3p4sA20cYMA9noWr7_oCmCuyRr-4pzbNpmwc_qX9uQkpMMh2nSmGD592k5GwPOod0ZR_BN7DSuelTc', 'ios'),
(265, 156, 'customer', 'cqNIJPFGROKqqzXMJx2D-r:APA91bHnVAHs_LgGQ973ERxtfQTa0R777EzETUSBBnoCL5gXv8JseUzjQvvV5rWIy_lsHIdcXVUMtaoRjuVa8AqXfD7uDmpEnFVKAkHuLe2gPOOi_wFBzTo', 'android'),
(266, 138, 'customer', 'cl6ITM3SRqeqY3Aum5ykBI:APA91bFk8j4DqkcvtC1vkUdIsQB4CBNIrlCYfWgGkCfBSiUpOKE1Eix7htvf1TOXHbBgjlWSeJH213xZYmhmKcchFLZSJuFkh5W87Qnge5km_wFvzraUjxo', 'android'),
(267, 10, 'customer', 'eoqKp-PwTQilCLa5r9Z2Kp:APA91bFmhQNUA7jqQsYx2KZ7HtrshbDAejm6fUFPii9F2gsPJo_a7wa6-1zfq4W7ypnC7HBJQ8iT2ocldw95sDqhJdbnI3ler6nL39-R0fSkvHkqUO8eTEA', 'android'),
(268, 157, 'customer', 'f0g43dtVSemc2zZrY-SKW8:APA91bHbiEQFEY-vbjCP0K4kviRsBNMZr829lDs0gTFHG2DjiRLgB-2JysnzGZaHMAxZ-BzO8kDkCmjlFpQTklAXrJHC4MchrabMPCL05GrflWEmGhMln4c', 'android'),
(269, 158, 'customer', 'cybJfEzxRaiFp6R8wo7DCQ:APA91bGJndaj2_eH2Yneh5HYWS_8e6zb5K1DcgOu6aEbUkkvjgSKLTkJP_zcU-63DY_5OE6dXWDn2f6jR8fOkGcH-Hmf36JlNg5U3DL4AmVe7SQmyaJoy9I', 'android'),
(270, 16, 'customer', 'cl9x8LFORxuc_7yw0eOh-e:APA91bFzYxXyph1RQ466dcM8SIFpC6JCAR3KLyrrMOdoNfi9Dqh8mF9Wvykj_hIy0hbdZVEP4RfDcYZPWdHufSWrSfHzAYdwvURBLPDRuIe2sr_Yhxhf0XE', 'android'),
(271, 10, 'customer', 'dKo6RFeoTJKIrmJ3utpea8:APA91bFtzg6ijiXXOJyMBjT41QN_DQKwwWKEddJF7J8hPNjoduPJ55sWPDQtQLE7Kg5A0UJHS9Ql7CbSjS85k01i7MQe_IaG3WKFm1oOC_cvg76QBBzOEJU', 'android'),
(273, 10, 'customer', 'e0uqyH_eSUqMZ3J9AkyYMt:APA91bFEU33g6jNUDsn0dVP4YDAxambxeV-vkTqvicyCx1QJGKelaU3VmHNot6K3Q8_5KbgG-CaJj4CVqaDRc758Lu9ROSKrtlwyozTKYb7kTbsa5y9emZM', 'android'),
(274, 16, 'customer', 'eK0a-pn_T-u8ifVXeO1ss-:APA91bGogdM11FwXu0ztl8BAH7B8QG6Ut_nePUgIzGswwWi0VlbiuXOxjxc8lNvEMwx47WtIkNDyYHTJoZuaD87N8T5yBVAO1kaA8VZsvwjhJBB5UquWO9o', 'android'),
(275, 10, 'customer', 'cM8r0F3Qq0CMuu4EaYezFW:APA91bGMsFUW-dTWUC2pYl1VbWGlKTvrFCmjMt147sk0M7dbUTmnQCf9qLgWQpkCx5GI3qNsI79mVNiuNPSWsRAYQEAoYKtriH19VipoWF9JRGcMk6MMvC8', 'ios'),
(277, 159, 'customer', 'fA8H7pErT_Wrba36AN0hhm:APA91bFqyy9HQYQUPelY7zmrv74WzQbBCPrgGWn-6tpz_9PdftHgZTlNjzgo5ys4mKY-bG2gXR3R29HHof7h5X-VCBSV_i1SxBoiSvvDtBhO9Lh1AZSzfV0', 'android'),
(278, 10, 'customer', 'f8ilFOyKQ3qCGZeYGyYlg2:APA91bGK8yMwafFXoyU9jODFPkdQMO6dWJ4jlPC02qiu-y3ATXccmZygCFQySjf-mXO5-K8KuZVoyEWaCeef1cYcoj10cDJcUdLnX6WGUdSHHSZZIHYCQfc', 'android'),
(279, 160, 'customer', 'caPN6AtITyKX38-RKwbC0K:APA91bEGF1vowyZZ61tqzvB40vsruWaLz79NgN5WzD2pJ35tQDb-QRqIAd5sxVLvrowKa-HWb3E3smKYvjxuxH8g2eAhjdGIjoX_pcw82t8tFQGeVs1oOQY', 'android'),
(280, 0, 'customer', 'dfzsXHPlHUKTgtezLO1HbZ:APA91bH7y01ZjpQ3iNjOlq-30XXSvruXqGevdORRPz353UZX7fot0w9UZ88Oq0yzV41bXxxOqjZmpHdENg3cLy6A3x3ZQTZNBzfcq0hIH_RrbHWjIfgoenA', 'ios'),
(281, 10, 'customer', 'fFU8Jux8Qt-6CSgEr2_O0D:APA91bGFPJ3cqCQLpEhyPsP8F3bMmcea3znL1szFbCRJr3ym-9yG_tdd5_kKVKDLn8JmM-ZI01QXwJX2Si5Y-MgOXvd8qsY77rBV5oqqfCdhKUdghM8B-nU', 'android'),
(282, 161, 'customer', 'ei4v1hmNTjyxM8L_JDMPJG:APA91bH7zGQCLZ5zlGvc24MgR8hKz3UXJRB_jUIKM-mD2H-GBF1ezUTmxLh4HMqjIrgdH4eTUebKlnWPa0hju0AeLpKR-9uNiFyjJiLFFzzg-C2ZjxUfaes', 'android'),
(283, 10, 'customer', 'e4Ygfs6YS4arp0nifIWmOR:APA91bFEOiubTASHBbxuoPPA809saknFNd-txh_r5QT-2rUqjSjmLcYB6IX0sJhQI9yiGmSOZIA1VaQ0dkxe7rEgq1oRmsnfniB5iHheZNypKoL-82iVBPQ', 'android'),
(284, 162, 'customer', 'etqNmF_IT9yChqoTmDVWWh:APA91bFrxJJ_98kIF9wf4DzDYSVeEnDg1GKVYJ2VrTSrT-DdjMUkD4agcZ6wbNBpyPIud_slaTJzp_edlf-Qq4FptMJSSVWt47DGoP06jJQvV5fr1yPuYSk', 'android'),
(285, 163, 'customer', 'epbMuoF-TIGUmH85SryaJl:APA91bHzFUhKHuBz-1XGo4oooATHWk1t7rR3mLp5eLci04GysmB0t16SC0HNFLlEeVaBZtUtvVacUKhM_-egpu5SJxEEg3wJ8uD8a9qlw0F3i8kfjPMlxsc', 'android'),
(286, 164, 'customer', 'ebnzPTFQRvmzTOTEYyiy3H:APA91bF5rXXwCb5KoX251JiI8hb6UPX0WUByhvcH7l_2wfc4XA3KJo5uk1qZ9DSS-53ZwfGXzpxb0ZUy9dXcYbgLxiuqKAeme2WsV33FdO-SMfoKk9mHWTQ', 'android'),
(287, 165, 'customer', 'dBsYqMlgTe6Mn9NKBds6gh:APA91bEV5DN1t08iOytABktAlmWPWviHIKAk3dg3RUUVGeTOVqIJPkr38tLPdqqeFscGNltmpZpRJ4mge6L1iEcds-2n2ReZ4iMcPrC_-56ZxAOllz5g1WY', 'android'),
(288, 166, 'customer', 'fp3cCyCqQASlG3sMngGCFn:APA91bEK1a5VRrPphdPkYgsx0LCsTiymWhxD-YhzWxvusxdJ6X_JyS7DBklXRY7Ge3rFFk3wXB7jj0zkmz3RY-WIRjlHo7773n6S6IA0Tv_VyJl3MgLZLJE', 'android'),
(289, 10, 'customer', 'f4xtsN2YS4-evzMGDVIYW1:APA91bHa9sllQ12ykFAlOofxurq2FjRkZD_Zf1LCDUKjaBPKQbcPL3KfpVYJ7bMvNDV6gr9wPNNpB0UDnSSlEwkLTw-rZ7bHuYZhN_R5IAhtqq55b8o8BLA', 'android'),
(290, 167, 'customer', 'ffDV3dgaTU6vuhdVVrAMiP:APA91bFusVNceobxTs_rI1bh9pv5x3n5xSPz54Gp9cbQwqVfEY-lC44EmzIJIc3AobuEiZ78O3sSS2R_9YjR-6y2d2vU6YTPsOIMIQTb0jWh8a-2R58QQWo', 'android'),
(291, 168, 'customer', 'fY2ieBv4TIC_TP1thWwbSf:APA91bFY5cRJ15DhEHc01W5BY9tBjgcyT0OkCU8Nk3LLmpWmUMXyWIrJFtoAr444GH1I5TTxMlmkR2qpavyaGSImiSSqzYbfdJ1Cc3BFoVFSshXXzOqnMqA', 'android'),
(292, 169, 'customer', 'dssWFx5VQcGTv6XXIXzD3a:APA91bGDIJ-NzmzAMGdgFDFVrtL19q5bBwEJI_gftx15V7JtEbOc87IQkgaP7wDUmlFXglUjgQe6h8S_Ixd8Xt8RObU1WLreKzu19pjU2TCzoOKqlI5EhxE', 'android'),
(293, 0, 'customer', 'fgataP2tT0aVePlj5yBwYm:APA91bEzPY-dQFDkJzsSmhGEYUGexFQUxMQd7vGFuOlHK0BqKHMT2tz4cAnDMeIKFJNfAOlq4z_mKZwEJ2knCOAwZvL3I8o2DpYbTud1xGiiUjtjABjGC50', 'android'),
(294, 170, 'customer', 'cta1rm4nShiPMHdZsN30_l:APA91bGynB7T-ehevjgWYsuUlnt3ULUEpEI1r6DhEN1xmCauzspz_F5iPIJJiAKisso3osFBHPu3716m-LSCRhngJN9DBTVeOkDki1raDpkWvTz_LO1fYsU', 'android'),
(295, 171, 'customer', 'c2HDOoWiQh-I8p7aAGxpid:APA91bF9B7VAkn5bmNOS0DukJuhf7TAOnvL9v-YtrTw5BTPlWm7LcEb6_BfOHISjQF3oNA99N3RU30vM8K2ZfzzkjzSWdzcOsXLfSX3R98bIed1o3ePTKtE', 'android');
INSERT INTO `bl_user_tokens` (`id`, `user_id`, `type`, `fcm_token`, `platform`) VALUES
(296, 172, 'customer', 'drJt78-XTUuYy5HtnZ9qDu:APA91bGIppCrhObD3VfW2QN_yVWESxazC4trJN1CZXJWLOH3vPvWB3tGZQyf8Tps6jC6vHk9qXYeBMSXBSVEw9QLf_g0cV180t8u-Y5IWJZMfaNPclUCleM', 'android'),
(297, 173, 'customer', 'e93ZyM40R7KM9x8QJs-YrX:APA91bGbCLfHouZxOF0kslummWJlvsTWhvXCffvETo1A53Mz8oV_upeWw8lwgiHhSuu7bsnps82q7ix2ilrSLkEuIXc1yVkxamTgtF029NKLO3iH4p34kzE', 'android'),
(298, 174, 'customer', 'cdp0V3x-T5quJs_HGRWEaG:APA91bFPycQHEofmJ-COX392K4zLIT31nmny_Ndf8DDkTHjDkKppuRTvZ-8Y-psU5KyQvi-z-_7E7RZgKQEsp2slnnUaxeRweCoDai2YEvMf8V_t4uR427c', 'android'),
(299, 175, 'customer', 'fRp5VwnbRD-sbe-M2xQl4j:APA91bGe4FafcWclyLPlPZLydZX3buTf1lArpqoG1tAGGcS15mAjCDLxaTflHjc11UMfW6afRUJu4Pstyq99WwabNG1lffuzaC5YHdTCLKOT7Qyx6XoetOo', 'android'),
(300, 10, 'customer', 'c1nh6GjvEkBxizM2qpcD0H:APA91bFLS6M3PxnDARSZ4LD1mEnN0Crxm_e1-a48gT5PCo6iBLi4OIQ-kWRVNkz4HwKg8uDwvYNsN-Bv465JTvIzjhoSsNGkNmPtOlPhek7TuesD1I46XdQ', 'ios'),
(301, 10, 'customer', 'e3RSWab-00BtlymcaXtibF:APA91bFfhoBCAcnQFOD5VtTCGv-o55CDn5XvdT8xq9JJiAlT2c5_O4_LCDSnrWVHxpzEy2_R85w30pzKnbAj2-h5nKc2opz_YBNT0eh6ozM-tV8QyRwCWiU', 'ios'),
(303, 113, 'customer', 'dwv2u6XoTcukFnwKVOlTbM:APA91bFbX7pLbtqdCOFN1-e00je1vXqyFgfKyNXoUwnTi8gmE4xr1ZJghlDpjqJahZ3zpiMXdTDwub8SezJuPTLX0aT-Dylr3ynbklSDPf974_74Fh0cbc8', 'android'),
(304, 10, 'customer', 'eSZtH33jRlupNFuIoZOWYq:APA91bGe-8v5X66QygYplTGp5tdRIewu_-cydA4MggXQec9o2BWLku3q7CHfQ2Ce-v3AeYD85H_Jlln4J8coo9hXwqJywoGVCefeyvkbWZn9uB6kz9t0O6c', 'android'),
(305, 10, 'customer', 'fluONZ-VR-GjX60o339BFP:APA91bFjAYlR93g4zZ47gsoo1Ci7LR31KKtD-Huz9igzl4lHy9vIFDhjOhqApkH4kFKrWeNxzLMyNsIiVC8QfV_HjBXSlof1lGEIXk1oWjljXdU7xTMyhFQ', 'android'),
(306, 10, 'customer', 'cET8HOSsTkONjTc3hps7EO:APA91bEGOyrU8uivt9mZ3i9I4ZIsFdDw44Q7m6Tjxixr7Viiffiz9_r9L6lsk68oKwPyDbww9St8eUeVnHkGn6bU7ZvC0lWnrxFw1g6-FN4ZxcMAU-_PcX8', 'android'),
(307, 10, 'customer', 'eZZZydIhSt67qjSC1v9q_y:APA91bGNV8FNp4tRN3qpkXMczeoDMkEEfGmWsj_itteg3Y0FSuLDhGb7HYJTjgbnRdkgGHHCHdkDlsXMqI1Fr_yT3todDhQ0D9QVJJ5i0ZnNcRuan_CRw6w', 'android'),
(308, 20, 'customer', 'f_vC0QGVA0htmN0dI_4cpj:APA91bGxf8uSbYIDFMKojP5bvTQRVUI_C4LhGkvk0CpA-5tG2Keu8YLAyFDBEJ2a63VGekoyxecA1XjggwyYuYDsNoDdtnbSdVCgvJqdGXQCIVRZ2kL8tGA', 'ios'),
(309, 10, 'customer', 'etrnfFrwR4-I9wud8mBDgH:APA91bHmt0MRqb4oqWUQNT5VjPnIAIt1rZgZv97zqCR5yQSTHlUfEs-AM0YPprvMEfAY3q5MbhPrbZoHLNv6HQHmC5oC2PybooYx0ybGb0s9Yfqi8e7BxsM', 'android'),
(310, 10, 'customer', 'f2v1t641Tu-TQlbETshdqM:APA91bErPd7lP5voT0jEDyifJ1RRb46L1PJixmIv-VZ0TQyOcf_fzfOHh82KjgvDOuVNkPR68KzvQKajFYfhYXUU6mai-Oz481CNloV3g4yxdEh5bfudfHk', 'android'),
(311, 10, 'customer', 'dG4Zy7QdRzu_pJNwcNQBFk:APA91bGZHcefzdh3doVo2EXiRyUqQ83s_mPOqpgjn37HPhvzEgRQkE9p1ofrGAV9a-D-HnZJyRBUQ9rFosOE5VlpEnSM0iqPQ_JFAkhpz3J5gJ4ze66pRzE', 'android'),
(312, 10, 'customer', 'dWeH1Wk-Tl2K-PBF2EVQ9z:APA91bE9rLgkD60vaDMspqgZgrDvdF0h1HtNUMOrhZM7aduupn0AZtEm8rh9woFxRbwV-pORi8E4FTOect5R--MRJfhp8eJ9obH2FuKeus6DvMOpHTWdJzs', 'android'),
(313, 10, 'customer', 'elSAgS6hQ6yOs2r0XBAKIf:APA91bG9qBPMusc7WPg0htGBB8wG42G0TsMRdMUyIa5GhWvPymELDYJD9h85KKMCRxcdqAPekxjfYB59aKzt4fCK_xyvWE0fVMHrghVxTkK6Y7l2LX1zHnY', 'android'),
(314, 176, 'customer', 'd7KP5a2IQsWnEFZZYDLYOk:APA91bFSFS6cIJGWTOq6jfDB8RzNfCK75G9Dvl8lXXrAHafEAD3BAl0X9wK67FtyWTkN0dbHSJ5rafrbBlhBMLhv2PN8kCNYUzB4uWLb-DlYV_aUfF5AdUg', 'android'),
(315, 10, 'customer', 'fItqL1w4SFWHh9cfTkPTf-:APA91bHBQci91sbP59MTzb6qzPskVaRzjmA46oYJLMjQn5wLQqbmn6hxAz2N8_-a7Bp-KFShukIQ4DFVJIf7_GiYgptDW6wZ3Y4OKodB3zVxjJ1kKjYrclE', 'android'),
(316, 16, 'customer', 'fUwKO5VPTLqwhE36ajyOrj:APA91bG4mV91dlArqDM3E54NRgA_lRxSQ2MEO41AgB-4Q5paFUh05sihA9y9zHVDRzKc6qxSRGWJeiOOMlMl5Xd5S4fwO4LJhtIkZZSE25GeOEERQpkAp0Q', 'android'),
(317, 177, 'customer', 'fvUtnDQmS_SkhIEMiMol5J:APA91bEi4kHGtECZ7gcPOoi47EirfPuK5TOgMMjnHhv_ZeFhKal6E7kVMZryAOzr9qyJWOQownhdWLzc_mluFFNJ_gBa7OFHVt2GWzXgVE3fX-Ts-r0M_NQ', 'android'),
(318, 178, 'customer', 'f3oQpfPGRL-rjmWH4vgLiO:APA91bGXJVkLF9i3ouCUc_ZYaM1QfgBFCtny7jjSDCzeJd4OsnpmVMVoDQ8zO_Zp-OzGd-8wKELgXROWYHiaQkvCIQnFxayQq2O4j9ju38l3EdkMfznLP7w', 'android'),
(319, 0, 'customer', 'dmF-47sAR6-loPAMqbFbcA:APA91bGgvTo2KykIvnJlN0MQNQbaaNhOo4EMAlriZLCrsaT-oe_KnYBbrEXl3C_m6PSgNXqZR2rwPfOpcC_-MDCDJMAirVEFS2XZMtaaPdJ5p-GZMy7xQ_k', 'android'),
(320, 179, 'customer', 'dpZRDFpORxqnr7nGoJW5dY:APA91bHzmuXkcb9ubMBgTeNEH0o1GAfEXLLkCYKAahIDtNynJ8793__b1nSANNykhbt-TYdb6P51iNx2SzyxaE6SSkF5GWcG3GG3rIukv8QTHW2c43xAlGs', 'android'),
(321, 180, 'customer', 'cU0I9eB0T_mfXzFwX-SVzZ:APA91bE0z8H9Vb_PC2QjLi2KZBMxiA10ZrcjuWdG1Hr7wxVMcMUtD5woLxYadMBT5WyX2VM2J6gGwMstG_PuEHJK4JfFZi0F8BsI_Sdf8lAl6DK1bHz9VoA', 'android');

-- --------------------------------------------------------

--
-- Table structure for table `bl_wallet_point_transactions`
--

CREATE TABLE `bl_wallet_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `points` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `message` varchar(191) DEFAULT NULL,
  `user_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_wallet_point_transactions`
--

INSERT INTO `bl_wallet_point_transactions` (`id`, `order_id`, `user_id`, `type`, `points`, `status`, `created_at`, `updated_at`, `message`, `user_by`) VALUES
(1, NULL, 11, 'credit', 50, 1, '2025-11-03 19:09:43', '2025-11-03 19:09:43', 'Referral bonus credited', '37'),
(2, NULL, 37, 'credit', 10, 1, '2025-11-03 19:09:43', '2025-11-03 19:09:43', 'Referral bonus credited', ''),
(3, 3, 37, 'credit', 25, 1, '2025-11-03 19:12:57', '2025-11-03 19:12:57', NULL, NULL),
(4, 3, 37, 'debit', -10, 1, '2025-11-03 19:12:57', '2025-11-03 19:12:57', NULL, NULL),
(5, NULL, 11, 'credit', 50, 1, '2025-11-03 21:53:15', '2025-11-03 21:53:15', 'Referral bonus credited', '38'),
(6, NULL, 38, 'credit', 10, 1, '2025-11-03 21:53:15', '2025-11-03 21:53:15', 'Referral bonus credited', ''),
(7, 4, 11, 'credit', 15, 1, '2025-11-04 08:55:26', '2025-11-04 08:55:26', NULL, NULL),
(8, 5, 13, 'credit', 10, 1, '2025-11-04 09:08:33', '2025-11-04 09:08:33', NULL, NULL),
(9, 6, 36, 'credit', 15, 1, '2025-11-04 10:23:22', '2025-11-04 10:23:22', NULL, NULL),
(10, 7, 36, 'credit', 15, 1, '2025-11-04 10:23:48', '2025-11-04 10:23:48', NULL, NULL),
(11, 8, 40, 'credit', 5, 1, '2025-11-04 10:35:49', '2025-11-04 10:35:49', NULL, NULL),
(12, 9, 40, 'credit', 5, 1, '2025-11-04 10:49:41', '2025-11-04 10:49:41', NULL, NULL),
(13, NULL, 11, 'credit', 50, 1, '2025-11-04 11:09:38', '2025-11-04 11:09:38', 'Referral bonus credited', '41'),
(14, NULL, 41, 'credit', 10, 1, '2025-11-04 11:09:38', '2025-11-04 11:09:38', 'Referral bonus credited', ''),
(15, 10, 41, 'credit', 25, 1, '2025-11-04 11:17:29', '2025-11-04 11:17:29', NULL, NULL),
(16, 10, 41, 'debit', -10, 1, '2025-11-04 11:17:29', '2025-11-04 11:17:29', NULL, NULL),
(17, 11, 37, 'credit', 15, 1, '2025-11-04 11:33:43', '2025-11-04 11:33:43', NULL, NULL),
(18, 11, 37, 'debit', -25, 1, '2025-11-04 11:33:43', '2025-11-04 11:33:43', NULL, NULL),
(19, 12, 10, 'credit', 10, 1, '2025-11-04 16:04:24', '2025-11-04 16:04:24', NULL, NULL),
(20, 13, 10, 'credit', 5, 1, '2025-11-04 17:32:16', '2025-11-04 17:32:16', NULL, NULL),
(21, 14, 10, 'credit', 5, 1, '2025-11-04 17:40:09', '2025-11-04 17:40:09', NULL, NULL),
(22, 14, 10, 'debit', -10, 1, '2025-11-04 17:40:09', '2025-11-04 17:40:09', NULL, NULL),
(23, 15, 10, 'credit', 5, 1, '2025-11-04 17:40:23', '2025-11-04 17:40:23', NULL, NULL),
(24, 15, 10, 'debit', -10, 1, '2025-11-04 17:40:23', '2025-11-04 17:40:23', NULL, NULL),
(25, NULL, 10, 'credit', 50, 1, '2025-11-05 10:35:24', '2025-11-05 10:35:24', 'Referral bonus credited', '44'),
(26, NULL, 44, 'credit', 10, 1, '2025-11-05 10:35:24', '2025-11-05 10:35:24', 'Referral bonus credited', ''),
(27, 16, 13, 'credit', 10, 1, '2025-11-06 10:30:35', '2025-11-06 10:30:35', NULL, NULL),
(28, 17, 10, 'credit', 5, 1, '2025-11-06 10:59:28', '2025-11-06 10:59:28', NULL, NULL),
(29, 18, 44, 'credit', 10, 1, '2025-11-06 11:01:44', '2025-11-06 11:01:44', NULL, NULL),
(30, 19, 24, 'credit', 5, 1, '2025-11-06 14:37:00', '2025-11-06 14:37:00', NULL, NULL),
(31, 20, 46, 'credit', 5, 1, '2025-11-06 15:39:47', '2025-11-06 15:39:47', NULL, NULL),
(32, 21, 11, 'credit', 5, 1, '2025-11-06 16:53:34', '2025-11-06 16:53:34', NULL, NULL),
(33, 22, 45, 'credit', 5, 1, '2025-11-06 17:21:40', '2025-11-06 17:21:40', NULL, NULL),
(34, 23, 10, 'credit', 15, 1, '2025-11-06 18:03:39', '2025-11-06 18:03:39', NULL, NULL),
(35, 24, 10, 'credit', 5, 1, '2025-11-06 18:08:09', '2025-11-06 18:08:09', NULL, NULL),
(36, 25, 47, 'credit', 5, 1, '2025-11-06 18:20:14', '2025-11-06 18:20:14', NULL, NULL),
(37, 26, 10, 'credit', 5, 1, '2025-11-06 18:29:02', '2025-11-06 18:29:02', NULL, NULL),
(38, 26, 10, 'debit', -10, 1, '2025-11-06 18:29:02', '2025-11-06 18:29:02', NULL, NULL),
(39, 27, 10, 'credit', 5, 1, '2025-11-06 18:39:09', '2025-11-06 18:39:09', NULL, NULL),
(40, 27, 10, 'debit', -10, 1, '2025-11-06 18:39:09', '2025-11-06 18:39:09', NULL, NULL),
(41, 28, 10, 'credit', 5, 1, '2025-11-06 18:39:47', '2025-11-06 18:39:47', NULL, NULL),
(42, 28, 10, 'debit', -10, 1, '2025-11-06 18:39:47', '2025-11-06 18:39:47', NULL, NULL),
(43, 29, 10, 'credit', 5, 1, '2025-11-06 18:43:28', '2025-11-06 18:43:28', NULL, NULL),
(44, 29, 10, 'debit', -10, 1, '2025-11-06 18:43:28', '2025-11-06 18:43:28', NULL, NULL),
(45, 30, 10, 'credit', 5, 1, '2025-11-06 18:45:15', '2025-11-06 18:45:15', NULL, NULL),
(46, 30, 10, 'debit', -10, 1, '2025-11-06 18:45:15', '2025-11-06 18:45:15', NULL, NULL),
(47, 31, 10, 'credit', 5, 1, '2025-11-06 18:46:00', '2025-11-06 18:46:00', NULL, NULL),
(48, 31, 10, 'debit', -10, 1, '2025-11-06 18:46:00', '2025-11-06 18:46:00', NULL, NULL),
(49, 32, 10, 'credit', 5, 1, '2025-11-06 18:46:29', '2025-11-06 18:46:29', NULL, NULL),
(50, 32, 10, 'debit', -10, 1, '2025-11-06 18:46:29', '2025-11-06 18:46:29', NULL, NULL),
(51, NULL, 11, 'credit', 50, 1, '2025-11-06 18:58:14', '2025-11-06 18:58:14', 'Referral bonus credited', '49'),
(52, NULL, 49, 'credit', 10, 1, '2025-11-06 18:58:14', '2025-11-06 18:58:14', 'Referral bonus credited', ''),
(53, 33, 49, 'credit', 5, 1, '2025-11-06 19:01:19', '2025-11-06 19:01:19', NULL, NULL),
(54, 34, 24, 'credit', 5, 1, '2025-11-07 09:42:05', '2025-11-07 09:42:05', NULL, NULL),
(55, 35, 10, 'credit', 20, 1, '2025-11-07 11:18:19', '2025-11-07 11:18:19', NULL, NULL),
(56, 36, 10, 'credit', 15, 1, '2025-11-07 11:19:14', '2025-11-07 11:19:14', NULL, NULL),
(57, 37, 10, 'credit', 5, 1, '2025-11-07 12:01:33', '2025-11-07 12:01:33', NULL, NULL),
(58, 38, 16, 'credit', 5, 1, '2025-11-07 12:30:49', '2025-11-07 12:30:49', NULL, NULL),
(59, 39, 10, 'credit', 5, 1, '2025-11-07 12:38:19', '2025-11-07 12:38:19', NULL, NULL),
(60, 40, 10, 'credit', 10, 1, '2025-11-07 12:42:43', '2025-11-07 12:42:43', NULL, NULL),
(61, 41, 10, 'credit', 5, 1, '2025-11-07 12:45:35', '2025-11-07 12:45:35', NULL, NULL),
(62, 42, 10, 'credit', 5, 1, '2025-11-07 12:49:22', '2025-11-07 12:49:22', NULL, NULL),
(63, 43, 45, 'credit', 10, 1, '2025-11-07 14:50:01', '2025-11-07 14:50:01', NULL, NULL),
(64, 44, 52, 'credit', 25, 1, '2025-11-07 16:48:38', '2025-11-07 16:48:38', NULL, NULL),
(65, 45, 40, 'credit', 25, 1, '2025-11-07 20:28:01', '2025-11-07 20:28:01', NULL, NULL),
(66, NULL, 12, 'credit', 50, 1, '2025-11-08 09:48:29', '2025-11-08 09:48:29', 'Referral bonus credited', '53'),
(67, NULL, 53, 'credit', 10, 1, '2025-11-08 09:48:29', '2025-11-08 09:48:29', 'Referral bonus credited', ''),
(68, NULL, 12, 'credit', 50, 1, '2025-11-08 12:48:44', '2025-11-08 12:48:44', 'Referral bonus credited', '54'),
(69, NULL, 54, 'credit', 10, 1, '2025-11-08 12:48:44', '2025-11-08 12:48:44', 'Referral bonus credited', ''),
(70, NULL, 12, 'credit', 50, 1, '2025-11-08 12:53:31', '2025-11-08 12:53:31', 'Referral bonus credited', '55'),
(71, NULL, 55, 'credit', 10, 1, '2025-11-08 12:53:31', '2025-11-08 12:53:31', 'Referral bonus credited', ''),
(72, NULL, 12, 'credit', 50, 1, '2025-11-08 13:03:00', '2025-11-08 13:03:00', 'Referral bonus credited', '56'),
(73, NULL, 56, 'credit', 10, 1, '2025-11-08 13:03:00', '2025-11-08 13:03:00', 'Referral bonus credited', ''),
(74, NULL, 12, 'credit', 50, 1, '2025-11-08 13:22:19', '2025-11-08 13:22:19', 'Referral bonus credited', '57'),
(75, NULL, 57, 'credit', 10, 1, '2025-11-08 13:22:19', '2025-11-08 13:22:19', 'Referral bonus credited', ''),
(76, NULL, 12, 'credit', 50, 1, '2025-11-08 13:30:34', '2025-11-08 13:30:34', 'Referral bonus credited', '58'),
(77, NULL, 58, 'credit', 10, 1, '2025-11-08 13:30:34', '2025-11-08 13:30:34', 'Referral bonus credited', ''),
(78, NULL, 12, 'credit', 50, 1, '2025-11-08 13:33:15', '2025-11-08 13:33:15', 'Referral bonus credited', '59'),
(79, NULL, 59, 'credit', 10, 1, '2025-11-08 13:33:15', '2025-11-08 13:33:15', 'Referral bonus credited', ''),
(80, NULL, 12, 'credit', 50, 1, '2025-11-08 13:39:02', '2025-11-08 13:39:02', 'Referral bonus credited', '60'),
(81, NULL, 60, 'credit', 10, 1, '2025-11-08 13:39:02', '2025-11-08 13:39:02', 'Referral bonus credited', ''),
(82, NULL, 12, 'credit', 50, 1, '2025-11-08 13:44:03', '2025-11-08 13:44:03', 'Referral bonus credited', '61'),
(83, NULL, 61, 'credit', 10, 1, '2025-11-08 13:44:03', '2025-11-08 13:44:03', 'Referral bonus credited', ''),
(84, NULL, 12, 'credit', 50, 1, '2025-11-08 13:51:31', '2025-11-08 13:51:31', 'Referral bonus credited', '62'),
(85, NULL, 62, 'credit', 10, 1, '2025-11-08 13:51:31', '2025-11-08 13:51:31', 'Referral bonus credited', ''),
(86, NULL, 12, 'credit', 50, 1, '2025-11-08 13:55:20', '2025-11-08 13:55:20', 'Referral bonus credited', '63'),
(87, NULL, 63, 'credit', 10, 1, '2025-11-08 13:55:20', '2025-11-08 13:55:20', 'Referral bonus credited', ''),
(88, NULL, 12, 'credit', 150, 1, '2025-11-08 14:23:45', '2025-11-08 14:23:45', 'Referral bonus credited', '63'),
(89, NULL, 63, 'credit', 499, 1, '2025-11-08 14:23:45', '2025-11-08 14:23:45', 'Eco Gold plan rewards credited', NULL),
(90, NULL, 12, 'credit', 50, 1, '2025-11-08 14:26:20', '2025-11-08 14:26:20', 'Referral bonus credited', '64'),
(91, NULL, 64, 'credit', 10, 1, '2025-11-08 14:26:20', '2025-11-08 14:26:20', 'Referral bonus credited', ''),
(92, NULL, 12, 'credit', 150, 1, '2025-11-08 14:27:05', '2025-11-08 14:27:05', 'Referral bonus credited', '64'),
(93, NULL, 64, 'credit', 499, 1, '2025-11-08 14:27:06', '2025-11-08 14:27:06', 'Eco Gold plan rewards credited', NULL),
(94, 46, 45, 'credit', 25, 1, '2025-11-08 14:46:23', '2025-11-08 14:46:23', NULL, NULL),
(95, 47, 16, 'credit', 5, 1, '2025-11-08 15:31:21', '2025-11-08 15:31:21', NULL, NULL),
(96, 48, 10, 'credit', 5, 1, '2025-11-08 15:35:32', '2025-11-08 15:35:32', NULL, NULL),
(97, 49, 44, 'credit', 5, 1, '2025-11-08 16:54:59', '2025-11-08 16:54:59', NULL, NULL),
(98, 50, 44, 'credit', 5, 1, '2025-11-08 16:57:03', '2025-11-08 16:57:03', NULL, NULL),
(99, 51, 44, 'credit', 5, 1, '2025-11-08 16:58:55', '2025-11-08 16:58:55', NULL, NULL),
(100, NULL, 12, 'credit', 50, 1, '2025-11-08 21:48:46', '2025-11-08 21:48:46', 'Referral bonus credited', '65'),
(101, NULL, 65, 'credit', 10, 1, '2025-11-08 21:48:46', '2025-11-08 21:48:46', 'Referral bonus credited', ''),
(102, 52, 16, 'credit', 5, 1, '2025-11-09 15:02:24', '2025-11-09 15:02:24', NULL, NULL),
(103, 52, 16, 'debit', -10, 1, '2025-11-09 15:02:24', '2025-11-09 15:02:24', NULL, NULL),
(104, NULL, 16, 'credit', 50, 1, '2025-11-10 11:07:56', '2025-11-10 11:07:56', 'Referral bonus credited', '66'),
(105, NULL, 66, 'credit', 10, 1, '2025-11-10 11:07:56', '2025-11-10 11:07:56', 'Referral bonus credited', ''),
(106, NULL, 16, 'credit', 50, 1, '2025-11-10 11:45:28', '2025-11-10 11:45:28', 'Referral bonus credited', '67'),
(107, NULL, 67, 'credit', 10, 1, '2025-11-10 11:45:28', '2025-11-10 11:45:28', 'Referral bonus credited', ''),
(108, NULL, 16, 'credit', 50, 1, '2025-11-10 11:51:22', '2025-11-10 11:51:22', 'Referral bonus credited', '68'),
(109, NULL, 68, 'credit', 10, 1, '2025-11-10 11:51:22', '2025-11-10 11:51:22', 'Referral bonus credited', ''),
(110, NULL, 16, 'credit', 50, 1, '2025-11-10 11:53:29', '2025-11-10 11:53:29', 'Referral bonus credited', '69'),
(111, NULL, 69, 'credit', 10, 1, '2025-11-10 11:53:29', '2025-11-10 11:53:29', 'Referral bonus credited', ''),
(112, NULL, 16, 'credit', 50, 1, '2025-11-10 11:56:07', '2025-11-10 11:56:07', 'Referral bonus credited', '70'),
(113, NULL, 70, 'credit', 10, 1, '2025-11-10 11:56:07', '2025-11-10 11:56:07', 'Referral bonus credited', ''),
(114, NULL, 16, 'credit', 50, 1, '2025-11-10 14:57:14', '2025-11-10 14:57:14', 'Referral bonus credited', '72'),
(115, NULL, 72, 'credit', 10, 1, '2025-11-10 14:57:14', '2025-11-10 14:57:14', 'Referral bonus credited', ''),
(116, 53, 38, 'credit', 5, 1, '2025-11-10 18:18:33', '2025-11-10 18:18:33', NULL, NULL),
(117, NULL, 16, 'credit', 50, 1, '2025-11-11 10:26:18', '2025-11-11 10:26:18', 'Referral bonus credited', '73'),
(118, NULL, 73, 'credit', 10, 1, '2025-11-11 10:26:18', '2025-11-11 10:26:18', 'Referral bonus credited', ''),
(119, NULL, 16, 'credit', 50, 1, '2025-11-11 10:33:17', '2025-11-11 10:33:17', 'Referral bonus credited', '74'),
(120, NULL, 74, 'credit', 10, 1, '2025-11-11 10:33:17', '2025-11-11 10:33:17', 'Referral bonus credited', ''),
(121, NULL, 10, 'credit', 50, 1, '2025-11-11 10:50:34', '2025-11-11 10:50:34', 'Referral bonus credited', '75'),
(122, NULL, 75, 'credit', 10, 1, '2025-11-11 10:50:34', '2025-11-11 10:50:34', 'Referral bonus credited', ''),
(123, NULL, 16, 'credit', 50, 1, '2025-11-11 11:29:14', '2025-11-11 11:29:14', 'Referral bonus credited', '76'),
(124, NULL, 76, 'credit', 50, 1, '2025-11-11 11:29:14', '2025-11-11 11:29:14', 'Referral bonus credited', ''),
(125, NULL, 16, 'credit', 150, 1, '2025-11-11 11:29:51', '2025-11-11 11:29:51', 'Referral bonus credited', '76'),
(126, NULL, 76, 'credit', 100, 1, '2025-11-11 11:29:51', '2025-11-11 11:29:51', 'Eco Gold plan rewards credited', NULL),
(127, NULL, 16, 'credit', 50, 1, '2025-11-11 11:42:43', '2025-11-11 11:42:43', 'Referral bonus credited', '77'),
(128, NULL, 77, 'credit', 50, 1, '2025-11-11 11:42:43', '2025-11-11 11:42:43', 'Referral bonus credited', ''),
(129, NULL, 16, 'credit', 150, 1, '2025-11-11 11:43:15', '2025-11-11 11:43:15', 'Referral bonus credited', '77'),
(130, NULL, 77, 'credit', 150, 1, '2025-11-11 11:43:15', '2025-11-11 11:43:15', 'Eco Gold plan rewards credited', NULL),
(131, NULL, 16, 'credit', 50, 1, '2025-11-11 11:58:09', '2025-11-11 11:58:09', 'Referral bonus credited', '78'),
(132, NULL, 78, 'credit', 50, 1, '2025-11-11 11:58:09', '2025-11-11 11:58:09', 'Referral bonus credited', ''),
(133, NULL, 16, 'credit', 150, 1, '2025-11-11 11:58:42', '2025-11-11 11:58:42', 'Referral bonus credited', '78'),
(134, NULL, 78, 'credit', 499, 1, '2025-11-11 11:58:43', '2025-11-11 11:58:43', 'Eco Gold plan rewards credited', NULL),
(135, NULL, 16, 'credit', 50, 1, '2025-11-11 12:46:03', '2025-11-11 12:46:03', 'Referral bonus credited', '80'),
(136, NULL, 80, 'credit', 50, 1, '2025-11-11 12:46:03', '2025-11-11 12:46:03', 'Referral bonus credited', ''),
(137, 54, 80, 'credit', 10, 1, '2025-11-11 12:49:37', '2025-11-11 12:49:37', NULL, NULL),
(138, 55, 16, 'credit', 5, 1, '2025-11-12 08:02:32', '2025-11-12 08:02:32', NULL, NULL),
(139, 56, 11, 'credit', 20, 1, '2025-11-13 04:56:01', '2025-11-13 04:56:01', NULL, NULL),
(140, 56, 11, 'debit', -40, 1, '2025-11-13 04:56:01', '2025-11-13 04:56:01', NULL, NULL),
(141, 57, 10, 'credit', 5, 1, '2025-11-13 15:23:33', '2025-11-13 15:23:33', NULL, NULL),
(142, 58, 10, 'credit', 5, 1, '2025-11-13 16:23:27', '2025-11-13 16:23:27', NULL, NULL),
(143, 59, 10, 'credit', 5, 1, '2025-11-13 16:46:33', '2025-11-13 16:46:33', NULL, NULL),
(144, 60, 10, 'credit', 10, 1, '2025-11-13 17:05:26', '2025-11-13 17:05:26', NULL, NULL),
(145, NULL, 16, 'credit', 50, 1, '2025-11-14 15:17:25', '2025-11-14 15:17:25', 'Referral bonus credited', '83'),
(146, NULL, 83, 'credit', 50, 1, '2025-11-14 15:17:25', '2025-11-14 15:17:25', 'Referral bonus credited', ''),
(147, 61, 83, 'credit', 5, 1, '2025-11-14 15:24:27', '2025-11-14 15:24:27', NULL, NULL),
(148, 61, 83, 'debit', -10, 1, '2025-11-14 15:24:27', '2025-11-14 15:24:27', NULL, NULL),
(149, NULL, 16, 'credit', 50, 1, '2025-11-14 21:07:29', '2025-11-14 21:07:29', 'Referral bonus credited', '84'),
(150, NULL, 84, 'credit', 50, 1, '2025-11-14 21:07:29', '2025-11-14 21:07:29', 'Referral bonus credited', ''),
(151, 62, 16, 'credit', 5, 1, '2025-11-15 15:49:20', '2025-11-15 15:49:20', NULL, NULL),
(152, 62, 16, 'debit', -10, 1, '2025-11-15 15:49:20', '2025-11-15 15:49:20', NULL, NULL),
(153, 63, 16, 'credit', 5, 1, '2025-11-15 17:06:23', '2025-11-15 17:06:23', NULL, NULL),
(154, 64, 16, 'credit', 5, 1, '2025-11-15 17:27:22', '2025-11-15 17:27:22', NULL, NULL),
(155, 65, 16, 'credit', 5, 1, '2025-11-15 17:48:35', '2025-11-15 17:48:35', NULL, NULL),
(156, NULL, 11, 'credit', 0, 1, '2025-11-15 20:12:57', '2025-11-15 20:12:57', 'Referral bonus credited', '16'),
(157, NULL, 16, 'credit', 1000, 1, '2025-11-15 20:12:58', '2025-11-15 20:12:58', 'Eco Gold plan rewards credited', NULL),
(158, NULL, 16, 'credit', 0, 1, '2025-11-15 21:03:42', '2025-11-15 21:03:42', 'Referral bonus credited', '85'),
(159, NULL, 85, 'credit', 0, 1, '2025-11-15 21:03:42', '2025-11-15 21:03:42', 'Referral bonus credited', ''),
(160, NULL, 16, 'credit', 0, 1, '2025-11-15 21:06:16', '2025-11-15 21:06:16', 'Referral bonus credited', '85'),
(161, NULL, 85, 'credit', 0, 1, '2025-11-15 21:06:18', '2025-11-15 21:06:18', 'Eco Gold plan rewards credited', NULL),
(162, 66, 16, 'credit', 5, 1, '2025-11-16 10:40:17', '2025-11-16 10:40:17', NULL, NULL),
(163, 67, 16, 'credit', 5, 1, '2025-11-16 10:43:36', '2025-11-16 10:43:36', NULL, NULL),
(164, 68, 16, 'credit', 5, 1, '2025-11-16 10:44:46', '2025-11-16 10:44:46', NULL, NULL),
(165, 69, 16, 'credit', 5, 1, '2025-11-16 10:55:43', '2025-11-16 10:55:43', NULL, NULL),
(166, 70, 16, 'credit', 5, 1, '2025-11-16 11:13:18', '2025-11-16 11:13:18', NULL, NULL),
(167, 71, 16, 'credit', 5, 1, '2025-11-16 11:32:05', '2025-11-16 11:32:05', NULL, NULL),
(168, 72, 16, 'credit', 5, 1, '2025-11-17 11:08:34', '2025-11-17 11:08:34', NULL, NULL),
(169, 73, 16, 'credit', 5, 1, '2025-11-17 11:18:46', '2025-11-17 11:18:46', NULL, NULL),
(170, 74, 78, 'credit', 5, 1, '2025-11-17 11:34:22', '2025-11-17 11:34:22', NULL, NULL),
(171, 75, 16, 'credit', 5, 1, '2025-11-17 11:36:48', '2025-11-17 11:36:48', NULL, NULL),
(172, 76, 16, 'credit', 5, 1, '2025-11-17 12:39:58', '2025-11-17 12:39:58', NULL, NULL),
(173, 77, 78, 'credit', 5, 1, '2025-11-17 12:40:00', '2025-11-17 12:40:00', NULL, NULL),
(174, NULL, 16, 'credit', 0, 1, '2025-11-19 18:21:37', '2025-11-19 18:21:37', 'Referral bonus credited', '87'),
(175, NULL, 87, 'credit', 0, 1, '2025-11-19 18:21:37', '2025-11-19 18:21:37', 'Referral bonus credited', ''),
(176, 78, 16, 'credit', 5, 1, '2025-11-20 11:02:49', '2025-11-20 11:02:49', NULL, NULL),
(177, 79, 31, 'credit', 5, 1, '2025-11-20 11:04:03', '2025-11-20 11:04:03', NULL, NULL),
(178, 80, 31, 'credit', 5, 1, '2025-11-20 11:09:09', '2025-11-20 11:09:09', NULL, NULL),
(179, 81, 16, 'credit', 5, 1, '2025-11-20 11:12:50', '2025-11-20 11:12:50', NULL, NULL),
(180, 82, 16, 'credit', 5, 1, '2025-11-20 11:38:12', '2025-11-20 11:38:12', NULL, NULL),
(181, 83, 16, 'credit', 5, 1, '2025-11-20 12:16:45', '2025-11-20 12:16:45', NULL, NULL),
(182, 84, 10, 'credit', 10, 1, '2025-11-20 15:30:21', '2025-11-20 15:30:21', NULL, NULL),
(183, 85, 10, 'credit', 5, 1, '2025-11-20 15:54:36', '2025-11-20 15:54:36', NULL, NULL),
(184, 85, 10, 'debit', -10, 1, '2025-11-20 15:54:36', '2025-11-20 15:54:36', NULL, NULL),
(185, 86, 10, 'credit', 5, 1, '2025-11-20 16:15:48', '2025-11-20 16:15:48', NULL, NULL),
(186, 86, 10, 'debit', -10, 1, '2025-11-20 16:15:48', '2025-11-20 16:15:48', NULL, NULL),
(187, 87, 10, 'credit', 5, 1, '2025-11-20 16:29:15', '2025-11-20 16:29:15', NULL, NULL),
(188, 88, 16, 'credit', 5, 1, '2025-11-20 16:37:52', '2025-11-20 16:37:52', NULL, NULL),
(189, 89, 88, 'credit', 5, 1, '2025-11-20 16:46:59', '2025-11-20 16:46:59', NULL, NULL),
(190, 90, 10, 'credit', 5, 1, '2025-11-20 16:52:43', '2025-11-20 16:52:43', NULL, NULL),
(191, 91, 16, 'credit', 5, 1, '2025-11-20 17:18:22', '2025-11-20 17:18:22', NULL, NULL),
(192, 92, 16, 'credit', 5, 1, '2025-11-20 17:21:10', '2025-11-20 17:21:10', NULL, NULL),
(193, 93, 74, 'credit', 5, 1, '2025-11-20 18:12:43', '2025-11-20 18:12:43', NULL, NULL),
(194, NULL, 16, 'credit', 0, 1, '2025-11-20 21:26:51', '2025-11-20 21:26:51', 'Referral bonus credited', '90'),
(195, NULL, 90, 'credit', 0, 1, '2025-11-20 21:26:51', '2025-11-20 21:26:51', 'Referral bonus credited', ''),
(196, NULL, 16, 'credit', 0, 1, '2025-11-20 21:30:37', '2025-11-20 21:30:37', 'Referral bonus credited', '91'),
(197, NULL, 91, 'credit', 0, 1, '2025-11-20 21:30:37', '2025-11-20 21:30:37', 'Referral bonus credited', ''),
(198, NULL, 16, 'credit', 0, 1, '2025-11-20 21:33:54', '2025-11-20 21:33:54', 'Referral bonus credited', '91'),
(199, NULL, 91, 'credit', 0, 1, '2025-11-20 21:33:54', '2025-11-20 21:33:54', 'Eco Silver plan rewards credited', NULL),
(200, 94, 91, 'credit', 20, 1, '2025-11-20 21:46:57', '2025-11-20 21:46:57', NULL, NULL),
(201, 95, 91, 'credit', 20, 1, '2025-11-20 21:47:32', '2025-11-20 21:47:32', NULL, NULL),
(202, 96, 91, 'credit', 15, 1, '2025-11-20 22:04:04', '2025-11-20 22:04:04', NULL, NULL),
(203, 96, 91, 'debit', -30, 1, '2025-11-20 22:04:04', '2025-11-20 22:04:04', NULL, NULL),
(204, 97, 13, 'credit', 10, 1, '2025-11-21 10:33:46', '2025-11-21 10:33:46', NULL, NULL),
(205, 98, 16, 'credit', 5, 1, '2025-11-21 11:47:40', '2025-11-21 11:47:40', NULL, NULL),
(206, 99, 16, 'credit', 5, 1, '2025-11-21 11:50:47', '2025-11-21 11:50:47', NULL, NULL),
(207, 100, 16, 'credit', 5, 1, '2025-11-21 11:53:44', '2025-11-21 11:53:44', NULL, NULL),
(208, 101, 10, 'credit', 5, 1, '2025-11-21 15:30:03', '2025-11-21 15:30:03', NULL, NULL),
(209, 102, 10, 'credit', 5, 1, '2025-11-21 16:52:43', '2025-11-21 16:52:43', NULL, NULL),
(210, 103, 16, 'credit', 5, 1, '2025-11-22 15:09:48', '2025-11-22 15:09:48', NULL, NULL),
(211, 104, 16, 'credit', 5, 1, '2025-11-22 15:22:10', '2025-11-22 15:22:10', NULL, NULL),
(212, 105, 16, 'credit', 5, 1, '2025-11-22 17:14:21', '2025-11-22 17:14:21', NULL, NULL),
(213, 106, 16, 'credit', 5, 1, '2025-11-22 17:41:12', '2025-11-22 17:41:12', NULL, NULL),
(214, NULL, 16, 'credit', 0, 1, '2025-11-23 19:31:26', '2025-11-23 19:31:26', 'Referral bonus credited', '93'),
(215, NULL, 93, 'credit', 0, 1, '2025-11-23 19:31:26', '2025-11-23 19:31:26', 'Referral bonus credited', ''),
(216, NULL, 16, 'credit', 0, 1, '2025-11-24 10:39:30', '2025-11-24 10:39:30', 'Referral bonus credited', '94'),
(217, NULL, 94, 'credit', 0, 1, '2025-11-24 10:39:30', '2025-11-24 10:39:30', 'Referral bonus credited', ''),
(218, NULL, 16, 'credit', 0, 1, '2025-11-24 10:40:09', '2025-11-24 10:40:09', 'Referral bonus credited', '94'),
(219, NULL, 94, 'credit', 199, 1, '2025-11-24 10:40:10', '2025-11-24 10:40:10', 'Eco Silver plan rewards credited', NULL),
(220, 107, 16, 'credit', 5, 1, '2025-11-24 12:46:21', '2025-11-24 12:46:21', NULL, NULL),
(221, NULL, 16, 'credit', 0, 1, '2025-11-24 18:01:16', '2025-11-24 18:01:16', 'Referral bonus credited', '95'),
(222, NULL, 95, 'credit', 0, 1, '2025-11-24 18:01:16', '2025-11-24 18:01:16', 'Referral bonus credited', ''),
(223, 108, 80, 'credit', 5, 1, '2025-11-25 05:40:48', '2025-11-25 05:40:48', NULL, NULL),
(224, 108, 80, 'debit', -10, 1, '2025-11-25 05:40:48', '2025-11-25 05:40:48', NULL, NULL),
(225, NULL, 10, 'credit', 199, 1, '2025-11-25 11:54:10', '2025-11-25 11:54:10', 'Eco Silver plan rewards credited', NULL),
(226, 109, 97, 'credit', 5, 1, '2025-11-26 14:53:33', '2025-11-26 14:53:33', NULL, NULL),
(227, NULL, 16, 'credit', 0, 1, '2025-11-27 16:31:51', '2025-11-27 16:31:51', 'Referral bonus credited', '98'),
(228, NULL, 98, 'credit', 0, 1, '2025-11-27 16:31:51', '2025-11-27 16:31:51', 'Referral bonus credited', ''),
(229, 110, 78, 'credit', 5, 1, '2025-11-27 17:13:24', '2025-11-27 17:13:24', NULL, NULL),
(230, 111, 16, 'credit', 10, 1, '2025-11-28 10:32:14', '2025-11-28 10:32:14', NULL, NULL),
(231, 112, 16, 'credit', 5, 1, '2025-11-28 15:29:43', '2025-11-28 15:29:43', NULL, NULL),
(232, 113, 16, 'credit', 5, 1, '2025-11-28 15:45:23', '2025-11-28 15:45:23', NULL, NULL),
(233, 114, 16, 'credit', 5, 1, '2025-11-28 15:46:49', '2025-11-28 15:46:49', NULL, NULL),
(234, 115, 16, 'credit', 5, 1, '2025-11-28 16:43:02', '2025-11-28 16:43:02', NULL, NULL),
(235, 116, 16, 'credit', 5, 1, '2025-11-30 10:39:04', '2025-11-30 10:39:04', NULL, NULL),
(236, 117, 16, 'credit', 5, 1, '2025-12-01 10:05:16', '2025-12-01 10:05:16', NULL, NULL),
(237, 117, 16, 'debit', -5, 1, '2025-12-01 10:05:16', '2025-12-01 10:05:16', NULL, NULL),
(238, 118, 16, 'credit', 5, 1, '2025-12-01 10:09:40', '2025-12-01 10:09:40', NULL, NULL),
(239, 118, 16, 'debit', -5, 1, '2025-12-01 10:09:40', '2025-12-01 10:09:40', NULL, NULL),
(240, 119, 16, 'credit', 2, 1, '2025-12-01 10:10:24', '2025-12-01 10:10:24', NULL, NULL),
(241, 120, 16, 'credit', 2, 1, '2025-12-01 10:16:30', '2025-12-01 10:16:30', NULL, NULL),
(242, 120, 16, 'debit', -5, 1, '2025-12-01 10:16:30', '2025-12-01 10:16:30', NULL, NULL),
(243, 121, 16, 'credit', 2, 1, '2025-12-01 10:22:02', '2025-12-01 10:22:02', NULL, NULL),
(244, 121, 16, 'debit', -5, 1, '2025-12-01 10:22:02', '2025-12-01 10:22:02', NULL, NULL),
(245, NULL, 80, 'credit', 0, 1, '2025-12-02 13:04:44', '2025-12-02 13:04:44', 'Referral bonus credited', '101'),
(246, NULL, 101, 'credit', 0, 1, '2025-12-02 13:04:44', '2025-12-02 13:04:44', 'Referral bonus credited', ''),
(247, NULL, 80, 'credit', 0, 1, '2025-12-02 13:22:27', '2025-12-02 13:22:27', 'Referral bonus credited', '102'),
(248, NULL, 102, 'credit', 0, 1, '2025-12-02 13:22:27', '2025-12-02 13:22:27', 'Referral bonus credited', ''),
(249, NULL, 80, 'credit', 0, 1, '2025-12-02 13:23:49', '2025-12-02 13:23:49', 'Referral bonus credited', '103'),
(250, NULL, 103, 'credit', 0, 1, '2025-12-02 13:23:49', '2025-12-02 13:23:49', 'Referral bonus credited', ''),
(251, NULL, 80, 'credit', 0, 1, '2025-12-02 13:27:50', '2025-12-02 13:27:50', 'Referral bonus credited', '104'),
(252, NULL, 104, 'credit', 0, 1, '2025-12-02 13:27:50', '2025-12-02 13:27:50', 'Referral bonus credited', ''),
(253, 122, 104, 'credit', 5, 1, '2025-12-02 13:36:03', '2025-12-02 13:36:03', NULL, NULL),
(254, 123, 16, 'credit', 5, 1, '2025-12-04 12:09:13', '2025-12-04 12:09:13', NULL, NULL),
(255, 124, 78, 'credit', 5, 1, '2025-12-08 17:30:54', '2025-12-08 17:30:54', NULL, NULL),
(256, 125, 74, 'credit', 15, 1, '2025-12-10 17:13:50', '2025-12-10 17:13:50', NULL, NULL),
(257, 126, 10, 'credit', 2, 1, '2025-12-10 17:21:03', '2025-12-10 17:21:03', NULL, NULL),
(258, 127, 16, 'credit', 2, 1, '2025-12-10 17:23:37', '2025-12-10 17:23:37', NULL, NULL),
(259, 128, 16, 'credit', 5, 1, '2025-12-10 17:25:59', '2025-12-10 17:25:59', NULL, NULL),
(260, NULL, 16, 'credit', 0, 1, '2025-12-14 10:10:20', '2025-12-14 10:10:20', 'Referral bonus credited', '113'),
(261, NULL, 113, 'credit', 0, 1, '2025-12-14 10:10:20', '2025-12-14 10:10:20', 'Referral bonus credited', ''),
(262, NULL, 16, 'credit', 0, 1, '2025-12-14 10:15:24', '2025-12-14 10:15:24', 'Referral bonus credited', '113'),
(263, NULL, 113, 'credit', 499, 1, '2025-12-14 10:15:28', '2025-12-14 10:15:28', 'Eco Gold plan rewards credited', NULL),
(264, 129, 113, 'credit', 2, 1, '2025-12-14 10:42:27', '2025-12-14 10:42:27', NULL, NULL),
(265, 129, 113, 'debit', -5, 1, '2025-12-14 10:42:27', '2025-12-14 10:42:27', NULL, NULL),
(266, 130, 16, 'credit', 2, 1, '2025-12-14 10:53:08', '2025-12-14 10:53:08', NULL, NULL),
(267, 131, 10, 'credit', 5, 1, '2025-12-16 15:59:41', '2025-12-16 15:59:41', NULL, NULL),
(268, NULL, 16, 'credit', 0, 1, '2025-12-17 14:24:07', '2025-12-17 14:24:07', 'Referral bonus credited', '116'),
(269, NULL, 116, 'credit', 0, 1, '2025-12-17 14:24:07', '2025-12-17 14:24:07', 'Referral bonus credited', ''),
(270, 132, 116, 'credit', 2, 1, '2025-12-17 14:25:35', '2025-12-17 14:25:35', NULL, NULL),
(271, 133, 16, 'credit', 5, 1, '2025-12-17 14:52:56', '2025-12-17 14:52:56', NULL, NULL),
(272, 134, 15, 'credit', 7, 1, '2025-12-17 16:53:00', '2025-12-17 16:53:00', NULL, NULL),
(273, NULL, 78, 'credit', 0, 1, '2025-12-18 12:08:31', '2025-12-18 12:08:31', 'Referral bonus credited', '117'),
(274, NULL, 117, 'credit', 0, 1, '2025-12-18 12:08:31', '2025-12-18 12:08:31', 'Referral bonus credited', ''),
(275, 135, 117, 'credit', 15, 1, '2025-12-18 12:26:46', '2025-12-18 12:26:46', NULL, NULL),
(276, 136, 117, 'credit', 15, 1, '2025-12-18 13:08:52', '2025-12-18 13:08:52', NULL, NULL),
(277, NULL, 78, 'credit', 0, 1, '2025-12-18 13:15:46', '2025-12-18 13:15:46', 'Referral bonus credited', '118'),
(278, NULL, 118, 'credit', 0, 1, '2025-12-18 13:15:46', '2025-12-18 13:15:46', 'Referral bonus credited', ''),
(279, 137, 118, 'credit', 20, 1, '2025-12-18 13:28:50', '2025-12-18 13:28:50', NULL, NULL),
(280, 138, 118, 'credit', 10, 1, '2025-12-18 13:31:04', '2025-12-18 13:31:04', NULL, NULL),
(281, 138, 118, 'debit', -10, 1, '2025-12-18 13:31:04', '2025-12-18 13:31:04', NULL, NULL),
(282, 139, 118, 'credit', 20, 1, '2025-12-18 13:47:02', '2025-12-18 13:47:02', NULL, NULL),
(283, 139, 118, 'debit', -20, 1, '2025-12-18 13:47:02', '2025-12-18 13:47:02', NULL, NULL),
(284, 140, 118, 'credit', 2, 1, '2025-12-18 14:42:32', '2025-12-18 14:42:32', NULL, NULL),
(285, 141, 16, 'credit', 5, 1, '2025-12-18 16:09:13', '2025-12-18 16:09:13', NULL, NULL),
(286, 142, 16, 'credit', 5, 1, '2025-12-19 09:53:42', '2025-12-19 09:53:42', NULL, NULL),
(287, 143, 119, 'credit', 5, 1, '2025-12-19 12:54:28', '2025-12-19 12:54:28', NULL, NULL),
(288, 144, 16, 'credit', 2, 1, '2025-12-20 12:12:38', '2025-12-20 12:12:38', NULL, NULL),
(289, 145, 16, 'credit', 2, 1, '2025-12-20 12:13:00', '2025-12-20 12:13:00', NULL, NULL),
(290, 146, 16, 'credit', 2, 1, '2025-12-20 16:48:47', '2025-12-20 16:48:47', NULL, NULL),
(291, NULL, 78, 'credit', 0, 1, '2025-12-22 15:21:34', '2025-12-22 15:21:34', 'Referral bonus credited', '122'),
(292, NULL, 122, 'credit', 0, 1, '2025-12-22 15:21:34', '2025-12-22 15:21:34', 'Referral bonus credited', ''),
(293, NULL, 78, 'credit', 0, 1, '2025-12-22 15:56:17', '2025-12-22 15:56:17', 'Referral bonus credited', '123'),
(294, NULL, 123, 'credit', 0, 1, '2025-12-22 15:56:17', '2025-12-22 15:56:17', 'Referral bonus credited', ''),
(295, 147, 74, 'credit', 27, 1, '2025-12-22 16:29:18', '2025-12-22 16:29:18', NULL, NULL),
(296, NULL, 78, 'credit', 0, 1, '2025-12-23 11:31:43', '2025-12-23 11:31:43', 'Referral bonus credited', '125'),
(297, NULL, 125, 'credit', 0, 1, '2025-12-23 11:31:43', '2025-12-23 11:31:43', 'Referral bonus credited', ''),
(298, NULL, 78, 'credit', 0, 1, '2025-12-23 12:35:17', '2025-12-23 12:35:17', 'Referral bonus credited', '127'),
(299, NULL, 127, 'credit', 0, 1, '2025-12-23 12:35:17', '2025-12-23 12:35:17', 'Referral bonus credited', ''),
(300, NULL, 78, 'credit', 0, 1, '2025-12-23 12:53:03', '2025-12-23 12:53:03', 'Referral bonus credited', '128'),
(301, NULL, 128, 'credit', 0, 1, '2025-12-23 12:53:03', '2025-12-23 12:53:03', 'Referral bonus credited', ''),
(302, NULL, 78, 'credit', 0, 1, '2025-12-23 13:05:41', '2025-12-23 13:05:41', 'Referral bonus credited', '129'),
(303, NULL, 129, 'credit', 0, 1, '2025-12-23 13:05:41', '2025-12-23 13:05:41', 'Referral bonus credited', ''),
(304, 148, 74, 'credit', 27, 1, '2025-12-23 13:31:55', '2025-12-23 13:31:55', NULL, NULL),
(305, NULL, 78, 'credit', 0, 1, '2025-12-23 15:47:09', '2025-12-23 15:47:09', 'Referral bonus credited', '130'),
(306, NULL, 130, 'credit', 0, 1, '2025-12-23 15:47:09', '2025-12-23 15:47:09', 'Referral bonus credited', ''),
(307, 149, 91, 'credit', 21, 1, '2025-12-24 03:26:42', '2025-12-24 03:26:42', NULL, NULL),
(308, 149, 91, 'debit', -25, 1, '2025-12-24 03:26:42', '2025-12-24 03:26:42', NULL, NULL),
(309, NULL, 78, 'credit', 0, 1, '2025-12-24 12:35:50', '2025-12-24 12:35:50', 'Referral bonus credited', '131'),
(310, NULL, 131, 'credit', 0, 1, '2025-12-24 12:35:50', '2025-12-24 12:35:50', 'Referral bonus credited', ''),
(311, NULL, 78, 'credit', 0, 1, '2025-12-24 12:42:57', '2025-12-24 12:42:57', 'Referral bonus credited', '132'),
(312, NULL, 132, 'credit', 0, 1, '2025-12-24 12:42:57', '2025-12-24 12:42:57', 'Referral bonus credited', ''),
(313, NULL, 78, 'credit', 0, 1, '2025-12-24 12:51:50', '2025-12-24 12:51:50', 'Referral bonus credited', '133'),
(314, NULL, 133, 'credit', 0, 1, '2025-12-24 12:51:50', '2025-12-24 12:51:50', 'Referral bonus credited', ''),
(315, NULL, 78, 'credit', 0, 1, '2025-12-24 13:42:20', '2025-12-24 13:42:20', 'Referral bonus credited', '134'),
(316, NULL, 134, 'credit', 0, 1, '2025-12-24 13:42:20', '2025-12-24 13:42:20', 'Referral bonus credited', ''),
(317, NULL, 78, 'credit', 0, 1, '2025-12-24 14:38:31', '2025-12-24 14:38:31', 'Referral bonus credited', '135'),
(318, NULL, 135, 'credit', 0, 1, '2025-12-24 14:38:31', '2025-12-24 14:38:31', 'Referral bonus credited', ''),
(319, NULL, 78, 'credit', 0, 1, '2025-12-24 15:33:55', '2025-12-24 15:33:55', 'Referral bonus credited', '136'),
(320, NULL, 136, 'credit', 0, 1, '2025-12-24 15:33:55', '2025-12-24 15:33:55', 'Referral bonus credited', ''),
(321, NULL, 78, 'credit', 0, 1, '2025-12-24 15:40:33', '2025-12-24 15:40:33', 'Referral bonus credited', '137'),
(322, NULL, 137, 'credit', 0, 1, '2025-12-24 15:40:33', '2025-12-24 15:40:33', 'Referral bonus credited', ''),
(323, NULL, 78, 'credit', 0, 1, '2025-12-24 15:48:40', '2025-12-24 15:48:40', 'Referral bonus credited', '138'),
(324, NULL, 138, 'credit', 0, 1, '2025-12-24 15:48:40', '2025-12-24 15:48:40', 'Referral bonus credited', ''),
(325, NULL, 78, 'credit', 0, 1, '2025-12-24 16:01:09', '2025-12-24 16:01:09', 'Referral bonus credited', '139'),
(326, NULL, 139, 'credit', 0, 1, '2025-12-24 16:01:09', '2025-12-24 16:01:09', 'Referral bonus credited', ''),
(327, NULL, 78, 'credit', 0, 1, '2025-12-24 16:26:29', '2025-12-24 16:26:29', 'Referral bonus credited', '140'),
(328, NULL, 140, 'credit', 0, 1, '2025-12-24 16:26:29', '2025-12-24 16:26:29', 'Referral bonus credited', ''),
(329, NULL, 78, 'credit', 0, 1, '2025-12-24 16:36:21', '2025-12-24 16:36:21', 'Referral bonus credited', '141'),
(330, NULL, 141, 'credit', 0, 1, '2025-12-24 16:36:21', '2025-12-24 16:36:21', 'Referral bonus credited', ''),
(331, NULL, 78, 'credit', 0, 1, '2025-12-24 16:38:59', '2025-12-24 16:38:59', 'Referral bonus credited', '142'),
(332, NULL, 142, 'credit', 0, 1, '2025-12-24 16:38:59', '2025-12-24 16:38:59', 'Referral bonus credited', ''),
(333, NULL, 16, 'credit', 0, 1, '2025-12-25 10:34:51', '2025-12-25 10:34:51', 'Referral bonus credited', '144'),
(334, NULL, 144, 'credit', 0, 1, '2025-12-25 10:34:51', '2025-12-25 10:34:51', 'Referral bonus credited', ''),
(335, NULL, 78, 'credit', 0, 1, '2025-12-25 12:46:53', '2025-12-25 12:46:53', 'Referral bonus credited', '145'),
(336, NULL, 145, 'credit', 0, 1, '2025-12-25 12:46:53', '2025-12-25 12:46:53', 'Referral bonus credited', ''),
(337, NULL, 78, 'credit', 0, 1, '2025-12-25 12:52:03', '2025-12-25 12:52:03', 'Referral bonus credited', '146'),
(338, NULL, 146, 'credit', 0, 1, '2025-12-25 12:52:03', '2025-12-25 12:52:03', 'Referral bonus credited', ''),
(339, NULL, 78, 'credit', 0, 1, '2025-12-25 13:00:46', '2025-12-25 13:00:46', 'Referral bonus credited', '147'),
(340, NULL, 147, 'credit', 0, 1, '2025-12-25 13:00:46', '2025-12-25 13:00:46', 'Referral bonus credited', ''),
(341, NULL, 78, 'credit', 0, 1, '2025-12-25 13:44:04', '2025-12-25 13:44:04', 'Referral bonus credited', '148'),
(342, NULL, 148, 'credit', 0, 1, '2025-12-25 13:44:04', '2025-12-25 13:44:04', 'Referral bonus credited', ''),
(343, 150, 16, 'credit', 2, 1, '2025-12-25 13:52:19', '2025-12-25 13:52:19', NULL, NULL),
(344, NULL, 78, 'credit', 0, 1, '2025-12-25 16:52:50', '2025-12-25 16:52:50', 'Referral bonus credited', '149'),
(345, NULL, 149, 'credit', 0, 1, '2025-12-25 16:52:50', '2025-12-25 16:52:50', 'Referral bonus credited', ''),
(346, 151, 16, 'credit', 4, 1, '2025-12-26 12:11:19', '2025-12-26 12:11:19', NULL, NULL),
(347, 152, 154, 'credit', 125, 1, '2025-12-27 13:41:19', '2025-12-27 13:41:19', NULL, NULL),
(348, 153, 16, 'credit', 2, 1, '2025-12-27 15:46:37', '2025-12-27 15:46:37', NULL, NULL),
(349, 154, 86, 'credit', 4, 1, '2025-12-27 17:06:00', '2025-12-27 17:06:00', NULL, NULL),
(350, 155, 16, 'credit', 5, 1, '2025-12-28 11:07:50', '2025-12-28 11:07:50', NULL, NULL),
(351, 156, 16, 'credit', 9, 1, '2025-12-28 11:12:36', '2025-12-28 11:12:36', NULL, NULL),
(352, NULL, 91, 'credit', 0, 1, '2025-12-28 14:24:53', '2025-12-28 14:24:53', 'Referral bonus credited', '156'),
(353, NULL, 156, 'credit', 0, 1, '2025-12-28 14:24:53', '2025-12-28 14:24:53', 'Referral bonus credited', ''),
(354, 157, 16, 'credit', 4, 1, '2025-12-29 11:42:18', '2025-12-29 11:42:18', NULL, NULL),
(355, 158, 16, 'credit', 9, 1, '2025-12-29 15:46:36', '2025-12-29 15:46:36', NULL, NULL),
(356, 159, 16, 'credit', 9, 1, '2025-12-30 17:42:13', '2025-12-30 17:42:13', NULL, NULL),
(357, 160, 16, 'credit', 9, 1, '2025-12-31 10:44:35', '2025-12-31 10:44:35', NULL, NULL),
(358, 161, 16, 'credit', 5, 1, '2025-12-31 19:33:30', '2025-12-31 19:33:30', NULL, NULL),
(359, 162, 16, 'credit', 5, 1, '2025-12-31 19:35:11', '2025-12-31 19:35:11', NULL, NULL),
(360, 163, 16, 'credit', 11, 1, '2025-12-31 19:37:20', '2025-12-31 19:37:20', NULL, NULL),
(361, 164, 16, 'credit', 8, 1, '2026-01-01 17:09:20', '2026-01-01 17:09:20', NULL, NULL),
(362, 165, 16, 'credit', 6, 1, '2026-01-02 11:44:19', '2026-01-02 11:44:19', NULL, NULL),
(363, 166, 155, 'credit', 2, 1, '2026-01-03 13:40:28', '2026-01-03 13:40:28', NULL, NULL),
(364, 167, 155, 'credit', 2, 1, '2026-01-03 16:32:50', '2026-01-03 16:32:50', NULL, NULL),
(365, 168, 16, 'credit', 2, 1, '2026-01-03 16:37:46', '2026-01-03 16:37:46', NULL, NULL),
(366, 169, 155, 'credit', 5, 1, '2026-01-03 16:41:05', '2026-01-03 16:41:05', NULL, NULL),
(367, 170, 16, 'credit', 2, 1, '2026-01-04 11:05:59', '2026-01-04 11:05:59', NULL, NULL),
(368, NULL, 78, 'credit', 0, 1, '2026-01-05 12:53:38', '2026-01-05 12:53:38', 'Referral bonus credited', '162'),
(369, NULL, 162, 'credit', 0, 1, '2026-01-05 12:53:38', '2026-01-05 12:53:38', 'Referral bonus credited', ''),
(370, NULL, 78, 'credit', 0, 1, '2026-01-05 13:14:45', '2026-01-05 13:14:45', 'Referral bonus credited', '163'),
(371, NULL, 163, 'credit', 0, 1, '2026-01-05 13:14:45', '2026-01-05 13:14:45', 'Referral bonus credited', ''),
(372, NULL, 78, 'credit', 0, 1, '2026-01-05 13:35:44', '2026-01-05 13:35:44', 'Referral bonus credited', '164'),
(373, NULL, 164, 'credit', 0, 1, '2026-01-05 13:35:44', '2026-01-05 13:35:44', 'Referral bonus credited', ''),
(374, NULL, 78, 'credit', 0, 1, '2026-01-05 14:38:45', '2026-01-05 14:38:45', 'Referral bonus credited', '165'),
(375, NULL, 165, 'credit', 0, 1, '2026-01-05 14:38:45', '2026-01-05 14:38:45', 'Referral bonus credited', ''),
(376, NULL, 78, 'credit', 0, 1, '2026-01-05 14:59:27', '2026-01-05 14:59:27', 'Referral bonus credited', '166'),
(377, NULL, 166, 'credit', 0, 1, '2026-01-05 14:59:27', '2026-01-05 14:59:27', 'Referral bonus credited', ''),
(378, NULL, 78, 'credit', 0, 1, '2026-01-05 17:13:42', '2026-01-05 17:13:42', 'Referral bonus credited', '167'),
(379, NULL, 167, 'credit', 0, 1, '2026-01-05 17:13:42', '2026-01-05 17:13:42', 'Referral bonus credited', ''),
(380, NULL, 78, 'credit', 0, 1, '2026-01-05 18:03:02', '2026-01-05 18:03:02', 'Referral bonus credited', '168'),
(381, NULL, 168, 'credit', 0, 1, '2026-01-05 18:03:02', '2026-01-05 18:03:02', 'Referral bonus credited', ''),
(382, NULL, 78, 'credit', 0, 1, '2026-01-05 18:10:58', '2026-01-05 18:10:58', 'Referral bonus credited', '169'),
(383, NULL, 169, 'credit', 0, 1, '2026-01-05 18:10:58', '2026-01-05 18:10:58', 'Referral bonus credited', ''),
(384, NULL, 78, 'credit', 0, 1, '2026-01-06 13:30:15', '2026-01-06 13:30:15', 'Referral bonus credited', '171'),
(385, NULL, 171, 'credit', 0, 1, '2026-01-06 13:30:15', '2026-01-06 13:30:15', 'Referral bonus credited', ''),
(386, 171, 16, 'credit', 8, 1, '2026-01-07 10:43:58', '2026-01-07 10:43:58', NULL, NULL),
(387, 171, 16, 'debit', -20, 1, '2026-01-07 10:43:58', '2026-01-07 10:43:58', NULL, NULL),
(390, 173, 10, 'credit', 2, 1, '2026-01-07 10:59:15', '2026-01-07 10:59:15', NULL, NULL),
(391, 173, 10, 'debit', -5, 1, '2026-01-07 10:59:15', '2026-01-07 10:59:15', NULL, NULL),
(392, 174, 16, 'credit', 5, 1, '2026-01-07 11:34:42', '2026-01-07 11:34:42', NULL, NULL),
(393, NULL, 78, 'credit', 0, 1, '2026-01-08 11:58:56', '2026-01-08 11:58:56', 'Referral bonus credited', '176'),
(394, NULL, 176, 'credit', 0, 1, '2026-01-08 11:58:56', '2026-01-08 11:58:56', 'Referral bonus credited', ''),
(395, 175, 16, 'credit', 8, 1, '2026-01-08 12:46:05', '2026-01-08 12:46:05', NULL, NULL),
(396, NULL, 78, 'credit', 0, 1, '2026-01-08 12:46:57', '2026-01-08 12:46:57', 'Referral bonus credited', '177'),
(397, NULL, 177, 'credit', 0, 1, '2026-01-08 12:46:57', '2026-01-08 12:46:57', 'Referral bonus credited', ''),
(398, NULL, 78, 'credit', 0, 1, '2026-01-08 13:27:56', '2026-01-08 13:27:56', 'Referral bonus credited', '178'),
(399, NULL, 178, 'credit', 0, 1, '2026-01-08 13:27:56', '2026-01-08 13:27:56', 'Referral bonus credited', '');

-- --------------------------------------------------------

--
-- Table structure for table `bl_wallet_transactions`
--

CREATE TABLE `bl_wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` double NOT NULL,
  `txn_id` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL DEFAULT '2025-08-12 12:01:24',
  `message` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_by` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bl_wallet_transactions`
--

INSERT INTO `bl_wallet_transactions` (`id`, `order_id`, `order_item_id`, `user_id`, `type`, `amount`, `txn_id`, `payment_type`, `transaction_date`, `message`, `status`, `created_at`, `updated_at`, `user_by`) VALUES
(1, 38, 0, 11, 'credit', 0, NULL, NULL, '2025-08-12 12:01:24', 'Refer Earn First Order Bonus', '1', '2025-11-08 12:37:03', '2025-11-08 12:37:03', NULL),
(2, NULL, NULL, 12, 'credit', 10, '', 'user', '2025-11-08 14:23:45', 'Eco GoldReferral reward', 'success', '2025-11-08 14:23:45', '2025-11-08 14:23:45', '63'),
(3, NULL, NULL, 63, 'credit', 1, 'pay_RdBAawI3xxQXrt', 'user', '2025-11-08 14:23:45', 'Amount added to wallet', 'success', '2025-11-08 14:23:45', '2025-11-08 14:23:45', NULL),
(4, NULL, NULL, 63, 'debit', -1, '', 'user', '2025-11-08 14:23:45', 'Eco Gold plan purchased', 'success', '2025-11-08 14:23:45', '2025-11-08 14:23:45', NULL),
(5, NULL, NULL, 12, 'credit', 10, '', 'user', '2025-11-08 14:27:05', 'Eco GoldReferral reward', 'success', '2025-11-08 14:27:05', '2025-11-08 14:27:05', '64'),
(6, NULL, NULL, 64, 'credit', 1, 'pay_RdBhH9gqqdTkCQ', 'user', '2025-11-08 14:27:06', 'Amount added to wallet', 'success', '2025-11-08 14:27:06', '2025-11-08 14:27:06', NULL),
(7, NULL, NULL, 64, 'debit', -1, '', 'user', '2025-11-08 14:27:06', 'Eco Gold plan purchased', 'success', '2025-11-08 14:27:06', '2025-11-08 14:27:06', NULL),
(8, NULL, NULL, 16, 'credit', 9, '', 'user', '2025-11-11 11:29:51', 'Eco GoldReferral reward', 'success', '2025-11-11 11:29:51', '2025-11-11 11:29:51', '76'),
(9, NULL, NULL, 76, 'credit', 1, 'pay_ReKHQUndYSLHnJ', 'user', '2025-11-11 11:29:51', 'Amount added to wallet', 'success', '2025-11-11 11:29:51', '2025-11-11 11:29:51', NULL),
(10, NULL, NULL, 76, 'debit', -1, '', 'user', '2025-11-11 11:29:51', 'Eco Gold plan purchased', 'success', '2025-11-11 11:29:51', '2025-11-11 11:29:51', NULL),
(11, NULL, NULL, 16, 'credit', 100, '', 'user', '2025-11-11 11:43:15', 'Eco GoldReferral reward', 'success', '2025-11-11 11:43:15', '2025-11-11 11:43:15', '77'),
(12, NULL, NULL, 77, 'credit', 1, 'pay_ReKVbSffUfik1E', 'user', '2025-11-11 11:43:15', 'Amount added to wallet', 'success', '2025-11-11 11:43:15', '2025-11-11 11:43:15', NULL),
(13, NULL, NULL, 77, 'debit', -1, '', 'user', '2025-11-11 11:43:15', 'Eco Gold plan purchased', 'success', '2025-11-11 11:43:15', '2025-11-11 11:43:15', NULL),
(14, NULL, NULL, 16, 'credit', 100, '', 'user', '2025-11-11 11:58:42', 'Eco GoldReferral reward', 'success', '2025-11-11 11:58:42', '2025-11-11 11:58:42', '78'),
(15, NULL, NULL, 78, 'credit', 1, 'pay_ReKlwKVw0LK2ON', 'user', '2025-11-11 11:58:43', 'Amount added to wallet', 'success', '2025-11-11 11:58:43', '2025-11-11 11:58:43', NULL),
(16, NULL, NULL, 78, 'debit', -1, '', 'user', '2025-11-11 11:58:43', 'Eco Gold plan purchased', 'success', '2025-11-11 11:58:43', '2025-11-11 11:58:43', NULL),
(17, 53, 0, 11, 'credit', 0, NULL, NULL, '2025-08-12 12:01:24', 'Refer Earn First Order Bonus', '1', '2025-11-12 10:40:03', '2025-11-12 10:40:03', NULL),
(18, 47, 60, 16, 'credit', 75, NULL, NULL, '2025-08-12 12:01:24', 'Order Item Cancelled', '1', '2025-11-15 14:21:39', '2025-11-15 14:21:39', NULL),
(19, NULL, NULL, 11, 'credit', 100, '', 'user', '2025-11-15 20:12:57', 'Eco GoldReferral reward', 'success', '2025-11-15 20:12:57', '2025-11-15 20:12:57', '16'),
(20, NULL, NULL, 16, 'credit', 1, 'pay_Rg3KY8MSzrCHhQ', 'user', '2025-11-15 20:12:58', 'Amount added to wallet', 'success', '2025-11-15 20:12:58', '2025-11-15 20:12:58', NULL),
(21, NULL, NULL, 16, 'debit', -1, '', 'user', '2025-11-15 20:12:58', 'Eco Gold plan purchased', 'success', '2025-11-15 20:12:58', '2025-11-15 20:12:58', NULL),
(22, NULL, NULL, 16, 'credit', 100, '', 'user', '2025-11-15 21:06:16', 'Eco GoldReferral reward', 'success', '2025-11-15 21:06:16', '2025-11-15 21:06:16', '85'),
(23, NULL, NULL, 85, 'credit', 1, 'pay_Rg4ETG0ibrPzWb', 'user', '2025-11-15 21:06:18', 'Amount added to wallet', 'success', '2025-11-15 21:06:18', '2025-11-15 21:06:18', NULL),
(24, NULL, NULL, 85, 'debit', -1, '', 'user', '2025-11-15 21:06:18', 'Eco Gold plan purchased', 'success', '2025-11-15 21:06:18', '2025-11-15 21:06:18', NULL),
(25, NULL, NULL, 16, 'credit', 10, 'pay_RghQ1FMFUdKlW0', 'Razorpay', '2025-11-17 11:25:52', 'Wallet successfully recharged.', 'success', '2025-11-17 11:25:52', '2025-11-17 11:25:52', NULL),
(26, NULL, NULL, 10, 'credit', 100, 'admin', 'admin', '2025-08-12 12:01:24', 'test', '1', '2025-11-20 15:54:01', '2025-11-20 15:54:01', NULL),
(27, 86, 0, 10, 'debit', -65, NULL, NULL, '2025-08-12 12:01:24', 'Used against Order Placement', '1', '2025-11-20 16:15:48', '2025-11-20 16:15:48', NULL),
(28, NULL, NULL, 16, 'credit', 25, '', 'user', '2025-11-20 21:33:54', 'Eco SilverReferral reward', 'success', '2025-11-20 21:33:54', '2025-11-20 21:33:54', '91'),
(29, NULL, NULL, 91, 'credit', 199, 'pay_Ri3NeoIIeaKmXy', 'user', '2025-11-20 21:33:54', 'Amount added to wallet', 'success', '2025-11-20 21:33:54', '2025-11-20 21:33:54', NULL),
(30, NULL, NULL, 91, 'debit', -199, '', 'user', '2025-11-20 21:33:54', 'Eco Silver plan purchased', 'success', '2025-11-20 21:33:54', '2025-11-20 21:33:54', NULL),
(31, NULL, NULL, 16, 'credit', 25, '', 'user', '2025-11-24 10:40:09', 'Eco SilverReferral reward', 'success', '2025-11-24 10:40:09', '2025-11-24 10:40:09', '94'),
(32, NULL, NULL, 94, 'credit', 1, 'pay_RjSNTtTTVKygGm', 'user', '2025-11-24 10:40:10', 'Amount added to wallet', 'success', '2025-11-24 10:40:10', '2025-11-24 10:40:10', NULL),
(33, NULL, NULL, 94, 'debit', -1, '', 'user', '2025-11-24 10:40:10', 'Eco Silver plan purchased', 'success', '2025-11-24 10:40:10', '2025-11-24 10:40:10', NULL),
(34, 101, 127, 10, 'credit', 75, NULL, NULL, '2025-08-12 12:01:24', 'Order Item Cancelled', '1', '2025-11-24 13:35:36', '2025-11-24 13:35:36', NULL),
(35, NULL, NULL, 10, 'credit', 1, 'pay_RjsAksORNVpBkI', 'user', '2025-11-25 11:54:10', 'Amount added to wallet', 'success', '2025-11-25 11:54:10', '2025-11-25 11:54:10', NULL),
(36, NULL, NULL, 10, 'debit', -1, '', 'user', '2025-11-25 11:54:10', 'Eco Silver plan purchased', 'success', '2025-11-25 11:54:10', '2025-11-25 11:54:10', NULL),
(37, NULL, NULL, 16, 'credit', 100, '', 'user', '2025-12-14 10:15:24', 'Eco GoldReferral reward', 'success', '2025-12-14 10:15:24', '2025-12-14 10:15:24', '113'),
(38, NULL, NULL, 113, 'credit', 1, 'pay_RrMc0lmhjO6len', 'user', '2025-12-14 10:15:28', 'Amount added to wallet', 'success', '2025-12-14 10:15:28', '2025-12-14 10:15:28', NULL),
(39, NULL, NULL, 113, 'debit', -1, '', 'user', '2025-12-14 10:15:28', 'Eco Gold plan purchased', 'success', '2025-12-14 10:15:28', '2025-12-14 10:15:28', NULL),
(40, 139, 0, 78, 'credit', 0, NULL, NULL, '2025-08-12 12:01:24', 'Refer Earn First Order Bonus', '1', '2025-12-21 14:42:02', '2025-12-21 14:42:02', NULL),
(41, 153, 0, 16, 'debit', -60, NULL, NULL, '2025-08-12 12:01:24', 'Used against Order Placement', '1', '2025-12-27 15:46:37', '2025-12-27 15:46:37', NULL),
(42, 161, 0, 16, 'debit', -31, NULL, NULL, '2025-08-12 12:01:24', 'Used against Order Placement', '1', '2025-12-31 19:33:30', '2025-12-31 19:33:30', NULL),
(43, 162, 0, 16, 'debit', -31, NULL, NULL, '2025-08-12 12:01:24', 'Used against Order Placement', '1', '2025-12-31 19:35:11', '2025-12-31 19:35:11', NULL),
(44, 171, 0, 16, 'debit', 0, NULL, NULL, '2025-08-12 12:01:24', 'Used against Order Placement', '1', '2026-01-07 10:43:58', '2026-01-07 10:43:58', NULL),
(45, 171, 229, 16, 'credit', 0, NULL, NULL, '2025-08-12 12:01:24', 'Order Item Cancelled', '1', '2026-01-07 10:45:38', '2026-01-07 10:45:38', NULL),
(46, 173, 0, 10, 'debit', 0, NULL, NULL, '2025-08-12 12:01:24', 'Used against Order Placement', '1', '2026-01-07 10:59:15', '2026-01-07 10:59:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bl_web_seo_pages`
--

CREATE TABLE `bl_web_seo_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` longtext DEFAULT NULL,
  `page_type` varchar(191) NOT NULL,
  `og_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bl_withdrawal_requests`
--

CREATE TABLE `bl_withdrawal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL COMMENT 'user, seller, delivery_boy',
  `type_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remark` text DEFAULT NULL COMMENT 'This is store reject request',
  `receipt_image` varchar(191) DEFAULT NULL COMMENT 'If status: approved (1) then upload receipt as proof',
  `device_type` varchar(191) DEFAULT NULL COMMENT '0 => Web, 1 => Android, 2 => IOS',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bl_admins`
--
ALTER TABLE `bl_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_admin_tokens`
--
ALTER TABLE `bl_admin_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_api_call_tracking`
--
ALTER TABLE `bl_api_call_tracking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_call_tracking_api_name_source_unique` (`api_name`,`source`);

--
-- Indexes for table `bl_app_usages`
--
ALTER TABLE `bl_app_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_area`
--
ALTER TABLE `bl_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_brands`
--
ALTER TABLE `bl_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_carts`
--
ALTER TABLE `bl_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_cart_notifications`
--
ALTER TABLE `bl_cart_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_notifications_user_id_foreign` (`user_id`),
  ADD KEY `cart_notifications_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `bl_categories`
--
ALTER TABLE `bl_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_chat`
--
ALTER TABLE `bl_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_cities`
--
ALTER TABLE `bl_cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_countries`
--
ALTER TABLE `bl_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_customer_feedback`
--
ALTER TABLE `bl_customer_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_delivery_boys`
--
ALTER TABLE `bl_delivery_boys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_delivery_boy_notifications`
--
ALTER TABLE `bl_delivery_boy_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_delivery_boy_transactions`
--
ALTER TABLE `bl_delivery_boy_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_devices`
--
ALTER TABLE `bl_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_emails`
--
ALTER TABLE `bl_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_email_templates`
--
ALTER TABLE `bl_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_failed_jobs`
--
ALTER TABLE `bl_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `bl_faqs`
--
ALTER TABLE `bl_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_farm_preneurs`
--
ALTER TABLE `bl_farm_preneurs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_favorites`
--
ALTER TABLE `bl_favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_feature_products`
--
ALTER TABLE `bl_feature_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_fund_transfers`
--
ALTER TABLE `bl_fund_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_invoice`
--
ALTER TABLE `bl_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_jobs`
--
ALTER TABLE `bl_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `bl_languages`
--
ALTER TABLE `bl_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_live_tracking`
--
ALTER TABLE `bl_live_tracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_tracking_order_id_foreign` (`order_id`);

--
-- Indexes for table `bl_mail_settings`
--
ALTER TABLE `bl_mail_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_media`
--
ALTER TABLE `bl_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_migrations`
--
ALTER TABLE `bl_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_model_has_permissions`
--
ALTER TABLE `bl_model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `bl_model_has_roles`
--
ALTER TABLE `bl_model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `bl_newsletters`
--
ALTER TABLE `bl_newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_notifications`
--
ALTER TABLE `bl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_oauth_access_tokens`
--
ALTER TABLE `bl_oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `bl_oauth_auth_codes`
--
ALTER TABLE `bl_oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `bl_oauth_clients`
--
ALTER TABLE `bl_oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `bl_oauth_personal_access_clients`
--
ALTER TABLE `bl_oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_oauth_refresh_tokens`
--
ALTER TABLE `bl_oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `bl_offers`
--
ALTER TABLE `bl_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_orders`
--
ALTER TABLE `bl_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_order_bank_transfers`
--
ALTER TABLE `bl_order_bank_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_order_items`
--
ALTER TABLE `bl_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_user_id_index` (`user_id`);

--
-- Indexes for table `bl_order_statuses`
--
ALTER TABLE `bl_order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_order_status_lists`
--
ALTER TABLE `bl_order_status_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_order_trackings`
--
ALTER TABLE `bl_order_trackings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_panel_notifications`
--
ALTER TABLE `bl_panel_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `panel_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `bl_password_resets`
--
ALTER TABLE `bl_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `bl_payments`
--
ALTER TABLE `bl_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_payment_requests`
--
ALTER TABLE `bl_payment_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_permissions`
--
ALTER TABLE `bl_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_permission_categories`
--
ALTER TABLE `bl_permission_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_personal_access_tokens`
--
ALTER TABLE `bl_personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `bl_pickup_locations`
--
ALTER TABLE `bl_pickup_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_pincodes`
--
ALTER TABLE `bl_pincodes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_plans`
--
ALTER TABLE `bl_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_pos_additional_charges`
--
ALTER TABLE `bl_pos_additional_charges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_pos_orders`
--
ALTER TABLE `bl_pos_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_pos_order_items`
--
ALTER TABLE `bl_pos_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_pos_users`
--
ALTER TABLE `bl_pos_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_products`
--
ALTER TABLE `bl_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_product_images`
--
ALTER TABLE `bl_product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_product_ratings`
--
ALTER TABLE `bl_product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ratings_product_id_user_id_unique` (`product_id`,`user_id`);

--
-- Indexes for table `bl_product_tag`
--
ALTER TABLE `bl_product_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_tag_product_id_tag_id_unique` (`product_id`,`tag_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `bl_product_variants`
--
ALTER TABLE `bl_product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_promo_codes`
--
ALTER TABLE `bl_promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_purchase_requests`
--
ALTER TABLE `bl_purchase_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_rating_images`
--
ALTER TABLE `bl_rating_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_return_requests`
--
ALTER TABLE `bl_return_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `return_requests_order_item_id_unique` (`order_item_id`);

--
-- Indexes for table `bl_roles`
--
ALTER TABLE `bl_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_role_has_permissions`
--
ALTER TABLE `bl_role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `bl_sections`
--
ALTER TABLE `bl_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_sellers`
--
ALTER TABLE `bl_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_seller_commissions`
--
ALTER TABLE `bl_seller_commissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_seller_transactions`
--
ALTER TABLE `bl_seller_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_seller_wallet_transactions`
--
ALTER TABLE `bl_seller_wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_sessions`
--
ALTER TABLE `bl_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `bl_settings`
--
ALTER TABLE `bl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_sliders`
--
ALTER TABLE `bl_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_sms_templates`
--
ALTER TABLE `bl_sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_sms_verifications`
--
ALTER TABLE `bl_sms_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_social_media`
--
ALTER TABLE `bl_social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_stock_notify`
--
ALTER TABLE `bl_stock_notify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_stories`
--
ALTER TABLE `bl_stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_sub_categories`
--
ALTER TABLE `bl_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_supported_languages`
--
ALTER TABLE `bl_supported_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_tags`
--
ALTER TABLE `bl_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indexes for table `bl_taxes`
--
ALTER TABLE `bl_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_time_slots`
--
ALTER TABLE `bl_time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_transactions`
--
ALTER TABLE `bl_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_index` (`user_id`),
  ADD KEY `transactions_order_id_index` (`order_id`);

--
-- Indexes for table `bl_units`
--
ALTER TABLE `bl_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_updates`
--
ALTER TABLE `bl_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_users`
--
ALTER TABLE `bl_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `bl_user_plans`
--
ALTER TABLE `bl_user_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_user_tokens`
--
ALTER TABLE `bl_user_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_wallet_point_transactions`
--
ALTER TABLE `bl_wallet_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_wallet_transactions`
--
ALTER TABLE `bl_wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bl_web_seo_pages`
--
ALTER TABLE `bl_web_seo_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `web_seo_pages_page_type_unique` (`page_type`);

--
-- Indexes for table `bl_withdrawal_requests`
--
ALTER TABLE `bl_withdrawal_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bl_admins`
--
ALTER TABLE `bl_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `bl_admin_tokens`
--
ALTER TABLE `bl_admin_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `bl_api_call_tracking`
--
ALTER TABLE `bl_api_call_tracking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bl_app_usages`
--
ALTER TABLE `bl_app_usages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `bl_area`
--
ALTER TABLE `bl_area`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_brands`
--
ALTER TABLE `bl_brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_carts`
--
ALTER TABLE `bl_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=936;

--
-- AUTO_INCREMENT for table `bl_cart_notifications`
--
ALTER TABLE `bl_cart_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_categories`
--
ALTER TABLE `bl_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bl_chat`
--
ALTER TABLE `bl_chat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `bl_cities`
--
ALTER TABLE `bl_cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bl_countries`
--
ALTER TABLE `bl_countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `bl_customer_feedback`
--
ALTER TABLE `bl_customer_feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bl_delivery_boys`
--
ALTER TABLE `bl_delivery_boys`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bl_delivery_boy_notifications`
--
ALTER TABLE `bl_delivery_boy_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_delivery_boy_transactions`
--
ALTER TABLE `bl_delivery_boy_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `bl_devices`
--
ALTER TABLE `bl_devices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_emails`
--
ALTER TABLE `bl_emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_email_templates`
--
ALTER TABLE `bl_email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bl_failed_jobs`
--
ALTER TABLE `bl_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_faqs`
--
ALTER TABLE `bl_faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bl_farm_preneurs`
--
ALTER TABLE `bl_farm_preneurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bl_favorites`
--
ALTER TABLE `bl_favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `bl_feature_products`
--
ALTER TABLE `bl_feature_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bl_fund_transfers`
--
ALTER TABLE `bl_fund_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bl_invoice`
--
ALTER TABLE `bl_invoice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_jobs`
--
ALTER TABLE `bl_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bl_languages`
--
ALTER TABLE `bl_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bl_live_tracking`
--
ALTER TABLE `bl_live_tracking`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `bl_mail_settings`
--
ALTER TABLE `bl_mail_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT for table `bl_media`
--
ALTER TABLE `bl_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bl_migrations`
--
ALTER TABLE `bl_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `bl_newsletters`
--
ALTER TABLE `bl_newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_notifications`
--
ALTER TABLE `bl_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_oauth_clients`
--
ALTER TABLE `bl_oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bl_oauth_personal_access_clients`
--
ALTER TABLE `bl_oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bl_offers`
--
ALTER TABLE `bl_offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bl_orders`
--
ALTER TABLE `bl_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `bl_order_bank_transfers`
--
ALTER TABLE `bl_order_bank_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_order_items`
--
ALTER TABLE `bl_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `bl_order_statuses`
--
ALTER TABLE `bl_order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;

--
-- AUTO_INCREMENT for table `bl_order_status_lists`
--
ALTER TABLE `bl_order_status_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bl_order_trackings`
--
ALTER TABLE `bl_order_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_payments`
--
ALTER TABLE `bl_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_payment_requests`
--
ALTER TABLE `bl_payment_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_permissions`
--
ALTER TABLE `bl_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `bl_permission_categories`
--
ALTER TABLE `bl_permission_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bl_personal_access_tokens`
--
ALTER TABLE `bl_personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_pickup_locations`
--
ALTER TABLE `bl_pickup_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_pincodes`
--
ALTER TABLE `bl_pincodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_plans`
--
ALTER TABLE `bl_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bl_pos_additional_charges`
--
ALTER TABLE `bl_pos_additional_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_pos_orders`
--
ALTER TABLE `bl_pos_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_pos_order_items`
--
ALTER TABLE `bl_pos_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_pos_users`
--
ALTER TABLE `bl_pos_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bl_products`
--
ALTER TABLE `bl_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `bl_product_images`
--
ALTER TABLE `bl_product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `bl_product_ratings`
--
ALTER TABLE `bl_product_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_product_tag`
--
ALTER TABLE `bl_product_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bl_product_variants`
--
ALTER TABLE `bl_product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `bl_promo_codes`
--
ALTER TABLE `bl_promo_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_purchase_requests`
--
ALTER TABLE `bl_purchase_requests`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bl_rating_images`
--
ALTER TABLE `bl_rating_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_return_requests`
--
ALTER TABLE `bl_return_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_roles`
--
ALTER TABLE `bl_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bl_sections`
--
ALTER TABLE `bl_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bl_sellers`
--
ALTER TABLE `bl_sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `bl_seller_commissions`
--
ALTER TABLE `bl_seller_commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `bl_seller_transactions`
--
ALTER TABLE `bl_seller_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_seller_wallet_transactions`
--
ALTER TABLE `bl_seller_wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `bl_settings`
--
ALTER TABLE `bl_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `bl_sliders`
--
ALTER TABLE `bl_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bl_sms_templates`
--
ALTER TABLE `bl_sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bl_sms_verifications`
--
ALTER TABLE `bl_sms_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_social_media`
--
ALTER TABLE `bl_social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_stock_notify`
--
ALTER TABLE `bl_stock_notify`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `bl_stories`
--
ALTER TABLE `bl_stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bl_sub_categories`
--
ALTER TABLE `bl_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_supported_languages`
--
ALTER TABLE `bl_supported_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `bl_tags`
--
ALTER TABLE `bl_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bl_taxes`
--
ALTER TABLE `bl_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_time_slots`
--
ALTER TABLE `bl_time_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `bl_transactions`
--
ALTER TABLE `bl_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bl_units`
--
ALTER TABLE `bl_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `bl_updates`
--
ALTER TABLE `bl_updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_users`
--
ALTER TABLE `bl_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `bl_user_plans`
--
ALTER TABLE `bl_user_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_user_tokens`
--
ALTER TABLE `bl_user_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `bl_wallet_point_transactions`
--
ALTER TABLE `bl_wallet_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT for table `bl_wallet_transactions`
--
ALTER TABLE `bl_wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `bl_web_seo_pages`
--
ALTER TABLE `bl_web_seo_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bl_withdrawal_requests`
--
ALTER TABLE `bl_withdrawal_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bl_cart_notifications`
--
ALTER TABLE `bl_cart_notifications`
  ADD CONSTRAINT `cart_notifications_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `bl_carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `bl_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bl_live_tracking`
--
ALTER TABLE `bl_live_tracking`
  ADD CONSTRAINT `live_tracking_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `bl_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bl_model_has_permissions`
--
ALTER TABLE `bl_model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `bl_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bl_model_has_roles`
--
ALTER TABLE `bl_model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `bl_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bl_product_tag`
--
ALTER TABLE `bl_product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `bl_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `bl_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bl_role_has_permissions`
--
ALTER TABLE `bl_role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `bl_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `bl_roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
