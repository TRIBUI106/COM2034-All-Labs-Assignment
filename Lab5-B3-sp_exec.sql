declare @TenPHG nvarchar(20) = N'CNTT'
declare @MaPHG int = 11
declare @TRPHG nvarchar(3) = '006'
declare @NG_NHANCHUC nvarchar(12) = '1920-10-08'

exec sp_add_PB_CNTT @TenPHG, @MaPhg, @TRPHG, @NG_NHANCHUC
GO

exec sp_edit_PB_CNTT
GO

DECLARE 
    @HONV NVARCHAR(15) = N'Nguyen', 
    @TENLOT NVARCHAR(15) = N'Van', 
    @TENNV NVARCHAR(15) = N'A', 
    @MANV NVARCHAR(6) = '029', 
    @NGSINH DATE = '1990-01-01', 
    @DCHI NVARCHAR(50) = N'123 Trần Duy Hưng', 
    @PHAI NVARCHAR(3) = N'Nam', 
    @LUONG FLOAT = 24000, 
    @PHG INT = 1;
EXEC sp_InsertNhanVien @HONV, @TENLOT, @TENNV, @MANV, @NGSINH, @DCHI, @PHAI, @LUONG, NULL, @PHG
GO