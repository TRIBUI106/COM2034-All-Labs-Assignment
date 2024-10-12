USE QLDA;
GO

-- 3.2 
DECLARE @chia INT = 10;  -- Khai báo biến @chia
DECLARE @result FLOAT;    -- Khai báo biến để lưu kết quả

BEGIN TRY
    -- Thực hiện phép chia cho 0
    SET @result = @chia / 0; -- Chia cho 0
END TRY
BEGIN CATCH
    -- Sử dụng RAISERROR để thông báo lỗi
    RAISERROR('Bạn đã chia số cho 0', 16, 1);
END CATCH;


BEGIN TRY
    -- Chèn dữ liệu hợp lệ vào bảng PhongBan
    INSERT INTO PhongBan (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
    VALUES 
	('Phong Test ', 
	9, 
	'001', 
	'2024-10-29')
    PRINT N'Thêm dữ liệu thành công';
END TRY
BEGIN CATCH
    PRINT N'Thêm dữ liệu thất bại';
END CATCH;

-- 3.1
BEGIN TRY
    -- Chèn dữ liệu hợp lệ vào bảng PhongBan
    INSERT INTO PhongBan (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
    VALUES ('Phong Test ' + 
		(( SELECT COUNT(*) 
		FROM PHONGBAN ) + 1 )
		, 'Phong moi', '001', GETDATE())
    PRINT N'Thêm dữ liệu thành công';
END TRY
BEGIN CATCH
    PRINT N'Thêm dữ liệu thất bại';
END CATCH;

-- 2.2
SELECT (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as FullName, nv.MANV FROM NHANVIEN nv
WHERE ( 
	nv.MANV % 2 = 0 
	AND nv.MANV <> 4
	);
GO
-- 2.1
SELECT (nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as FullName, nv.MANV FROM NHANVIEN nv
WHERE ( nv.MANV % 2 = 0 );
GO

-- 1.4

SELECT 
	nv.TENNV as N'Tên', 
	nv.LUONG as N'Lương',
	CASE 
		WHEN nv.LUONG > 0 AND nv.LUONG < 25000 THEN nv.LUONG *	0.1 -- 10% lương
		WHEN nv.LUONG > 25000 AND nv.LUONG < 30000 THEN nv.LUONG *	0.12 -- 12% lương
		WHEN nv.LUONG > 30000 AND nv.LUONG < 40000 THEN nv.LUONG *	0.15 -- 15% lương
		WHEN nv.LUONG > 40000 AND nv.LUONG < 50000 THEN nv.LUONG *	0.2 -- 20% lương
		ELSE nv.LUONG * 0.25 -- 25%
	END	as N'Thuế'
FROM NHANVIEN nv

GO

-- 1.3

SELECT
	CONCAT (
		CASE 
			WHEN ( PHAI = 'Nam' ) THEN 'Mr'
			ELSE 'Ms'
		END, '. ', TENNV
		) AS TenNV
FROM NHANVIEN

-- 1.2

Declare @avgLuong2 int
Declare @NhanVien2 table (
	ChucVu NVARCHAR(15),
	TENNV NVARCHAR(50),
	LUONG int
)

SET @avgLuong2 = (SELECT AVG(LUONG) FROM NHANVIEN)

INSERT INTO @NhanVien2
SELECT 
	CASE 
		WHEN ( LUONG > @avgLuong2 ) THEN 'Truong Phong'
		ELSE 'Nhan Vien'
	END AS ChucVu,
	TENNV, 
	LUONG
FROM NHANVIEN

SELECT * FROM @NhanVien2;
GO

-- 1.1 

Declare @NhanVien table (
Name NVARCHAR(50),
tinhTrangLuong NVARCHAR(50)
)

Declare @tinhTrangLuong NVARCHAR(50)
Declare @avgLuong int
SELECT @avgLuong = (SELECT AVG(LUONG) FROM NHANVIEN)

-- 1.1 
INSERT INTO @NhanVien
SELECT 
	(nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV) as Name, 
	CASE 
        WHEN LUONG > @avgLuong THEN 'TangLuong'
        ELSE 'KhongTangLuong'
    END AS tinhTrangLuong

FROM NHANVIEN nv

SELECT * FROM @NhanVien;