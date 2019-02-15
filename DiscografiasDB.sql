USE [master]
GO
CREATE DATABASE [DiscografiasDB]
GO
ALTER DATABASE [DiscografiaDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiscografiaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiscografiasDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiscografiasDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiscografiasDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiscografiasDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiscografiasDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiscografiasDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DiscografiasDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiscografiasDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiscografiasDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiscografiasDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiscografiasDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiscografiasDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiscografiasDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiscografiasDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiscografiasDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DiscografiasDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiscografiasDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiscografiasDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiscografiasDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiscografiasDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiscografiasDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiscografiasDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiscografiasDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiscografiasDB] SET  MULTI_USER 
GO
ALTER DATABASE [DiscografiasDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiscografiasDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiscografiasDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiscografiasDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DiscografiasDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DiscografiasDB]
GO
/****** Object:  Table [dbo].[CategoriaMusical]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoriaMusical](
	[Id_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](45) NOT NULL,
 CONSTRAINT [PK__Categori__CB903349953F3919] PRIMARY KEY CLUSTERED 
(
	[Id_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Compania]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Compañia](
	[Id_Compañia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[direccion] [varchar](150) NULL,
 CONSTRAINT [PK_Compañia] PRIMARY KEY CLUSTERED 
(
	[Id_Compañia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Formato]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Formato](
	[Id_Formato] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Formato__DBA337B2DDE9904A] PRIMARY KEY CLUSTERED 
(
	[Id_Formato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormatoGrabacion]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormatoGrabacion](
	[Formato_id] [int] IDENTITY(1,1) NOT NULL,
	[Grabacion_id] [int] NOT NULL,
	[Estado_Conservacion] [varchar](20) NULL,
 CONSTRAINT [PK_FormatoGrabacion] PRIMARY KEY CLUSTERED 
(
	[Formato_id] ASC,
	[Grabacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grabacion]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grabacion](
	[Id_Grabacion] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](50) NOT NULL,
	[Num_Tema] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Compañia_id] [int] NOT NULL,
 CONSTRAINT [PK_Grabacion] PRIMARY KEY CLUSTERED 
(
	[Id_Grabacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Interprete]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Interprete](
	[Id_Interprete] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Interpre__E1E881DA99E815C8] PRIMARY KEY CLUSTERED 
(
	[Id_Interprete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Participacion]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participacion](
    [ParticipacionId] [int] IDENTITY(1,1) NOT NULL,
	[Grabacion_Id] [int] NOT NULL,
	[Interprete_Id] [int] NOT NULL,
	[Fecha] [nvarchar](10) NULL,
 CONSTRAINT [PK_GrabacionInterprete_1] PRIMARY KEY CLUSTERED 
(

	[ParticipacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[Formatos]    Script Date: 2018-12-19 3:09:02 PM ******/

/****** Object:  View [dbo].[Participaciones]    Script Date: 2018-12-19 3:09:02 PM ******/
/****** Object:  Index [UN_Grabacion]    Script Date: 2018-12-19 3:09:02 PM ******/
ALTER TABLE [dbo].[Grabacion] ADD  CONSTRAINT [UN_Grabacion] UNIQUE NONCLUSTERED 
(
	[Titulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UN_GrabacionInterprete]    Script Date: 2018-12-19 3:09:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UN_GrabacionInterprete] ON [dbo].[Participacion]
(
	[Grabacion_Id] ASC,
	[Interprete_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FormatoGrabacion]  WITH CHECK ADD  CONSTRAINT [FK_Formato] FOREIGN KEY([Formato_id])
REFERENCES [dbo].[Formato] ([Id_Formato])
GO
ALTER TABLE [dbo].[FormatoGrabacion] CHECK CONSTRAINT [FK_Formato]
GO
ALTER TABLE [dbo].[FormatoGrabacion]  WITH CHECK ADD  CONSTRAINT [FK_Grabacion] FOREIGN KEY([Grabacion_id])
REFERENCES [dbo].[Grabacion] ([Id_Grabacion])
GO
ALTER TABLE [dbo].[FormatoGrabacion] CHECK CONSTRAINT [FK_Grabacion]
GO
ALTER TABLE [dbo].[Grabacion]  WITH CHECK ADD  CONSTRAINT [fk_Compañia] FOREIGN KEY([Compañia_id])
REFERENCES [dbo].[Compañia] ([Id_Compañia])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Grabacion] CHECK CONSTRAINT [fk_Compañia]
GO
ALTER TABLE [dbo].[Participacion]  WITH CHECK ADD  CONSTRAINT [FK_GrabacionId] FOREIGN KEY([Grabacion_Id])
REFERENCES [dbo].[Grabacion] ([Id_Grabacion])
GO
ALTER TABLE [dbo].[Participacion] CHECK CONSTRAINT [FK_GrabacionId]
GO
ALTER TABLE [dbo].[Participacion]  WITH CHECK ADD  CONSTRAINT [FK_InterpreteId] FOREIGN KEY([Interprete_Id])
REFERENCES [dbo].[Interprete] ([Id_Interprete])
GO
ALTER TABLE [dbo].[Participacion] CHECK CONSTRAINT [FK_InterpreteId]
GO
ALTER TABLE [dbo].[FormatoGrabacion]  WITH CHECK ADD  CONSTRAINT [CK_FormatoGrabacion] CHECK  (([Estado_Conservacion]='Malo' OR [Estado_Conservacion]='Regular' OR [Estado_Conservacion]='Bueno'))
GO
ALTER TABLE [dbo].[FormatoGrabacion] CHECK CONSTRAINT [CK_FormatoGrabacion]
GO
/****** Object:  Trigger [dbo].[Capitalizar]    Script Date: 2018-12-19 3:09:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER DATABASE [DiscografiasDB] SET  READ_WRITE 
GO

INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (1, N'Bachata')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (2, N'Pop')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (3, N'Rap')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (4, N'Reggaeton')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (5, N'Rock')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (6, N'Jazz')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (7, N'Dancehall')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (8, N'Salsa')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (9, N'Merengue')
INSERT [dbo].[CategoriaMusical] ([Id_Categoria], [Nombre]) VALUES (10, N'Electrónica')
SET IDENTITY_INSERT [dbo].[Compañia] ON 
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (1, N'Pies Compania Discografica S.l', N'Calle juan Duque, 41 -PLT4 2, Madrid, 28005 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (2, N'Dogs Records Sl', N'Calle Olite, 37, Madrid, 28039 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (3, N'Producciones Procomey S.l', N'Calle los Angeles, 2-4 2, Torrelodones, 28250, Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (4, N'Indigo Records Srl', N'Calle Eugenia de Montijo, 59 - 4 A, Madrid, 28025 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (5, N'Nawao Creatividad Sl', N'Calle Fuencarral, 53 - 4 D, Madrid, 28004 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (6, N'Bravo Records S.l.', N'Calle Martinez Corrochano, 3, Madrid, 28007 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (7, N'Locomotive Music S.l', N'Calle Carpinteros, 12 - PLT 1 D, Villaviciosa de odon, 28670 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (8, N'Lam Records Sl', N'Avenida de Somosierra, 12 - PTL A. PISO 1 D, san Sebastian de los Reyes, 28703 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (9, N'Tansur Producciones S.l.', N' Calle Carrera san Jeronimo, 18 - 2, Madrid, 28014 , Madrid')
INSERT [dbo].[Compañia] ([Id_Compañia], [nombre], [direccion]) VALUES (10, N'Torrepeñote SL', N'Urbanizacion el Peñalar, CH 29,28250, Madrid')
SET IDENTITY_INSERT [dbo].[Compañia] OFF
INSERT [dbo].[Formato] ([Id_Formato], [Nombre]) VALUES (1, N'CD')
INSERT [dbo].[Formato] ([Id_Formato], [Nombre]) VALUES (2, N'Cinta')
INSERT [dbo].[Formato] ([Id_Formato], [Nombre]) VALUES (3, N'Casete')
INSERT [dbo].[Formato] ([Id_Formato], [Nombre]) VALUES (4, N'DVD')

SET IDENTITY_INSERT [dbo].[Grabacion] ON 
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (1, N'Amar Sin Mentiras', 10, N' Fue lanzado el 8 de junio de 2004', 3)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (2, N'Fénix', 26, N'Se lanzó el 20 de enero de 2017 ', 6)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (3, N'Five', 12, N'Fue lanzado el 24 de febrero de 2017', 4)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (4, N'Kamikaze', 14, N'fue lanzado el 31 de agosto de 2018', 5)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (5, N'Kind of Blue', 5, N' Su lanzamiento se produjo el 17 de agosto de 1959', 7)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (6, N'Listen', 14, N'Fue lanzado en Australia y Nueva Zelanda el 21 de noviembre de 2014', 2)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (7, N'One More Light', 10, N'Se publicó el 19 de mayo de 2017', 1)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (8, N'The Trinity', 18, N'Fue lanzado el 26 Septiembre 2005', 9)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (9, N'Thriller', 9, N'Fue lanzado el 30 de noviembre de 1982', 8)
INSERT [dbo].[Grabacion] ([Id_Grabacion], [Titulo], [Num_Tema], [Descripcion], [Compañia_id]) VALUES (10, N'Todo tiene su hora', 10, N'Fue lanzado el 11 de noviembre de 2014', 10)
SET IDENTITY_INSERT [dbo].[Grabacion] OFF

INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (1, 6, N'Regular')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (1, 7, N'Regular')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (1, 8, N'Regular')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (1, 9, N'Bueno')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (1, 10, N'Bueno')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (2, 1, N'Malo')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (2, 4, N'Bueno')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (2, 5, N'Bueno')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (2, 8, N'Bueno')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (3, 5, N'Regular')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (3, 6, N'Bueno')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (3, 7, N'Bueno')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (4, 2, N'Regular')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (4, 3, N'Regular')
INSERT [dbo].[FormatoGrabacion] ([Formato_id], [Grabacion_id], [Estado_Conservacion]) VALUES (4, 10, N'Malo')
SET IDENTITY_INSERT [dbo].[Interprete] ON 
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (1, N'Michael Jackson', N'fue un cantante, compositor, productor discográfico, bailarín, actor y filántropo estadounidense')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (2, N'Prince Royce', N'Es un cantante, compositor y productor discográfico estadounidense')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (3, N'Marc Antony', N'Es un cantante y actor estadounidense de origen puertorriqueño')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (4, N'Juan Luis Guerra', N'Es un cantante, compositor, arreglista, músico y productor dominicano')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (5, N'Michael Jackson', N'fue un cantante, compositor, productor discográfico, bailarín, actor y filántropo estadounidense')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (6, N'Michael Jackson', N'fue un cantante, compositor, productor discográfico, bailarín, actor y filántropo estadounidense')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (7, N'Michael Jackson', N'fue un cantante, compositor, productor discográfico, bailarín, actor y filántropo estadounidense')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (8, N'Michael Jackson', N'fue un cantante, compositor, productor discográfico, bailarín, actor y filántropo estadounidense')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (9, N'Michael Jackson', N'fue un cantante, compositor, productor discográfico, bailarín, actor y filántropo estadounidense')
INSERT [dbo].[Interprete] ([Id_Interprete], [Nombre], [Descripcion]) VALUES (10, N'Michael Jackson', N'fue un cantante, compositor, productor discográfico, bailarín, actor y filántropo estadounidense')
SET IDENTITY_INSERT [dbo].[Interprete] OFF
SET IDENTITY_INSERT [dbo].[Participacion] ON 
INSERT  into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (1, 3, ('2004-03-21'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (2, 9, ('2016-05-05'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (3, 2, ('2016-09-15'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (4, 8, ('2018-01-01'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (5, 6, ('1959-04-02'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (6, 5, ('2014-08-05'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (7, 7, ('2014-11-25'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (8, 10, ('2005-07-18'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (9, 1, ('1982-10-15'))
INSERT into [dbo].[Participacion] ([Grabacion_Id], [Interprete_Id], [Fecha]) VALUES (10, 4, ('1982-10-15'))
SET IDENTITY_INSERT [dbo].[Participacion] OFF
