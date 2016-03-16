USE [master]
GO
/****** Object:  Database [tunga]    Script Date: 16/03/2016 11:16:51 SA ******/
CREATE DATABASE [tunga]
GO
ALTER DATABASE [tunga] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tunga].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tunga] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tunga] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tunga] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tunga] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tunga] SET ARITHABORT OFF 
GO
ALTER DATABASE [tunga] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tunga] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [tunga] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tunga] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tunga] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tunga] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tunga] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tunga] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tunga] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tunga] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tunga] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tunga] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tunga] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tunga] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tunga] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tunga] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tunga] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tunga] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tunga] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tunga] SET  MULTI_USER 
GO
ALTER DATABASE [tunga] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tunga] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tunga] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tunga] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [tunga]
GO
/****** Object:  Table [dbo].[food]    Script Date: 16/03/2016 11:16:52 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NULL,
	[name] [varchar](255) NULL,
	[price] [float] NULL,
	[image] [varchar](255) NULL,
 CONSTRAINT [PK_food] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 16/03/2016 11:16:52 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](255) NULL,
	[address] [varchar](255) NULL,
	[phone] [varchar](15) NULL,
	[tax] [float] NULL,
	[total] [float] NULL,
	[token] [varchar](255) NULL,
	[status] [tinyint] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[invoice_food]    Script Date: 16/03/2016 11:16:52 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_id] [int] NULL,
	[food_id] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_order_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[invoice_table]    Script Date: 16/03/2016 11:16:52 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice_table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[invoice_id] [int] NULL,
	[table_id] [int] NULL,
	[price] [float] NULL,
	[from_time] [datetime] NULL,
	[to_time] [datetime] NULL,
 CONSTRAINT [PK_reservation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[menu]    Script Date: 16/03/2016 11:16:52 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[room]    Script Date: 16/03/2016 11:16:52 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[type] [tinyint] NULL,
 CONSTRAINT [PK_room] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[table]    Script Date: 16/03/2016 11:16:52 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[table](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[name] [varchar](255) NULL,
	[type] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[food] ADD  CONSTRAINT [DF_food_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[invoice] ADD  CONSTRAINT [DF_invoice_has_paid]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[invoice] ADD  CONSTRAINT [DF_orders_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[invoice_food] ADD  CONSTRAINT [DF_order_item_quantity]  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[food]  WITH CHECK ADD  CONSTRAINT [FK_food_menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[menu] ([id])
GO
ALTER TABLE [dbo].[food] CHECK CONSTRAINT [FK_food_menu]
GO
ALTER TABLE [dbo].[invoice_food]  WITH CHECK ADD  CONSTRAINT [FK_invoice_food_food] FOREIGN KEY([food_id])
REFERENCES [dbo].[food] ([id])
GO
ALTER TABLE [dbo].[invoice_food] CHECK CONSTRAINT [FK_invoice_food_food]
GO
ALTER TABLE [dbo].[invoice_food]  WITH CHECK ADD  CONSTRAINT [FK_invoice_food_invoice] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[invoice] ([id])
GO
ALTER TABLE [dbo].[invoice_food] CHECK CONSTRAINT [FK_invoice_food_invoice]
GO
ALTER TABLE [dbo].[invoice_table]  WITH CHECK ADD  CONSTRAINT [FK_invoice_table_invoice] FOREIGN KEY([invoice_id])
REFERENCES [dbo].[invoice] ([id])
GO
ALTER TABLE [dbo].[invoice_table] CHECK CONSTRAINT [FK_invoice_table_invoice]
GO
ALTER TABLE [dbo].[invoice_table]  WITH CHECK ADD  CONSTRAINT [FK_invoice_table_table] FOREIGN KEY([table_id])
REFERENCES [dbo].[table] ([id])
GO
ALTER TABLE [dbo].[invoice_table] CHECK CONSTRAINT [FK_invoice_table_table]
GO
ALTER TABLE [dbo].[table]  WITH CHECK ADD  CONSTRAINT [FK_table_room] FOREIGN KEY([room_id])
REFERENCES [dbo].[room] ([id])
GO
ALTER TABLE [dbo].[table] CHECK CONSTRAINT [FK_table_room]
GO
USE [master]
GO
ALTER DATABASE [tunga] SET  READ_WRITE 
GO
