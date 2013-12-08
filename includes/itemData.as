
private function initializeItems():void
{
	trace("Move this shit to a dictionary or object for proper storage");
	items = new Object();

	//Hold-out Pistol:
	//0
	items["0"] = new ItemSlotClass();
	//items["0"].indexNumber = 0;
	items["0"].quantity = 1;
	items["0"].stackSize = 1;
	items["0"].type = GLOBAL.RANGED_WEAPON;
	//Used on inventory buttons
	items["0"].shortName = "Hld.Pistol";
	//Regular name
	items["0"].longName = "hold-out pistol";
	//Longass shit, not sure what used for yet.
	items["0"].description = "a hold-out pistol";
	//Displayed on tooltips during mouseovers
	items["0"].tooltip = "A simple black-powder pistol. It is easy to conceal but does not pack a particularly strong punch, the perfect weapon for a smuggler.";
	items["0"].attackVerb = "shoot";
	//Information
	items["0"].basePrice = 100;
	items["0"].attack = 0;
	items["0"].damage = 5;
	items["0"].damageType = GLOBAL.KINETIC;
	items["0"].defense = 0;
	items["0"].shieldDefense = 0;
	items["0"].shields = 0;
	items["0"].sexiness = 0;
	items["0"].critBonus = 0;
	items["0"].evasion = 0;
	items["0"].fortification = 0;
	items["0"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Eagle Class Handgun:
	//1
	items["1"] = new ItemSlotClass();
	//items["1"].indexNumber = 1;
	items["1"].quantity = 1;
	items["1"].stackSize = 1;
	items["1"].type = GLOBAL.RANGED_WEAPON;
	//Used on inventory buttons
	items["1"].shortName = "E.Handgun";
	//Regular name
	items["1"].longName = "eagle handgun";
	//Longass shit, not sure what used for yet.
	items["1"].description = "an eagle handgun";
	//Displayed on tooltips during mouseovers
	items["1"].tooltip = "A large barreled fifty caliber handgun. This particular pistol packs a wallop for such a compact weapon. It's the perfect weapon for a mercenary on the go.";
	items["1"].attackVerb = "shoot";
	//Information
	items["1"].basePrice = 120;
	items["1"].attack = 0;
	items["1"].damage = 7;
	items["1"].damageType = GLOBAL.KINETIC;
	items["1"].defense = 0;
	items["1"].shieldDefense = 0;
	items["1"].shields = 0;
	items["1"].sexiness = 0;
	items["1"].critBonus = 0;
	items["1"].evasion = 0;
	items["1"].fortification = 0;
	items["1"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Scoped Pistol
	//2
	items["2"] = new ItemSlotClass();
	//items["2"].indexNumber = 2;
	items["2"].quantity = 1;
	items["2"].stackSize = 1;
	items["2"].type = GLOBAL.RANGED_WEAPON;
	//Used on inventory buttons
	items["2"].shortName = "S.Pistol";
	//Regular name
	items["2"].longName = "scoped pistol";
	//Longass shit, not sure what used for yet.
	items["2"].description = "a scoped pistol";
	//Displayed on tooltips during mouseovers
	items["2"].tooltip = "This pistol is equiped with a rather impressive scope of your own manufacture. It's quite accurate but low caliber.";
	items["2"].attackVerb = "shoot";
	//Information
	items["2"].basePrice = 150;
	items["2"].attack = 2;
	items["2"].damage = 4;
	items["2"].damageType = GLOBAL.KINETIC;
	items["2"].defense = 0;
	items["2"].shieldDefense = 0;
	items["2"].shields = 0;
	items["2"].sexiness = 0;
	items["2"].critBonus = 0;
	items["2"].evasion = 0;
	items["2"].fortification = 0;
	items["2"].bonusResistances = new Array(0,0,0,0,0,0,0,0);


	//Mk. III Laser Pistol :
	//3
	items["3"] = new ItemSlotClass();
	//items["3"].indexNumber = 3;
	items["3"].quantity = 1;
	items["3"].stackSize = 1;
	items["3"].type = GLOBAL.RANGED_WEAPON;
	//Used on inventory buttons
	items["3"].shortName = "LaserPistol";
	//Regular name
	items["3"].longName = "mark III laser pistol";
	//Longass shit, not sure what used for yet.
	items["3"].description = "a mark III laser pistol";
	//Displayed on tooltips during mouseovers
	items["3"].tooltip = "The mark III laser pistol carries many refinements over previous models that make it far less likely to explode than its predecessors. It's the perfect weapon for a tech specialist to start with.";
	items["3"].attackVerb = "shoot";
	//Information
	items["3"].basePrice = 150;
	items["3"].attack = 2;
	items["3"].damage = 4;
	items["3"].damageType = GLOBAL.LASER;
	items["3"].defense = 0;
	items["3"].shieldDefense = 0;
	items["3"].shields = 0;
	items["3"].sexiness = 0;
	items["3"].critBonus = 0;
	items["3"].evasion = 0;
	items["3"].fortification = 0;
	items["3"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//A KNIFE
	//4
	items["4"] = new ItemSlotClass();
	//items["4"].indexNumber = 4;
	items["4"].quantity = 1;
	items["4"].stackSize = 1;
	items["4"].type = GLOBAL.MELEE_WEAPON;
	//Used on inventory buttons
	items["4"].shortName = "knife";
	//Regular name
	items["4"].longName = "knife";
	//Longass shit, not sure what used for yet.
	items["4"].description = "a knife";
	//Displayed on tooltips during mouseovers
	items["4"].tooltip = "A fairly standard knife with a five inch blade. As good for slicing a steak as defending yourself.";
	items["4"].attackVerb = "shoot";
	//Information
	items["4"].basePrice = 150;
	items["4"].attack = 0;
	items["4"].damage = 4;
	items["4"].damageType = GLOBAL.PIERCING;
	items["4"].defense = 0;
	items["4"].shieldDefense = 0;
	items["4"].shields = 0;
	items["4"].sexiness = 0;
	items["4"].critBonus = 0;
	items["4"].evasion = 0;
	items["4"].fortification = 0;
	items["4"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//A Rock
	//5
	items["5"] = new ItemSlotClass();
	//items["5"].indexNumber = 5;
	items["5"].quantity = 1;
	items["5"].stackSize = 1;
	items["5"].type = GLOBAL.MELEE_WEAPON;
	//Used on inventory buttons
	items["5"].shortName = "Rock";
	//Regular name
	items["5"].longName = "rock";
	//Longass shit, not sure what used for yet.
	items["5"].description = "a rock";
	//Displayed on tooltips during mouseovers
	items["5"].tooltip = "You can pretty much find a rock anywhere, and they hurt more than fists, sooooo.";
	items["5"].attackVerb = "smack";
	//Information
	items["5"].basePrice = 0;
	items["5"].attack = 0;
	items["5"].damage = 0;
	items["5"].damageType = GLOBAL.KINETIC;
	items["5"].defense = 0;
	items["5"].shieldDefense = 0;
	items["5"].shields = 0;
	items["5"].sexiness = 0;
	items["5"].critBonus = 0;
	items["5"].evasion = 0;
	items["5"].fortification = 0;
	items["5"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Nothing
	//6
	items["6"] = new ItemSlotClass();
	//items["6"].indexNumber = 6;
	items["6"].quantity = 1;
	items["6"].stackSize = 1;
	items["6"].type = GLOBAL.ARMOR;
	//Used on inventory buttons
	items["6"].shortName = "";
	//Regular name
	items["6"].longName = "nothing";
	//Longass shit, not sure what used for yet.
	items["6"].description = "nothing";
	//Displayed on tooltips during mouseovers
	items["6"].tooltip = "You aren't wearing anything in this equipment slot... at all.";
	items["6"].attackVerb = "";
	//Information
	items["6"].basePrice = 0;
	items["6"].attack = 0;
	items["6"].damage = 0;
	items["6"].damageType = GLOBAL.KINETIC;
	items["6"].defense = 0;
	items["6"].shieldDefense = 0;
	items["6"].shields = 0;
	items["6"].sexiness = 0;
	items["6"].critBonus = 0;
	items["6"].evasion = 0;
	items["6"].fortification = 0;
	items["6"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Dress Clothes
	//7
	items["7"] = new ItemSlotClass();
	//items["7"].indexNumber = 7;
	items["7"].quantity = 1;
	items["7"].stackSize = 1;
	items["7"].type = GLOBAL.ARMOR;
	//Used on inventory buttons
	items["7"].shortName = "DressCloth";
	//Regular name
	items["7"].longName = "dress clothes";
	//Longass shit, not sure what used for yet.
	items["7"].description = "a set of dress clothes";
	//Displayed on tooltips during mouseovers
	items["7"].tooltip = "This is a fairly standard set of dress clothes, the sort of thing you would wear to a funeral or dinner engagement.";
	items["7"].attackVerb = "null";
	//Information
	items["7"].basePrice = 200;
	items["7"].attack = 0;
	items["7"].damage = 0;
	items["7"].damageType = GLOBAL.PIERCING;
	items["7"].defense = 0;
	items["7"].shieldDefense = 0;
	items["7"].shields = 0;
	items["7"].sexiness = 0;
	items["7"].critBonus = 0;
	items["7"].evasion = 0;
	items["7"].fortification = 0;
	items["7"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Space Panties
	//8
	// PANTIES..... IN...... SPAAAAAAAAAAAAACCCCCCCCCEEEEEEEEEEEEEEEEEEEE
	items["8"] = new ItemSlotClass();
	//items["8"].indexNumber = 8;
	items["8"].quantity = 1;
	items["8"].stackSize = 1;
	items["8"].type = GLOBAL.LOWER_UNDERGARMENT;
	//Used on inventory buttons
	items["8"].shortName = "Panties";
	//Regular name
	items["8"].longName = "plain panties";
	//Longass shit, not sure what used for yet.
	items["8"].description = "a set of plain panties";
	//Displayed on tooltips during mouseovers
	items["8"].tooltip = "These plain white panties are rather unremarkable but functional. They are made from ultralastic (patent pending) materials that allow them to stretch over almost anything.";
	items["8"].attackVerb = "null";
	//Information
	items["8"].basePrice = 40;
	items["8"].attack = 0;
	items["8"].damage = 0;
	items["8"].damageType = GLOBAL.PIERCING;
	items["8"].defense = 0;
	items["8"].shieldDefense = 0;
	items["8"].shields = 0;
	items["8"].sexiness = 0;
	items["8"].critBonus = 0;
	items["8"].evasion = 0;
	items["8"].fortification = 0;
	items["8"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Plain Briefs
	//9
	items["9"] = new ItemSlotClass();
	//items["9"].indexNumber = 9;
	items["9"].quantity = 1;
	items["9"].stackSize = 1;
	items["9"].type = GLOBAL.LOWER_UNDERGARMENT;
	//Used on inventory buttons
	items["9"].shortName = "Briefs";
	//Regular name
	items["9"].longName = "plain briefs";
	//Longass shit, not sure what used for yet.
	items["9"].description = "a set of plain briefs";
	//Displayed on tooltips during mouseovers
	items["9"].tooltip = "These plain white briefs are made from ultralastic (patent pending), a material that allows them to stretch over almost everything. They are otherwise unremarkable and comfy.";
	items["9"].attackVerb = "null";
	//Information
	items["9"].basePrice = 40;
	items["9"].attack = 0;
	items["9"].damage = 0;
	items["9"].damageType = GLOBAL.PIERCING;
	items["9"].defense = 0;
	items["9"].shieldDefense = 0;
	items["9"].shields = 0;
	items["9"].sexiness = 0;
	items["9"].critBonus = 0;
	items["9"].evasion = 0;
	items["9"].fortification = 0;
	items["9"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Bra
	//10
	items["10"] = new ItemSlotClass();
	//items["10"].indexNumber = 10;
	items["10"].quantity = 1;
	items["10"].stackSize = 1;
	items["10"].type = GLOBAL.UPPER_UNDERGARMENT;
	//Used on inventory buttons
	items["10"].shortName = "Bra";
	//Regular name
	items["10"].longName = "plain bra";
	//Longass shit, not sure what used for yet.
	items["10"].description = "a plain bra";
	//Displayed on tooltips during mouseovers
	items["10"].tooltip = "This bra, while incredibly elastic, is also incredibly plain. It'll accomodate almost any cup size, but it won't win you any points for style.";
	items["10"].attackVerb = "null";
	//Information
	items["10"].basePrice = 60;
	items["10"].attack = 0;
	items["10"].damage = 0;
	items["10"].damageType = GLOBAL.PIERCING;
	items["10"].defense = 0;
	items["10"].shieldDefense = 0;
	items["10"].shields = 0;
	items["10"].sexiness = 0;
	items["10"].critBonus = 0;
	items["10"].evasion = 0;
	items["10"].fortification = 0;
	items["10"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Undershirt
	//11
	items["11"] = new ItemSlotClass();
	//items["11"].indexNumber = 11;
	items["11"].quantity = 1;
	items["11"].stackSize = 1;
	items["11"].type = GLOBAL.UPPER_UNDERGARMENT;
	//Used on inventory buttons
	items["11"].shortName = "Undershirt";
	//Regular name
	items["11"].longName = "undershirt";
	//Longass shit, not sure what used for yet.
	items["11"].description = "an undershirt";
	//Displayed on tooltips during mouseovers
	items["11"].tooltip = "A pretty standard undershirt, this garment breathes wonderfully.";
	items["11"].attackVerb = "null";
	//Information
	items["11"].basePrice = 200;
	items["11"].attack = 0;
	items["11"].damage = 0;
	items["11"].damageType = GLOBAL.PIERCING;
	items["11"].defense = 0;
	items["11"].shieldDefense = 0;
	items["11"].shields = 0;
	items["11"].sexiness = 0;
	items["11"].critBonus = 0;
	items["11"].evasion = 0;
	items["11"].fortification = 0;
	items["11"].bonusResistances = new Array(0,0,0,0,0,0,0,0);

	//Shield Generator
	//11
	items["12"] = new ItemSlotClass();
	//items["12"].indexNumber = 11;
	items["12"].quantity = 1;
	items["12"].stackSize = 1;
	items["12"].type = GLOBAL.SHIELD;
	//Used in inventory buttons
	items["12"].shortName = "BasicShld";
	//Regular name
	items["12"].longName = "cheap JoyCo shield generator";
	//Longass shit, not sure what used for yet.
	items["12"].description = "a cheap JoyCo shield generator";
	//Displayed on tooltips during mouseovers
	items["12"].tooltip = "A cheap, off-the-shelf shield generator that can be purchased at almost any JoyCo megastore.";
	items["12"].attackVerb = "null";
	//Information
	items["12"].basePrice = 50;
	items["12"].attack = 0;
	items["12"].damage = 0;
	items["12"].damageType = GLOBAL.PIERCING;
	items["12"].defense = 0;
	items["12"].shieldDefense = 0;
	items["12"].shields = 10;
	items["12"].sexiness = 0;
	items["12"].critBonus = 0;
	items["12"].evasion = 0;
	items["12"].fortification = 0;
	items["12"].bonusResistances = new Array(0,0,0,0,0,0,0,0);
}