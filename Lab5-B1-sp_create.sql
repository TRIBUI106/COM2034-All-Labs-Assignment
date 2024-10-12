-- bài 1.1

CREATE PROC sp_sayHello @ten NVARCHAR(50)
as
begin
	print 'Bài 1.1'
	print N'Hello ' + @ten 
end
GO


-- bài 1.2

CREATE PROC sp_tinhTong2so @s1 int, @s2 int
as
begin
	declare @tg int = @s1 + @s2
	print 'Bài 1.2'
	print N'Tổng 2 số là : ' + CAST(@tg as VARCHAR(10))
end
go

-- bài 1.3

CREATE PROC sp_nhapSoNguyenN @n int
as
begin
	if ( @n >= 1 )
	begin
		declare @count int = 0;
		declare @sum int = 0

		WHILE (@count < @n)
        BEGIN
            SET @count = @count + 1;
			if ( @count % 2 = 0 ) 
			set @sum = @sum + @count
        END
		PRINT @sum;
	end
	else 
	begin
		print 'Bài 1.3'
		print N'Số nhập vào phải lớn hơn 0';
	end
end

CREATE PROCEDURE sp_UCLN @s1 int, @s2 int
AS
BEGIN
    IF @s1 > @s2
    BEGIN
        DECLARE @temp INT;
        SET @temp = @s1;
        SET @s1 = @s2;
        SET @s2 = @temp;
    end	
    
    WHILE @s2 % @s1 != 0
    BEGIN
        DECLARE @phanDu INT;
        SET @phanDu = @s2 % @s1;
        SET @s2 = @s1;
        SET @s1 = @phanDu;
    end
    
	print 'Bài 1.3'
    print 'UCLN la: ' + CAST(@s1 AS VARCHAR);
end;

