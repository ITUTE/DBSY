-- Người thực hiện: Nguyễn Huỳnh Minh Tiến   Mã SV: 18110377
-- Em cam đoan tất cả các câu dưới đây đều do em viết code và đều đã chạy ra kết quả




-------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ BÀI 1 - CSDL QUẢN LÝ THÔNG TIN CỦA CÔNG TY -----------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

USE QUANLYNHANVIEN
GO

-- 1.	Hãy cho biết tên các dự án mà nhân viên có mã ‘NV01’ tham gia:
SELECT	TenDA
FROM	PHANCONG INNER JOIN DUAN ON PHANCONG.MaDA = DUAN.MaDA
WHERE	MaNV = 'NV01';

-- 2.	Tính tổng thời gian tham gia các dự án của mỗi nhân viên:
SELECT	NHANVIEN.MaNV, ISNULL(SUM(Thoigian), 0) AS TONG_ThoiGian
FROM	PHANCONG RIGHT OUTER JOIN NHANVIEN
		ON PHANCONG.MaNV=NHANVIEN.Manv
GROUP BY NHANVIEN.MaNV;

-- 3.	Cho biết họ tên các nhân  viên chưa tham gia dự án nào:
SELECT HoNV,Tenlot,TenNV
FROM (
		SELECT	MaNV, HoNV,Tenlot,TenNV
		FROM	NHANVIEN 
		EXCEPT 
		SELECT	PHANCONG.MaNV, HoNV,Tenlot,TenNV
		FROM	NHANVIEN INNER JOIN PHANCONG
				ON NHANVIEN.MaNV = PHANCONG.MaNV
		) AS TMP;

-- a.	Tìm ngày sinh và địa chỉ của nhân viên “Nguyễn Bảo Hùng”: 
SELECT	NgSinh, DChi
FROM	NHANVIEN
WHERE	HoNV=N'Nguyễn' AND Tenlot=N'Bảo' AND TenNV=N'Hùng';

-- b. 	Tìm tên và địa chỉ của các nhân viên làm việc cho phòng “Nghiên cứu”:
WITH NC AS
(	SELECT	MaPB
	FROM	PHONGBAN
	WHERE	TenPB = N'Nghiên cứu'
)
SELECT	HoNV,Tenlot,TenNV,DChi
FROM	NHANVIEN INNER JOIN NC
		ON NHANVIEN.Phong = NC.MaPB;

-- c. 	Với mỗi dự án được triển khai ở Gò Vấp, cho biết mã dự án, mã phòng quản lý và họ tên, ngày sinh trưởng phòng của phòng đó:
WITH TMP AS
(	SELECT MaDA, Phong, TrPhong
	FROM	(SELECT	* FROM	DUAN WHERE	Diadiem=N'Gò Vấp') AS DA_GV
			INNER JOIN PHONGBAN
			ON DA_GV.Phong=PHONGBAN.MaPB
)
SELECT MaDA, TMP.Phong, HoNV, Tenlot, TenNV, NgSinh
FROM	TMP INNER JOIN NHANVIEN
		ON TMP.TrPhong=NHANVIEN.MaNV;

-- d.	Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên của người quản lý nhân viên đó:
WITH NQL AS (SELECT * FROM NHANVIEN)
SELECT	NHANVIEN.HoNV, NHANVIEN.Tenlot, NHANVIEN.TenNV, NQL.HoNV AS HoNQL, NQL.Tenlot AS TenlotNQL, NQL.TenNV AS TenNQL
FROM	NHANVIEN INNER JOIN NQL
		ON NHANVIEN.MaNQL=NQL.MaNV;

-- e.	Cho biết mã nhân viên, họ và tên của các nhân viên của phòng “Nghiên cứu” có mức lương từ 30000 đến 50000:
WITH NC AS
(	SELECT	MaPB
	FROM	PHONGBAN
	WHERE	TenPB=N'Nghiên cứu'
)
SELECT	MaNV,HoNV,Tenlot,TenNV
FROM	NHANVIEN INNER JOIN NC
		ON NHANVIEN.Phong=NC.MaPB
WHERE	Luong BETWEEN 30000 AND 50000;

-- f.	Cho biết mã nhân viên, họ tên nhân viên, mã dự án và tên dự án của các dự án họ tham gia:
WITH TMP AS
(	SELECT DUAN.MaDA, MaNV, TenDA 
	FROM DUAN INNER JOIN PHANCONG
	ON DUAN.MaDA=PHANCONG.MaDA
)
SELECT	NHANVIEN.MaNV,   HoNV,   Tenlot,   TenNV,   MaDA,   TenDA
FROM	TMP INNER JOIN NHANVIEN
		ON TMP.MaNV=NHANVIEN.MaNV;

-- g.	Cho biết mã nhân viên, họ tên của những người không có người quản lý:
SELECT	MaNV,HoNV,Tenlot,TenNV
FROM	NHANVIEN
WHERE	MaNQL IS NULL;

-- h.	Cho biết họ tên của các trưởng phòng có thân nhân:
WITH TMP AS 
(	SELECT *  FROM	PHONGBAN INNER JOIN NHANVIEN 
	ON PHONGBAN.TrPhong=NHANVIEN.MaNV
)
SELECT DISTINCT	HoNV,Tenlot,TenNV
FROM	TMP	INNER JOIN THANNHAN
		ON TMP.MaNV=THANNHAN.MaNV;

-- i.	Tính tổng lương nhân viên, lương cao nhất, lương thấp nhất và mức lương trung bình:
SELECT	SUM(Luong) AS TONG, MAX(Luong) AS MAX_LUONG, MIN(Luong) AS MIN_LUONG, AVG(Luong) AS AVG_LUONG
FROM	NHANVIEN;
	
-- j.	Cho biết tổng số nhân viên và mức lương trung bình của phòng “Nghiên cứu”:
SELECT	COUNT(MaNV) AS SoLuongNV, AVG(Luong) AS LuongTB
FROM	NHANVIEN INNER JOIN 
		(SELECT MaPB FROM PHONGBAN WHERE TenPB=N'Nghiên cứu') AS PB
		ON NHANVIEN.Phong=PB.MaPB;

-- k.	Với mỗi phòng, cho biết mã phòng, số lượng nhân viên và mức lương trung bình:
SELECT	Phong, COUNT(MaNV) AS SoLuongNV, AVG(Luong) AS LuongTB
FROM	NHANVIEN
GROUP BY Phong;

-- l.	Với mỗi dự án, cho biết mã dự án, tên dự án và tổng số nhân viên tham gia:
WITH Q AS
(	SELECT	MaDA, COUNT(MaNV) AS SoLuongNV
	FROM	PHANCONG
	GROUP BY MaDA
)
SELECT	DUAN.MaDA, TenDA, SoLuongNV
FROM	Q INNER JOIN DUAN 
		ON DUAN.MaDA=Q.MaDA;

-- m.	Với mỗi dự án có nhiều hơn 2 nhân viên tham gia, cho biết mã dự án, tên dự án và số lượng nhân viên tham gia:
WITH DA AS
(	SELECT	MaDA, COUNT(MaNV) AS SoNV
	FROM	PHANCONG
	GROUP BY MaDA
	HAVING COUNT(MaNV)>2
)
SELECT	DUAN.MaDA, TenDA, SoNV
FROM	DA INNER JOIN DUAN
		ON DA.MaDA=DUAN.MaDA;

-- n.	Với mỗi dự án, cho biết mã số dự án, tên dự án và số lượng nhân viên phòng số 5 tham gia:
-- Tìm các dự án có NV phòng 5 tham gia
WITH NV_PC AS
(	SELECT	MaDA, COUNT(NHANVIEN.MaNV) AS SoLuongNV
	FROM	NHANVIEN INNER JOIN PHANCONG
			ON NHANVIEN.MaNV=PHANCONG.MaNV
	WHERE	Phong=5
	GROUP BY MaDA
)
-- Lấy thông tin các dự án đó
SELECT	DUAN.MaDA, TenDA, ISNULL(SoLuongNV, 0) AS SoNV_P5
FROM	NV_PC RIGHT OUTER JOIN DUAN
		ON NV_PC.MaDA=DUAN.MaDA;

-- o. 	Với mỗi phòng có nhiều hơn 2 nhân viên, cho biết mã phòng và số lượng nhân viên có lương lớn hơn 25000:
-- Danh sách các phòng có nhiều hơn 2 NV
WITH Q AS	
(	SELECT	Phong, COUNT(MaNV) AS SoNV
	FROM	NHANVIEN
	GROUP BY Phong
	HAVING  COUNT(MaNV)>2
)
-- Thông tin Phong và SoLuong nhân viên trên 25000 của các phòng đó
SELECT	NHANVIEN.Phong, COUNT(MaNV) AS SoLuong
FROM	Q INNER JOIN NHANVIEN
		ON Q.Phong=NHANVIEN.Phong
WHERE	NHANVIEN.Luong>25000
GROUP BY NHANVIEN.Phong;

-- p. 	Với mỗi phòng có mức lương trung bình lớn hơn 30000, cho biết mã phòng, tên phòng, số lượng nhân viên của phòng đó:
WITH P AS
(	SELECT	Phong, AVG(Luong) AS LuongTB, COUNT(MaNV) AS SoNV
	FROM	NHANVIEN
	GROUP BY Phong
	HAVING	AVG(Luong)>30000
)
SELECT	P.Phong, TenPB, SoNV
FROM	P INNER JOIN PHONGBAN
		ON P.Phong=PHONGBAN.MaPB;

-- q.	Với mỗi phòng có mức lương trung bình lớn hơn 30000, cho biết mã phòng, tên phòng, số lượng nhân viên nam của phòng đó:
-- Chọn những phòng có LuongTB>30000
WITH P AS
(	SELECT	Phong, TenPB,  AVG(Luong) AS LuongTB
	FROM	NHANVIEN INNER JOIN PHONGBAN
			ON NHANVIEN.Phong=PHONGBAN.MaPB
	GROUP BY Phong, TenPB
	HAVING	AVG(Luong)>30000
)
-- Tính số NV nam
SELECT	P.Phong, TenPB, COUNT(MaNV) AS SoNV_Nam
FROM	P INNER JOIN NHANVIEN 
		ON P.Phong=NHANVIEN.Phong
WHERE	Phai=N'Nam'
GROUP BY P.Phong, TenPB;





-------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- BÀI 2 - CSDL QUẢN LÝ THƯ VIỆN ---------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

USE QUANLYTHUVIEN
GO


-- A.	Cho biết Địa chỉ và số điện thoại của Nhà xuất bản “Addison Wesley”:
SELECT	DiaChi, SoDT
FROM	NXB
WHERE	TenNXB=N'Addison Wesley';

-- B.	Cho biết mã sách và Tựa sách của những cuốn sách được xuất bản bởi nhà xuất bản “Addison Wesley”:
SELECT	MaSach, Tua
FROM	NXB INNER JOIN DAUSACH
		ON NXB.MaNXB=DAUSACH.MaNXB
WHERE	TenNXB=N'Addison Wesley';

-- C.	Cho biết mã sách và Tựa sách của những cuốn sách có tác giả là “Hemingway”:
SELECT	TACGIA.MaSach, Tua
FROM	TACGIA INNER JOIN DAUSACH
		ON TACGIA.MaSach = DAUSACH.MaSach
WHERE	TenTacGia=N'Hemingway';

-- D.	Với mỗi đầu sách, cho biết tựa và số lượng cuốn sách mà thư viện đang sở hữu:
SELECT	Tua, COUNT(MaCuon) AS SoLuong
FROM	CUONSACH INNER JOIN DAUSACH
		ON CUONSACH.MaSach=DAUSACH.MaSach
GROUP BY DAUSACH.MaSach, Tua;

-- E. 	Với mỗi độc giả, hãy cho biết Tên, địa chỉ và số lượng cuốn sách mà người đó đã mượn:
SELECT	DOCGIA.MaDG, TenDG, DiaChi,  COUNT(MaCuon) AS SoLuong
FROM	MUON INNER JOIN DOCGIA
		ON MUON.MaDG=DOCGIA.MaDG
GROUP BY DOCGIA.MaDG, TenDG, DiaChi;

-- F. 	Cho biết mã cuốn, tựa sách và vị trí của những cuốn sách được xuất bản bởi nhà xuất bản “Addison Wesley”:
WITH Q AS
(	SELECT	DAUSACH.MaNXB, Tua, MaSach
	FROM	DAUSACH INNER JOIN NXB
			ON DAUSACH.MaNXB=NXB.MaNXB
	WHERE	TenNXB=N'Addison Wesley'
)
SELECT	MaCuon, Tua, ViTri
FROM	Q INNER JOIN CUONSACH
		ON Q.MaSach=CUONSACH.MaSach;

-- G.	Với mỗi đầu sách, hãy cho biết Tên nhà xuất bản và số lượng tác giả:
WITH TMP AS
(	SELECT	NXB.MaNXB, TenNXB, MaSach
	FROM	DAUSACH INNER JOIN NXB
			ON DAUSACH.MaNXB=NXB.MaNXB
)
SELECT TACGIA.MaSach, TenNXB, COUNT(TenTacGia) AS SoTG
FROM TMP INNER JOIN TACGIA
	 ON TMP.MaSach=TACGIA.MaSach
GROUP BY TACGIA.MaSach, TenNXB;

-- H.	Cho biết Tên, địa chỉ, số điện thoại của những độc giả đã mượn từ 5 cuốn sách trở lên:
WITH DG AS
(	SELECT	MaDG, COUNT(MaCuon) AS SoLuong
	FROM	MUON
	GROUP BY MaDG
	HAVING	COUNT(MaCuon)>=5
)
SELECT	TenDG, DiaChi, SoDT
FROM	DG INNER JOIN DOCGIA
		ON DG.MaDG=DOCGIA.MaDG;

-- I.	Cho biết mã NXB, tên NXB và số lượng đầu sách của NXB đó trong CSDL:
SELECT	NXB.MaNXB, TenNXB, COUNT(MaSach) AS SoLuong
FROM	DAUSACH INNER JOIN NXB
		ON DAUSACH.MaNXB=NXB.MaNXB
GROUP BY NXB.MaNXB, TenNXB;

-- J.	Cho biết mã NXB, tên NXB và địa chỉ của những NXB có từ 100 đầu sách trở lên:
SELECT	NXB.MaNXB, TenNXB, COUNT(MaSach) AS SoLuong
FROM	DAUSACH INNER JOIN NXB
		ON DAUSACH.MaNXB=NXB.MaNXB
GROUP BY NXB.MaNXB, TenNXB
HAVING	COUNT(MaSach)>=100;

-- K.	Cho biết mã NXB, tên NXB, và số lượng tác giả đã hợp tác với NXB đó:
WITH Q AS
(	SELECT	MaNXB, COUNT(TenTacGia) AS SoTG
	FROM	TACGIA INNER JOIN DAUSACH
			ON TACGIA.MaSach=DAUSACH.MaSach
	GROUP BY DAUSACH.MaSach, MaNXB
)
SELECT	NXB.MaNXB, TenNXB, SoTG
FROM	Q INNER JOIN NXB
		ON Q.MaNXB=NXB.MaNXB;

-- L.	Tựa và số lượng tác giả của những cuốn sách có tác giả là “Hemingway” mà độc giả “Nguyễn Văn A” đã từng mượn:
-- MaSach những cuốn sách Nguyễn Văn A mượn
WITH SACH_MUON AS
(
	SELECT CUONSACH.MaSach
	FROM (	-- Lấy MaCuon của những cuốn sách mà Nguyễn Văn A mượn
			SELECT	MaCuon
			FROM	MUON INNER JOIN DOCGIA
					ON MUON.MaDG=DOCGIA.MaDG
			WHERE	TenDG=N'Nguyễn Văn A'
		  ) AS DG_MUON
		  INNER JOIN CUONSACH -- Kết với CUONSACH để lấy MaSach
		  ON DG_MUON.MaCuon=CUONSACH.MaCuon
)
-- Lấy thông tin Tua, SoLuongTG
SELECT Tua, SoLuongTG
FROM  (	-- Lấy MaSach, Tua, SoLuongTG của những cuốn sách có Tác giả là Hemingway có trong thư viện
		SELECT	TACGIA.MaSach, Tua, COUNT(TenTacGia) AS SoLuongTG
		FROM	TACGIA INNER JOIN DAUSACH
				ON TACGIA.MaSach=DAUSACH.MaSach
		WHERE	TenTacGia=N'Hemingway'
		GROUP BY TACGIA.MaSach, Tua
	  ) AS SACH_HEMINGWAY
	  INNER JOIN SACH_MUON	-- Kết với thông tin MaSach của những cuốn mà Nguyễn Văn A mượn
	  ON SACH_HEMINGWAY.MaSach=SACH_MUON.MaSach;





-------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- BÀI 3 - CSDL QUẢN LÝ CƠ QUAN ---------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------


USE QUANLYCOQUAN
GO


-- A.	Tìm tên những nhân viên ở cơ quan có mã số là 50:
SELECT	TEN
FROM	NV
WHERE	MSCOQUAN=50;

-- B.	Tìm mã số tất cả các cơ quan từ quan hệ NV:
SELECT	MSCOQUAN
FROM	NV;

-- C.	Tìm tên các nhân viên ở cơ quan có mã số là 15, 20, 25:
SELECT	TEN
FROM	NV
WHERE	MSCOQUAN=15 OR MSCOQUAN=20 OR MSCOQUAN=25;

-- D.	Tìm tên những người làm việc ở Đồ Sơn:
SELECT	TEN
FROM	COQUAN INNER JOIN NV
		ON COQUAN.MSCOQUAN=NV.MSCOQUAN
WHERE	DIACHI=N'Đồ Sơn';




-------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------- BÀI 4 - CSDL QUẢN LÝ GA-RA SỬA CHỮA ---------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------


USE QUANLYGARA
GO

-- 4.1.	Cho biết danh sách các người thợ hiện không tham gia vào một hợp đồng sửa chữa nào:
WITH Q AS
(
	SELECT	MaTho FROM	THO 
	EXCEPT
	SELECT MaTho FROM CHITIET_HD
)
SELECT	*
FROM	Q INNER JOIN THO
		ON Q.MaTho=THO.MaTho;

-- 4.2.	Cho biết danh sách những hợp đồng đã thanh lý nhưng chưa được thanh toán tiền đầy đủ:
SELECT DaThu.SoHD, NgayHD, MaKH, SoXe, TriGiaHD, NgayGiaoDK, NgayNgThu, TongThu
FROM
	(	SELECT	*
		FROM	HOPDONG
		WHERE	NgayNgThu IS NOT NULL
	) AS DaThanhLy								-- DS những hợp đồng đã thanh lý
	INNER JOIN
	(	SELECT	SoHD, SUM(SoTienThu) AS TongThu
		FROM	PHIEUTHU
		GROUP BY SoHD
	) AS DaThu									-- Tính số tiền đã thu ở mỗi hợp đồng
	ON DaThanhLy.SoHD=DaThu.SoHD
WHERE	TriGiaHD>TongThu;

-- 4.3.	Cho biết danh sách những hợp đồng cần phải hoàn tất trước ngày 31/12/2002:
SELECT	*
FROM	HOPDONG
WHERE	NgayGiaoDK<'2002-12-31';

-- 4.4.	Cho biết người thợ nào thực hiện công việc nhiều nhất:
-- Bảng tạm @CV_THO chứa số CV mà mỗi thợ làm
DECLARE @CV_THO TABLE
(	MaTho	CHAR(10),
	SoCV	INT
)
INSERT INTO @CV_THO
SELECT	MaTho, COUNT(MaCV) AS SoCV
FROM	CHITIET_HD
GROUP BY MaTho

SELECT	THO.MaTho, TenTho, SoCV
FROM	@CV_THO X INNER JOIN THO			-- X là 1 scalar variable của @CV_THO
		ON X.MaTho=THO.MaTho
WHERE	X.SoCV = (SELECT MAX(SoCV) FROM @CV_THO);

-- 4.5.	Cho biết người thợ nào có tổng trị giá công việc được giao cao nhất:
DECLARE @TMP TABLE
(	MaTho	CHAR(10),
	TongTriGia	INT
)
INSERT INTO @TMP
SELECT	MaTho, SUM(TriGiaCV) AS TongTriGia
FROM	CHITIET_HD
GROUP BY MaTho

SELECT	THO.MaTho, TenTho, TongTriGia
FROM	THO INNER JOIN @TMP X
		ON THO.MaTho=X.MaTho
WHERE	X.TongTriGia = (SELECT MAX(TongTriGia) FROM @TMP);





-------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------ BÀI 5 - CSDL QUẢN LÝ TRƯỜNG PHỔ THÔNG ----------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------

USE QUANLYTRUONGHOC
GO

-- A.	Danh sách các giáo viên dạy các môn học có số tiết từ 45 trở lên:
SELECT	MAGV, TENGV
FROM	MHOC INNER JOIN GV
		ON MHOC.MAMH=GV.MAMH
WHERE	SOTIET>=45;

-- B.	Danh sách giáo viên được phân công gác thi trong học kỳ 1:
SELECT	GV.MAGV, TENGV
FROM	PC_COI_THI INNER JOIN GV
		ON PC_COI_THI.MAGV=GV.MAGV
WHERE	HK=1;

-- C.	Danh sách giáo viên không được phân công gác thi trong học kỳ 1:
SELECT	GV.MAGV, TENGV 
FROM	GV
EXCEPT
SELECT	GV.MAGV, TENGV
FROM	PC_COI_THI INNER JOIN GV
		ON PC_COI_THI.MAGV=GV.MAGV
WHERE	HK=1;

-- D.	Cho biết lịch thi môn văn (TENMH = ‘VĂN HỌC’):
SELECT	HKY,NGAY,GIO,PHG,TGTHI
FROM	MHOC INNER JOIN BUOITHI
		ON MHOC.MAMH=BUOITHI.MAMH
WHERE	TENMH=N'Văn học';

-- E.	Cho biết các buổi gác thi của các giáo viên chủ nhiệm môn văn (TENMH = ‘VĂN HỌC’):
WITH Q AS
(	SELECT	MHOC.MAMH, TENMH, MAGV
	FROM	MHOC INNER JOIN GV 
			ON MHOC.MAMH=GV.MAMH
)
SELECT	HK, NGAY, GIO, PHG
FROM	Q INNER JOIN PC_COI_THI
		ON PC_COI_THI.MAGV=Q.MAGV
WHERE	TENMH=N'Văn học';


