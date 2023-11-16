berikut source code lengkap nya. untuk mengetes tampilan hasil ini source codenya :

select s.id_mahasiswa, s.nama, s.Fakultas, s.NIM, s.id_jurusan, a.nama as jurusan, s.id_matakuliah, c.nama, c.kode as matakuliah, s.id_dosen, b.nama, b.NIDN as dosen
from tp_mahasiswa s 
inner join tr_jurusan a on a.id_jurusan = s.id_jurusan
inner join tp_dosen b on b.id_dosen = s.id_dosen

inner join tr_matakuliah c on c.id_matakuliah = s.id_matakuliah


--------------------------------------------------------------------------------------

/*
 Navicat Premium Data Transfer

 Source Server         : mariadb
 Source Server Type    : MariaDB
 Source Server Version : 100244 (10.2.44-MariaDB-1:10.2.44+maria~bionic-log)
 Source Host           : 127.0.0.1:23306
 Source Schema         : latihan 1

 Target Server Type    : MariaDB
 Target Server Version : 100244 (10.2.44-MariaDB-1:10.2.44+maria~bionic-log)
 File Encoding         : 65001

 Date: 16/11/2023 14:46:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tp_dosen
-- ----------------------------
DROP TABLE IF EXISTS `tp_dosen`;
CREATE TABLE `tp_dosen` (
  `id_dosen` int(10) NOT NULL,
  `nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NIDN` smallint(10) DEFAULT NULL,
  PRIMARY KEY (`id_dosen`) USING BTREE,
  KEY `NIDN` (`NIDN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp_dosen
-- ----------------------------
BEGIN;
INSERT INTO `tp_dosen` (`id_dosen`, `nama`, `NIDN`) VALUES (11, 'Bambang', 2022);
INSERT INTO `tp_dosen` (`id_dosen`, `nama`, `NIDN`) VALUES (12, 'Budi', 2023);
COMMIT;

-- ----------------------------
-- Table structure for tp_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `tp_mahasiswa`;
CREATE TABLE `tp_mahasiswa` (
  `id_mahasiswa` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Fakultas` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `NIM` int(10) NOT NULL,
  `id_jurusan` smallint(1) DEFAULT NULL,
  `id_matakuliah` smallint(1) DEFAULT NULL,
  `id_dosen` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_mahasiswa`),
  KEY `FK_tp_mahasiswa_tr_jurusan` (`id_jurusan`),
  KEY `FK_tp_mahasiswa_tr_matakuliah` (`id_matakuliah`),
  KEY `FK_tp_mahasiswa_tr_dosen` (`id_dosen`),
  CONSTRAINT `FK_tp_mahasiswa_tr_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tp_dosen` (`id_dosen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tp_mahasiswa_tr_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `tr_jurusan` (`id_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tp_mahasiswa_tr_matakuliah` FOREIGN KEY (`id_matakuliah`) REFERENCES `tr_matakuliah` (`id_matakuliah`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tp_mahasiswa
-- ----------------------------
BEGIN;
INSERT INTO `tp_mahasiswa` (`id_mahasiswa`, `nama`, `Fakultas`, `NIM`, `id_jurusan`, `id_matakuliah`, `id_dosen`) VALUES (22, 'Andi winato', 'MESIN', 2021, 14, 912, 12);
INSERT INTO `tp_mahasiswa` (`id_mahasiswa`, `nama`, `Fakultas`, `NIM`, `id_jurusan`, `id_matakuliah`, `id_dosen`) VALUES (88, 'Dava Wisda Putra', 'FASILKOM', 2022, 12, 911, 11);
COMMIT;

-- ----------------------------
-- Table structure for tr_jurusan
-- ----------------------------
DROP TABLE IF EXISTS `tr_jurusan`;
CREATE TABLE `tr_jurusan` (
  `id_jurusan` smallint(5) NOT NULL,
  `nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kode` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tr_jurusan
-- ----------------------------
BEGIN;
INSERT INTO `tr_jurusan` (`id_jurusan`, `nama`, `kode`) VALUES (12, 'Teknik Informatika', 'TI');
INSERT INTO `tr_jurusan` (`id_jurusan`, `nama`, `kode`) VALUES (13, 'Sistem Informasi', 'SI');
INSERT INTO `tr_jurusan` (`id_jurusan`, `nama`, `kode`) VALUES (14, 'Teknik Mesin', 'TM');
COMMIT;

-- ----------------------------
-- Table structure for tr_mahasiswa_jurusan
-- ----------------------------
DROP TABLE IF EXISTS `tr_mahasiswa_jurusan`;
CREATE TABLE `tr_mahasiswa_jurusan` (
  `id_mahasiswa_jurusan` int(10) NOT NULL,
  `id_mahasiswa` int(10) DEFAULT NULL,
  `id_jurusan` smallint(5) DEFAULT NULL,
  `id_dosen` int(10) DEFAULT NULL,
  `id_matakuliah` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`id_mahasiswa_jurusan`),
  KEY `FK_tr_mahasiswa_jurusan_tp_mahasiswa` (`id_mahasiswa`),
  KEY `FK_tr_mahasiswa_jurusan_tp_dosen` (`id_dosen`),
  KEY `FK_tr_mahasiswa_jurusan_tp_matakuliah` (`id_matakuliah`),
  KEY `FK_tr_mahasiswa_jurusan_tp_jurusan` (`id_jurusan`),
  CONSTRAINT `FK_tr_mahasiswa_jurusan_tp_dosen` FOREIGN KEY (`id_dosen`) REFERENCES `tp_dosen` (`id_dosen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tr_mahasiswa_jurusan_tp_jurusan` FOREIGN KEY (`id_jurusan`) REFERENCES `tr_jurusan` (`id_jurusan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tr_mahasiswa_jurusan_tp_mahasiswa` FOREIGN KEY (`id_mahasiswa`) REFERENCES `tp_mahasiswa` (`id_mahasiswa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tr_mahasiswa_jurusan_tp_matakuliah` FOREIGN KEY (`id_matakuliah`) REFERENCES `tr_matakuliah` (`id_matakuliah`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tr_mahasiswa_jurusan
-- ----------------------------
BEGIN;
INSERT INTO `tr_mahasiswa_jurusan` (`id_mahasiswa_jurusan`, `id_mahasiswa`, `id_jurusan`, `id_dosen`, `id_matakuliah`) VALUES (1, 22, 14, 12, 912);
INSERT INTO `tr_mahasiswa_jurusan` (`id_mahasiswa_jurusan`, `id_mahasiswa`, `id_jurusan`, `id_dosen`, `id_matakuliah`) VALUES (2, 88, 13, 11, 911);
COMMIT;

-- ----------------------------
-- Table structure for tr_matakuliah
-- ----------------------------
DROP TABLE IF EXISTS `tr_matakuliah`;
CREATE TABLE `tr_matakuliah` (
  `id_matakuliah` smallint(5) NOT NULL,
  `kode` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dosen` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tr_matakuliah
-- ----------------------------
BEGIN;
INSERT INTO `tr_matakuliah` (`id_matakuliah`, `kode`, `nama`, `dosen`) VALUES (911, 'A', 'Basis Data', 'Jefry');
INSERT INTO `tr_matakuliah` (`id_matakuliah`, `kode`, `nama`, `dosen`) VALUES (912, 'AB', 'RPL', 'Diah');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;


