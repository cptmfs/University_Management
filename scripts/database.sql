USE [master]
GO
/****** Object:  Database [universityDb]    Script Date: 17.03.2023 22:47:34 ******/
CREATE DATABASE [universityDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'universityDb', FILENAME = N'C:\UCC08\universityDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'universityDb_log', FILENAME = N'C:\UCC08\universityDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [universityDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [universityDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [universityDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [universityDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [universityDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [universityDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [universityDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [universityDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [universityDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [universityDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [universityDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [universityDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [universityDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [universityDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [universityDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [universityDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [universityDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [universityDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [universityDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [universityDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [universityDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [universityDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [universityDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [universityDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [universityDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [universityDb] SET  MULTI_USER 
GO
ALTER DATABASE [universityDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [universityDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [universityDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [universityDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [universityDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [universityDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [universityDb] SET QUERY_STORE = OFF
GO
USE [universityDb]
GO
/****** Object:  Table [dbo].[datStudent]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datStudent](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentFirstName] [nvarchar](30) NULL,
	[StudentLastName] [nvarchar](20) NULL,
	[StudentNo] [char](5) NULL,
	[StudentPass] [nvarchar](10) NULL,
	[StudentMail] [nvarchar](50) NULL,
	[StudentImg] [nvarchar](100) NULL,
	[StudentDep] [int] NULL,
	[StudentStatus] [bit] NULL,
 CONSTRAINT [PK_datStudent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datLessons]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datLessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonName] [nvarchar](50) NULL,
 CONSTRAINT [PK_datLessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datGrades]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datGrades](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[Exam1] [int] NULL,
	[Exam2] [int] NULL,
	[Exam3] [int] NULL,
	[Quiz1] [int] NULL,
	[Quiz2] [int] NULL,
	[Project] [int] NULL,
	[StudentAvg] [decimal](5, 2) NULL,
	[Lesson] [int] NULL,
	[Student] [int] NULL,
 CONSTRAINT [PK_datGrades] PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.datGrades.GradeID, dbo.datStudent.StudentFirstName, dbo.datStudent.StudentLastName, dbo.datLessons.LessonName, dbo.datGrades.Exam1, dbo.datGrades.Exam2, dbo.datGrades.Exam3, dbo.datGrades.Quiz1, 
                         dbo.datGrades.Quiz2, dbo.datGrades.Project, dbo.datGrades.StudentAvg, dbo.datGrades.Lesson
FROM            dbo.datLessons INNER JOIN
                         dbo.datGrades ON dbo.datLessons.LessonID = dbo.datGrades.Lesson INNER JOIN
                         dbo.datStudent ON dbo.datGrades.Student = dbo.datStudent.StudentID
GO
/****** Object:  Table [dbo].[datAcademician]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datAcademician](
	[AcID] [int] IDENTITY(1,1) NOT NULL,
	[AcFirstName] [nvarchar](30) NULL,
	[AcLastName] [nvarchar](30) NULL,
	[Title] [nvarchar](20) NULL,
	[AcNo] [char](5) NULL,
	[AcPass] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AcID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datDepartment]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datDepartment](
	[DepID] [int] IDENTITY(1,1) NOT NULL,
	[DepName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[datDepartment] ON 

INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (1, N'Software Engineering')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (2, N'Industrial Engineering
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (3, N'Mechanical Engineering
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (4, N'Maritime T.M Engineering
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (5, N'Ship Engineering')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (8, N'AI Engineering
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (9, N'Genetic Engineering
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (10, N'Mechatronics Engineering
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (11, N'Accounting')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (12, N'Data Mining
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (14, N'Aircraft Maintenance')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (15, N'Ship Mechanical Engineering
')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (16, N'Automotive Engineering')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (17, N'Aerospace Engineering')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (18, N'Chemical Engineering')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (19, N'Biomedical Engineering')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (20, N'Computer Engineering')
INSERT [dbo].[datDepartment] ([DepID], [DepName]) VALUES (21, N'Aerospace Engineering')
SET IDENTITY_INSERT [dbo].[datDepartment] OFF
GO
SET IDENTITY_INSERT [dbo].[datGrades] ON 

INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (1, 100, 99, 100, 95, 80, 100, CAST(95.00 AS Decimal(5, 2)), 5, 1)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (2, 55, 75, 48, 98, 80, 100, CAST(76.00 AS Decimal(5, 2)), 1, 2)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (3, 55, 55, 66, 50, 50, 70, CAST(57.00 AS Decimal(5, 2)), 2, 3)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (4, 85, 75, 66, 75, 50, 35, CAST(64.00 AS Decimal(5, 2)), 3, 1)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (5, 35, 45, 25, 50, 45, 60, CAST(0.00 AS Decimal(5, 2)), 3, 2)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (6, 65, 70, 45, 35, 25, 0, CAST(0.00 AS Decimal(5, 2)), 3, 3)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (7, 21, 20, 15, 35, 70, 100, CAST(0.00 AS Decimal(5, 2)), 3, 4)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (8, 85, 90, 75, 65, 48, 75, CAST(73.00 AS Decimal(5, 2)), 4, 5)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (9, 65, 75, 45, 61, 58, 95, CAST(66.00 AS Decimal(5, 2)), 4, 2)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (10, 78, 54, 69, 54, 87, 0, CAST(57.00 AS Decimal(5, 2)), 4, 9)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (11, 55, 55, 55, 65, 70, 100, CAST(0.00 AS Decimal(5, 2)), 5, 9)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (12, 75, 65, 45, 88, 90, 100, CAST(77.00 AS Decimal(5, 2)), 1, 9)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (13, 45, 56, 78, 45, 45, 100, CAST(61.00 AS Decimal(5, 2)), 2, 1)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (14, 78, 88, 91, 65, 70, 88, CAST(0.00 AS Decimal(5, 2)), 1, 2)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (15, 65, 78, 90, 85, 75, 100, CAST(0.00 AS Decimal(5, 2)), 5, 5)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (16, 56, 78, 85, 74, 65, 90, CAST(0.00 AS Decimal(5, 2)), 7, 12)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (17, 78, 80, 90, 95, 100, 100, CAST(0.00 AS Decimal(5, 2)), 7, 13)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (18, 85, 80, 90, 95, 66, 100, CAST(0.00 AS Decimal(5, 2)), 7, 14)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (19, 90, 95, 85, 76, 75, 100, CAST(0.00 AS Decimal(5, 2)), 7, 15)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (20, 85, 90, 85, 78, 90, 100, CAST(88.00 AS Decimal(5, 2)), 4, 12)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (21, 76, 80, 90, 90, 90, 100, CAST(87.00 AS Decimal(5, 2)), 4, 13)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (22, 85, 80, 90, 95, 100, 100, CAST(91.00 AS Decimal(5, 2)), 4, 14)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (23, 100, 90, 85, 90, 100, 100, CAST(94.00 AS Decimal(5, 2)), 4, 15)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (24, 85, 35, 25, 35, 30, 0, CAST(0.00 AS Decimal(5, 2)), 5, 3)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (25, 45, 45, 45, 45, 45, 45, CAST(0.00 AS Decimal(5, 2)), 2, 4)
INSERT [dbo].[datGrades] ([GradeID], [Exam1], [Exam2], [Exam3], [Quiz1], [Quiz2], [Project], [StudentAvg], [Lesson], [Student]) VALUES (26, 25, 35, 45, 18, 41, 56, CAST(36.00 AS Decimal(5, 2)), 4, 1)
SET IDENTITY_INSERT [dbo].[datGrades] OFF
GO
SET IDENTITY_INSERT [dbo].[datLessons] ON 

INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (1, N'Algorithm and Programming
')
INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (2, N'Physical')
INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (3, N'Engineering Mathematics
')
INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (4, N'Object Oriented Programming')
INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (5, N'Artificial Intelligence
')
INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (6, N'Biology')
INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (7, N'Ar ge Engineering')
INSERT [dbo].[datLessons] ([LessonID], [LessonName]) VALUES (8, N'Software Developing')
SET IDENTITY_INSERT [dbo].[datLessons] OFF
GO
SET IDENTITY_INSERT [dbo].[datStudent] ON 

INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (1, N'Muhammed Ferit', N'Simsek', N'13341', N'1334', N'ferit@gmail.com', N'C:\UCC08\Images\8.png', 3, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (2, N'Ali', N'Simsek', N'43341', N'1334', N'ali@gmail.com', N'C:\UCC08\Images\2.png', 2, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (3, N'Tahir', N'Ucar', N'84523', N'8888', N'tahir@gmail.com', N'C:\UCC08\Images\6.png', 1, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (4, N'Resul', N'Altintas', N'45617', N'4567', N'resul@gmail.com', N'C:\UCC08\Images\3.png', 5, 0)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (5, N'Mehmet Nuri', N'Sariel', N'55412', N'7890', N'mehmet@gmail.com', N'C:\UCC08\Images\2.png', 4, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (9, N'Baris', N'Aktas', N'89714', N'1111', N'baris@gmail.com', N'C:\UCC08\Images\1.png', 15, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (10, N'Betul', N'Kocyigit', N'36451', N'betul123', N'betul@gmail.com', N'C:\UCC08\Images\5.png', 19, 0)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (11, N'Abdullah', N'Kocyigit', N'41789', N'a123', N'zorlu1300@gmail.com', N'C:\UCC08\Images\6.png', 8, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (12, N'Ertugrul', N'Dagli', N'45647', N'e123', N'ertugrul@gmail.com', N'C:\UCC08\Images\1.png', 1, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (13, N'Özcan', N'Kara', N'15578', N'ö123', N'özcan@gmail.com', N'C:\UCC08\Images\1.png', 9, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (14, N'İlker', N'Kaplan', N'78412', N'i123', N'ilker@gmail.com', N'C:\UCC08\Images\2.png', 10, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (15, N'Nesibe', N'Kosanoglu', N'54656', N'n123', N'nesibe@gmail.com', N'C:\UCC08\Images\4.png', 1, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (16, N'Aleyna', N'Öz', N'55451', N'a123', N'aleyna@gmail.com', N'C:\UCC08\Images\5.png', 20, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (17, N'Nergis', N'Ketenci', N'53153', N'n1234', N'nergiss@gmail.com', N'C:\UCC08\Images\7.png', 19, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep], [StudentStatus]) VALUES (18, N'Ozde Nur', N'Koyuncu', N'77551', N'o123', N'ozde@gmail.com', N'C:\UCC08\Images\4.png', 21, NULL)
SET IDENTITY_INSERT [dbo].[datStudent] OFF
GO
ALTER TABLE [dbo].[datGrades]  WITH CHECK ADD  CONSTRAINT [FK_datGrades_datLessons] FOREIGN KEY([Lesson])
REFERENCES [dbo].[datLessons] ([LessonID])
GO
ALTER TABLE [dbo].[datGrades] CHECK CONSTRAINT [FK_datGrades_datLessons]
GO
ALTER TABLE [dbo].[datGrades]  WITH CHECK ADD  CONSTRAINT [FK_datGrades_datStudent] FOREIGN KEY([Student])
REFERENCES [dbo].[datStudent] ([StudentID])
GO
ALTER TABLE [dbo].[datGrades] CHECK CONSTRAINT [FK_datGrades_datStudent]
GO
ALTER TABLE [dbo].[datStudent]  WITH CHECK ADD  CONSTRAINT [FK_datStudent_datDepartment] FOREIGN KEY([StudentDep])
REFERENCES [dbo].[datDepartment] ([DepID])
GO
ALTER TABLE [dbo].[datStudent] CHECK CONSTRAINT [FK_datStudent_datDepartment]
GO
/****** Object:  StoredProcedure [dbo].[Grades]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Grades]
as
Select GradeID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,StudentAvg,LessonID as 'Student Average' from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StGrade]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[StGrade]
as
Select GradeID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,StudentAvg as 'Student Average',LessonID from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StGrades]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[StGrades]
as
Select GradeID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,Project,StudentAvg as 'Average',LessonID from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StGrades2]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[StGrades2]
as
Select GradeID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,Project,StudentAvg as 'Average',LessonID from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StGrades3]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[StGrades3]
as
Select GradeID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,Project,StudentAvg as 'Average',LessonID,StudentNo from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StGrades4]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[StGrades4]
as
Select GradeID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,Project,StudentAvg as 'Average',LessonID,Student,StudentNo from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StGrades5]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[StGrades5]
as
Select GradeID,LessonName,StudentFirstName+' '+StudentLastName as 'Student_Name',Exam1,Exam2,Exam3,Quiz1,Quiz2,Project,StudentAvg as 'Average',LessonID,Student,StudentNo from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StudentGrades]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[StudentGrades]
as
Select LessonID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,StudentAvg as 'Student Average',Lesson from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
/****** Object:  StoredProcedure [dbo].[StudentGradess]    Script Date: 17.03.2023 22:47:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[StudentGradess]
as
Select LessonID,LessonName,StudentFirstName+' '+StudentLastName as 'Student',Exam1,Exam2,Exam3,Quiz1,Quiz2,StudentAvg as 'Student Average',Lesson from datGrades 
Inner Join datLessons on datGrades.Lesson=datLessons.LessonID
Inner Join datStudent on datStudent.StudentID=datGrades.Student
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "datLessons"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 102
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "datGrades"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 220
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "datStudent"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [universityDb] SET  READ_WRITE 
GO
