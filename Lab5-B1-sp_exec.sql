declare @nhapTen NVARCHAR(50) = N'Trí'
exec sp_sayHello @nhapTen
go

declare @soThuNhat int = 5, @soThuHai int = 7
exec sp_tinhTong2so @soThuHai, @soThuHai
go

declare @n int = 6 -- 2 + 4 + 6
exec sp_nhapSoNguyenN @n
go

declare @s1 int = 30, @s2 int = 24
exec sp_UCLN @s1, @s2
go
