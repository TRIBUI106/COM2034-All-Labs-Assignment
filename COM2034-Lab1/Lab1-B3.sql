--select CONCAT(HONV, ' ', TENLOT, ' ',TENNV) AS FULLNAME from [dbo].[NHANVIEN]

-- Câu 6
select CONCAT(HONV, ' ', TENLOT, ' ',TENNV) AS FULLNAME, CONCAT(day(NGSINH),'-', month(NGSINH), '-', year(NGSINH)) as 'Ngày Sinh' from [dbo].[NHANVIEN]
where CONCAT(HONV, ' ', TENLOT, ' ',TENNV) = N'Đinh  Bá  Tiên';

-- Câu 5
select CONCAT(HONV, ' ', TENLOT, ' ',TENNV) AS NameStartWithN from [dbo].[NHANVIEN]
where HONV LIKE 'N%';

-- Câu 4
select CONCAT(HONV, ' ', TENLOT, ' ',TENNV) AS FULLNAME, DCHI from [dbo].[NHANVIEN]
where DCHI LIKE '%TP HCM%';

-- Câu 3
select * from [dbo].[NHANVIEN]
where (LUONG > 25000 AND PHG = 4)
or ( luong > 30000 and PHG = 5);

-- Câu 2
 select * from [dbo].[NHANVIEN]
 where LUONG > 30000;



-- Câu 1 
 select * from [dbo].[NHANVIEN]
 where PHG = 4;