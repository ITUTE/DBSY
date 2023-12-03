--------------------------------------------------------------------------------------
--                         BÀI 1 - CSDL QUẢN LÝ NHÂN VIÊN                           --
--------------------------------------------------------------------------------------

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
	TenNV	NVARCHAR(10) NULL,
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
INSERT INTO NHANVIEN VALUES ('nv16', N'Nguyễn', N'Thanh', N'Đức', '1975-03-11', N'13 Lê Văn Anh', N'Nam', 10000, 'NV13', 2)
INSERT INTO NHANVIEN VALUES ('nv17', N'Đặng', N'Tấn', N'Đức', '1960-08-13', N'11 Lê Lợi', N'Nam', 50000, NULL, 10)
INSERT INTO NHANVIEN VALUES ('nv18', N'Ngô', N'Tấn', N'Cường', '1960-04-10', N'2 Trần Hưng Đạo', N'Nam', 30000, NULL, 1)
INSERT INTO NHANVIEN VALUES ('nv19', N'Ngô', N'Thảo', N'Ngân', '1984-03-18', N'21 Lê Lai', N'Nữ', 60000, 'NV17', 10)
INSERT INTO NHANVIEN VALUES ('nv20', N'Lê', N'Thảo', N'Tiên', '1984-09-11', N'10 Lê Đại Hành', N'Nữ', 20000, 'NV15', 5)
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
-- Thêm khóa ngoại cho bảng PHONGBAN
ALTER TABLE PHONGBAN  WITH CHECK ADD FOREIGN KEY(TrPhong) REFERENCES NHANVIEN(MaNV)
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
INSERT INTO PHANCONG VALUES ('nv11', 'DA06', 3)
INSERT INTO PHANCONG VALUES ('nv10', 'DA01', 3)
INSERT INTO PHANCONG VALUES ('nv20', 'DA01', 5)
GO

--------------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng PHANCONG
ALTER TABLE PHANCONG WITH CHECK ADD FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV)
GO

--------------------------------------------------------------------------------------
-- Thêm DEFAULT cho PHANCONG(ThoiGian)
ALTER TABLE PHANCONG ADD CONSTRAINT DF_ThoiGian DEFAULT 0 FOR ThoiGian 
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng THANNHAN
INSERT INTO THANNHAN VALUES ('nv01', N'Nguyễn Ngọc Huy', N'Nam', '2018-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv01', N'Nguyễn Ngọc Hoa', N'Nữ', '2020-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv02', N'Nguyễn Ngọc Huy', N'Nam', '2018-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv02', N'Nguyễn Ngọc Hoa', N'Nữ', '2020-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv15', N'Đặng Ngọc Hoa', N'Nữ', '2020-3-26',N'con')
INSERT INTO THANNHAN VALUES ('nv01', N'Nguyễn Nguyên Hưng', N'Nam', '2020-3-26',N'con')


--------------------------------------------------------------------------------------
--                           BÀI 2 - CSDL QUẢN LÝ THƯ VIỆN                          --
--------------------------------------------------------------------------------------

CREATE DATABASE QUANLYTHUVIEN
GO

-- Tạo CSDL THUVIEN
USE QUANLYTHUVIEN
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng DAUSACH
CREATE TABLE dbo.DAUSACH(
	MaSach	CHAR(10) PRIMARY KEY,
	Tua		NVARCHAR(50),
	MaNXB	CHAR(10)
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng DAUSACH
INSERT INTO DAUSACH VALUES ('MS0001', N'Ông già và biển cả', 'NXB0001')
INSERT INTO DAUSACH VALUES ('MS0002', N'Fathers and Sons', 'NXB0002')
INSERT INTO DAUSACH VALUES ('MS0003', N'Những người khốn khổ', 'NXB0003')
INSERT INTO DAUSACH VALUES ('MS0004', N'Chiến tranh và hòa bình', 'NXB0004')
INSERT INTO DAUSACH VALUES ('MS0005', N'Có và không có', 'NXB0005')
INSERT INTO DAUSACH VALUES ('MS0006', N'Chuông nguyện hồn ai', 'NXB0006')
INSERT INTO DAUSACH VALUES ('MS0007', N'In Another Country', 'NXB0007')
INSERT INTO DAUSACH VALUES ('MS0008', N'Giã từ vũ khí', 'NXB0008')
INSERT INTO DAUSACH VALUES ('MS0009', N'The End of Something', 'NXB0009')
INSERT INTO DAUSACH VALUES ('MS0010', N'Nhập môn lập trình', 'NXB0010')
INSERT INTO DAUSACH VALUES ('MS0011', N'Nhập môn Tin học', 'NXB0010')
INSERT INTO DAUSACH VALUES ('MS0012', N'Cơ sở kỹ thuật', 'NXB0010')
INSERT INTO DAUSACH VALUES ('MS0013', N'Cơ sở Công nghệ phần mềm', 'NXB0010')
INSERT INTO DAUSACH VALUES ('MS0014', N'Bước nhày tới mùa hè', 'NXB0011')
INSERT INTO DAUSACH VALUES ('MS0015', N'Cho tôi một vé đi tuổi thơ', 'NXB0011')
INSERT INTO DAUSACH VALUES ('MS0016', N'Còn chút gì để nhớ', 'NXB0011')

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng CUONSACH
CREATE TABLE dbo.CUONSACH(
	MaSach	CHAR(10) REFERENCES DAUSACH(MaSach),
	MaCuon	CHAR(10) PRIMARY KEY,
	ViTri	NVARCHAR(50) NULL
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng CUONSACH
INSERT INTO CUONSACH VALUES ('MS0001', 'C01', N'Dãy A')
INSERT INTO CUONSACH VALUES ('MS0002', 'C02', N'Dãy B')
INSERT INTO CUONSACH VALUES ('MS0003', 'C03', N'Dãy A')
INSERT INTO CUONSACH VALUES ('MS0004', 'C04', N'Dãy C')
INSERT INTO CUONSACH VALUES ('MS0005', 'C05', N'Dãy C')
INSERT INTO CUONSACH VALUES ('MS0006', 'C06', N'Dãy D')
INSERT INTO CUONSACH VALUES ('MS0007', 'C07', N'Dãy A')
INSERT INTO CUONSACH VALUES ('MS0008', 'C08', N'Dãy B')
INSERT INTO CUONSACH VALUES ('MS0009', 'C09', N'Dãy E')
INSERT INTO CUONSACH VALUES ('MS0010', 'C10', N'Dãy E')
INSERT INTO CUONSACH VALUES ('MS0011', 'C11', N'Dãy D')
INSERT INTO CUONSACH VALUES ('MS0012', 'C12', N'Dãy B')
INSERT INTO CUONSACH VALUES ('MS0013', 'C13', N'Dãy C')
INSERT INTO CUONSACH VALUES ('MS0014', 'C14', N'Dãy C')
INSERT INTO CUONSACH VALUES ('MS0015', 'C15', N'Dãy A')
INSERT INTO CUONSACH VALUES ('MS0016', 'C16', N'Dãy E')

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng TACGIA
CREATE TABLE dbo.TACGIA(
	MaSach	CHAR(10) REFERENCES DAUSACH(MaSach),
	TenTacGia NVARCHAR(50),
	PRIMARY KEY (MaSach, TenTacGia)
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng TACGIA
INSERT INTO TACGIA VALUES ('MS0001', N'Hemingway')
INSERT INTO TACGIA VALUES ('MS0002', N'Turgenev')
INSERT INTO TACGIA VALUES ('MS0003', N'Victor Hugo')
INSERT INTO TACGIA VALUES ('MS0004', N'Lev Tolstoy')
INSERT INTO TACGIA VALUES ('MS0005', N'Hemingway')
INSERT INTO TACGIA VALUES ('MS0006', N'Hemingway')
INSERT INTO TACGIA VALUES ('MS0007', N'Hemingway')
INSERT INTO TACGIA VALUES ('MS0008', N'Hemingway')
INSERT INTO TACGIA VALUES ('MS0009', N'Hemingway')
INSERT INTO TACGIA VALUES ('MS0010', N'Trần Đan Thư')
INSERT INTO TACGIA VALUES ('MS0011', N'Đỗ Văn Uy')
INSERT INTO TACGIA VALUES ('MS0011', N'UNKNOWN')
INSERT INTO TACGIA VALUES ('MS0012', N'Vũ Quý Điềm')
INSERT INTO TACGIA VALUES ('MS0012', N'Vũ')
INSERT INTO TACGIA VALUES ('MS0012', N'UNKNOWN')
INSERT INTO TACGIA VALUES ('MS0013', N'Lương Mạnh Bá')
INSERT INTO TACGIA VALUES ('MS0014', N'Nguyễn Nhật Ánh')
INSERT INTO TACGIA VALUES ('MS0015', N'Nguyễn Nhật Ánh')
INSERT INTO TACGIA VALUES ('MS0016', N'Nguyễn Nhật Ánh')

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng NXB
CREATE TABLE dbo.NXB(
	MaNXB	CHAR(10) PRIMARY KEY,
	TenNXB	NVARCHAR(50) NULL,
	DiaChi	NVARCHAR(50) NULL,
	SoDT	CHAR(15) NULL
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng NXB
INSERT INTO NXB VALUES ('NXB0001', N'Addison Wesley', N'DC NXB AW', '0911223344')
INSERT INTO NXB VALUES ('NXB0002', N'Nhà xuất bản 0002', N'Địa chỉ của Nhà xuất bản 0002', '0844558923')
INSERT INTO NXB VALUES ('NXB0003', N'Nhà xuất bản 0003', N'Địa chỉ của Nhà xuất bản 0003', '0172389372')
INSERT INTO NXB VALUES ('NXB0004', N'Nhà xuất bản 0004', N'Địa chỉ của Nhà xuất bản 0004', '0238492299')
INSERT INTO NXB VALUES ('NXB0005', N'Nhà xuất bản 0005', N'Địa chỉ của Nhà xuất bản 0005', '0677884456')
INSERT INTO NXB VALUES ('NXB0006', N'Charles Scribner"s Sons', N'153 - 157 Fifth Avenue, Thành phố New York', '0123456789')
INSERT INTO NXB VALUES ('NXB0007', N'Nhà xuất bản 0001', N'Địa chỉ của Nhà xuất bản 0007', '0822345678')
INSERT INTO NXB VALUES ('NXB0008', N'Scribner"s Magazine', N'New York', '0388776655')
INSERT INTO NXB VALUES ('NXB0009', N'Nhà xuất bản 0001', N'Địa chỉ của Nhà xuất bản 0009', '0987654321')
INSERT INTO NXB VALUES ('NXB0010', N'Nhà xuất bản Khoa học và Kỹ thuật', N'70 Trần Hưng Đạo - Hoàn Kiếm - Hà Nội', '0439423172')
INSERT INTO NXB VALUES ('NXB0011', N'Nhà xuất bản Trẻ', N'161B Lý Chính Thắng - Phường 7 - Quận 3 - TPHCM', '02839316289')

--------------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng DAUSACH
ALTER TABLE DAUSACH WITH CHECK ADD FOREIGN KEY(MaNXB) REFERENCES NXB(MaNXB)
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng MUON
CREATE TABLE dbo.MUON(
	MaCuon	 CHAR(10) REFERENCES CUONSACH(MaCuon),
	MaDG	 CHAR(10),
	NgayMuon DATE DEFAULT GETDATE(),
	NgayTra	 DATE DEFAULT GETDATE(),
	PRIMARY KEY (MaCuon, MaDG),
	CONSTRAINT MUON_NGAY CHECK (NgayMuon <= NgayTra)
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng MUON
INSERT INTO MUON VALUES ('C01', 'DG0001', '2019-03-15', '2019-03-30')
INSERT INTO MUON VALUES ('C02', 'DG0001', '2019-03-15', '2019-03-30')
INSERT INTO MUON VALUES ('C03', 'DG0001', '2019-03-15', '2019-03-30')
INSERT INTO MUON VALUES ('C09', 'DG0001', '2019-03-15', '2019-03-30')
INSERT INTO MUON VALUES ('C10', 'DG0001', '2019-03-15', '2019-03-30')
INSERT INTO MUON VALUES ('C04', 'DG0002', '2019-09-15', '2019-09-30')
INSERT INTO MUON VALUES ('C05', 'DG0002', '2019-05-15', '2019-05-30')
INSERT INTO MUON VALUES ('C06', 'DG0003', '2019-11-10', '2019-11-25')
INSERT INTO MUON VALUES ('C07', 'DG0003', '2019-11-10', '2019-11-25')
INSERT INTO MUON VALUES ('C08', 'DG0003', '2019-11-10', '2019-11-25')
INSERT INTO MUON VALUES ('C11', 'DG0003', '2019-11-10', '2019-11-25')
INSERT INTO MUON VALUES ('C12', 'DG0004', '2019-07-15', '2019-07-30')
INSERT INTO MUON VALUES ('C15', 'DG0005', '2019-06-15', '2019-06-30')
INSERT INTO MUON VALUES ('C16', 'DG0005', '2019-06-15', '2019-06-30')

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng DOCGIA
CREATE TABLE dbo.DOCGIA(
	MaDG	CHAR(10) PRIMARY KEY,
	TenDG	NVARCHAR(50) NULL,
	DiaChi	NVARCHAR(50) NULL,
	SoDT	CHAR(15) NULL
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng DOCGIA
INSERT INTO DOCGIA VALUES ('DG0001', N'Nguyễn Văn A', N'34 Võ Văn Ngân - Thủ Đức', '0384669973')
INSERT INTO DOCGIA VALUES ('DG0002', N'Lê Thanh Thảo', N'Dĩ An - Bình Dương', '0465728388')
INSERT INTO DOCGIA VALUES ('DG0003', N'Hồ Hữu Phước', N'Thủ Đức', '027756712')
INSERT INTO DOCGIA VALUES ('DG0004', N'Nguyễn Huỳnh Minh Tiến', N'Thủ Đức', '0388963345')
INSERT INTO DOCGIA VALUES ('DG0005', N'Hà Thủy Tiên', N'Thủ Đức', '037786998')

--------------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng MUON
ALTER TABLE MUON WITH CHECK ADD FOREIGN KEY(MaDG) REFERENCES DOCGIA(MaDG)
GO


--------------------------------------------------------------------------------------
--                        BÀI 3 - CSDL QUẢN LÝ CƠ QUAN                              --
--------------------------------------------------------------------------------------

CREATE DATABASE QUANLYCOQUAN
GO

USE QUANLYCOQUAN
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng NV
CREATE TABLE dbo.NV(
	MSNV	 CHAR(10) PRIMARY KEY,
	TEN		 NVARCHAR(40),
	MSCOQUAN CHAR(10),
	CONGVIEC NVARCHAR(40),
	LUONG	 INT
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng NV
INSERT INTO NV VALUES ('NV001', N'Trần Thị Thanh Thúy', '15', N'Kế toán', 20000)
INSERT INTO NV VALUES ('NV002', N'Lê Chiến Thắng', '20', N'Hành chính', 22000)
INSERT INTO NV VALUES ('NV003', N'Lê Hạnh Như', '25', N'Thư ký', 30000)
INSERT INTO NV VALUES ('NV004', N'Nguyễn Văn Thắng', '50', N'Quản lý', 50000)
INSERT INTO NV VALUES ('NV005', N'Cao Tùng Anh', '20', N'Bảo vệ', 13000)
INSERT INTO NV VALUES ('NV006', N'Trần Thanh Tài', '22', N'Văn thư', 18000)
INSERT INTO NV VALUES ('NV007', N'Đỗ Thanh Phong', '22', N'Bảo vệ', 13000)
INSERT INTO NV VALUES ('NV008', N'Nguyễn Minh Nhân', '25', N'Trưởng phòng', 50000)
INSERT INTO NV VALUES ('NV009', N'Lưu Hoài Bảo', '15', N'Hành chính', 22000)
INSERT INTO NV VALUES ('NV010', N'Nguyễn Thanh Phong', '50', N'Giám đốc', 100000)
INSERT INTO NV VALUES ('NV011', N'Lê Thị Như Thanh', '50', N'Trưởng phòng', 50000)
INSERT INTO NV VALUES ('NV012', N'Đỗ Thị Thanh Thảo', '50', N'Thư ký', 30000)
GO

--------------------------------------------------------------------------------------
-- Tạo cấu trúc bảng COQUAN
CREATE TABLE dbo.COQUAN(
	MSCOQUAN	CHAR(10) PRIMARY KEY,
	TENCOQUAN	NVARCHAR(40),
	DIACHI		NVARCHAR(40)
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng COQUAN
INSERT INTO COQUAN VALUES ('15', N'Cơ quan A', N'Đồ Sơn')
INSERT INTO COQUAN VALUES ('20', N'Cơ quan B', N'Hạ Long')
INSERT INTO COQUAN VALUES ('22', N'Cơ quan C', N'Hạ Long')
INSERT INTO COQUAN VALUES ('25', N'Cơ quan D', N'Đồ Sơn')
INSERT INTO COQUAN VALUES ('50', N'Ban lãnh đạo', N'Đồ Sơn')
GO

--------------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng NV
ALTER TABLE NV WITH CHECK ADD FOREIGN KEY(MSCOQUAN) REFERENCES COQUAN(MSCOQUAN)
GO


--------------------------------------------------------------------------------------
--                          BÀI 4 - CSDL QUẢN LÝ GARA                               --
--------------------------------------------------------------------------------------

CREATE DATABASE QUANLYGARA
GO

USE QUANLYGARA
GO

-----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng THO
CREATE TABLE THO(
	MaTho		CHAR(10) PRIMARY KEY,
	TenTho		NVARCHAR(30),
	Nhom		CHAR(5),
	NhomTruong	CHAR(10) NULL
)
GO

-----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng THO
INSERT INTO THO VALUES ('T001', N'Nguyễn Trường An', 'N01', 'T010')
INSERT INTO THO VALUES ('T002', N'Trần Thanh Tài', 'N01', 'T010')
INSERT INTO THO VALUES ('T003', N'Lê Thanh Danh', 'N02', 'T005')
INSERT INTO THO VALUES ('T004', N'Cao Thành Tâm', 'N02', 'T005')
INSERT INTO THO VALUES ('T005', N'Lý Thành Đạt', 'N02', 'T005')
INSERT INTO THO VALUES ('T006', N'Nguyễn Trung Sơn', 'N03', 'T006')
INSERT INTO THO VALUES ('T007', N'Lý Văn Đông', 'N03', 'T006')
INSERT INTO THO VALUES ('T008', N'Trần Văn Thịnh', 'N03', 'T006')
INSERT INTO THO VALUES ('T009', N'Nguyễn Văn Phát', 'N03', 'T006')
INSERT INTO THO VALUES ('T010', N'Lê Văn Đạt', 'N01', 'T010')
GO

-----------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng THO
ALTER TABLE THO WITH CHECK ADD FOREIGN KEY(NhomTruong) REFERENCES THO(MaTho)
GO

-----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng CONGVIEC
CREATE TABLE CONGVIEC(
	MaCV		CHAR(10) PRIMARY KEY,
	NoiDungCV	NVARCHAR(100)
)
GO

-----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng CONGVIEC
INSERT INTO CONGVIEC VALUES ('CV00001', N'Thay nhớt')
INSERT INTO CONGVIEC VALUES ('CV00002', N'Thay lốp xe')
INSERT INTO CONGVIEC VALUES ('CV00003', N'Rửa xe')
INSERT INTO CONGVIEC VALUES ('CV00004', N'Thay gương chiếu hậu')
INSERT INTO CONGVIEC VALUES ('CV00005', N'Vá xe')
INSERT INTO CONGVIEC VALUES ('CV00006', N'Thay vỏ xe')
INSERT INTO CONGVIEC VALUES ('CV00007', N'Thay ắc quy')
INSERT INTO CONGVIEC VALUES ('CV00008', N'Thay bugi')
INSERT INTO CONGVIEC VALUES ('CV00009', N'Thay túi chống sốc')
INSERT INTO CONGVIEC VALUES ('CV00010', N'Thay đèn xe')
INSERT INTO CONGVIEC VALUES ('CV00011', N'Thay kính xe')
INSERT INTO CONGVIEC VALUES ('CV00012', N'Bảo dưỡng toàn bộ')
GO

-----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng HOPDONG
CREATE TABLE HOPDONG(
	SoHD		CHAR(10) PRIMARY KEY,
	NgayHD		DATE,
	MaKH		CHAR(10),
	SoXe		CHAR(20),
	TriGiaHD	INT,
	NgayGiaoDK	DATE,
	NgayNgThu	DATE,
	CONSTRAINT HOPDONG_NGAY CHECK ((NgayHD <= NgayGiaoDK) AND (NgayHD <= NgayNgThu))
)
GO

-----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng HOPDONG
INSERT INTO HOPDONG VALUES ('HD00001', '2002-12-01', 'KH00001', '0000000000', 5000000, '2002-12-25', '2002-12-28')
INSERT INTO HOPDONG VALUES ('HD00002', '2002-11-28', 'KH00002', '1111111111', 2500000, '2002-12-01', '2002-12-01')
INSERT INTO HOPDONG VALUES ('HD00003', '2002-12-01', 'KH00003', '2222222222', 1800000, '2002-12-01', '2002-12-01')
INSERT INTO HOPDONG VALUES ('HD00004', '2002-12-11', 'KH00004', '3333333333', 2300000, '2002-12-11', '2002-12-11')
INSERT INTO HOPDONG VALUES ('HD00005', '2002-12-05', 'KH00005', '4444444444', 4800000, '2002-12-25', '2002-12-28')
INSERT INTO HOPDONG VALUES ('HD00006', '2002-11-28', 'KH00006', '5555555555', 4200000, '2002-12-18', '2002-12-20')
INSERT INTO HOPDONG VALUES ('HD00007', '2002-12-01', 'KH00007', '6666666666', 6500000, '2002-12-25', '2002-12-28')
INSERT INTO HOPDONG VALUES ('HD00008', '2003-01-02', 'KH00008', '7777777777', 1500000, '2003-01-02', '2003-01-02')
INSERT INTO HOPDONG VALUES ('HD00009', '2003-01-02', 'KH00009', '8888888888', 1600000, '2003-01-02', '2003-01-02')
INSERT INTO HOPDONG VALUES ('HD00010', '2002-12-31', 'KH00010', '9999999999', 3700000, '2003-01-05', '2003-01-07')
GO

-----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng KHACHHANG
CREATE TABLE KHACHHANG(
	MaKH		CHAR(10) PRIMARY KEY,
	TenKH		NVARCHAR(30),
	DiaChi		NVARCHAR(40),
	DienThoai	VARCHAR(15),
	CONSTRAINT U_KH UNIQUE (MaKH, TenKH, DiaChi, DienThoai)
)
GO

-----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng KHACHHANG
INSERT INTO KHACHHANG VALUES ('KH00001', N'Nguyễn Thanh Phong', N'123 - Võ Văn Ngân - Thủ Đức', '0123456789')
INSERT INTO KHACHHANG VALUES ('KH00002', N'Lê Thị Thanh Hằng', N'24 Lê Văn Việt - Quận 9', '0123948090')
INSERT INTO KHACHHANG VALUES ('KH00003', N'Lê Thảo Nguyên', N'Dĩ An', '0934512987')
INSERT INTO KHACHHANG VALUES ('KH00004', N'Phan Đình Tuấn', N'Thủ Đức', '09352776122')
INSERT INTO KHACHHANG VALUES ('KH00005', N'Cao Văn Pháp', N'QUận 2', '0892483345')
INSERT INTO KHACHHANG VALUES ('KH00006', N'Lý Chiến Thắng', N'34 Dân Chủ - Thủ Đức', '08877934728')
INSERT INTO KHACHHANG VALUES ('KH00007', N'Nguyễn Lê Phương', N'37 Bác Ái - Thủ Đức', '0982311276')
INSERT INTO KHACHHANG VALUES ('KH00008', N'Trần Thanh Tiến', N'Thủ Đức', '0976555123')
INSERT INTO KHACHHANG VALUES ('KH00009', N'Phan Kim Tuyết', N'Thủ Đức', '0976382998')
INSERT INTO KHACHHANG VALUES ('KH00010', N'Cao Mỹ Kim', N'Quận 9', '0982225671')
GO

-----------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng HOPDONG
ALTER TABLE HOPDONG WITH CHECK ADD FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH)
GO

-----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng CHITIET_HD
CREATE TABLE CHITIET_HD(
	SoHD	 CHAR(10) REFERENCES HOPDONG(SoHD),
	MaCV	 CHAR(10) REFERENCES CONGVIEC(MaCV),
	TriGiaCV INT,
	MaTho	 CHAR(10) REFERENCES THO(MaTho),
	KhoanTho INT,
	PRIMARY KEY (SoHD, MaCV)
)
GO

-----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng CHITIET_HD
INSERT INTO CHITIET_HD VALUES ('HD00001', 'CV00006', 5000000, 'T005', 5000000)
INSERT INTO CHITIET_HD VALUES ('HD00002', 'CV00011', 2500000, 'T002', 2500000)
INSERT INTO CHITIET_HD VALUES ('HD00003', 'CV00010', 1800000, 'T003', 1800000)
INSERT INTO CHITIET_HD VALUES ('HD00004', 'CV00009', 2300000, 'T003', 2300000)
INSERT INTO CHITIET_HD VALUES ('HD00005', 'CV00008', 4800000, 'T007', 4800000)
INSERT INTO CHITIET_HD VALUES ('HD00006', 'CV00007', 4200000, 'T010', 4200000)
INSERT INTO CHITIET_HD VALUES ('HD00007', 'CV00012', 5000000, 'T008', 5000000)
INSERT INTO CHITIET_HD VALUES ('HD00007', 'CV00001', 1500000, 'T003', 1500000)
INSERT INTO CHITIET_HD VALUES ('HD00008', 'CV00001', 1500000, 'T004', 1500000)
INSERT INTO CHITIET_HD VALUES ('HD00009', 'CV00005', 1600000, 'T004', 1600000)
INSERT INTO CHITIET_HD VALUES ('HD00010', 'CV00002', 3700000, 'T001', 3700000)
GO

-----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng PHIEUTHU
CREATE TABLE PHIEUTHU(
	SoPT		CHAR(10) PRIMARY KEY,
	NgayLapPT	DATE,
	SoHD		CHAR(10) REFERENCES HOPDONG(SoHD),
	MaKH		CHAR(10) REFERENCES KHACHHANG(MaKH),
	HoTen		NVARCHAR(30),
	SoTienThu	INT
)
GO

-----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng PHIEUTHU
INSERT INTO PHIEUTHU VALUES ('PT00001', '2002-12-01', 'HD00002', 'KH00002', N'Nguyễn Văn A', 2500000)
INSERT INTO PHIEUTHU VALUES ('PT00002', '2002-12-01', 'HD00003', 'KH00003', N'Lê Thảo Nguyên', 1800000)
INSERT INTO PHIEUTHU VALUES ('PT00003', '2002-12-11', 'HD00004', 'KH00004', N'Phan Đình Tuấn', 2300000)
INSERT INTO PHIEUTHU VALUES ('PT00004', '2002-12-18', 'HD00006', 'KH00006', N'Lý Chiến Thắng', 3000000)
INSERT INTO PHIEUTHU VALUES ('PT00005', '2002-12-20', 'HD00006', 'KH00006', N'Lý Chiến Thắng', 1200000)
INSERT INTO PHIEUTHU VALUES ('PT00006', '2002-12-25', 'HD00005', 'KH00005', N'Cao Văn Pháp', 3000000)
INSERT INTO PHIEUTHU VALUES ('PT00007', '2002-12-25', 'HD00007', 'KH00007', N'Nguyễn Lê Phương', 4000000)
INSERT INTO PHIEUTHU VALUES ('PT00008', '2002-12-28', 'HD00007', 'KH00007', N'Nguyễn Lê Phương', 1500000)
INSERT INTO PHIEUTHU VALUES ('PT00009', '2002-12-28', 'HD00001', 'KH00001', N'Nguyễn Thanh Phong', 5000000)
INSERT INTO PHIEUTHU VALUES ('PT00010', '2002-12-28', 'HD00005', 'KH00005', N'Cao Văn Pháp', 1800000)
INSERT INTO PHIEUTHU VALUES ('PT00011', '2003-01-02', 'HD00008', 'KH00008', N'Trần Thanh Tiến', 1500000)
INSERT INTO PHIEUTHU VALUES ('PT00012', '2003-01-02', 'HD00009', 'KH00009', N'Phan Kim Tuyết', 1600000)
INSERT INTO PHIEUTHU VALUES ('PT00013', '2003-01-05', 'HD00010', 'KH00010', N'Trần Văn B', 2000000)
INSERT INTO PHIEUTHU VALUES ('PT00014', '2003-01-07', 'HD00010', 'KH00010', N'Cao Mỹ Kim', 1700000)
GO


-----------------------------------------------------------------------------------
--                        BÀI 5 - CSDL QUẢN LÝ TRƯỜNG HỌC                        --
-----------------------------------------------------------------------------------

CREATE DATABASE QUANLYTRUONGHOC
GO

USE QUANLYTRUONGHOC
GO

----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng GV
CREATE TABLE GV(
	MAGV	CHAR(10) PRIMARY KEY,
	TENGV	NVARCHAR(30),
	MAMH	CHAR(10)
)
GO

----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng GV
INSERT INTO GV VALUES ('GV001', N'Lê Thành Tài', 'MH0006')
INSERT INTO GV VALUES ('GV002', N'Trần Thiện Thanh', 'MH0002')
INSERT INTO GV VALUES ('GV003', N'Nguyễn Thanh Thúy', NULL)
INSERT INTO GV VALUES ('GV004', N'Cao Thanh Tiến', NULL)
INSERT INTO GV VALUES ('GV005', N'Trần Thảo Tiên', 'MH0003')
INSERT INTO GV VALUES ('GV006', N'Lê Duy Thắng', NULL)
INSERT INTO GV VALUES ('GV007', N'Lý Thanh Nguyên', NULL)
INSERT INTO GV VALUES ('GV008', N'Nguyễn Văn Thanh', NULL)
INSERT INTO GV VALUES ('GV009', N'Trần Thị Thùy Trang', 'MH0004')
INSERT INTO GV VALUES ('GV010', N'Lê Văn Tài', NULL)
INSERT INTO GV VALUES ('GV011', N'Trương Minh Thắng', NULL)
INSERT INTO GV VALUES ('GV012', N'Nguyễn Minh Tiến', NULL)
INSERT INTO GV VALUES ('GV013', N'Lê Thanh Danh', NULL)
INSERT INTO GV VALUES ('GV014', N'Trần Tiến Đức', NULL)
INSERT INTO GV VALUES ('GV015', N'Lý Thành Đạt', NULL)
INSERT INTO GV VALUES ('GV016', N'Trần Thanh Tiến', NULL)
INSERT INTO GV VALUES ('GV017', N'Nguyễn Thành Nhân', NULL)
INSERT INTO GV VALUES ('GV018', N'Nguyễn Tiến Phước', 'MH0005')
INSERT INTO GV VALUES ('GV019', N'Lê Thị Thảo Nguyên', NULL)
INSERT INTO GV VALUES ('GV020', N'Nguyễn Thị Như Thảo', 'MH0001')
INSERT INTO GV VALUES ('GV021', N'Lê Quyết Thắng', NULL)
INSERT INTO GV VALUES ('GV022', N'Trần Thành Đạt', NULL)
INSERT INTO GV VALUES ('GV023', N'Nguyễn Huy Hoàng', NULL)
GO

----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng MHOC
CREATE TABLE MHOC(
	MAMH	CHAR(10) PRIMARY KEY,
	TENMH	NVARCHAR(30) UNIQUE,
	SOTIET	TINYINT
)
GO

----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng MHOC
INSERT INTO MHOC VALUES ('MH0001', N'Văn học', 45)
INSERT INTO MHOC VALUES ('MH0002', N'Toán', 45)
INSERT INTO MHOC VALUES ('MH0003', N'Vật lý', 30)
INSERT INTO MHOC VALUES ('MH0004', N'Anh văn', 30)
INSERT INTO MHOC VALUES ('MH0005', N'Hóa học', 30)
INSERT INTO MHOC VALUES ('MH0006', N'Sinh hoc', 30)
GO

----------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng GV
ALTER TABLE GV WITH CHECK ADD FOREIGN KEY(MAMH) REFERENCES MHOC(MAMH)
GO

----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng BUOITHI
CREATE TABLE BUOITHI(
	HKY		TINYINT,
	NGAY	DATE,
	GIO		TIME,
	PHG		NVARCHAR(10),
	MAMH	CHAR(10) NOT NULL REFERENCES MHOC(MAMH),
	TGTHI	TINYINT,
	PRIMARY KEY (HKY, NGAY, GIO, PHG),
	CONSTRAINT MAMH_TGTHI UNIQUE (MAMH, TGTHI)
)
GO

----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng BUOITHI
INSERT INTO BUOITHI VALUES (1, '2019-12-20', '07:30', 'B202', 'MH0001', 150)
INSERT INTO BUOITHI VALUES (1, '2019-12-22', '07:30', 'A304', 'MH0002', 150)
INSERT INTO BUOITHI VALUES (1, '2019-12-24', '07:30', 'C104', 'MH0003', 120)
INSERT INTO BUOITHI VALUES (1, '2019-12-26', '07:30', 'C103', 'MH0004', 120)
INSERT INTO BUOITHI VALUES (1, '2019-12-28', '07:30', 'B305', 'MH0005', 120)
INSERT INTO BUOITHI VALUES (1, '2019-12-30', '07:30', 'A201', 'MH0006', 120)
GO

----------------------------------------------------------------------------------
-- Tạo cấu trúc bảng PC_COI_THI
CREATE TABLE PC_COI_THI(
	MAGV	CHAR(10) NOT NULL REFERENCES GV(MAGV),
	HK		TINYINT,
	NGAY	DATE,
	GIO		TIME,
	PHG		NVARCHAR(10),
	PRIMARY KEY (MAGV, HK, NGAY, GIO, PHG),
	CONSTRAINT FK_THI FOREIGN KEY (HK, NGAY, GIO, PHG) REFERENCES BUOITHI(HKY, NGAY, GIO, PHG)
)
GO

----------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng PC_COI_THI
INSERT INTO PC_COI_THI VALUES ('GV001', 1, '2019-12-20', '07:30', 'B202')
INSERT INTO PC_COI_THI VALUES ('GV009', 1, '2019-12-22', '07:30', 'A304')
INSERT INTO PC_COI_THI VALUES ('GV007', 1, '2019-12-24', '07:30', 'C104')
INSERT INTO PC_COI_THI VALUES ('GV011', 1, '2019-12-26', '07:30', 'C103')
INSERT INTO PC_COI_THI VALUES ('GV020', 1, '2019-12-28', '07:30', 'B305')
INSERT INTO PC_COI_THI VALUES ('GV004', 1, '2019-12-30', '07:30', 'A201')
GO