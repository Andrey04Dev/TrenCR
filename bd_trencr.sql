USE [master]
GO
/****** Object:  Database [bd_trencr]    Script Date: 11/22/2021 9:25:50 PM ******/
CREATE DATABASE [bd_trencr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_trencr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bd_trencr.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_trencr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bd_trencr_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bd_trencr] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_trencr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_trencr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_trencr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_trencr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_trencr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_trencr] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_trencr] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_trencr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_trencr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_trencr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_trencr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_trencr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_trencr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_trencr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_trencr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_trencr] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bd_trencr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_trencr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_trencr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_trencr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_trencr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_trencr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_trencr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_trencr] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_trencr] SET  MULTI_USER 
GO
ALTER DATABASE [bd_trencr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_trencr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_trencr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_trencr] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_trencr] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_trencr] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bd_trencr] SET QUERY_STORE = OFF
GO
USE [bd_trencr]
GO
/****** Object:  Table [dbo].[tbl_estacion]    Script Date: 11/22/2021 9:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_estacion](
	[IdEstacion] [int] IDENTITY(1,1) NOT NULL,
	[NombreLugar] [nvarchar](50) NOT NULL,
	[IdRuta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_factura]    Script Date: 11/22/2021 9:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[NombrePersona] [nvarchar](50) NOT NULL,
	[IdHora] [int] NULL,
	[Hora] [time](7) NOT NULL,
	[Ruta] [nvarchar](50) NOT NULL,
	[Estacion] [nvarchar](50) NOT NULL,
	[CantidadDeBoletos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_horas]    Script Date: 11/22/2021 9:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_horas](
	[IdHora] [int] IDENTITY(1,1) NOT NULL,
	[Horas] [time](7) NOT NULL,
	[CantidadPasajeros] [int] NOT NULL,
	[IdEstacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_rutas]    Script Date: 11/22/2021 9:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rutas](
	[IdRuta] [int] IDENTITY(1,1) NOT NULL,
	[OrigenRuta] [nvarchar](50) NOT NULL,
	[DestinoRuta] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_estacion]  WITH CHECK ADD FOREIGN KEY([IdRuta])
REFERENCES [dbo].[tbl_rutas] ([IdRuta])
GO
ALTER TABLE [dbo].[tbl_horas]  WITH CHECK ADD FOREIGN KEY([IdEstacion])
REFERENCES [dbo].[tbl_estacion] ([IdEstacion])
GO
USE [master]
GO
ALTER DATABASE [bd_trencr] SET  READ_WRITE 
GO
