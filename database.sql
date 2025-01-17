USE [master]
GO
/****** Object:  Database [AssPRJ301]    Script Date: 20/07/2024 1:29:21 CH ******/
CREATE DATABASE [AssPRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssPRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\AssPRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssPRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS02\MSSQL\DATA\AssPRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AssPRJ301] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssPRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssPRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssPRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssPRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssPRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssPRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssPRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssPRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssPRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssPRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssPRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssPRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssPRJ301] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssPRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssPRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssPRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssPRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssPRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssPRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssPRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssPRJ301] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssPRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [AssPRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssPRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssPRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssPRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssPRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssPRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AssPRJ301] SET QUERY_STORE = ON
GO
ALTER DATABASE [AssPRJ301] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AssPRJ301]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20/07/2024 1:29:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ac_id] [int] IDENTITY(1,1) NOT NULL,
	[role] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[phone] [varchar](11) NULL,
	[email] [varchar](100) NOT NULL,
	[status] [nvarchar](30) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 20/07/2024 1:29:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[ac_id] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 20/07/2024 1:29:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_line]    Script Date: 20/07/2024 1:29:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_line](
	[or_id] [int] IDENTITY(1,1) NOT NULL,
	[prod_id] [int] NOT NULL,
	[order_quantity] [int] NOT NULL,
	[item_price] [float] NULL,
	[cart_id] [int] NOT NULL,
 CONSTRAINT [PK_Order_line] PRIMARY KEY CLUSTERED 
(
	[or_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_manage]    Script Date: 20/07/2024 1:29:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_manage](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NOT NULL,
	[ac_id] [int] NULL,
	[created_date] [date] NOT NULL,
	[status] [nvarchar](50) NULL,
	[total_amount] [float] NULL,
	[address] [nvarchar](500) NULL,
	[phone] [varchar](11) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/07/2024 1:29:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[prod_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [int] NOT NULL,
	[prod_name] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[disprice] [float] NULL,
	[thumbnail] [varchar](50) NULL,
	[description] [nvarchar](200) NULL,
	[sold] [int] NULL,
	[forSale] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (1, 1, N'sa', N'123', N'0943911514', N'aduvippro@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (2, 0, N'cus1', N'123', N'0943911516', N'vipvai@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (3, 1, N'assmin', N'123', N'0943922516', N'assmin@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (4, 0, N'adudu', N'123', N'0941911516', N'adudu@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (5, 0, N'user2', N'123', N'0942911516', N'vjpro@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (6, 0, N'yugigugx', N'123', N'0943911514', N'yugiohpro1992@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (7, 0, N'stbgiap2004', N'123', N'0943911515', N'nguyenquanggiap642004@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (8, 0, N'dfadf', N'123', N'0943911515', N'ndat80828@gmail.com', N'normal')
INSERT [dbo].[Account] ([ac_id], [role], [username], [password], [phone], [email], [status]) VALUES (9, 0, N'Giap', N'123', N'0912943915', N'dfdsfds@gmail.com', N'normal')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cart_id], [quantity], [price], [ac_id]) VALUES (1, 0, 0, 2)
INSERT [dbo].[Cart] ([cart_id], [quantity], [price], [ac_id]) VALUES (2, 1, 65000000, 4)
INSERT [dbo].[Cart] ([cart_id], [quantity], [price], [ac_id]) VALUES (3, 2, 46000000, 5)
INSERT [dbo].[Cart] ([cart_id], [quantity], [price], [ac_id]) VALUES (4, 0, 0, 6)
INSERT [dbo].[Cart] ([cart_id], [quantity], [price], [ac_id]) VALUES (5, 0, 0, 7)
INSERT [dbo].[Cart] ([cart_id], [quantity], [price], [ac_id]) VALUES (6, 0, 0, 8)
INSERT [dbo].[Cart] ([cart_id], [quantity], [price], [ac_id]) VALUES (7, 0, 0, 9)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cat_id], [cat_name]) VALUES (1, N'ASUS')
INSERT [dbo].[Category] ([cat_id], [cat_name]) VALUES (2, N'LENOVO')
INSERT [dbo].[Category] ([cat_id], [cat_name]) VALUES (3, N'MSI')
INSERT [dbo].[Category] ([cat_id], [cat_name]) VALUES (4, N'DELL')
INSERT [dbo].[Category] ([cat_id], [cat_name]) VALUES (5, N'HP')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_line] ON 

INSERT [dbo].[Order_line] ([or_id], [prod_id], [order_quantity], [item_price], [cart_id]) VALUES (19, 2, 2, 46000000, 3)
INSERT [dbo].[Order_line] ([or_id], [prod_id], [order_quantity], [item_price], [cart_id]) VALUES (20, 6, 1, 65000000, 2)
SET IDENTITY_INSERT [dbo].[Order_line] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_manage] ON 

INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (12, 3, 5, CAST(N'2024-03-22' AS Date), N'Delivering', 46000000, N'Quang Ninh Province', N'0943911533')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (13, 2, 4, CAST(N'2024-03-22' AS Date), N'Delivering', 65000000, N'S702 Vinhomes Grandpark ', N'0943911514')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (14, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 362000000, N'S802 Vinhomes Grandpark ', N'0943911222')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (15, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 362000000, N'S302 Vinhomes Grandpark ', N'0943911231')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (16, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 27000000, N'Dong Nai Province', N'0943911514')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (17, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 27000000, N'Dong Nai Province', N'0943911514')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (19, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 65000000, N'Landmark 81', N'0912943915')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (24, 7, 9, CAST(N'2024-03-22' AS Date), N'Delivering', 27000000, N'Landmark 69', N'0912943915')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (27, 7, 9, CAST(N'2024-03-22' AS Date), N'Delivering', 27000000, N'Landmark 69', N'0912943915')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (28, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 65000000, N'S702 Vinhomes Grandpark ', N'0943911231')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (29, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 65000000, N'S702 Vinhomes Grandpark ', N'0943911231')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (30, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 65000000, N'S702 Vinhomes Grandpark ', N'0943911231')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (31, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 130000000, N'S702 Vinhomes Grandpark ', N'0943911533')
INSERT [dbo].[Order_manage] ([order_id], [cart_id], [ac_id], [created_date], [status], [total_amount], [address], [phone]) VALUES (32, 1, 2, CAST(N'2024-03-22' AS Date), N'Delivering', 27000000, N'S702 Vinhomes Grandpark ', N'0943911515')
SET IDENTITY_INSERT [dbo].[Order_manage] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (1, 1, N'Asus zenbook 14', 10, 21000000, 24000000, N'zenbook14.png', N'Máy tính siêu đẹp provjp', 4, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (2, 1, N'Asus expertbook', 10, 20000000, 23000000, N'expertbook.png', N'Máy tính zenbook', 6, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (3, 2, N'Lenovo ideapad', 10, 23000000, 27000000, N'len_ideapad.jpg', N'Máy tính lenovo đăng cấp thời thượng', 6, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (4, 2, N'Lenovo ThinkPad', 20, 24000000, 27000000, N'ThinkPad13.webp', N'Máy tính lenovo gaming hàng đầu', 9, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (5, 3, N'MSI G63', 5, 30000000, 40000000, N'MSIGF63.jpg', N'MSI super ultra gaming', 10, 0)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (6, 3, N'MSI TiTan', 6, 40000000, 65000000, N'MSITiTan.png', N'MSI sự thống trị tuyệt đối', 8, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (7, 4, N'DELL Latitude', 10, 20000000, 23000000, N'Dell_latitude.jpg', N'Dell siêu bền siêu chất', 2, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (8, 4, N'DELL XPS', 11, 20000000, 24000000, N'Dell_XPS.jpg', N'Dell đẳng cấp giá sinh viên', 2, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (9, 5, N'HP Pavillion', 1, 17000000, 24000000, N'HP_Pavilion.jpg', N'HP Siêu khỏe siêu trâu chiến bao lâu', 4, 1)
INSERT [dbo].[Product] ([prod_id], [cat_id], [prod_name], [quantity], [price], [disprice], [thumbnail], [description], [sold], [forSale]) VALUES (10, 5, N'HP 15', 2, 18000000, 23000000, N'HP_15.jpg', N'HP cổ điển và đẳng cấp', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([ac_id])
REFERENCES [dbo].[Account] ([ac_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Order_line]  WITH CHECK ADD  CONSTRAINT [FK_Order_line_Cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
GO
ALTER TABLE [dbo].[Order_line] CHECK CONSTRAINT [FK_Order_line_Cart]
GO
ALTER TABLE [dbo].[Order_line]  WITH CHECK ADD  CONSTRAINT [FK_Order_line_Product] FOREIGN KEY([prod_id])
REFERENCES [dbo].[Product] ([prod_id])
GO
ALTER TABLE [dbo].[Order_line] CHECK CONSTRAINT [FK_Order_line_Product]
GO
ALTER TABLE [dbo].[Order_manage]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([ac_id])
REFERENCES [dbo].[Account] ([ac_id])
GO
ALTER TABLE [dbo].[Order_manage] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order_manage]  WITH CHECK ADD  CONSTRAINT [FK_Order_Cart] FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
GO
ALTER TABLE [dbo].[Order_manage] CHECK CONSTRAINT [FK_Order_Cart]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cat_id])
REFERENCES [dbo].[Category] ([cat_id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
/****** Object:  StoredProcedure [dbo].[GetTopSellingProducts]    Script Date: 20/07/2024 1:29:21 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopSellingProducts]
AS
BEGIN
    SELECT Top 6 *
    FROM Product
	where forSale=1
    ORDER BY sold DESC 
END;
GO
USE [master]
GO
ALTER DATABASE [AssPRJ301] SET  READ_WRITE 
GO
