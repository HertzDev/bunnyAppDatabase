USE [master]
GO
/****** Object:  Database [bunny]    Script Date: 7/5/2019 20:04:19 ******/
CREATE DATABASE [bunny]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bunny', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bunny.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bunny_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bunny_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bunny] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bunny].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bunny] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bunny] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bunny] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bunny] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bunny] SET ARITHABORT OFF 
GO
ALTER DATABASE [bunny] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bunny] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bunny] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bunny] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bunny] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bunny] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bunny] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bunny] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bunny] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bunny] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bunny] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bunny] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bunny] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bunny] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bunny] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bunny] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bunny] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bunny] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bunny] SET  MULTI_USER 
GO
ALTER DATABASE [bunny] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bunny] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bunny] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bunny] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [bunny] SET DELAYED_DURABILITY = DISABLED 
GO
USE [bunny]
GO
/****** Object:  Table [dbo].[t_claim_order]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_claim_order](
	[cod_order] [varchar](25) NOT NULL,
	[date_claim] [datetime] NULL,
	[cod_client] [varchar](25) NOT NULL,
	[reason] [varchar](200) NULL,
	[id_type_claim] [int] NULL,
	[id_state] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_client]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[cod_client] [varchar](25) NULL,
	[firstname] [varchar](30) NOT NULL,
	[lastname] [varchar](30) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[phone] [varchar](9) NULL,
	[id_state] [int] NULL,
	[id_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cod_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_department_factory]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_department_factory](
	[id_department_factory] [int] IDENTITY(1,1) NOT NULL,
	[department] [varchar](100) NOT NULL,
	[id_state] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_department_factory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_employee]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_employee](
	[id_employee] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](30) NOT NULL,
	[lastname] [varchar](30) NOT NULL,
	[birth_date] [datetime] NOT NULL,
	[direction] [varchar](300) NOT NULL,
	[phone] [varchar](9) NOT NULL,
	[cellphone] [varchar](9) NOT NULL,
	[admission_date] [datetime] NULL,
	[id_department_factory] [int] NULL,
	[id_type_employee] [int] NULL,
	[salary] [decimal](7, 2) NULL,
	[isTransport] [char](1) NULL,
	[id_state] [int] NULL,
	[id_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_logs]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_logs](
	[reason] [varchar](200) NOT NULL,
	[date_log] [datetime] NULL,
	[id_user] [int] NOT NULL,
	[cod_message] [varchar](4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_material_product]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_material_product](
	[id_material_product] [int] IDENTITY(1,1) NOT NULL,
	[material_product] [varchar](50) NOT NULL,
	[id_state] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_material_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_meeting_point]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_meeting_point](
	[id_meeting_point] [int] IDENTITY(0,1) NOT NULL,
	[direction_meeting] [varchar](200) NOT NULL,
	[latitude_meeting] [varchar](50) NOT NULL,
	[longitude_meeting] [varchar](50) NOT NULL,
	[id_state] [int] NULL,
	[id_user] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_meeting_point] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_message]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_message](
	[cod_message] [varchar](4) NOT NULL,
	[message_description] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_message] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_order_detail]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_order_detail](
	[cod_order] [varchar](25) NOT NULL,
	[cod_product] [varchar](25) NOT NULL,
	[quantity] [int] NULL,
	[image_order] [varchar](300) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_order_master]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_order_master](
	[id_order] [int] IDENTITY(0,1) NOT NULL,
	[cod_order] [varchar](25) NULL,
	[date_order] [datetime] NULL,
	[cod_client] [varchar](25) NOT NULL,
	[id_state] [int] NULL,
	[id_type_order] [int] NULL,
	[id_employee] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cod_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_product]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_product](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[cod_product] [varchar](25) NULL,
	[name_product] [varchar](200) NOT NULL,
	[description_product] [varchar](300) NULL,
	[price_unit] [decimal](5, 2) NOT NULL,
	[cost_unit] [decimal](7, 2) NOT NULL,
	[id_type_product] [int] NULL,
	[id_state] [int] NULL,
	[image_product] [varchar](200) NULL,
	[points_product] [int] NULL,
	[id_material_product] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cod_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_ship_order]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_ship_order](
	[id_ship_order] [int] IDENTITY(0,1) NOT NULL,
	[cod_order] [varchar](25) NOT NULL,
	[date_ship_order] [datetime] NOT NULL,
	[direction_ship_order] [varchar](200) NULL,
	[latitude_ship_order] [varchar](50) NULL,
	[longitude_ship_order] [varchar](50) NULL,
	[hour_ship_order] [datetime] NOT NULL,
	[comment_ship_order] [varchar](300) NULL,
	[id_meeting_point] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_ship_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_state]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_state](
	[id_state] [int] IDENTITY(1,1) NOT NULL,
	[state] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_state] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_type_claim]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_type_claim](
	[id_type_claim] [int] IDENTITY(0,1) NOT NULL,
	[type_claim] [varchar](80) NOT NULL,
	[id_state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_type_claim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_type_employee]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_type_employee](
	[id_type_employee] [int] IDENTITY(1,1) NOT NULL,
	[type_employee] [varchar](100) NOT NULL,
	[id_state] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_type_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_type_order]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_type_order](
	[id_type_order] [int] IDENTITY(1,1) NOT NULL,
	[type_order] [varchar](15) NOT NULL,
	[id_state] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_type_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_type_product]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_type_product](
	[id_type_product] [int] IDENTITY(1,1) NOT NULL,
	[type_product] [varchar](200) NOT NULL,
	[description_type_product] [varchar](300) NULL,
	[id_state] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_type_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_type_user]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_type_user](
	[id_type_user] [int] IDENTITY(1,1) NOT NULL,
	[type_user] [varchar](50) NOT NULL,
	[id_state] [int] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id_type_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[t_user]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t_user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](200) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[id_type_user] [int] NULL,
	[id_state] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[t_claim_order] ADD  DEFAULT (getdate()) FOR [date_claim]
GO
ALTER TABLE [dbo].[t_claim_order] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_client] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_employee] ADD  DEFAULT (getdate()) FOR [admission_date]
GO
ALTER TABLE [dbo].[t_employee] ADD  DEFAULT ('N') FOR [isTransport]
GO
ALTER TABLE [dbo].[t_employee] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_logs] ADD  DEFAULT (getdate()) FOR [date_log]
GO
ALTER TABLE [dbo].[t_meeting_point] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_order_master] ADD  DEFAULT (getdate()) FOR [date_order]
GO
ALTER TABLE [dbo].[t_order_master] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_product] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_product] ADD  DEFAULT ((1)) FOR [points_product]
GO
ALTER TABLE [dbo].[t_type_claim] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_user] ADD  DEFAULT ((1)) FOR [id_state]
GO
ALTER TABLE [dbo].[t_claim_order]  WITH CHECK ADD FOREIGN KEY([cod_client])
REFERENCES [dbo].[t_client] ([cod_client])
GO
ALTER TABLE [dbo].[t_claim_order]  WITH CHECK ADD FOREIGN KEY([cod_order])
REFERENCES [dbo].[t_order_master] ([cod_order])
GO
ALTER TABLE [dbo].[t_claim_order]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_claim_order]  WITH CHECK ADD FOREIGN KEY([id_type_claim])
REFERENCES [dbo].[t_type_claim] ([id_type_claim])
GO
ALTER TABLE [dbo].[t_client]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_client]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[t_user] ([id_user])
GO
ALTER TABLE [dbo].[t_department_factory]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_employee]  WITH CHECK ADD FOREIGN KEY([id_department_factory])
REFERENCES [dbo].[t_department_factory] ([id_department_factory])
GO
ALTER TABLE [dbo].[t_employee]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_employee]  WITH CHECK ADD FOREIGN KEY([id_type_employee])
REFERENCES [dbo].[t_type_employee] ([id_type_employee])
GO
ALTER TABLE [dbo].[t_employee]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[t_user] ([id_user])
GO
ALTER TABLE [dbo].[t_logs]  WITH CHECK ADD FOREIGN KEY([cod_message])
REFERENCES [dbo].[t_message] ([cod_message])
GO
ALTER TABLE [dbo].[t_logs]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[t_user] ([id_user])
GO
ALTER TABLE [dbo].[t_material_product]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_meeting_point]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_meeting_point]  WITH CHECK ADD FOREIGN KEY([id_user])
REFERENCES [dbo].[t_user] ([id_user])
GO
ALTER TABLE [dbo].[t_order_detail]  WITH CHECK ADD FOREIGN KEY([cod_order])
REFERENCES [dbo].[t_order_master] ([cod_order])
GO
ALTER TABLE [dbo].[t_order_detail]  WITH CHECK ADD FOREIGN KEY([cod_product])
REFERENCES [dbo].[t_product] ([cod_product])
GO
ALTER TABLE [dbo].[t_order_master]  WITH CHECK ADD FOREIGN KEY([cod_client])
REFERENCES [dbo].[t_client] ([cod_client])
GO
ALTER TABLE [dbo].[t_order_master]  WITH CHECK ADD FOREIGN KEY([id_employee])
REFERENCES [dbo].[t_employee] ([id_employee])
GO
ALTER TABLE [dbo].[t_order_master]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_order_master]  WITH CHECK ADD FOREIGN KEY([id_type_order])
REFERENCES [dbo].[t_type_order] ([id_type_order])
GO
ALTER TABLE [dbo].[t_product]  WITH CHECK ADD FOREIGN KEY([id_material_product])
REFERENCES [dbo].[t_material_product] ([id_material_product])
GO
ALTER TABLE [dbo].[t_product]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_product]  WITH CHECK ADD FOREIGN KEY([id_type_product])
REFERENCES [dbo].[t_type_product] ([id_type_product])
GO
ALTER TABLE [dbo].[t_ship_order]  WITH CHECK ADD FOREIGN KEY([cod_order])
REFERENCES [dbo].[t_order_master] ([cod_order])
GO
ALTER TABLE [dbo].[t_type_claim]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_type_employee]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_type_order]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_type_product]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_type_user]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD FOREIGN KEY([id_state])
REFERENCES [dbo].[t_state] ([id_state])
GO
ALTER TABLE [dbo].[t_user]  WITH CHECK ADD FOREIGN KEY([id_type_user])
REFERENCES [dbo].[t_type_user] ([id_type_user])
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_client]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_client]
(
	@p_id_client int,
	@p_cod_client varchar(25),
	@p_firstname varchar(30),
	@p_lastname varchar(30),
	@p_email varchar(200),
	@p_phone varchar(9),
	@p_id_state int,
	@p_id_user int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_client where cod_client=@p_cod_client);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_client(cod_client,firstname,lastname,email,phone,id_state,id_user) 
							values (@p_cod_client,@p_firstname,@p_lastname,@p_email,@p_phone,@p_id_state,@p_id_user);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_client);
		if(@exist>0)
		begin 
			select c.*,s.state from t_client as c
			inner join t_state as s on c.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_client set firstname=@p_firstname,lastname=@p_lastname,email=@p_email,phone=@p_phone,
				id_state=@p_id_state,id_user=@p_id_user
				where cod_client=@p_cod_client;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_client set id_state=@p_id_state where cod_client=@p_cod_client;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_client where firstname like '%'+@p_word_search+'%' 
		or lastname like '%'+@p_word_search+'%');
		if(@exist>0)
		begin 
			select c.*,s.state from t_client as c
			inner join t_state as s on c.id_state=s.id_state
			where c.id_state='1' and c.firstname like '%'+@p_word_search+'%' 
			or c.lastname like '%'+@p_word_search+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_client where id_state='1');
		if(@exist>0)
		begin 
			select c.*,s.state from t_client as c
			inner join t_state as s on c.id_state=s.id_state where c.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_department_factory]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure sp_maintenance_type_user;
create procedure [dbo].[sp_maintenance_department_factory]
(
	@p_id_department_factory int,
	@p_department varchar(100),
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_department_factory where department=@p_department);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_department_factory(department,id_state) 
							values (@p_department,@p_id_state);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_department_factory);
		if(@exist>0)
		begin 
			select df.*,s.state from t_department_factory as df
			inner join t_state as s on df.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_department_factory set department=@p_department,id_state=@p_id_state
				where id_department_factory=@p_id_department_factory;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_department_factory set id_state=@p_id_state where id_department_factory=@p_id_department_factory;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_department_factory where department like '%'+@p_word_search+'%');
		if(@exist>0)
		begin 
			select df.*,s.state from t_department_factory as df
			inner join t_state as s on df.id_state=s.id_state 
			where df.id_state='1' and department like '%'+@p_word_search+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_department_factory as df
			inner join t_state as s on df.id_state=s.id_state 
			where df.id_state='1');
		if(@exist>0)
		begin 
			select df.*,s.state from t_department_factory as df
			inner join t_state as s on df.id_state=s.id_state 
			where df.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_logs]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_logs]
(
	@p_reason varchar(200),
	@p_date_log datetime,
	@p_id_user int,
	@p_cod_message varchar(4),
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			begin transaction
				begin try
							insert into t_logs (reason,date_log,id_user,cod_message) 
							values (@p_reason,GETDATE(),@p_id_user,@p_cod_message);
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_logs);
		if(@exist>0)
		begin 
			select l.*,u.username,m.message_description from t_logs as l
			inner join t_user as u on l.id_user=u.id_user
			inner join t_message as m on l.cod_message=m.cod_message;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_logs where reason like '%'+@p_word_search+'%');
		if(@exist>0)
		begin 
			select l.*,u.username,m.message_description from t_logs as l
			inner join t_user as u on l.id_user=u.id_user
			inner join t_message as m on l.cod_message=m.cod_message
			where l.reason like '%'+@p_word_search+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_material_product]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_material_product]
(
	@p_id_material_product int,
	@p_material_product varchar(50),
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_material_product where material_product=@p_material_product);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_material_product(material_product,id_state) 
							values (@p_material_product,@p_id_state);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_material_product);
		if(@exist>0)
		begin 
			select mp.*,s.state from t_material_product as mp
			inner join t_state as s on mp.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction
			begin try
				update t_material_product set material_product=@p_material_product,id_state=@p_id_state
				where id_material_product=@p_id_material_product;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_material_product set id_state=@p_id_state where id_material_product=@p_id_material_product;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_material_product where material_product like '%'+@p_word_search+'%');
		if(@exist>0)
		begin 
			select mp.*,s.state from t_material_product as mp
			inner join t_state as s on mp.id_state=s.id_state 
			where mp.id_state='1' and material_product like '%'+@p_word_search+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_material_product where id_state='1');
		if(@exist>0)
		begin 
			select mp.*,s.state from t_material_product as mp
			inner join t_state as s on mp.id_state=s.id_state where mp.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_meeting_point]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure sp_maintenance_type_product;
create procedure [dbo].[sp_maintenance_meeting_point]
(
	
	@p_id_meeting_point int,
	@p_direction_meeting varchar(200),
	@p_latitude_meeting varchar(50),
	@p_longitude_meeting varchar(50),
	@p_id_state int,
	@p_id_user int,
	@p_option int
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_meeting_point where latitude_meeting=@p_latitude_meeting and longitude_meeting=@p_longitude_meeting);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_meeting_point(direction_meeting,latitude_meeting,longitude_meeting,id_state,id_user) 
							values (@p_direction_meeting,@p_latitude_meeting,@p_longitude_meeting,@p_id_state,@p_id_user);		
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_meeting_point);
		if(@exist>0)
		begin 
			select mp.*,s.state from t_meeting_point as mp
			inner join t_state as s on mp.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_meeting_point set direction_meeting=@p_direction_meeting,latitude_meeting=@p_latitude_meeting,longitude_meeting=@p_longitude_meeting,id_state=@p_id_state where id_meeting_point=@p_id_meeting_point and id_user=@p_id_user;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_meeting_point set id_state=@p_id_state where id_meeting_point=@p_id_meeting_point and id_user=@p_id_user;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_message]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure sp_maintenance_type_product;
create procedure [dbo].[sp_maintenance_message]
(
	@p_cod_message varchar(4),
	@p_message_description varchar(100),
	@p_option int
)
as
begin 
	if(@p_option=1)
	begin
			begin transaction
				begin try
					insert into t_message (cod_message,message_description) values (@p_cod_message,@p_message_description);
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		select * from t_message;
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_message set message_description=@p_message_description where cod_message=@p_cod_message;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_order_detail]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure sp_maintenance_type_user;
create procedure [dbo].[sp_maintenance_order_detail]
(
	@p_cod_order varchar(25),
	@p_cod_product varchar(200),
	@p_quantity int,
	@p_image_order varchar(300),
	@p_option int
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_order_detail where cod_order=@p_cod_order);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_order_detail (cod_order,cod_product,quantity,image_order) 
							values (@p_cod_order,@p_cod_product,@p_quantity,@p_image_order);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from v_order);
		if(@exist>0)
		begin 
			select * from v_order;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_order_detail set cod_product=@p_cod_product,quantity=@p_quantity,image_order=@p_image_order
				where cod_order=@p_cod_order;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				delete t_order_detail where cod_order=@p_cod_order and cod_product=@p_cod_product;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_order_master]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--drop procedure sp_maintenance_order_master;
create procedure [dbo].[sp_maintenance_order_master]
(
	@p_id_order int,
	@p_cod_order varchar(25),
	@p_date_order datetime,
	@p_cod_client varchar(25),
	@p_id_state int,
	@p_id_type_order int,
	@p_id_employee int,
	@p_option int
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_order_master where cod_order=@p_cod_order);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_order_master (cod_order,cod_client,id_state,id_type_order,id_employee) 
							values (@p_cod_order,@p_cod_client,@p_id_state,@p_id_type_order,@p_id_employee);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_order_master);
		if(@exist>0)
		begin 
			select id_order,cod_order,date_order,cod_client,client,id_state as id_state_order,state as state_order,type_order,
			id_employee,employee,subtotal
			from v_order;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_order_master set cod_client=@p_cod_client,id_state=@p_id_state,id_type_order=@p_id_type_order, id_employee=@p_id_employee
				where id_order=@p_id_order;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_order_master set id_state=@p_id_state where id_order=@p_id_order;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_product]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_product]
(
	@p_id_product int,
	@p_cod_product varchar(25),
	@p_name_product varchar(200),
	@p_description_product varchar(300),
	@p_price_unit decimal(5,2),
	@p_cost_unit decimal(7,2),
	@p_id_type_product int,
	@p_id_state int,
	@p_image_product varchar(200),
	@p_points_product int,
	@p_id_material_product int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_product where cod_product=@p_cod_product);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_product (cod_product,name_product,description_product,price_unit,cost_unit,id_type_product,id_state,image_product,points_product,id_material_product) 
							values (@p_cod_product,@p_name_product,@p_description_product,@p_price_unit,@p_cost_unit,@p_id_type_product,@p_id_state,@p_image_product,@p_points_product,@p_id_material_product);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_product);
		if(@exist>0)
		begin 
			select prod.*,tp.type_product,s.state,mp.material_product from t_product as prod
			inner join t_type_product as tp on prod.id_type_product=tp.id_type_product
			inner join t_state as s on prod.id_state=s.id_state 
			inner join t_material_product mp on prod.id_material_product=mp.id_material_product;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_product set cod_product=@p_cod_product,name_product=@p_name_product,description_product=@p_description_product,
				price_unit=@p_price_unit,cost_unit=@p_cost_unit,id_type_product=@p_id_type_product,id_state=@p_id_state,
				image_product=@p_image_product, points_product=@p_points_product, id_material_product=@p_id_material_product
				where id_product=@p_id_product;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_product set id_state=@p_id_state where id_product=@p_id_product;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_product where name_product like '%'+@p_word_search+'%' 
		or description_product like '%'+@p_word_search+'%');
		if(@exist>0)
		begin 
			select prod.*,tp.type_product,s.state,mp.material_product from t_product as prod
			inner join t_type_product as tp on prod.id_type_product=tp.id_type_product
			inner join t_state as s on prod.id_state=s.id_state 
			inner join t_material_product mp on prod.id_material_product=mp.id_material_product
			where prod.id_state='1' and tp.id_state='1' and mp.id_state='1' and name_product like '%'+@p_word_search+'%' 
			or description_product like '%'+@p_word_search+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_product as prod
			inner join t_type_product as tp on prod.id_type_product=tp.id_type_product
			inner join t_state as s on prod.id_state=s.id_state 
			inner join t_material_product mp on prod.id_material_product=mp.id_material_product
			where prod.id_state='1' and tp.id_state='1' and mp.id_state='1');
		if(@exist>0)
		begin 
			select prod.*,tp.type_product,s.state,mp.material_product from t_product as prod
			inner join t_type_product as tp on prod.id_type_product=tp.id_type_product
			inner join t_state as s on prod.id_state=s.id_state 
			inner join t_material_product mp on prod.id_material_product=mp.id_material_product
			where prod.id_state='1' and tp.id_state='1' and mp.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_ship_order]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure sp_maintenance_type_user;
create procedure [dbo].[sp_maintenance_ship_order]
(
	@p_id_ship_order int,
	@p_cod_order varchar(25),
	@p_date_ship_order datetime,
	@p_direction_ship_order varchar(200),
	@p_latitude_ship_order varchar(50),
	@p_longitude_ship_order varchar(50),
	@p_hour_ship_order datetime,
	@p_comment_ship_order varchar(300),
	@p_id_meeting_point int,
	@p_option int
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_ship_order where cod_order=@p_cod_order and CONVERT(VARCHAR(10), date_ship_order, 111)=CONVERT(VARCHAR(10),@p_date_ship_order, 111));
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							if(@p_id_meeting_point<>0)
							begin
								insert into t_ship_order(cod_order,date_ship_order,hour_ship_order,comment_ship_order,id_meeting_point) values (@p_cod_order,@p_date_ship_order,@p_hour_ship_order,@p_comment_ship_order,@p_id_meeting_point);
							end
							else
							begin
								insert into t_ship_order(cod_order,date_ship_order,direction_ship_order,latitude_ship_order,longitude_ship_order,hour_ship_order,comment_ship_order) values (@p_cod_order,@p_date_ship_order,@p_direction_ship_order,@p_latitude_ship_order,@p_longitude_ship_order,@p_hour_ship_order,@p_comment_ship_order);
							end
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_ship_order);
		if(@exist>0)
		begin 
			select id_order,cod_order,date_order,cod_client,client,id_state as id_state_order,state as state_order,type_order,
			id_employee,employee,id_ship_order,date_ship_order,direction_ship_order,latitude_ship_order,longitude_ship_order,
			hour_ship_order,comment_ship_order,id_meeting_point,direction_meeting,latitude_meeting,longitude_meeting 
			from v_order;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				declare @date_ship datetime = (select date_ship_order from t_ship_order where id_ship_order=@p_id_ship_order);
				if(CONVERT(VARCHAR(10),(select DATEADD(day,3,@date_ship)), 111)>= CONVERT(VARCHAR(10),@p_date_ship_order, 111))
				begin
					update t_ship_order set date_ship_order=@p_date_ship_order,direction_ship_order=@p_direction_ship_order,latitude_ship_order=@p_latitude_ship_order,longitude_ship_order=@p_longitude_ship_order,
					hour_ship_order=@p_hour_ship_order,comment_ship_order=@p_comment_ship_order,id_meeting_point=@p_id_meeting_point where cod_order=@p_cod_order and id_ship_order=@p_id_ship_order;
				end
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				delete t_ship_order where cod_order=@p_cod_order;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_state]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_state]
(
	@p_id_state int,
	@p_state varchar(20),
	@p_option int,
	@p_word_search varchar(20)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_state where state=@p_state);
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_state(state) values (@p_state);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
				end catch
				select cod_message,message_description from t_message where cod_message='200';
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_state);
		if(@exist>0)
		begin 
			select * from t_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_state set state=@p_state where id_state=@p_id_state;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction ;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				delete t_state where id_state=@p_id_state;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_state where state like '%'+@p_word_search+'%');
		if(@exist>0)
		begin 
			select * from t_state where state like '%'+@p_word_search+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_type_claim]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_type_claim]
(
	@p_id_type_claim int,
	@p_type_claim varchar(80),
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(20)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_type_claim where type_claim=@p_type_claim);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_type_claim(type_claim,id_state) values (@p_type_claim,@p_id_state);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_type_claim);
		if(@exist>0)
		begin 
			select tc.*,s.state from t_type_claim as tc inner join
			t_state as s on tc.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_type_claim set type_claim=@p_type_claim,id_state=@p_id_state where id_type_claim=@p_id_type_claim;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_type_claim set id_state=@p_id_state where id_type_claim=@p_id_type_claim;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_type_claim where type_claim like '%'+@p_type_claim+'%');
		if(@exist>0)
		begin 
			select tc.*,s.state from t_type_claim as tc
			 inner join t_state as s on tc.id_state=s.id_state
			 where type_claim like '%'+@p_type_claim+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_type_claim where id_state='1');
		if(@exist>0)
		begin 
			select tc.*,s.state from t_type_claim as tc inner join
			t_state as s on tc.id_state=s.id_state where tc.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_type_employee]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- drop procedure sp_maintenance_type_employee;
create procedure [dbo].[sp_maintenance_type_employee]
(
	@p_id_type_employee int,
	@p_type_employee varchar(50),
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_type_employee where type_employee=@p_type_employee);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_type_employee(type_employee,id_state) values (@p_type_employee,@p_id_state);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_type_employee);
		if(@exist>0)
		begin 
			select te.*,s.state from t_type_employee as te
			inner join t_state as s on te.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_type_employee set type_employee=@p_type_employee,id_state=@p_id_state where id_type_employee=@p_id_type_employee;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_type_employee set id_state=@p_id_state where id_type_employee=@p_id_type_employee;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_type_employee where type_employee like '%'+@p_type_employee+'%');
		if(@exist>0)
		begin 
			select te.*,s.state from t_type_employee as te
			inner join t_state as s on te.id_state=s.id_state  
			where type_employee like '%'+@p_type_employee+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_type_employee where id_state='1');
		if(@exist>0)
		begin 
			select te.*,s.state from t_type_employee as te
			inner join t_state as s on te.id_state=s.id_state where te.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_type_order]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_type_order]
(
	
	@p_id_type_order int,
	@p_type_order varchar(15),
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_type_order where type_order=@p_type_order);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_type_order (type_order,id_state) values (@p_type_order,1);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_type_order);
		if(@exist>0)
		begin 
			select tor.*,s.state from t_type_order as tor 
			inner join t_state as s on tor.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_type_order set type_order=@p_type_order, id_state=@p_id_state where id_type_order =@p_id_type_order;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_type_order set id_state=@p_id_state where id_type_order=@p_id_type_order;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_type_order where type_order like '%'+@p_type_order+'%');
		if(@exist>0)
		begin 
			select tor.*,s.state from t_type_order as tor
			inner join t_state as s on tor.id_state=s.id_state
			where type_order like '%'+@p_type_order+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_type_order where id_state='1');
		if(@exist>0)
		begin 
			select tor.*,s.state from t_type_order as tor 
			inner join t_state as s on tor.id_state=s.id_state where tor.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_type_product]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_type_product]
(
	
	@p_id_type_product int,
	@p_type_product varchar(200),
	@p_description_type_product varchar(300),
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_type_product where type_product=@p_type_product);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_type_product (type_product,description_type_product,id_state) values (@p_type_product,@p_description_type_product,@p_id_state);		
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_type_product);
		if(@exist>0)
		begin 
			select tp.*,s.state from t_type_product as tp
			inner join t_state as s on tp.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_type_product set type_product=@p_type_product, description_type_product=@p_description_type_product,id_state=@p_id_state where id_type_product=@p_id_type_product;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_type_product set id_state=@p_id_state where id_type_product=@p_id_type_product;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_type_product where type_product like '%'+@p_type_product+'%');
		if(@exist>0)
		begin 
			select tp.*,s.state from t_type_product as tp
			inner join t_state as s on tp.id_state=s.id_state
			where type_product like '%'+@p_type_product+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_type_product where id_state='1');
		if(@exist>0)
		begin 
			select tp.*,s.state from t_type_product as tp
			inner join t_state as s on tp.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_type_user]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_type_user]
(
	@p_id_type_user int,
	@p_type_user varchar(50),
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(25)

)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_type_user where type_user=@p_type_user);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_type_user (type_user, id_state) values (@p_type_user,@p_id_state);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_type_user);
		if(@exist>0)
		begin 
			select tu.*,s.state from t_type_user as tu 
			inner join t_state as s on tu.id_state=s.id_state;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_type_user set type_user=@p_type_user,id_state=@p_id_state where id_type_user=@p_id_type_user;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_type_user set id_state=@p_id_state where id_type_user=@p_id_type_user;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_type_user where type_user like '%'+@p_type_user+'%');
		if(@exist>0)
		begin 
			select tu.*,s.state from t_type_user as tu 
			inner join t_state as s on tu.id_state=s.id_state
			where type_user like '%'+@p_type_user+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if (@p_option=6)
	begin
		set @exist = (select count(*) from t_type_user where id_state='1');
		if(@exist>0)
		begin 
			select tu.*,s.state from t_type_user as tu 
			inner join t_state as s on tu.id_state=s.id_state where tu.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_maintenance_user]    Script Date: 7/5/2019 20:04:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_maintenance_user]
(
	@p_id_user int,
	@p_username varchar(200),
	@p_password varchar(20),
	@p_id_type_user int,
	@p_id_state int,
	@p_option int,
	@p_word_search varchar(25)
)
as
begin 
	declare @exist int=0;
	if(@p_option=1)
	begin
			set @exist= (select count(*) from t_user where username=@p_username);
			begin transaction
				begin try
					if (@exist>=1)
						begin
							select cod_message,message_description from t_message where cod_message='201';
						end
					else 
						begin
							insert into t_user(username,password,id_type_user,id_state) 
							values (@p_username,@p_password,@p_id_type_user,@p_id_state);
						end
				end try
				begin catch
					select cod_message,message_description from t_message where cod_message='500';
					rollback transaction
				end catch
				select cod_message,message_description from t_message where cod_message='200';
				commit transaction;
	end
	else if (@p_option=2)
	begin
		set @exist = (select count(*) from t_user);
		if(@exist>0)
		begin 
			select u.*,t.type_user,s.state from t_user as u
			inner join t_state as s on u.id_state=s.id_state
			inner join t_type_user as t on u.id_type_user=t.id_type_user;
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=3)
	begin
		begin transaction;
			begin try
				update t_user set username=@p_username,password=@p_password,id_type_user=@p_id_type_user,id_state=@p_id_state
				where id_user=@p_id_user;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
		end
	else if(@p_option=4)
	begin
		begin transaction;
			begin try
				update t_user set id_state=@p_id_state where id_user=@p_id_user;
			end try
			begin catch
				select cod_message,message_description from t_message where cod_message='500';
				rollback transaction;
			end catch
			select cod_message,message_description from t_message where cod_message='200';
			commit transaction;
	end
	else if(@p_option=5)
	begin
		set @exist = (select count(*) from t_user where username like '%'+@p_word_search+'%');
		if(@exist>0)
		begin 
			select u.*,t.type_user,s.state from t_user as u
			inner join t_state as s on u.id_state=s.id_state
			inner join t_type_user as t on u.id_type_user=t.id_type_user 
			where u.id_state='1' and username like '%'+@p_word_search+'%';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
	else if(@p_option=6)
	begin
		set @exist = (select count(*) from t_user where id_state='1');
		if(@exist>0)
		begin 
			select u.*,t.type_user,s.state from t_user as u
			inner join t_state as s on u.id_state=s.id_state
			inner join t_type_user as t on u.id_type_user=t.id_type_user 
			where u.id_state='1';
		end
		else
		begin
			select cod_message,message_description from t_message where cod_message = '404';
		end
	end
end
GO
USE [master]
GO
ALTER DATABASE [bunny] SET  READ_WRITE 
GO
