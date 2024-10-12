USE QLDA;
GO

CREATE PROC sp_add_PB_CNTT @TenPHG nvarchar(20), @MaPHG int, @TRPHG nvarchar(3), @NG_NHANCHUC nvarchar(12)
as
begin
	IF ( EXISTS(SELECT * FROM PHONGBAN WHERE PHONGBAN.MAPHG = @MaPHG))
		BEGIN
			print N'Mã phòng này đã tồn tại !'
			rollback raiseerror
		END
	ELSE
		BEGIN
			INSERT INTO PHONGBAN(TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
			VALUES ( @TenPHG, @MaPHG, @TRPHG, @NG_NHANCHUC )
		END
end

CREATE PROC sp_edit_PB_CNTT
as
begin
	UPDATE PHONGBAN
	set TENPHG = 'IT'
	WHERE TENPHG = 'CNTT'
end

CREATE PROCEDURE sp_InsertNhanVien
    @HONV NVARCHAR(15),
    @TENLOT NVARCHAR(15),
    @TENNV NVARCHAR(15),
    @MANV NVARCHAR(6),
    @NGSINH DATE,
    @DCHI NVARCHAR(50),
    @PHAI NVARCHAR(3),
    @LUONG FLOAT,
    @MA_NQL NVARCHAR(3) = NULL,
    @PHG INT
AS
BEGIN
    DECLARE @age INT
    SET @age = YEAR(GETDATE()) - YEAR(@NGSINH)

    IF @PHG = (SELECT MaPHG FROM PHONGBAN WHERE TENPHG = 'IT')
    BEGIN
        IF (@PHAI = 'Nam' AND @age BETWEEN 18 AND 65) OR (@PHAI = 'Nu' AND @age BETWEEN 18 AND 60)
        BEGIN
            IF @LUONG < 25000
                SET @MA_NQL = '009'
            ELSE
                SET @MA_NQL = '005'

            INSERT INTO NhanVien (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
            VALUES (@HONV, @TENLOT, @TENNV, @MANV, @NGSINH, @DCHI, @PHAI, @LUONG, @MA_NQL, @PHG)

            PRINT 'Đã thêm nhân viên thành công!'
        END
        ELSE
        BEGIN
            PRINT 'Tuổi không phù hợp với giới tính!'
        END
    END
    ELSE
    BEGIN
        PRINT 'Không phải phòng ban IT'
    END
END