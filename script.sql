-- fit track

-- إنشاء قاعدة البيانات
CREATE DATABASE FitnessManagement;
GO

-- تحديد قاعدة البيانات لاستخدامها
USE FitnessManagement;
GO

-- إنشاء جدول الأعضاء (Members)
CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    PhoneNumber NVARCHAR(15),
    Email NVARCHAR(100)
);
GO

-- إنشاء جدول الاشتراكات (memberships)
CREATE TABLE memberships (
    membership_id INT IDENTITY(1,1) PRIMARY KEY,
    member_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    membership_type VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);
GO

-- إضافة عضو جديد (Alex Johnson) إلى جدول Members
INSERT INTO Members (FullName, DateOfBirth, Gender, PhoneNumber, Email)
VALUES ('Alex Johnson', '1990-07-15', 'Male', '1234567890', NULL);
GO

-- التحقق من البيانات في جدول Members
SELECT * FROM Members;
GO


-- إنشاء جدول الأقسام (Departments)
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),   -- معرّف القسم
    DepartmentName NVARCHAR(100) NOT NULL,         -- اسم القسم (مثل: كارديو، عضلات، إلخ)
    Location NVARCHAR(100) NOT NULL                -- الموقع (غرفة أو منطقة القسم)
);


-- إنشاء جدول المدربين (Trainers)
CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY IDENTITY(1,1),      -- معرّف المدرب
    FullName NVARCHAR(100) NOT NULL,               -- الاسم الكامل
    DepartmentID INT NOT NULL,                     -- معرّف القسم الذي يعمل فيه المدرب
    Specialization NVARCHAR(100),                  -- التخصص (مثل: تدريب كارديو، تدريب عضلات، إلخ)
    PhoneNumber NVARCHAR(15),                      -- رقم الهاتف
    Email NVARCHAR(100),                           -- البريد الإلكتروني
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)  -- الربط مع جدول الأقسام
);


-- إنشاء جدول المواعيد (Appointments)
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),   -- معرّف الموعد
    MemberID INT NOT NULL,                          -- معرّف العضو الذي لديه الموعد
    TrainerID INT NOT NULL,                         -- معرّف المدرب الذي سيقوم بالتدريب
    AppointmentDate DATE NOT NULL,                   -- تاريخ الموعد
    AppointmentTime TIME NOT NULL,                   -- وقت الموعد
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),  -- الربط مع جدول الأعضاء
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerID)  -- الربط مع جدول المدربين
);



