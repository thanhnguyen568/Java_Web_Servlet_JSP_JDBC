CREATE TABLE Class (
    ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    Status BIT
);

CREATE TABLE Student (
    StudentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    `Status` BIT,
    ClassID INT NOT NULL
);

CREATE TABLE `Subject` (
    SubID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    `status` BIT DEFAULT 1
);

CREATE TABLE Mark (
    MarkID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    UNIQUE (SubID , StudentID),
    FOREIGN KEY (SubID)
        REFERENCES `Subject` (SubID),
    FOREIGN KEY (StudentID)
        REFERENCES student(StudentID),
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1
);

insert into class (classID, ClassName, StartDate, `Status`)
values 
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date(), 0);

insert into student (studentid, studentname, address, phone, `status`, classid)
values
(1, 'Hung', 'Ha Noi', '0912113113', 1, 1),
(2, 'Hoa', 'Hai Phong', null, 1, 1),
(3, 'Manh', 'HCM', '0123123123', 0, 2);

insert into subject (SubID, SubName, Credit, `Status`)
values
(1,'CF', 5, 1),
(2,'C', 6, 1),
(3,'HDJ', 5, 1),
(4,'RDBMS', 10, 1);

insert into mark (MarkID, SubID, StudentID, Mark, ExamTimes)
values
(1, 1, 1, 8, 1),
(2, 1, 2, 10, 2),
(3, 2, 1, 12, 1);

/*
Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
*/
SELECT s.SubID, s.SubName, s.`status`, s.Credit
FROM `subject` s
WHERE Credit = (SELECT MAX(s.Credit) FROM `subject` s)
GROUP BY s.SubID;

-- cach 2

SELECT *
FROM `subject`
ORDER BY Credit DESC
LIMIT 1;

/*
Hiển thị các thông tin môn học có điểm thi lớn nhất.
*/
SELECT s.SubID, SubName, Credit, `status`, Mark
FROM `subject` s
INNER JOIN mark m
ON s.SubID = m.SubID
WHERE Mark = (SELECT MAX(Mark) FROM mark);

/*
Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
*/
SELECT s.StudentID, StudentName, AVG(Mark)
FROM student s
INNER JOIN mark m 
ON s.StudentID = m.StudentID
GROUP BY s.StudentID;


