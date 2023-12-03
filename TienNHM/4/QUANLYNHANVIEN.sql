CREATE DATABASE QUANLYNHANVIEN
GO

-- Tạo CSDL QUANLYNHANVIEN
USE QUANLYNHANVIEN
GO

--------------------------------------------------------------------------------------
-- Tạo bảng PHONGBAN
CREATE TABLE dbo.PHONGBAN(
	MaPB		INT PRIMARY KEY,
	TenPB		NVARCHAR(10) NULL,
	TrPhong		CHAR(4) NULL,
	NgNhanChuc	DATE NULL
)
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng NHANVIEN
CREATE TABLE dbo.NHANVIEN(
	Manv	CHAR(4) PRIMARY KEY,
	HoNV	NVARCHAR(10) NULL,
	Tenlot	NVARCHAR(20) NULL,
	tenNV	NVARCHAR(10) NULL,
	NgSinh	DATE NULL,
	Dchi	NVARCHAR(50) NULL,
	Phai	NVARCHAR(3) NULL,
	Luong	INT NULL,
	MaNQL	CHAR(4) NULL,
	Phong	INT 
)
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng DIADIEM_PHONG
CREATE TABLE DIADIEM_PHONG(
		MaPB	INT REFERENCES PHONGBAN(MaPB),
		DiaDiem	NVARCHAR(30),
		PRIMARY KEY (MaPB, DiaDiem)
		)
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng DUAN
CREATE TABLE DUAN(
	MaDA	CHAR(4) PRIMARY KEY,
	TenDA	NVARCHAR(30),
	DiaDiem	NVARCHAR(30),
	Phong	INT REFERENCES PHONGBAN(MaPB)
	)
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng PHANCONG
CREATE TABLE PHANCONG(
	MaNV		CHAR(4) REFERENCES NHANVIEN(maNV),
	MaDA		CHAR(4) REFERENCES DuAn(MaDA),
	ThoiGian	INT,
	PRIMARY KEY (MaNV, MaDA)
	)
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng THANNHAN
CREATE TABLE THANNHAN(
		MaNV		CHAR(4) REFERENCES NHANVIEN(maNV),
		TenTN		NVARCHAR(20),
		Phai		NVARCHAR(3),
		NgaySinh	DATE,
		QuanHe		NVARCHAR(10),
		PRIMARY KEY (MaNV, TenTN)
		)
GO

--------------------------------------------------------------------------------------
-- Nhập giá trị vào bảng NHANVIEN
INSERT INTO NHANVIEN VALUES ('nv01', N'Nguyễn', N'Ngọc', N'Hoàng', '1972-08-13', N'111 Võ Văn Ngân', N'Nam', 30000, 'NV02', 1)
INSERT INTO NHANVIEN VALUES ('nv02', N'Nguyễn', N'Quang', N'Ngọc', '1975-08-23', N'111 Nguyễn Văn Trỗi', N'Nam', 25000, 'NV15', 1)
INSERT INTO NHANVIEN VALUES ('nv03', N'Lê', N'Thị', N'Ngọc', '1980-08-13', N'111 Đường 3/2', N'Nữ', 28000, 'NV15', 2)
INSERT INTO NHANVIEN VALUES ('nv04', N'Lê', N'Ngọc', N'Hoàng', '1982-08-18', N'111 Lê Văn Duyệt', N'Nam', 15000, 'NV03', 2)
INSERT INTO NHANVIEN VALUES ('nv05', N'Nguyễn', N'Thị', N'Ngọc', '1992-08-13', N'108 Võ Văn Ngân', N'Nữ', 28000, 'NV06', 3)
INSERT INTO NHANVIEN VALUES ('nv06', N'Trương', N'Anh', N'Kiệt', '1960-12-13', N'11 Hai Bà Trưng', N'Nam', 30000, 'NV15', 3)
INSERT INTO NHANVIEN VALUES ('nv07', N'Lê', N'Phụng', N'Hiếu', '1972-08-13', N'11 Hậu Giang', N'Nam', 10000, 'NV15', 4)
INSERT INTO NHANVIEN VALUES ('nv08', N'Nguyễn', N'Bảo', N'Hùng', '1978-08-23', N'10 Trần Hưng Đạo', N'Nam', 20000, 'NV15', 5)
INSERT INTO NHANVIEN VALUES ('nv09', N'Nguyễn', N'Bảo', N'Hoàng', '1972-08-13', N'111 Trần Hưng Đạo', N'Nam', 10000, 'NV15', 6)
INSERT INTO NHANVIEN VALUES ('nv10', N'Lê', N'Hoàng', N'Ngọc', '1972-08-13', N'11 Lạc Long Quân', N'Nam', 10000, 'NV15', 7)
INSERT INTO NHANVIEN VALUES ('nv11', N'Nguyễn', N'Bảo', N'Ngọc', '1972-08-13', N'111 Minh Phụng', N'Nữ', 15000, 'NV15', 8)
INSERT INTO NHANVIEN VALUES ('nv12', N'Nguyễn', N'Ngọc', N'A', '1982-08-13', N'11 Nguyễn Duy Trinh', N'Nam', 10000, 'NV11', 8)
INSERT INTO NHANVIEN VALUES ('nv13', N'Lê', N'Quang', N'Hoàng', '1979-08-23', N'10 Lý Chính Thắng', N'Nam', 15000, 'NV15', 9)
INSERT INTO NHANVIEN VALUES ('nv14', N'Nguyễn', N'Quang', N'Hoàng', '1972-08-13', N'11 Lê Văn Thịnh', N'Nam', 10000, 'NV13', 9)
INSERT INTO NHANVIEN VALUES ('nv15', N'Đặng', N'Tấn', N'Dũng', '1960-08-13', N'23 Võ Văn Ngân', N'Nam', 50000, NULL, 10)
GO

--------------------------------------------------------------------------------------
-- Nhập giá trị vào bảng PHONGBAN
INSERT INTO PHONGBAN VALUES (1, N'Nghiên cứu', 'nv02', '2013-12-12');
INSERT INTO PHONGBAN VALUES (2, N'Tổ chức', 'nv03', '2013-11-21');
INSERT INTO PHONGBAN VALUES (3, N'Vật tư', 'nv06', '2013-1-25');
INSERT INTO PHONGBAN VALUES (4, N'Đào tạo', 'nv15', '2013-2-19');
INSERT INTO PHONGBAN VALUES (5, N'Kinh doanh', 'nv15', '2013-08-18');
INSERT INTO PHONGBAN VALUES (6, N'Đối ngoại', 'nv15', '2013-10-17');
INSERT INTO PHONGBAN VALUES (7, N'Xây dựng', 'nv15', '2013-02-20');
INSERT INTO PHONGBAN VALUES (8, N'QL Dự án', 'nv11', '2013-12-12');
INSERT INTO PHONGBAN VALUES (9, N'Kế toán', 'nv13', '2013-12-12');
INSERT INTO PHONGBAN VALUES (10, N'BGD', 'nv15', '2010-11-29');
GO

--------------------------------------------------------------------------------------
-- Thêm hai khóa ngoại cho bảng NHANVIEN
ALTER TABLE NHANVIEN WITH CHECK ADD FOREIGN KEY(MaNQL) REFERENCES NHANVIEN(Manv)
GO
ALTER TABLE NHANVIEN  WITH CHECK ADD FOREIGN KEY(Phong) REFERENCES PHONGBAN(MaPB)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng DIADIEM_PHONG
INSERT INTO DIADIEM_PHONG VALUES(1, N'Tầng trệt - Khu A')
INSERT INTO DIADIEM_PHONG VALUES(2, N'Tầng 1 - Khu A')
INSERT INTO DIADIEM_PHONG VALUES(3, N'Tầng trệt - Khu B')
INSERT INTO DIADIEM_PHONG VALUES(4, N'Tầng trệt - Khu C')
INSERT INTO DIADIEM_PHONG VALUES(5, N'Tầng trệt - Khu E')
INSERT INTO DIADIEM_PHONG VALUES(6, N'Tầng trệt - Khu Bát giác')
INSERT INTO DIADIEM_PHONG VALUES(7, N'Tầng trệt - Khu Trung tâm')
INSERT INTO DIADIEM_PHONG VALUES(8, N'Tầng 1 - Khu Trung tâm')
INSERT INTO DIADIEM_PHONG VALUES(9, N'Tầng 2 - Khu Trung tâm')
INSERT INTO DIADIEM_PHONG VALUES(10, N'Tầng 3 - Khu Trung tâm')
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng DUAN
INSERT INTO DUAN VALUES ('DA01', N'Cấp thoát nước', N'Gò Vấp', 9)
INSERT INTO DUAN VALUES ('DA02', N'Bán chung cư', N'Thủ Thiêm', 5)
INSERT INTO DUAN VALUES ('DA03', N'Xây biệt thư', N'Thủ Đức', 7)
INSERT INTO DUAN VALUES ('DA04', N'Liên kết đào tạo', N'Gò Vấp', 4)
INSERT INTO DUAN VALUES ('DA05', N'Cung cấp vật tư', N'Quận 2', 3)
INSERT INTO DUAN VALUES ('DA06', N'Huấn luyện', N'Gò Vấp', 4)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng PHANCONG
INSERT INTO PHANCONG VALUES ('nv01', 'DA01', 3)
INSERT INTO PHANCONG VALUES ('nv01', 'DA02', 3)
INSERT INTO PHANCONG VALUES ('nv02', 'DA01', 3)
INSERT INTO PHANCONG VALUES ('nv02', 'DA03', 3)
INSERT INTO PHANCONG VALUES ('nv03', 'DA04', 3)
INSERT INTO PHANCONG VALUES ('nv04', 'DA03', 3)
INSERT INTO PHANCONG VALUES ('nv09', 'DA04', 3)
INSERT INTO PHANCONG VALUES ('nv01', 'DA05', 3)
INSERT INTO PHANCONG VALUES ('nv05', 'DA05', 3)
INSERT INTO PHANCONG VALUES ('nv07', 'DA06', 3)
INSERT INTO PHANCONG VALUES ('nv08', 'DA06', 3)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng THANNHAN
INSERT INTO THANNHAN VALUES ('nv01', N'Nguyễn Ngọc Huy', N'Nam', '2018-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv01', N'Nguyễn Ngọc Hoa', N'Nữ', '2020-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv02', N'Nguyễn Ngọc Huy', N'Nam', '2018-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv02', N'Nguyễn Ngọc Hoa', N'Nữ', '2020-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv15', N'Đặng Ngọc Hoa', N'Nữ', '2020-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv01', N'Nguyễn Nguyên Hưng', N'Nam', '2020-3-26',N'con')
