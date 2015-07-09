/*

IF OBJECT_ID('dbo.Chars', 'U') IS NOT NULL
  DROP TABLE dbo.Chars;
IF OBJECT_ID('dbo.Need', 'U') IS NOT NULL
  DROP TABLE dbo.Need;
IF OBJECT_ID('dbo.NeedType', 'U') IS NOT NULL
  DROP TABLE dbo.NeedType;
IF OBJECT_ID('dbo.Race', 'U') IS NOT NULL
  DROP TABLE dbo.Race;
IF OBJECT_ID('dbo.Available', 'U') IS NOT NULL
  DROP TABLE dbo.Available;
IF OBJECT_ID('dbo.Spec', 'U') IS NOT NULL
  DROP TABLE dbo.Spec;
IF OBJECT_ID('dbo.Class', 'U') IS NOT NULL
  DROP TABLE dbo.Class;
IF OBJECT_ID('dbo.Item', 'U') IS NOT NULL
  DROP TABLE dbo.Item;
IF OBJECT_ID('dbo.Boss', 'U') IS NOT NULL
  DROP TABLE dbo.Boss;
IF OBJECT_ID('dbo.Instance', 'U') IS NOT NULL
  DROP TABLE dbo.Instance;

*/

CREATE TABLE Instance (
	InstanceId int IDENTITY(1,1) PRIMARY KEY,
	InstanceName nvarchar(max) NOT NULL
)

CREATE TABLE Boss (
	BossId int IDENTITY(1,1) PRIMARY KEY,
	BossName nvarchar(max) NOT NULL,
	InstanceId int FOREIGN KEY REFERENCES Instance(InstanceId) NOT NULL
)

CREATE TABLE Item (
	ItemId int IDENTITY(1,1) PRIMARY KEY,
	ItemName nvarchar(max) NOT NULL,
	BossId int FOREIGN KEY REFERENCES Boss(BossId) NOT NULL,
	ItemImg image NULL
)

CREATE TABLE Class (
	ClassId int IDENTITY(1,1) PRIMARY KEY,
	ClassName nvarchar(max) NOT NULL
)

CREATE TABLE Spec (
	SpecId int IDENTITY(1,1) PRIMARY KEY,
	SpecName nvarchar(max) NOT NULL,
	ClassId int FOREIGN KEY REFERENCES Class(ClassId) NOT NULL
)

CREATE TABLE Available (
	AvailableId int IDENTITY(1,1) PRIMARY KEY,
	SpecId int FOREIGN KEY REFERENCES Spec(SpecId) NOT NULL,
	ItemId int FOREIGN KEY REFERENCES Item(ItemId) NOT NULL
)

CREATE TABLE Race (
	RaceId int IDENTITY(1,1) PRIMARY KEY,
	RaceName nvarchar(max)
)

CREATE TABLE Chars (
	CharsId int IDENTITY(1,1) PRIMARY KEY,
	UserId nvarchar(128) FOREIGN KEY REFERENCES AspNetUsers(Id) NOT NULL,
	CharsName varchar(max) NOT NULL,
	RaceId int FOREIGN KEY REFERENCES Race(RaceId) NOT NULL,
	SpecId int FOREIGN KEY REFERENCES Spec(SpecId) NOT NULL
)

CREATE TABLE NeedType (
	NeedTypeId int IDENTITY(1,1) PRIMARY KEY,
	NeedTypeName varchar(max) NOT NULL
)

CREATE TABLE Need (
	NeedId int IDENTITY(1,1) PRIMARY KEY,
	CharsId int FOREIGN KEY REFERENCES Chars(CharsId) NOT NULL,
	NeedTypeId int FOREIGN KEY REFERENCES NeedType(NeedTypeId) NOT NULL
)