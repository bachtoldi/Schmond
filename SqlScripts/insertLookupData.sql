/*
SET IDENTITY_INSERT tablename ON // Identity selber einfügen
SET IDENTITY_INSERT tablename OFF // AI
*/

/*
	Instance Table
						*/

SET IDENTITY_INSERT [schmond].[dbo].[Instance] ON
INSERT INTO [schmond].[dbo].[Instance] ([InstanceId], [InstanceSort], [InstanceName], [InstanceNameEN]) VALUES
	(1, 1,	'Onyxias Hort',				'Onyxia''s Lair'),
	(2, 2,	'Geschmolzener Kern',		'Molten Core'),
	(3, 3,	'Zul''Gurub',				'Zul''Gurub'),
	(4, 4,	'Pechschwingenhort',		'Blackwinglair'),
	(5, 5,	'Ruinen von Ahn''Qiraj',	'Ruins of Ahn''Qiraj'),
	(6, 6,	'Tempel von Ahn''Qiraj',	'Temple of Ahn''Qiraj'),
	(7, 7,	'Naxxramas',				'Naxxramas'),
	(8, 8,	'Weltbosse',				'World Bosses')
SET IDENTITY_INSERT [schmond].[dbo].[Instance] OFF
	
/*
	Boss Table
						*/

SET IDENTITY_INSERT [schmond].[dbo].[Boss] ON
INSERT INTO [schmond].[dbo].[Boss] ([BossId], [FK_InstanceId], [BossNumber], [BossName], [BossNameEN]) VALUES
	(1,		1,		1,		'Onyxia', 'Onyxia'),

	(2,		2,		1,		'Lucifron',						'Lucifron'),
	(3,		2,		2,		'Magmadar',						'Magmadar'),
	(4,		2,		3,		'Gehennas',						'Gehennas'),
	(5,		2,		4,		'Garr',							'Garr'),
	(6,		2,		5,		'Shazzrah',						'Shazzrah'),
	(7,		2,		6,		'Baron Geddon',					'Baron Geddon'),
	(8,		2,		7,		'Sulfuronherold',				'Sulfuron Herold'),
	(9,		2,		8,		'Golemagg der Verbrenner',		'Golemagg the Incinerator'),
	(10,	2,		9,		'Majordomus Exekutus',			'Majordomo Executus'),
	(11,	2,		10,		'Ragnaros',						'Ragnaros'),
	(12,	2,		11,		'Trash',						'Trash'),

	(13,	3,		1,		'Hohepriesterin Jeklik',		'High Priestess Jeklik'),
	(14,	3,		2,		'Hohepriester Venoxis',			'High Priest Venoxis'),
	(15,	3,		3,		'Hohepriesterin Mar''li',		'High Priestess Mar''li'),
	(16,	3,		4,		'Hohepriester Thekal',			'High Priest Thekal'),
	(17,	3,		5,		'Hohepriesterin Arlokk',		'High Priestess Arlokk'),
	(18,	3,		6,		'Blutfürst Mandokir',			'Bloodlord Mandokir'),
	(19,	3,		7,		'Jin''do der Verhexer',			'Jin''do the Hexxer'),
	(20,	3,		8,		'Gahz''ranka',					'Gahz''ranka'),
	(21,	3,		9,		'Edge of Madness',				'Edge of Madness'),
	(25,	3,		10,		'Hakkar',						'Hakkar the Soulflayer'),
	(26,	3,		11,		'Trash',						'Trash'),
	
	(27,	4,		1,		'Feuerkralle der Ungezähmte',	'Razorgore the Untamed'),
	(28,	4,		2,		'Vaelastrasz',					'Vaelastrasz the Corrupt'),
	(29,	4,		3,		'Brutwächter Dreschbringer',	'Broodlord Lashlayer'),
	(30,	4,		4,		'Feuerschwinge',				'Flamegor'),
	(31,	4,		5,		'Schattenschwinge',				'Ebonroc'),
	(32,	4,		6,		'Flammenmaul',					'Firemaw'),
	(33,	4,		7,		'Chromagus',					'Chromaggus'),
	(34,	4,		8,		'Nefarian',						'Nefarian'),
	(35,	4,		9,		'Trash',						'Trash'),
	
	(36,	5,		1,		'Kurinnaxx',					'Kurinnaxx'),
	(37,	5,		2,		'General Rajaxx',				'General Rajaxx'),
	(38,	5,		3,		'Moam',							'Moam'),
	(39,	5,		4,		'Buru der Verschlinger',		'Buru the Gorger'),
	(40,	5,		5,		'Ayamiss der Jäger',			'Ayamiss the Hunter'),
	(41,	5,		6,		'Ossirian der Narbenlose',		'Ossirian the Unscarred'),
	(42,	5,		7,		'Trash',						'Trash'),
	
	(43,	6,		1,		'Der Prophet Skeram',			'The Prophet Skeram'),
	(44,	6,		2,		'Adel der Silithiden',			'Silithid Royalty'),
	(47,	6,		3,		'Schlachtwache Sartura',		'Battleguard Sartura'),
	(48,	6,		4,		'Fankriss der Unnachgiebige',	'Fankriss the Unyielding'),
	(49,	6,		5,		'Viscidus',						'Viscidus'),
	(50,	6,		6,		'Prinzessin Huhuran',			'Princess Huhuran'),
	(51,	6,		7,		'Zwilingsimperatoren',			'The Twin Emperors'),
	(53,	6,		8,		'Ouro',							'Ouro'),
	(54,	6,		9,		'C''Thun',						'C''Thun'),
	(55,	6,		10,		'Trash',						'Trash'),

	(56,	7,		1,		'Anub''Rekhan',					'Anub''Rekhan'),
	(57,	7,		2,		'Großwitwe Faerlina',			'Grand Widow Faerlina'),
	(58,	7,		3,		'Maexxna',						'Maexxna'),
	(59,	7,		4,		'Noth der Seuchenfürst',		'Noth the Plaguebringer'),
	(60,	7,		5,		'Heigan der Unreine',			'Heigan the Unclean'),
	(61,	7,		6,		'Loatheb',						'Loatheb'),
	(62,	7,		7,		'Instrukteur Razuvious',		'Instructor Razuvious'),
	(63,	7,		8,		'Gothik der Seelenjäger',		'Gothik the Harvester'),
	(64,	7,		9,		'Die vier Reiter',				'The Four Horsemen'),
	(65,	7,		10,		'Flickwerk',					'Patchwerk'),
	(66,	7,		11,		'Grobbulus',					'Grobbulus'),
	(67,	7,		12,		'Gluth',						'Gluth'),
	(68,	7,		13,		'Thaddius',						'Thaddius'),
	(69,	7,		14,		'Saphiron',						'Sapphiron'),
	(70,	7,		15,		'Kel''Thuzad',					'Kel''Thuzad'),
	(71,	7,		16,		'Trash',						'Trash'),

    (72,    8,      1,      'Kazzak',                       'Kazzak'),
    (73,    8,      2,      'Azuregos',                     'Azuregos'),
    (74,    8,      3,      'Ysondre',                      'Ysondre'),
    (75,    8,      4,      'Lethon',                       'Lethon'),
    (76,    8,      5,      'Taerar',                       'Taerar'),
    (77,    8,      6,      'Emeriss',                      'Emeriss')
SET IDENTITY_INSERT [schmond].[dbo].[Boss] OFF

 /*
  Class Table
        */

SET IDENTITY_INSERT [schmond].[dbo].[Class] ON
INSERT INTO [schmond].[dbo].[Class] ([ClassId], [ClassName], [ClassNameEN]) VALUES
	(1, 'Priester',		'Priest'),
	(2, 'Magier',		'Mage'),
	(3, 'Hexenmeister',	'Warlock'),
	(4, 'Schurke',		'Rogue'),
	(5, 'Druide',		'Druid'),
	(6, 'Jäger',		'Hunter'),
	(7, 'Schamane',		'Shaman'),
	(8, 'Krieger',		'Warrior'),
	(9, 'Paladin',		'Paladin')
SET IDENTITY_INSERT [schmond].[dbo].[Class] OFF

/*
 Spec Table
      */

SET IDENTITY_INSERT [schmond].[dbo].[Spec] ON
INSERT INTO [schmond].[dbo].[Spec] ([SpecId], [FK_ClassId], [SpecName], [SpecNameEN]) VALUES
 (2,  1, 'Disziplin',			'Discipline'),
 (1,  1, 'Heilig',				'Holy'),
 (3,  1, 'Schatten',			'Shadow'),
 
 (6,  2, 'Arkan',				'Arcane'),
 (5,  2, 'Feuer',				'Fire'),
 (4,  2, 'Frost',				'Frost'),

 (7,  3, 'Gebrechen',			'Affliction'),
 (9,  3, 'Dämonologie',			'Demonology'),
 (8,  3, 'Zerstörung',			'Destruction'),

 (12, 4, 'Kampf - Dolch',			'Combat/Dagger'),
 (10, 4, 'Kampf - Schwert',				'Combat/Sword'),
 (11, 4, 'Blutsturz',			'Hemo'),
 (28, 4, '30/0/21',			'SealFate-Hemo'),
 (28, 4, '30/21/0',			'SealFate-Combat'),
 
 (14, 5, 'Gleichgewicht',		'Balance'),
 (13, 5, 'Wilder Kampf',		'Feral'),
 (15, 5, 'Wiederherstellung',	'Restoration'),
 
 (18, 6, 'Tierherrschaft',		'Beast Mastery'),
 (17, 6, 'Treffsicherheit',		'Marksmanship'),
 (16, 6, 'Überleben',			'Survival'),
 
 (21, 7, 'Elementar',			'Elemental'),
 (20, 7, 'Verstärkung',			'Enhancement'),
 (19, 7, 'Wiederherstellung',	'Restoration'),
 
 (23, 8, 'Waffen',				'Arms'),
 (24, 8, 'Furor',				'Fury'),
 (22, 8, 'Schutz',				'Protection'),

 (25, 9, 'Heilig',				'Holy'),
 (26, 9, 'Schutz',				'Protection'),
 (27, 9, 'Vergeltung',			'Retribution')
SET IDENTITY_INSERT [schmond].[dbo].[Spec] OFF

/*
 Faction Table
       */

SET IDENTITY_INSERT [schmond].[dbo].[Faction] ON
INSERT INTO [schmond].[dbo].[Faction] ([FactionId], [FactionName], [FactionNameEN]) VALUES
 (1, 'Allianz',	'Alliance'),
 (2, 'Horde',	'Horde')
SET IDENTITY_INSERT [schmond].[dbo].[Faction] OFF

/* 
 Race Table
      */

SET IDENTITY_INSERT [schmond].[dbo].[Race] ON
INSERT INTO [schmond].[dbo].[Race] ([RaceId], [FK_FactionId], [RaceName], [RaceNameEN]) VALUES
 (1,	1,	'Gnom',		'Gnome'),
 (2,	1,	'Zwerg',	'Dwarf'),
 (3,	1,	'Mensch',	'Human'),
 (4,	1,	'Nachtelf',	'Nightelf'),
 (5,	2,	'Untot',	'Undead'),
 (6,	2,	'Ork',		'Orc'),
 (7,	2,	'Troll',	'Troll'),
 (8,	2,	'Taure',	'Tauren')
SET IDENTITY_INSERT [schmond].[dbo].[Race] OFF

/*
    ClassRaceSetting Table
        */

INSERT INTO [schmond].[dbo].[ClassRaceSetting] ([FK_ClassId], [FK_RaceId]) VALUES
    (1,2),(1,3),(1,4),(1,5),(1,7),
    (2,1),(2,3),(2,5),(2,7),
    (3,1),(3,3),(3,5),(3,6),
    (4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),
    (5,4),(5,8),
    (6,2),(6,4),(6,6),(6,7),(6,8),
    (7,6),(7,7),(7,8),
    (8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),
    (9,2),(9,3)

/* NeedType Table
      */

SET IDENTITY_INSERT [schmond].[dbo].[NeedType] ON
INSERT INTO [schmond].[dbo].[NeedType] ([NeedTypeId], [NeedTypeName]) VALUES
 (1, 'Main Need'),
 (2, 'Second Need'),
 (3, 'No Need'),
 (4, 'Own')
SET IDENTITY_INSERT [schmond].[dbo].[NeedType] OFF

/* 
 Priorities Table
       */

SET IDENTITY_INSERT [schmond].[dbo].[Priority] ON
INSERT INTO [schmond].[dbo].[Priority] ([PriorityId], [PriorityName]) VALUES
 (1,	'Höchste'),
 (2,	'Höher'),
 (3,	'Hoch'),
 (4,	'Mittel-Hoch'),
 (5,	'Mittel'),
 (6,	'Mittel'),
 (7,	'Mittel-Niedrig'),
 (8,	'Niedrig'),
 (9,	'Niedriger'),
 (10,	'Niedrigste')
SET IDENTITY_INSERT [schmond].[dbo].[Priority] OFF

