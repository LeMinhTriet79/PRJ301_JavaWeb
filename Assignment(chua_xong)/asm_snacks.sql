USE Assignment
GO

CREATE TABLE tblSnack(snackId varchar(255),
					  picture varchar(255),
					  name nvarchar(255),
					  region nvarchar(255),
					  unit nvarchar(255),
					  price int)

INSERT INTO tblSnack
VALUES('S01', 'snacks/com-lang-vong-3.jpg', N'Cốm làng Vòng', N'Bắc', N'bịch', 135000),
	  ('S02', 'snacks/mo-xi-muoi-khong-hat.jpg', N'Mơ xí muội không hạt', N'Bắc', N'hộp', 45000),
	  ('SO3', 'snacks/banh-dau-xanh-hai-duong-1.png', N'Bánh đậu xanh Hải Dương', N'Bắc', N'hộp', 100000),
	  ('S04', 'snacks/banh-dau-xanh-nuong-Quang-Nam.jpg', N'Bánh đậu xanh nướng Quảng Nam', N'Trung',N'bịch' , 60000),
	  ('S05', 'snacks/mach-nha-quang-ngai.jpg', N'Kẹo mạch nha Quãng Ngãi', N'Trung', N'lọ', 50000),
	  ('S06', 'snacks/keo-cu-do.jpg', N'Kẹo cu đơ Hà Tĩnh', N'Trung', N'bịch', 50000),
	  ('S07', 'snacks/Banh-trang-deo-tom.png', N'Bánh tráng tôm Tây Ninh', N'Nam', N'bịch', 60000),
	  ('S08', 'snacks/keo-dua-ben-tre.jpg', N'Kẹo dừa Bến Tre', N'Nam', N'hộp', 65000),
	  ('S09', 'snacks/banh-pia.png', N'Bánh pía Sóc Trăng', N'Nam', N'bịch', 70000)