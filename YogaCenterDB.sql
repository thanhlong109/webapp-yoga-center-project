USE [master]
GO
/****** Object:  Database [YogaCenterDB]    Script Date: 31/05/2023 4:24:28 CH ******/
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
/****** Object:  Table [dbo].[tblAccount]    Script Date: 31/05/2023 4:24:28 CH ******/
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
	[account_phone] [nvarchar](15) NULL,
	[account_is_active] [bit] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[course_id] [int] NOT NULL,
	[account_id] [int] NOT NULL,
	[bill_date] [datetime] NULL,
	[bill_status] [int] NULL,
	[bill_is_active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[blog_title] [nvarchar](50) NULL,
	[blog_detail] [text] NULL,
	[blog_is_active] [bit] NULL,
	[account_id] [int] NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 31/05/2023 4:24:28 CH ******/
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
/****** Object:  Table [dbo].[tblClassSchedule]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClassSchedule](
	[registration_id] [int] NULL,
	[time_schedule_id] [int] NULL,
	[class_status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 31/05/2023 4:24:28 CH ******/
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
/****** Object:  Table [dbo].[tblCourse]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[course_id] [int] IDENTITY(1,1) NOT NULL,
	[course_detail] [text] NULL,
	[course_title] [nvarchar](50) NULL,
	[course_duration] [int] NULL,
	[course_img] [nvarchar](255) NULL,
	[category_id] [int] NULL,
	[course_is_active] [bit] NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMembership]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMembership](
	[membership_id] [int] IDENTITY(1,1) NOT NULL,
	[membership_duration] [int] NULL,
	[membership_price] [decimal](10, 2) NULL,
	[membership_description] [text] NULL,
	[membership_discount] [int] NULL,
	[membership_is_active] [bit] NULL,
 CONSTRAINT [PK_tblMembership] PRIMARY KEY CLUSTERED 
(
	[membership_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermission]    Script Date: 31/05/2023 4:24:28 CH ******/
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
/****** Object:  Table [dbo].[tblRegistrationCourse]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistrationCourse](
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[registration_date] [datetime] NULL,
	[expiration_date] [datetime] NULL,
	[course_status] [int] NULL,
 CONSTRAINT [PK_tbnRegistrationCourse] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistrationMembership]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistrationMembership](
	[membership_id] [int] NULL,
	[account_id] [int] NULL,
	[registration_date] [datetime] NULL,
	[expiration_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 31/05/2023 4:24:28 CH ******/
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
/****** Object:  Table [dbo].[tblRoleHasPermission]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoleHasPermission](
	[role_id] [int] NULL,
	[permission_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTimeSchedule]    Script Date: 31/05/2023 4:24:28 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTimeSchedule](
	[course_id] [int] NULL,
	[time_schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[day_of_week] [nvarchar](20) NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_tblTimeSchedule] PRIMARY KEY CLUSTERED 
(
	[time_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id]) VALUES (1, N'img1', N'khang', N'khang123', N'khang@gmail.com', N'0389142366', 1, 2)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id]) VALUES (2, N'img2', N'long', N'longga123', N'long@gmail.com', N'0377008910', 1, 1)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id]) VALUES (3, N'img3', N'thang', N'thangdeptrai', N'thangbe@gmail.com', N'0377001564', 1, 1)
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
GO
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_date], [bill_status], [bill_is_active]) VALUES (1, 3, CAST(N'2023-05-31T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_date], [bill_status], [bill_is_active]) VALUES (2, 2, CAST(N'2023-05-31T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_date], [bill_status], [bill_is_active]) VALUES (3, 2, CAST(N'2023-05-31T00:00:00.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[tblBlog] ON 

INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [blog_is_active], [account_id]) VALUES (1, N'fpt drama', N'thu khoa dau vao k13 nguyen nhat minh da duoc hr ca nuoc dua vao black list', 1, 1)
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [blog_is_active], [account_id]) VALUES (2, N'yoga helthy', N'yoga la bo mon tap het suc thu vi bala', 1, 1)
SET IDENTITY_INSERT [dbo].[tblBlog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (1, N'meditation', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (2, N'vinyasa', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (3, N'pranayama', 1)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
INSERT [dbo].[tblClassSchedule] ([registration_id], [time_schedule_id], [class_status]) VALUES (1, 1, 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [time_schedule_id], [class_status]) VALUES (2, 3, 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [time_schedule_id], [class_status]) VALUES (3, 5, 1)
GO
INSERT [dbo].[tblComment] ([blog_id], [comment_content], [comment_date], [account_id]) VALUES (1, N'oi vai that truong 3 chu', CAST(N'2023-05-31T15:53:29.000' AS DateTime), 2)
INSERT [dbo].[tblComment] ([blog_id], [comment_content], [comment_date], [account_id]) VALUES (1, N'hehe', CAST(N'2023-05-31T15:20:30.000' AS DateTime), 3)
GO
SET IDENTITY_INSERT [dbo].[tblCourse] ON 

INSERT [dbo].[tblCourse] ([course_id], [course_detail], [course_title], [course_duration], [course_img], [category_id], [course_is_active]) VALUES (1, N'day la mieu ta ngan ve khoa hoc mastering anxitery', N'Mastering Anxitey', 8, N'img-course1', 3, 1)
INSERT [dbo].[tblCourse] ([course_id], [course_detail], [course_title], [course_duration], [course_img], [category_id], [course_is_active]) VALUES (2, N'day la mieu ta course 2', N'Self Care Through Ayurveda', 12, N'img-course2', 1, 1)
INSERT [dbo].[tblCourse] ([course_id], [course_detail], [course_title], [course_duration], [course_img], [category_id], [course_is_active]) VALUES (3, N'day la mieu ta khoa hoc 3', N'Vinyasa Krama', 12, N'img-course3', 2, 1)
SET IDENTITY_INSERT [dbo].[tblCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMembership] ON 

INSERT [dbo].[tblMembership] ([membership_id], [membership_duration], [membership_price], [membership_description], [membership_discount], [membership_is_active]) VALUES (1, 30, CAST(200000.00 AS Decimal(10, 2)), N'the thang khi tham gia se duoc nhung uu dai nhu sau', 20, 1)
INSERT [dbo].[tblMembership] ([membership_id], [membership_duration], [membership_price], [membership_description], [membership_discount], [membership_is_active]) VALUES (2, 365, CAST(1800000.00 AS Decimal(10, 2)), N'the nam khi tham gia se duoc nhung loi ic....', 35, 1)
SET IDENTITY_INSERT [dbo].[tblMembership] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPermission] ON 

INSERT [dbo].[tblPermission] ([permission_id], [permission_name], [permission_description]) VALUES (2, N'/blog', N'can view blog')
INSERT [dbo].[tblPermission] ([permission_id], [permission_name], [permission_description]) VALUES (3, N'/courses', N'can view all course')
INSERT [dbo].[tblPermission] ([permission_id], [permission_name], [permission_description]) VALUES (4, N'/post blog', N'can post blog')
SET IDENTITY_INSERT [dbo].[tblPermission] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRegistrationCourse] ON 

INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [expiration_date], [course_status]) VALUES (1, 3, 1, CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [expiration_date], [course_status]) VALUES (2, 2, 2, CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [expiration_date], [course_status]) VALUES (3, 2, 3, CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'2023-06-30T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tblRegistrationCourse] OFF
GO
INSERT [dbo].[tblRegistrationMembership] ([membership_id], [account_id], [registration_date], [expiration_date]) VALUES (1, 2, CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'2023-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tblRegistrationMembership] ([membership_id], [account_id], [registration_date], [expiration_date]) VALUES (2, 3, CAST(N'2023-05-31T00:00:00.000' AS DateTime), CAST(N'2023-06-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (1, N'trainee')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (2, N'trainer')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (3, N'admin')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
GO
INSERT [dbo].[tblRoleHasPermission] ([role_id], [permission_id]) VALUES (1, 2)
INSERT [dbo].[tblRoleHasPermission] ([role_id], [permission_id]) VALUES (1, 3)
INSERT [dbo].[tblRoleHasPermission] ([role_id], [permission_id]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[tblTimeSchedule] ON 

INSERT [dbo].[tblTimeSchedule] ([course_id], [time_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 1, N'2,4,6', CAST(N'14:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[tblTimeSchedule] ([course_id], [time_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 2, N'3,5,7', CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblTimeSchedule] ([course_id], [time_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 3, N'2,5', CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1)
INSERT [dbo].[tblTimeSchedule] ([course_id], [time_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 4, N'3.6', CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1)
INSERT [dbo].[tblTimeSchedule] ([course_id], [time_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (3, 5, N'4,6', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[tblTimeSchedule] ([course_id], [time_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (3, 6, N'2,7', CAST(N'12:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[tblTimeSchedule] OFF
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
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_tblAccount] FOREIGN KEY([blog_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_tblAccount]
GO
ALTER TABLE [dbo].[tblClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblClassSchedule_tblTimeSchedule] FOREIGN KEY([time_schedule_id])
REFERENCES [dbo].[tblTimeSchedule] ([time_schedule_id])
GO
ALTER TABLE [dbo].[tblClassSchedule] CHECK CONSTRAINT [FK_tblClassSchedule_tblTimeSchedule]
GO
ALTER TABLE [dbo].[tblClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblClassSchedule_tbnRegistrationCourse] FOREIGN KEY([registration_id])
REFERENCES [dbo].[tblRegistrationCourse] ([registration_id])
GO
ALTER TABLE [dbo].[tblClassSchedule] CHECK CONSTRAINT [FK_tblClassSchedule_tbnRegistrationCourse]
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
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tbnRegistrationCourse_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tbnRegistrationCourse_tblAccount]
GO
ALTER TABLE [dbo].[tblRegistrationCourse]  WITH CHECK ADD  CONSTRAINT [FK_tbnRegistrationCourse_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblRegistrationCourse] CHECK CONSTRAINT [FK_tbnRegistrationCourse_tblCourse]
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
ALTER TABLE [dbo].[tblTimeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblTimeSchedule_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblTimeSchedule] CHECK CONSTRAINT [FK_tblTimeSchedule_tblCourse]
GO
USE [master]
GO
ALTER DATABASE [YogaCenterDB] SET  READ_WRITE 
GO
