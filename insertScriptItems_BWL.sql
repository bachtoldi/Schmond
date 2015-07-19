/* 
    Items BWL
		            */

SET IDENTITY_INSERT [schmond].[dbo].[Item] ON
INSERT INTO [schmond].[dbo].[Item] ([ItemId], [ItemName], [ItemNameEN]) VALUES
	 (30001,	'Arlokks Griff'								,'Arlokk''s Grasp')

SET IDENTITY_INSERT [schmond].[dbo].[Item] OFF

INSERT INTO [schmond].[dbo].[ItemClassSetting] ([FK_ItemId], [FK_ClassId]) VALUES
	(	30007	,	4	),


INSERT INTO [schmond].[dbo].[ItemBossSetting] ([FK_ItemId], [FK_BossId]) VALUES
	(	30001	,	17	),
