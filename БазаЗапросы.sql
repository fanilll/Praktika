USE [2praktik]
GO
/****** Object:  UserDefinedFunction [dbo].[CountWithoutLetter]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[CountWithoutLetter](@letter nvarchar(1))
RETURNS int
AS
BEGIN
  DECLARE @count int
  SELECT @count = COUNT(*) FROM Country WHERE name NOT LIKE '%' + @letter + '%'
  RETURN @count 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Get3rdByPop]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Get3rdByPop]()
RETURNS nvarchar(50)
AS  
BEGIN
  DECLARE @name nvarchar(50)
  SELECT TOP 1 @name = name FROM 
    (SELECT name, RANK() OVER (ORDER BY Naselenie DESC) AS rnk FROM Country) sub
  WHERE rnk = 3

  RETURN @name
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetContinentsPop]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetContinentsPop]()
RETURNS @table TABLE (continent nvarchar(50), totalpop bigint)
AS
BEGIN
  INSERT INTO @table
  SELECT Continent, SUM(Naselenie) FROM Country
  GROUP BY Continent

  RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetContinentsPop1]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetContinentsPop1]()
RETURNS @table TABLE (continent nvarchar(50), totalpop bigint)
AS
BEGIN
  INSERT INTO @table
  SELECT Continent, SUM(Naselenie) FROM Country
  GROUP BY Continent

  RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetCountryByCapital1]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetCountryByCapital1] (@capital nvarchar(50))
RETURNS nvarchar(50)
AS
BEGIN
  DECLARE @name nvarchar(50)
  SELECT @name = name FROM Country WHERE capital = @capital
  RETURN @name
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetDensity]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetDensity](@continent nvarchar(50))
RETURNS float
AS
BEGIN
  DECLARE @density float  
  SELECT @density = SUM(Naselenie) / SUM(square) FROM Country WHERE Continent = @continent
  RETURN @density
END
GO
/****** Object:  UserDefinedFunction [dbo].[GetMaxPop]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetMaxPop](@continent nvarchar(50) = 'Азия')
RETURNS nvarchar(50)
AS
BEGIN
  DECLARE @name nvarchar(50)
  SELECT TOP 1 @name = name FROM Country
  WHERE Continent = @continent
  ORDER BY Naselenie DESC
  
  RETURN @name 
END
GO
/****** Object:  UserDefinedFunction [dbo].[IsPalindrom]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsPalindrom] (@n AS INT)
RETURNS INT
AS
BEGIN
    DECLARE @temp AS INT
    SET @temp = @n
    DECLARE @rev AS INT
    SET @rev = 0
    DECLARE @dig AS INT
    DECLARE @result AS INT
    WHILE (@n > 0)
    BEGIN
        SET @dig = @n % 10
        SET @rev = @rev * 10 + @dig
        SET @n = @n / 10
    END
    IF (@temp = @rev)
        SET @result = 1
    ELSE
        SET @result = 0
    RETURN @result
END
GO
/****** Object:  UserDefinedFunction [dbo].[Quarter]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Quarter](@x float, @y float)
RETURNS int
AS  
BEGIN
  DECLARE @q int
  IF @x > 0 AND @y > 0 SET @q = 1
  IF @x < 0 AND @y > 0 SET @q = 2
  IF @x < 0 AND @y < 0 SET @q = 3
  IF @x > 0 AND @y < 0 SET @q = 4

  RETURN @q
END
GO
/****** Object:  UserDefinedFunction [dbo].[TestCapital]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TestCapital](@capital nvarchar(50))
RETURNS nvarchar(50)
AS
BEGIN
  DECLARE @new nvarchar(50) = LEFT(@capital, 2) + REPLICATE('тест', LEN(@capital) - 4) + RIGHT(@capital, 2)

  RETURN @new
END
GO
/****** Object:  Table [dbo].[Country]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Capital] [varchar](50) NULL,
	[Square] [int] NULL,
	[Naselenie] [int] NULL,
	[Continent] [varchar](50) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GetBySquare]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetBySquare](@maxsquare int)
RETURNS TABLE
AS
RETURN 
  SELECT name FROM Country
  WHERE square < @maxsquare
GO
/****** Object:  UserDefinedFunction [dbo].[GetByPop]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetByPop](@minpop bigint, @maxpop bigint)  
RETURNS TABLE
AS
RETURN
  SELECT name FROM Country
  WHERE Naselenie BETWEEN @minpop AND @maxpop
GO
/****** Object:  View [dbo].[AfricaBig]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AfricaBig] 
AS
SELECT * FROM Country
WHERE Continent = 'Африка' 
AND Naselenie > 10000000
AND square > 500000
GO
/****** Object:  Table [dbo].[Department]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Code] [varchar](2) NULL,
	[Name] [varchar](50) NULL,
	[FacultyAbbreviation] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[TabNumber] [int] NULL,
	[Code] [varchar](2) NULL,
	[LastName] [varchar](50) NULL,
	[Position] [varchar](50) NULL,
	[Salary] [varchar](20) NULL,
	[Boss] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[TabNumber] [int] NULL,
	[Title] [varchar](50) NULL,
	[Degree] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Date] [date] NULL,
	[Code] [int] NULL,
	[RegNumber] [int] NULL,
	[TabNumber] [int] NULL,
	[Auditorium] [varchar](10) NULL,
	[Grade] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TeachersInfo]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TeachersInfo] AS
SELECT
  e.LastName, 
  e.Position,
  l.Title,
  l.Degree,
  d.Name AS Department,
  COUNT(x.Code) AS ExamsCount
FROM Employee e
JOIN Lecturer l ON e.TabNumber = l.TabNumber
JOIN Department d ON e.Code = d.Code
LEFT JOIN Exam x ON x.TabNumber = e.TabNumber
WHERE e.Position LIKE '%преподаватель%'
GROUP BY 
  e.LastName, e.Position, l.Title, l.Degree, d.Name
GO
/****** Object:  Table [dbo].[Akademiki]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Akademiki](
	[id] [int] NOT NULL,
	[Name] [varchar](100) NULL,
	[DateOfBirthday] [date] NULL,
	[Specializasia] [varchar](50) NULL,
	[YearOfPrisvoienue] [int] NULL,
 CONSTRAINT [PK_Akademiki] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[Code] [int] NULL,
	[Volume] [int] NULL,
	[Name] [varchar](50) NULL,
	[Executor] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Engineer]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Engineer](
	[TabNumber] [int] NULL,
	[Specialty] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Abbreviation] [varchar](2) NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeadOfDepartment]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeadOfDepartment](
	[TabNumber] [int] NULL,
	[Experience] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Nomer] [varchar](50) NULL,
	[Code1] [int] NULL,
	[Code2] [int] NULL,
	[Code3] [int] NULL,
	[Code4] [int] NULL,
	[Code5] [int] NULL,
	[Code6] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialty](
	[Number] [int] NULL,
	[Direction] [varchar](100) NULL,
	[Code] [varchar](2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[RegNumber] [int] NULL,
	[Number] [int] NULL,
	[LastName] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Животные_Хуснутдинов]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Животные_Хуснутдинов](
	[ID] [int] NULL,
	[Вид] [varchar](50) NULL,
	[Отряд] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страны_Хуснутдинов]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны_Хуснутдинов](
	[ID] [int] NOT NULL,
	[Название] [varchar](50) NOT NULL,
	[Население] [int] NULL,
	[Площадь] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Управление_Хуснутдинов]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Управление_Хуснутдинов](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Вид] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ученики]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ученики](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Предмет] [varchar](50) NOT NULL,
	[Школа] [varchar](50) NOT NULL,
	[Баллы] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Цветы_Хуснутдинов]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Цветы_Хуснутдинов](
	[ID] [int] NULL,
	[Название] [varchar](50) NULL,
	[Класс] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (1, N'Аничков Николай Николаевич', CAST(N'1885-11-03' AS Date), N'медицина', 1939)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (2, N'Бартольд Василий Владимирович', CAST(N'1869-11-15' AS Date), N'историк', 1913)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (3, N'Белопольский Аристарх Аполлонович', CAST(N'1854-07-13' AS Date), N'астрофизик', 1903)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (4, N'Бородин Иван Парфеньевич', CAST(N'1847-01-30' AS Date), N'ботаник', 1902)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (5, N'Вальден Павел Иванович', CAST(N'1863-07-26' AS Date), N'химик-технолог', 1910)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (6, N'Вернадский Владимир Иванович', CAST(N'1863-03-12' AS Date), N'геохимик', 1908)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (7, N'Виноградов Павел Гаврилович', CAST(N'1854-11-30' AS Date), N'историк', 1914)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (8, N'Ипатьев Владимир Николаевич', CAST(N'1867-11-21' AS Date), N'химик', 1916)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (9, N'Истрин Василий Михайлович', CAST(N'1865-02-22' AS Date), N'филолог', 1907)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (10, N'Карпинский Александр Петрович', CAST(N'1847-01-07' AS Date), N'геолог', 1889)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (11, N'Коковцов Павел Константинович', CAST(N'1861-07-01' AS Date), N'историк', 1906)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (12, N'Курнаков Николай Семёнович', CAST(N'1860-12-06' AS Date), N'химик', 1913)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (13, N'Марр Николай Яковлевич', CAST(N'1865-01-06' AS Date), N'лингвист', 1912)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (14, N'Насонов Николай Викторович', CAST(N'1855-02-26' AS Date), N'зоолог', 1906)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (15, N'Ольденбург Сергей Фёдорович', CAST(N'1863-09-26' AS Date), N'историк', 1903)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (16, N'Павлов Иван Петрович', CAST(N'1849-09-26' AS Date), N'физиолог', 1907)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (17, N'Перетц Владимир Николаевич', CAST(N'1870-01-31' AS Date), N'филолог', 1914)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (18, N'Соболевский Алексей Иванович', CAST(N'1857-01-07' AS Date), N'лингвист', 1900)
INSERT [dbo].[Akademiki] ([id], [Name], [DateOfBirthday], [Specializasia], [YearOfPrisvoienue]) VALUES (19, N'Стеклов Владимир Андреевич', CAST(N'1864-01-09' AS Date), N'математик', 1912)
GO
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (1, N'Австрия', N'Вена', 83858, 8741753, N'Европа')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (2, N'Азербайджан', N'Баку', 86600, 9705600, N'Азия')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (3, N'Албания', N'Тирана', 28748, 2866026, N'Европа')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (4, N'Алжир', N'Алжир', 2381740, 39813722, N'Африка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (5, N'Ангола', N'Луанда', 1246700, 25831000, N'Африка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (6, N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (7, N'Афганистан', N'Кабул', 647500, 29822848, N'Азия')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (8, N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (9, N'Бахрейн', N'Манама', 701, 1397000, N'Азия')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (10, N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (11, N'Белоруссия', N'Минск', 207595, 9498400, N'Европа')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (12, N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (13, N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (14, N'Болгария', N'София', 110910, 7153784, N'Европа')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (15, N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (16, N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (17, N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (18, N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (19, N'Бутан', N'Тхимпху', 47000, 784000, N'Азия')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (20, N'Великобритания', N'Лондон', 244820, 65341183, N'Европа')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (21, N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (22, N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (23, N'Восточный Тимор', N'Дили', 14874, 1167242, N'Азия')
INSERT [dbo].[Country] ([id], [Name], [Capital], [Square], [Naselenie], [Continent]) VALUES (24, N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия')
GO
INSERT [dbo].[Department] ([Code], [Name], [FacultyAbbreviation]) VALUES (N'вм', N'Высшая математика', N'ен')
INSERT [dbo].[Department] ([Code], [Name], [FacultyAbbreviation]) VALUES (N'ис', N'Информационные системы', N'ит')
INSERT [dbo].[Department] ([Code], [Name], [FacultyAbbreviation]) VALUES (N'мм', N'Математическое моделирование', N'фм')
INSERT [dbo].[Department] ([Code], [Name], [FacultyAbbreviation]) VALUES (N'оф', N'Общая физика', N'ен')
INSERT [dbo].[Department] ([Code], [Name], [FacultyAbbreviation]) VALUES (N'пи', N'Прикладная информатика', N'ит')
INSERT [dbo].[Department] ([Code], [Name], [FacultyAbbreviation]) VALUES (N'эф', N'Экспериментальная физика', N'фм')
GO
INSERT [dbo].[Discipline] ([Code], [Volume], [Name], [Executor]) VALUES (101, 320, N'Математика', N'вм')
INSERT [dbo].[Discipline] ([Code], [Volume], [Name], [Executor]) VALUES (102, 160, N'Информатика', N'пи')
INSERT [dbo].[Discipline] ([Code], [Volume], [Name], [Executor]) VALUES (103, 160, N'Физика', N'оф')
INSERT [dbo].[Discipline] ([Code], [Volume], [Name], [Executor]) VALUES (202, 120, N'Базы данных', N'ис')
INSERT [dbo].[Discipline] ([Code], [Volume], [Name], [Executor]) VALUES (204, 160, N'Электроника', N'эф')
INSERT [dbo].[Discipline] ([Code], [Volume], [Name], [Executor]) VALUES (205, 80, N'Программирование', N'пи')
INSERT [dbo].[Discipline] ([Code], [Volume], [Name], [Executor]) VALUES (209, 80, N'Моделирование', N'мм')
GO
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (101, N'пи', N'Прохоров П.П.', N'зав. кафедрой', N'35 000,00 р.', 101)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (102, N'пи', N'Семенов С.С.', N'преподаватель', N'25 000,00 р.', 101)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (105, N'пи', N'Петров П.П.', N'преподаватель', N'25 000,00 р.', 101)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (153, N'пи', N'Сидорова С.С.', N'инженер', N'15 000,00 р.', 102)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (201, N'ис', N'Андреев А.А.', N'зав. кафедрой', N'35 000,00 р.', 201)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (202, N'ис', N'Борисов Б.Б.', N'преподаватель', N'25 000,00 р.', 201)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (241, N'ис', N'Глухов Г.Г.', N'инженер', N'20 000,00 р.', 201)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (242, N'ис', N'Чернов Ч.Ч.', N'инженер', N'15 000,00 р.', 202)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (301, N'мм', N'Басов Б.Б.', N'зав. кафедрой', N'35 000,00 р.', 301)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (302, N'мм', N'Сергеева С.С.', N'преподаватель', N'25 000,00 р.', 301)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (401, N'оф', N'Волков В.В.', N'зав. кафедрой', N'35 000,00 р.', 401)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (402, N'оф', N'Зайцев З.З.', N'преподаватель', N'25 000,00 р.', 401)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (403, N'оф', N'Смирнов С.С.', N'преподаватель', N'15 000,00 р.', 401)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (435, N'оф', N'Лисин Л.Л.', N'инженер', N'20 000,00 р.', 402)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (501, N'вм', N'Кузнецов К.К.', N'зав. кафедрой', N'35 000,00 р.', 501)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (502, N'вм', N'Романцев Р.Р.', N'преподаватель', N'25 000,00 р.', 501)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (503, N'вм', N'Соловьев С.С.', N'преподаватель', N'25 000,00 р.', 501)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (601, N'эф', N'Зверев З.З.', N'зав. кафедрой', N'35 000,00 р.', 601)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (602, N'эф', N'Сорокина С.С.', N'преподаватель', N'25 000,00 р.', 601)
INSERT [dbo].[Employee] ([TabNumber], [Code], [LastName], [Position], [Salary], [Boss]) VALUES (614, N'эф', N'Григорьев Г.Г.', N'инженер', N'20 000,00 р.', 602)
GO
INSERT [dbo].[Engineer] ([TabNumber], [Specialty]) VALUES (153, N'электроник')
INSERT [dbo].[Engineer] ([TabNumber], [Specialty]) VALUES (241, N'электроник')
INSERT [dbo].[Engineer] ([TabNumber], [Specialty]) VALUES (242, N'программист')
INSERT [dbo].[Engineer] ([TabNumber], [Specialty]) VALUES (435, N'электроник')
INSERT [dbo].[Engineer] ([TabNumber], [Specialty]) VALUES (614, N'программист')
GO
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4)
INSERT [dbo].[Exam] ([Date], [Code], [RegNumber], [TabNumber], [Auditorium], [Grade]) VALUES (CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5)
GO
INSERT [dbo].[Faculty] ([Abbreviation], [Name]) VALUES (N'Ен', N'Естественные науки')
INSERT [dbo].[Faculty] ([Abbreviation], [Name]) VALUES (N'Гн', N'Гуманитарные науки')
INSERT [dbo].[Faculty] ([Abbreviation], [Name]) VALUES (N'Ит', N'Информационные технологии')
INSERT [dbo].[Faculty] ([Abbreviation], [Name]) VALUES (N'Фм', N'Физико-математический')
GO
INSERT [dbo].[HeadOfDepartment] ([TabNumber], [Experience]) VALUES (101, 15)
INSERT [dbo].[HeadOfDepartment] ([TabNumber], [Experience]) VALUES (201, 18)
INSERT [dbo].[HeadOfDepartment] ([TabNumber], [Experience]) VALUES (301, 20)
INSERT [dbo].[HeadOfDepartment] ([TabNumber], [Experience]) VALUES (401, 10)
INSERT [dbo].[HeadOfDepartment] ([TabNumber], [Experience]) VALUES (501, 18)
INSERT [dbo].[HeadOfDepartment] ([TabNumber], [Experience]) VALUES (601, 8)
GO
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (101, N'профессор', N'д. т.н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (102, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (105, N'доцент', N'к. т.н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (201, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (202, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (301, N'профессор', N'д. т.н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (302, N'доцент', N'к. т.н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (401, N'профессор', N'д. т.н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (402, N'доцент', N'к. т.н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (403, N'ассистент', N'-')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (501, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (502, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (503, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Lecturer] ([TabNumber], [Title], [Degree]) VALUES (601, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[Request] ([Nomer], [Code1], [Code2], [Code3], [Code4], [Code5], [Code6]) VALUES (N'01.03.04', 101, 205, 209, NULL, NULL, NULL)
INSERT [dbo].[Request] ([Nomer], [Code1], [Code2], [Code3], [Code4], [Code5], [Code6]) VALUES (N'09.03.02', 101, 102, 103, 202, 205, 209)
INSERT [dbo].[Request] ([Nomer], [Code1], [Code2], [Code3], [Code4], [Code5], [Code6]) VALUES (N'09.03.03', 101, 102, 103, 202, 205, NULL)
INSERT [dbo].[Request] ([Nomer], [Code1], [Code2], [Code3], [Code4], [Code5], [Code6]) VALUES (N'14.03.02', 101, 102, 103, 204, NULL, NULL)
INSERT [dbo].[Request] ([Nomer], [Code1], [Code2], [Code3], [Code4], [Code5], [Code6]) VALUES (N'38.03.05', 101, 103, 202, 209, NULL, NULL)
GO
INSERT [dbo].[Specialty] ([Number], [Direction], [Code]) VALUES (1, N'Прикладная математика', N'мм')
INSERT [dbo].[Specialty] ([Number], [Direction], [Code]) VALUES (2, N'Информационные системы и технологии', N'ис')
INSERT [dbo].[Specialty] ([Number], [Direction], [Code]) VALUES (3, N'Прикладная информатика', N'пи')
INSERT [dbo].[Specialty] ([Number], [Direction], [Code]) VALUES (4, N'Ядерные физика и технологии', N'эф')
INSERT [dbo].[Specialty] ([Number], [Direction], [Code]) VALUES (5, N'Бизнес-информатика', N'ис')
GO
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (10101, 9, N'Николаева Н. Н.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (10102, 9, N'Иванов И. И.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (10103, 9, N'Крюков К. К.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (20101, 2, N'Андреев А. А.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (20102, 2, N'Федоров Ф. Ф.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (30101, 4, N'Бондаренко Б. Б.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (30102, 4, N'Цветков К. К.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (30103, 4, N'Петров П. П.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (50101, 1, N'Сергеев С. С.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (50102, 1, N'Кудрявцев К. К.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (80101, 5, N'Макаров М. М.')
INSERT [dbo].[Student] ([RegNumber], [Number], [LastName]) VALUES (80102, 5, N'Яковлев Я. Я.')
GO
SET IDENTITY_INSERT [dbo].[Ученики] ON 

INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (1, N'Иванова', N'Математика', N'Лицей', 98.5)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (2, N'Петров', N'Физика', N'Лицей', 99)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (3, N'Сидоров', N'Математика', N'Лицей', 88)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (4, N'Полухина', N'Физика', N'Гимназия', 78)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (5, N'Матвеева', N'Химия', N'Лицей', 92)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (6, N'Касимов', N'Химия', N'Гимназия', 68)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (7, N'Нурулин', N'Математика', N'Гимназия', 81)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (8, N'Авдеев', N'Физика', N'Лицей', 87)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (9, N'Никитина', N'Химия', N'Лицей', 94)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (10, N'Барышева', N'Химия', N'Лицей', 88)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (12, N'Смирнова', N'Физика', N'Лицей', 92)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (13, N'Кузнецов', N'Химия', N'Гимназия', 85)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (14, N'Лазарева', N'Математика', N'Школа No18', 79)
SET IDENTITY_INSERT [dbo].[Ученики] OFF
GO
/****** Object:  Index [UQ__Животные__3214EC267BF549BA]    Script Date: 24.11.2023 13:54:42 ******/
ALTER TABLE [dbo].[Животные_Хуснутдинов] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Цветы_Ху__3214EC26AEB8AAEB]    Script Date: 24.11.2023 13:54:42 ******/
ALTER TABLE [dbo].[Цветы_Хуснутдинов] ADD UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Животные_Хуснутдинов] ADD  DEFAULT ('Хищные') FOR [Отряд]
GO
ALTER TABLE [dbo].[Управление_Хуснутдинов] ADD  DEFAULT ('Парламентская республика') FOR [Вид]
GO
ALTER TABLE [dbo].[Цветы_Хуснутдинов] ADD  DEFAULT ('Двудольные') FOR [Класс]
GO
ALTER TABLE [dbo].[Страны_Хуснутдинов]  WITH CHECK ADD CHECK  (([Население]>(0)))
GO
ALTER TABLE [dbo].[Ученики]  WITH CHECK ADD CHECK  (([Баллы]>=(0) AND [Баллы]<=(100)))
GO
/****** Object:  StoredProcedure [dbo].[SelectByLastLetter]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectByLastLetter]
@FirstLetter char(1),
@LastLetter char(1)  
AS
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT * FROM Country WHERE Name LIKE ''%[' + @FirstLetter + '-' + @LastLetter + ']'''
  EXEC sp_executesql @sql
END
GO
/****** Object:  StoredProcedure [dbo].[SelectColumns]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectColumns] 
@Columns varchar(max),
@TableName varchar(100)
AS
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT ' + @Columns + ' FROM ' + @TableName
  EXEC sp_executesql @sql
END
GO
/****** Object:  StoredProcedure [dbo].[SelectTopRows]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTopRows] 
@N int,
@TableName varchar(100)
AS
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT TOP '+ CAST(@N AS varchar(10)) +' * FROM ' + @TableName
  EXEC sp_executesql @sql
END
GO
/****** Object:  StoredProcedure [dbo].[SelectWithCondition]    Script Date: 24.11.2023 13:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectWithCondition]  
@Columns varchar(max),
@TableName varchar(100),  
@ColumnToCheck varchar(100),
@ComparisonOp char(2),
@ValueToCheck varchar(100)
AS
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT ' + @Columns + ' FROM ' + @TableName + ' WHERE ' + @ColumnToCheck + ' ' + @ComparisonOp + ' ''' + @ValueToCheck + ''''
  EXEC sp_executesql @sql
END
GO
