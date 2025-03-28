USE [master]
GO
Create database Y24FA1B5
GO
USE Y24FA1B5
GO

CREATE TABLE [dbo].[Subjects](
	[SubjectID] [int] NOT NULL primary key,
	[SubjectName] [nvarchar](max) NOT NULL
)
GO
insert into Subjects values('1','Java core')
insert into Subjects values('2','Java web')
insert into Subjects values('3','Database')
insert into Subjects values('4','Operating system')
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [nvarchar](10) NOT NULL primary key,
	[StudentName] [nvarchar](30) NOT NULL,
	[BirthDate] datetime not NULL,
	[Gender] [bit] NULL,
	[SubjectID] [int] NULL references Subjects(SubjectID)
)
GO
insert into Students values('SE170001','Tran Hung Cuong',CAST(0xCA1E0B00 AS Date),1,1)
insert into Students values('SE170002','Le Khanh Van',CAST(0x3A200B00 AS Date),0,2)
insert into Students values('SE170003','Nguyen Thanh Dat',CAST(0x431D0B00 AS Date),1,3)
GO

CREATE TABLE [dbo].[Instructors](
	[InstructorID] [nvarchar](10) NOT NULL primary key,
	[InstructorName] [nvarchar](30) NOT NULL,
	[BirthDate] datetime not NULL,
	[Gender] [bit] NULL,
	[SubjectID] [int]  references Subjects(SubjectID)
)
GO
insert into Instructors values('HungDM','Do Manh Hung',CAST(0x68220B00 AS Date),1,1)
insert into Instructors values('AnLT','Lam Thanh An',CAST(0xF81B0B00 AS Date),0,2)
insert into Instructors values('TuNM','Nguyen Manh Tu',CAST(0xCA1E0B00 AS Date),1,4)
GO