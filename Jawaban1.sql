DROP TABLE IF EXISTS `tp_dosen`;
CREATE TABLE `tp_dosen` (
  `id_dosen` int(10) NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `NIDN` smallint(10) DEFAULT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tr_matakuliah` (
  `id_matakuliah` smallint(5) NOT NULL,
  `kode` char(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dosen` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tp_mahasiswa` (
  `id_mahasiswa` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Fakultas` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `NIM` int(10) NOT NULL,
  `id_jurusan` smallint(1) DEFAULT NULL,
  `id_matakuliah` smallint(1) DEFAULT NULL,
  `id_dosen` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_mahasiswa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
