CREATE DATABASE [Workshop_02]
USE [Workshop_02]
GO
/****** Object:  Table [dbo].[tblExamCategories]    Script Date: 25/03/2025 11:20:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExamCategories](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](50) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblExams]    Script Date: 25/03/2025 11:20:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblExams](
	[exam_id] [int] NOT NULL,
	[exam_title] [varchar](100) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[category_id] [int] NULL,
	[total_marks] [int] NOT NULL,
	[Duration] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestions]    Script Date: 25/03/2025 11:20:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestions](
	[question_id] [int] NOT NULL,
	[exam_id] [int] NULL,
	[question_text] [text] NOT NULL,
	[option_a] [varchar](100) NOT NULL,
	[option_b] [varchar](100) NOT NULL,
	[option_c] [varchar](100) NOT NULL,
	[option_d] [varchar](100) NOT NULL,
	[correct_option] [char](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 25/03/2025 11:20:48 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[username] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[Role] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblExams]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[tblExamCategories] ([category_id])
GO
ALTER TABLE [dbo].[tblQuestions]  WITH CHECK ADD FOREIGN KEY([exam_id])
REFERENCES [dbo].[tblExams] ([exam_id])
GO
ALTER TABLE [dbo].[tblExamCategories]  WITH CHECK ADD CHECK  (([category_name]='Final' OR [category_name]='Midterm' OR [category_name]='Quiz'))
GO
ALTER TABLE [dbo].[tblQuestions]  WITH CHECK ADD CHECK  (([correct_option]='D' OR [correct_option]='C' OR [correct_option]='B' OR [correct_option]='A'))
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD CHECK  (([Role]='Student' OR [Role]='Instructor'))
GO
