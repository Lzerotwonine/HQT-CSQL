CREATE DATABASE QuanLyKiTucXa;
USE QuanLyKiTucXa;

CREATE TABLE Phong (
  SoPhong VARCHAR(10) PRIMARY KEY,
  LoaiPhong VARCHAR(10) CHECK (LoaiPhong IN ('Nam', 'Nữ', 'Cả hai')),
  SoLuongSV INT CHECK (SoLuongSV >= 0 AND SoLuongSV <= 8),
  GiaPhong INT NOT NULL
);

CREATE TABLE SinhVien (
  MSSV VARCHAR(10) PRIMARY KEY,
  HoTen VARCHAR(50) NOT NULL,
  GioiTinh VARCHAR(10) CHECK (GioiTinh IN ('Nam', 'Nữ')),
  NgaySinh DATE NOT NULL,
  Lop VARCHAR(10) NOT NULL,
  Khoa VARCHAR(10) NOT NULL,
  SoPhong VARCHAR(10),
  NgayDK DATE NOT NULL,
  NgayTra DATE,
  Image VARCHAR(70),
  FOREIGN KEY (SoPhong) REFERENCES Phong(SoPhong)
);

CREATE TABLE ThanhToan (
  MSSV VARCHAR(10),
  Thang INT CHECK (Thang >= 1 AND Thang <= 12),
  Nam INT NOT NULL,
  SoTien INT NOT NULL,
  TrangThai VARCHAR(20) CHECK (TrangThai IN ('Đã thanh toán', 'Chưa thanh toán')),
  PRIMARY KEY (MSSV, Thang, Nam),
  FOREIGN KEY (MSSV) REFERENCES SinhVien(MSSV)
);

CREATE TABLE DangKyNoiTru (
  MaDK INT PRIMARY KEY,
  MSSV VARCHAR(10),
  SoPhong VARCHAR(10),
  FOREIGN KEY (MSSV) REFERENCES SinhVien(MSSV),
  FOREIGN KEY (SoPhong) REFERENCES Phong(SoPhong)
);

CREATE TABLE DienNuoc (
  MaDN INT PRIMARY KEY,
  SoPhong VARCHAR(10),
  Thang INT CHECK (Thang >= 1 AND Thang <= 12),
  Nam INT NOT NULL,
  PhiDien INT NOT NULL,
  PhiNuoc INT NOT NULL,
  FOREIGN KEY (SoPhong) REFERENCES Phong(SoPhong)
);

CREATE TABLE Admin (
  AdminID INT PRIMARY KEY,
  Username VARCHAR(50) NOT NULL,
  Password VARCHAR(50) NOT NULL
);
