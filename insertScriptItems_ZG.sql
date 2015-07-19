/* 
    Items ZG

    
    1:Priest,2:Mage,3:Warlock,4:Rogue,5:Druid,6:Hunter,7:Shaman,8:Warri,9:Pala

INSERT INTO [schmond].[dbo].[Item] ([ItemId], [ItemName], [ItemNameEN]) VALUES
	(asdfasdf,		''asdfasdf'',	''asdfasdf''),

INSERT INTO [schmond].[dbo].[ItemClassSetting] ([FK_ItemId], [FK_ClassId]) VALUES
	(asdfasdf,	asdfasdf),

INSERT INTO [schmond].[dbo].[ItemBossSetting] ([FK_ItemId], [FK_BossId]) VALUES
	(asdfasdf,	asdfasdf),
		            */

SET IDENTITY_INSERT [schmond].[dbo].[Item] ON
INSERT INTO [schmond].[dbo].[Item] ([ItemId], [ItemName], [ItemNameEN]) VALUES
	 (30001,	'Arlokks Griff'								,'Arlokk''s Grasp')
	,(30002,	'Arlokks Hoodoostecken'						,'Arlokk''s Hoodoo Stick')
	,(30003,	'Blutgetränkte Schienbeinschützer'			,'Bloodsoaked Greaves')
	,(30004,	'Onyxband des Oberherren'					,'Overlord''s Onyx Band')
	,(30005,	'Pantherbalgsack'							,'Panther Hide Sack')
	,(30006,	'Wille Arlokks'								,'Will of Arlokk')
	,(30007,	'Urzeitliche Hakkariarmsplinte'				,'Primal Hakkari Armsplint')
	,(30008,	'Urzeitliche Hakkaribindungen'				,'Primal Hakkari Bindings')
	,(30009,	'Urzeitlicher Hakkarigurt'					,'Primal Hakkari Girdle')
	,(30010,	'Urzeitliche Hakkarischärpe'				,'Primal Hakkari Sash')
	,(30011,	'Urzeitlicher Hakkarischal'					,'Primal Hakkari Shawl')
	,(30012,	'Urzeitliche Hakkaristütze'					,'Primal Hakkari Stanchion')
	,(30013,	'Urzeitliche Aegis der Hakkari'				,'Primal Hakkari Aegis')
	,(30014,	'Urzeitlicher Hakkarikosak'					,'Primal Hakkari Kossack')
	,(30015,	'Urzeitlicher Hakkariwappenrock'			,'Primal Hakkari Tabard')
	,(30016,	'Forors Augenklappe'						,'Foror''s Eyepatch')
	,(30017,	'Nat Pagles kaputte Spule'					,'Nat Pagle''s Broken Reel')
	,(30018,	'Nat Pagles Fischterminator'				,'Nat Pagle''s Fish Terminator')
	,(30019,	'Tiguels Harpune'							,'Tigule''s Harpoon')
	,(30020,	'Foliant der Verwandlung: Schildkröte'		,'Tome of Polymorph: Turtle')
	,(30021,	'Gri''leks Blut'							,'Gri''lek''s Blood')
	,(30022,	'Grileks Schnitzer'							,'Gri''lek''s Carver')
	,(30023,	'Grileks Schleifer'							,'Gri''lek''s Grinder')
	,(30024,	'Aegis des Blutgotts'						,'Aegis of the Blood God')
	,(30025,	'Uralter Menschentöter der Hakkari'			,'Ancient Hakkari Manslayer')
	,(30026,	'Blutrufer'									,'Bloodcaller')
	,(30027,	'Blutgetränkte Beinplatten'					,'Bloodsoaked Legplates')
	,(30028,	'Umhang der Verzehrung'						,'Cloak of Consumption')
	,(30029,	'Fangzahn des Gesichtslosen'				,'Fang of the Faceless')
	,(30030,	'Zwerggenzerstörer der Gurubashi'			,'Gurubashi Dwarf Destroyer')
	,(30031,	'Herz von Hakkar'							,'Heart of Hakkar')
	,(30032,	'Stulpen des Friedensbewahrers'				,'Peacekeeper Gauntlets')
	,(30033,	'Meeresfurienstulpen'						,'Seafury Gauntlets')
	,(30034,	'Halskette des Seelenverderbers'			,'Soul Corrupter''s Necklace')
	,(30035,	'Das Auge von Hakkar'						,'The Eye of Hakkar')
	,(30036,	'Berührung des Chaos'						,'Touch of Chaos')
	,(30037,	'Kriegsklinge der Hakkari (MH)'				,'Warblade of the Hakkari (MH)')
	,(30038,	'Zin''rokh der Weltenzerstörer'				,'Zin''rokh, Destroyer of Worlds')
	,(30039,	'Feuriger Heimzahler'						,'Fiery Retributer')
	,(30040,	'Hazza''rahs Traumfaden'					,'Hazza''rah''s Dream Thread')
	,(30041,	'Gedankenvernichter'						,'Thoughtblighter')
	,(30042,	'Schiftung des Animisten'					,'Animist''s Spaulders')
	,(30043,	'Jekliks Zermalmer'							,'Jeklik''s Crusher')
	,(30044,	'Jekliks opaliner Talisman'					,'Jeklik''s Opaline Talisman')
	,(30045,	'Stiefel des Friedensbewahrers'				,'Peacekeeper Boots')
	,(30046,	'Band des Primalisten'						,'Primalist''s Band')
	,(30047,	'Meeresfurienstiefel'						,'Seafury Boots')
	,(30048,	'Zulianischer Verteidiger'					,'Zulian Defender')
	,(30049,	'Stiefel des Animisten'						,'Animist''s Boots')
	,(30050,	'Blutdurchnässte Gamaschen'					,'Blooddrenched Leggings')
	,(30051,	'Blutgetränkte Stulpen'						,'Bloodsoaked Gauntlets')
	,(30052,	'Blutbefleckte Beinplatten'					,'Bloodstained Legplates')
	,(30053,	'Blutverschmierte Handschuhe'				,'Bloodtinged Gloves')
	,(30054,	'Jin''dos Beutel der Verdammnis'			,'Jin''do''s Bag of Whammies')
	,(30055,	'Jin''dos Auge des Bösen'					,'Jin''do''s Evil Eye')
	,(30056,	'Jin''dos Verhexer'							,'Jin''do''s Hexxer')
	,(30057,	'Jin''dos Richturteil'						,'Jin''do''s Judgement')
	,(30058,	'Umarmung des Oberherren'					,'Overlord''s Embrace')
	,(30059,	'Bedeckung des Verhexers'					,'The Hexxer''s Cover')
	,(30060,	'Urzeitlicher Hakkarigötze'					,'Primal Hakkari Idol')
	,(30061,	'Gamaschen des Animisten'					,'Animist''s Leggings')
	,(30062,	'Blutdurchnässter Handschutz'				,'Blooddrenched Grips')
	,(30063,	'Verteidiger des Blutfürsten'				,'Bloodlord''s Defender')
	,(30064,	'Blutgetränkte Schulterstücke'				,'Bloodsoaked Pauldrons')
	,(30065,	'Blutverschmierter Kilt'					,'Bloodtinged Kilt')
	,(30066,	'Göttlicher Hakkariumhang'					,'Hakkari Loa Cloak')
	,(30067,	'Hellebarde der Pein'						,'Halberd of Smiting')
	,(30068,	'Mandokirs Stachel'							,'Mandokir''s Sting')
	,(30069,	'Purpurrotes Band des Oberherren'			,'Overlord''s Crimson Band')
	,(30070,	'Siegel des Primalisten'					,'Primalist''s Seal')
	,(30071,	'Schneller Razzashiraptor'					,'Swift Razzashi Raptor')
	,(30072,	'Kriegsklinge der Hakkari (OH)'				,'Warblade of the Hakkari (OH)')
	,(30073,	'Zanzils Siegel'							,'Zanzil''s Seal')
	,(30074,	'Jins Band'									,'Band of Jin')
	,(30075,	'Blutbefleckte Schienbeinschützer'			,'Bloodstained Greaves')
	,(30076,	'Fliessende Ritualroben'					,'Flowing Ritual Robes')
	,(30077,	'Mar''lis Auge'								,'Mar''li''s Eye')
	,(30078,	'Mar''lis Berührung'						,'Mar''li''s Touch')
	,(30079,	'Talisman des Schutzes'						,'Talisman of Protection')
	,(30080,	'Heugabel des Wahnsinns'					,'Pitchfork of Madness')
	,(30081,	'Renatakis Seelenkanal'						,'Renataki''s Soul Conduit')
	,(30082,	'Renatakis Zahn'							,'Renataki''s Tooth')
	,(30083,	'Band der Knechtschaft'						,'Band of Servitude')
	,(30084,	'Gürtel der unversehrten Kraft'				,'Belt of Untapped Power')
	,(30085,	'Blutdurchnässte Maske'						,'Blooddrenched Mask')
	,(30086,	'Umhang der Hakkarianbeter'					,'Cloak of the Hakkari Worshipers')
	,(30087,	'Handschuhe der Gequälten'					,'Gloves of the Tormented')
	,(30088,	'Macht der Stämme'							,'Might of the Tribe')
	,(30089,	'Opferungsstulpen'							,'Sacrificial Gauntlets')
	,(30090,	'Siegel des Gurubashiberserkers'			,'Seal of the Gurubashi Berserker')
	,(30091,	'Zulianischer Kopfputz'						,'Zulian Headdress')
	,(30092,	'Zulianisches Szepter der Riten'			,'Zulian Scepter of Rites')
	,(30093,	'Stiefel des Verräters'						,'Betrayer''s Boots')
	,(30094,	'Gamaschen des Friedensbewahrers'			,'Peacekeeper Leggings')
	,(30095,	'Rituelle Beinschützer'						,'Ritualistic Legguards')
	,(30096,	'Meeresfuriengamaschen'						,'Seafury Leggings')
	,(30097,	'Siegel von Jin'							,'Seal of Jin')
	,(30098,	'Schneller zulianischer Tiger'				,'Swift Zulian Tiger')
	,(30099,	'Thekals Griff'								,'Thekal''s Grasp')
	,(30100,	'Zulianischer Schnitzler'					,'Zulian Slicer')
	,(30101,	'Helm der Gurubashi'						,'Gurubashi Helm')
	,(30102,	'Szepter der Pein'							,'Sceptre of Smiting')
	,(30103,	'Gürtel aus Schattenpantherbalg'			,'Shadow Panther Hide Belt')
	,(30104,	'Handschuhe aus Schattenpantherbalg'		,'Shadow Panther Hide Gloves')
	,(30105,	'Zulianischer Zeremoniestab'				,'Zulian Ceremonial Staff')
	,(30106,	'Zulianischer Zerhacker'					,'Zulian Hacker')
	,(30107,	'Blutdurchnässte Fusspolster'				,'Blooddrenched Footpads')
	,(30108,	'Fangzahn von Venoxis'						,'Fang of Venoxis')
	,(30109,	'Blutbefleckte runenverzierte Halsberge'	,'Runed Bloodstained Hauberk')
	,(30110,	'Zanzils Band'								,'Zanzil''s Band')
	,(30111,	'Zulianische Steinaxt'						,'Zulian Stone Axe')
	,(30112,	'Zulianischer Tigerbalgumhang'				,'Zulian Tigerhide Cloak')
	,(30113,	'Hoodoojagdbogen'							,'Hoodoo Hunting Bow')
	,(30114,	'Wushoolays Mähne'							,'Wushoolay''s Mane')
	,(30115,	'Wushoolays Schüreisen'						,'Wushoolay''s Poker')
SET IDENTITY_INSERT [schmond].[dbo].[Item] OFF

INSERT INTO [schmond].[dbo].[ItemClassSetting] ([FK_ItemId], [FK_ClassId]) VALUES
	(	30007	,	4	),
	(	30007	,	7	),
	(	30007	,	8	),
	(	30008	,	2	),
	(	30008	,	6	),
	(	30008	,	9	),
	(	30009	,	4	),
	(	30009	,	7	),
	(	30009	,	8	),
	(	30010	,	1	),
	(	30010	,	3	),
	(	30010	,	5	),
	(	30011	,	2	),
	(	30011	,	6	),
	(	30011	,	9	),
	(	30012	,	1	),
	(	30012	,	3	),
	(	30012	,	5	),
	(	30013	,	1	),
	(	30013	,	4	),
	(	30013	,	6	),
	(	30014	,	2	),
	(	30014	,	3	),
	(	30014	,	8	),
	(	30015	,	5	),
	(	30015	,	7	),
	(	30015	,	9	),
	(	30020	,	2	)

INSERT INTO [schmond].[dbo].[ItemBossSetting] ([FK_ItemId], [FK_BossId]) VALUES
	(	30001	,	17	),
	(	30002	,	17	),
	(	30003	,	17	),
	(	30004	,	17	),
	(	30005	,	17	),
	(	30006	,	17	),
	(	30007	,	17	),
	(	30007	,	13	),
	(	30007	,	19	),
	(	30007	,	18	),
	(	30007	,	15	),
	(	30007	,	16	),
	(	30007	,	14	),
	(	30008	,	17	),
	(	30008	,	13	),
	(	30008	,	19	),
	(	30008	,	18	),
	(	30008	,	15	),
	(	30008	,	16	),
	(	30008	,	14	),
	(	30009	,	17	),
	(	30009	,	13	),
	(	30009	,	19	),
	(	30009	,	18	),
	(	30009	,	15	),
	(	30009	,	16	),
	(	30009	,	14	),
	(	30010	,	17	),
	(	30010	,	13	),
	(	30010	,	19	),
	(	30010	,	18	),
	(	30010	,	15	),
	(	30010	,	16	),
	(	30010	,	14	),
	(	30011	,	17	),
	(	30011	,	13	),
	(	30011	,	19	),
	(	30011	,	18	),
	(	30011	,	15	),
	(	30011	,	16	),
	(	30011	,	14	),
	(	30012	,	17	),
	(	30012	,	13	),
	(	30012	,	19	),
	(	30012	,	18	),
	(	30012	,	15	),
	(	30012	,	16	),
	(	30012	,	14	),
	(	30013	,	17	),
	(	30013	,	13	),
	(	30013	,	19	),
	(	30013	,	18	),
	(	30013	,	15	),
	(	30013	,	14	),
	(	30014	,	17	),
	(	30014	,	13	),
	(	30014	,	19	),
	(	30014	,	18	),
	(	30014	,	15	),
	(	30014	,	14	),
	(	30015	,	17	),
	(	30015	,	13	),
	(	30015	,	19	),
	(	30015	,	18	),
	(	30015	,	15	),
	(	30015	,	14	),
	(	30016	,	20	),
	(	30017	,	20	),
	(	30018	,	20	),
	(	30019	,	20	),
	(	30020	,	20	),
	(	30021	,	21	),
	(	30022	,	21	),
	(	30023	,	21	),
	(	30024	,	25	),
	(	30025	,	25	),
	(	30026	,	25	),
	(	30027	,	25	),
	(	30028	,	25	),
	(	30029	,	25	),
	(	30030	,	25	),
	(	30031	,	25	),
	(	30032	,	25	),
	(	30033	,	25	),
	(	30034	,	25	),
	(	30035	,	25	),
	(	30036	,	25	),
	(	30037	,	25	),
	(	30038	,	25	),
	(	30039	,	22	),
	(	30040	,	22	),
	(	30041	,	22	),
	(	30042	,	13	),
	(	30043	,	13	),
	(	30044	,	13	),
	(	30045	,	13	),
	(	30046	,	13	),
	(	30047	,	13	),
	(	30048	,	13	),
	(	30049	,	19	),
	(	30050	,	19	),
	(	30051	,	19	),
	(	30052	,	19	),
	(	30053	,	19	),
	(	30054	,	19	),
	(	30055	,	19	),
	(	30056	,	19	),
	(	30057	,	19	),
	(	30058	,	19	),
	(	30059	,	19	),
	(	30060	,	18	),
	(	30060	,	19	),
	(	30061	,	18	),
	(	30062	,	18	),
	(	30063	,	18	),
	(	30064	,	18	),
	(	30065	,	18	),
	(	30066	,	18	),
	(	30067	,	18	),
	(	30068	,	18	),
	(	30069	,	18	),
	(	30070	,	18	),
	(	30071	,	18	),
	(	30072	,	18	),
	(	30073	,	18	),
	(	30074	,	15	),
	(	30075	,	15	),
	(	30076	,	15	),
	(	30077	,	15	),
	(	30078	,	15	),
	(	30079	,	15	),
	(	30080	,	23	),
	(	30081	,	23	),
	(	30082	,	23	),
	(	30083	,	13	),
	(	30083	,	14	),
	(	30083	,	15	),
	(	30083	,	16	),
	(	30083	,	17	),
	(	30084	,	13	),
	(	30084	,	14	),
	(	30084	,	15	),
	(	30084	,	16	),
	(	30084	,	17	),
	(	30085	,	13	),
	(	30085	,	14	),
	(	30085	,	15	),
	(	30085	,	16	),
	(	30085	,	17	),
	(	30086	,	13	),
	(	30086	,	14	),
	(	30086	,	15	),
	(	30086	,	16	),
	(	30086	,	17	),
	(	30087	,	13	),
	(	30087	,	14	),
	(	30087	,	15	),
	(	30087	,	16	),
	(	30087	,	17	),
	(	30088	,	13	),
	(	30088	,	14	),
	(	30088	,	15	),
	(	30088	,	16	),
	(	30088	,	17	),
	(	30089	,	13	),
	(	30089	,	14	),
	(	30089	,	15	),
	(	30089	,	16	),
	(	30089	,	17	),
	(	30090	,	13	),
	(	30090	,	14	),
	(	30090	,	15	),
	(	30090	,	16	),
	(	30090	,	17	),
	(	30091	,	13	),
	(	30091	,	14	),
	(	30091	,	15	),
	(	30091	,	16	),
	(	30091	,	17	),
	(	30092	,	13	),
	(	30092	,	14	),
	(	30092	,	15	),
	(	30092	,	16	),
	(	30092	,	17	),
	(	30093	,	16	),
	(	30094	,	16	),
	(	30095	,	16	),
	(	30096	,	16	),
	(	30097	,	16	),
	(	30098	,	16	),
	(	30099	,	16	),
	(	30100	,	16	),
	(	30101	,	26	),
	(	30102	,	26	),
	(	30103	,	26	),
	(	30104	,	26	),
	(	30105	,	26	),
	(	30106	,	26	),
	(	30107	,	14	),
	(	30108	,	14	),
	(	30109	,	14	),
	(	30110	,	14	),
	(	30111	,	14	),
	(	30112	,	14	),
	(	30113	,	24	),
	(	30114	,	24	),
	(	30115	,	24	)


