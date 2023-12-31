USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 10.10.2023 12:34:47 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Users\10210156\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Users\10210156\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[NameProdyktID]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameProdyktID](
	[NameID] [int] NOT NULL,
	[NameProdyct] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NameProdyktID] PRIMARY KEY CLUSTERED 
(
	[NameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postavshik]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postavshik](
	[PostavshikID] [int] NULL,
	[Postavshik] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [nvarchar](50) NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NOT NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [int] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD5851A8C79] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvoditel]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvoditel](
	[ProizvoditelID] [int] NOT NULL,
	[Proizvoditel] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Proizvoditel] PRIMARY KEY CLUSTERED 
(
	[ProizvoditelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__Role__8AFACE3A1C4BE821] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.10.2023 12:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[NameProdyktID] ([NameID], [NameProdyct]) VALUES (1, N'Летуаль')
INSERT [dbo].[NameProdyktID] ([NameID], [NameProdyct]) VALUES (2, N'Рив Гош')
GO
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'27', N'A436H7', 2, N'Туалетная вода Dilis Parfum Aqua Cool, 100 мл', N'1', N'', 5, CAST(1000.0000 AS Decimal(19, 4)), 15, 12)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'11', N'C323R4', 3, N'Парфюмерная вода TRUSSARDI Donna Trussardi (2011), 50 мл', N'1', N'', 6, CAST(4100.0000 AS Decimal(19, 4)), 25, 8)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'7', N'D344Y7', 3, N'Парфюмерная вода Today Parfum Prestige №6 Eclat, 17 мл', N'2', N'D344Y7.jpg', 4, CAST(223.0000 AS Decimal(19, 4)), 10, 16)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'10', N'D378D3', 2, N'Духи Dilis Parfum Classic Collection №18, 30 мл', N'2', N'D378D3.jpg', 5, CAST(1500.0000 AS Decimal(19, 4)), 10, 16)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'23', N'D526R4', 3, N'Парфюмерная вода DOLCE & GABBANA Dolce&Gabbana pour', N'2', N'', 9, CAST(3600.0000 AS Decimal(19, 4)), 10, 6)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'25', N'D634D4', 2, N'Туалетная вода Paris Line Parfums Dollar Diamond, 100 мл', N'1', N'', 2, CAST(367.0000 AS Decimal(19, 4)), 15, 14)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'9', N'E245R5', 2, N'Туалетная вода Dilis Parfum Mila, 100 мл', N'2', N'E245R5.jpg', 5, CAST(1000.0000 AS Decimal(19, 4)), 15, 2)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'29', N'E479G6', 2, N'Туалетная вода HUGO BOSS Boss Bottled, 100 мл', N'1', N'', 8, CAST(6100.0000 AS Decimal(19, 4)), 25, 3)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'4', N'E530Y6', 3, N'Парфюмерная вода Parfums Constantine Mademoiselle 5, 50 мл', N'2', N'E530Y6.jpg', 3, CAST(519.0000 AS Decimal(19, 4)), 15, 9)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'19', N'E573G6', 4, N'Духи Dilis Parfum Classic Collection №34, 30 мл', N'2', N'', 5, CAST(1087.0000 AS Decimal(19, 4)), 15, 13)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'21', N'F344S4', 2, N'Туалетная вода Today Parfum Cola Cherry, 50 мл', N'2', N'', 4, CAST(546.0000 AS Decimal(19, 4)), 5, 9)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'5', N'F346G5', 2, N'Туалетная вода Today Parfum G-Club Egoist, 100 мл', N'2', N'F346G5.jpg', 4, CAST(450.0000 AS Decimal(19, 4)), 5, 18)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'2', N'F893T5', 2, N'Туалетная вода Paris Line Parfums Cosa Nostra Platinum, 100 мл', N'2', N'F893T5.jpg', 2, CAST(327.0000 AS Decimal(19, 4)), 15, 14)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'16', N'G532R5', 3, N'Парфюмерная вода Parfums Constantine New York Perfume Six, 50 мл', N'1', N'', 3, CAST(640.0000 AS Decimal(19, 4)), 10, 16)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'3', N'G832G6', 2, N'Туалетная вода Paris Line Parfums Vodka Extreme, 100 мл', N'2', N'G832G6.jpg', 2, CAST(368.0000 AS Decimal(19, 4)), 10, 7)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'20', N'H647R5', 2, N'Туалетная вода Parfums Constantine Gentleman №3, 100 мл', N'2', N'', 3, CAST(555.0000 AS Decimal(19, 4)), 10, 6)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'12', N'H732R5', 2, N'Туалетная вода Paris Line Parfums Cosa Nostra, 100 мл', N'2', N'', 2, CAST(500.0000 AS Decimal(19, 4)), 15, 7)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'6', N'J432E4', 2, N'Туалетная вода Paris Line Parfums Dollar, 100 мл', N'2', N'J432E4.jpg', 2, CAST(341.0000 AS Decimal(19, 4)), 5, 4)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'15', N'K535G6', 3, N'Парфюмерная вода Yves de Sistelle Incidence pour Femme, 65 мл', N'2', N'', 7, CAST(1200.0000 AS Decimal(19, 4)), 15, 5)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'17', N'K742T5', 2, N'Туалетная вода Dilis Parfum Cool&Grey, 100 мл', N'1', N'', 5, CAST(900.0000 AS Decimal(19, 4)), 15, 6)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'22', N'L533E4', 2, N'Туалетная вода HUGO BOSS Boss Bottled, 50 мл', N'1', N'', 8, CAST(3900.0000 AS Decimal(19, 4)), 15, 15)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'28', N'O875F6', 3, N'Dilis Parfum Мужской Walker Breeze', N'1', N'', 5, CAST(600.0000 AS Decimal(19, 4)), 10, 5)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'13', N'R464G6', 4, N'Духи Dilis Parfum Ночная Фиалка, 9.5 мл', N'2', N'', 5, CAST(290.0000 AS Decimal(19, 4)), 5, 11)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'18', N'R563E3', 2, N'Туалетная вода Today Parfum G-Club Millioner, 100 мл', N'1', N'', 4, CAST(418.0000 AS Decimal(19, 4)), 5, 9)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'14', N'S346H6', 2, N'Туалетная вода Dilis Parfum Steelman Zone, 100 мл', N'1', N'', 5, CAST(1000.0000 AS Decimal(19, 4)), 10, 12)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'24', N'S753T5', 3, N'Парфюмерная вода DOLCE & GABBANA Dolce Shine, 75 мл', N'2', N'', 9, CAST(5200.0000 AS Decimal(19, 4)), 5, 3)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'8', N'V324R5', 3, N'Парфюмерная вода Parfums Constantine Mademoiselle 7, 50 мл', N'2', N'V324R5.jpg', 3, CAST(519.0000 AS Decimal(19, 4)), 5, 5)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'26', N'V472S3', 3, N'Парфюмерная вода LACOSTE Lacoste pour Femme, 30 мл', N'1', N'', 10, CAST(2640.0000 AS Decimal(19, 4)), 30, 7)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'30', N'V493E3', 2, N'Туалетная вода DOLCE & GABBANA 3 L''Imperatrice, 50 мл', N'2', N'', 9, CAST(3200.0000 AS Decimal(19, 4)), 10, 8)
INSERT [dbo].[Product] ([id], [ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'1', N'А112Т4', 1, N'Одеколон Dragon Parfums Dragon Noir, 100 мл', N'1', N'А112Т4.jpg', 1, CAST(660.0000 AS Decimal(19, 4)), 30, 6)
GO
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (1, N'Dragon')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (2, N'Paris Line')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (3, N'Parfums Constantine')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (4, N'Today Parfum')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (5, N'Dilis Parfum')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (6, N'TRUSSARDI')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (7, N'Yves de Sistelle')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (8, N'HUGO BOSS')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (9, N'DOLCE & GABBANA')
INSERT [dbo].[Proizvoditel] ([ProizvoditelID], [Proizvoditel]) VALUES (10, N'LACOSTE')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (104, N'Константинова ', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (105, N'Меркушев ', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (106, N'Казаков ', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (107, N'Карпов ', N'Улеб', N'Леонидович', N'loginDEcph2018', N'7YpE0p', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (108, N'Королёв ', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (109, N'Юдин ', N'Герман', N'Кондратович', N'loginDEwjg2018', N'9UfqWQ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (110, N'Беляева ', N'Анна', N'Вячеславовна', N'loginDEjbz2018', N'xIAWNI', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (111, N'Беляев ', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (112, N'Семёнов ', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (113, N'Шестаков ', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (114, N'Власов ', N'Вадим', N'Васильевич', N'loginDEtfj2018', N'{{ksPn', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (115, N'Савельев ', N'Арсений', N'Авксентьевич', N'loginDEpnb2018', N'{ADBdc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (116, N'Ефимов ', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (117, N'Бурова ', N'Марфа', N'Федотовна', N'loginDEiin2018', N'y9l*b}', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (118, N'Селезнёв ', N'Александр', N'Никитевич', N'loginDEqda2018', N'|h+r}I', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (119, N'Кулакова ', N'Виктория', N'Георгьевна', N'loginDEbnj2018', N'#ИМЯ?', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (120, N'Дорофеева ', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (121, N'Сафонова ', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (122, N'Ситникова ', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (123, N'Медведев ', N'Ириней', N'Геннадьевич', N'loginDEjis2018', N'A9K++2', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (124, N'Суханова ', N'Евгения', N'Улебовна', N'loginDExvv2018', N'R1zh}|', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (125, N'Игнатьев ', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (126, N'Ефремов ', N'Христофор', N'Владиславович', N'loginDEyzn2018', N'P1v24R', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (127, N'Кошелев ', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (128, N'Галкина ', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (129, N'Журавлёва ', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (130, N'Савина ', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (131, N'Иванов ', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (132, N'Лыткин ', N'Ким', N'Алексеевич', N'loginDEwqc2018', N'vRtAP*', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (133, N'Логинов ', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (134, N'Русакова ', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (135, N'Константинов ', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (136, N'Поляков ', N'Анатолий', N'Игоревич', N'loginDEtfz2018', N'uQY0ZQ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (137, N'Панфилова ', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (138, N'Воробьёв ', N'Герман', N'Романович', N'loginDEdmi2018', N'HOGFbU', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (139, N'Андреев ', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (140, N'Бобров ', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (141, N'Лапин ', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (142, N'Шестаков ', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (143, N'Гаврилова ', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (144, N'Жуков ', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (145, N'Пономарёв ', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (146, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (147, N'Осипов ', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (148, N'Лапин ', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (149, N'Зуев ', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (150, N'Коновалова ', N'Агафья', N'Митрофановна', N'loginDEisp2018', N'dfz5Ii', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (151, N'Исаев ', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (152, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (153, N'Самсонов ', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Proizvoditel] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Proizvoditel] ([ProizvoditelID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Proizvoditel]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__267ABA7A] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
