-- Membuat database
CREATE DATABASE sibeta;
GO
USE sibeta;

-- Tabel mahasiswa
CREATE TABLE mahasiswa (
    nim VARCHAR(10) PRIMARY KEY,
    password VARCHAR(8) NOT NULL, 
    nama VARCHAR(100),
    tgl_lahir DATE,
    alamat VARCHAR(MAX),
    telp_mahasiswa VARCHAR(15),
    status_semester VARCHAR(50),
    telp_wali VARCHAR(15),
    id_prodi INT , -- Kolom id_prodi untuk foreign key ke prodi
    id_jurusan INT, -- Kolom id_jurusan untuk foreign key ke jurusan
	role INT DEFAULT 2,
    CONSTRAINT FK_mahasiswa_prodi FOREIGN KEY (id_prodi) REFERENCES prodi(id_prodi),
    CONSTRAINT FK_mahasiswa_jurusan FOREIGN KEY (id_jurusan) REFERENCES jurusan(id_jurusan)
);

-- Tabel admin
CREATE TABLE admin (
    nip VARCHAR(20) PRIMARY KEY,
    password VARCHAR(8) NOT NULL, 
    nama VARCHAR(100),
    role INT DEFAULT 1,
    jabatan VARCHAR(50),
    telp_admin VARCHAR(15),
    email VARCHAR(100),
);

-- Tabel jurusan
CREATE TABLE jurusan (
    id_jurusan INT PRIMARY KEY IDENTITY(1,1),
    nama_jurusan VARCHAR(100)
);

-- Tabel prodi
CREATE TABLE prodi (
    id_prodi INT PRIMARY KEY IDENTITY(1,1),
    nama_prodi VARCHAR(100),
    kelas VARCHAR(10)
);

-- Tabel kompen
CREATE TABLE kompen (
    id_kompen INT PRIMARY KEY IDENTITY(1,1),
    jumlah_kompen INT,
    tanggal_selesai DATE,
    file_kompen VARCHAR(MAX),
    nim VARCHAR(10), -- Kolom nim untuk foreign key ke mahasiswa
    CONSTRAINT FK_kompen_mahasiswa FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

-- Tabel pkl
CREATE TABLE pkl (
    id_pkl INT PRIMARY KEY IDENTITY(1,1),
    laporan_pkl VARCHAR(MAX),
	sertifikat_pkl VARCHAR(MAX),
    nilai_pkl VARCHAR(MAX),
    nim VARCHAR(10), -- Kolom nim untuk foreign key ke mahasiswa
    id_jurusan INT, -- Kolom id_jurusan untuk foreign key ke jurusan
    CONSTRAINT FK_pkl_mahasiswa FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    CONSTRAINT FK_pkl_jurusan FOREIGN KEY (id_jurusan) REFERENCES jurusan(id_jurusan)
);

-- Tabel sertifikat
CREATE TABLE sertifikat (
    no_sertifikat VARCHAR(20) PRIMARY KEY,
    file_sertifikat VARCHAR(MAX),
    jenis_sertifikat VARCHAR(100),
    poin_skkm INT,
    nim VARCHAR(10), -- Kolom nim untuk foreign key ke mahasiswa
    CONSTRAINT FK_sertifikat_mahasiswa FOREIGN KEY(nim) REFERENCES mahasiswa(nim)
);

-- Tabel skripsi
CREATE TABLE skripsi (
    id_skripsi INT PRIMARY KEY IDENTITY(1,1),
    judul VARCHAR(500),
	nilai VARCHAR(MAX),
	lembar_pengesahan VARCHAR(MAX),
    nim VARCHAR(10), -- Kolom nim untuk foreign key ke mahasiswa
    CONSTRAINT FK_skripsi_mahasiswa FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

-- Tabel berkas_penyelesaian
CREATE TABLE form_berkas (
    id_form INT PRIMARY KEY IDENTITY(1,1),
    form_jurusan VARCHAR(MAX),
    form_perpustakaan VARCHAR(MAX),
    form_beta VARCHAR(MAX),
	nim VARCHAR(10), -- Kolom nim untuk foreign key ke mahasiswa
    CONSTRAINT FK_berkas_mahasiswa FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

-- Tabel faq
CREATE TABLE faq (
    id_faq INT PRIMARY KEY IDENTITY(1,1),
    pertanyaan VARCHAR(MAX),
    jawaban VARCHAR(MAX),
    nim VARCHAR(10), -- Kolom nim untuk foreign key ke mahasiswa
    CONSTRAINT FK_kuisioner_mahasiswa FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
);

-- Insert data into mahasiswa
INSERT INTO mahasiswa (nim, password, nama, tgl_lahir, alamat, telp_mahasiswa, status_semester, telp_wali, id_prodi, id_jurusan)
VALUES 
('2341760035', 'pass1234', 'Qusnul Diah Mawanti', '2005-02-25', 'Bojonegoro', '085234572917', 'Aktif', '085612345678', 1, 1),
('2341760013', 'pass1234', 'Lyra Faiqah Bilqil', '2004-07-31', 'Sidoarjo', '085655896780', 'Aktif', '082234003469', 2, 2),
('2341760115', 'pass1234', 'Muhammad Ircham Daffansyah', '2005-11-20', 'Malang', '082145343418', 'Aktif', '081333152790', 3, 3),
('2341760140', 'pass1234', 'Gegas Anugrah Derajat', '2004-04-04', 'Bandung', '084567890123', 'Aktif', '085912345678', 4, 4);

-- Insert data into admin
INSERT INTO admin (nip, password, nama, role, jabatan, telp_admin, email)
VALUES 
('198503152020121001', 'admin123', 'Ahmad Yusuf', '1', 'Administrator', '081234567891', 'admin@kampus.ac.id'),
('199002202018092002', 'dosen123', 'Drs. Maya Lestari, M.Pd.', '1', 'Dosen Utama', '082345678912', 'dosen@kampus.ac.id');

-- Insert data into jurusan
INSERT INTO jurusan (nama_jurusan)
VALUES 
('Teknologi Informasi'),
('Teknik Kimia'),
('Teknik Elektro'),
('Teknik Mesin');

-- Insert data into prodi
INSERT INTO prodi (nama_prodi, kelas)
VALUES 
('Teknik Informatika', 'A'),
('Teknik Kimia', 'B'),
('Teknik Elektro', 'A'),
('Teknik Mesin', 'C');

-- Insert data into kompen
INSERT INTO kompen (jumlah_kompen, tanggal_selesai, nim)
VALUES 
(4, '2024-10-25', '2341760035');

INSERT INTO kompen (jumlah_kompen, tanggal_selesai, file_kompen, nim)
VALUES 
(2, '2024-11-01', 'file kompen','2341760013');

-- Insert data into pkl
INSERT INTO pkl (laporan_pkl, sertifikat_pkl, nilai_pkl, nim, id_jurusan)
VALUES 
('laporan PKL', 'sertifikat PKL', 'nilai pkl', '2341760035', 1);

INSERT INTO pkl (nim, id_jurusan)
VALUES 
('2341760013', 2);

-- Insert data into pkl
INSERT INTO sertifikat (no_sertifikat, file_sertifikat, jenis_sertifikat, poin_skkm, nim)
VALUES 
('SERT001', 'Sertifikat1', 'lomba', 1, '2341760035');

INSERT INTO sertifikat (no_sertifikat, jenis_sertifikat, poin_skkm, nim)
VALUES 
('SERT002', 'kepanitiaan', 2, '2341760013');

-- Insert data into skripsi
INSERT INTO skripsi (judul, nilai, lembar_pengesahan, nim)
VALUES 
('skripsi1', 'nilai skripsi', 'pengesahan skripsi1', '2341760035');

INSERT INTO skripsi (judul, nim)
VALUES 
('skripsi2', '2341760013');

-- Insert data into form_berkas
INSERT INTO form_berkas (form_jurusan, form_perpustakaan, form_beta, nim)
VALUES 
('form jurusan1', 'form_perpustakaan1', 'form_beta1', '2341760035');

INSERT INTO form_berkas (nim)
VALUES 
('2341760013');

-- Insert data into faq
INSERT INTO faq (pertanyaan, jawaban, nim)
VALUES 
('Apa itu sistem bebas tanggungan?', 'Sistem bebas tanggungan adalah status yang diberikan kepada mahasiswa yang telah menyelesaikan semua kewajiban finansial dan administratif.', '2341760035'),
('Bagaimana cara mendapatkan status bebas tanggungan?', 'Mahasiswa dapat mendapatkan status bebas tanggungan dengan melunasi semua kewajiban finansial dan administratif yang berlaku.', '2341760013');

-- Menampilkan semua data dari tabel mahasiswa
SELECT * FROM mahasiswa;

-- Menampilkan semua data dari tabel admin
SELECT * FROM admin;

-- Menampilkan semua data dari tabel jurusan
SELECT * FROM jurusan;

-- Menampilkan semua data dari tabel prodi
SELECT * FROM prodi;

-- Menampilkan semua data dari tabel kompen
SELECT * FROM kompen;

-- Menampilkan semua data dari tabel pkl
SELECT * FROM pkl;

-- Menampilkan semua data dari tabel sertifikat
SELECT * FROM sertifikat;

-- Menampilkan semua data dari tabel skripsi
SELECT * FROM skripsi;

-- Menampilkan semua data dari tabel skripsi
SELECT * FROM form_berkas;

-- Menampilkan semua data dari tabel faq
SELECT * FROM faq;


