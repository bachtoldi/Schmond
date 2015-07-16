/* 
DROP DATABASE schmond
CREATE DATABASE schmond

SET IDENTITY_INSERT tablename ON // Identity selber einf�gen
SET IDENTITY_INSERT tablename OFF // AI
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

CREATE TABLE [dbo].[Instance] (
	[InstanceId] int IDENTITY(1,1) PRIMARY KEY,
	[InstanceName] nvarchar(max) NOT NULL,
	[InstanceNameEN] nvarchar(max) NOT NULL
)

CREATE TABLE [dbo].[Boss] (
	[BossId] int IDENTITY(1,1) PRIMARY KEY,
	[BossNumber] int NOT NULL,
	[BossName] nvarchar(max) NOT NULL,
	[BossNameEN] nvarchar(max) NOT NULL,
	[FK_InstanceId] int FOREIGN KEY REFERENCES [dbo].[Instance]([InstanceId]) NOT NULL
)

CREATE TABLE [dbo].[Class] (
	[ClassId] int IDENTITY(1,1) PRIMARY KEY,
	[ClassName] nvarchar(max) NOT NULL,
	[ClassNameEN] nvarchar(max) NOT NULL
)

--CREATE TABLE [dbo].[ItemArmorType] (
--    [ItemArmorTypeId] int PRIMARY KEY,
--    [ItemArmorTypeName] nvarchar(max) NOT NULL,
--	[ItemArmorTypeNameEN] nvarchar(max) NOT NULL
--)

--CREATE TABLE [dbo].[ItemSlotType] (
--	[ItemSlotTypeId] int PRIMARY KEY,
--	[ItemSlotTypeName] nvarchar(max) NOT NULL,
--	[ItemSlotTypeNameEN] nvarchar(max) NOT NULL
--)

--CREATE TABLE [dbo].[ItemType] (
--    [ItemTypeId] int PRIMARY KEY,
--    [ItemTypeName] nvarchar(max) NOT NULL,
 --   [FK_ItemArmorTypeId] int FOREIGN KEY REFERENCES [dbo].[ItemArmorType]([ItemArmorTypeId]) NOT NULL,
	--[FK_ItemSlotTypeId] int FOREIGN KEY REFERENCES [dbo].[ItemSlotType]([ItemSlotTypeId]) NOT NULL
--)

CREATE TABLE [dbo].[ItemDetail] (
    [ItemDetailId] int IDENTITY(1,1) PRIMARY KEY,
    [FK_ItemId] int FOREIGN KEY REFERENCES [dbo].[Item]([ItemId]) NOT NULL
)

CREATE TABLE [dbo].[Item] (
	[ItemId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemName] nvarchar(max) NOT NULL,
	[ItemNameEN] nvarchar(max) NOT NULL,
	--[FK_ItemTypeId] int FOREIGN KEY REFERENCES [dbo].[ItemType]([ItemTypeId]) NOT NULL,
	[ItemImg] image NULL
)

CREATE TABLE [dbo].[ItemClassSetting] (
    [ItemClassSettingId] int IDENTITY(1,1) PRIMARY KEY,
    [FK_ItemId] int FOREIGN KEY REFERENCES [dbo].[Item]([ItemId]) NOT NULL,
    [FK_ClassId] int FOREIGN KEY REFERENCES [dbo].[Class]([ClassId]) NOT NULL
)

CREATE TABLE [dbo].[ItemBossSetting] (
    [ItemBossSettingId] int IDENTITY(1,1) PRIMARY KEY,
    [FK_ItemId] int FOREIGN KEY REFERENCES [dbo].[Item]([ItemId]) NOT NULL,
    [FK_BossId] int FOREIGN KEY REFERENCES [dbo].[Boss]([BossId]) NOT NULL
)

CREATE TABLE [dbo].[Spec] (
	[SpecId] int IDENTITY(1,1) PRIMARY KEY,
	[SpecName] nvarchar(max) NOT NULL,
	[SpecNameEN] nvarchar(max) NOT NULL,
	[FK_ClassId] int FOREIGN KEY REFERENCES [dbo].[Class]([ClassId]) NOT NULL
)

CREATE TABLE [dbo].[Available] (
	[AvailableId] int IDENTITY(1,1) PRIMARY KEY,
	[FK_SpecId] int FOREIGN KEY REFERENCES [dbo].[Spec]([SpecId]) NOT NULL,
	[FK_ItemId] int FOREIGN KEY REFERENCES [dbo].[Item]([ItemId]) NOT NULL
)

CREATE TABLE [dbo].[Faction] (
	[FactionId] int IDENTITY(1,1) PRIMARY KEY,
	[FactionName] nvarchar(max) NOT NULL,
	[FactionNameEN] nvarchar(max) NOT NULL,
)

CREATE TABLE [dbo].[Race] (
	[RaceId] int IDENTITY(1,1) PRIMARY KEY,
	[RaceName] nvarchar(max),
	[RaceNameEN] nvarchar(max),
	[FK_FactionId] int FOREIGN KEY REFERENCES [dbo].[Faction]([FactionId]) NOT NULL
)

CREATE TABLE [dbo].[ClassRaceSetting] (
    [ClassRaceSettingId] int IDENTITY(1,1) PRIMARY KEY,
    [FK_ClassId] int FOREIGN KEY REFERENCES [dbo].[Class]([ClassId]) NOT NULL,
    [FK_RaceId] int FOREIGN KEY REFERENCES [dbo].[Race]([RaceId]) NOT NULL
)

CREATE TABLE [dbo].[Char] (
	[CharId] int IDENTITY(1,1) PRIMARY KEY,
	[CharName] varchar(max) NOT NULL,
	[FK_UserId] nvarchar(128) FOREIGN KEY REFERENCES [dbo].[AspNetUsers]([Id]) NOT NULL,
	[FK_RaceId] int FOREIGN KEY REFERENCES [dbo].[Race]([RaceId]) NOT NULL,
	[FK_SpecId] int FOREIGN KEY REFERENCES [dbo].[Spec]([SpecId]) NOT NULL
)

ALTER TABLE [dbo].[AspNetUsers]
ADD [FK_CharId] int FOREIGN KEY REFERENCES [dbo].[Char]([CharId]) NULL

CREATE TABLE [dbo].[NeedType] (
	[NeedTypeId] int IDENTITY(1,1) PRIMARY KEY,
	[NeedTypeName] varchar(max) NOT NULL
)

CREATE TABLE [dbo].[Priority] (
	[PriorityId] int IDENTITY(1,1) PRIMARY KEY,
	[PriorityName] varchar(max) NOT NULL
)

CREATE TABLE [dbo].[Need] (
	[NeedId] int IDENTITY(1,1) PRIMARY KEY,
	[FK_CharId] int FOREIGN KEY REFERENCES [dbo].[Char]([CharId]) NOT NULL,
	[FK_AvailableId] int FOREIGN KEY REFERENCES [dbo].[Available]([AvailableId]) NOT NULL,
	[FK_NeedTypeId] int FOREIGN KEY REFERENCES [dbo].[NeedType]([NeedTypeId]) NOT NULL,
	[FK_PriorityId] int FOREIGN KEY REFERENCES [dbo].[Priority]([PriorityId]) NOT NULL
)