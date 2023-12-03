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