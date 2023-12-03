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
INSERT INTO TACGIA VALUES ('MS0012', N'Vũ Quý Điềm')
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
INSERT INTO NXB VALUES ('NXB0001', N'Nhà xuất bản 0001', N'Địa chỉ của Nhà xuất bản 0001', '0911223344')
INSERT INTO NXB VALUES ('NXB0002', N'Nhà xuất bản 0001', N'Địa chỉ của Nhà xuất bản 0002', '0844558923')
INSERT INTO NXB VALUES ('NXB0003', N'Nhà xuất bản 0001', N'Địa chỉ của Nhà xuất bản 0003', '0172389372')
INSERT INTO NXB VALUES ('NXB0004', N'Nhà xuất bản 0001', N'Địa chỉ của Nhà xuất bản 0004', '0238492299')
INSERT INTO NXB VALUES ('NXB0005', N'Nhà xuất bản 0001', N'Địa chỉ của Nhà xuất bản 0005', '0677884456')
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
	NgayMuon DATE NULL,
	NgayTra	 DATE NULL,
	PRIMARY KEY (MaCuon, MaDG)
)
GO

--------------------------------------------------------------------------------------
-- Nhập dữ liệu cho bảng MUON
INSERT INTO MUON VALUES ('C01', 'DG0001', '2019-03-15', '2019-03-30')
INSERT INTO MUON VALUES ('C02', 'DG0001', '2019-03-15', '2019-03-30')
INSERT INTO MUON VALUES ('C03', 'DG0001', '2019-03-15', '2019-03-30')
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
INSERT INTO DOCGIA VALUES ('DG0001', N'Nguyễn Văn Thanh', N'34 Võ Văn Ngân - Thủ Đức', '0384669973')
INSERT INTO DOCGIA VALUES ('DG0002', N'Lê Thanh Thảo', N'Dĩ An - Bình Dương', '0465728388')
INSERT INTO DOCGIA VALUES ('DG0003', N'Hồ Hữu Phước', N'Thủ Đức', '027756712')
INSERT INTO DOCGIA VALUES ('DG0004', N'Nguyễn Huỳnh Minh Tiến', N'Thủ Đức', '0388963345')
INSERT INTO DOCGIA VALUES ('DG0005', N'Hà Thủy Tiên', N'Thủ Đức', '037786998')

--------------------------------------------------------------------------------------
-- Thêm khóa ngoại cho bảng MUON
ALTER TABLE MUON WITH CHECK ADD FOREIGN KEY(MaDG) REFERENCES DOCGIA(MaDG)
GO