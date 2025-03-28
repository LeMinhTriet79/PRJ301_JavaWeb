CREATE DATABASE PE_PRJ301_HCM;
GO

-- Use the database
USE PE_PRJ301_HCM;
GO

-- Create ServerMonitor table
 CREATE TABLE tblHouse (
	id CHAR(5) PRIMARY KEY,
	name NVARCHAR(50) NOT NULL,
	description NVARCHAR(500) NOT NULL,
	price FLOAT NOT NULL,
	size FLOAT NOT NULL,
	status bit NOT NULL
);
GO

-- Insert sample data
INSERT INTO tblHouse (id, name, description, price, size,status ) VALUES 
('H-001', 'nha xinh 1', 'Nha 1 phong ngu', 10,50,1),
('H-002', 'nha xinh 2', 'Nha 2 phong ngu', 20,100,0),
('H-003', 'nha xinh 3', 'Nha 3 phong ngu', 30,150,1);

GO

CREATE TABLE tblUser (
    userID VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL
);
GO
INSERT INTO tblUser (userID, name, password)
VALUES
  
    ('hoadnt', 'Hoa Doan', '12345'),
	('admin', 'Toi la administrator', '12345');
GO
