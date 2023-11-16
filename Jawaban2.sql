BEGIN;
INSERT INTO `tp_dosen` (`id_dosen`, `nama`, `NIDN`) VALUES (11, 'Bambang', 2022);
INSERT INTO `tp_dosen` (`id_dosen`, `nama`, `NIDN`) VALUES (12, 'Budi', 2023);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

BEGIN;
INSERT INTO `tp_mahasiswa` (`id_mahasiswa`, `nama`, `Fakultas`, `NIM`, `id_jurusan`, `id_matakuliah`, `id_dosen`) VALUES (22, 'Andi winato', 'MESIN', 2021, 14, 912, 12);
INSERT INTO `tp_mahasiswa` (`id_mahasiswa`, `nama`, `Fakultas`, `NIM`, `id_jurusan`, `id_matakuliah`, `id_dosen`) VALUES (88, 'Dava Wisda Putra', 'FASILKOM', 2022, 12, 911, 11);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

BEGIN;
INSERT INTO `tr_matakuliah` (`id_matakuliah`, `kode`, `nama`, `dosen`) VALUES (911, 'A', 'Basis Data', 'Jefry');
INSERT INTO `tr_matakuliah` (`id_matakuliah`, `kode`, `nama`, `dosen`) VALUES (912, 'AB', 'RPL', 'Diah');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;