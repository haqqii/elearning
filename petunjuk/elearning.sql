-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Nov 2021 pada 15.21
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int(100) NOT NULL,
  `id_ujian` int(100) NOT NULL,
  `id_soal` int(100) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jawaban` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `id_ujian`, `id_soal`, `id_siswa`, `jawaban`) VALUES
(1, 12, 107, 23, '1'),
(2, 12, 108, 23, '1'),
(3, 13, 109, 8, '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_tugas`
--

CREATE TABLE `kelas_tugas` (
  `id_klstugas` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas_tugas`
--

INSERT INTO `kelas_tugas` (`id_klstugas`, `id_tugas`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(9, 6, 7, 2, 'Y'),
(8, 5, 7, 1, 'Y'),
(10, 7, 7, 2, 'Y'),
(11, 8, 7, 2, 'Y'),
(12, 9, 8, 2, 'Y'),
(13, 10, 8, 2, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_klsujian` int(11) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_klsujian`, `id_ujian`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(22, 10, 7, 2, 'Y'),
(21, 10, 7, 3, 'Y'),
(23, 12, 7, 2, 'Y'),
(24, 13, 8, 2, 'N'),
(27, 14, 8, 2, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_ujianessay`
--

CREATE TABLE `kelas_ujianessay` (
  `id_klsessay` int(11) NOT NULL,
  `id_ujianessay` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_ujian` varchar(100) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `jml_benar` int(5) NOT NULL,
  `jml_kosong` int(5) NOT NULL,
  `jml_salah` int(5) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `waktu_selesai`, `jml_benar`, `jml_kosong`, `jml_salah`, `nilai`) VALUES
(9, 23, '12', '107,108', '1,1', '00:01:18', '15:49:27', 2, 0, 0, '100'),
(10, 8, '13', '109', '2', '15:57:00', '34:50:26', 1, 0, 0, '100');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(10) NOT NULL,
  `id_pengirim` varchar(30) NOT NULL,
  `id_penerima` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `isi_pesan` longtext NOT NULL,
  `sudah_dibaca` enum('belum','sudah') NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pengirim`, `id_penerima`, `tanggal`, `isi_pesan`, `sudah_dibaca`, `id_kelas`, `id_jurusan`) VALUES
(1, '009', 'Kirim Ke', '2021-11-03', 'Tulis Pesan', 'belum', 7, 3),
(2, '009', '4201419080', '2021-11-10', 'halo bu', 'belum', 8, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(5) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `pilihan_5` text NOT NULL,
  `kunci` int(2) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `pilihan_5`, `kunci`, `status`) VALUES
(106, 11, '1+18', '18', '19', '20', '21', '22', 2, 'Y'),
(105, 11, '1+17', '17', '18', '19', '20', '21', 1, 'Y'),
(104, 11, '1+16', '16', '17', '18', '19', '20', 1, 'Y'),
(103, 11, '1+15', '15', '16', '17', '18', '19', 1, 'Y'),
(102, 11, '1+14', '14', '15', '16', '17', '18', 1, 'Y'),
(101, 11, '1+13', '13', '14', '15', '16', '17', 2, 'Y'),
(100, 11, '1+12', '12', '13', '14', '15', '16', 3, 'Y'),
(99, 11, '1+11', '11', '12', '13', '14', '15', 4, 'Y'),
(98, 11, '1+10', '10', '11', '12', '13', '14', 5, 'Y'),
(97, 11, '1+9', '9', '10', '11', '12', '13', 4, 'Y'),
(96, 11, '1+8', '8', '9', '10', '11', '12', 3, 'Y'),
(95, 11, '1+7', '7', '8', '9', '10', '11', 2, 'Y'),
(94, 11, '1+6', '6', '7', '8', '9', '10', 3, 'Y'),
(93, 11, '1+5', '5', '6', '7', '8', '9', 2, 'Y'),
(92, 11, '1+4', '4', '5', '6', '7', '8', 2, 'Y'),
(91, 11, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(90, 11, '1+2', '2', '3', '4', '5', '6', 3, 'Y'),
(89, 11, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(107, 12, '<p><math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mfrac><mn>5</mn><mrow><mn>5</mn><msqrt><mn>5</mn></msqrt></mrow></mfrac><mo>+</mo><mfrac><mn>5</mn><mn>5</mn></mfrac><mo>&#160;</mo><mo>?</mo></math></p>\r\n', 'sddsdds', 'dsd', 'dsds', 'dsd', 'dsd', 1, 'Y'),
(108, 12, '<p><math xmlns=\"http://www.w3.org/1998/Math/MathML\" class=\"wrs_chemistry\"><msubsup><mi mathvariant=\"normal\">H</mi><mn>2</mn><mrow/></msubsup><mo>&#8710;</mo><mo>&#160;</mo><mi>ffff</mi><mo>?</mo></math></p>\r\n', 'dcdc', 'vxcv', 'xvx', 'xvx', 'xvvx', 1, 'Y'),
(109, 13, '<p>berikut ini adalah hewan karnivora</p>\r\n', '<p>gajah</p>\r\n', '<p>harimau</p>\r\n', '<p>burung pipit</p>\r\n', '<p>unta</p>\r\n', '<p>sapi</p>\r\n', 2, 'Y'),
(111, 14, '<p>as</p>\r\n', '<p>adas</p>\r\n', '<p>ada</p>\r\n', '<p>asd</p>\r\n', '<p>as</p>\r\n', '<p>sda</p>\r\n', 1, 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `aktif` varchar(5) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `username`, `password`, `aktif`, `foto`) VALUES
(1, 'Adminweb', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Y', '512x512.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama_guru` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `status` varchar(5) NOT NULL,
  `date_created` date NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nik`, `nama_guru`, `email`, `password`, `foto`, `status`, `date_created`, `confirm`) VALUES
(11, '4201419080', 'Putri Jihan', 'Putrijihansafira01@students.unnes.ac.id', 'd107a9de90da76c2d1e11a8313c945641f06aaa4', NULL, 'Y', '2021-11-10', 'Yes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenisperangkat`
--

CREATE TABLE `tb_jenisperangkat` (
  `id_jenisperangkat` int(11) NOT NULL,
  `jenis_perangkat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jenisperangkat`
--

INSERT INTO `tb_jenisperangkat` (`id_jenisperangkat`, `jenis_perangkat`) VALUES
(1, 'RPP'),
(2, 'SILABUS'),
(3, 'MODUL'),
(4, 'MATERI PEMBELAJARAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenistugas`
--

CREATE TABLE `tb_jenistugas` (
  `id_jenistugas` int(11) NOT NULL,
  `jenis_tugas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jenistugas`
--

INSERT INTO `tb_jenistugas` (`id_jenistugas`, `jenis_tugas`) VALUES
(1, 'INDIVIDU');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jenisujian`
--

CREATE TABLE `tb_jenisujian` (
  `id_jenis` int(11) NOT NULL,
  `jenis_ujian` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jenisujian`
--

INSERT INTO `tb_jenisujian` (`id_jenis`, `jenis_ujian`) VALUES
(1, 'UTS'),
(2, 'UAS'),
(3, 'KUIS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_jurusan`
--

CREATE TABLE `tb_master_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_master_jurusan`
--

INSERT INTO `tb_master_jurusan` (`id_jurusan`, `jurusan`) VALUES
(2, 'FISIKA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_kelas`
--

CREATE TABLE `tb_master_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_master_kelas`
--

INSERT INTO `tb_master_kelas` (`id_kelas`, `kelas`) VALUES
(8, 'X IPA 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int(11) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_master_mapel`
--

INSERT INTO `tb_master_mapel` (`id_mapel`, `mapel`) VALUES
(1, 'KINEMATIKA GERAK LURUS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_master_semester`
--

CREATE TABLE `tb_master_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_master_semester`
--

INSERT INTO `tb_master_semester` (`id_semester`, `semester`) VALUES
(1, 'SEMESTER 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `judul_materi` varchar(120) NOT NULL,
  `materi` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_entry` date NOT NULL,
  `id_roleguru` int(11) NOT NULL,
  `public` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_perangkat`
--

CREATE TABLE `tb_perangkat` (
  `id_perangkat` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `isi_perangkat` text NOT NULL,
  `id_jenisperangkat` int(11) NOT NULL,
  `tgl_entry` date NOT NULL,
  `publish` int(11) NOT NULL,
  `id_roleguru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_roleguru`
--

CREATE TABLE `tb_roleguru` (
  `id_roleguru` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sekolah`
--

CREATE TABLE `tb_sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(120) NOT NULL,
  `kepsek` varchar(120) NOT NULL,
  `textlogo` varchar(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_sekolah`
--

INSERT INTO `tb_sekolah` (`id_sekolah`, `nama_sekolah`, `kepsek`, `textlogo`, `logo`, `copyright`) VALUES
(1, 'SMA TADIKA MESRA', 'Senjatechno', 'e-learning', 'e_png_428941.png', ' Copyright 2021 <b>e-learning</b>. All rights reserved');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nama_siswa` varchar(120) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `aktif` varchar(30) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `jk`, `password`, `status`, `aktif`, `tingkat`, `foto`, `id_kelas`, `id_jurusan`, `confirm`) VALUES
(24, '1313', 'jihan', 'L', '8cb2237d0679ca88db6464eac60da96345513964', 'off', 'Y', '0', 'default.png', 8, 2, 'Yes');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tugas`
--

CREATE TABLE `tb_tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_jenistugas` int(11) NOT NULL,
  `judul_tugas` varchar(100) NOT NULL,
  `isi_tugas` text NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(30) NOT NULL,
  `jml_anggota` int(30) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_tugas`
--

INSERT INTO `tb_tugas` (`id_tugas`, `id_jenistugas`, `judul_tugas`, `isi_tugas`, `tanggal`, `waktu`, `jml_anggota`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(6, 1, 'aeff', '<p>dfdffffffffff</p>\r\n', '2020-03-31', 1, 0, 1, 7, 1),
(7, 2, 'ini tugas kelompok ya jangan lupa di upload', '<p>fffff</p>\r\n', '2020-06-13', 1, 2, 10, 2, 1),
(8, 1, 'ind', '<p>daca</p>\r\n', '2020-06-13', 1, 0, 10, 2, 1),
(9, 1, 'asaD', '<p>buat skripsi</p>\r\n', '2021-11-03', 2, 0, 6, 1, 1),
(10, 1, 'Skripsi', '<p>buatlah skripsi</p>\r\n', '2021-11-03', 2, 0, 10, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tugas_siswa`
--

CREATE TABLE `tugas_siswa` (
  `id_tgssiswa` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `subjek` varchar(120) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kelompok` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(30) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_upload` date NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tugas_siswa`
--

INSERT INTO `tugas_siswa` (`id_tgssiswa`, `id_tugas`, `subjek`, `id_siswa`, `kelompok`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `tgl_upload`, `ket`) VALUES
(1, 1, ' Subjek', 2, '--', '1557065872', 'xls', '1768', '../vendor/file/tugasTUGAS-INDIVIDU_1557065872.xls', '2019-05-05', 'Selesai'),
(2, 1, ' Subjek', 1, '--', '1557065912', 'xls', '1768', '../vendor/file/tugasTUGAS-INDIVIDU_1557065912.xls', '2019-05-05', 'Selesai'),
(3, 1, ' Subjek', 7, '--', '1584983104', 'pdf', '108086', '../vendor/file/tugasTUGAS-INDIVIDU_1584983104.pdf', '2020-03-23', 'Selesai'),
(4, 9, ' Subjek', 8, '', '1635940547', 'pdf', '7739929', '../vendor/file/tugasTUGAS-INDIVIDU_1635940547.pdf', '2021-11-03', 'Selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `acak` varchar(100) NOT NULL,
  `tipe` int(1) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`, `acak`, `tipe`, `id_jenis`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(10, 'asd', '2020-03-31', '01:30:00', 5, 'tidak', 0, 1, 1, 7, 1),
(11, 'Ujian Uji Coba', '2020-04-04', '00:10:00', 20, 'acak', 0, 1, 4, 3, 2),
(12, 'coba mtk', '2020-06-16', '00:02:00', 2, 'tidak', 0, 1, 10, 2, 1),
(13, 'EAS', '2021-11-03', '15:57:00', 1, 'acak', 0, 1, 6, 1, 1),
(14, 'Kuis 1', '2021-11-03', '02:00:00', 1, 'acak', 0, 3, 10, 1, 1),
(15, 'hay', '2021-11-10', '02:01:00', 1, 'acak', 0, 3, 6, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ujian_essay`
--

CREATE TABLE `ujian_essay` (
  `id_ujianessay` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `soal_essay` text NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`);

--
-- Indeks untuk tabel `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  ADD PRIMARY KEY (`id_klstugas`);

--
-- Indeks untuk tabel `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  ADD PRIMARY KEY (`id_klsujian`);

--
-- Indeks untuk tabel `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  ADD PRIMARY KEY (`id_klsessay`);

--
-- Indeks untuk tabel `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  ADD PRIMARY KEY (`id_jenisperangkat`);

--
-- Indeks untuk tabel `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  ADD PRIMARY KEY (`id_jenistugas`);

--
-- Indeks untuk tabel `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indeks untuk tabel `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indeks untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indeks untuk tabel `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD PRIMARY KEY (`id_perangkat`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indeks untuk tabel `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD PRIMARY KEY (`id_roleguru`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_semester` (`id_semester`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indeks untuk tabel `tb_tugas`
--
ALTER TABLE `tb_tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indeks untuk tabel `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  ADD PRIMARY KEY (`id_tgssiswa`);

--
-- Indeks untuk tabel `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- Indeks untuk tabel `ujian_essay`
--
ALTER TABLE `ujian_essay`
  ADD PRIMARY KEY (`id_ujianessay`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  MODIFY `id_klstugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  MODIFY `id_klsujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  MODIFY `id_klsessay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  MODIFY `id_jenisperangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  MODIFY `id_jenistugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  MODIFY `id_perangkat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  MODIFY `id_roleguru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tb_tugas`
--
ALTER TABLE `tb_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  MODIFY `id_tgssiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `ujian_essay`
--
ALTER TABLE `ujian_essay`
  MODIFY `id_ujianessay` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD CONSTRAINT `tb_materi_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD CONSTRAINT `tb_perangkat_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD CONSTRAINT `tb_roleguru_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_master_jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `tb_master_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_4` FOREIGN KEY (`id_mapel`) REFERENCES `tb_master_mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_5` FOREIGN KEY (`id_semester`) REFERENCES `tb_master_semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
