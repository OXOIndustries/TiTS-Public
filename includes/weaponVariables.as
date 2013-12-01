
//Hold-out Pistol:
holdOutPistol= new ItemSlotClass();
holdOutPistol.quantity = 1;
//Used on inventory buttons
holdOutPistol.shortName = "Hld.Pistol";
//Regular name
holdOutPistol.longName = "hold-out pistol";
//Longass shit, not sure what used for yet.
holdOutPistol.description = "a hold-out pistol";
//Displayed on tooltips during mouseovers
holdOutPistol.tooltip = "A simple black-powder pistol. It is easy to conceal but does not pack a particularly strong punch, the perfect weapon for a smuggler.";
holdOutPistol.attackVerb = "shoot";
//Information
holdOutPistol.basePrice = 100;
holdOutPistol.attack = 0;
holdOutPistol.damage = 5;
holdOutPistol.damageType = GLOBAL.KINETIC;
holdOutPistol.defense = 0;
holdOutPistol.shieldDefense = 0;
holdOutPistol.shields = 0;
holdOutPistol.sexiness = 0;
holdOutPistol.critBonus = 0;
holdOutPistol.evasion = 0;
holdOutPistol.fortification = 0;
holdOutPistol.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//Eagle Class Handgun:
var eagleClassHandgun:ItemSlotClass = new ItemSlotClass();
eagleClassHandgun.quantity = 1;
//Used on inventory buttons
eagleClassHandgun.shortName = "E.Handgun";
//Regular name
eagleClassHandgun.longName = "eagle handgun";
//Longass shit, not sure what used for yet.
eagleClassHandgun.description = "an eagle handgun";
//Displayed on tooltips during mouseovers
eagleClassHandgun.tooltip = "A large barreled fifty caliber handgun. This particular pistol packs a wallop for such a compact weapon. It's the perfect weapon for a mercenary on the go.";
eagleClassHandgun.attackVerb = "shoot";
//Information
eagleClassHandgun.basePrice = 120;
eagleClassHandgun.attack = 0;
eagleClassHandgun.damage = 7;
eagleClassHandgun.damageType = GLOBAL.KINETIC;
eagleClassHandgun.defense = 0;
eagleClassHandgun.shieldDefense = 0;
eagleClassHandgun.shields = 0;
eagleClassHandgun.sexiness = 0;
eagleClassHandgun.critBonus = 0;
eagleClassHandgun.evasion = 0;
eagleClassHandgun.fortification = 0;
eagleClassHandgun.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//Scoped Pistol
var scopedPistol:ItemSlotClass = new ItemSlotClass();
scopedPistol.quantity = 1;
//Used on inventory buttons
scopedPistol.shortName = "S.Pistol";
//Regular name
scopedPistol.longName = "scoped pistol";
//Longass shit, not sure what used for yet.
scopedPistol.description = "a scoped pistol";
//Displayed on tooltips during mouseovers
scopedPistol.tooltip = "This pistol is equiped with a rather impressive scope of your own manufacture. It's quite accurate but low caliber.";
scopedPistol.attackVerb = "shoot";
//Information
scopedPistol.basePrice = 150;
scopedPistol.attack = 2;
scopedPistol.damage = 4;
scopedPistol.damageType = GLOBAL.KINETIC;
scopedPistol.defense = 0;
scopedPistol.shieldDefense = 0;
scopedPistol.shields = 0;
scopedPistol.sexiness = 0;
scopedPistol.critBonus = 0;
scopedPistol.evasion = 0;
scopedPistol.fortification = 0;
scopedPistol.bonusResistances = new Array(0,0,0,0,0,0,0,0);


//Mk. III Laser Pistol :
var laserPistol:ItemSlotClass = new ItemSlotClass();
laserPistol.quantity = 1;
//Used on inventory buttons
laserPistol.shortName = "LaserPistol";
//Regular name
laserPistol.longName = "mark III laser pistol";
//Longass shit, not sure what used for yet.
laserPistol.description = "a mark III laser pistol";
//Displayed on tooltips during mouseovers
laserPistol.tooltip = "The mark III laser pistol carries many refinements over previous models that make it far less likely to explode than its predecessors. It's the perfect weapon for a tech specialist to start with.";
laserPistol.attackVerb = "shoot";
//Information
laserPistol.basePrice = 150;
laserPistol.attack = 2;
laserPistol.damage = 4;
laserPistol.damageType = GLOBAL.LASER;
laserPistol.defense = 0;
laserPistol.shieldDefense = 0;
laserPistol.shields = 0;
laserPistol.sexiness = 0;
laserPistol.critBonus = 0;
laserPistol.evasion = 0;
laserPistol.fortification = 0;
laserPistol.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//A knife
var knife:ItemSlotClass = new ItemSlotClass();
knife.quantity = 1;
//Used on inventory buttons
knife.shortName = "Knife";
//Regular name
knife.longName = "knife";
//Longass shit, not sure what used for yet.
knife.description = "a knife";
//Displayed on tooltips during mouseovers
knife.tooltip = "A fairly standard knife with a five inch blade. As good for slicing a steak as defending yourself.";
knife.attackVerb = "shoot";
//Information
knife.basePrice = 150;
knife.attack = 0;
knife.damage = 4;
knife.damageType = GLOBAL.PIERCING;
knife.defense = 0;
knife.shieldDefense = 0;
knife.shields = 0;
knife.sexiness = 0;
knife.critBonus = 0;
knife.evasion = 0;
knife.fortification = 0;
knife.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//Dress Clothes
var dressClothes:ItemSlotClass = new ItemSlotClass();
dressClothes.quantity = 1;
//Used on inventory buttons
dressClothes.shortName = "DressClothes";
//Regular name
dressClothes.longName = "dress clothes";
//Longass shit, not sure what used for yet.
dressClothes.description = "a set of dress clothes";
//Displayed on tooltips during mouseovers
dressClothes.tooltip = "This is a fairly standard set of dress clothes, the sort of thing you would wear to a funeral or dinner engagement.";
dressClothes.attackVerb = "null";
//Information
dressClothes.basePrice = 200;
dressClothes.attack = 0;
dressClothes.damage = 0;
dressClothes.damageType = GLOBAL.PIERCING;
dressClothes.defense = 0;
dressClothes.shieldDefense = 0;
dressClothes.shields = 0;
dressClothes.sexiness = 0;
dressClothes.critBonus = 0;
dressClothes.evasion = 0;
dressClothes.fortification = 0;
dressClothes.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//Space Panties
var spacePanties:ItemSlotClass = new ItemSlotClass();
spacePanties.quantity = 1;
//Used on inventory buttons
spacePanties.shortName = "Panties";
//Regular name
spacePanties.longName = "plain panties";
//Longass shit, not sure what used for yet.
spacePanties.description = "a set of plain panties";
//Displayed on tooltips during mouseovers
spacePanties.tooltip = "These plain white panties are rather unremarkable but functional. They are made from ultralastic (patent pending) materials that allow them to stretch over almost anything.";
spacePanties.attackVerb = "null";
//Information
spacePanties.basePrice = 40;
spacePanties.attack = 0;
spacePanties.damage = 0;
spacePanties.damageType = GLOBAL.PIERCING;
spacePanties.defense = 0;
spacePanties.shieldDefense = 0;
spacePanties.shields = 0;
spacePanties.sexiness = 0;
spacePanties.critBonus = 0;
spacePanties.evasion = 0;
spacePanties.fortification = 0;
spacePanties.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//Dress Clothes
var spaceBriefs:ItemSlotClass = new ItemSlotClass();
spaceBriefs.quantity = 1;
//Used on inventory buttons
spaceBriefs.shortName = "SpaceBriefs";
//Regular name
spaceBriefs.longName = "plain briefs";
//Longass shit, not sure what used for yet.
spaceBriefs.description = "a set of plain briefs";
//Displayed on tooltips during mouseovers
spaceBriefs.tooltip = "These plain white briefs are made from ultralastic (patent pending), a material that allows them to stretch over almost everything. They are otherwise unremarkable and comfy.";
spaceBriefs.attackVerb = "null";
//Information
spaceBriefs.basePrice = 40;
spaceBriefs.attack = 0;
spaceBriefs.damage = 0;
spaceBriefs.damageType = GLOBAL.PIERCING;
spaceBriefs.defense = 0;
spaceBriefs.shieldDefense = 0;
spaceBriefs.shields = 0;
spaceBriefs.sexiness = 0;
spaceBriefs.critBonus = 0;
spaceBriefs.evasion = 0;
spaceBriefs.fortification = 0;
spaceBriefs.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//Dress Clothes
var spaceBra:ItemSlotClass = new ItemSlotClass();
spaceBra.quantity = 1;
//Used on inventory buttons
spaceBra.shortName = "Bra";
//Regular name
spaceBra.longName = "plain bra";
//Longass shit, not sure what used for yet.
spaceBra.description = "a plain bra";
//Displayed on tooltips during mouseovers
spaceBra.tooltip = "This bra, while incredibly elastic, is also incredibly plain. It'll accomodate almost any cup size, but it won't win you any points for style.";
spaceBra.attackVerb = "null";
//Information
spaceBra.basePrice = 60;
spaceBra.attack = 0;
spaceBra.damage = 0;
spaceBra.damageType = GLOBAL.PIERCING;
spaceBra.defense = 0;
spaceBra.shieldDefense = 0;
spaceBra.shields = 0;
spaceBra.sexiness = 0;
spaceBra.critBonus = 0;
spaceBra.evasion = 0;
spaceBra.fortification = 0;
spaceBra.bonusResistances = new Array(0,0,0,0,0,0,0,0);

//Dress Clothes
var undershirt:ItemSlotClass = new ItemSlotClass();
undershirt.quantity = 1;
//Used on inventory buttons
undershirt.shortName = "Undershirt";
//Regular name
undershirt.longName = "undershirt";
//Longass shit, not sure what used for yet.
undershirt.description = "an undershirt";
//Displayed on tooltips during mouseovers
undershirt.tooltip = "A pretty standard undershit, this garment breathes wonderfully.";
undershirt.attackVerb = "null";
//Information
undershirt.basePrice = 200;
undershirt.attack = 0;
undershirt.damage = 0;
undershirt.damageType = GLOBAL.PIERCING;
undershirt.defense = 0;
undershirt.shieldDefense = 0;
undershirt.shields = 0;
undershirt.sexiness = 0;
undershirt.critBonus = 0;
undershirt.evasion = 0;
undershirt.fortification = 0;
undershirt.bonusResistances = new Array(0,0,0,0,0,0,0,0);