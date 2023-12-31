USE [UP321WPF]
GO
/****** Object:  Table [dbo].[Degree]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[Id_degree] [int] NOT NULL,
	[Degree] [nvarchar](max) NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[Id_degree] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id_Employee] [int] NOT NULL,
	[Id_Lectern] [nvarchar](2) NULL,
	[Surname] [nvarchar](50) NULL,
	[Id_Position] [int] NULL,
	[Salary] [decimal](8, 2) NULL,
	[Chief] [int] NULL,
	[Stage] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Id_degree] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Date_Exam] [date] NOT NULL,
	[Id_Subject] [int] NULL,
	[Id_Student] [int] NOT NULL,
	[Id_Employee] [int] NULL,
	[Auditory] [nvarchar](10) NULL,
	[Mark] [int] NULL,
	[IsDeleted] [bit] NULL,
	[Id_Exam] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Id_Exam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id_Faculty] [nvarchar](2) NOT NULL,
	[Name_Faculty] [nvarchar](100) NULL,
 CONSTRAINT [PK_Facukty] PRIMARY KEY CLUSTERED 
(
	[Id_Faculty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectern]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectern](
	[Id_Lectern] [nvarchar](2) NOT NULL,
	[Name_Lectern] [nvarchar](100) NULL,
	[Id_Faculty] [nvarchar](2) NULL,
 CONSTRAINT [PK_Lectern] PRIMARY KEY CLUSTERED 
(
	[Id_Lectern] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id_Position] [int] NOT NULL,
	[Position] [nvarchar](max) NULL,
	[Id_Degree] [int] NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id_Position] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id_Spec] [nvarchar](8) NOT NULL,
	[Id_Subject] [int] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Id_Spec] ASC,
	[Id_Subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specs]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specs](
	[Id_Spec] [nvarchar](8) NOT NULL,
	[Direction] [nvarchar](50) NULL,
	[Id_Lectern] [nvarchar](2) NULL,
 CONSTRAINT [PK_Specs] PRIMARY KEY CLUSTERED 
(
	[Id_Spec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id_Student] [int] NOT NULL,
	[Id_Spec] [nvarchar](8) NULL,
	[Surname_Student] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 24.11.2023 13:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id_Subject] [int] NOT NULL,
	[Cize_Subject] [int] NULL,
	[Name_Subject] [nvarchar](30) NULL,
	[Id_Lectern] [nvarchar](2) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id_Subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Degree] ([Id_degree], [Degree]) VALUES (1, N'д. т.н.')
INSERT [dbo].[Degree] ([Id_degree], [Degree]) VALUES (2, N'к. ф.-м. н.')
INSERT [dbo].[Degree] ([Id_degree], [Degree]) VALUES (3, N'к. т.н.')
INSERT [dbo].[Degree] ([Id_degree], [Degree]) VALUES (4, N'д. ф.-м. н.')
GO
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (101, N'пи', N'Прохоров П.П.', 3, CAST(35000.00 AS Decimal(8, 2)), 101, 15, NULL, 1)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (102, N'пи', N'Семенов С.С.', 5, CAST(25000.00 AS Decimal(8, 2)), 101, NULL, NULL, 2)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (105, N'пи', N'Петров П.П.', 6, CAST(25000.00 AS Decimal(8, 2)), 101, NULL, NULL, 3)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (153, N'пи', N'Сидорова С.С.', 2, CAST(15000.00 AS Decimal(8, 2)), 102, NULL, NULL, 4)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (201, N'ис', N'Андреев А.А.', 4, CAST(35000.00 AS Decimal(8, 2)), 201, 18, NULL, 3)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (202, N'ис', N'Борисов Б.Б.', 5, CAST(25000.00 AS Decimal(8, 2)), 201, NULL, NULL, 2)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (241, N'ис', N'Глухов Г.Г.', 2, CAST(20000.00 AS Decimal(8, 2)), 201, NULL, NULL, 1)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (242, N'ис', N'Чернов Ч.Ч.', 1, CAST(15000.00 AS Decimal(8, 2)), 202, NULL, NULL, 4)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (301, N'мм', N'Басов Б.Б.', 3, CAST(35000.00 AS Decimal(8, 2)), 301, 20, NULL, 3)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (302, N'мм', N'Сергеева С.С.', 6, CAST(25000.00 AS Decimal(8, 2)), 301, NULL, NULL, 2)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (401, N'оф', N'Волков В.В.', 3, CAST(35000.00 AS Decimal(8, 2)), 401, 10, NULL, 1)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (402, N'оф', N'Зайцев З.З.', 6, CAST(25000.00 AS Decimal(8, 2)), 401, NULL, NULL, 2)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (403, N'оф', N'Смирнов С.С.', 7, CAST(15000.00 AS Decimal(8, 2)), 401, NULL, NULL, 4)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (435, N'оф', N'Лисин Л.Л.', 2, CAST(20000.00 AS Decimal(8, 2)), 402, NULL, NULL, 3)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (501, N'вм', N'Кузнецов К.К.', 1, CAST(35000.00 AS Decimal(8, 2)), 501, 18, NULL, 1)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (502, N'вм', N'Романцев Р.Р.', 1, CAST(25000.00 AS Decimal(8, 2)), 501, NULL, NULL, 1)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (503, N'вм', N'Соловьев С.С.', 5, CAST(25000.00 AS Decimal(8, 2)), 501, NULL, NULL, 3)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (601, N'эф', N'Зверев З.З.', 4, CAST(35000.00 AS Decimal(8, 2)), 601, 8, NULL, 2)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (602, N'эф', N'Сорокина С.С.', NULL, CAST(25000.00 AS Decimal(8, 2)), 601, NULL, NULL, 4)
INSERT [dbo].[Employee] ([Id_Employee], [Id_Lectern], [Surname], [Id_Position], [Salary], [Chief], [Stage], [IsDeleted], [Id_degree]) VALUES (614, N'эф', N'Григорьев Г.Г.', 1, CAST(20000.00 AS Decimal(8, 2)), 602, NULL, NULL, 1)
GO
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4, 1, 1)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4, NULL, 2)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4, NULL, 3)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3, NULL, 4)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3, NULL, 5)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4, NULL, 6)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5, NULL, 7)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3, NULL, 8)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4, NULL, 9)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4, NULL, 10)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4, NULL, 11)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5, NULL, 12)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5, NULL, 13)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4, NULL, 14)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4, NULL, 15)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4, NULL, 16)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4, NULL, 17)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5, NULL, 18)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3, NULL, 19)
INSERT [dbo].[Exam] ([Date_Exam], [Id_Subject], [Id_Student], [Id_Employee], [Auditory], [Mark], [IsDeleted], [Id_Exam]) VALUES (CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5, NULL, 20)
GO
INSERT [dbo].[Faculty] ([Id_Faculty], [Name_Faculty]) VALUES (N'гн', N'Гуманитарные науки')
INSERT [dbo].[Faculty] ([Id_Faculty], [Name_Faculty]) VALUES (N'ен', N'Естественные науки')
INSERT [dbo].[Faculty] ([Id_Faculty], [Name_Faculty]) VALUES (N'ит', N'Информационные технологии')
INSERT [dbo].[Faculty] ([Id_Faculty], [Name_Faculty]) VALUES (N'фм', N'Физико-математический')
GO
INSERT [dbo].[Lectern] ([Id_Lectern], [Name_Lectern], [Id_Faculty]) VALUES (N'вм', N'Высшая математика', N'ен')
INSERT [dbo].[Lectern] ([Id_Lectern], [Name_Lectern], [Id_Faculty]) VALUES (N'ис', N'Информационные системы', N'ит')
INSERT [dbo].[Lectern] ([Id_Lectern], [Name_Lectern], [Id_Faculty]) VALUES (N'мм', N'Математическое моделирование', N'фм')
INSERT [dbo].[Lectern] ([Id_Lectern], [Name_Lectern], [Id_Faculty]) VALUES (N'оф', N'Общая физика', N'ен')
INSERT [dbo].[Lectern] ([Id_Lectern], [Name_Lectern], [Id_Faculty]) VALUES (N'пи', N'Прикладная информатика', N'ит')
INSERT [dbo].[Lectern] ([Id_Lectern], [Name_Lectern], [Id_Faculty]) VALUES (N'эф', N'Экспериментальная физика', N'фм')
GO
INSERT [dbo].[Position] ([Id_Position], [Position], [Id_Degree]) VALUES (1, N'программист', NULL)
INSERT [dbo].[Position] ([Id_Position], [Position], [Id_Degree]) VALUES (2, N'Электрик', NULL)
INSERT [dbo].[Position] ([Id_Position], [Position], [Id_Degree]) VALUES (3, N'профессор', 1)
INSERT [dbo].[Position] ([Id_Position], [Position], [Id_Degree]) VALUES (4, N'профессор', 4)
INSERT [dbo].[Position] ([Id_Position], [Position], [Id_Degree]) VALUES (5, N'доцент', 2)
INSERT [dbo].[Position] ([Id_Position], [Position], [Id_Degree]) VALUES (6, N'доцент', 3)
INSERT [dbo].[Position] ([Id_Position], [Position], [Id_Degree]) VALUES (7, N'ассистент', NULL)
GO
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'01.03.04', 101)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'01.03.04', 205)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'01.03.04', 209)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.02', 101)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.02', 102)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.02', 103)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.02', 202)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.02', 205)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.02', 209)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.03', 101)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.03', 102)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.03', 103)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.03', 202)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'09.03.03', 205)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'14.03.02', 101)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'14.03.02', 102)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'14.03.02', 103)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'14.03.02', 204)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'38.03.05', 101)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'38.03.05', 103)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'38.03.05', 202)
INSERT [dbo].[Request] ([Id_Spec], [Id_Subject]) VALUES (N'38.03.05', 209)
GO
INSERT [dbo].[Specs] ([Id_Spec], [Direction], [Id_Lectern]) VALUES (N'01.03.04', N'Прикладная математика', N'мм')
INSERT [dbo].[Specs] ([Id_Spec], [Direction], [Id_Lectern]) VALUES (N'09.03.02', N'Информационные системы и технологии', N'ис')
INSERT [dbo].[Specs] ([Id_Spec], [Direction], [Id_Lectern]) VALUES (N'09.03.03', N'Прикладная информатика', N'пи')
INSERT [dbo].[Specs] ([Id_Spec], [Direction], [Id_Lectern]) VALUES (N'14.03.02', N'Ядерные физика и технологии', N'эф')
INSERT [dbo].[Specs] ([Id_Spec], [Direction], [Id_Lectern]) VALUES (N'38.03.05', N'Бизнес-информатика', N'ис')
GO
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (10101, N'09.03.03', N'Николаева Н. Н.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (10102, N'09.03.03', N'Иванов И. И.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (10103, N'09.03.03', N'Крюков К. К.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (20101, N'09.03.02', N'Андреев А. А.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (20102, N'09.03.02', N'Федоров Ф. Ф.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (30101, N'14.03.02', N'Бондаренко Б. Б.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (30102, N'14.03.02', N'Цветков К. К.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (30103, N'14.03.02', N'Петров П. П.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (50101, N'01.03.04', N'Сергеев С. С.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (50102, N'01.03.04', N'Кудрявцев К. К.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (80101, N'38.03.05', N'Макаров М. М.', NULL)
INSERT [dbo].[Student] ([Id_Student], [Id_Spec], [Surname_Student], [IsDeleted]) VALUES (80102, N'38.03.05', N'Яковлев Я. Я.', NULL)
GO
INSERT [dbo].[Subject] ([Id_Subject], [Cize_Subject], [Name_Subject], [Id_Lectern], [IsDeleted]) VALUES (101, 320, N'Математика', N'вм', NULL)
INSERT [dbo].[Subject] ([Id_Subject], [Cize_Subject], [Name_Subject], [Id_Lectern], [IsDeleted]) VALUES (102, 160, N'Информатика', N'пи', NULL)
INSERT [dbo].[Subject] ([Id_Subject], [Cize_Subject], [Name_Subject], [Id_Lectern], [IsDeleted]) VALUES (103, 160, N'Физика', N'оф', NULL)
INSERT [dbo].[Subject] ([Id_Subject], [Cize_Subject], [Name_Subject], [Id_Lectern], [IsDeleted]) VALUES (202, 120, N'Базы данных', N'ис', NULL)
INSERT [dbo].[Subject] ([Id_Subject], [Cize_Subject], [Name_Subject], [Id_Lectern], [IsDeleted]) VALUES (204, 160, N'Электроника', N'эф', NULL)
INSERT [dbo].[Subject] ([Id_Subject], [Cize_Subject], [Name_Subject], [Id_Lectern], [IsDeleted]) VALUES (205, 80, N'Программирование', N'пи', NULL)
INSERT [dbo].[Subject] ([Id_Subject], [Cize_Subject], [Name_Subject], [Id_Lectern], [IsDeleted]) VALUES (209, 80, N'Моделирование', N'мм', NULL)
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Degree] FOREIGN KEY([Id_degree])
REFERENCES [dbo].[Degree] ([Id_degree])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Degree]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee] FOREIGN KEY([Chief])
REFERENCES [dbo].[Employee] ([Id_Employee])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([Id_Position])
REFERENCES [dbo].[Position] ([Id_Position])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_To_Lectern] FOREIGN KEY([Id_Lectern])
REFERENCES [dbo].[Lectern] ([Id_Lectern])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_To_Lectern]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_To_Employee] FOREIGN KEY([Id_Employee])
REFERENCES [dbo].[Employee] ([Id_Employee])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_To_Employee]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_To_Student] FOREIGN KEY([Id_Student])
REFERENCES [dbo].[Student] ([Id_Student])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_To_Student]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_To_Subject] FOREIGN KEY([Id_Subject])
REFERENCES [dbo].[Subject] ([Id_Subject])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_To_Subject]
GO
ALTER TABLE [dbo].[Lectern]  WITH CHECK ADD  CONSTRAINT [FK_Lectern_To_Faculty] FOREIGN KEY([Id_Faculty])
REFERENCES [dbo].[Faculty] ([Id_Faculty])
GO
ALTER TABLE [dbo].[Lectern] CHECK CONSTRAINT [FK_Lectern_To_Faculty]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_To_Spec] FOREIGN KEY([Id_Spec])
REFERENCES [dbo].[Specs] ([Id_Spec])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_To_Spec]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_To_Subject] FOREIGN KEY([Id_Subject])
REFERENCES [dbo].[Subject] ([Id_Subject])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_To_Subject]
GO
ALTER TABLE [dbo].[Specs]  WITH CHECK ADD  CONSTRAINT [FK_Specs_To_Lectern] FOREIGN KEY([Id_Lectern])
REFERENCES [dbo].[Lectern] ([Id_Lectern])
GO
ALTER TABLE [dbo].[Specs] CHECK CONSTRAINT [FK_Specs_To_Lectern]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_To_Spec] FOREIGN KEY([Id_Spec])
REFERENCES [dbo].[Specs] ([Id_Spec])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_To_Spec]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_To_Lectern] FOREIGN KEY([Id_Lectern])
REFERENCES [dbo].[Lectern] ([Id_Lectern])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_To_Lectern]
GO
