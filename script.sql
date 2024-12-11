-- fit track

-- create data base:
CREATE DATABASE FitnessManagement;
GO
USE FitnessManagement;
GO

-- create members table : 
CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender NVARCHAR(10) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    PhoneNumber NVARCHAR(15),
    Email NVARCHAR(100)
);
GO
