﻿INSERT INTO [Account] (Id,Email,EmailConfirmed,PasswordHash,SecurityStamp,PhoneNumber,PhoneNumberConfirmed,TwoFactorEnabled,LockoutEndDateUtc,LockoutEnabled,AccessFailedCount,UserName,FK_CharId)
VALUES ('063b483e-6408-44e3-8fec-1466f48f43b9','Admin@Legion-Gilde.de',0,'AHoyu/CzirxOp4nmY51gkUdpzBOD4JQwn/0pfsrRmkeGqCNnUF5lmTTmsCQze3/eHQ==','516c4dd4-c938-483b-8b40-42d1ae74ea44',NULL,0,0,NULL,0,0,'Admin', NULL)

INSERT INTO [Role] (Id, Name) VALUES ('DED7D181-7575-40F2-8734-4BC1FAB55131', 'Administrator')

INSERT INTO [UserHasRole] (UserId, RoleId) VALUES ('063b483e-6408-44e3-8fec-1466f48f43b9', 'DED7D181-7575-40F2-8734-4BC1FAB55131')