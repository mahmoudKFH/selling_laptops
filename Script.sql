USE [master]
GO
/****** Object:  Database [LaptopPortal]    Script Date: 12/21/2021 12:52:19 AM ******/
CREATE DATABASE [LaptopPortal]
 CONTAINMENT = NONE
 GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LaptopPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LaptopPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LaptopPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LaptopPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LaptopPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LaptopPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LaptopPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LaptopPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LaptopPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LaptopPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LaptopPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LaptopPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LaptopPortal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LaptopPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LaptopPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LaptopPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LaptopPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LaptopPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LaptopPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LaptopPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LaptopPortal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LaptopPortal] SET  MULTI_USER 
GO
ALTER DATABASE [LaptopPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LaptopPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LaptopPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LaptopPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LaptopPortal] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LaptopPortal]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(101,1) NOT NULL,
	[Fname] [nvarchar](50) NULL,
	[Lname] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerOrder]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerOrder](
	[CustomerOrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_CustomerOrder] PRIMARY KEY CLUSTERED 
(
	[CustomerOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](50) NULL,
	[OrderedDate] [date] NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[ProductName] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[Processor] [nvarchar](100) NULL,
	[ScreenSize] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[IsAvaliable] [bit] NULL,
	[BrandName] [nvarchar](50) NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImgs]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImgs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[img_url] [nvarchar](250) NOT NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_ProductImgs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Lightweight')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Everyday Computing')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Desktop Replacement')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Built for Business')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Gaming')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Entertainment')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Fname], [Lname], [Email], [Password], [CreatedDate]) VALUES (101, N'customer', N'customer', N'customer@gmail.com', N'123456', CAST(N'2021-12-19' AS Date))
INSERT [dbo].[Customer] ([CustomerId], [Fname], [Lname], [Email], [Password], [CreatedDate]) VALUES (103, N'customer', NULL, N'customer1@gmail.com', N'123456', CAST(N'2021-12-19' AS Date))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Price], [ProductName], [Description], [Processor], [ScreenSize], [Color], [IsAvaliable], [BrandName], [CategoryId]) VALUES (8, CAST(1500 AS Decimal(18, 0)), N'Acer Aspire 3 Celeron Dual Core - (2 GB/500 GB HDD', N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is avai', N'i5', N'15.6', N'Silver', 1, N'Acer', 4)
INSERT [dbo].[Product] ([ProductId], [Price], [ProductName], [Description], [Processor], [ScreenSize], [Color], [IsAvaliable], [BrandName], [CategoryId]) VALUES (9, CAST(1700 AS Decimal(18, 0)), N'Dell Inspiron 15 - 7506 i7', N'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is avai', N'i7', N'16', N'Silver', 1, N'Dell', 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImgs] ON 

INSERT [dbo].[ProductImgs] ([Id], [img_url], [product_id]) VALUES (3, N'~/ProductImages/20211220235352198cfaulkner_20210326_4491_0006.jpg', 8)
INSERT [dbo].[ProductImgs] ([Id], [img_url], [product_id]) VALUES (4, N'~/ProductImages/20211221001609926laptop2.jpg', 9)
SET IDENTITY_INSERT [dbo].[ProductImgs] OFF
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderedDate]  DEFAULT (getdate()) FOR [OrderedDate]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_CustomerOrder_Customer]
GO
ALTER TABLE [dbo].[CustomerOrder]  WITH CHECK ADD  CONSTRAINT [FK_CustomerOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[CustomerOrder] CHECK CONSTRAINT [FK_CustomerOrder_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductImgs]  WITH CHECK ADD  CONSTRAINT [FK_ProductImgs_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImgs] CHECK CONSTRAINT [FK_ProductImgs_Product]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_product]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_product]
@name nvarchar(50) =null,
@color nvarchar(50) =null,
@screen_size nvarchar(50) =null,
@processor nvarchar(50) =NULL,
@description nvarchar(250) =NULL,
@available bit,
@brand_name nvarchar(250) =NULL,
@price decimal,
@category_id int
As
insert into [dbo].[Product] (Price,ProductName,Description,Processor,ScreenSize,Color,IsAvaliable,BrandName,CategoryId) output INSERTED.ProductId
 values(@price,@name,@description,@processor,@screen_size,@color,@available,@brand_name,@category_id)
GO
/****** Object:  StoredProcedure [dbo].[sp_add_relation]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_add_relation] 
@Oid int,
@CustomerId int
As 
Insert into [dbo].[CustomerOrder] (OrderId, CustomerId)
						  Values(@Oid, @CustomerId)
select SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[sp_edit_product]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_edit_product]
@name nvarchar(50) =null,
@color nvarchar(50) =null,
@screen_size nvarchar(50) =null,
@processor nvarchar(50) =NULL,
@description nvarchar(250) =NULL,
@available bit,
@brand_name nvarchar(250) =NULL,
@category_id int,
@price decimal,
@product_id int
As
update [dbo].[Product] set Price=@price, ProductName=@name,Description=@description,Processor=@processor,ScreenSize=@screen_size
,Color=@color,IsAvaliable=@available,BrandName=@brand_name,CategoryId=@category_id where ProductId=@product_id
GO
/****** Object:  StoredProcedure [dbo].[sp_get_product_byId]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_get_product_byId]
@pid int
As 
Select p.ProductId, p.ProductName, p.IsAvaliable, p.BrandName, c.CategoryName,c.CategoryId,p.Color,p.ScreenSize,
p.Description,p.Processor,p.Price,_pi.img_url as Img from [dbo].[Product] p 
Inner join [dbo].[Category] c On p.CategoryId = c.CategoryId 
Inner Join ProductImgs _pi on _pi.product_id = p.ProductId
And p.ProductId = @pid;
GO
/****** Object:  StoredProcedure [dbo].[sp_get_products]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_products]
As
Select p.ProductId, p.ProductName, p.IsAvaliable, p.BrandName, c.CategoryName,c.CategoryId,p.Color,p.Price,_pi.img_url as Img from [dbo].[Product] p 
Inner join [dbo].[Category] c On p.CategoryId = c.CategoryId
Inner Join ProductImgs _pi on _pi.product_id = p.ProductId
GO
/****** Object:  StoredProcedure [dbo].[sp_isExists_customer]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_isExists_customer]
@email nvarchar(50)
As
select email from customer where Email=@email
GO
/****** Object:  StoredProcedure [dbo].[sp_login_info]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_login_info]
@email nvarchar(50),
@pass nvarchar(50)
As
Select CustomerId from [dbo].[Customer] where @email = Email And @pass = Password
GO
/****** Object:  StoredProcedure [dbo].[sp_register_customer]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_register_customer]
@email nvarchar(50),
@pass nvarchar(50),
@fname nvarchar(50),
@lname nvarchar(50) =NULL
As
insert into customer (Fname,Lname,Email,Password,CreatedDate) values(@fname,@lname,@email,@pass,CURRENT_TIMESTAMP)
return
GO
/****** Object:  StoredProcedure [dbo].[sp_submit_order]    Script Date: 12/21/2021 12:52:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_submit_order] 
@pid int,
@OrderNumber nvarchar(50)
As 
Insert into [dbo].[Order] (OrderNumber, ProductId)
						  Values(@OrderNumber, @pid)
select SCOPE_IDENTITY();
GO
USE [master]
GO
ALTER DATABASE [LaptopPortal] SET  READ_WRITE 
GO
