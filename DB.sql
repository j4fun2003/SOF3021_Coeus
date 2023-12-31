USE [master]
GO
/****** Object:  Database [DB]    Script Date: 14/06/2023 11:35:59 CH ******/
CREATE DATABASE [DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB] SET RECOVERY FULL 
GO
ALTER DATABASE [DB] SET  MULTI_USER 
GO
ALTER DATABASE [DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB] SET QUERY_STORE = OFF
GO
USE [DB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 14/06/2023 11:35:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[Fullname] [nvarchar](40) NULL,
	[Phonenumber] [varchar](10) NULL,
	[Email] [varchar](30) NOT NULL,
	[Photo] [varchar](30) NULL,
	[Admin] [bit] NULL,
	[Activated] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 14/06/2023 11:35:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Category_Id] [varchar](5) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 14/06/2023 11:35:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Create_Date] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phonenumber] [varchar](10) NULL,
	[Order_Note] [nvarchar](100) NULL,
	[Order_Status] [int] NULL,
	[Price] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Detail]    Script Date: 14/06/2023 11:35:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Detail](
	[Orders_Detail_Id] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NULL,
	[Product_Id] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Orders_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14/06/2023 11:35:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Product_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Image1] [varchar](65) NULL,
	[Image2] [varchar](65) NULL,
	[Image3] [varchar](65) NULL,
	[Image4] [varchar](65) NULL,
	[Color] [nvarchar](20) NULL,
	[Price] [decimal](12, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Manufactor] [nvarchar](40) NULL,
	[Description] [nvarchar](2000) NULL,
	[Discount] [int] NOT NULL,
	[Category_Id] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Verify_Accounts]    Script Date: 14/06/2023 11:35:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verify_Accounts](
	[Username] [varchar](30) NOT NULL,
	[Verify_Code] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Phonenumber], [Email], [Photo], [Admin], [Activated]) VALUES (N'Chaule33', N'123', N'Le Ngo Hoang Chau', N'0123789321', N'chauulee@gmail.com', N'', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Phonenumber], [Email], [Photo], [Admin], [Activated]) VALUES (N'chuong213', N'123', N'Nguyen Dang Chuong', N'0905741445', N'chuongnd@gmail.com', N'', 0, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Phonenumber], [Email], [Photo], [Admin], [Activated]) VALUES (N'huythai123', N'123', N'Thai Huy', N'0123456789', N'huytq@gmail.com', N'', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Phonenumber], [Email], [Photo], [Admin], [Activated]) VALUES (N'Luan213', N'123', N'Hoang Van Luan', N'0781233433', N'luanhv@gmail.com', N'', 0, 1)
GO
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'CHGER', N'Bộ sạc')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'GEAR', N'Linh kiện máy tính')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'HD', N'Hành động')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'HH', N'Hoạt hình')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'HP', N'Tai nghe')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'KD', N'Kinh doanh')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'KEYB', N'Bàn phím')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'LAP', N'Laptop')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'MOUSE', N'Chuột + lót chuột')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'OTHER', N'Phụ kiện khác')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'PC', N'Máy tính để bàn')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'PHONE', N'Smartphone')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'SPKER', N'Loa')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'TN', N'Truyện ngắn')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'TT', N'Thể thao')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'TTH', N'Trinh thám')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'TTT', N'Tiểu thuyết')
INSERT [dbo].[Categories] ([Category_Id], [Name]) VALUES (N'VT', N'Viễn tưởng')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (1, N'Acer Aspire 7 A715 42G R4XX', N'Acer-Aspire-7-A715-42G-R4XX.png', N'Acer-Aspire-7-A715-42G-R4XX.png', N'Acer-Aspire-7-A715-42G-R4XX.png', N'Acer-Aspire-7-A715-42G-R4XX.png', N'Đen', CAST(14990000.00 AS Decimal(12, 2)), 50, N'NSX X', N'Laptop gaming tốt nhất phân khúc', 10, N'LAP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (2, N'TUF Gaming F15 FX506LH HN188W', N'TUF-Gaming-F15-FX506LH-HN188W.png', N'TUF-Gaming-F15-FX506LH-HN188W.png', N'TUF-Gaming-F15-FX506LH-HN188W.png', N'TUF-Gaming-F15-FX506LH-HN188W.png', N'Đen', CAST(16990000.00 AS Decimal(12, 2)), 39, N'NSX X', N'Hiệu năng cực đỉnh cho mọi tác vụ', 15, N'LAP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (3, N'MSI Bravo 15 B5DD 276VN', N'MSI-Bravo-15-B5DD-276VN.png', N'MSI-Bravo-15-B5DD-276VN.png', N'MSI-Bravo-15-B5DD-276VN.png', N'MSI-Bravo-15-B5DD-276VN.png', N'Đen', CAST(15490000.00 AS Decimal(12, 2)), 45, N'NSX X', N'Trang bị công nghệ tiên tiết nhất', 12, N'LAP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (4, N'Lenovo Legion 5 15ITH6 82JH002VVN', N'Lenovo-Legion-5-15ITH6-82JH002VVN.jpg', N'Lenovo-Legion-5-15ITH6-82JH002VVN.jpg', N'Lenovo-Legion-5-15ITH6-82JH002VVN.jpg', N'Lenovo-Legion-5-15ITH6-82JH002VVN.jpg', N'Đen', CAST(33490000.00 AS Decimal(12, 2)), 10, N'NSX X', N'Hiệu năng vượt trội đến từ Lenovo Legion 5 15ITH6 82JH002VVN', 0, N'LAP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (5, N'Dell G15 5511 70266676', N'Dell-G15-5511-70266676.jpg', N'Dell-G15-5511-70266676.jpg', N'Dell-G15-5511-70266676.jpg', N'Dell-G15-5511-70266676.jpg', N'Đen', CAST(23190000.00 AS Decimal(12, 2)), 15, N'NSX X', N'Hiệu năng mạnh mẽ, vượt trội với RTX 3050', 17, N'LAP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (6, N'HP VICTUS 16 e0175AX 4R0U8PA', N'HP-VICTUS-16-e0175AX-4R0U8PA.png', N'HP-VICTUS-16-e0175AX-4R0U8PA.png', N'HP-VICTUS-16-e0175AX-4R0U8PA.png', N'HP-VICTUS-16-e0175AX-4R0U8PA.png', N'Đen', CAST(21990000.00 AS Decimal(12, 2)), 24, N'NSX X', N'Hiệu năng mạnh mẽ, vượt trội', 10, N'LAP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (7, N'GVN MINION i1030', N'GVN-MINION-i1030.jpg', N'GVN-MINION-i1030.jpg', N'GVN-MINION-i1030.jpg', N'GVN-MINION-i1030.jpg', N'Đen', CAST(8900000.00 AS Decimal(12, 2)), 5, N'NSX X', N'CPU Intel Core i3 10100F / 6MB / 4.3GHZ / 4 nhân 8 luồng / LGA 1200', 5, N'PC')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (8, N'GVN Neon S White Edition', N'GVN-Neon-S-White-Edition.jpg', N'GVN-Neon-S-White-Edition.jpg', N'GVN-Neon-S-White-Edition.jpg', N'GVN-Neon-S-White-Edition.jpg', N'Đen', CAST(32990000.00 AS Decimal(12, 2)), 7, N'NSX X', N'Mainboard GIGABYTE B660M AORUS PRO AX DDR4', 7, N'PC')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (9, N'GVN Tinker S', N'GVN-Tinker-S.jpg', N'GVN-Tinker-S.jpg', N'GVN-Tinker-S.jpg', N'GVN-Tinker-S.jpg', N'Đen', CAST(32390000.00 AS Decimal(12, 2)), 5, N'NSX X', N'Bo mạch chủ GIGABYTE Z690 AORUS ELITE AX DDR4 (rev. 1.0) V2', 8, N'PC')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (10, N'GVN CYBERPUNK', N'GVN-CYBERPUNK.jpg', N'GVN-CYBERPUNK.jpg', N'GVN-CYBERPUNK.jpg', N'GVN-CYBERPUNK.jpg', N'Đen', CAST(100000000.00 AS Decimal(12, 2)), 1, N'NSX X', N'Intel Core i9 12900KS / 3.4GHz Turbo 5.5GHz / 16 Nhân 24 Luồng / 30MB / LGA 1700', 10, N'PC')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (11, N'GVN Predator Z', N'GVN-PREDATOR-Z.jpg', N'GVN-PREDATOR-Z.jpg', N'GVN-PREDATOR-Z.jpg', N'GVN-PREDATOR-Z.jpg', N'Đen', CAST(59490000.00 AS Decimal(12, 2)), 3, N'NSX X', N'ASUS ROG STRIX Z690-A GAMING WIFI DDR4', 5, N'PC')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (12, N'GVN Golem WC 1080 Ti', N'GVN-Golem-WC-1080-Ti.jpg', N'GVN-Golem-WC-1080-Ti.jpg', N'GVN-Golem-WC-1080-Ti.jpg', N'GVN-Golem-WC-1080-Ti.jpg', N'Đen', CAST(49610000.00 AS Decimal(12, 2)), 8, N'NSX X', N'Cấu hình cực khủng', 0, N'PC')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (13, N'Samsung Galaxy S22 Ultra 5G 128GB', N'samsung-galaxy-s22-ultra.jpg', N'samsung-galaxy-s22-ultra.jpg', N'samsung-galaxy-s22-ultra.jpg', N'samsung-galaxy-s22-ultra.jpg', N'Đen', CAST(30990000.00 AS Decimal(12, 2)), 10, N'NSX X', N'Sở hữu một diện mạo đầy nổi bật', 0, N'PHONE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (14, N'iPhone 11 64GB', N'iphone-11.jpg', N'iphone-11.jpg', N'iphone-11.jpg', N'iphone-11.jpg', N'Đen', CAST(14990000.00 AS Decimal(12, 2)), 20, N'NSX X', N'Nâng cấp mạnh mẽ về camera', 0, N'PHONE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (15, N'OPPO Reno7 Z 5G', N'oppo-reno7.jpg', N'oppo-reno7.jpg', N'oppo-reno7.jpg', N'oppo-reno7.jpg', N'Đen', CAST(10490000.00 AS Decimal(12, 2)), 25, N'NSX X', N'Dễ dàng nổi bật giữa đám đông', 0, N'PHONE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (16, N'Xiaomi Redmi Note 11 Pro', N'xiaomi-redmi-note-11-pro-4g.jpg', N'xiaomi-redmi-note-11-pro-4g.jpg', N'xiaomi-redmi-note-11-pro-4g.jpg', N'xiaomi-redmi-note-11-pro-4g.jpg', N'Đen', CAST(7190000.00 AS Decimal(12, 2)), 14, N'NSX X', N'Thiết kế cứng cáp, cầm nắm rất đầm tay', 0, N'PHONE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (17, N'iPhone 13 Pro Max 128GB', N'iphone-13-pro-max-xanh.jpg', N'iphone-13-pro-max-xanh.jpg', N'iphone-13-pro-max-xanh.jpg', N'iphone-13-pro-max-xanh.jpg', N'Đen', CAST(30990000.00 AS Decimal(12, 2)), 15, N'NSX X', N'Thiết kế đẳng cấp hàng đầu', 7, N'PHONE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (18, N'Samsung Galaxy A52s 5G 128GB', N'samsung-galaxy-a52s-5g.jpg', N'samsung-galaxy-a52s-5g.jpg', N'samsung-galaxy-a52s-5g.jpg', N'samsung-galaxy-a52s-5g.jpg', N'Đen', CAST(8990000.00 AS Decimal(12, 2)), 25, N'NSX X', N'Thiết kế đặc trưng Galaxy A', 0, N'PHONE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (19, N'ASUS Dual GeForce RTX 3070 8G V2', N'ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg', N'ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg', N'ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg', N'ASUS-Dual-GeForce-RTX-3070-8G-V2.jpg', N'Đen', CAST(19990000.00 AS Decimal(12, 2)), 11, N'NSX X', N'Card đồ họa mạnh mẽ  mới nhất đến từ Asus dựa trên kiến trúc NVIDIA Ampere hoàn toàn mới', 0, N'GEAR')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (20, N'Intel Pentium G6405', N'Intel-Pentium-G6405.jpg', N'Intel-Pentium-G6405.jpg', N'Intel-Pentium-G6405.jpg', N'Intel-Pentium-G6405.jpg', N'Đen', CAST(1900000.00 AS Decimal(12, 2)), 30, N'NSX X', N'Với sự cải tiến về xung nhịp, hứa hẹn đây sẽ là một lựa chọn vô cùng hấp dẫn', 0, N'GEAR')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (21, N'ASUS PRIME H610M-A WIFI D4', N'ASUS-PRIME-H610M-A-WIFI-D4.jpg', N'ASUS-PRIME-H610M-A-WIFI-D4.jpg', N'ASUS-PRIME-H610M-A-WIFI-D4.jpg', N'ASUS-PRIME-H610M-A-WIFI-D4.jpg', N'Đen', CAST(3190000.00 AS Decimal(12, 2)), 35, N'NSX X', N'Tăng hiệu suất hỗ trợ cho công việc của bạn đáng kể.', 7, N'GEAR')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (22, N'ADATA XPG Hunter DDR5 8G Bus 5200', N'ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg', N'ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg', N'ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg', N'ADATA-XPG-Hunter-DDR5-8G-Bus-5200.jpg', N'Đen', CAST(2390000.00 AS Decimal(12, 2)), 40, N'NSX X', N'Tăng RAM cho máy tính của bạn', 0, N'GEAR')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (23, N'Case JETEK EM4', N'Case-JETEK-EM4.jpg', N'Case-JETEK-EM4.jpg', N'Case-JETEK-EM4.jpg', N'Case-JETEK-EM4.jpg', N'Đen', CAST(330000.00 AS Decimal(12, 2)), 15, N'NSX X', N'Vỏ máy tính giá rẻ', 0, N'GEAR')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (24, N'Tản nhiệt DEEPCOOL GAMMAXX 400 XT', N'DEEPCOOL-GAMMAXX-400-XT.jpg', N'DEEPCOOL-GAMMAXX-400-XT.jpg', N'DEEPCOOL-GAMMAXX-400-XT.jpg', N'DEEPCOOL-GAMMAXX-400-XT.jpg', N'Đen', CAST(690000.00 AS Decimal(12, 2)), 12, N'NSX X', N'Quạt tản nhiệt cho máy tính', 0, N'GEAR')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (25, N'Chuột Logitech G203 LightSync Blue', N'Logitech-G203-LightSync-Blue.jpg', N'Logitech-G203-LightSync-Blue.jpg', N'Logitech-G203-LightSync-Blue.jpg', N'Logitech-G203-LightSync-Blue.jpg', N'Đen', CAST(400000.00 AS Decimal(12, 2)), 21, N'NSX X', N'Sở hữu nhiều nút bấm và độ nhạy cao', 0, N'MOUSE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (26, N'Chuột Razer Pro Click Mini Wireless', N'Razer-Pro-Click-Mini-Wireless.jpg', N'Razer-Pro-Click-Mini-Wireless.jpg', N'Razer-Pro-Click-Mini-Wireless.jpg', N'Razer-Pro-Click-Mini-Wireless.jpg', N'Đen', CAST(1990000.00 AS Decimal(12, 2)), 10, N'NSX X', N'Một trong những dòng sản phẩm chuột từ Razer di chuyển hoàn hảo để tăng năng suất khi di chuyển', 0, N'MOUSE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (27, N'Chuột Corsair Katar Pro Ultra Light', N'Corsair-Katar-Pro-Ultra-Light.jpg', N'Corsair-Katar-Pro-Ultra-Light.jpg', N'Corsair-Katar-Pro-Ultra-Light.jpg', N'Corsair-Katar-Pro-Ultra-Light.jpg', N'Đen', CAST(390000.00 AS Decimal(12, 2)), 100, N'NSX X', N'Một dòng chuột gaming giá rẻ ,Corsair Katar Pro Ultra Light cực kỳ nhẹ và thao tác nhanh nhạy', 0, N'MOUSE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (28, N'Chuột Dare-U LM103', N'Dare-U-LM103.jpg', N'Dare-U-LM103.jpg', N'Dare-U-LM103.jpg', N'Dare-U-LM103.jpg', N'Đen', CAST(100000.00 AS Decimal(12, 2)), 200, N'NSX X', N'Chuột siêu rẻ', 0, N'MOUSE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (29, N'Chuột Fuhlen L102 Optical Pink USB', N'Fuhlen-L102-Optical-Pink-USB.jpg', N'Fuhlen-L102-Optical-Pink-USB.jpg', N'Fuhlen-L102-Optical-Pink-USB.jpg', N'Fuhlen-L102-Optical-Pink-USB.jpg', N'Đen', CAST(140000.00 AS Decimal(12, 2)), 120, N'NSX X', N'Chuột giá rẻ', 0, N'MOUSE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (30, N'Chuột Asus TUF Gaming M4 Air', N'Asus-TUF-Gaming-M4-Air.jpg', N'Asus-TUF-Gaming-M4-Air.jpg', N'Asus-TUF-Gaming-M4-Air.jpg', N'Asus-TUF-Gaming-M4-Air.jpg', N'Đen', CAST(990000.00 AS Decimal(12, 2)), 30, N'NSX X', N'Thiết kế hiện đại', 0, N'MOUSE')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (31, N'Logitech G413 SE', N'ban-phim-co-logitech-g413-se-tactile-sw.png', N'ban-phim-co-logitech-g413-se-tactile-sw.png', N'ban-phim-co-logitech-g413-se-tactile-sw.png', N'ban-phim-co-logitech-g413-se-tactile-sw.png', N'Đen', CAST(1690000.00 AS Decimal(12, 2)), 200, N'NSX X', N'Bàn phím cơ gaming giá rẻ', 15, N'KEYB')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (32, N'Logitech G Pro X GX BLue Switch', N'G-PRO-X-1-compressed-1.jpg', N'G-PRO-X-1-compressed-1.jpg', N'G-PRO-X-1-compressed-1.jpg', N'G-PRO-X-1-compressed-1.jpg', N'Đen', CAST(2390000.00 AS Decimal(12, 2)), 129, N'NXS X', N'Bàn phím cơ logitech blue switch', 19, N'KEYB')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (33, N'AKKO PC75B Plus Year of Tiger', N'akko-pc75b-plus-year-of-tiger.jpeg', N'akko-pc75b-plus-year-of-tiger.jpeg', N'akko-pc75b-plus-year-of-tiger.jpeg', N'akko-pc75b-plus-year-of-tiger.jpeg', N'Đen', CAST(2790000.00 AS Decimal(12, 2)), 300, N'NSX X', N'Bàn phím dựa theo chủ đề tết', 10, N'KEYB')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (34, N'Logitech Pro X LEAGUE OF LEGENDS', N'Pro-KB-LOL.jpg', N'Pro-KB-LOL.jpg', N'Pro-KB-LOL.jpg', N'Pro-KB-LOL.jpg', N'Đen', CAST(2390000.00 AS Decimal(12, 2)), 500, N'NSX X', N'Bàn phím hot nhất hiện nay', 12, N'KEYB')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (35, N'ASUS ROG Strix Flare II', N'flare-ii-animate.png', N'flare-ii-animate.png', N'flare-ii-animate.png', N'flare-ii-animate.png', N'Đen', CAST(4990000.00 AS Decimal(12, 2)), 89, N'NSX X', N'Bàn phím cơ tốt nhất hiện nay', 11, N'KEYB')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (36, N'Razer Huntsman V2 Analog', N'huntman-analog-v2.jpg', N'huntman-analog-v2.jpg', N'huntman-analog-v2.jpg', N'huntman-analog-v2.jpg', N'Đen', CAST(6190000.00 AS Decimal(12, 2)), 28, N'NSX X', N'Bàn phím cao cấp', 10, N'KEYB')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (37, N'Razer BlackShark V2 X 7.1 Surrround', N'Razer-BlackShark-V2-Surrround.jpg', N'Razer-BlackShark-V2-Surrround.jpg', N'Razer-BlackShark-V2-Surrround.jpg', N'Razer-BlackShark-V2-Surrround.jpg', N'Đen', CAST(1290000.00 AS Decimal(12, 2)), 58, N'NSX X', N'Tai Nghe Razer giá rẻ', 5, N'HP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (38, N'Logitech G335 Black', N'G355-black-compressed.jpg', N'G355-black-compressed.jpg', N'G355-black-compressed.jpg', N'G355-black-compressed.jpg', N'Đen', CAST(1290000.00 AS Decimal(12, 2)), 78, N'NSX X', N'Tai nghe Logitech giá rẻ', 8, N'HP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (39, N'Kingston HyperX Cloud Stinger S 7.1', N'Kingston-HyperX-Cloud-Stinger.jpg', N'Kingston-HyperX-Cloud-Stinger.jpg', N'Kingston-HyperX-Cloud-Stinger.jpg', N'Kingston-HyperX-Cloud-Stinger.jpg', N'Đen', CAST(1350000.00 AS Decimal(12, 2)), 63, N'NSX X', N'Tai Nghe HyperX giá rẻ', 10, N'HP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (40, N'GIGABYTE AORUS H1 GAMING HEADSET', N'Aorus-H1-compressed.jpg', N'Aorus-H1-compressed.jpg', N'Aorus-H1-compressed.jpg', N'Aorus-H1-compressed.jpg', N'Đen', CAST(1990000.00 AS Decimal(12, 2)), 72, N'NSX X', N'Tai Nghe GIGABYTE', 10, N'HP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (41, N'Asus ROG Cetra True Wireless', N'cetra-tw-1.png', N'cetra-tw-1.png', N'cetra-tw-1.png', N'cetra-tw-1.png', N'Đen', CAST(2190000.00 AS Decimal(12, 2)), 39, N'NSX X', N'Tai nghe Asus', 5, N'HP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (42, N'Asus ROG Delta S Animate', N'rog-delta-s-animate.png', N'rog-delta-s-animate.png', N'rog-delta-s-animate.png', N'rog-delta-s-animate.png', N'Đen', CAST(5390000.00 AS Decimal(12, 2)), 14, N'NSX X', N'Tai nghe tốt nhất hiện nay', 15, N'HP')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (43, N'Havit SK202 USB 3.5MM 5W', N'SK202-1.png', N'SK202-1.png', N'SK202-1.png', N'SK202-1.png', N'Đen', CAST(390000.00 AS Decimal(12, 2)), 98, N'NSX X', N'Loa bán chạy nhất hiện nay', 5, N'SPKER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (44, N'Razer Nommo Chroma', N'razer-nommo-chroma.jpg', N'razer-nommo-chroma.jpg', N'razer-nommo-chroma.jpg', N'razer-nommo-chroma.jpg', N'Đen', CAST(3690000.00 AS Decimal(12, 2)), 39, N'NSX X', N'Loa Razer', 10, N'SPKER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (45, N'Razer Leviathan V2 RGB Bluetooth 5.2', N'leviathan.png', N'leviathan.png', N'leviathan.png', N'leviathan.png', N'Đen', CAST(6990000.00 AS Decimal(12, 2)), 12, N'NSX X', N'Loa tốt nhất hiện nay', 15, N'SPKER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (46, N'Bluetooth JBL Pulse 4', N'Bluetooth-JBL-Pulse-4.jpg', N'Bluetooth-JBL-Pulse-4.jpg', N'Bluetooth-JBL-Pulse-4.jpg', N'Bluetooth-JBL-Pulse-4.jpg', N'Đen', CAST(4400000.00 AS Decimal(12, 2)), 27, N'NSX X', N'Loa hot nhất hiện nay', 10, N'SPKER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (47, N'Harman/Kardon Aura Studio 3', N'Loa-Harman-Kardon-Aura-Studio-3.jpg', N'Loa-Harman-Kardon-Aura-Studio-3.jpg', N'Loa-Harman-Kardon-Aura-Studio-3.jpg', N'Loa-Harman-Kardon-Aura-Studio-3.jpg', N'Đen', CAST(5990000.00 AS Decimal(12, 2)), 18, N'NSX X', N'Loa Harman/Kardon', 18, N'SPKER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (48, N'JBL Quantum DUO', N'JBL-Quantum-DUO.jpg', N'JBL-Quantum-DUO.jpg', N'JBL-Quantum-DUO.jpg', N'JBL-Quantum-DUO.jpg', N'Đen', CAST(3490000.00 AS Decimal(12, 2)), 48, N'NSX X', N'Loa JBL giá tầm trung', 20, N'SPKER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (49, N'Aukey Bundle On The Go 3 in 1', N'Aukey-Bundle.jpg', N'Aukey-Bundle.jpg', N'Aukey-Bundle.jpg', N'Aukey-Bundle.jpg', N'Đen', CAST(990000.00 AS Decimal(12, 2)), 87, N'NSX X', N'Bộ sạc Aukey Bundle On The Go 3 trong 1', 5, N'CHGER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (50, N'HyperJuice Magnetic 2 in 1', N'HyperJuice-Magnetic.jpg', N'HyperJuice-Magnetic.jpg', N'HyperJuice-Magnetic.jpg', N'HyperJuice-Magnetic.jpg', N'Đen', CAST(1090000.00 AS Decimal(12, 2)), 56, N'NSX X', N'Bộ sạc không dây HyperJuice Magnetic', 8, N'CHGER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (51, N'GoPro Hero 9 | Hero 10', N'GoPro-Hero-9-Hero-10.jpg', N'GoPro-Hero-9-Hero-10.jpg', N'GoPro-Hero-9-Hero-10.jpg', N'GoPro-Hero-9-Hero-10.jpg', N'Đen', CAST(1350000.00 AS Decimal(12, 2)), 25, N'NSX X', N'Bộ sạc pin cho GoPro Hero 9|10', 12, N'CHGER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (52, N'Bộ sạc IPhone kèm cáp Lighning Genshai', N'new-project.jpg', N'new-project.jpg', N'new-project.jpg', N'new-project.jpg', N'Đen', CAST(150000.00 AS Decimal(12, 2)), 89, N'NSX X', N'Bộ sạc cho Iphone', 5, N'CHGER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (53, N'Bộ sạc nhanh cho Iphone kèm cáp', N'new-iphone.jpg', N'new-iphone.jpg', N'new-iphone.jpg', N'new-iphone.jpg', N'Đen', CAST(450000.00 AS Decimal(12, 2)), 58, N'NSX X', N'Bộ sạc nhanh cho Iphone', 8, N'CHGER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (54, N'Bộ sạc pin li-ion', N'Nitecore-New-i2.jpg', N'Nitecore-New-i2.jpg', N'Nitecore-New-i2.jpg', N'Nitecore-New-i2.jpg', N'Đen', CAST(320000.00 AS Decimal(12, 2)), 12, N'NSX X', N'Bộ sạc cho pin li-ion của Nitecore', 12, N'CHGER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (55, N'Cooler Master X150R Spectrum RGB', N'x150r-spectrum-1.jpg', N'x150r-spectrum-1.jpg', N'x150r-spectrum-1.jpg', N'x150r-spectrum-1.jpg', N'Đen', CAST(1050000.00 AS Decimal(12, 2)), 28, N'NSX X', N'Đế tản nhiệt laptop Cooler Master', 5, N'OTHER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (56, N'Dây LED Cooler Master LED TUBE SLEEVE', N'led-tube-sleeve-a1.jpeg', N'led-tube-sleeve-a1.jpeg', N'led-tube-sleeve-a1.jpeg', N'led-tube-sleeve-a1.jpeg', N'Đen', CAST(990000.00 AS Decimal(12, 2)), 38, N'NSX X', N'Dây LED trang trí cho PC', 10, N'OTHER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (57, N'Thermal Grizzly Kryonaut 1G', N'thermal-grizzly-kryonaut.jpg', N'thermal-grizzly-kryonaut.jpg', N'thermal-grizzly-kryonaut.jpg', N'thermal-grizzly-kryonaut.jpg', N'Đen', CAST(150000.00 AS Decimal(12, 2)), 78, N'NSX X', N'Kem tản nhiệt Thermal', 12, N'OTHER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (58, N'ASUS Zenwifi AX XT8', N'ZenWiFi-AC-XT8-black.jpg', N'ZenWiFi-AC-XT8-black.jpg', N'ZenWiFi-AC-XT8-black.jpg', N'ZenWiFi-AC-XT8-black.jpg', N'Đen', CAST(11690000.00 AS Decimal(12, 2)), 23, N'NSX X', N'Bộ Phát Wifi ASUS Zenwifi AX XT8', 15, N'OTHER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (59, N'HyperX Cloud Virtual 7.1 Surround', N'CloudII-controller-compressed.jpg', N'CloudII-controller-compressed.jpg', N'CloudII-controller-compressed.jpg', N'CloudII-controller-compressed.jpg', N'Đen', CAST(1050000.00 AS Decimal(12, 2)), 8, N'NSX X', N'Card âm thanh HyberX', 8, N'OTHER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (60, N'HyperX Pudding PBT Doubleshot', N'Pudding-keycap-1.jpg', N'Pudding-keycap-1.jpg', N'Pudding-keycap-1.jpg', N'Pudding-keycap-1.jpg', N'Đen', CAST(650000.00 AS Decimal(12, 2)), 41, N'NSX X', N'Bộ keycap HyperX Pudding PBT Doubleshot', 12, N'OTHER')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (62, N'20 Truyện Ngắn Đặc Sắc Đông Âu
', N'tqc.webp', N'tqc.webp', N'tqc.webp', N'tqc.webp', N'Đen', CAST(75000.00 AS Decimal(12, 2)), 20, N'NSX X', N'Không có gì', 20, N'TN')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (63, N'Anh Sẽ Yêu Em Mãi Chứ
', N'anhseyeuemmaichu.jpg', N'anhseyeuemmaichu.jpg', N'anhseyeuemmaichu.jpg', N'anhseyeuemmaichu.jpg', N'Đen', CAST(80000.00 AS Decimal(12, 2)), 50, N'NSX', N'Không có', 30, N'TN')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (64, N'Ai Cho Em Nằm Trên
', N'aichoemnam.webp', N'aichoemnam.webp', N'aichoemnam.webp', N'aichoemnam.webp', N'Đen', CAST(82000.00 AS Decimal(12, 2)), 12, N'NSX', N'Không có', 10, N'TN')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (65, N'Anh Yêu & Em Yêu
', N'anhyeu.webp', N'anhyeu.webp', N'anhyeu.webp', N'anhyeu.webp', N'Đen', CAST(109250.00 AS Decimal(12, 2)), 14, N'NSX X', N'Không có', 15, N'TN')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (67, N'Bản Giao Hưởng Số 6 Của Tchaikovsky
', N'bangiaohuong.jpg', N'bangiaohuong.jpg', N'bangiaohuong.jpg', N'bangiaohuong.jpg', N'Đen', CAST(72680.00 AS Decimal(12, 2)), 10, N'NSX X', N'Không có', 12, N'TN')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (68, N'Anh Vẫn Ở Đây
', N'anhvanoday.webp', N'anhvanoday.webp', N'anhvanoday.webp', N'anhvanoday.webp', N'Đen', CAST(86000.00 AS Decimal(12, 2)), 11, N'NSX', N'Không có', 32, N'TN')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (71, N'Tuổi Trẻ Lê Nin- Tiểu Thuyết', N'muasausongcua.jpg', N'muasausongcua.jpg', N'muasausongcua.jpg', N'muasausongcua.jpg', N'Đen', CAST(130.00 AS Decimal(12, 2)), 22, NULL, N'Không có', 15, N'TTT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (74, N'Cát Bụi Thương Trường - Tập 2 (Tiểu Thuyết)', N'catbui.jpg', N'catbui.jpg', N'catbui.jpg', N'catbui.jpg', N'Đen', CAST(125.00 AS Decimal(12, 2)), 23, NULL, N'Không có', 20, N'TTT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (81, N'Khoảnh Khắc Và Vô Tận - Tập Truyện Ngắn', N'khoanhkhach.webp', N'khoanhkhach.webp', N'khoanhkhach.webp', N'khoanhkhach.webp', N'Đen', CAST(115.00 AS Decimal(12, 2)), 30, NULL, N'Không có', 22, N'TTT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (84, N'Tiểu Thuyết - Thanh Giang Biệt Ly Huy Hoàng', N'bietlyhuyhoang.webp', N'bietlyhuyhoang.webp', N'bietlyhuyhoang.webp', N'bietlyhuyhoang.webp', N'Đen', CAST(70.00 AS Decimal(12, 2)), 32, NULL, N'Không có', 50, N'TTT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (85, N'Quán Café & Cung Thiên Bình', N'qcafethienbinh.webp', N'qcafethienbinh.webp', N'qcafethienbinh.webp', N'qcafethienbinh.webp', N'Đen', CAST(115.00 AS Decimal(12, 2)), 18, NULL, N'Không có', 10, N'TTT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (87, N'Mưa Sau Song Cửa', N'muasausongcua.jpg', N'muasausongcua.jpg', N'muasausongcua.jpg', N'muasausongcua.jpg', N'Đen', CAST(70.00 AS Decimal(12, 2)), 10, NULL, N'Không có', 18, N'TTT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (90, N'Nghĩ Giàu & Làm Giàu (Tái Bản 2020)', N'nghigiau.jpg', N'nghigiau.jpg', N'nghigiau.jpg', N'nghigiau.jpg', N'Đen', CAST(110.00 AS Decimal(12, 2)), 20, NULL, N'Không có', 25, N'KD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (112, N' Thói Quen Thành Công Của Những Triệu Phú Tự Thân', N'thoiquen.jpg', N'thoiquen.jpg', N'thoiquen.jpg', N'thoiquen.jpg', N'Đen', CAST(158.00 AS Decimal(12, 2)), 12, NULL, N'Không có', 12, N'KD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (115, N'Chết Vì Chứng Khoán', N'image_230368.jpg', N'image_230368.jpg', N'image_230368.jpg', N'image_230368.jpg', N'Đen', CAST(199.00 AS Decimal(12, 2)), 18, NULL, N'Không có', 15, N'KD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (116, N'Peter Drucker - Tư Duy Đúng Quản Lý Đúng', N'peter-drucker.jpg', N'peter-drucker.jpg', N'peter-drucker.jpg', N'peter-drucker.jpg', N'Đen', CAST(159.00 AS Decimal(12, 2)), 30, NULL, N'Không có', 15, N'KD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (117, N' Phá Bỏ Nguyên Tắc Để Bứt Phá - No Rules Rules', N'nxbtre_full_27202022_112029.jpg', N'nxbtre_full_27202022_112029.jpg', N'nxbtre_full_27202022_112029.jpg', N'nxbtre_full_27202022_112029.jpg', N'Đen', CAST(198.00 AS Decimal(12, 2)), 40, NULL, N'Không có', 20, N'KD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (119, N'Bộ Ba Siêu Giàu', N'image_195509_1_18250.jpg', N'image_195509_1_18250.jpg', N'image_195509_1_18250.jpg', N'image_195509_1_18250.jpg', N'Đen', CAST(95.00 AS Decimal(12, 2)), 28, NULL, N'Không có', 48, N'KD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (121, N'Cú Kung-Fu Của "King" Eric Cantona', N'image_195509_1_14856.jpg', N'image_195509_1_14856.jpg', N'image_195509_1_14856.jpg', N'image_195509_1_14856.jpg', N'Đen', CAST(119.00 AS Decimal(12, 2)), 20, NULL, N'Không có ', 15, N'TT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (122, N'Jurgen Klopp - Thổi Bùng Huyên Náo', N'image_195509_1_33945.jpg', N'image_195509_1_33945.jpg', N'image_195509_1_33945.jpg', N'image_195509_1_33945.jpg', N'Đen', CAST(169.00 AS Decimal(12, 2)), 19, NULL, N'Không có', 15, N'TT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (123, N'Cúp C1 Châu Âu - 66 Năm Lịch Sử', N'cupc1.jpg', N'cupc1.jpg', N'cupc1.jpg', N'cupc1.jpg', N'Đen', CAST(179.00 AS Decimal(12, 2)), 17, NULL, N'Không có', 15, N'TT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (125, N'Lionel Messi - Hành Trình Của Một Thiên Tài', N'messi.jpg', N'messi.jpg', N'messi.jpg', N'messi.jpg', N'Đen', CAST(339.00 AS Decimal(12, 2)), 15, NULL, N'Không có ', 15, N'TT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (126, N'Andrés Iniesta The Artist', N'image_180272.jpg', N'image_180272.jpg', N'image_180272.jpg', N'image_180272.jpg', N'Đen', CAST(159.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 15, N'TT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (127, N'Pele Cuộc Đời Và Thời Đại', N'image_195509_1_31594.jpg', N'image_195509_1_31594.jpg', N'image_195509_1_31594.jpg', N'image_195509_1_31594.jpg', N'Đen', CAST(175.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 15, N'TT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (129, N'Uncompromising Honor: 19 (Honor Harrington)', N'uncom.jpg', N'uncom.jpg', N'uncom.jpg', N'uncom.jpg', N'Đen', CAST(149000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 20, N'HD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (130, N'The Red Palace', N'thered.jpg', N'thered.jpg', N'thered.jpg', N'thered.jpg', N'Đen', CAST(314000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 29, N'HD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (131, N'The Martian', N'themartian.jpg', N'themartian.jpg', N'themartian.jpg', N'themartian.jpg', N'Đen', CAST(201000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 29, N'HD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (132, N'My Policeman: Now A Major Film Starring Harry Styles', N'mypolice.jpg', N'mypolice.jpg', N'mypolice.jpg', N'mypolice.jpg', N'Đen', CAST(190000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 29, N'HD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (134, N'Hatchet ', N'hatchet.jpg', N'hatchet.jpg', N'hatchet.jpg', N'hatchet.jpg', N'Đen', CAST(141000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 27, N'HD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (135, N'The Boy at the Top of the Mountain', N'mountain.jpg', N'mountain.jpg', N'mountain.jpg', N'mountain.jpg', N'Đen', CAST(146000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 26, N'HD')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (136, N'Diary Of A Wimpy Kid: Rodrick Rules ', N'diary.jpg', N'diary.jpg', N'diary.jpg', N'diary.jpg', N'Đen', CAST(111000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 27, N'HH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (137, N'Disney Mickey Clubhouse My Busy Book', N'mickey.jpg', N'mickey.jpg', N'mickey.jpg', N'mickey.jpg', N'Đen', CAST(171000.00 AS Decimal(12, 2)), 15, NULL, N'Không có ', 30, N'HH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (138, N'Dress Me Up Colouring And Activity Book - Mermaids', N'dress.jpg', N'dress.jpg', N'dress.jpg', N'dress.jpg', N'Đen', CAST(57000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'HH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (139, N'Turtle In Paradise: The Graphic Novel', N'turtle.jpg', N'turtle.jpg', N'turtle.jpg', N'turtle.jpg', N'Đen', CAST(207000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'HH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (140, N'Charlie and the Chocolate Factory (2007)', N'charlie.jpg', N'charlie.jpg', N'charlie.jpg', N'charlie.jpg', N'Đen', CAST(141000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'HH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (141, N'Disney Kids Readers Level 1: Dumbo', N'dumbo.jpg', N'dumbo.jpg', N'dumbo.jpg', N'dumbo.jpg', N'Đen', CAST(141000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'HH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (142, N' VÌ SAO? NHƯ THẾ NÀO? - KHÔNG GIAN', N'khonggian.jpg', N'khonggian.jpg', N'khonggian.jpg', N'khonggian.jpg', N'Đen', CAST(89000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'VT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (143, N'NGƯỜI MÁY CÓ MƠ VỀ CỪU ĐIỆN KHÔNG?', N'nguoimay.jpg', N'nguoimay.jpg', N'nguoimay.jpg', N'nguoimay.jpg', N'Đen', CAST(98000.00 AS Decimal(12, 2)), 15, NULL, N'Không có ', 30, N'VT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (144, N'80 NGÀY VÒNG QUANH THẾ GIỚI ', N'80ngaythegioi.jpg', N'80ngaythegioi.jpg', N'80ngaythegioi.jpg', N'80ngaythegioi.jpg', N'Đen', CAST(58000.00 AS Decimal(12, 2)), 15, NULL, N'Không có ', 39, N'VT')
GO
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (145, N'HAI VẠN DẶM DƯỚI ĐÁY BIỂN', N'haivan.jpg', N'haivan.jpg', N'haivan.jpg', N'haivan.jpg', N'Đen', CAST(84000.00 AS Decimal(12, 2)), 15, NULL, N'Không có ', 40, N'VT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (146, N'CUỘC THÁM HIỂM VÀO LÒNG ĐẤT', N'cuocthamhiem.jpg', N'cuocthamhiem.jpg', N'cuocthamhiem.jpg', N'cuocthamhiem.jpg', N'Đen', CAST(57000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 40, N'VT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (147, N'NGƯỜI MINH HỌA', N'nguoiminhhoa.jpg', N'nguoiminhhoa.jpg', N'nguoiminhhoa.jpg', N'nguoiminhhoa.jpg', N'Đen', CAST(101000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'VT')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (148, N' Sherlock Holmes', N'sherlock.jpg', N'sherlock.jpg', N'sherlock.jpg', N'sherlock.jpg', N'Đen', CAST(77000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'TTH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (149, N'Hỏa Ngục', N'hoanguc.jpg', N'hoanguc.jpg', N'hoanguc.jpg', N'hoanguc.jpg', N'Đen', CAST(171000.00 AS Decimal(12, 2)), 15, NULL, N'Không có', 30, N'TTH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (150, N'Mật mã Da Vinci', N'davinci.jpg', N'davinci.jpg', N'davinci.jpg', N'davinci.jpg', N'Đen', CAST(127000.00 AS Decimal(12, 2)), 16, NULL, N'Không có', 30, N'TTH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (151, N'Sự Im Lặng Của Bầy Cừu', N'suimlang.jpg', N'suimlang.jpg', N'suimlang.jpg', N'suimlang.jpg', N'Đen', CAST(84000.00 AS Decimal(12, 2)), 17, NULL, N'Không có', 30, N'TTH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (152, N'Kỳ án ánh trăng', N'kyananhtrang.jpg', N'kyananhtrang.jpg', N'kyananhtrang.jpg', N'kyananhtrang.jpg', N'Đen', CAST(140000.00 AS Decimal(12, 2)), 19, NULL, N'Không có', 31, N'TTH')
INSERT [dbo].[Products] ([Product_Id], [Name], [Image1], [Image2], [Image3], [Image4], [Color], [Price], [Quantity], [Manufactor], [Description], [Discount], [Category_Id]) VALUES (153, N' Án mạng trên sông Nile', N'anmangnile.jpg', N'anmangnile.jpg', N'anmangnile.jpg', N'anmangnile.jpg', N'Đen', CAST(108000.00 AS Decimal(12, 2)), 20, NULL, N'Không có ', 30, N'TTH')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Verify_A__536C85E4655FBCA9]    Script Date: 14/06/2023 11:36:00 CH ******/
ALTER TABLE [dbo].[Verify_Accounts] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_username] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_orders_username]
GO
ALTER TABLE [dbo].[Orders_Detail]  WITH CHECK ADD  CONSTRAINT [fk_orders_detail_order_id] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Orders] ([Order_Id])
GO
ALTER TABLE [dbo].[Orders_Detail] CHECK CONSTRAINT [fk_orders_detail_order_id]
GO
ALTER TABLE [dbo].[Orders_Detail]  WITH CHECK ADD  CONSTRAINT [fk_orders_detail_product_id] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Product_Id])
GO
ALTER TABLE [dbo].[Orders_Detail] CHECK CONSTRAINT [fk_orders_detail_product_id]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_products_category_id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Categories] ([Category_Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_products_category_id]
GO
ALTER TABLE [dbo].[Verify_Accounts]  WITH CHECK ADD  CONSTRAINT [fk_Verify_Accounts_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Verify_Accounts] CHECK CONSTRAINT [fk_Verify_Accounts_Accounts]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 14/06/2023 11:36:00 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateOrder](
@Username varchar(30),
@Create_Date date, 
@Address nvarchar(200),
@Phonenumber varchar(10), 
@Order_Note nvarchar(100), 
@Order_Status int, 
@Price decimal(12,2),
@Output int output)
as
begin
declare @OutputOrderId Table(id int)
insert into Orders(Username,Create_Date,Address, Phonenumber, Order_Note, Order_Status,Price)
output inserted.Order_Id into @OutputOrderId(id)
values(@Username,@Create_Date,@Address,@Phonenumber,@Order_Note,@Order_Status,@Price)
set @Output = (select id from @OutputOrderId)
return @Output
end


declare @o int
exec @o= CreateOrder'thinhdt15048','06-16-2022',N'TPHCM','0123456789','None',1,1000000,null
select @o
GO
USE [master]
GO
ALTER DATABASE [DB] SET  READ_WRITE 
GO
