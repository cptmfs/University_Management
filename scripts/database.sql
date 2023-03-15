USE [master]
GO
/****** Object:  Database [universityDb]    Script Date: 15.03.2023 21:36:58 ******/
CREATE DATABASE [universityDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'universityDb', FILENAME = N'C:\Users\Kaptan\universityDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'universityDb_log', FILENAME = N'C:\Users\Kaptan\universityDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [universityDb] SET  ENABLE_BROKER 
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
/****** Object:  Table [dbo].[datAcademician]    Script Date: 15.03.2023 21:36:58 ******/
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
/****** Object:  Table [dbo].[datDepartment]    Script Date: 15.03.2023 21:36:59 ******/
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
/****** Object:  Table [dbo].[datGrades]    Script Date: 15.03.2023 21:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datGrades](
	[Exam1] [tinyint] NULL,
	[Exam2] [tinyint] NULL,
	[Exam3] [tinyint] NULL,
	[Quiz1] [tinyint] NULL,
	[Quiz2] [tinyint] NULL,
	[ExtraPoint] [tinyint] NULL,
	[Project] [tinyint] NULL,
	[Lesson] [int] NULL,
	[Student] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[datLessons]    Script Date: 15.03.2023 21:36:59 ******/
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
/****** Object:  Table [dbo].[datStudent]    Script Date: 15.03.2023 21:36:59 ******/
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
 CONSTRAINT [PK_datStudent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
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
SET IDENTITY_INSERT [dbo].[datDepartment] OFF
GO
SET IDENTITY_INSERT [dbo].[datStudent] ON 

INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (1, N'Muhammed Ferit', N'Simsek', N'13340', N'1334', N'ferit@gmail.com', NULL, 3)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (2, N'Ali', N'Simsek', N'43341', N'1234', N'ali@gmail.com', NULL, 2)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (3, N'Tahir', N'Ucar', N'84523', N'8888', N'tahir@gmail.com', NULL, 1)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (4, N'Resul', N'Altintas', N'45617', N'4567', N'resul@gmail.com', NULL, 5)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (5, N'Mehmet Nuri', N'Sariel', N'55412', N'7890', N'mehmet@gmail.com', NULL, 4)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (9, N'Baris', N'Aktas', N'89714', N'1111', N'baris@gmail.com', NULL, 8)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (10, N'Betul', N'Kocyigit', N'36451', N'betul123', N'betul@gmail.com', N'', 19)
INSERT [dbo].[datStudent] ([StudentID], [StudentFirstName], [StudentLastName], [StudentNo], [StudentPass], [StudentMail], [StudentImg], [StudentDep]) VALUES (11, N'Abdullah', N'Kocyigit', N'41789', N'a123', N'zorlu1300@gmail.com', N'', 8)
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
USE [master]
GO
ALTER DATABASE [universityDb] SET  READ_WRITE 
GO
