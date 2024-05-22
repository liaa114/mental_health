-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jan 2024 pada 17.40
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mhealthdb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add consultation', 7, 'add_consultation'),
(26, 'Can change consultation', 7, 'change_consultation'),
(27, 'Can delete consultation', 7, 'delete_consultation'),
(28, 'Can view consultation', 7, 'view_consultation'),
(29, 'Can add patient', 8, 'add_patient'),
(30, 'Can change patient', 8, 'change_patient'),
(31, 'Can delete patient', 8, 'delete_patient'),
(32, 'Can view patient', 8, 'view_patient'),
(33, 'Can add psychologist', 9, 'add_psychologist'),
(34, 'Can change psychologist', 9, 'change_psychologist'),
(35, 'Can delete psychologist', 9, 'delete_psychologist'),
(36, 'Can view psychologist', 9, 'view_psychologist'),
(37, 'Can add rating', 10, 'add_rating'),
(38, 'Can change rating', 10, 'change_rating'),
(39, 'Can delete rating', 10, 'delete_rating'),
(40, 'Can view rating', 10, 'view_rating'),
(41, 'Can add chat', 11, 'add_chat'),
(42, 'Can change chat', 11, 'change_chat'),
(43, 'Can delete chat', 11, 'delete_chat'),
(44, 'Can view chat', 11, 'view_chat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$z9Al97AJUeFHuJ1xzYhUx5$zs8v4U94q4MM79jztNNcCX9X4QfhW4W2MmE9SAY8Yeg=', '2023-12-19 09:30:10.473226', 1, 'admin', '', '', 'admin1@gmail.com', 1, 1, '2023-12-17 15:58:09.625569'),
(2, 'pbkdf2_sha256$600000$ZmUNsHvbvtUPkWhGdLJFrg$AuP33Um/ngWsNmojjanvUieXUmGFqwsKZFk7nWL1MAI=', '2024-01-06 06:51:30.548997', 0, 'Emilia', 'Emilia', 'Fresia Nandela, M.Psi.', 'emiliafn@gmail.com', 0, 1, '2023-12-17 15:59:09.000000'),
(3, 'pbkdf2_sha256$600000$zkfAsWNV3HzP2xYqEwvJN4$SAFBU+KSW6RWHBJ7fb1LSz3NzLNJvR9sG3FBnfLr4k4=', '2024-01-03 09:14:31.704473', 0, 'Agustian', '', '', '', 0, 1, '2023-12-17 16:03:20.643773'),
(4, 'pbkdf2_sha256$600000$JX3amSChjbm9fJRio5oUuM$hg6F38GtC+GQweaD+0WTmUOMT8MQEYdAyM13+qckXPg=', NULL, 0, 'Leonni', 'Fitriah', 'Leonni, M.Psi.', 'leonni@gmail.com', 0, 1, '2023-12-17 19:40:00.000000'),
(5, 'pbkdf2_sha256$600000$GzhsMOmxil7WzKRoIdkays$ClNczlBJx9msJV9I9rsiqxnKHP3iHbzDGmZfbmLp3lI=', NULL, 0, 'Alfina', 'Alfina', 'Agustin, M.Psi.', 'alfina@gmail.com', 0, 1, '2023-12-17 19:40:36.000000'),
(6, 'pbkdf2_sha256$600000$k4ebtN3F935DqjYcD0WXZ9$idx9rX3CrEXZB4HGL3aB0+Dp0Ckn+JMH9TmvKuYjwBo=', NULL, 0, 'Rama', 'Rama', 'Julika, M.Psi.', 'rama@gmail.com', 0, 1, '2023-12-17 19:41:00.000000'),
(7, 'pbkdf2_sha256$600000$UzRfNetedNO2ydbVu9QF2V$0AvKNApJgW5pYeuM4VtHN5JhqomU6xfd+M48X4KDmZ0=', NULL, 0, 'Nerin', 'Nerin', 'Kalyana Putri, M.Psi', 'nerin@gmail.com', 0, 1, '2023-12-17 19:41:18.000000'),
(8, 'pbkdf2_sha256$600000$C8vBsI9xXb0dFyoGhVvZ85$wjXcoWgAM99GXDJBm8lHxv3ticp7hxzrdd23Q34kuuo=', '2023-12-22 01:58:48.253141', 0, 'Alif', 'Alif', 'Gween, M.Psi.', 'alif@gmail.com', 0, 1, '2023-12-17 19:41:38.000000'),
(9, 'pbkdf2_sha256$600000$TF7NsJQpZcaYfhV4E6g44Y$egYQUW91ICHsK8Gk7LVqjXI5X7uPCnUTOvUet6xfdoE=', NULL, 0, 'Meiza', 'Meiza', 'Anggraini, M.Psi.', 'meiza@gmail.com', 0, 1, '2023-12-17 19:41:56.000000'),
(10, 'pbkdf2_sha256$600000$GxQHnZAYJX8D0jwdPQ9yx3$FgYQ/uR5VTZr6XRdMIYZNH8pQM2NKDhfIcz3y/O1FdE=', NULL, 0, 'Amel', 'Amel', 'Arifin, M.Psi.', 'amel@gmail.com', 0, 1, '2023-12-17 19:42:17.000000'),
(11, 'pbkdf2_sha256$600000$WAOEVr3Rtb7yW57VtLFwmR$KaXDgYT1T34FM2B0M6s2GWnxHTaHWUd9l2vjaeKNsNM=', NULL, 0, 'Imelda', 'Imelda', 'Wijar, M.Psi.', 'imelda@gmail.com', 0, 1, '2023-12-17 19:42:39.000000'),
(12, 'pbkdf2_sha256$600000$zrNOa85dNbGsaOkqzApPy6$XGeYaulRBKusWLWc16u7oEXBLGBGl3/IqmhsuOHicsE=', '2024-01-06 07:12:20.179761', 0, 'Zello', 'Ahmad', 'Zello Saputra, M.Psi.', 'zello@gmail.com', 0, 1, '2023-12-17 19:43:00.000000'),
(13, 'pbkdf2_sha256$600000$pmrtVD85kK8BLdp1wf2BTo$TuuUEbkJsnZWdXRbEkJ5lUxpv7kRSsrjULQDr/NOeCc=', '2023-12-22 02:01:39.054972', 0, 'Tegar', 'tegar', 'agustian', 'agustian@gmail.com', 0, 1, '2023-12-21 23:39:19.127200'),
(14, 'pbkdf2_sha256$600000$0GPYlHi8bEKlRgafg1VE7z$jK2r0S3UiXKuy+I0m6WAm5u8XeatLD4NqBe8fJJ0rI4=', '2023-12-22 01:53:13.944346', 0, 'Lia', 'Lia', 'Nandela', 'Lia@gmail.com', 0, 1, '2023-12-22 01:52:51.541178'),
(15, 'pbkdf2_sha256$600000$3DQofXVG4lyjL5a4fktcoP$qS/vYN4EuEQvTYaAJAnDlmlXLRTrLtt0ZDupKpCqL/k=', '2024-01-06 07:03:56.923843', 0, 'Wavi', 'Wavi', 'Mekka Evano', 'mekkaevano_wavi@gmail.com', 0, 1, '2024-01-06 07:03:42.418547');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-12-17 15:59:10.474813', '2', 'Emilia', 1, '[{\"added\": {}}]', 4, 1),
(2, '2023-12-17 16:00:02.282424', '2', 'Emilia', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(3, '2023-12-17 16:02:08.715044', '1', 'Emilia', 1, '[{\"added\": {}}]', 9, 1),
(4, '2023-12-17 16:02:13.385659', '1', 'Emilia', 2, '[{\"changed\": {\"fields\": [\"Educations2\"]}}]', 9, 1),
(5, '2023-12-17 19:40:01.385179', '4', 'Leonni', 1, '[{\"added\": {}}]', 4, 1),
(6, '2023-12-17 19:40:13.504432', '4', 'Leonni', 2, '[]', 4, 1),
(7, '2023-12-17 19:40:37.017492', '5', 'Alfina', 1, '[{\"added\": {}}]', 4, 1),
(8, '2023-12-17 19:40:46.513942', '5', 'Alfina', 2, '[]', 4, 1),
(9, '2023-12-17 19:41:01.343815', '6', 'Rama', 1, '[{\"added\": {}}]', 4, 1),
(10, '2023-12-17 19:41:04.794373', '6', 'Rama', 2, '[]', 4, 1),
(11, '2023-12-17 19:41:19.284513', '7', 'Nerin', 1, '[{\"added\": {}}]', 4, 1),
(12, '2023-12-17 19:41:22.674712', '7', 'Nerin', 2, '[]', 4, 1),
(13, '2023-12-17 19:41:39.368510', '8', 'Alif', 1, '[{\"added\": {}}]', 4, 1),
(14, '2023-12-17 19:41:42.835304', '8', 'Alif', 2, '[]', 4, 1),
(15, '2023-12-17 19:41:56.820850', '9', 'Meiza', 1, '[{\"added\": {}}]', 4, 1),
(16, '2023-12-17 19:42:02.124620', '9', 'Meiza', 2, '[]', 4, 1),
(17, '2023-12-17 19:42:18.076151', '10', 'Amel', 1, '[{\"added\": {}}]', 4, 1),
(18, '2023-12-17 19:42:26.770286', '10', 'Amel', 2, '[]', 4, 1),
(19, '2023-12-17 19:42:40.393966', '11', 'Imelda', 1, '[{\"added\": {}}]', 4, 1),
(20, '2023-12-17 19:42:44.206002', '11', 'Imelda', 2, '[]', 4, 1),
(21, '2023-12-17 19:43:00.846691', '12', 'Zello', 1, '[{\"added\": {}}]', 4, 1),
(22, '2023-12-17 19:43:09.898032', '12', 'Zello', 2, '[]', 4, 1),
(23, '2023-12-17 19:46:03.654026', '2', 'Imelda', 1, '[{\"added\": {}}]', 9, 1),
(24, '2023-12-17 19:47:57.290721', '3', 'Zello', 1, '[{\"added\": {}}]', 9, 1),
(25, '2023-12-17 19:50:01.195879', '4', 'Rama', 1, '[{\"added\": {}}]', 9, 1),
(26, '2023-12-17 19:52:40.295103', '5', 'Nerin', 1, '[{\"added\": {}}]', 9, 1),
(27, '2023-12-17 19:54:49.233308', '6', 'Meiza', 1, '[{\"added\": {}}]', 9, 1),
(28, '2023-12-17 19:56:53.446326', '7', 'Leonni', 1, '[{\"added\": {}}]', 9, 1),
(29, '2023-12-17 19:59:06.826004', '8', 'Amel', 1, '[{\"added\": {}}]', 9, 1),
(30, '2023-12-17 20:00:37.212710', '9', 'Alif', 1, '[{\"added\": {}}]', 9, 1),
(31, '2023-12-17 20:02:03.709774', '10', 'Alfina', 1, '[{\"added\": {}}]', 9, 1),
(32, '2023-12-17 20:03:20.449872', '10', 'Alfina', 2, '[{\"changed\": {\"fields\": [\"Photo\"]}}]', 9, 1),
(33, '2023-12-17 20:03:58.936297', '12', 'Zello', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(34, '2023-12-17 20:04:43.642074', '6', 'Rama', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(35, '2023-12-17 20:05:45.236772', '7', 'Nerin', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(36, '2023-12-17 20:06:27.734698', '5', 'Alfina', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(37, '2023-12-17 20:07:00.216708', '4', 'Leonni', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(38, '2023-12-17 20:07:48.765665', '11', 'Imelda', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(39, '2023-12-17 20:08:33.576512', '8', 'Alif', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(40, '2023-12-17 20:08:57.439688', '10', 'Amel', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(41, '2023-12-17 20:09:43.760927', '9', 'Meiza', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(42, '2023-12-19 09:30:39.245664', '12', 'Zello', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 4, 1),
(43, '2023-12-19 09:30:54.667094', '4', 'Leonni', 2, '[{\"changed\": {\"fields\": [\"Last name\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(11, 'mh_app', 'chat'),
(7, 'mh_app', 'consultation'),
(8, 'mh_app', 'patient'),
(9, 'mh_app', 'psychologist'),
(10, 'mh_app', 'rating'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-12-17 15:57:06.626828'),
(2, 'auth', '0001_initial', '2023-12-17 15:57:07.271042'),
(3, 'admin', '0001_initial', '2023-12-17 15:57:07.387470'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-12-17 15:57:07.402849'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-17 15:57:07.411445'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-12-17 15:57:07.474524'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-12-17 15:57:07.554855'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-12-17 15:57:07.575071'),
(9, 'auth', '0004_alter_user_username_opts', '2023-12-17 15:57:07.591545'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-12-17 15:57:07.666796'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-12-17 15:57:07.666796'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-12-17 15:57:07.682313'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-12-17 15:57:07.708891'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-12-17 15:57:07.729372'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-12-17 15:57:07.745253'),
(16, 'auth', '0011_update_proxy_permissions', '2023-12-17 15:57:07.772917'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-12-17 15:57:07.796370'),
(18, 'mh_app', '0001_initial', '2023-12-17 15:57:08.628615'),
(19, 'sessions', '0001_initial', '2023-12-17 15:57:08.706406'),
(20, 'mh_app', '0002_consultation_payment_proof', '2023-12-21 19:04:49.279777');

-- --------------------------------------------------------

--
-- Struktur dari tabel `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5jlkdw8fuarcwb9mg864irv37vkbcobo', '.eJxVjr0OgkAQhN9layBwB-LZaWdhZ2JhDNm7XX6UcIY7CkN4dw9joc0UO_PN7AwVTr6tJsdj1RHsIJMQ_R41mgcPq0N3HBqbGDv4sdPJGkm-rktOlrg_fLN_BS26NtCIW6y5plJioVGqtFSco8IsqFBbWeSpMrVJS0KjStwQFUxSay5MzlqoUGpH4tHB7jrD071Ma3vbdM5__s4iIPQchkQqZJyJWIiAOI9-Cghc9sczLLflDb_ITq8:1rGUtG:qxYgqb8MQ4_MCX1kDUaMjDTtEkcjtnFepp_6IS2fBCw', '2024-01-05 02:03:54.279719'),
('6bxsx91dxtzd9zg1xynpe8ak30uau4l9', '.eJxVjEEOwiAQRe_C2hCgFBiX7j0DmWFAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWgzj9boTpkdsO-I7tNss0t3WZSO6KPGiX15nz83K4fwcVe_3WoWSVgALphAiDtVkxWPAuedbsNIEjD74EY8pYPFkuGiGpbJBG57V4fwD4kThJ:1rGUx2:bz0D9BWFz24U6uXY8sH1ktxXiMrXzgpH66MklYPPMdQ', '2024-01-05 02:07:48.384801'),
('8uxxj0vaqtxqr56q1fa4l7bi5rs4kq9b', '.eJxVjDsOgzAQRO_iOrKM8Tdles5g7a6XmCQyEoYqyt0DEkVSzrw38xYJtrWkrfGSpiyuQovLb4dAT64HyA-o91nSXNdlQnko8qRNDnPm1-10_w4KtLKvrYpsyTpN2XRjdjb43irPRNgFANYBEEfvvTEYFWcwwRmjex_3GLQWny_jDDd_:1rFYjd:NtpaJfRY8JqU3nfmzlaVk1caS6TZwEKv-8Uqpuvxh2c', '2024-01-02 11:58:05.161939'),
('9jn1ygs0i5zwuhu8q39iy6euym29iub1', '.eJxVjMsOwiAQRf-FtSHlDS7d-w1kmAGpGkhKuzL-uzbpQrf3nHNfLMK21riNvMSZ2Jl5dvrdEuAjtx3QHdqtc-xtXebEd4UfdPBrp_y8HO7fQYVRv3XAYrWTViargpJFOQcme6Ci7CS1tsFomrzwGEA4jyS9ppCENohJGmDvD8LENyo:1rGUoK:-ovcLv_LjgzYXKBk6AEtmcE0WKi_MVavF5oNIDj8cg4', '2024-01-05 01:58:48.174468'),
('bxcj89p2nno3qka30uumx25udbdlqipc', '.eJxVjDsOwyAQBe9CHSEDy0cp0-cMaM2ywUkEkrErK3ePLblI2pl5bxMR16XEtec5TiSuQmlx-YUjpleuh6En1keTqdVlnkZ5JPK0Xd4b5fftbP8OCvayr7ViTgCKrPUG0BhI2pF2PpB3QRm2WSMzwMA4sAsJggdLkMnswKL4fAHxdDfW:1rM0qy:dCpNBcOH8tp7GmtGY2-_NrOdMRYsZ2KKXFYFI-PXHM0', '2024-01-20 07:12:20.182481'),
('d6a9f3mscrjq5fr1z9gazzalrv1do9x6', '.eJxVjjEPgjAUhP_Lm5HQgpSy6ebgZuJgDHntawE11NAyGMJ_txgHXe_uu7sZGpxC10zejE1PUEMOya-mUN_NsBp0w6F1qXZDGHuVrpH06_r06Mg89t_sX0GHvot0ZU2mpaoU04gyLwqTkSykKLUgRiVTslRCCltxbrdWqIIsQ6kzw1FtS8FiqRvJjB7qywxP_9Kde7i29-FzmyVAGEwc4hnPN4xvWBURHzBMEYHz7nCC5bq8ASd3TXU:1rEud8:HVQdfmBL9paJaKLe_Uy7APst4XLwCCU4xl6OIptsX88', '2023-12-31 17:08:42.955228'),
('q25j08ex3o0bhtlkmtsdrr9veua2xtz7', '.eJxVjDsOgzAQRO_iOrKM8Tdles5g7a6XmCQyEoYqyt0DEkVSzrw38xYJtrWkrfGSpiyuQovLb4dAT64HyA-o91nSXNdlQnko8qRNDnPm1-10_w4KtLKvrYpsyTpN2XRjdjb43irPRNgFANYBEEfvvTEYFWcwwRmjex_3GLQWny_jDDd_:1rGUlx:ocN9TqZCQgJ5YXzVuOMvUl08t8c7KSZ2urdWSVo7-Dw', '2024-01-05 01:56:21.477317'),
('rwhr19a2vmccyb6trprynlgsnknh5ysa', '.eJxVjjsPwjAMhP-LZ1rlQVLaDTYGNiQGhCrXcR-AGtSkA0L8dwJiAOkm3313fkCNc-zrOfBUDw4qkAYWv8cG6cLj23FnHDufkx_jNDT5O5J_3ZDvvOPr5pv9K-gx9IletaQVS1LKoClM2UqhLUtNzFS2hWhWS8EGnSErUJGxJqlokK2wJDWnUj85ngJUxwfcwp16f_XdEOLnb70Ah5HTkBJqmQmZiSIhIWKcEwKH9XYPz9PzBSB7TSc:1rM0oG:_HVf31op1M3bFY5WaId2zty7fsY1_Df2iYGhX3tUgdU', '2024-01-20 07:09:32.923518'),
('sx6i1dn71ojx8722kbp2vwlvu7r4ire1', '.eJxVjDsOgzAQRO_iOrKM8Tdles5g7a6XmCQyEoYqyt0DEkVSzrw38xYJtrWkrfGSpiyuQovLb4dAT64HyA-o91nSXNdlQnko8qRNDnPm1-10_w4KtLKvrYpsyTpN2XRjdjb43irPRNgFANYBEEfvvTEYFWcwwRmjex_3GLQWny_jDDd_:1rGUKk:ZjxRS_nP1hywzjwrJCHCkIi6er8jYJ_D_AMmgZMTG8Y', '2024-01-05 01:28:14.080829'),
('th1uo416nlfyqatsxk6c73ag75qvvo7g', '.eJxVjDsOwyAQBe9CHSEDy0cp0-cMaM2ywUkEkrErK3ePLblI2pl5bxMR16XEtec5TiSuQmlx-YUjpleuh6En1keTqdVlnkZ5JPK0Xd4b5fftbP8OCvayr7ViTgCKrPUG0BhI2pF2PpB3QRm2WSMzwMA4sAsJggdLkMnswKL4fAHxdDfW:1rM0d4:h1MN5vfmimSLi7pv8VbMBKDu1cWSTLwDwkEJLz-UAVA', '2024-01-20 06:57:58.604386');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_app_chat`
--

CREATE TABLE `mh_app_chat` (
  `chat_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `time` datetime(6) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mh_app_chat`
--

INSERT INTO `mh_app_chat` (`chat_id`, `content`, `time`, `consultation_id`, `receiver_id`, `sender_id`) VALUES
(1, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-17 16:04:39.322680', 1, 3, 2),
(2, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-17 17:08:48.354232', 2, 3, 2),
(3, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-19 11:56:09.549621', 4, 3, 2),
(4, 'hallo', '2023-12-19 11:57:08.811633', 4, 2, 3),
(5, 'saya ingin bercerita', '2023-12-19 11:57:17.854900', 4, 2, 3),
(6, 'ok', '2023-12-19 11:58:32.925563', 4, 3, 2),
(7, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-21 18:30:50.748627', 6, 3, 2),
(8, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-21 20:12:55.733686', 8, 3, 2),
(9, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-21 23:41:07.692286', 15, 13, 2),
(10, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-22 01:57:14.985589', 9, 3, 2),
(11, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2023-12-22 01:59:07.179179', 17, 14, 8),
(12, 'hallo saya ingin melakukan konsultasi', '2023-12-22 01:59:48.405436', 17, 8, 14),
(13, 'ya silahkan', '2023-12-22 02:00:04.435536', 17, 14, 8),
(14, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2024-01-06 06:56:21.731137', 11, 3, 2),
(15, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2024-01-06 06:56:33.181565', 11, 3, 2),
(16, 'Your consultation request has been accepted. We\'ll get in touch soon.', '2024-01-06 07:11:40.602314', 20, 15, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_app_consultation`
--

CREATE TABLE `mh_app_consultation` (
  `cons_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `rating_given` tinyint(1) NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  `psychologist_id` bigint(20) NOT NULL,
  `payment_proof` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mh_app_consultation`
--

INSERT INTO `mh_app_consultation` (`cons_id`, `date`, `status`, `date_created`, `rating_given`, `patient_id`, `psychologist_id`, `payment_proof`) VALUES
(1, '2023-12-17', 'FIN_ACCEPTED', '2023-12-17 16:04:16.609988', 1, 1, 1, NULL),
(2, '2023-12-18', 'FIN_ACCEPTED', '2023-12-17 17:08:36.146751', 1, 1, 1, NULL),
(3, '2023-12-17', 'FIN_REJECTED', '2023-12-17 17:11:25.653930', 0, 1, 1, NULL),
(4, '2023-12-19', 'FIN_ACCEPTED', '2023-12-19 09:31:57.810166', 1, 1, 1, NULL),
(5, '2023-12-19', 'WAIT', '2023-12-19 09:32:20.989726', 0, 1, 5, NULL),
(6, '2023-12-19', 'FIN_ACCEPTED', '2023-12-19 11:53:32.712300', 1, 1, 1, ''),
(7, '2023-12-21', 'FIN_REJECTED', '2023-12-21 08:07:12.777230', 0, 1, 1, NULL),
(8, '2023-12-21', 'FIN_ACCEPTED', '2023-12-21 18:39:47.610460', 1, 1, 1, ''),
(9, '2023-12-21', 'FIN_ACCEPTED', '2023-12-21 18:44:34.839365', 0, 1, 1, ''),
(10, '2023-12-22', 'FIN_REJECTED', '2023-12-21 18:47:22.228800', 0, 1, 1, ''),
(11, '2023-12-23', 'FIN_ACCEPTED', '2023-12-21 20:01:19.124495', 0, 1, 1, ''),
(12, '2023-12-21', 'FIN_REJECTED', '2023-12-21 20:04:37.007207', 0, 1, 1, ''),
(13, '2023-12-24', 'FIN_REJECTED', '2023-12-21 20:44:04.161358', 0, 1, 1, ''),
(14, '2023-12-25', 'FIN_REJECTED', '2023-12-21 20:48:43.022069', 0, 1, 1, ''),
(15, '2023-12-23', 'FIN_ACCEPTED', '2023-12-21 23:39:40.960495', 1, 2, 1, ''),
(16, '2023-12-22', 'FIN_REJECTED', '2023-12-22 01:20:24.062150', 0, 1, 1, ''),
(17, '2023-12-22', 'CONFIRMED', '2023-12-22 01:53:50.868791', 0, 3, 9, ''),
(18, '2023-12-22', 'FIN_REJECTED', '2023-12-22 02:03:17.442165', 0, 2, 1, ''),
(19, '2024-01-06', 'FIN_REJECTED', '2024-01-06 07:07:27.112978', 0, 4, 3, ''),
(20, '2024-01-07', 'FIN_ACCEPTED', '2024-01-06 07:09:25.188300', 0, 4, 3, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_app_patient`
--

CREATE TABLE `mh_app_patient` (
  `id` bigint(20) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mh_app_patient`
--

INSERT INTO `mh_app_patient` (`id`, `photo`, `phone`, `user_id`) VALUES
(1, 'patient/photos/tegar_u4mixbX.jpg', NULL, 3),
(2, 'patient/photos/download_5.jpeg', '828732613', 13),
(3, 'patient/photos/download_8.jpeg', '+627381738173', 14),
(4, 'patient/photos/download_17.jpeg', '+62123456789', 15);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_app_psychologist`
--

CREATE TABLE `mh_app_psychologist` (
  `id` bigint(20) NOT NULL,
  `cons_price` decimal(20,0) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `educations1` varchar(100) DEFAULT NULL,
  `educations2` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mh_app_psychologist`
--

INSERT INTO `mh_app_psychologist` (`id`, `cons_price`, `photo`, `phone`, `educations1`, `educations2`, `user_id`) VALUES
(1, 50000, 'psychologist/photos/Wanpeng_W0Sw64Z.jpeg', '+62098770109', 'Bachelor Psychologist Of The Indonesia University', 'Master Psychologist Of The Indonesia University', 2),
(2, 45000, 'psychologist/photos/download_6_o6E8agP.jpeg', '+62090877665', 'Bachelor Of The Indonesia University', 'Master Of The Telkom University', 11),
(3, 40000, 'psychologist/photos/The_Devil_Boss_TAMAT_rGn19M5.jpeg', '+62124556798', 'Bachelor  Psychologist Of The Gunadarma University', 'Master  Psychologist Of The Pelita Harapan University', 12),
(4, 35000, 'psychologist/photos/Corden_Mm2KRxU.jpeg', '+620827658811', 'Bachelor Psychologist Of The Yogyakarta Muhammadiyah University', 'Master Psychologist Of The Brawijaya University', 6),
(5, 35000, 'psychologist/photos/manusia_9GB8rmn.jpeg', '+622210887554', 'Bachelor Psychologist  Of The Surabaya University', 'Master Psychologist  Of The Tarumanagara University', 7),
(6, 30000, 'psychologist/photos/person_xFLRUJD.jpeg', '+628520871202', 'Bachelor Psychologist Of The Gunadarma University', 'Master Psychologist Of The Surabaya University', 9),
(7, 32000, 'psychologist/photos/download_0Wq3bua.jpeg', '+62068107200', 'Bachelor Psychologist Of The Telkom University', 'Master Psychologist Of The Pelita Harapan University', 4),
(8, 27000, 'psychologist/photos/doctor_IQU8akt.jpeg', '+62868219838', 'Bachelor Psychologist Of The Pelita Harapan University', 'Master Psychologist Of The Gunadarma University', 10),
(9, 38000, 'psychologist/photos/download_5_HJGPewv.jpeg', '+62078901722', 'Bachelor Psychologist Of The Telkom University', 'Master Psychologist Of The Yogyakarta University', 8),
(10, 35000, 'psychologist/photos/human_3wCAMGI.jpeg', '+62786567867', 'Bachelor Psychologist Of The Tarumanagara University', 'Master Psychologist Of The Telkom University', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mh_app_rating`
--

CREATE TABLE `mh_app_rating` (
  `rate_id` int(11) NOT NULL,
  `rate_value` varchar(20) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `patient_id` bigint(20) NOT NULL,
  `psychologist_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `mh_app_rating`
--

INSERT INTO `mh_app_rating` (`rate_id`, `rate_value`, `consultation_id`, `patient_id`, `psychologist_id`) VALUES
(1, 'Satisfied', 1, 1, 1),
(2, 'Satisfied', 2, 1, 1),
(3, 'Satisfied', 4, 1, 1),
(4, 'Satisfied', 6, 1, 1),
(5, 'Not Satisfied', 15, 2, 1),
(6, 'Satisfied', 8, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indeks untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indeks untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indeks untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indeks untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indeks untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indeks untuk tabel `mh_app_chat`
--
ALTER TABLE `mh_app_chat`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `mh_app_chat_consultation_id_e8cefef8_fk_mh_app_co` (`consultation_id`),
  ADD KEY `mh_app_chat_receiver_id_d0b55ed8_fk_auth_user_id` (`receiver_id`),
  ADD KEY `mh_app_chat_sender_id_f5ec7062_fk_auth_user_id` (`sender_id`);

--
-- Indeks untuk tabel `mh_app_consultation`
--
ALTER TABLE `mh_app_consultation`
  ADD PRIMARY KEY (`cons_id`),
  ADD KEY `mh_app_consultation_patient_id_b988fb73_fk_mh_app_patient_id` (`patient_id`),
  ADD KEY `mh_app_consultation_psychologist_id_99ee1f97_fk_mh_app_ps` (`psychologist_id`);

--
-- Indeks untuk tabel `mh_app_patient`
--
ALTER TABLE `mh_app_patient`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `mh_app_psychologist`
--
ALTER TABLE `mh_app_psychologist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `mh_app_rating`
--
ALTER TABLE `mh_app_rating`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `mh_app_rating_consultation_id_87fe4cc5_fk_mh_app_co` (`consultation_id`),
  ADD KEY `mh_app_rating_patient_id_a8e41da6_fk_mh_app_patient_id` (`patient_id`),
  ADD KEY `mh_app_rating_psychologist_id_8ef50e05_fk_mh_app_psychologist_id` (`psychologist_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `mh_app_chat`
--
ALTER TABLE `mh_app_chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `mh_app_consultation`
--
ALTER TABLE `mh_app_consultation`
  MODIFY `cons_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `mh_app_patient`
--
ALTER TABLE `mh_app_patient`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `mh_app_psychologist`
--
ALTER TABLE `mh_app_psychologist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `mh_app_rating`
--
ALTER TABLE `mh_app_rating`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `mh_app_chat`
--
ALTER TABLE `mh_app_chat`
  ADD CONSTRAINT `mh_app_chat_consultation_id_e8cefef8_fk_mh_app_co` FOREIGN KEY (`consultation_id`) REFERENCES `mh_app_consultation` (`cons_id`),
  ADD CONSTRAINT `mh_app_chat_receiver_id_d0b55ed8_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `mh_app_chat_sender_id_f5ec7062_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `mh_app_consultation`
--
ALTER TABLE `mh_app_consultation`
  ADD CONSTRAINT `mh_app_consultation_patient_id_b988fb73_fk_mh_app_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `mh_app_patient` (`id`),
  ADD CONSTRAINT `mh_app_consultation_psychologist_id_99ee1f97_fk_mh_app_ps` FOREIGN KEY (`psychologist_id`) REFERENCES `mh_app_psychologist` (`id`);

--
-- Ketidakleluasaan untuk tabel `mh_app_patient`
--
ALTER TABLE `mh_app_patient`
  ADD CONSTRAINT `mh_app_patient_user_id_5a082306_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `mh_app_psychologist`
--
ALTER TABLE `mh_app_psychologist`
  ADD CONSTRAINT `mh_app_psychologist_user_id_ee4e77ae_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ketidakleluasaan untuk tabel `mh_app_rating`
--
ALTER TABLE `mh_app_rating`
  ADD CONSTRAINT `mh_app_rating_consultation_id_87fe4cc5_fk_mh_app_co` FOREIGN KEY (`consultation_id`) REFERENCES `mh_app_consultation` (`cons_id`),
  ADD CONSTRAINT `mh_app_rating_patient_id_a8e41da6_fk_mh_app_patient_id` FOREIGN KEY (`patient_id`) REFERENCES `mh_app_patient` (`id`),
  ADD CONSTRAINT `mh_app_rating_psychologist_id_8ef50e05_fk_mh_app_psychologist_id` FOREIGN KEY (`psychologist_id`) REFERENCES `mh_app_psychologist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
