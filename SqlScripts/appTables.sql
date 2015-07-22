/* 
DROP DATABASE schmond
CREATE DATABASE schmond

SET IDENTITY_INSERT tablename ON // Identity selber einfügen
SET IDENTITY_INSERT tablename OFF // AI
*/

USE [schmond]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Account](
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

CREATE TABLE [dbo].[Role](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[UserHasRole](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserHasRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[UserHasRole] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO

ALTER TABLE [dbo].[UserHasRole]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Account] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[UserHasRole] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO

CREATE TABLE [dbo].[Login](
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

ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Account] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
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
REFERENCES [dbo].[Account] ([Id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO

CREATE TABLE [dbo].[Instance] (
	[InstanceId] int IDENTITY(1,1) PRIMARY KEY,
	[InstanceName] nvarchar(max) NOT NULL UNIQUE,
	[InstanceNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[Boss] (
	[BossId] int IDENTITY(1,1) PRIMARY KEY,
	[BossNumber] int NOT NULL,
	[BossName] nvarchar(max) NOT NULL UNIQUE,
	[BossNameEN] nvarchar(max) NULL UNIQUE,
	[FK_InstanceId] int FOREIGN KEY REFERENCES [dbo].[Instance]([InstanceId]) NOT NULL,
	CONSTRAINT [uq_InstanceBossNumber] UNIQUE NONCLUSTERED ( [BossNumber], [FK_InstanceId] ) ON [PRIMARY]
)

CREATE TABLE [dbo].[Class] (
	[ClassId] int IDENTITY(1,1) PRIMARY KEY,
	[ClassName] nvarchar(max) NOT NULL UNIQUE,
	[ClassNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemClass] (
	[ItemClassId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemClassName] nvarchar(max) NOT NULL UNIQUE,
	[ItemClassNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemType] (
	[ItemTypeId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemTypeName] nvarchar(max) NOT NULL UNIQUE,
	[ItemTypeNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemBinding] (
	[ItemBindingId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemBindingName] nvarchar(max) NOT NULL UNIQUE,
	[ItemBindingNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemUniqueness] (
	[ItemUniquenessId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemUniquenessName] nvarchar(max) NOT NULL UNIQUE,
	[ItemUniquenessNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemSlot] (
	[ItemSlotId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemSlotName] nvarchar(max) NOT NULL UNIQUE,
	[ItemSlotNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemSet] (
	[ItemSetId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemSetName] nvarchar(max) NOT NULL UNIQUE,
	[ItemSetNameEN] nvarchar(max) NULL UNIQUE,
	[ItemSetNumberOfItems] int NOT NULL
)

CREATE TABLE [dbo].[ItemRarity] (
	[ItemRarityId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemRarityName] nvarchar(max) NOT NULL UNIQUE,
	[ItemRarityNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemStatType] (
	[ItemStatTypeId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemStatTypeName] nvarchar(max) NOT NULL UNIQUE,
	[ItemStatTypeNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemDetail] (
	[ItemDetailId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemDetailDurability] int NULL,
	[ItemDetailLevelRequirement] int NULL,
	[FK_ItemClassId] int FOREIGN KEY REFERENCES [dbo].[ItemClass]([ItemClassId]) NULL,
	[FK_ItemTypeId] int FOREIGN KEY REFERENCES [dbo].[ItemType]([ItemTypeId]) NULL,
	[FK_ItemSlotId] int FOREIGN KEY REFERENCES [dbo].[ItemSlot]([ItemSlotId]) NULL,
	[FK_ItemBindingId] int FOREIGN KEY REFERENCES [dbo].[ItemBinding]([ItemBindingId]) NULL,
	[FK_ItemRarityId] int FOREIGN KEY REFERENCES [dbo].[ItemRarity]([ItemRarityId]) NULL,
	[FK_ItemUniquenessId] int FOREIGN KEY REFERENCES [dbo].[ItemUniqueness]([ItemUniquenessId]) NULL,
	[FK_ItemSetId] int FOREIGN KEY REFERENCES [dbo].[ItemSet]([ItemSetId]) NULL
)

CREATE TABLE [dbo].[ItemStat] (
	[ItemStatId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemStatIncrease] int NULL,
	[FK_ItemStatTypeId] int FOREIGN KEY REFERENCES [dbo].[ItemStatType]([ItemStatTypeId]) NOT NULL,
	[FK_ItemDetailId] int FOREIGN KEY REFERENCES [dbo].[ItemDetail]([ItemDetailId]) NOT NULL,
	CONSTRAINT [uq_ItemDetailStat] UNIQUE NONCLUSTERED ( [FK_ItemStatTypeId], [FK_ItemDetailId] ) ON [PRIMARY]
)

CREATE TABLE [dbo].[Item] (
	[ItemId] int IDENTITY(1,1) PRIMARY KEY,
	[ItemName] nvarchar(max) NOT NULL,
	[ItemNameEN] nvarchar(max) NULL,
	[ItemImg] image NULL,
	[FK_ItemDetailId] int FOREIGN KEY REFERENCES [dbo].[ItemDetail]([ItemDetailId]) NULL UNIQUE
)

CREATE TABLE [dbo].[ItemClassSetting] (
    [ItemClassSettingId] int IDENTITY(1,1) PRIMARY KEY,
    [FK_ItemId] int FOREIGN KEY REFERENCES [dbo].[Item]([ItemId]) NOT NULL,
    [FK_ClassId] int FOREIGN KEY REFERENCES [dbo].[Class]([ClassId]) NOT NULL,
	CONSTRAINT [uq_ClassItem] UNIQUE NONCLUSTERED ( [FK_ItemId], [FK_ClassId] ) ON [PRIMARY]
)

CREATE TABLE [dbo].[ItemBossSetting] (
    [ItemBossSettingId] int IDENTITY(1,1) PRIMARY KEY,
    [FK_ItemId] int FOREIGN KEY REFERENCES [dbo].[Item]([ItemId]) NOT NULL,
    [FK_BossId] int FOREIGN KEY REFERENCES [dbo].[Boss]([BossId]) NOT NULL,
	CONSTRAINT [uq_BossItem] UNIQUE NONCLUSTERED ( [FK_ItemId], [FK_BossId] ) ON [PRIMARY]
)

CREATE TABLE [dbo].[Spec] (
	[SpecId] int IDENTITY(1,1) PRIMARY KEY,
	[SpecName] nvarchar(max) NOT NULL,
	[SpecNameEN] nvarchar(max) NULL,
	[FK_ClassId] int FOREIGN KEY REFERENCES [dbo].[Class]([ClassId]) NOT NULL
)

CREATE TABLE [dbo].[Available] (
	[AvailableId] int IDENTITY(1,1) PRIMARY KEY,
	[FK_SpecId] int FOREIGN KEY REFERENCES [dbo].[Spec]([SpecId]) NOT NULL,
	[FK_ItemId] int FOREIGN KEY REFERENCES [dbo].[Item]([ItemId]) NOT NULL,
	CONSTRAINT [uq_SpecItem] UNIQUE NONCLUSTERED ( [FK_SpecId], [FK_ItemId] ) ON [PRIMARY]
)

CREATE TABLE [dbo].[Faction] (
	[FactionId] int IDENTITY(1,1) PRIMARY KEY,
	[FactionName] nvarchar(max) NOT NULL UNIQUE,
	[FactionNameEN] nvarchar(max) NULL UNIQUE
)

CREATE TABLE [dbo].[Race] (
	[RaceId] int IDENTITY(1,1) PRIMARY KEY,
	[RaceName] nvarchar(max) NOT NULL UNIQUE,
	[RaceNameEN] nvarchar(max) NULL UNIQUE,
	[FK_FactionId] int FOREIGN KEY REFERENCES [dbo].[Faction]([FactionId]) NOT NULL
)

CREATE TABLE [dbo].[ClassRaceSetting] (
    [ClassRaceSettingId] int IDENTITY(1,1) PRIMARY KEY,
    [FK_ClassId] int NOT NULL,
    [FK_RaceId] int NOT NULL,
    FOREIGN KEY (FK_ClassId) REFERENCES [dbo].[Class]([ClassId]) ON DELETE CASCADE,
    FOREIGN KEY (FK_RaceId) REFERENCES [dbo].[Race]([RaceId]) ON DELETE CASCADE,
	CONSTRAINT [uq_ClassRace] UNIQUE NONCLUSTERED ( [FK_ClassId], [FK_RaceId] ) ON [PRIMARY]
)

CREATE TABLE [dbo].[Char] (
	[CharId] int IDENTITY(1,1) PRIMARY KEY,
	[CharName] varchar(max) NOT NULL UNIQUE,
	[FK_UserId] nvarchar(128) FOREIGN KEY REFERENCES [dbo].[Account]([Id]) NOT NULL,
	[FK_RaceId] int FOREIGN KEY REFERENCES [dbo].[Race]([RaceId]) NOT NULL,
	[FK_SpecId] int FOREIGN KEY REFERENCES [dbo].[Spec]([SpecId]) NOT NULL
)

ALTER TABLE [dbo].[Account]
ADD [FK_CharId] int FOREIGN KEY REFERENCES [dbo].[Char]([CharId]) NULL

CREATE TABLE [dbo].[NeedType] (
	[NeedTypeId] int IDENTITY(1,1) PRIMARY KEY,
	[NeedTypeName] varchar(max) NOT NULL UNIQUE
)

CREATE TABLE [dbo].[Priority] (
	[PriorityId] int IDENTITY(1,1) PRIMARY KEY,
	[PriorityName] varchar(max) NOT NULL UNIQUE
)

CREATE TABLE [dbo].[Need] (
	[NeedId] int IDENTITY(1,1) PRIMARY KEY,
	[FK_CharId] int FOREIGN KEY REFERENCES [dbo].[Char]([CharId]) NOT NULL,
	[FK_AvailableId] int FOREIGN KEY REFERENCES [dbo].[Available]([AvailableId]) NOT NULL,
	[FK_NeedTypeId] int FOREIGN KEY REFERENCES [dbo].[NeedType]([NeedTypeId]) NOT NULL,
	[FK_PriorityId] int FOREIGN KEY REFERENCES [dbo].[Priority]([PriorityId]) NOT NULL,
	CONSTRAINT [uq_CharAvailable] UNIQUE NONCLUSTERED ( [FK_CharId], [FK_AvailableId] ) ON [PRIMARY]
)