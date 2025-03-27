USE Assignment
GO

CREATE TABLE tblUser(username varchar(255),
					  fullname nvarchar(255),
					  role char(50),
					  password varchar(255))

INSERT INTO tblUser
VALUES ('nak1', N'Nguyễn Anh Khoa', 'admin', 'nak2025'),
	   ('nph2', N'Nguyễn Phú Hưng', 'user', 'nph2025'),
	   ('ltqc3', N'Lê Thị Quỳnh Chi', 'user', 'ltqc2025'),
	   ('hlnm4', N'Hoàng Lê Nhật Minh', 'user', 'hlnm2025')

