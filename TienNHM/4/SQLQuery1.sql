-- Tạo CSDL QLNV. Chỉ tạo một lần
-- Có thể thực hiện tất cả các lệnh trong một lần theo thứ tự từ trên xuống hoặc 
-- quét chuột bôi đen các câu lệnh muốn thực hiện rồi click chuột vào nút Execute
CREATE DATABASE QUANLYNHANVIEN
GO

-- Tạo CSDL QLNV
USE QUANLYNHANVIEN
GO
--Tạo bảng PhongBan
-- Cột Trphong phải có cùng kiểu dữ liệu với cột Manv trong bảng NhanVien
CREATE TABLE dbo.PhongBan(
	MaPB		INT PRIMARY KEY,
	TenPB		NVARCHAR(10) NULL,
	TrPhong		CHAR(4) NULL,
	NgNhanChuc	DATE NULL
)
GO

-- Tạo cấu trúc bảng Nhân viên
-- Cột MaNQL là khóa ngoại tham chiếu đến cột Manv cũng trong bảng này. Nhưng ta chưa tạo khóa ngoại lúc này để dễ nhập data
-- Khi nhập dữ liệu xong sẽ khai báo thêm khóa ngoại
-- Cột MaNQL phải có cùng kiểu dữ liệu với cột Manv
-- Cột Phong phải có cùng kiểu dữ liệu với cột MaPB trong bảng PhongBan
CREATE TABLE dbo.NhanVien(
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
Go
-- Nhập giá trị vào bảng Nhân viên, nhập theo đúng thứ tự các thuộc tính trong bảng
-- Chú ý Nhập giá trị trong cột MaNQL phải là các giá trị có trong cột Manv
INSERT INTO Nhanvien VALUES ('nv01', 'Nguyen', 'Ngọc', 'Hoang', '1972-08-13', '111 Vo Van Ngan', 'Nam', 30000, 'NV02', 1)
INSERT INTO Nhanvien VALUES ('nv02', 'Nguyen', 'Quang', 'Ngoc', '1975-08-23', '111 Nguyen Van Troi', 'Nam', 25000, 'NV15', 1)
INSERT INTO Nhanvien VALUES ('nv03', 'Le', 'Thi', 'Ngọc', '1980-08-13', '111 Duong 3/2', 'Nu', 28000, 'NV15', 2)
INSERT INTO Nhanvien VALUES ('nv04', 'Le', 'Ngọc', 'Hoang', '1982-08-18', '111 Le Van Duyet', 'Nam', 15000, 'NV03', 2)
INSERT INTO Nhanvien VALUES ('nv05', 'Nguyen', 'Thi', 'Ngọc', '1992-08-13', '108 Vo Van Ngan', 'Nu', 28000, 'NV06', 3)
INSERT INTO Nhanvien VALUES ('nv06', 'Truong', 'Anh', 'Kiet', '1960-12-13', '11 Hai Ba Trung', 'Nam', 30000, 'NV15', 3)
INSERT INTO Nhanvien VALUES ('nv07', 'Le', 'Phung', 'Hieu', '1972-08-13', '11 Hau Giang', 'Nam', 10000, 'NV15', 4)
INSERT INTO Nhanvien VALUES ('nv08', 'Nguyen', 'Bao', 'Hung', '1978-08-23', '10 Tran Hung Dao', 'Nam', 20000, 'NV15', 5)
INSERT INTO Nhanvien VALUES ('nv09', 'Nguyen', 'Bao', 'Hoang', '1972-08-13', '111 Tran Hung Dao', 'Nam', 10000, 'NV15', 6)
INSERT INTO Nhanvien VALUES ('nv10', 'Le', 'Hoang', 'Ngọc', '1972-08-13', '11 Lac Long Quan', 'Nam', 10000, 'NV15', 7)
INSERT INTO Nhanvien VALUES ('nv11', 'Nguyen', 'Bao','Ngọc', '1972-08-13', '111 Minh Phung', 'Nu', 15000, 'NV15', 8)
INSERT INTO Nhanvien VALUES ('nv12', 'Nguyen', 'Ngọc', 'A', '1982-08-13', '11 Nguyen Duy Trinh', 'Nam', 10000, 'NV11', 8)
INSERT INTO Nhanvien VALUES ('nv13', 'Le', 'Quang', 'Hoang', '1979-08-23', '10 Ly Chinh Thang', 'Nam', 15000, 'NV15', 9)
INSERT INTO Nhanvien VALUES ('nv14', 'Nguyen', 'Quang', 'Hoang', '1972-08-13', '11 Le Van Thinh', 'Nam', 10000, 'NV13', 9)
INSERT INTO Nhanvien VALUES ('nv15', 'Dang', 'Tan', 'Dung', '1960-08-13', '23 Vo Van Ngan', 'Nam', 50000, NULL, 10)
Go
-- Nhập giá trị vào bảng PhongBan, nhập theo đúng thứ tự các thuộc tính trong bảng
-- Kiểu dữ liệu Data nhập theo dạng: 'YYYY-MM-DD' (Year-Month-Day)
-- Chú ý nhập giá trị cột TrPhong là các giá trị có trong cột Manv của bảng Nhân viên
INSERT INTO PhongBan VALUES (1, 'Nghien cuu', 'nv02', '2013-12-12');
INSERT INTO PhongBan VALUES (2, 'To chuc', 'nv03', '2013-11-21');
INSERT INTO PhongBan VALUES (3, 'Vat tu', 'nv06', '2013-1-25');
INSERT INTO PhongBan VALUES (4, 'Dao tao', 'nv15', '2013-2-19');
INSERT INTO PhongBan VALUES (5, 'Kinh doanh', 'nv15', '2013-08-18');
INSERT INTO PhongBan VALUES (6, 'Doi ngoai', 'nv15', '2013-10-17');
INSERT INTO PhongBan VALUES (7, 'Xay dung', 'nv15', '2013-02-20');
INSERT INTO PhongBan VALUES (8, 'QL Du an', 'nv11', '2013-12-12');
INSERT INTO PhongBan VALUES (9, 'Ke toan', 'nv13', '2013-12-12');
INSERT INTO PhongBan VALUES (10, 'BGD', 'nv15', '2010-11-29');
GO
-- Thêm hai khóa ngoại cho bảng NhanVien
ALTER TABLE NHANVIEN WITH CHECK ADD FOREIGN KEY(MaNQL) REFERENCES NhanVien(Manv)
GO
ALTER TABLE NHANVIEN  WITH CHECK ADD FOREIGN KEY(Phong) REFERENCES PhongBan(MaPB)
GO

-- Tạo cấu trúc bảng Địa điểm - Phòng
-- Cột MaPB tham chiếu đến MaPB trong bảng PhongBan nên phải có kiểu dữ liệu giống kiểu dữ liệu của cột MaPB trong bảng PhongBan
CREATE TABLE DIADIEM_PHONG(
		MaPB	INT REFERENCES PhongBan(MaPB),
		DiaDiem	NVARCHAR(30),
		PRIMARY KEY (MaPB, DiaDiem) -- khai báo khóa chính gồm 2 cột
		)
GO
-- Nhập dữ liệu cho bảng DIADIEM_PHONG
INSERT INTO DIADIEM_PHONG VALUES(1, 'Tang tret - Khu A')
INSERT INTO DIADIEM_PHONG VALUES(2, 'Tang 1 - Khu A')
INSERT INTO DIADIEM_PHONG VALUES(3, 'Tang tret - Khu B')
INSERT INTO DIADIEM_PHONG VALUES(4, 'Tang tret - Khu C')
INSERT INTO DIADIEM_PHONG VALUES(5, 'Tang tret - Khu E')
INSERT INTO DIADIEM_PHONG VALUES(6, 'Tang tret - Khu Bát giác')
INSERT INTO DIADIEM_PHONG VALUES(7, 'Tang tret - Khu Trung tâm')
INSERT INTO DIADIEM_PHONG VALUES(8, 'Tang 1 - Khu Trung tâm')
INSERT INTO DIADIEM_PHONG VALUES(9, 'Tang 2 - Khu Trung tâm')
INSERT INTO DIADIEM_PHONG VALUES(10, 'Tang 3 - Khu Trung tâm')
GO
-- Tạo cấu trúc bảng Dự án
-- Cột Phong là khóa ngoại tham chiếu đến cột MaPB bên bảng PhongBan
CREATE TABLE DUAN(
	MaDA	CHAR(4) PRIMARY KEY,
	TenDA	NVARCHAR(30),
	DiaDiem	NVARCHAR(30),
	Phong	INT REFERENCES PhongBan(MaPB)
	)
GO
-- Nhập dữ liệu cho bảng DUAN
INSERT INTO DUAN VALUES ('DA01', 'Cap thoat nuoc', 'Go Vap', 9)
INSERT INTO DUAN VALUES ('DA02', 'Ban chung cu', 'Thu Thiem', 5)
INSERT INTO DUAN VALUES ('DA03', 'Xay biet thu', 'Thu Duc', 7)
INSERT INTO DUAN VALUES ('DA04', 'Lien ket dao tao', 'Go Vap', 4)
INSERT INTO DUAN VALUES ('DA05', 'Cung cap vat tu', 'Quan 2', 3)
INSERT INTO DUAN VALUES ('DA06', 'Huan luyen', 'Go Vap', 4)
GO
-- Tạo cấu trúc bảng PHANCONG
-- Cột MaNV tham chiếu đến cột MaNV trong bảng NhanVien nên chúng phải có cùng kiểu dữ liệu
-- Cột MaDA tham chiếu đến cột MaDA trong bảng DUAN nên chúng phải có cùng kiểu dữ liệu
CREATE TABLE PhanCong(
	MaNV		CHAR(4) REFERENCES NhanVien(maNV),
	MaDA		CHAR(4) REFERENCES DuAn(MaDA),
	ThoiGian	INT,
	PRIMARY KEY (MaNV, MaDA)
	)
GO
-- Nhập dữ liệu
-- Giá trị trong cột MaNV phải có ở cột MaNV trong bảng NhanVien
-- Giá trị trong cột MaDA phải có ở cột MaDA trong bảng DuAN
INSERT INTO PhanCong VALUES ('nv01', 'DA01', 3)
INSERT INTO PhanCong VALUES ('nv01', 'DA02', 3)
INSERT INTO PhanCong VALUES ('nv02', 'DA01', 3)
INSERT INTO PhanCong VALUES ('nv02', 'DA03', 3)
INSERT INTO PhanCong VALUES ('nv03', 'DA04', 3)
INSERT INTO PhanCong VALUES ('nv04', 'DA03', 3)
INSERT INTO PhanCong VALUES ('nv09', 'DA04', 3)
INSERT INTO PhanCong VALUES ('nv01', 'DA05', 3)
INSERT INTO PhanCong VALUES ('nv05', 'DA05', 3)
INSERT INTO PhanCong VALUES ('nv07', 'DA06', 3)
INSERT INTO PhanCong VALUES ('nv08', 'DA06', 3)
GO
-- Tạo cấu trúc bảng ThanNhan
-- Cột MaNV tham chiếu đến cột MaNV bên bảng NhanVien nên chúng phải có cùng kiểu dữ liệu
CREATE TABLE ThanNhan(
		MaNV		CHAR(4) REFERENCES NhanVien(maNV),
		TenTN		NVARCHAR(20),
		Phai		NVARCHAR(3),
		NgaySinh	DATE,
		QuanHe		NVARCHAR(10),
		PRIMARY KEY (MaNV, TenTN)
		)
GO

-- Nhập dữ liệu
-- Giá trị trong cột MaNV phải có ở cột MaNV trong bảng NhanVien
INSERT INTO ThanNhan VALUES ('nv01', 'Nguyen Ngoc Huy', 'Nam', '2018-3-26','con')
INSERT INTO ThanNhan VALUES ('nv01', 'Nguyen Ngoc Hoa', 'Nu', '2020-3-26','con')
INSERT INTO ThanNhan VALUES ('nv02', 'Nguyen Ngoc Huy', 'Nam', '2018-3-26','con')
INSERT INTO ThanNhan VALUES ('nv02', 'Nguyen Ngoc Hoa', 'Nu', '2020-3-26','con')
INSERT INTO ThanNhan VALUES ('nv15', 'Dang Ngoc Hoa', 'Nu', '2020-3-26','con')
INSERT INTO ThanNhan VALUES ('nv01', 'Nguyen Nguyen Hung', 'Nam', '2020-3-26','con')
