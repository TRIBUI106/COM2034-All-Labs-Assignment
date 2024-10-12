USE QLDA 

declare @manv nvarchar(3) = '001'
exec sp_getNVbyMaNV @manv
GO

declare @mada int = 10
exec sp_getCountNVonDA @mada
GO

declare @mada int = 3
declare @ddiem nvarchar(50) = 'TP HCM'
exec sp_getSLNV_byDA_byDDIEM @maDA, @ddiem
GO

declare @manv varchar(3) = '001'
declare @mapb int = 4
exec sp_kiemTraNhanVienThuocPhongBan @manv, @mapb
GO