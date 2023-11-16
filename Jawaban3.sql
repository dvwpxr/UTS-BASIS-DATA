select s.id_mahasiswa, s.nama, s.Fakultas, s.NIM, s.id_jurusan, a.nama as jurusan, s.id_matakuliah, c.nama, c.kode as matakuliah, s.id_dosen, b.nama, b.NIDN as dosen
from tp_mahasiswa s 
inner join tr_jurusan a on a.id_jurusan = s.id_jurusan
inner join tp_dosen b on b.id_dosen = s.id_dosen

inner join tr_matakuliah c on c.id_matakuliah = s.id_matakuliah