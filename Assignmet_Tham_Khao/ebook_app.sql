USE [EBook_App]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 27/03/2025 11:11:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[bookId] [int] IDENTITY(1,1) NOT NULL,
	[bookName] [nvarchar](100) NULL,
	[author] [nvarchar](100) NULL,
	[price] [float] NULL,
	[bookCategory] [varchar](45) NULL,
	[status] [varchar](45) NULL,
	[photo] [varchar](max) NULL,
	[email] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[bookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 27/03/2025 11:11:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[bid] [int] NULL,
	[uid] [int] NULL,
	[bookName] [nvarchar](100) NULL,
	[author] [nvarchar](100) NULL,
	[price] [float] NULL,
	[total_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/03/2025 11:11:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [varchar](45) NULL,
	[userName] [nvarchar](45) NULL,
	[email] [varchar](45) NULL,
	[address] [nvarchar](500) NULL,
	[phone] [varchar](45) NULL,
	[bookName] [nvarchar](100) NULL,
	[author] [nvarchar](100) NULL,
	[price] [float] NULL,
	[payment] [varchar](45) NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 27/03/2025 11:11:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[email] [varchar](45) NULL,
	[usercol] [varchar](45) NULL,
	[phone] [varchar](45) NULL,
	[password] [varchar](45) NULL,
	[address] [nvarchar](100) NULL,
	[landmark] [varchar](45) NULL,
	[city] [varchar](45) NULL,
	[state] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (1, N'Advanced Java Programming', N'Elin Hilderbrand', 10, N'New', N'active', N'https://image.ebooks.com/cover/95876682.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (2, N'Winter in Paradise', N'Elin Hilderbrand', 10, N'Old', N'active', N'https://image.ebooks.com/cover/95950808.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (3, N'The Five-Star Weekend', N'Elin Hilderbrand', 10, N'New', N'active', N'https://image.ebooks.com/cover/210726902.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (4, N'The Hotel Nantucket', N'Elin Hilderbrand', 9, N'Old', N'active', N'https://image.ebooks.com/cover/210456916.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (5, N'Swan Song', N'Elin Hilderbrand', 15, N'New', N'active', N'https://image.ebooks.com/cover/211131135.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (6, N'Apples Never Fall', N'Liane Moriarty', 12, N'Old', N'active', N'https://image.ebooks.com/cover/210176881.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (7, N'The Last Thing He Told Me', N'Laura Dave', 14, N'New', N'active', N'https://image.ebooks.com/cover/210141660.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (8, N'The Guest List', N'Lucy Foley', 12, N'Old', N'active', N'https://image.ebooks.com/cover/209623035.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (9, N'The Silent Patient', N'Alex Michaelides', 13, N'New', N'active', N'https://image.ebooks.com/cover/96190320.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (10, N'Where the Crawdads Sing', N'Delia Owens', 13, N'New', N'active', N'https://image.ebooks.com/cover/95928510.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (11, N'Before We Were Yours', N'Lisa Wingate', 12, N'Old', N'active', N'https://image.ebooks.com/cover/2712312.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (12, N'The Woman in the Window', N'A. J. Finn', 15, N'Old', N'active', N'https://image.ebooks.com/cover/95756218.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (13, N'The Rooster Bar', N'John Grisham', 7, N'New', N'active', N'https://image.ebooks.com/cover/95699341.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (14, N'Camino Winds', N'John Grisham', 12, N'New', N'active', N'https://image.ebooks.com/cover/209895561.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (15, N'The Rooster Bar', N'John Grisham', 11, N'New', N'active', N'https://image.ebooks.com/cover/95699341.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (16, N'Truly Madly Guilty', N'Liane Moriarty', 14, N'New', N'active', N'https://image.ebooks.com/cover/2249064.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (17, N'Before We Were Yours', N'Lisa Wingate', 12, N'New', N'active', N'https://image.ebooks.com/cover/2712312.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (18, N'The Nightingale', N'Kristin Hannah', 11, N'Old', N'active', N'https://image.ebooks.com/cover/1674817.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (19, N'Orphan Train', N'Christina Baker Kline', 16, N'New', N'active', N'https://image.ebooks.com/cover/933804.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (20, N'Sycamore Row', N'John Grisham', 18, N'Old', N'active', N'https://image.ebooks.com/cover/1184708.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (21, N'Inferno', N'Dan Brown', 15, N'New', N'active', N'https://image.ebooks.com/cover/1108768.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (22, N'The Litigators', N'John Grisham', 11, N'New', N'active', N'https://image.ebooks.com/cover/660975.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (23, N'Gray Mountain', N'John Grisham', 18, N'Old', N'active', N'https://image.ebooks.com/cover/1680888.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (24, N'The Girl on the Train', N'Paula Hawkins', 9, N'Old', N'active', N'https://image.ebooks.com/cover/1718302.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (25, N'The Husband Secret', N'Liane Moriarty', 13, N'New', N'active', N'https://image.ebooks.com/cover/1211174.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (26, N'All the Light We Cannot See', N'Anthony Doerr', 5, N'New', N'active', N'https://image.ebooks.com/cover/1245765.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (27, N'The Great Alone', N'Kristin Hannah', 20, N'Old', N'active', N'https://image.ebooks.com/cover/95756387.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (28, N'Little Fires Everywhere', N'Celeste Ng', 16, N'New', N'active', N'https://image.ebooks.com/cover/95698621.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (29, N'The Rooster Bar', N'John Grisham', 18, N'New', N'active', N'https://image.ebooks.com/cover/95699341.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (30, N'The Boys from Biloxi', N'John Grisham', 12, N'Old', N'active', N'https://image.ebooks.com/cover/210558297.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (31, N'The Whistler', N'John Grisham', 16, N'Old', N'active', N'https://image.ebooks.com/cover/2528356.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (32, N'The Hit', N'David Baldacci', 18, N'New', N'active', N'https://image.ebooks.com/cover/992160.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (33, N'Zero Day', N'David Baldacci', 7, N'Old', N'active', N'https://image.ebooks.com/cover/673406.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (34, N'Hell Corner', N'David Baldacci', 6, N'Old', N'active', N'https://image.ebooks.com/cover/539577.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (35, N'Divine Justice', N'David Baldacci', 19, N'New', N'active', N'https://image.ebooks.com/cover/347921.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (36, N'True Blue', N'David Baldacci', 12, N'Old', N'active', N'https://image.ebooks.com/cover/437051.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (37, N'The Target', N'David Baldacci', 13, N'New', N'active', N'https://image.ebooks.com/cover/1341866.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (38, N'Memory Man', N'David Baldacci', 10, N'Old', N'active', N'https://image.ebooks.com/cover/1777791.jpg?width=166&height=250&quality=85', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (39, N'Java OOP', N'Minh Triáº¿t', 1000, N'Old', N'Active', N'https://th.bing.com/th/id/OIP._Lm_T3scKhVEVFC54gcRxwHaE8?rs=1&pid=ImgDetMain', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (40, N'C# - Nháº­p MÃ´n', N'Tao NÃ¨', 29, N'New', N'Active', N'https://functionx.com/vcsharp2003/images/ide1.gif', N'ebooksp24h@gmail.com')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (41, N'Nh?p Môn', N'Tao nè con', 22, N'old', N'active', NULL, NULL)
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (42, N'Môn H?c B?t Bu?c', N'Minh Triết', 10, N'New', N'active', NULL, NULL)
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (43, N'Tập đọc viết', N'Văn Tám Vợ', 99, N'Old', N'active', N'https://cdn0.fahasa.com/media/catalog/product/i/m/image_244718_1_3633.jpg', NULL)
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (44, N'Toán lớp 6', N'Văn Tám Vợ', 200000, N'New', N'Active', N'https://scontent.fsgn19-1.fna.fbcdn.net/v/t39.30808-6/450133107_2236662526676481_8902013358504334941_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGg6E038fxuObAbgwrx5SeKhyE0yT7O3z2HITTJPs7fPWGwSR23BITE-4d0aYIKbr4Y_xXBDLSIWhIWSpnzi_np&_nc_ohc=kpbXFtlZlvwQ7kNvgGPFKI0&_nc_oc=AdkrfWN8_gfIuZPXmQkHhobpdu6qnH6zkHSnHDluV9A3lV1ERNxeCUMEbW_unRlf2TQ&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=T_-EZ_NrgVG1dtcQiJhfkw&oh=00_AYFmtf73hwSukdy7hZZE0dPevEyZtuv-cBbJ0AiMJAmKqA&oe=67E95BA5', N'user@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (45, N'Toán lớp 8 - Hình học', N'Võ Văn Tám', 300000, N'New', N'Active', N'https://scontent.fsgn19-1.fna.fbcdn.net/v/t39.30808-6/462802797_2315727322103334_1847653628207438876_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFDztj_kZgnuWG5zr-_UCPk0cDqy6y8x_3RwOrLrLzH_cZ07QUC1Y9knN5WJrdyXLIBA01DmKqti8O5Q4ZuMcdi&_nc_ohc=63wDagqgNNUQ7kNvgFn6-CK&_nc_oc=AdnS08HZXXRUiF4-NyZtskXXFlIdhCxDJCeJywFJeJeoGdgqu8fCsS15Yp36X7RxI1Q&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=MNWZYWIIPExjxTWX0E8XnA&oh=00_AYEzDx0Pk9eg1nWKG-J6Q2VgkpnFI9JYjLrp4ifvVIRlqw&oe=67E97BF4', N'VanTamVo@ebookshop.vn')
INSERT [dbo].[Books] ([bookId], [bookName], [author], [price], [bookCategory], [status], [photo], [email]) VALUES (46, N'Math....', N'Vo Van Tam', 350000, N'Old', N'Active', N'https://scontent.fsgn19-1.fna.fbcdn.net/v/t39.30808-6/462802797_2315727322103334_1847653628207438876_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=833d8c&_nc_eui2=AeFDztj_kZgnuWG5zr-_UCPk0cDqy6y8x_3RwOrLrLzH_cZ07QUC1Y9knN5WJrdyXLIBA01DmKqti8O5Q4ZuMcdi&_nc_ohc=63wDagqgNNUQ7kNvgFn6-CK&_nc_oc=AdnS08HZXXRUiF4-NyZtskXXFlIdhCxDJCeJywFJeJeoGdgqu8fCsS15Yp36X7RxI1Q&_nc_zt=23&_nc_ht=scontent.fsgn19-1.fna&_nc_gid=MNWZYWIIPExjxTWX0E8XnA&oh=00_AYEzDx0Pk9eg1nWKG-J6Q2VgkpnFI9JYjLrp4ifvVIRlqw&oe=67E97BF4', N'VanTamVo@ebookshop.vn')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (1, 35, 1, N'Divine Justice', N'David Baldacci', 19, 19)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (2, 35, 1, N'Divine Justice', N'David Baldacci', 19, 19)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (3, 19, 1, N'Orphan Train', N'Christina Baker Kline', 16, 16)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (4, 29, 1, N'The Rooster Bar', N'John Grisham', 18, 18)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (5, 32, 1, N'The Hit', N'David Baldacci', 18, 18)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (6, 40, 1, N'Nhập Môn Lập Trình', N'Tao Nè', 29, 29)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (7, 40, 1, N'C# - Nháº­p MÃ´n', N'Tao NÃ¨', 29, 29)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (9, 45, 4, N'Toán lớp 8 - Hình học', N'Võ Văn Tám', 300000, 300000)
INSERT [dbo].[Cart] ([cid], [bid], [uid], [bookName], [author], [price], [total_price]) VALUES (10, 14, 4, N'Camino Winds', N'John Grisham', 12, 12)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [name], [email], [usercol], [phone], [password], [address], [landmark], [city], [state]) VALUES (1, N'User', N'user@ebookshop.vn', N'user@ebookshop.vn', N'0385951234', N'123', N'107 Phan Thanh Gian', N'91', N'FPT a b c', N'Ai Biet')
INSERT [dbo].[Users] ([id], [name], [email], [usercol], [phone], [password], [address], [landmark], [city], [state]) VALUES (2, N'Admin', N'ebooksp24h@gmail.com', N'admin', N'0966668868', N'123', N'address', N'landmark', N'city', N'state')
INSERT [dbo].[Users] ([id], [name], [email], [usercol], [phone], [password], [address], [landmark], [city], [state]) VALUES (4, N'Thầy Tám', N'VanTamVo@ebookshop.vn', N'VanTamVo@ebookshop.vn', N'09188888888', N'123', N'107 Phan Boi Chau, Tx.Hong Ngu, Dong Thap', N'An Thanh', N'Ai Biet Dau', N'Ai Biet')
INSERT [dbo].[Users] ([id], [name], [email], [usercol], [phone], [password], [address], [landmark], [city], [state]) VALUES (5, N'Minh Triáº¿t', N'Trietlm@ebookshop.vn', NULL, N'09188888888', N'123', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [email], [usercol], [phone], [password], [address], [landmark], [city], [state]) VALUES (6, N'Minh Triáº¿t', N'mt@ebookshop.vn', NULL, N'09188888888', N'123', NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([id], [name], [email], [usercol], [phone], [password], [address], [landmark], [city], [state]) VALUES (7, N'MinhTriáº¿tLÃª', N'tlm@ebookshop.vn', NULL, N'09188888888', N'123', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E61642257C537]    Script Date: 27/03/2025 11:11:21 CH ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT ('Processing') FOR [status]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Email] FOREIGN KEY([email])
REFERENCES [dbo].[Users] ([email])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Email]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([bid])
REFERENCES [dbo].[Books] ([bookId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([uid])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[Users] ([email])
GO
