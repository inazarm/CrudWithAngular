USE [master]
GO
/****** Object:  Database [TestingDB]    Script Date: 5/2/2024 9:47:36 PM ******/
CREATE DATABASE [TestingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestingDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestingDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestingDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestingDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestingDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TestingDB] SET QUERY_STORE = OFF
GO
USE [TestingDB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Salary] [int] NULL,
	[Gender] [nvarchar](10) NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeAudit]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAudit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AuditData] [varchar](max) NULL,
	[AuditDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeRecord]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmployeeRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salarytest]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salarytest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[salary] [float] NULL,
 CONSTRAINT [PK_salarytest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Age] [varchar](50) NULL,
	[Department] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFileDetails]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFileDetails](
	[SQLID] [int] IDENTITY(1,1) NOT NULL,
	[FILENAME] [nvarchar](500) NULL,
	[FILEURL] [nvarchar](1500) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [Gender], [DepartmentId]) VALUES (1, N'Pranaya', 5000, N'Male', 3)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [Gender], [DepartmentId]) VALUES (2, N'Priyanka', 5400, N'Female', 2)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [Gender], [DepartmentId]) VALUES (3, N'Anurag', 6500, N'male', 1)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [Gender], [DepartmentId]) VALUES (4, N'sambit', 4700, N'Male', 2)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [Gender], [DepartmentId]) VALUES (5, N'Hina', 6600, N'Female', 3)
INSERT [dbo].[Employee] ([Id], [Name], [Salary], [Gender], [DepartmentId]) VALUES (6, N'Saroj', 3300, N'Male', 2)
GO
SET IDENTITY_INSERT [dbo].[EmployeeAudit] ON 

INSERT [dbo].[EmployeeAudit] ([ID], [AuditData], [AuditDate]) VALUES (1, N'New employee Added with ID  = 6 and Name Saroj', CAST(N'2022-02-24T13:04:28.640' AS DateTime))
SET IDENTITY_INSERT [dbo].[EmployeeAudit] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeRecord] ON 

INSERT [dbo].[EmployeeRecord] ([ID], [Name], [Email]) VALUES (1, N'Testing Data', N'test@yahoo.com')
INSERT [dbo].[EmployeeRecord] ([ID], [Name], [Email]) VALUES (2, N'ali ahmed', N'ali@yahoo.com')
INSERT [dbo].[EmployeeRecord] ([ID], [Name], [Email]) VALUES (3, N'Mr A', N'a@gmail.com')
INSERT [dbo].[EmployeeRecord] ([ID], [Name], [Email]) VALUES (4, N'Mr Z', N'b@gmail.com')
INSERT [dbo].[EmployeeRecord] ([ID], [Name], [Email]) VALUES (5, N'Mr M', N'm@gmail.com')
INSERT [dbo].[EmployeeRecord] ([ID], [Name], [Email]) VALUES (6, N'Ms X', N'x@gmail.com')
INSERT [dbo].[EmployeeRecord] ([ID], [Name], [Email]) VALUES (7, N'Ms Y', N'y@gmail.com')
SET IDENTITY_INSERT [dbo].[EmployeeRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[salarytest] ON 

INSERT [dbo].[salarytest] ([Id], [Name], [salary]) VALUES (1, N'A', 1000)
INSERT [dbo].[salarytest] ([Id], [Name], [salary]) VALUES (2, N'B', 2000)
INSERT [dbo].[salarytest] ([Id], [Name], [salary]) VALUES (3, N'C', 3000)
INSERT [dbo].[salarytest] ([Id], [Name], [salary]) VALUES (4, N'D', 4000)
INSERT [dbo].[salarytest] ([Id], [Name], [salary]) VALUES (5, N'G', 5000)
INSERT [dbo].[salarytest] ([Id], [Name], [salary]) VALUES (6, N'M', 6000)
INSERT [dbo].[salarytest] ([Id], [Name], [salary]) VALUES (7, N'Z', 7000)
SET IDENTITY_INSERT [dbo].[salarytest] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Age], [Department]) VALUES (1, N'Test', N'32', N'CS')
INSERT [dbo].[Student] ([Id], [Name], [Age], [Department]) VALUES (2, N'Test1', N'43', N'MS')
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFileDetails] ON 

INSERT [dbo].[tblFileDetails] ([SQLID], [FILENAME], [FILEURL]) VALUES (1, N'my-file-20220602173210334.png', N'/UploadedFiles/my-file-20220602173210334.png')
INSERT [dbo].[tblFileDetails] ([SQLID], [FILENAME], [FILEURL]) VALUES (2, N'my-file-20220602173229580.jpg', N'/UploadedFiles/my-file-20220602173229580.jpg')
INSERT [dbo].[tblFileDetails] ([SQLID], [FILENAME], [FILEURL]) VALUES (3, N'my-file-20220602173511882.gif', N'/UploadedFiles/my-file-20220602173511882.gif')
SET IDENTITY_INSERT [dbo].[tblFileDetails] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee] 
     @ID int 
 AS
 BEGIN
     SET NOCOUNT ON;
     Delete From EmployeeRecord  WHERE ID = @ID   
 END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee] 
     @Name nvarchar(50),
     @Email nvarchar(50)
 AS
 BEGIN
     SET NOCOUNT ON;
     INSERT INTO EmployeeRecord VALUES(@Name, @Email)   
 END
GO
/****** Object:  StoredProcedure [dbo].[SelectEmployee]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create PROCEDURE [dbo].[SelectEmployee] 
 AS
 BEGIN
 SET NOCOUNT ON; Select * FROm EmployeeRecord  
 END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 5/2/2024 9:47:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEmployee] 
     @ID int ,
     @Name nvarchar(50),
     @Email nvarchar(50)
 AS
 BEGIN
     SET NOCOUNT ON;
     Update EmployeeRecord set Name = @Name , Email = @Email WHERE ID = @ID   
 END
GO
USE [master]
GO
ALTER DATABASE [TestingDB] SET  READ_WRITE 
GO
