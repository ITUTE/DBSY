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
INSERT INTO PC_COI_THI VALUES ('GV017', 1, '2019-12-28', '07:30', 'B305')
INSERT INTO PC_COI_THI VALUES ('GV004', 1, '2019-12-30', '07:30', 'A201')
GO