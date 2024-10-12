USE QLDA
GO

CREATE proc sp_getNVbyMaNV @manv nvarchar(3)
as
begin
	create table #tempTable (
	fullnameNV nvarchar(50),
	manv varchar(3),
	ngsinh varchar(11),
	dchi nvarchar(70),
	phai nvarchar(3),
	luong float,
	ma_nql int,
	phg int
	)	

	insert into #tempTable
	select nv.HONV + ' ' + nv.TENLOT + ' ' + nv.TENNV, nv.MANV, nv.NGSINH, nv.DCHI, nv.PHAI, nv.LUONG, nv.MA_NQL, nv.PHG
	from NHANVIEN nv
	where nv.MANV = @manv

	select * from #tempTable

end
go

create proc sp_getCountNVonDA @maDA int
as
begin

	SELECT COUNT(*) as SLNV, da.MADA as MaDA 
	FROM	  NHANVIEN nv
	left join PHONGBAN pb on nv.PHG = pb.MAPHG
	left join DEAN da on pb.MAPHG = da.PHONG
	WHERE da.MADA = @maDA
	GROUP BY da.MADA

end

create proc sp_getSLNV_byDA_byDDIEM @maDA int, @ddiem nvarchar(50)
as
begin

	SELECT COUNT(*) as SLNV, da.MADA, da.DDIEM_DA as MaDA 
	FROM	  NHANVIEN nv
	left join PHONGBAN pb on nv.PHG = pb.MAPHG
	left join DEAN da on pb.MAPHG = da.PHONG
	WHERE da.MADA = @maDA 
	AND da.DDIEM_DA = @ddiem
	GROUP BY da.MADA, da.DDIEM_DA

end

CREATE PROC sp_getNhanVienbyTruongPhong @trPHG varchar(3)
as
begin
	SELECT * FROM nhanvien nv
	LEFT JOIN thannhan tn on nv.MANV = tn.MA_NVIEN
	where nv.MA_NQL = @trPHG
	AND tn.MA_NVIEN is null
end

CREATE PROC sp_kiemTraNhanVienThuocPhongBan @Manv varchar(10), @Mapb int
AS
BEGIN
	IF EXISTS (
		SELECT 1 
		FROM nhanvien nv
		LEFT JOIN phongban pb
		on nv.PHG = pb.MAPHG
		WHERE nv.MANV = @Manv
	)
	BEGIN
		PRINT N'Nhân viên thuộc phòng ban.'
	END
	ELSE
	BEGIN
		PRINT N'Nhân viên không thuộc phòng ban.'
	END
END