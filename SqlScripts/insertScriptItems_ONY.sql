/* 
    Items ONY
    (12, '', '', ''),
    1:Ony,2:Luci,3:Magma,4:Gehe,5:Garr,6:Shaz,7:Ged,8:Sulf,9:Gole,10:Majo,11:Ragi,12:Trash
    1:Priest,2:Mage,3:Warlock,4:Rogue,5:Druid,6:Hunter,7:Shaman,8:Warri,9:Pala

	INSERT INTO [schmond].[dbo].[Item] ([ItemId], [ItemName], [ItemNameEN]) VALUES
		('',	''),

	INSERT INTO [schmond].[dbo].[ItemClassSetting] ([FK_ItemId], [FK_ClassId]) VALUES
		(,	),

	INSERT INTO [schmond].[dbo].[ItemBossSetting] ([FK_ItemId], [FK_BossId]) VALUES
		(,	),
		            */
SET IDENTITY_INSERT [schmond].[dbo].[Item] ON
INSERT INTO [schmond].[dbo].[Item] ([ItemId], [ItemName], [ItemNameEN]) VALUES
	(10001,		'Krone des Netherwinds',	'Netherwind Crown'),
	(10002,		'Heiligenschein der Erhabenheit',	'Halo of Transcendence'),
	(10003,		'Schädelkappe der Nemesis',	'Nemesis Skullcap'),
	(10004,		'Sturmgrimms Bedeckung',	'Stormrage Cover'),
	(10005,		'Blutfangkapuze',	'Bloodfang Hood'),
	(10006,		'Helm des Drachenjägers',	'Dragonstalker''s Helm'),
	(10007,		'Helm der zehn Stürme',	'Helmet of Ten Storms'),
	(10008,		'Helm des Zorns',	'Helm of Wrath'),
	(10009,		'Krone des Richturteils',	'Judgement Crown'),
	(10010,		'Sehne eines ausgewachsenen schwarzen Drachen',	'Mature Black Dragon Sinew'),
	(10011,		'Sapphirontuch',	'Sapphiron Drape'),
	(10012,		'Todesbringer',	'Deathbringer'),
	(10013,		'Vis''kag der Blutvergiesser',	'Vis''kag the Bloodletter'),
	(10014,		'Zauberfoliant des uralten Grundsteins',	'Ancient Cornerstone Grimoire'),
	(10015,		'Ring der Bindung',	'Ring of Binding'),
	(10016,		'Splitter der Schuppe',	'Shard of the Scale'),
	(10017,		'Eskhandars Halsband',	'Eskhandar''s Collar'),
	(10018,		'Onyxias Kopf',	'Head of Onyxia')
SET IDENTITY_INSERT [schmond].[dbo].[Item] OFF

--SET IDENTITY_INSERT [schmond].[dbo].[ItemClassSetting] ON
INSERT INTO [schmond].[dbo].[ItemClassSetting] ([FK_ItemId], [FK_ClassId]) VALUES
	(10001,	2),
	(10002,	1),
	(10003,	3),
	(10004,	5),
	(10005,	4),
	(10006,	6),
	(10007,	7),
	(10008,	8),
	(10008,	9),
	(10010,	6)
--SET IDENTITY_INSERT [schmond].[dbo].[ItemClassSetting] OFF

--SET IDENTITY_INSERT [schmond].[dbo].[ItemBossSetting] ON
INSERT INTO [schmond].[dbo].[ItemBossSetting] ([FK_ItemId], [FK_BossId]) VALUES
	(10001,	1),
	(10002,	1),
	(10003,	1),
	(10004,	1),
	(10005,	1),	
	(10006,	1),
	(10007,	1),
	(10008,	1),
	(10009,	1),
	(10010,	1),
	(10011,	1),
	(10012,	1),
	(10013,	1),
	(10014,	1),
	(10015,	1),
	(10016,	1),
	(10017,	1),
	(10018,	1)
--SET IDENTITY_INSERT [schmond].[dbo].[ItemBossSetting] OFF