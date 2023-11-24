--2 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Вывести ФИО, специализацию и дату рождения всех академиков.
SELECT a.Name, a.Specializasia, a.DateOfBirthday from Akademiki a
--2.	Создать вычисляемое поле «О присвоении звания», которое содержит информацию об академиках в виде: «Петров Петр Петрович получил звание в 1974».
SELECT CONCAT(a.Name, ' получил звание в ', a.YearOfPrisvoienue) AS 'О присвоении звания' 
FROM Akademiki a
--3.	Вывести ФИО академиков и вычисляемое поле «Через 5 лет после присвоения звания».
SELECT CONCAT('Через 5 лет после присвоения звания: ', a.YearOfPrisvoienue + 5) AS 'Через 5 лет после присвоения звания'
FROM Akademiki a
--4.	Вывести список годов присвоения званий, убрав дубликаты.
SELECT DISTINCT YearOfPrisvoienue FROM Akademiki
--5.	Вывести список академиков, отсортированный по убыванию даты рождения.
 SELECT * FROM Akademiki ORDER BY DateOfBirthday DESC
--6.	Вывести список академиков, отсортированный в обратном алфавитном порядке специализаций, по убыванию года присвоения звания, и в алфавитном порядке ФИО.
SELECT * FROM Akademiki
ORDER BY Specializasia DESC, YearOfPrisvoienue DESC, Name
--7.	Вывести первую строку из списка академиков, отсортированного в обратном ал-фавитном порядке ФИО.
SELECT top 1 * FROM Akademiki
ORDER BY Name DESC
--8.	Вывести фамилию академика, который раньше всех получил звание.
SELECT top 1 Name FROM Akademiki
ORDER BY YearOfPrisvoienue
--9.	Вывести первые 10% строк из списка академиков, отсортированного в алфавитном порядке ФИО.
SELECT TOP 10 Percent * FROM Akademiki
ORDER BY Name
--10.	Вывести из таблицы «Академики», отсортированной по возрастанию года присво-ения звания, список академиков, у которых год присвоения звания – один из первых пяти в отсортированной таблице.
SELECT TOP 5 * FROM Akademiki
ORDER BY YearOfPrisvoienue
--11.	Вывести, начиная с десятого, список академиков, отсортированный по возраста-нию даты рождения.
SELECT * FROM Akademiki
ORDER BY DateOfBirthday
OFFSET 9 ROWS
--12.	Вывести девятую и десятую строку из списка академиков, отсортированного в ал-фавитном порядке ФИО.
SELECT * FROM Akademiki
ORDER BY Name
OFFSET 8 ROWS FETCH NEXT 2 ROWS ONLY


--3 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Вывести названия и столицы пяти наибольших стран по площади.
SELECT TOP 5 Name, Capital FROM Country ORDER BY Square DESC
--2.	Вывести список африканских стран, население которых не превышает 1 млн. чел.
SELECT Name FROM Country WHERE Continent = 'Africa' AND Naselenie < 1000000
--3.	Вывести список стран, население которых больше 5 млн. чел., а площадь меньше
--100	тыс. кв. км, и они расположены не в Европе.
SELECT Name FROM Country WHERE Naselenie > 5000000 AND Square < 100000 AND Continent <> 'Europe'
--4.	Вывести список стран Северной и Южной Америки, население которых больше
--20	млн. чел., или стран Африки, у которых население больше 30 млн. чел.
SELECT Name FROM Country WHERE (Continent = 'North America' OR Continent = 'South America') 
AND Naselenie > 20000000 OR (Continent = 'Africa' AND Naselenie > 30000000)

--5.	Вывести список стран, население которых составляет от 10 до 100 млн. чел., а пло-щадь не больше 500 тыс. кв. км.
SELECT Name FROM Country WHERE Naselenie BETWEEN 10000000 AND 100000000 AND Square <= 500000
--6.	Вывести список стран, названия которых не начинаются с буквы «К».
SELECT Name FROM Country WHERE Name NOT LIKE 'K%'
--7.	Вывести список стран, в названии которых третья буква – «а», а предпоследняя - «и».
SELECT Name FROM Country WHERE SUBSTRING(Name, 3, 1) = 'а' AND SUBSTRING(Name, -2, 1) = 'и'
--8.	Вывести список стран, в названии которых вторая буква – гласная.
SELECT Name FROM Country WHERE SUBSTRING(Name, 2, 1) IN ('а','у','о','и','э','ы','я','ю','ё','е')
--9.	Вывести список стран, названия которых начинаются с букв от «К» до «П».
SELECT Name FROM Country WHERE Name BETWEEN 'К' AND 'П'
--10.	Вывести список стран, названия которых начинаются с букв от «А» до «Г», но не с буквы «Б».
SELECT Name FROM Country WHERE (Name BETWEEN 'А' AND 'Г') AND (Name <> 'Б%')
--11.	Вывести список стран, столицы которых есть в базе.
SELECT Name FROM Country WHERE Capital IN (SELECT DISTINCT Capital FROM Country)
--12.	Вывести список стран Африки, Северной и Южной Америки.
SELECT Name FROM Country WHERE Continent IN ('Африка', 'Северная Америка', 'Южная Америка')


--4 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Вывести список академиков, отсортированный по количеству символов в ФИО.
SELECT * FROM Akademiki ORDER BY LEN(Name)
--2.	Вывести список академиков, убрать лишние пробелы в ФИО.
SELECT TRIM(Name) FROM Akademiki
--3.	Найти позиции «ов» в ФИО каждого академика. Вывести ФИО и номер позиции.
SELECT Name, CHARINDEX('ов', Name) FROM Akademiki
--4.	Вывести ФИО и последние две буквы специализации для каждого академика.
SELECT Name, RIGHT(Specializasia, 2) FROM Akademiki
--5.	Вывести список академиков, ФИО в формате Фамилия и Инициалы.
SELECT NAME + ' ' + LEFT(Name, 1) + '.' FROM Akademiki
--6.	Вывести список специализаций в правильном и обратном виде. Убрать дубликаты.
SELECT DISTINCT Specializasia FROM Akademiki
SELECT DISTINCT REVERSE(Specializasia) FROM Akademiki
--7.	Вывести свою фамилию в одной строке столько раз, сколько вам лет.
declare @MyLastName varchar(50)
set @MyLastName = 'Фаниль '
declare @MyAge int
set @MyAge = 18
SELECT REPLICATE(@MyLastName,@MyAge)
--8.	Вывести абсолютное значение функций2 (2) −   (3  2) с точностью два знака после десятичной запятой.
SELECT ROUND(SQRT(22) - SQRT(33*3), 2)
--9.	Вывести количество дней до конца семестра.
SELECT DATEDIFF(DAY, GETDATE(), '2023-12-28')
--10.	Вывести количество месяцев от вашего рождения.
declare @MyBirthday date
set @MyBirthday = '2005-05-14'
SELECT DATEDIFF(MONTH, @MyBirthday, GETDATE())
--11.	Вывести ФИО и високосность года рождения каждого академика.
SELECT Name, CASE WHEN DATEPART(YEAR, DateOfBirthday) % 4 = 0 THEN 'Високосный' ELSE 'Не високосный' END FROM Akademiki
--12.	Вывести список специализаций без повторений. Для каждой специализации выве-сти «длинный» или «короткий», в зависимости от количества символов.
SELECT DISTINCT Specializasia, CASE WHEN LEN(Specializasia) > 8 THEN 'длинный' ELSE 'короткий' END FROM Akademiki

--5 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Вывести минимальную площадь стран.
 SELECT MIN(Square) FROM Country
--2.	Вывести наибольшую по населению страну в Северной и Южной Америке.
SELECT top 1 Name FROM Country WHERE Continent IN ('Северная Америка', 'Южная Америка') ORDER BY Naselenie DESC 
--3.	Вывести среднее население стран. Результат округлить до одного знака.
SELECT ROUND(AVG(Naselenie), 1) FROM Country
--4.	Вывести количество стран, у которых название заканчивается на «ан», кроме стран, у которых название заканчивается на «стан».
SELECT COUNT(*) FROM Country WHERE Name LIKE '%ан' AND Name NOT LIKE '%стан'
--5.	Вывести количество континентов, где есть страны, название которых начинается с буквы «Р».
SELECT COUNT(DISTINCT Continent) FROM Country WHERE Name LIKE 'Р%'
--6.	Сколько раз страна с наибольшей площадью больше, чем страна с наименьшей площадью?
SELECT (SELECT MAX(Square) FROM Country) / (SELECT MIN(Square) FROM Country)
--7.	Вывести количество стран с населением больше, чем 100 млн. чел. на каждом кон-тиненте. Результат отсортировать по количеству стран по возрастанию.
SELECT Continent, COUNT(*) AS cnt FROM Country WHERE Naselenie > 100000000 GROUP BY Continent ORDER BY cnt
--8.	Вывести количество стран по количеству букв в названии. Результат отсортировать по убыванию.
SELECT LEN(Name), COUNT(Name) FROM Country GROUP BY LEN(Name) ORDER BY COUNT(Name) DESC
--9.	Ожидается, что через 20 лет население мира вырастет на 10%. Вывести список континентов с прогнозируемым населением:
SELECT Continent, SUM(Naselenie)*1.1 AS forecast FROM Country GROUP BY Continent
--10.	Вывести список континентов, где разница по площади между наибольшими и наименьшими странами не более в 10000 раз:
SELECT Continent FROM Country GROUP BY Continent HAVING MAX(Square)/MIN(Square) <= 10000
--11.	Вывести среднюю длину названий Африканских стран.
SELECT AVG(LEN(Name)) FROM Country WHERE Continent = 'Африка'
--12.	Вывести список континентов, у которых средняя плотность среди стран с населе-нием более 1 млн. чел. больше, чем 30 чел. на кв. км.
SELECT Continent FROM Country WHERE Naselenie > 1000000 GROUP BY Continent HAVING AVG(Naselenie/Square) > 30

--6 ПРАКТИЧЕСКАЯ РАБОТА

CREATE TABLE Faculty (
  Abbreviation varchar(2),
  Name varchar(50)
);

INSERT INTO Faculty (Abbreviation, Name) VALUES
  ('Ен', 'Естественные науки'),
  ('Гн', 'Гуманитарные науки'),
  ('Ит', 'Информационные технологии'),
  ('Фм', 'Физико-математический');
  
CREATE TABLE Department (
  Code varchar(2),
  Name varchar(50),
  FacultyAbbreviation varchar(2)
);  

INSERT INTO Department (Code, Name, FacultyAbbreviation) VALUES
  ('вм', 'Высшая математика', 'ен'),
  ('ис', 'Информационные системы', 'ит'),
  ('мм', 'Математическое моделирование', 'фм'),
  ('оф', 'Общая физика', 'ен'),
  ('пи', 'Прикладная информатика', 'ит'),
  ('эф', 'Экспериментальная физика', 'фм');
  
CREATE TABLE Employee (
  TabNumber int, 
  Code varchar(2),
  LastName varchar(50),
  Position varchar(50),
  Salary varchar(20),
  Boss int
);

INSERT INTO Employee (TabNumber, Code, LastName, Position, Salary, Boss) VALUES
  (101, 'пи', 'Прохоров П.П.', 'зав. кафедрой', '35 000,00 р.', 101),
  (102, 'пи', 'Семенов С.С.', 'преподаватель', '25 000,00 р.', 101),
  (105, 'пи', 'Петров П.П.', 'преподаватель', '25 000,00 р.', 101),
  (153, 'пи', 'Сидорова С.С.', 'инженер', '15 000,00 р.', 102),
  (201, 'ис', 'Андреев А.А.', 'зав. кафедрой', '35 000,00 р.', 201),
  (202, 'ис', 'Борисов Б.Б.', 'преподаватель', '25 000,00 р.', 201),
  (241, 'ис', 'Глухов Г.Г.', 'инженер', '20 000,00 р.', 201),
  (242, 'ис', 'Чернов Ч.Ч.', 'инженер', '15 000,00 р.', 202),
  (301, 'мм', 'Басов Б.Б.', 'зав. кафедрой', '35 000,00 р.', 301),
  (302, 'мм', 'Сергеева С.С.', 'преподаватель', '25 000,00 р.', 301),
  (401, 'оф', 'Волков В.В.', 'зав. кафедрой', '35 000,00 р.', 401),
  (402, 'оф', 'Зайцев З.З.', 'преподаватель', '25 000,00 р.', 401),
  (403, 'оф', 'Смирнов С.С.', 'преподаватель', '15 000,00 р.', 401),
  (435, 'оф', 'Лисин Л.Л.', 'инженер', '20 000,00 р.', 402),
  (501, 'вм', 'Кузнецов К.К.', 'зав. кафедрой', '35 000,00 р.', 501),
  (502, 'вм', 'Романцев Р.Р.', 'преподаватель', '25 000,00 р.', 501), 
  (503, 'вм', 'Соловьев С.С.', 'преподаватель', '25 000,00 р.', 501),
  (601, 'эф', 'Зверев З.З.', 'зав. кафедрой', '35 000,00 р.', 601),
  (602, 'эф', 'Сорокина С.С.', 'преподаватель', '25 000,00 р.', 601),
  (614, 'эф', 'Григорьев Г.Г.', 'инженер', '20 000,00 р.', 602);
  
CREATE TABLE Specialty (
  Number int,
  Direction varchar(100),
  Code varchar(2)
);

INSERT INTO Specialty (Number, Direction, Code) VALUES
  (1, 'Прикладная математика', 'мм'),
  (2, 'Информационные системы и технологии', 'ис'),
  (3, 'Прикладная информатика', 'пи'),
  (4, 'Ядерные физика и технологии', 'эф'),
  (5, 'Бизнес-информатика', 'ис');
  
CREATE TABLE Discipline (
  Code int,
  Volume int,
  Name varchar(50),
  Executor varchar(2)
);

INSERT INTO Discipline (Code, Volume, Name, Executor) VALUES
  (101, 320, 'Математика', 'вм'),
  (102, 160, 'Информатика', 'пи'),
  (103, 160, 'Физика', 'оф'),
  (202, 120, 'Базы данных', 'ис'),
  (204, 160, 'Электроника', 'эф'),
  (205, 80, 'Программирование', 'пи'),
  (209, 80, 'Моделирование', 'мм');
  
CREATE TABLE Request (
  Nomer varchar(50),
  Code1 int,
  Code2 int,
  Code3 int,
  Code4 int,
  Code5 int,
  Code6 int
);

INSERT INTO Request (Nomer, Code1, Code2, Code3, Code4, Code5, Code6) VALUES
  ('01.03.04' ,101, 205, 209, null, null, null),
  ('09.03.02', 101, 102, 103, 202, 205, 209),
  ('09.03.03', 101, 102, 103, 202, 205, null),
  ('14.03.02', 101, 102, 103, 204, null, null),
  ('38.03.05' , 101, 103, 202, 209, null, null);
  
CREATE TABLE HeadOfDepartment (
  TabNumber int,
  Experience int 
);

INSERT INTO HeadOfDepartment (TabNumber, Experience) VALUES
  (101, 15),
  (201, 18),
  (301, 20),
  (401, 10),
  (501, 18),
  (601, 8);
  
CREATE TABLE Engineer (
  TabNumber int,
  Specialty varchar(50)
);

INSERT INTO Engineer (TabNumber, Specialty) VALUES
  (153, 'электроник'),
  (241, 'электроник'),
  (242, 'программист'),
  (435, 'электроник'),
  (614, 'программист');
  
CREATE TABLE Lecturer (
  TabNumber int,
  Title varchar(50),
  Degree varchar(20)
);

INSERT INTO Lecturer (TabNumber, Title, Degree) VALUES
  (101, 'профессор', 'д. т.н.'),
  (102, 'доцент', 'к. ф.-м. н.'),
  (105, 'доцент', 'к. т.н.'),
  (201, 'профессор', 'д. ф.-м. н.'),
  (202, 'доцент', 'к. ф.-м. н.'),
  (301, 'профессор', 'д. т.н.'),
  (302, 'доцент', 'к. т.н.'),
  (401, 'профессор', 'д. т.н.'),
  (402, 'доцент', 'к. т.н.'),
  (403, 'ассистент', '-'),
  (501, 'профессор', 'д. ф.-м. н.'),
  (502, 'профессор', 'д. ф.-м. н.'),
  (503, 'доцент', 'к. ф.-м. н.'),
  (601, 'профессор', 'д. ф.-м. н.');

CREATE TABLE Student (
  RegNumber int,
  Number int, 
  LastName varchar(50)
);

INSERT INTO Student (RegNumber, Number, LastName) VALUES
  (10101, 9, 'Николаева Н. Н.'),
  (10102, 9, 'Иванов И. И.'),
  (10103, 9, 'Крюков К. К.'),
  (20101, 2, 'Андреев А. А.'),
  (20102, 2, 'Федоров Ф. Ф.'),
  (30101, 4, 'Бондаренко Б. Б.'),
  (30102, 4, 'Цветков К. К.'),
  (30103, 4, 'Петров П. П.'),
  (50101, 1, 'Сергеев С. С.'),
  (50102, 1, 'Кудрявцев К. К.'),
  (80101, 5, 'Макаров М. М.'),
  (80102, 5, 'Яковлев Я. Я.');
  
CREATE TABLE Exam (
  Date date,
  Code int,
  RegNumber int,
  TabNumber int,
  Auditorium varchar(10),
  Grade int
);

INSERT INTO Exam (Date, Code, RegNumber, TabNumber, Auditorium, Grade) VALUES
  ('2015-06-05', 102, 10101, 102, 'т505', 4),
  ('2015-06-05', 102, 10102, 102, 'т505', 4),
  ('2015-06-05', 202, 20101, 202, 'т506', 4),
  ('2015-06-05', 202, 20102, 202, 'т506', 3),
  ('2015-06-07', 102, 30101, 105, 'ф419', 3),
  ('2015-06-07', 102, 30102, 101, 'т506', 4),
  ('2015-06-07', 102, 80101, 102, 'м425', 5),
  ('2015-06-09', 205, 80102, 402, 'м424', 4),
  ('2015-06-09', 209, 20101, 302, 'ф333', 3),
  ('2015-06-10', 101, 10101, 501, 'т506', 4),
  ('2015-06-10', 101, 10102, 501, 'т506', 4),
  ('2015-06-10', 204, 30102, 601, 'ф349', 5),
  ('2015-06-10', 209, 80101, 301, 'э105', 5),
  ('2015-06-10', 209, 80102, 301, 'э105', 4),
  ('2015-06-12', 101, 80101, 502, 'с324', 4),
  ('2015-06-15', 101, 30101, 503, 'ф417', 4),
  ('2015-06-15', 101, 50101, 501, 'ф201', 5),
  ('2015-06-15', 101, 50102, 501, 'ф201', 3), 
  ('2015-06-15', 103, 10101, 403, 'ф414', 4),
  ('2015-06-17', 102, 10101, 102, 'т505', 5);


--  1.	Вывести из таблиц «Кафедра», «Специальность» и «Студент» данные о студентах, которые обучаются на данном факультете (например, «ит»).
SELECT s.LastName, k.Name, k.FacultyAbbreviation  
FROM Student s
JOIN Specialty sp ON s.Number = sp.Number
JOIN Department k ON sp.Code = k.Code
WHERE k.FacultyAbbreviation = 'ит'
--2.	Вывести из таблиц «Кафедра», «Специальность» и «Сотрудник» данные о выпус-кающих кафедрах (факультет, шифр, название, фамилию заведующего). Выпускающей счита-ется та кафедра, на которую есть ссылки в таблице «Специальность».
SELECT k.FacultyAbbreviation, k.Code, k.Name, e.LastName
FROM Department k 
JOIN Employee e ON k.Code = e.Code AND e.Position = 'зав. кафедрой'
JOIN Specialty s ON k.Code = s.Code
--3.	Вывести в запросе для каждого сотрудника номер и фамилию его непосредствен-ного руководителя. Для заведующих кафедрами поле руководителя оставить пустым.
SELECT e1.TabNumber, e1.LastName, e2.LastName as BossName
FROM Employee e1 LEFT JOIN Employee e2 
ON e1.Boss = e2.TabNumber
--4.	Вывести список студентов, сдавших минимум два экзамена.
SELECT s.*  
FROM Student s
JOIN Exam e ON s.RegNumber = e.RegNumber
GROUP BY s.RegNumber
HAVING COUNT(e.RegNumber) >= 2
--5.	Вывести список инженеров с зарплатой, меньшей 20000 руб.
SELECT * FROM Employee  
WHERE Position = 'инженер' AND Salary < '20000 р.'
--6.	Вывести список студентов, сдавших экзамены в заданной аудитории.
SELECT s.*
FROM Student s JOIN Exam e
ON s.RegNumber = e.RegNumber
WHERE e.Auditorium = 'ф201'
--7.	Вывести из таблиц «Студент» и «Экзамен» учетные номера и фамилии студентов, а также количество сданных экзаменов и средний балл для каждого студента только для тех студентов, у которых средний балл не меньше заданного (например, 4).
SELECT s.RegNumber, s.LastName, COUNT(e.RegNumber) as ExamCount, AVG(e.Grade) as AvgGrade
FROM Student s LEFT JOIN Exam e
ON s.RegNumber = e.RegNumber
GROUP BY s.RegNumber, s.LastName
HAVING AVG(e.Grade) >= 4
--8.	Вывести список заведующих кафедрами и их зарплаты, и степень.
SELECT e.TabNumber, e.LastName, e.Salary, l.Degree
FROM Employee e JOIN Lecturer l
ON e.TabNumber = l.TabNumber
WHERE e.Position = 'зав. кафедрой'
--9.	Вывести список профессоров.
SELECT * FROM Lecturer WHERE Title = 'профессор'
--10.	Вывести название дисциплины, фамилию, должность и степень преподавателя, дату и место проведения экзаменов в хронологическом порядке в заданном интервале даты.
SELECT d.Name, e1.LastName, e1.Position, l.Degree, e.Date, e.Auditorium
FROM Exam e
JOIN Discipline d ON e.Code = d.Code 
JOIN Employee e1 ON e.TabNumber = e.TabNumber
JOIN Lecturer l ON l.TabNumber = e.TabNumber
WHERE e.Date BETWEEN '2015-06-10' AND '2015-06-15'
ORDER BY e.Date
--11.	Вывести фамилию преподавателей, принявших более трех экзаменов.
SELECT e.TabNumber  
FROM Exam e
GROUP BY e.TabNumber
HAVING COUNT(e.RegNumber) > 3
--12.	Вывести список студентов, не сдавших ни одного экзамена в указанной дате.
SELECT s.*
FROM Student s
WHERE s.RegNumber NOT IN (
  SELECT RegNumber 
  FROM Exam
  WHERE Date = '2015-06-15'
)

--7 практическая работа
--1.	Вывести объединенный результат выполнения запросов, которые выбирают страны с площадью меньше 500 кв. км и с площадью больше 5 млн. кв. км:
SELECT * FROM Country WHERE square < 500 OR square > 5000000
--2.	Вывести список стран с площадью больше 1 млн. кв. км, исключить страны с насе-лением меньше 100 млн. чел.:
SELECT * FROM Country WHERE square > 1000000 AND Naselenie > 100000000
--3.	Вывести список стран с площадью меньше 500 кв. км и с населением меньше 100	тыс. чел.
SELECT * FROM Country WHERE square < 500 AND Naselenie < 100000


--8 практическая работа

--1.	Вывести список стран и процентное соотношение площади каждой из них к общей площади всех стран мира.
SELECT Name ,Capital ,Square ,Naselenie ,Continent ,ROUND(CAST(Naselenie AS FLOAT) * 100 / (SELECT
SUM(Naselenie) FROM Country), 3) AS Процент
FROM Country
ORDER BY
Процент DESC

--2.	Вывести список стран мира, плотность населения которых больше, чем средняя плотность населения всех стран мира.
SELECT name FROM Country WHERE Naselenie/square > (SELECT AVG(Naselenie/square) FROM Country)
--3.	С помощью подзапроса вывести список европейских стран, население которых меньше 5 млн. чел.
SELECT name FROM Country WHERE Continent = 'Европа' AND Naselenie < 5000000
--4.	Вывести список стран и процентное соотношение их площади к суммарной пло-щади той части мира, где они находятся.
SELECT Name ,Capital ,Square ,Naselenie ,Continent ,ROUND(CAST(Naselenie AS FLOAT) * 100 / 
(SELECT SUM(Naselenie) FROM Country c1
where c1.Continent = c2.Continent), 3) AS Процент
FROM Country c2
ORDER BY
Процент DESC
--5.	Вывести список стран мира, площадь которых больше, чем средняя площадь стран той части света, где они находятся.
SELECT name FROM Country c1 WHERE square > (SELECT AVG(square) FROM Country c2 WHERE c1.Continent = c2.Continent)
--6.	Вывести список стран мира, которые находятся в тех частях света, средняя плот-ность населения которых превышает общемировую.
 SELECT name FROM Country WHERE Continent IN 
 (SELECT Continent FROM Country 
 GROUP BY Continent 
 HAVING AVG(Naselenie/square) > 
 (SELECT AVG(Naselenie/square) FROM Country))
--7.	Вывести список южноамериканских стран, в которых живет больше людей, чем в любой африканской стране.
SELECT name FROM Country WHERE Continent = 'Южная Америка' AND Naselenie > 
(SELECT MAX(Naselenie) FROM Country WHERE Continent = 'Африка')
--8.	Вывести список африканских стран, в которых живет больше людей, чем хотя бы в	одной южноамериканской стране.
SELECT name FROM Country WHERE Continent = 'Африка' AND Naselenie > ANY (SELECT Naselenie FROM Country WHERE Continent = 'Южная Америка')

--9.	Если в Африке есть хотя бы одна страна, площадь которой больше 2 млн. кв. км, вывести список всех африканских стран.
IF EXISTS (SELECT * FROM Country WHERE Continent = 'Африка' AND square > 2000000) SELECT name FROM Country WHERE Continent = 'Африка'
--10.	Вывести список стран той части света, где находится страна «Фиджи».
SELECT name FROM Country WHERE Continent = (SELECT Continent FROM Country WHERE name = 'Фиджи')
--11.	Вывести список стран, население которых не превышает население страны «Фиджи».
SELECT name FROM Country WHERE Naselenie <= (SELECT Naselenie FROM Country WHERE name = 'Фиджи')
--12.	Вывести название страны с наибольшим населением среди стран с наименьшей площадью на каждом континенте.
SELECT name FROM Country c1 WHERE square = 
(SELECT MIN(square) FROM Country c2 WHERE c1.Continent = c2.Continent) 
AND Naselenie = (SELECT MAX(Naselenie) FROM Country c2 
WHERE c1.Continent = c2.Continent AND square = 
(SELECT MIN(square) FROM Country c3 WHERE c2.Continent = c3.Continent))

--9 практическая работа

--1.	Создать таблицу «Управление_ВашаФамилия». Определить основной ключ, иден-тификатор, значение по умолчанию
CREATE TABLE Управление_Исламгулова
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    Вид VARCHAR(50) DEFAULT 'Парламентская республика'
);
--2.	Создать таблицу «Страны_ВашаФамилия». Определить основной ключ, разреше-ние / запрет на NULL, условие на вводимое значение.
CREATE TABLE Страны_Исламгулова
(
    ID INT PRIMARY KEY, 
    Название VARCHAR(50) NOT NULL,
    Население INT CHECK (Население > 0),
    Площадь DECIMAL(10, 2) 
);
--3.	Создать таблицу «Цветы_ВашаФамилия». Определить основной ключ, 
--значения столбца «ID» сделать уникальными, для столбца «Класс» установить значение по умолчанию «Двудольные».
CREATE TABLE Цветы_Исламгулова
(
    ID INT UNIQUE,
    Название VARCHAR(50), 
    Класс VARCHAR(50) DEFAULT 'Двудольные'
);
--4.	Создать таблицу «Животные_ВашаФамилия». Определить основной ключ, значе-ния столбца «ID» сделать уникальными, 
--для столбца «Отряд» установить значение по умол-чанию «Хищные».
CREATE TABLE Животные_Исламгулова
(
    ID INT UNIQUE, 
    Вид VARCHAR(50),
    Отряд VARCHAR(50) DEFAULT 'Хищные'
);

--10 ПРАКТИЧЕСКАЯ РАБОТА

	CREATE TABLE Ученики		
	(					
		ID	INT PRIMARY KEY IDENTITY(1,1),	
		Фамилия	VARCHAR(50) NOT NULL,		
		Предмет	VARCHAR(50) NOT NULL,		
		Школа	VARCHAR(50) NOT NULL,		
		Баллы	FLOAT CHECK ((Баллы >= 0) AND (Баллы <= 100)) NULL
	);
	
INSERT INTO Ученики (Фамилия, Предмет, Школа, Баллы) VALUES
( N'Иванова', N'Математика', N'Лицей', 98.5),
( N'Петров', N'Физика', N'Лицей', 99),
( N'Сидоров', N'Математика', N'Лицей', 88), 
( N'Полухина', N'Физика', N'Гимназия', 78),
( N'Матвеева', N'Химия', N'Лицей', 92),
( N'Касимов', N'Химия', N'Гимназия', 68),
( N'Нурулин', N'Математика', N'Гимназия', 81),
( N'Авдеев', N'Физика', N'Лицей', 87),
(N'Никитина', N'Химия', N'Лицей', 94), 
(N'Барышева', N'Химия', N'Лицей', 88);

--1.	В таблицу «Ученики» внести новую запись для ученика школы № 18 Трошкова, оценка которого по химии неизвестна.
INSERT INTO Ученики (Фамилия, Предмет, Школа, Баллы) 
VALUES ('Трошков', 'Химия', 'Школа No 18', NULL)
--2.	В таблицу «Ученики» внести три строки.
INSERT INTO Ученики (Фамилия, Предмет, Школа, Баллы)
VALUES 
('Смирнова', 'Физика', 'Лицей', 92),
('Кузнецов', 'Химия', 'Гимназия', 85), 
('Лазарева', 'Математика', 'Школа No18', 79)

--3.	В таблице «Ученики» изменить данные Трошкова, школу исправить на № 21, пред-мет на математику, а оценку на 56.
UPDATE Ученики
SET Школа = 'Школа No21', Предмет = 'Математика', Баллы = 56
WHERE Фамилия = 'Трошков'
--4.	В таблице «Ученики» изменить данные всех учеников по химии, оценку увеличить на 10%, если она ниже 60 баллов.
UPDATE Ученики
SET Баллы = Баллы * 1.1
WHERE Предмет = 'Химия' AND Баллы < 60
--5.	В таблице «Ученики» удалить данные всех учеников из школы №21.
DELETE FROM Ученики
WHERE Школа = 'Школа No21'
--6.	Создать таблицу «Гимназисты» и скопировать туда данные всех гимназистов, кроме тех, которые набрали меньше 60 баллов.
SELECT * INTO Гимназисты
FROM Ученики
WHERE Школа = 'Гимназия' AND Баллы >= 60
--7.	Очистить таблицу «Гимназисты».
TRUNCATE TABLE Гимназисты

--11 ПРАКТИЧЕСКАЯ РАБОТА

-- 1. Даны числа A и B. Найти и вывести их произведение.
declare @a int = 1, @b int =2 ;
SELECT @A * @B

-- 2. В таблице «Ученики» найти разницу между средними баллами лицеистов и гимназистов.
SELECT AVG(CASE WHEN Школа = 'Лицей' THEN Баллы END) - AVG(CASE WHEN Школа = 'Гимназия' THEN Баллы END) AS Разница 
FROM Ученики

-- 3. В таблице «Ученики» проверить на четность количество строк.
SELECT CASE WHEN COUNT(*) % 2 = 0 THEN 'Четное' ELSE 'Нечетное' END AS Четность
FROM Ученики

-- 4. Дано четырехзначное число. Вывести сумму его цифр.
DECLARE @num INT = 1234  
SELECT ((@num / 1000) % 10) + ((@num / 100) % 10) + ((@num / 10) % 10) + (@num % 10) AS Сумма_цифр

-- 5. Даны случайные целые числа a, b и c. Найти наименьшее из них.
DECLARE @a INT, @b INT, @c INT
SET @a = 10
SET @b = 5
SET @c = 20
SELECT CASE WHEN @a <= @b AND @a <= @c THEN @a
            WHEN @b <= @a AND @b <= @c THEN @b
            ELSE @c END AS Наименьшее

-- 6. Дано случайное целое число a. Проверить, делится ли данное число на 11.
DECLARE @a INT = 23
SELECT CASE WHEN @a % 11 = 0 THEN 'Делится' ELSE 'Не делится' END AS Результат

-- 7. Дано случайное целое число N (N < 1000). Если оно является степенью числа 3, то вывести «Да», если не является – вывести «Нет».
DECLARE @A_7 INT = RAND() * 1000
WHILE @A_7 % 3 = 0
SET @A_7 = @A_7 / 3
IF @A_7 = 1
PRINT CAST(@a_7 AS VARCHAR(4)) + ' Да'
ELSE
PRINT CAST(@a_7 AS VARCHAR(4)) + ' Нет'

-- 8. Даны случайные целые числа a и b. Найти наименьший общий кратный (НОК). 
DECLARE @aNOK INT = RAND() * 1000, @bNOK INT = RAND() * 1000 
PRINT '@aNOK = ' + CAST(@aNOK AS VARCHAR(4)) 
PRINT '@bNOK = ' + CAST(@bNOK AS VARCHAR(4))
WHILE @aNOK != @bNOK
BEGIN
IF @aNOK > @bNOK
SET @aNOK = @aNOK - @bNOK
ELSE
SET @bNOK = @bNOK - @aNOK
END
PRINT 'НОK = ' + CAST(@aNOK AS VARCHAR(4))

-- 9. Даны два целых числа A и B (A<B). Найти сумму квадратов всех целых чисел от A до B включительно.
DECLARE @A INT, @B INT
SET @A = 1
SET @B = 5  

SELECT SUM(POWER(number, 2))
FROM master..spt_values 
WHERE type = 'P'
AND number BETWEEN @A AND @B

-- 10. Найти первое натуральное число, которое при делении на 2, 3, 4, 5, и 6 дает остаток 1, но делится на 7.
DECLARE @i INT = 1

WHILE 1 = 1
BEGIN
  IF @i % 2 = 1 AND @i % 3 = 1 AND @i % 4 = 1 AND @i % 5 = 1 AND @i % 6 = 1 AND @i % 7 = 0
  BEGIN
    SELECT @i
    BREAK
  END

  SET @i = @i + 1
END

-- 11. Вывести свою фамилию на экран столько раз, сколько в нем букв.
DECLARE @name NVARCHAR(100) = N'Исламгулова'
DECLARE @len INT = LEN(@name)
DECLARE @i INT = 1

WHILE @i <= @len
BEGIN
  PRINT @name
  SET @i = @i + 1  
END


-- 12. Напишите код для вывода на экран с помощью цикла:
DECLARE @text NVARCHAR(MAX)
SET @text = 'Нижневартовск'
DECLARE @i INT
SET @i = 1
WHILE @i <= LEN(@text)
BEGIN
    DECLARE @formattedText NVARCHAR(MAX)
    IF @i = 1
    BEGIN
        SET @formattedText = SUBSTRING(@text, 1, 1)
    END
    ELSE
    BEGIN
        SET @formattedText = REPLICATE('', LEN(@text) - @i) + REVERSE(SUBSTRING(@text, 2, @i - 1)) + SUBSTRING(@text, 1, @i)
    END    
    PRINT @formattedText
    SET @i = @i + 1
END

--12 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Напишите функцию для вывода названия страны с заданной столицей, и вызовите ее.
CREATE FUNCTION GetCountryByCapital1 (@capital nvarchar(50))
RETURNS nvarchar(50)
AS
BEGIN
  DECLARE @name nvarchar(50)
  SELECT @name = name FROM Country WHERE capital = @capital
  RETURN @name
END

SELECT dbo.GetCountryByCapital1('Дили')
--2.	Напишите функцию для перевода населения в млн. чел. и вызовите ее.
CREATE FUNCTION ToMillions(@pop bigint)
RETURNS float
AS  
BEGIN
  RETURN @pop / 1000000.0 
END

SELECT dbo.ToMillions(Naselenie) FROM Country
--3.	Напишите функцию для вычисления плотности населения заданной части света и вызовите ее.
CREATE FUNCTION GetDensity(@continent nvarchar(50))
RETURNS float
AS
BEGIN
  DECLARE @density float  
  SELECT @density = SUM(Naselenie) / SUM(square) FROM Country WHERE Continent = @continent
  RETURN @density
END

SELECT dbo.GetDensity('Африка')
--4.	Напишите функцию для поиска страны, третьей по населению и вызовите ее.
CREATE FUNCTION Get3rdByPop()
RETURNS nvarchar(50)
AS  
BEGIN
  DECLARE @name nvarchar(50)
  SELECT TOP 1 @name = name FROM 
    (SELECT name, RANK() OVER (ORDER BY Naselenie DESC) AS rnk FROM Country) sub
  WHERE rnk = 3

  RETURN @name
END

SELECT dbo.Get3rdByPop()
--5.	Напишите функцию для поиска страны с максимальным населением в заданной ча-сти света и вызовите ее. 
--Если часть света не указана, выбрать Азию.
CREATE FUNCTION GetMaxPop(@continent nvarchar(50) = 'Азия')
RETURNS nvarchar(50)
AS
BEGIN
  DECLARE @name nvarchar(50)
  SELECT TOP 1 @name = name FROM Country
  WHERE Continent = @continent
  ORDER BY Naselenie DESC
  
  RETURN @name 
END

SELECT dbo.GetMaxPop('Африка')
--6.	Напишите функцию для замены букв в заданном слове от третьей до предпослед-ней на “тест” и примените ее для столицы страны.
CREATE FUNCTION TestCapital(@capital nvarchar(50))
RETURNS nvarchar(50)
AS
BEGIN
  DECLARE @new nvarchar(50) = LEFT(@capital, 2) + REPLICATE('тест', LEN(@capital) - 4) + RIGHT(@capital, 2)

  RETURN @new
END

SELECT dbo.TestCapital(capital) FROM Country
--7.	Напишите функцию, которая возвращает количество стран, не содержащих в назва-нии заданную букву.
CREATE FUNCTION CountWithoutLetter(@letter nvarchar(1))
RETURNS int
AS
BEGIN
  DECLARE @count int
  SELECT @count = COUNT(*) FROM Country WHERE name NOT LIKE '%' + @letter + '%'
  RETURN @count 
END

SELECT dbo.CountWithoutLetter('б')
--8.	Напишите функцию для возврата списка стран с площадью меньше заданного числа и вызовите ее.
CREATE FUNCTION GetBySquare(@maxsquare int)
RETURNS TABLE
AS
RETURN 
  SELECT name FROM Country
  WHERE square < @maxsquare

SELECT * FROM dbo.GetBySquare(100000)
--9.	Напишите функцию для возврата списка стран с населением в интервале заданных значений и вызовите ее.
CREATE FUNCTION GetByPop(@minpop bigint, @maxpop bigint)  
RETURNS TABLE
AS
RETURN
  SELECT name FROM Country
  WHERE Naselenie BETWEEN @minpop AND @maxpop

SELECT * FROM dbo.GetByPop(10000000, 50000000)
--10.	Напишите функцию для возврата таблицы с названием континента и суммарным населением и вызовите ее.
CREATE FUNCTION GetContinentsPop()
RETURNS @table TABLE (continent nvarchar(50), totalpop bigint)
AS
BEGIN
  INSERT INTO @table
  SELECT Continent, SUM(Naselenie) FROM Country
  GROUP BY Continent

  RETURN 
END

SELECT * FROM dbo.GetContinentsPop()
--11.	Напишите функцию IsPalindrom(P) целого типа, возвращающую 1, 
--если целый па-раметр P (P > 0) является палиндромом, и 0 в противном случае.
CREATE FUNCTION dbo.IsPalindrom (@n AS INT)
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
SELECT dbo.IsPalindrom(121)
--12.	Напишите функцию Quarter(x, y) целого типа, определяющую номер координатной четверти, 
--содержащей точку с ненулевыми вещественными координатами (x, y).
CREATE FUNCTION Quarter(@x float, @y float)
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

SELECT dbo.Quarter(1.5, -3.2)
--13.	Напишите функцию IsPrime(N) целого типа, возвращающую 1, 
--если целый пара-метр N (N > 1) является простым числом, и 0 в противном случае.
CREATE FUNCTION IsPrime(@num int)
RETURNS bit
AS
BEGIN
  DECLARE @i int = 2
  WHILE @i < @num
  BEGIN
    IF @num % @i = 0 RETURN 0
    SET @i += 1
  END
  RETURN 1
END

SELECT dbo.IsPrime(13)
--14.	Напишите код для удаления созданных вами функций 
 DROP FUNCTION GetCountryByCapital
DROP FUNCTION ToMillions
DROP FUNCTION IsPrime


--13 ПРАКТИЧЕСКАЯ РАБОТА

-- 1.	Создайте представление, содержащее список африканских стран, 
-- население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его.
CREATE VIEW AfricaBig 
AS
SELECT * FROM Country
WHERE Continent = 'Африка' 
AND Naselenie > 10000000
AND square > 500000

SELECT * FROM AfricaBig
--2.	Создайте представление, содержащее список континентов, 
--среднюю площадь стран, которые находятся на нем, среднюю плотность населения, и используйте его.
CREATE VIEW ContinentAvg
AS
SELECT 
  Continent,
  AVG(square) AS AvgSquare,
  AVG(Naselenie/square) AS AvgDensity
FROM Country  
GROUP BY Continent

SELECT * FROM ContinentAvg
--3.	Создайте представление, содержащее фамилии преподавателей, их должность, 
--зва-ние, степень, место работы, количество их экзаменов, и используйте его.
CREATE VIEW TeachersInfo AS
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

SELECT * FROM TeachersInfo
--4.	Создайте табличную переменную, содержащую три столбца («Номер месяца», «Название месяца», «Количество дней»), 
--заполните ее для текущего года, и используйте ее.
DECLARE @Months TABLE (
  num int, 
  name nvarchar(10),
  days int
)

INSERT INTO @Months 
SELECT MONTH(DATEADD(MONTH, x.number, CAST(YEAR(GETDATE()) AS char(4)) + '0101')) AS num,
       DATENAME(MONTH, DATEADD(MONTH, x.number, CAST(YEAR(GETDATE()) AS char(4)) + '0101')) AS name,  
       DAY(EOMONTH(DATEADD(MONTH, x.number, CAST(YEAR(GETDATE()) AS char(4)) + '0101'))) AS days
FROM master..spt_values x
WHERE x.type = 'P' AND x.number <= 12

SELECT * FROM @Months
--5.	Создайте табличную переменную, содержащую список стран, площадь которых в
--100	раз меньше, чем средняя площадь стран на континенте, где они находятся, и используйте
--ее.
DECLARE @SmallCountries TABLE (
  name nvarchar(50),
  capital nvarchar(50), 
  square int,
  naselenie bigint,
  continent nvarchar(50)
)

INSERT INTO @SmallCountries
SELECT name, capital, square, naselenie, continent
FROM Country
WHERE square * 100 < (
  SELECT AVG(square) 
  FROM Country 
  WHERE Continent = Continent  
)

SELECT * FROM @SmallCountries

--6.	Создайте локальную временную таблицу, имеющую три столбца 
--(«Номер недели», «Количество экзаменов», «Количество студентов»), заполните и используйте ее.
SELECT
  DATEPART(WEEK, Date) AS WeekNum,
  COUNT(DISTINCT Code) AS ExamsCount,
  COUNT(DISTINCT RegNumber) AS StudentsCount
INTO #WeeksStats
FROM Exam
GROUP BY DATEPART(WEEK, Date)

SELECT * FROM #WeeksStats

DROP TABLE #WeeksStats
--7.	Создайте глобальную временную таблицу, содержащую название континентов, 
--наибольшую и наименьшую площадь стран на них, заполните и используйте ее.
CREATE TABLE ##ContinentAreas (
  continent nvarchar(50),
  min_square int,
  max_square int 
)

INSERT INTO ##ContinentAreas
SELECT 
  Continent, 
  MIN(square),
  MAX(square)
FROM Country
GROUP BY Continent

SELECT * FROM ##ContinentAreas

DROP TABLE ##ContinentAreas
--8.	С помощью обобщенных табличных выражений напишите запрос для вывода списка сотрудников, 
--чьи зарплаты меньше, чем средняя зарплата по факультету, их зарплаты и назва-ние факультета.
WITH FacAvgSalaries AS
(
  SELECT f.Name, AVG(CAST(e.Salary AS int)) AS AvgSalary
  FROM Employee e
  JOIN Department d ON e.Code = d.Code
  JOIN Faculty f ON d.FacultyAbbreviation = f.Abbreviation
  GROUP BY f.Name
)
SELECT
  e.LastName, e.Salary, s.Name AS Faculty  
FROM Employee e
JOIN FacAvgSalaries s ON e.Salary < s.AvgSalary
--9.	Напишите команды для удаления всех созданных вами представлений.
DROP VIEW AfricaBig
DROP VIEW ContinentAvg 
DROP VIEW TeachersInfo


--14 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Создайте курсор, содержащий отсортированные по баллам фамилии и баллы уче-ников, откройте его, в
--ыведите первую строку, закройте и освободите курсор.
DECLARE cursor_students CURSOR static FOR
SELECT Фамилия, Баллы
FROM Ученики
ORDER BY Баллы

OPEN cursor_students 
FETCH FIRST FROM cursor_students

CLOSE cursor_students
DEALLOCATE cursor_students
--2.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите пятую, 
--предыдущую, с конца четвертую, следующую, первую строку, закройте и освобо-дите курсор.
DECLARE cursor_students CURSOR SCROLL FOR
SELECT * FROM Ученики

OPEN cursor_students

FETCH ABSOLUTE 5 FROM cursor_students
FETCH PRIOR FROM cursor_students 
FETCH ABSOLUTE -1 FROM cursor_students
FETCH NEXT FROM cursor_students
FETCH FIRST FROM cursor_students

CLOSE cursor_students
DEALLOCATE cursor_students
--3.	Создайте курсор с прокруткой, содержащий список учеников, откройте его, выве-дите последнюю, 
--шесть позиций назад находящуюся, четыре позиций вперед находящуюся строку, закройте и освободите курсор.
DECLARE cursor_students CURSOR SCROLL FOR
SELECT * FROM Ученики 

OPEN cursor_students
FETCH LAST FROM cursor_students
FETCH RELATIVE -6 FROM cursor_students
FETCH RELATIVE 4 FROM cursor_students

CLOSE cursor_students
DEALLOCATE cursor_students
--4.	С помощью курсора, вычислите сумму баллов у учеников с наибольшим и наименьшим баллом.
DECLARE @min_score FLOAT, @max_score FLOAT

DECLARE cursor_students CURSOR STATIC FOR
SELECT Баллы FROM Ученики

OPEN cursor_students
FETCH FIRST FROM cursor_students INTO @min_score
FETCH LAST FROM cursor_students INTO @max_score

SELECT @min_score, @max_score
  
CLOSE cursor_students
DEALLOCATE cursor_students
--5.	С помощью курсора, сгенерируйте строку вида «Ученики <список фамилий и названий предметов, 
--разделенных запятыми> участвовали в олимпиаде».
DECLARE @result NVARCHAR(MAX) = 'Ученики ' 
DECLARE @surname NVARCHAR(50)
DECLARE @subject NVARCHAR(50)

DECLARE cursor_students CURSOR FOR
SELECT Фамилия, Предмет FROM Ученики

OPEN cursor_students
FETCH NEXT FROM cursor_students 
INTO @surname, @subject

WHILE @@FETCH_STATUS = 0
BEGIN
  SET @result += @surname + ', ' + @subject + ', '
  FETCH NEXT FROM cursor_students 
  INTO @surname, @subject
END

SELECT @result

CLOSE cursor_students
DEALLOCATE cursor_students
--6.	Создайте курсор, содержащий список учеников, с его помощью выведите учеников с нечетной позицией.
DECLARE @i INT = 1
DECLARE @surname NVARCHAR(50)  
DECLARE @subject NVARCHAR(50)
DECLARE @school NVARCHAR(50)
DECLARE @score FLOAT

DECLARE cursor_students CURSOR FOR   
SELECT Фамилия, Предмет, Школа, Баллы FROM Ученики

OPEN cursor_students

WHILE 1 = 1
BEGIN
  FETCH NEXT FROM cursor_students 
    INTO @surname, @subject, @school, @score
  
  IF @@FETCH_STATUS <> 0 BREAK

  IF @i % 2 <> 0
    SELECT @surname, @subject, @school, @score

  SET @i += 1  
END

CLOSE cursor_students
DEALLOCATE cursor_students
--7.	Создайте курсор, содержащий отсортированный по убыванию баллов список уче-ников, откройте его, 
--для каждого ученика выведите фамилию, предмет, школу, баллы и про-центное соотношение баллов с предыдущим учеником.
DECLARE @prev_score FLOAT
DECLARE @surname NVARCHAR(50)
DECLARE @subject NVARCHAR(50)  
DECLARE @score FLOAT

DECLARE cursor_students CURSOR STATIC FOR
SELECT Фамилия, Предмет, Баллы FROM Ученики
ORDER BY Баллы DESC

OPEN cursor_students
FETCH FIRST FROM cursor_students
INTO @surname, @subject, @score

WHILE @@FETCH_STATUS = 0
BEGIN
  FETCH NEXT FROM cursor_students 
    INTO @surname, @subject, @score

  DECLARE @percent FLOAT
  SET @percent = (@score / @prev_score) * 100

  PRINT @surname + ' ' + @subject + ' ' + CAST(@score AS VARCHAR) + ' ' + CAST(@percent AS VARCHAR) + '%'

  SET @prev_score = @score
END

CLOSE cursor_students
DEALLOCATE cursor_students

--15 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Вывести список учеников и разницу между баллами ученика и максимальным бал-лом в каждой строке.
SELECT Фамилия, Предмет, Школа, Баллы,
       MAX(Баллы) OVER() - Баллы AS Разница
FROM Ученики
--2.	Вывести список учеников и процентное соотношение к среднему баллу в каждой
--строке.
SELECT Фамилия, Предмет, Школа, Баллы,
       Баллы * 100.0 / AVG(Баллы) OVER() AS Процент
FROM Ученики
--3.	Вывести список учеников и минимальный балл в школе в каждой строке.
SELECT Фамилия, Предмет, Школа, Баллы,  
       MIN(Баллы) OVER(PARTITION BY Школа) AS Мин_Балл_Шк
FROM Ученики
--4.	Вывести список учеников и суммарный балл в школе в каждой строке, отсортиро-вать по школам в оконной функции.
SELECT Фамилия, Предмет, Школа, Баллы,
       SUM(Баллы) OVER(PARTITION BY Школа) AS Сум_Балл_Шк
FROM Ученики
ORDER BY Школа
--5.	Вывести список учеников и номер строки при сортировке по фамилиям в обратном алфавитном порядке.
SELECT ROW_NUMBER() OVER(ORDER BY Фамилия DESC) AS Номер_строки,
       Фамилия, Предмет, Школа, Баллы
FROM Ученики
--6.	Вывести список учеников, номер строки внутри школы и количество учеников в школе при сортировке по баллам по убыванию.
SELECT ROW_NUMBER() OVER(PARTITION BY Школа ORDER BY Баллы DESC) AS Номер_строки,
       COUNT(*) OVER(PARTITION BY Школа) AS Кол_уч_шк,  
       Фамилия, Предмет, Школа, Баллы
FROM Ученики
 
--7.	Вывести список учеников и ранг по баллам.
SELECT RANK() OVER(ORDER BY Баллы DESC) AS Ранг,
       Фамилия, Предмет, Школа, Баллы
FROM Ученики
--8.	Вывести список учеников и сжатый ранг по баллам. Результат отсортировать по фамилии в алфавитном порядке.
SELECT DENSE_RANK() OVER(ORDER BY Баллы DESC) AS Сжатый_ранг,  
       Фамилия, Предмет, Школа, Баллы
FROM Ученики
ORDER BY Фамилия
--9.	Вывести список учеников, распределенных по пяти группам по фамилии.
SELECT NTILE(5) OVER(ORDER BY Фамилия) AS Группа,
       Фамилия, Предмет, Школа, Баллы  
FROM Ученики
--10.	Вывести список учеников, распределенных по трем группам по баллам внутри
--школы.
SELECT NTILE(3) OVER(PARTITION BY Школа ORDER BY Баллы DESC) AS Группа,
       Фамилия, Предмет, Школа, Баллы
FROM Ученики
--11.	Вывести список учеников и разницу с баллами ученика, находящегося выше на три позиции при сортировке по возрастанию баллов.
SELECT Фамилия, Предмет, Школа, Баллы,
       Баллы - LAG(Баллы, 3) OVER(ORDER BY Баллы) AS Разница
FROM Ученики
--12.	Вывести список учеников и разницу с баллами следующего ученика при сорти-ровке по убыванию баллов, значение по умолчанию использовать 0.
SELECT Фамилия, Предмет, Школа, Баллы,
       Баллы - LEAD(Баллы, 1, 0) OVER(ORDER BY Баллы DESC) AS Разница
FROM Ученики


--16 ПРАКТИЧЕСКАЯ РАБОТА
--1.	Напишите запрос, который выводит максимальный балл учеников по школам, по каждому предмету по каждой школе и промежуточные итоги.
SELECT MAX(Баллы) AS Макс_балл, Предмет, Школа  
FROM Ученики
GROUP BY CUBE(Предмет, Школа)
--2.	Напишите запрос, который выводит минимальный балл учеников по школам и по предметам, и промежуточные итоги.
SELECT MIN(Баллы) AS Мин_балл, Предмет, Школа
FROM Ученики  
GROUP BY ROLLUP(Предмет, Школа)
--3.	Напишите запрос, который выводит средний балл учеников по школам и по предметам.
SELECT AVG(Баллы) AS Ср_балл, Предмет, Школа
FROM Ученики
GROUP BY GROUPING SETS(Предмет, Школа)
--4.	Напишите запрос, который выводит количество учеников по каждой школе по пред-метам и промежуточные итоги. 
--NULL значения заменить на соответствующий текст.
SELECT COALESCE(Предмет, 'Итого') AS Предмет,  
       COALESCE(Школа, 'Итого') AS Школа,
       COUNT(*) AS Кол_учеников 
FROM Ученики
GROUP BY ROLLUP(Предмет, Школа)
--5.	Напишите запрос, который выводит суммарный балл учеников по школам и по предметам, и промежуточные итоги. 
--В итоговых строках NULL значения заменить на соответствующий текст в зависимости от группировки.
SELECT IIF(GROUPING(Предмет)=1, 'Итого', Предмет) AS Предмет,
       IIF(GROUPING(Школа)=1, 'Итого', Школа) AS Школа,  
       SUM(Баллы) AS Сумма_баллов
FROM Ученики 
GROUP BY CUBE(Предмет, Школа)
--6.	Напишите запрос, который выводит максимальный балл учеников по школам и по предметам. В итоговых строках 
--NULL значения заменить на соответствующий текст в зави-симости от уровней группировки.
SELECT  
   CASE GROUPING_ID(Предмет, Школа)
     WHEN 1 THEN 'Итого по предметам'
     WHEN 3 THEN 'Итого' 
     ELSE ''
   END AS Итого,
   ISNULL(Предмет, '') AS Предмет, 
   ISNULL(Школа, '') AS Школа,
   MAX(Баллы) AS Макс_балл
FROM Ученики
GROUP BY ROLLUP(Предмет, Школа)
--7.	Напишите запрос, который выводит средний балл учеников по школам в столбцы.
SELECT 'Средний балл' AS [Средний балл],  
       [Гимназия], [Лицей]
FROM  
(
  SELECT Школа, AVG(Баллы) AS Ср_балл
  FROM Ученики
  GROUP BY Школа 
) p
PIVOT
(
  SUM(Ср_балл)
  FOR Школа IN ([Гимназия], [Лицей])  
) AS pivot_table
--8.	Напишите запрос, который выводит средний балл учеников по школам в столбцы и по предметам в строки.
SELECT *
FROM 
(
  SELECT Предмет, Школа, AVG(Баллы) AS Ср_балл
  FROM Ученики
  GROUP BY Предмет, Школа 
) AS source_table
PIVOT
(
  AVG(Ср_балл)
  FOR Школа IN ([Гимназия], [Лицей])  
) AS pivot_table
--9.	Напишите запрос, который выводит названия предметов, фамилии учеников и школы в один столбец.
 SELECT 
  Фамилия,
  [Предмет, Школа]  
FROM Ученики
UNPIVOT
(
  [Предмет, Школа] FOR x IN (Предмет, Школа)
) u

--17 ПРАКТИЧЕСКАЯ РАБОТА

--1.	Создайте и запустите динамический SQL-запрос, выбирающий первые N строк из заданной таблицы.
CREATE PROCEDURE SelectTopRows 
@N int,
@TableName varchar(100)
AS
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT TOP '+ CAST(@N AS varchar(10)) +' * FROM ' + @TableName
  EXEC sp_executesql @sql
END

EXEC SelectTopRows @N = 10, @TableName = 'Ученики'
--2.	Создайте и запустите динамический SQL-запрос, выбирающий все страны из таб-лицы «Страны», 
--последняя буква названия которых расположена в заданном диапазоне.
CREATE PROCEDURE SelectByLastLetter
@FirstLetter char(1),
@LastLetter char(1)  
AS
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT * FROM Country WHERE Name LIKE ''%[' + @FirstLetter + '-' + @LastLetter + ']'''
  EXEC sp_executesql @sql
END

EXEC SelectByLastLetter @FirstLetter = 'а', @LastLetter = 'в'
--3.	Создайте временную таблицу #Temp и добавьте к ней название столбцов таблицы «Страны». 
--Создайте курсор, который, построчно читая таблицу #Temp, выбирает каждый раз соответствующий столбец из таблицы «Страны».
CREATE TABLE #Temp (ColumnName varchar(100))
INSERT INTO #Temp VALUES ('Name'), ('Capital'), ('Square'), ('Naselenie'), ('Continent')

DECLARE @column varchar(100)
DECLARE column_cursor CURSOR FOR 
SELECT ColumnName FROM #Temp

OPEN column_cursor  
FETCH NEXT FROM column_cursor INTO @column

WHILE @@FETCH_STATUS = 0  
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT '+ @column +' FROM Country'
  EXEC sp_executesql @sql

  FETCH NEXT FROM column_cursor INTO @column
END

CLOSE column_cursor;  
DEALLOCATE column_cursor;

DROP TABLE #Temp
--4.	Создайте процедуру, которая принимает как параметр список столбцов, название таблицы и выбирает заданные столбцы из заданной таблицы.
CREATE PROCEDURE SelectColumns 
@Columns varchar(max),
@TableName varchar(100)
AS
BEGIN
  DECLARE @sql nvarchar(max)
  SET @sql = 'SELECT ' + @Columns + ' FROM ' + @TableName
  EXEC sp_executesql @sql
END

EXEC SelectColumns @Columns = 'Name, Capital', @TableName = 'Country'
--5.	Создайте процедуру, принимающую как параметр список столбцов, название таб-лицы, название проверяемого столбца, 
--знак сравнения, значение проверки и выбирающую за-данные столбцы из заданной таблицы в заданных условиях.
CREATE PROCEDURE SelectWithCondition  
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

EXEC SelectWithCondition @Columns = 'Name, Capital', @TableName = 'Country', 
@ColumnToCheck = 'Continent', @ComparisonOp = '=', @ValueToCheck = 'Европа'
--6.	Выберите список европейских стран из таблицы «Страны» и экспортируйте в RAW формате XML.
SELECT Name, Capital  
FROM Country
WHERE Continent = 'Европа'
FOR XML RAW
--7.	Выберите список стран с населением больше 100 млн. чел. из таблицы «Страны» и экспортируйте в PATH формате XML.
SELECT Name, Capital, Naselenie
FROM Country
WHERE Naselenie > 100000000
FOR XML PATH  
--8.	Выберите список учеников из школы «Лицей» из таблицы «Ученики» и экспорти-руйте в PATH формате JSON
SELECT ID, Фамилия, Школа
FROM Ученики
WHERE Школа = 'Лицей'
FOR JSON PATH