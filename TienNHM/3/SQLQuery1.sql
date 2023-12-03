-- NV(MSNV, TEN, MSCOQUAN, CONGVIEC, LUONG)
-- COQUAN(MSCOQUAN, TENCOQUAN, DIACHI)
-- Biểu diễn bằng ngôn ngữ sql và đại số quan hệ các yêu cầu:

-- a. Tìm tên những nhân viên ở cơ quan có mã số là 50:
select	TEN
from	NV
where	MSCOQUAN=50

-- b. Tìm mã số tất cả các cơ quan từ quan hệ NV:
select	MSCOQUAN
from	NV

-- c. Tìm tên các nhân viên ở cơ quan có mã số là 15, 20, 25:
select	TEN
from	NV
where	MSCOQUAN=15 OR MSCOQUAN=20 OR MSCOQUAN=25

-- d. Tìm tên những người làm việc ở Đồ Sơn:
select	TEN
from	NV inner join COQUAN on NV.MSCOQUAN=COQUAN.MSCOQUAN
where	DIACHI=N'Đồ Sơn'


-----------------------------------------------------------------------------

-- THO(MaTho, TenTho, Nhom, NhomTruong)
-- CONGVIEC(MaCV, NoiDungCV)
-- HOPDONG(SoHD, NgayHD, MaKH, SoXe, TriGiaHD, NgayGiaoDK, NgayNgThu)
-- KHACHHANG(MaKH, TenKH, DiaChi, DienThoai)
-- CHITIET_HD(SoHD, MaCV, TriGiaCV, MaTho, KhoanTHo)
-- PHIEUTHU(SoPT, NgaylapPT, SoHD, MaKH, HoTen, SoTienThu)

-- Thực hiện các yêu cầu sau bằng ngôn ngữ SQL và ĐSQH:

-- 1.	Cho biết danh sách các người thợ hiện không tham gia vào một hợp đồng sửa chữa nào:
SELECT	*
FROM	THO
WHERE	MaTho NOT IN (SELECT MaTho FROM CHITIET_HD)

-- 2.	Cho biết danh sách những hợp đồng đã thanh lý nhưng chưa được thanh toán tiền đầy đủ:
SELECT	*
FROM	HOPDONG INNER JOIN 
(	SELECT	PHIEUTHU.SoHD, SUM(SoTienThu) AS TienDaThu
	FROM	HOPDONG, PHIEUTHU
	WHERE	HOPDONG.SoHD = PHIEUTHU.SoHD
	GROUP BY PHIEUTHU.SoHD
)	AS tmp ON HOPDONG.SoHD = tmp.SoHD
WHERE	TienDaThu<TriGiaHD

-- 3.	Cho biết danh sách những hợp đồng cần phải hoàn tất trước ngày 31/12/2002:
SELECT	*
FROM	HOPDONG
WHERE	NgayGiaoDK<'31/12/2002'

-- 4.	Cho biết người thợ nào thực hiện công việc nhiều nhất:
SELECT *
FROM (	SELECT	MaTho
		FROM (	SELECT	MAX(SoCV) AS MaxSoCV
				FROM (	SELECT	MaTho, COUNT(MaCV) AS SoCV
						FROM	CHITIET_HD
						GROUP BY MaTho
					  ) AS SoLuongCV
			 ) AS tmp INNER JOIN THO ON tmp.MaTho = THO.MaTho
)

-- 5.	Cho biết người thợ nào có tổng trị giá công việc được giao cao nhất:
SELECT *
FROM (	SELECT MaTho
		FROM (	SELECT	MaTho, MAX(Tong)
				FROM (	SELECT	MaTho, SUM(TriGiaCV) AS Tong
						FROM	CHITIET_HD
						GROUP BY MaTho
					 ) AS TongGiaTriCV
			 ) AS THO_MaxTong INNER JOIN THO ON THO_MaxTong.MaTho = THO.MaTho
	  )

----------------------------------------------------------------------------------------

--	GV(MAGV, TENGV, MAMH)
--	MHỌC(MAMH, TENMH, SOTIET)
--	BUỔITHI(HKY, NGAY, GIO, PHG, MAMH, TGTHI)
--	PC_COI_THI(MAGV, HK, NGAY, GIO, PHG)

--a.	Danh sách các giáo viên dạy các môn học có số tiết từ 45 trở lên:
select	MAGV, TENGV
from	GV inner join MHỌC ON GV.MAMH=MHỌC.MAMH
where	SOTTIET>=45

--b.	Danh sách giáo viên được phân công gác thi trong học kỳ 1:
select	MAGV, TENGV
from	GV inner join PC_COI_THI on GV.MAGV=PC_COI_THI.MAGV
where	HK='1'

--c.	Danh sách giáo viên không được phân công gác thi trong học kỳ 1:
select	MAGV, TENGV
from	GV left outer join PC_COI_THI on GV.MAGV=PC_COI_THI.MAGV
where	HK<>'1' or HK is NULL

--d.	Cho biết lịch thi môn văn (TENMH = ‘VĂN HỌC’):
select	NGAY, GIO, PHG as PHONG, TGTHI as THOIGIAN
from	MHỌC inner join BUỔITHI on MHỌC.MAMH=BUỔITHI.MAMH
where	TENMH = N'VĂN HỌC'