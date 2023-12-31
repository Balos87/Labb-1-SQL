USE [master]
GO
/****** Object:  Database [SimSchool]    Script Date: 10/12/2023 10:19:09 ******/
CREATE DATABASE [SimSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SimSchool', FILENAME = N'C:\Users\denbr\SimSchool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SimSchool_log', FILENAME = N'C:\Users\denbr\SimSchool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SimSchool] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SimSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SimSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SimSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SimSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SimSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SimSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [SimSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SimSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SimSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SimSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SimSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SimSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SimSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SimSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SimSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SimSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SimSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SimSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SimSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SimSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SimSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SimSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SimSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SimSchool] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SimSchool] SET  MULTI_USER 
GO
ALTER DATABASE [SimSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SimSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SimSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SimSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SimSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SimSchool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SimSchool] SET QUERY_STORE = ON
GO
ALTER DATABASE [SimSchool] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SimSchool]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/12/2023 10:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_name] [nvarchar](50) NULL,
	[staff_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grades]    Script Date: 10/12/2023 10:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[grade_id] [int] IDENTITY(1,1) NOT NULL,
	[grade] [int] NULL,
	[student_id] [int] NULL,
	[course_id] [int] NULL,
	[date_when_set] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffRoles]    Script Date: 10/12/2023 10:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffRoles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 10/12/2023 10:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 10/12/2023 10:19:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[course_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [dbo].[Staffs] ([staff_id])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
ALTER TABLE [dbo].[Grades]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_id])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[StaffRoles] ([role_id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([course_id])
REFERENCES [dbo].[Courses] ([course_id])
GO
USE [master]
GO
ALTER DATABASE [SimSchool] SET  READ_WRITE 
GO
