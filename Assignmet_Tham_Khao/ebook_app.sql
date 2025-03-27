USE [EBook_App]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 27/03/2025 11:01:56 CH ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 27/03/2025 11:01:56 CH ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 27/03/2025 11:01:56 CH ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 27/03/2025 11:01:56 CH ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
