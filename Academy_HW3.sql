-- Создание 
create database Academy;
use Academy;

create table Curators (
	Id int auto_increment not null primary key,
	Name nvarchar(100) not null check(Name <> N''), 
	Surname nvarchar(100) not null check(Surname <> N'')
);

create table Faculties (
	Id int auto_increment not null primary key, 
    Financing decimal(14, 2) not null check(Financing >= 0) default 0,
    Name nvarchar(100) not null check(Name <> N'') unique
);

create table Departments (
	Id int auto_increment not null primary key, 
    Financing decimal(14, 2) not null check(Financing >= 0) default 0, 
    Name nvarchar(100) not null check(Name <> N'') unique,
    FacultyId int not null, 
    foreign key (FacultyId) references Faculties(Id)
);
    
create table GroupsAcademy (
	Id int auto_increment not null primary key,
    Name nvarchar(20) not null check(Name <> N'') unique, 
    Year int not null check(Year between 1 and 5), 
    DepartmentId int not null, 
    foreign key (DepartmentId) references Departments(Id)
);

create table GroupsCurators (
	Id int auto_increment not null primary key, 
    CuratorId int not null, 
    GroupId int not null, 
    foreign key (CuratorId) references Curators(Id), 
    foreign key (GroupId) references GroupsAcademy(Id)
);

create table Subjects (
	Id int auto_increment not null primary key, 
    Name nvarchar(100) not null check(Name <> N'') unique
);
    
create table Teachers (
	Id int auto_increment not null primary key, 
    Name nvarchar(100) not null check(Name <> N''), 
    Salary decimal(14, 2) not null check(Salary > 0), 
    Surname nvarchar(100) not null check(Surname <> N'')
);

create table Lectures (
	Id int auto_increment not null primary key, 
    LectureRoom nvarchar(100) not null check(LectureRoom <> N''),
    SubjectId int not null, 
    TeacherId int not null, 
    foreign key (SubjectId) references Subjects(Id), 
    foreign key (TeacherId) references Teachers(Id)
);
    
create table GroupsLectures (
	Id int auto_increment not null primary key, 
	GroupId int not null, 
	LectureId int not null, 
	foreign key (GroupId) references GroupsAcademy(Id), 
	foreign key (LectureId) references Lectures(Id)
);

-- Наполнение 
insert into faculties (name, Financing)
values
('Факультет естественных наук', 60000.00),
('Гуманитарный факультет', 79500.00), 
('Факультет биотехнологии и промышленной экологии', 89000.00),
('Факультет цифровых технологий', 50000.00);

insert into departments (name, financing, facultyid )
values
('Кафедра информатики и компьютерного проектирования', 30000.00, 4),
('Кафедра информационных компьютерных технологий', 35000.00, 4),
('Кафедра логистики и экономической информатики', 24000.00, 4), 
('Кафедра биотехнологии', 28000.00, 3), 
('Кафедра промышленной экологии', 20000.00, 3), 
('Кафедра высшей математики', 26000.00, 1), 
('Кафедра физики', 18000.00, 1), 
('Кафедра физической химии', 16000.00, 1), 
('Кафедра социологии, психологии и права', 10000.00, 2), 
('Кафедра иностранных языков', 8000.00, 2), 
('Кафедра истории и политологии', 12000.00, 2), 
('Кафедра менеджмента и маркетинга', 9000.00, 2), 
('Кафедра русского языка', 16000.00, 2), 
('Кафедра физического воспитания', 14000.00, 2), 
('Кафедра философии', 10500.00, 2);

insert into teachers (name, salary, surname)
values
('Анна', 47500, 'Викторова'),
('Елизавета', 35000, 'Морозова'),
('Екатерина', 45000, 'Звукова'),
('Константин', 32000, 'Иванов'),
('Лариса', 20200, 'Гордеева'),
('Евгений', 64000, 'Москвин'),
('Алексей', 25000, 'Зеленин'),
('Галина', 26000, 'Сергеева'),
('Владимир', 45400, 'Петров'),
('Михаил', 32900, 'Воронин'),
('Сергей', 41200, 'Исаев'),
('Валентина', 34000, 'Константинова'),
('Александр', 30900, 'Смирнов'),
('Аркадий', 37080, 'Выжегодский'),
('Маргарита', 40000, 'Симова'),
('Валерий', 35000, 'Дубравин'),
('Людмила', 42000, 'Андреева'),
('Елена', 41000, 'Жукова'),
('Светлана', 31000, 'Носова'),
('Олег', 39000, 'Волков');

insert into curators (name, surname)
values 
('Лариса', 'Гордеева'),
('Евгений', 'Москвин'),
('Светлана', 'Носова'),
('Олег', 'Волков'),
('Алексей', 'Зеленин'),
('Валерий', 'Дубравин'),
('Людмила', 'Андреева'),
('Александр', 'Смирнов'),
('Маргарита', 'Симова'),
('Аркадий', 'Выжегодский');


insert into groupsacademy (name, departmentid,  year)
values
('КИиКП001', 1 , 1),
('КИиКП002', 1 , 2),
('КИиКП003', 1 , 3),
('КИКТ011', 2 , 1),
('КИКТ012', 2 , 2),
('КИКТ013', 2 , 3),
('КИКТ014', 2 , 4),
('КИКТ015', 2 , 5),
('КЛиЭИ021', 3 , 1),
('КЛиЭИ022', 3 , 2),
('КБ031', 4 , 1),
('КБ032', 4 , 2),
('КБ033', 4 , 3),
('КВМ041', 6 , 1),
('КВМ045', 6 , 5),
('КВМ043', 6 , 3),
('КФ041', 7 , 1),
('КФ042', 7 , 2),
('КИЯ041', 10 , 1),
('КИЯ042', 10 , 2),
('КИЯ045', 10 , 5),
('КРЯ051', 13 , 1),
('КРЯ052', 13 , 2),
('КРЯ055', 13 , 5),
('КФВ051', 14 , 1),
('КФВ052', 14 , 2),
('КФВ053', 14 , 3),
('КФ061', 15 , 1),
('КФ062', 15 , 2),
('КФ065', 15 , 5);

insert into groupscurators (groupid, curatorid)
values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 10),
(19, 9),
(20, 8),
(21, 9),
(22, 1),
(23, 3),
(24, 2),
(25, 5),
(26, 7),
(27, 10),
(28, 4),
(29, 8),
(30, 6);

insert into subjects 
values 
(1, "Математический анализ"),
(2, "Линейная алгебра"),
(3, "Электродинамика"),
(4, "Теоретическая физика"),
(5, "Органическая химия"),
(6, "Основы информационной безопасности"),
(7, "Психология"),
(8, "Иностранный язык"),
(9, "История"),
(10, "Философия"),
(11, "Физическая культура"),
(12, "Экономика"),
(13, "Статистика"),
(14, "Менеджмент"),
(15, "Информатика"),
(16, "Общий курс математики");

insert into lectures 
values
(1, 210, 1, 1), 
(2, 215, 1, 3), 
(3, 210, 2, 2), 
(4, 315, 2, 4), 
(5, 310, 3, 6), 
(6, 205, 4, 5), 
(7, 110, 6, 13), 
(8, 315, 5, 8), 
(9, 115, 7, 15), 
(10, 115, 7, 19), 
(11, 220, 8, 18), 
(12, 320, 8, 20), 
(13, 232, 9, 7), 
(14, 215, 10, 9), 
(15, 109, 11, 10), 
(16, 333, 11, 11), 
(17, 102, 12, 14), 
(18, 319, 13, 12), 
(19, 327, 14, 14), 
(20, 234, 15, 13), 
(21, 225, 16, 16), 
(22, 327, 16, 17);

insert into groupslectures (groupid, lectureid)
values
(1,	5),
(1,	7),
(1,	9),
(1,	11),
(2,	1),
(2,	4),
(2,	7),
(2,	10),
(3,	2),
(3,	3),
(3,	4),
(3,	5),
(3,	6),
(4,	4),
(4,	5),
(4,	6),
(4,	7),
(4,	8),
(5,	1),
(5,	5),
(5,	9),
(5,	13),
(6,	3),
(6,	5),
(6,	7),
(7,	16),
(7,	15),
(7,	14),
(7,	13),
(8,	11),
(8,	9),
(8,	10),
(8,	13),
(9,	6),
(9,	14),
(9,	12),
(9,	1),
(9,	5),
(10, 15),
(10, 2),
(11, 5),
(11, 7),
(11, 9),
(11, 11),
(12, 1),
(12, 4),
(12, 7),
(12, 10),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6),
(14, 4),
(14, 5),
(14, 6),
(14, 7),
(14, 8),
(15, 1),
(15, 5),
(15, 9),
(15, 13),
(16, 3),
(16, 5),
(16, 7),
(17, 16),
(17, 15),
(17, 14),
(17, 13),
(18, 11),
(18, 9),
(18, 10),
(18, 13),
(19, 6),
(19, 14),
(19, 12),
(19, 1),
(19, 5),
(20, 7),
(20, 14),
(21, 5),
(21, 7),
(21, 9),
(21, 11),
(22, 1),
(22, 4),
(22, 7),
(22, 10),
(23, 2),
(23, 3),
(23, 4),
(23, 5),
(23, 6),
(24, 4),
(24, 5),
(24, 6),
(24, 7),
(24, 8),
(25, 1),
(25, 5),
(25, 9),
(25, 13),
(26, 3),
(26, 5),
(26, 7),
(27, 16),
(27, 15),
(27, 14),
(27, 13),
(28, 11),
(28, 9),
(28, 10),
(28, 13),
(29, 6),
(29, 14),
(29, 12),
(29, 1),
(29, 5),
(30, 2),
(30, 8),
(30, 10);

-- Запросы
-- 1. Вывести все возможные пары строк преподавателей и групп.
select 
	concat(t.name, ' ', t.surname) as 'Преподаватель',
	g.name as 'Группа'
from teachers t, groupsacademy g;

-- 2. Вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета.
select 
	f.name as 'Название факультета'
from faculties f
inner join  departments d
on f.id = d.facultyid
group by f.id, f.financing
having f.financing < sum(d.financing);

-- 3. Вывести фамилии кураторов групп и названия групп, которые они курируют.
select 
	c.surname as 'Фамилия куратора',
	gy.name as 'Название группы'
from curators c
inner join groupscurators g
on c.id = g.curatorid
inner join groupsacademy gy
on gy.id = g.groupid;

-- 4. Вывести имена и фамилии преподавателей, которые читают лекции у группы “КВМ045”.
select 
 t.name as 'Имя преподавателя', 
 t.surname as 'Фамилия преподавателя'
from teachers t
inner join lectures l 
on t.id = l.teacherid
inner join groupslectures g 
on l.id = g.lectureid
inner join groupsacademy gy 
on g.groupid = gy.id 
where gy.name = 'КВМ045'
group by t.id;

-- 5. Вывести фамилии преподавателей и названия факультетов на которых они читают лекции.
select 
	t.surname as 'Фамилия преподавателя', 
    f.name as 'Название факультета'
from teachers t
inner join lectures l
on t.id = l.teacherid
inner join groupslectures gl
on l.id = gl.lectureid
inner join groupsacademy ga
on gl.groupid = ga.id
inner join departments d
on ga.departmentid = d.id
inner join faculties f 
on d.facultyid = f.id
group by t.id, f.id
order by t.surname;

-- 6. Вывести названия кафедр и названия групп, которые к ним относятся.
select 
	d.name as 'Кафедра', 
    g.name as 'Группа'
from departments d  
inner join groupsacademy g 
on g.departmentid = d.id
order by d.id;

-- 7. Вывести названия дисциплин, которые читает преподаватель “Александр Смирнов”.
select 
	s.name as 'Дисциплинa'
from teachers t
inner join lectures l
on t.id = l.teacherid
inner join subjects s
on l.subjectid = s.id 
where t.name = 'Александр' and t.surname = 'Смирнов';

-- 8. Вывести названия кафедр, на которых читается дисциплина “Линейная алгебра”.
select 
	distinct d.name as 'Название кафедры'
from subjects s
inner join lectures l
on s.id = l.subjectid
inner join groupslectures gl
on l.id = gl.lectureid
inner join groupsacademy ga
on gl.groupid = ga.id
inner join departments d
on ga.departmentid = d.id
where s.name = 'Линейная алгебра';

-- 9. Вывести названия групп, которые относятся к факультету “Факультет естественных наук”.
select 
	ga.name as 'Название группы'
from faculties f
inner join departments d 
on f.id = d.facultyid
inner join groupsacademy ga
on d.id = ga.departmentid
where f.name = 'Факультет естественных наук';

-- 10. Вывести названия групп 5-го курса, а также название факультетов, к которым они относятся.
select 
	ga.name as 'Название группы',
    f.name as 'Название факультета'
from faculties f
inner join departments d
on f.id = d.facultyid
inner join groupsacademy ga
on d.id = ga.departmentid
where ga.year = 5;

-- 11. Вывести полные имена преподавателей и лекции, которые они читают (названия дисциплин и 
	-- групп), причем отобрать только те лекции, которые читаются в аудитории “315”.
    select 
		concat(t.name, ' ', t.surname) as 'Полное имя преподавателя',
        s.name as 'Название дисциплины',
        ga.name as 'Название группы'
    from subjects s
    inner join lectures l 
    on s.id = l.subjectid
	inner join teachers t
    on t.id = l.teacherid 
    inner join groupslectures gl
    on l.id = gl.lectureid
    inner join groupsacademy ga
    on gl.groupid = ga.id
    where l.lectureroom = 315
    group by ga.id, s.id;    
