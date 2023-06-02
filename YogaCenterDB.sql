USE [master]
GO
/****** Object:  Database [YogaCenterDB]    Script Date: 02/06/2023 9:52:26 CH ******/
CREATE DATABASE [YogaCenterDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YogaCenterDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\YogaCenterDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'YogaCenterDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\YogaCenterDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [YogaCenterDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YogaCenterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YogaCenterDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YogaCenterDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YogaCenterDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YogaCenterDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YogaCenterDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [YogaCenterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YogaCenterDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YogaCenterDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YogaCenterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YogaCenterDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YogaCenterDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YogaCenterDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YogaCenterDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [YogaCenterDB] SET  MULTI_USER 
GO
ALTER DATABASE [YogaCenterDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YogaCenterDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YogaCenterDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YogaCenterDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [YogaCenterDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [YogaCenterDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [YogaCenterDB] SET QUERY_STORE = OFF
GO
USE [YogaCenterDB]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[account_img] [nvarchar](255) NULL,
	[account_name] [nvarchar](30) NULL,
	[account_password] [nvarchar](30) NULL,
	[account_email] [nvarchar](50) NULL,
	[account_phone] [nvarchar](12) NULL,
	[account_is_active] [bit] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[bill_status] [int] NULL,
	[bill_is_active] [bit] NULL,
	[bill_value] [decimal](10, 2) NULL,
	[bill_discount] [int] NULL,
	[bill_date] [datetime] NULL,
 CONSTRAINT [PK_tblBill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[blog_title] [nvarchar](50) NULL,
	[blog_detail] [nvarchar](3000) NULL,
	[blog_is_active] [bit] NULL,
	[account_id] [int] NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](20) NULL,
	[category_is_active] [bit] NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblClassSchedule]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClassSchedule](
	[registration_id] [int] NULL,
	[class_schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[class_date] [date] NULL,
	[slot_start_time] [time](7) NULL,
	[slot_end_time] [time](7) NULL,
	[class_status] [int] NULL,
 CONSTRAINT [PK_tblClassSchedule] PRIMARY KEY CLUSTERED 
(
	[class_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[blog_id] [int] NULL,
	[comment_content] [nvarchar](255) NULL,
	[comment_date] [datetime] NULL,
	[account_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_title] [nvarchar](50) NULL,
	[course_detail] [text] NULL,
	[course_duration] [int] NULL,
	[course_img] [nvarchar](255) NULL,
	[category_id] [int] NULL,
	[course_price] [decimal](10, 2) NULL,
	[course_is_active] [bit] NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseSchedule]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseSchedule](
	[course_id] [int] NULL,
	[course_schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[day_of_week] [nvarchar](20) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_tblCourseSchedule] PRIMARY KEY CLUSTERED 
(
	[course_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseWishlist]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseWishlist](
	[course_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
 CONSTRAINT [PK_tblCourseWishlist] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMembership](
	[membership_id] [int] IDENTITY(1,1) NOT NULL,
	[membership_name] [nvarchar](50) NULL,
	[membership_duration] [int] NULL,
	[membership_price] [decimal](10, 2) NULL,
	[membership_description] [nvarchar](255) NULL,
	[membership_discours] [int] NULL,
	[membership_is_active] [bit] NULL,
 CONSTRAINT [PK_tblMembership] PRIMARY KEY CLUSTERED 
(
	[membership_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermission]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermission](
	[permission_id] [int] IDENTITY(1,1) NOT NULL,
	[permission_name] [nvarchar](30) NULL,
	[permission_description] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPermission] PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRatingCourse]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRatingCourse](
	[registration_id] [int] NOT NULL,
	[rating_star] [int] NULL,
	[feedback] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRatingCourse] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistrationCourse]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistrationCourse](
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[registraion_id] [int] IDENTITY(1,1) NOT NULL,
	[registration_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[course_status] [int] NULL,
	[course_schedule_id] [int] NULL,
 CONSTRAINT [PK_tblRegistrationCourse] PRIMARY KEY CLUSTERED 
(
	[registraion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistrationMembership]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistrationMembership](
	[membership_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[registration_date] [datetime] NULL,
	[expriration_date] [datetime] NULL,
 CONSTRAINT [PK_tblRegistrationMembership] PRIMARY KEY CLUSTERED 
(
	[membership_id] ASC,
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoleHasPermission]    Script Date: 02/06/2023 9:52:26 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleHasPermission](
	[role_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
 CONSTRAINT [PK_tblRoleHasPermission] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[tblRole] ([role_id])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblRole]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [FK_tblBill_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [FK_tblBill_tblAccount]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [FK_tblBill_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [FK_tblBill_tblCourse]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_tblAccount]
GO
ALTER TABLE [dbo].[tblClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblClassSchedule_tblRegistrationCourse] FOREIGN KEY([registration_id])
REFERENCES [dbo].[tblRegistrationCourse] ([registraion_id])
GO
ALTER TABLE [dbo].[tblClassSchedule] CHECK CONSTRAINT [FK_tblClassSchedule_tblRegistrationCourse]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblAccount]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblBlog] FOREIGN KEY([blog_id])
REFERENCES [dbo].[tblBlog] ([blog_id])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblBlog]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblCategory] FOREIGN KEY([category_id])
REFERENCES [dbo].[tblCategory] ([category_id])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblCategory]
GO
ALTER TABLE [dbo].[tblCourseSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseSchedule_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblCourseSchedule] CHECK CONSTRAINT [FK_tblCourseSchedule_tblCourse]
GO
ALTER TABLE [dbo].[tblCourseWishlist]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseWishlist_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblCourseWishlist] CHECK CONSTRAINT [FK_tblCourseWishlist_tblAccount]
GO
ALTER TABLE [dbo].[tblCourseWishlist]  WITH CHECK ADD  CONSTRAINT [FK_tblCourseWishlist_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblCourseWishlist] CHECK CONSTRAINT [FK_tblCourseWishlist_tblCourse]
GO
ALTER TABLE [dbo].[tblRatingCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRatingCourse_tblRegistrationCourse] FOREIGN KEY([registration_id])
REFERENCES [dbo].[tblRegistrationCourse] ([registraion_id])
GO
ALTER TABLE [dbo].[tblRatingCourse] CHECK CONSTRAINT [FK_tblRatingCourse_tblRegistrationCourse]
GO
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationCourse_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tblRegistrationCourse_tblAccount]
GO
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationCourse_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tblRegistrationCourse_tblCourse]
GO
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationCourse_tblCourseSchedule] FOREIGN KEY([course_schedule_id])
REFERENCES [dbo].[tblCourseSchedule] ([course_schedule_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tblRegistrationCourse_tblCourseSchedule]
GO
ALTER TABLE [dbo].[tblRegistrationMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationMembership_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblRegistrationMembership] CHECK CONSTRAINT [FK_tblRegistrationMembership_tblAccount]
GO
ALTER TABLE [dbo].[tblRegistrationMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblRegistrationMembership_tblMembership] FOREIGN KEY([membership_id])
REFERENCES [dbo].[tblMembership] ([membership_id])
GO
ALTER TABLE [dbo].[tblRegistrationMembership] CHECK CONSTRAINT [FK_tblRegistrationMembership_tblMembership]
GO
ALTER TABLE [dbo].[tblRoleHasPermission]  WITH CHECK ADD  CONSTRAINT [FK_tblRoleHasPermission_tblPermission] FOREIGN KEY([permission_id])
REFERENCES [dbo].[tblPermission] ([permission_id])
GO
ALTER TABLE [dbo].[tblRoleHasPermission] CHECK CONSTRAINT [FK_tblRoleHasPermission_tblPermission]
GO
ALTER TABLE [dbo].[tblRoleHasPermission]  WITH CHECK ADD  CONSTRAINT [FK_tblRoleHasPermission_tblRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[tblRole] ([role_id])
GO
ALTER TABLE [dbo].[tblRoleHasPermission] CHECK CONSTRAINT [FK_tblRoleHasPermission_tblRole]
GO
USE [master]
GO
ALTER DATABASE [YogaCenterDB] SET  READ_WRITE 
GO
