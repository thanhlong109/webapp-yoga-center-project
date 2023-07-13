USE [master]
GO
/****** Object:  Database [YogaCenterDB]    Script Date: 11/07/2023 10:33:20 CH ******/
CREATE DATABASE [YogaCenterDB]

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
EXEC sys.sp_db_vardecimal_storage_format N'YogaCenterDB', N'ON'
GO
ALTER DATABASE [YogaCenterDB] SET QUERY_STORE = OFF
GO
USE [YogaCenterDB]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 11/07/2023 10:33:20 CH ******/
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
	[social_id] [nvarchar](21) NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 11/07/2023 10:33:20 CH ******/
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
	[order_code] [nvarchar](15) NULL,
	[payment_method] [nvarchar](20) NULL,
	[payment_date] [datetime] NULL,
 CONSTRAINT [PK_tblBill] PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillMembership]    Script Date: 11/07/2023 10:33:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillMembership](
	[membership_id] [int] NULL,
	[account_id] [int] NULL,
	[bill_mem_id] [int] IDENTITY(1,1)NOT NULL,
	[bill_status] [int] NULL,
	[bill_is_active] [bit] NULL,
	[bill_value] [decimal](10, 2) NULL,
	[bill_discount] [int] NULL,
	[bill_date] [datetime] NULL,
	[order_code] [nvarchar](15) NULL,
	[payment_method] [nvarchar](20) NULL,
	[payment_date] [datetime] NULL,
 CONSTRAINT [PK_tblBillMembership] PRIMARY KEY CLUSTERED 
(
	[bill_mem_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 11/07/2023 10:33:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[blog_title] [nvarchar](50) NULL,
	[blog_detail] [nvarchar](3000) NULL,
	[account_id] [int] NULL,
	[blog_date] [datetime] NULL,
	[blog_img] [nvarchar](255) NULL,
 CONSTRAINT [PK_tblBlog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/07/2023 10:33:20 CH ******/
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
/****** Object:  Table [dbo].[tblClassSchedule]    Script Date: 11/07/2023 10:33:20 CH ******/
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
/****** Object:  Table [dbo].[tblComment]    Script Date: 11/07/2023 10:33:20 CH ******/
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
/****** Object:  Table [dbo].[tblCourse]    Script Date: 11/07/2023 10:33:20 CH ******/
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
	[account_id] [int] NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseSchedule]    Script Date: 11/07/2023 10:33:20 CH ******/
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
/****** Object:  Table [dbo].[tblCourseWishlist]    Script Date: 11/07/2023 10:33:20 CH ******/
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
/****** Object:  Table [dbo].[tblMembership]    Script Date: 11/07/2023 10:33:20 CH ******/
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
/****** Object:  Table [dbo].[tblRatingCourse]    Script Date: 11/07/2023 10:33:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRatingCourse](
	[registration_id] [int] NOT NULL,
	[rating_star] [int] NULL,
	[feedback] [nvarchar](50) NULL,
	[course_id] [int] NULL,
 CONSTRAINT [PK_tblRatingCourse] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistrationCourse]    Script Date: 11/07/2023 10:33:20 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegistrationCourse](
	[course_id] [int] NULL,
	[account_id] [int] NULL,
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[registration_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[course_status] [int] NULL,
	[course_schedule_id] [int] NULL,
	[registration_status] [bit] NULL,
 CONSTRAINT [PK_tblRegistrationCourse] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegistrationMembership]    Script Date: 11/07/2023 10:33:20 CH ******/
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
/****** Object:  Table [dbo].[tblRole]    Script Date: 11/07/2023 10:33:20 CH ******/
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
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (1, N'img1', N'thang', N'thang123', N'thangdeptrai@gmail.com', N'037700123', 1, 1, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (2, N'avatar-acc-id-2.webp', N'long99', N'long123', N'dd@gmail', N'655653543', 1, 1, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (3, N'img3', N'an', N'an148', N'anmobieblog@gmail.com', N'0991144564', 1, 2, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (4, N'hinh-avatar-1.png', N'dung', N'12345', N'dung@gmail.com', N'0123456789', 1, 2, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (5, N'default_avatar.png', NULL, N'12345', NULL, NULL, 0, 2, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (6, N'default_avatar.png', NULL, N'12345', NULL, NULL, 0, 2, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (7, N'default_avatar.png', N'meditation', N'12345', NULL, NULL, 0, 2, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (8, N'default_avatar.png', NULL, N'12345', NULL, NULL, 1, 2, NULL)
INSERT [dbo].[tblAccount] ([account_id], [account_img], [account_name], [account_password], [account_email], [account_phone], [account_is_active], [role_id], [social_id]) VALUES (10, N'hinh-avatar-1.png', N'chien', N'12345', N'chienthang1405@gmail.com', NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBill] ON 

INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (1, 1, 1, 1, 1, CAST(39.00 AS Decimal(10, 2)), 0, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'ABC123', N'Credit Card', CAST(N'2023-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (2, 2, 2, 0, 1, CAST(0.00 AS Decimal(10, 2)), 0, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'DEF456', N'Cash', CAST(N'2023-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 2, 3, 1, 1, CAST(432.00 AS Decimal(10, 2)), 20, CAST(N'2023-06-03T00:00:00.000' AS DateTime), N'GHI789', N'PayPal', CAST(N'2023-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (1, 2, 4, 1, 1, CAST(120.00 AS Decimal(10, 2)), 10, CAST(N'2023-06-16T00:00:00.000' AS DateTime), N'JKL012', N'Credit Card', CAST(N'2023-06-20T00:00:00.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (1, 10, 5, 0, 1, CAST(39.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'451649', N'VNPAY', CAST(N'2023-07-11T10:42:40.000' AS DateTime))
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (8, 10, 6, 1, 1, CAST(49.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'215870', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (4, 10, 7, 1, 1, CAST(47.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'059094', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (4, 10, 8, 2, 1, CAST(47.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'485562', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 9, 1, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'955091', N'VNPAY', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 10, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'523040', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 11, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'310452', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 12, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'277992', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 13, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'649142', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 14, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'827049', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 15, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'168420', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 16, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'103168', N'STUDIO', NULL)
INSERT [dbo].[tblBill] ([course_id], [account_id], [bill_id], [bill_status], [bill_is_active], [bill_value], [bill_discount], [bill_date], [order_code], [payment_method], [payment_date]) VALUES (3, 10, 17, 2, 1, CAST(54.00 AS Decimal(10, 2)), 0, CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'270896', N'STUDIO', NULL)
SET IDENTITY_INSERT [dbo].[tblBill] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBlog] ON 

INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (2, N'Is Information Overload Making it harder?', N'I neglect my talents Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by...', 3, CAST(N'2023-06-06T00:00:00.000' AS DateTime), N'img1')
INSERT [dbo].[tblBlog] ([blog_id], [blog_title], [blog_detail], [account_id], [blog_date], [blog_img]) VALUES (3, N'The Difference Between Yoga and Yoga Therapy', N'I neglect my talents Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by...', 3, CAST(N'2023-06-05T00:00:00.000' AS DateTime), N'img2')
SET IDENTITY_INSERT [dbo].[tblBlog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (1, N'Meditation Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (2, N'Aerial Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (3, N'Vinyasa Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (4, N'Pure Alignment', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (5, N'Hot Yoga', 1)
INSERT [dbo].[tblCategory] ([category_id], [category_name], [category_is_active]) VALUES (6, N'Basic Yoga', 1)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblClassSchedule] ON 

INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (7, 21, CAST(N'2023-07-11' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (7, 22, CAST(N'2023-07-18' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (7, 23, CAST(N'2023-07-25' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (7, 24, CAST(N'2023-08-01' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (7, 25, CAST(N'2023-08-08' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (7, 26, CAST(N'2023-08-15' AS Date), CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (8, 27, CAST(N'2023-07-20' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (8, 28, CAST(N'2023-07-21' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (8, 29, CAST(N'2023-07-23' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (8, 30, CAST(N'2023-07-27' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (9, 31, CAST(N'2023-07-21' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (9, 32, CAST(N'2023-07-23' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (9, 33, CAST(N'2023-07-27' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (9, 34, CAST(N'2023-07-28' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 35, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 36, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 37, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 38, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 39, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 40, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 41, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 42, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 43, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 44, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 45, CAST(N'2023-08-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (10, 46, CAST(N'2023-08-25' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 47, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 48, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 49, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 50, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 51, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 52, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 53, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 54, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 55, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 56, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 57, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (11, 58, CAST(N'2023-08-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 59, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 60, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 61, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 62, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 63, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 64, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 65, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 66, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 67, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 68, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 69, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (12, 70, CAST(N'2023-08-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 71, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 72, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 73, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 74, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 75, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 76, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 77, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 78, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 79, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 80, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 81, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (13, 82, CAST(N'2023-08-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 83, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 84, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 85, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 86, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 87, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 88, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 89, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 90, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 91, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 92, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 93, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (14, 94, CAST(N'2023-08-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 95, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 96, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 97, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 98, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 99, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 100, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 101, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 102, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 103, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 104, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 105, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (15, 106, CAST(N'2023-08-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 107, CAST(N'2023-07-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 108, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 109, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 110, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 111, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 112, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 113, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 114, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 115, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 116, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 117, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (16, 118, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 119, CAST(N'2023-07-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
GO
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 120, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 121, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 122, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 123, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 124, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 125, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 126, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 127, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 128, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 129, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (17, 130, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 131, CAST(N'2023-07-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 132, CAST(N'2023-07-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 133, CAST(N'2023-07-19' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 134, CAST(N'2023-07-21' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 135, CAST(N'2023-07-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 136, CAST(N'2023-07-28' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 137, CAST(N'2023-08-02' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 138, CAST(N'2023-08-04' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 139, CAST(N'2023-08-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 140, CAST(N'2023-08-11' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 141, CAST(N'2023-08-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblClassSchedule] ([registration_id], [class_schedule_id], [class_date], [slot_start_time], [slot_end_time], [class_status]) VALUES (18, 142, CAST(N'2023-08-18' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[tblClassSchedule] OFF
GO
INSERT [dbo].[tblComment] ([blog_id], [comment_content], [comment_date], [account_id]) VALUES (2, N'haha ', CAST(N'2023-06-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tblComment] ([blog_id], [comment_content], [comment_date], [account_id]) VALUES (3, N'good', CAST(N'2023-06-03T00:00:00.000' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[tblCourse] ON 

INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (1, N'Yoga for Beginners Course', N'Learn more about yoga', 9, N'shutterstock_1371365420-950x1075.jpg', 1, CAST(39.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (2, N'Yamas and Niyamas', N'Learn more about yoga', 12, N'shutterstock_1371365420-950x1075.jpg', 3, CAST(0.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (3, N'The Smart Flow Yoga', N'he practice of yoga has been thought to date back to pre-vedic Indian traditions', 12, N'shutterstock_1371365420-950x1075.jpg', 3, CAST(54.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (4, N'Nine days of Pranayama', N'Learn more about yoga', 4, N'img-course-id-4.jpg', 4, CAST(47.00 AS Decimal(10, 2)), 1, 3)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (5, N'Mastering Anxiety', N'Learn more about yoga', 6, N'shutterstock_1408641290-950x1075.jpg', 6, CAST(39.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (6, N'Self Care Through Ayurveda', N'Learn more about yoga', 8, N'shutterstock_396913060-950x1075.jpg', 5, CAST(29.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (7, N'Vinyasa Krama', N'Learn more about yoga', 4, N'img-course-id-5.jpg', 1, CAST(39.00 AS Decimal(10, 2)), 1, 4)
INSERT [dbo].[tblCourse] ([course_id], [course_title], [course_detail], [course_duration], [course_img], [category_id], [course_price], [course_is_active], [account_id]) VALUES (8, N'Yoga For Better Sleep', N'Learn more about yoga', 6, N'shutterstock_1408641290-950x1075.jpg', 2, CAST(49.00 AS Decimal(10, 2)), 1, 4)
SET IDENTITY_INSERT [dbo].[tblCourse] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCourseSchedule] ON 

INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 1, N'2,4,5', CAST(N'08:00:00' AS Time), CAST(N'10:00:01' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 2, N'3,5', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 3, N'2,6', CAST(N'16:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 5, N'2,5', CAST(N'18:00:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 6, N'3,4', CAST(N'08:30:00' AS Time), CAST(N'10:00:01' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 7, N'2,4', CAST(N'06:00:00' AS Time), CAST(N'08:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (1, 8, N'2,4,5', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (2, 9, N'3,4,6', CAST(N'08:00:00' AS Time), CAST(N'10:00:01' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (4, 10, N'3,4,6', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (5, 12, N'2,4', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (6, 13, N'3,6', CAST(N'17:00:00' AS Time), CAST(N'19:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (7, 14, N'2,5,6', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (8, 15, N'1', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (8, 19, N'2,3,4', CAST(N'07:00:00' AS Time), CAST(N'09:00:00' AS Time), 1)
INSERT [dbo].[tblCourseSchedule] ([course_id], [course_schedule_id], [day_of_week], [start_time], [end_time], [is_active]) VALUES (3, 20, N'2,4', CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), 1)
SET IDENTITY_INSERT [dbo].[tblCourseSchedule] OFF
GO
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (1, 3)
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (2, 1)
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (2, 3)
INSERT [dbo].[tblCourseWishlist] ([course_id], [account_id]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[tblMembership] ON 

INSERT [dbo].[tblMembership] ([membership_id], [membership_name], [membership_duration], [membership_price], [membership_description], [membership_discours], [membership_is_active]) VALUES (1, N'monthly', 30, CAST(35.00 AS Decimal(10, 2)), N'20% discount on all courses within 30 days from the time of registration', 20, 1)
INSERT [dbo].[tblMembership] ([membership_id], [membership_name], [membership_duration], [membership_price], [membership_description], [membership_discours], [membership_is_active]) VALUES (2, N'year', 365, CAST(350.00 AS Decimal(10, 2)), N'25% off all courses within 365 days of registration', 25, 1)
INSERT [dbo].[tblMembership] ([membership_id], [membership_name], [membership_duration], [membership_price], [membership_description], [membership_discours], [membership_is_active]) VALUES (3, N'year', 365, CAST(300.00 AS Decimal(10, 2)), N'test 1', 20, 1)
SET IDENTITY_INSERT [dbo].[tblMembership] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRegistrationCourse] ON 

INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (8, 10, 7, CAST(N'2023-07-11T00:00:00.000' AS DateTime), CAST(N'2023-08-15T00:00:00.000' AS DateTime), 0, 15, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (4, 10, 8, CAST(N'2023-07-20T00:00:00.000' AS DateTime), CAST(N'2023-07-27T00:00:00.000' AS DateTime), 0, 10, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (4, 10, 9, CAST(N'2023-07-21T00:00:00.000' AS DateTime), CAST(N'2023-07-28T00:00:00.000' AS DateTime), 0, 10, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 10, CAST(N'2023-07-19T00:00:00.000' AS DateTime), CAST(N'2023-08-25T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 11, CAST(N'2023-07-14T00:00:00.000' AS DateTime), CAST(N'2023-08-23T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 12, CAST(N'2023-07-14T00:00:00.000' AS DateTime), CAST(N'2023-08-23T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 13, CAST(N'2023-07-14T00:00:00.000' AS DateTime), CAST(N'2023-08-23T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 14, CAST(N'2023-07-14T00:00:00.000' AS DateTime), CAST(N'2023-08-23T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 15, CAST(N'2023-07-14T00:00:00.000' AS DateTime), CAST(N'2023-08-23T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 16, CAST(N'2023-07-12T00:00:00.000' AS DateTime), CAST(N'2023-08-18T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 17, CAST(N'2023-07-12T00:00:00.000' AS DateTime), CAST(N'2023-08-18T00:00:00.000' AS DateTime), 0, 20, 0)
INSERT [dbo].[tblRegistrationCourse] ([course_id], [account_id], [registration_id], [registration_date], [end_date], [course_status], [course_schedule_id], [registration_status]) VALUES (3, 10, 18, CAST(N'2023-07-12T00:00:00.000' AS DateTime), CAST(N'2023-08-18T00:00:00.000' AS DateTime), 0, 20, 0)
SET IDENTITY_INSERT [dbo].[tblRegistrationCourse] OFF
GO
INSERT [dbo].[tblRegistrationMembership] ([membership_id], [account_id], [registration_date], [expriration_date]) VALUES (1, 2, CAST(N'2023-06-03T00:00:00.000' AS DateTime), CAST(N'2023-07-03T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tblRole] ON 

INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (1, N'trainee')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (2, N'trainer')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (3, N'admin')
INSERT [dbo].[tblRole] ([role_id], [role_name]) VALUES (4, N'casher')
SET IDENTITY_INSERT [dbo].[tblRole] OFF
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
ALTER TABLE [dbo].[tblBillMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblBillMembership_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBillMembership] CHECK CONSTRAINT [FK_tblBillMembership_tblAccount]
GO
ALTER TABLE [dbo].[tblBillMembership]  WITH CHECK ADD  CONSTRAINT [FK_tblBillMembership_tblMembership] FOREIGN KEY([membership_id])
REFERENCES [dbo].[tblMembership] ([membership_id])
GO
ALTER TABLE [dbo].[tblBillMembership] CHECK CONSTRAINT [FK_tblBillMembership_tblMembership]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_tblAccount]
GO
ALTER TABLE [dbo].[tblClassSchedule]  WITH CHECK ADD  CONSTRAINT [FK_tblClassSchedule_tblRegistrationCourse] FOREIGN KEY([registration_id])
REFERENCES [dbo].[tblRegistrationCourse] ([registration_id])
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
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblAccount] FOREIGN KEY([account_id])
REFERENCES [dbo].[tblAccount] ([account_id])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblAccount]
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
ALTER TABLE [dbo].[tblRatingCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRatingCourse_tblCourse] FOREIGN KEY([course_id])
REFERENCES [dbo].[tblCourse] ([course_id])
GO
ALTER TABLE [dbo].[tblRatingCourse] CHECK CONSTRAINT [FK_tblRatingCourse_tblCourse]
GO
ALTER TABLE [dbo].[tblRatingCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblRatingCourse_tblRegistrationCourse] FOREIGN KEY([registration_id])
REFERENCES [dbo].[tblRegistrationCourse] ([registration_id])
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
USE [master]
GO
ALTER DATABASE [YogaCenterDB] SET  READ_WRITE 
GO
