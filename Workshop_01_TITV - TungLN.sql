CREATE DATABASE [Workshop_01]
USE [Workshop_01]
GO
/****** Object:  Table [dbo].[tblStartupProjects]    Script Date: 25/03/2025 11:19:34 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStartupProjects](
	[project_id] [int] NOT NULL,
	[project_name] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[Status] [varchar](20) NOT NULL,
	[estimated_launch] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 25/03/2025 11:19:34 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Username] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Password] [varchar](255) NOT NULL,
	[Role] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (1, N'Ban_Bao_Cao_so_01', N'Co_Quan_Hanh_Chanh_Cuc_Hai_Quan_Thuong_Phuoc', N'Development', CAST(N'2020-03-02' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (2, N'Ban_Bao_Cao_so_02', N'Phong_Chong_Buon_Lau_Chi_Cuc_Hai_Quan_Hong_Ngu_Thi_Xa', N'Ideation', CAST(N'2019-02-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (3, N'Ban_Bao_Cao_so_03', N'Tra_Cuu_Thong_Tin_To_Khai', N'Launch', CAST(N'2019-03-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (4, N'Ban_Bao_Cao_so_04', N'Thong_Tin_Vi_Pham', N'Development', CAST(N'2019-04-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (5, N'Ban_Bao_Cao_so_05', N'Thong_Tin_Doanh_Nghiep', N'Scaling', CAST(N'2019-05-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (6, N'Ban_Bao_Cao_so_06', N'Tra_Cuu_Bieu_Thue', N'Development', CAST(N'2019-06-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (7, N'Ban_Bao_Cao_so_07', N'Chi_Cuc_Hai_Quan_Cuu_Khau_Dinh_Ba_Dong-Thap', N'Ideation', CAST(N'2019-07-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (8, N'Ban_Bao_Cao_so_08', N'Chi_Cuc_Hai_Quan_Cuu_Khau_Thuong_Phuoc', N'Ideation', CAST(N'2019-08-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (9, N'Ban_Bao_Cao_so_09', N'Phong_Chong_Buon_Lau', N'Ideation', CAST(N'2019-09-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (10, N'Chuc_Tet', N'Xa_Thuong_Phuoc', N'Launch', CAST(N'2025-01-30' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (17, N'Ai Biet', N'Co gang hoc di', N'Development', CAST(N'2025-03-19' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (27, N'frrffrdssÄ?s', N'dsdsdsdsdsdsÄ?', N'Scaling', CAST(N'2025-03-24' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (33, N'Khong_Xac_Dinh', N'Khong_Xac_Dinh', N'Ideation', CAST(N'2009-10-09' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (34, N'Thong_Tin_Doi_Tuong_Vi_Pham', N'Xu_Phat_Hanh_Chanh', N'Launch', CAST(N'2017-01-31' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (77, N'Test', N'tttttt', N'Ideation', CAST(N'2025-03-24' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (88, N'Vi Pham', N'Cong so 8', N'Development', CAST(N'2025-03-18' AS Date))
INSERT [dbo].[tblStartupProjects] ([project_id], [project_name], [Description], [Status], [estimated_launch]) VALUES (777, N'777', N'777', N'Development', CAST(N'2025-03-25' AS Date))
GO
INSERT [dbo].[tblUsers] ([Username], [Name], [Password], [Role]) VALUES (N'admin', N'Minh Triet', N'123', N'Founder')
INSERT [dbo].[tblUsers] ([Username], [Name], [Password], [Role]) VALUES (N'admin01', N'Tự Coi Đi', N'123', N'Founder')
INSERT [dbo].[tblUsers] ([Username], [Name], [Password], [Role]) VALUES (N'Admin2', N'ABC', N'123', N'Founder')
INSERT [dbo].[tblUsers] ([Username], [Name], [Password], [Role]) VALUES (N'Aibiet', N'Al-Madi', N'123', N'Founder')
INSERT [dbo].[tblUsers] ([Username], [Name], [Password], [Role]) VALUES (N'Tao ne', N'xyz', N'123', N'Founder')
GO
ALTER TABLE [dbo].[tblStartupProjects]  WITH CHECK ADD CHECK  (([Status]='Scaling' OR [Status]='Launch' OR [Status]='Development' OR [Status]='Ideation'))
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD CHECK  (([Role]='Team Member' OR [Role]='Founder'))
GO
