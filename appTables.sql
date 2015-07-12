/* 
DROP DATABASE schmond
CREATE DATABASE schmond
*/

USE [schmond]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO

ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO

CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO

CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO

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

ALTER TABLE AspNetUsers
ADD CharsId int FOREIGN KEY REFERENCES Chars(CharsId) NULL

CREATE TABLE NeedType (
	NeedTypeId int IDENTITY(1,1) PRIMARY KEY,
	NeedTypeName varchar(max) NOT NULL
)

CREATE TABLE Priorities (
	PrioritiesId int PRIMARY KEY,
	PrioritiesName varchar(max) NOT NULL
)

CREATE TABLE Need (
	NeedId int IDENTITY(1,1) PRIMARY KEY,
	CharsId int FOREIGN KEY REFERENCES Chars(CharsId) NOT NULL,
	AvailableId int FOREIGN KEY REFERENCES Available(AvailableId) NOT NULL,
	NeedTypeId int FOREIGN KEY REFERENCES NeedType(NeedTypeId) NOT NULL
)