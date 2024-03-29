USE [master]
GO
/****** Object:  Database [onion_architecture]    Script Date: 29/02/2024 11:07:05 p. m. ******/
CREATE DATABASE [onion_architecture]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onion_architecture', FILENAME = N'/var/opt/mssql/data/onion_architecture.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'onion_architecture_log', FILENAME = N'/var/opt/mssql/data/onion_architecture_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [onion_architecture] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onion_architecture].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onion_architecture] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onion_architecture] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onion_architecture] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onion_architecture] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onion_architecture] SET ARITHABORT OFF 
GO
ALTER DATABASE [onion_architecture] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onion_architecture] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onion_architecture] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onion_architecture] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onion_architecture] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onion_architecture] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onion_architecture] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onion_architecture] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onion_architecture] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onion_architecture] SET  DISABLE_BROKER 
GO
ALTER DATABASE [onion_architecture] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onion_architecture] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onion_architecture] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onion_architecture] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onion_architecture] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onion_architecture] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onion_architecture] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onion_architecture] SET RECOVERY FULL 
GO
ALTER DATABASE [onion_architecture] SET  MULTI_USER 
GO
ALTER DATABASE [onion_architecture] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onion_architecture] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onion_architecture] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onion_architecture] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [onion_architecture] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'onion_architecture', N'ON'
GO
ALTER DATABASE [onion_architecture] SET QUERY_STORE = OFF
GO
USE [onion_architecture]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 29/02/2024 11:07:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[direccion] [nvarchar](255) NULL,
	[telefono] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 29/02/2024 11:07:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](10) NULL,
	[nombre] [nvarchar](100) NULL,
	[precio_unitario] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 29/02/2024 11:07:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [nvarchar](20) NULL,
	[fecha] [date] NULL,
	[total] [decimal](10, 2) NULL,
	[cliente_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas_Productos]    Script Date: 29/02/2024 11:07:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas_Productos](
	[venta_id] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[cantidad] [int] NULL,
	[subtotal] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[venta_id] ASC,
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Clientes] ([id])
GO
ALTER TABLE [dbo].[Ventas_Productos]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Ventas_Productos]  WITH CHECK ADD FOREIGN KEY([venta_id])
REFERENCES [dbo].[Ventas] ([id])
GO
/****** Object:  StoredProcedure [dbo].[SP_AGREGARVENTA]    Script Date: 29/02/2024 11:07:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[SP_AGREGARVENTA]
    @Numero INT,
    @Fecha DATETIME,
    @Total DECIMAL(18, 2),
    @ClienteId INT
AS
BEGIN
    INSERT INTO Ventas (numero, fecha, total, cliente_id)
    VALUES (@Numero, @Fecha, @Total, @ClienteId)
END;
GO
USE [master]
GO
ALTER DATABASE [onion_architecture] SET  READ_WRITE 
GO
