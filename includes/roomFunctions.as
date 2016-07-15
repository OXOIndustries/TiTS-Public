import classes.Characters.Anno;
import classes.Characters.KQ2BlackVoidGrunt;
import classes.Characters.KQ2SecurityDroid;
import classes.Characters.PlayerCharacter;
import classes.Characters.Saendra;
import classes.Characters.SX1GroupPirates;
import classes.Characters.SX1Shotguard;
import classes.Characters.SX1Techguard;
import classes.Characters.ZilFemale;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Items.Accessories.LightningDuster;
import classes.Items.Apparel.AtmaArmor;
import classes.Items.Apparel.NaleenArmor;
import classes.Items.Apparel.TSTArmorMkII;
import classes.Items.Apparel.UGCUniform;
import classes.Items.Armor.GooArmor;
import classes.Items.Guns.EagleHandgun;
import classes.Items.Guns.Goovolver;
import classes.Items.Guns.HoldOutPistol;
import classes.Items.Guns.LaserPistol;
import classes.Items.Guns.MyrBow;
import classes.Items.Guns.PlasmaPistol;
import classes.Items.Guns.ScopedPistol;
import classes.Items.Guns.TachyonBeamLaser;
import classes.Items.Guns.ZKRifle;
import classes.Items.Melee.ShockBlade;
import classes.Items.Miscellaneous.EMPGrenade;
import classes.Items.Miscellaneous.EmptySlot;
import classes.Items.Miscellaneous.FlashGrenade;
import classes.Items.Miscellaneous.GrayMicrobots;
import classes.Items.Miscellaneous.HorseCock;
import classes.Items.Miscellaneous.LactaidMilkTank;
import classes.Items.Miscellaneous.LactaidOverdrive;
import classes.Items.Miscellaneous.PHAccess;
import classes.Items.Miscellaneous.Pussyblossom;
import classes.Items.Miscellaneous.Silicone;
import classes.Items.Miscellaneous.TestGrenade;
import classes.Items.Miscellaneous.TestHPBooster;
import classes.Items.Miscellaneous.UthraSap;
import classes.Items.Protection.DBGShield;
import classes.Items.Protection.DecentShield;
import classes.Items.Apparel.TSTArmor;
import classes.Items.Accessories.JungleLure;
import classes.Items.Accessories.JungleRepel;
import classes.Items.Transformatives.Bovinium;
import classes.Items.Transformatives.OvirAce;
import classes.Util.RandomInCollection;
import classes.VaginaClass;

public function debugMenus():void
{
	clearMenu();
	output("The room of debug. Where am I? How did I get here? What do you want?!\n\n");
	
	var msg:String = "This is some testing text that I need to pad out the length of the current text line, so that I can see just how dumb some of the functions available for the textfield are."
	
	var m:Array = msg.split(" ");
	
	var someDamage:DamageResult = new DamageResult();
	someDamage.shieldDamage = 9;
	//outputDamage(someDamage);
	
	for (var i:int = 0; i < m.length; i++)
	{
		output(m.slice(0, i).join(" "));
		outputDamage(someDamage);
		output("\n\n");
	}
	
	addButton(1, "AddVag", function():void {
		pc.vaginas.push(new VaginaClass());
	});
	
	// Need the buttons back to test other stuff.
	// NO END OF FUCKING COMPLAINTS I AM FUCKING CALLING IT NOW.
	
	//addButton(0, "Lights Out", startLightsOut, testVictoryFunc);
	
	addButton(0, "GiveMilky", thisIsWhyWeCantHaveNiceThings, undefined, "Give Milky", "Get the Milky perk.");
	
	addButton(9, "ForceError", thisIsWhyWeCantHaveNiceThings, undefined, "Force an Error", "Force an error to test error handling.");
	
	addButton(10, "ShipStorage", thisIsWhyWeCantHaveNiceThings);
	
	addButton(4, "Cashmoney", thisIsWhyWeCantHaveNiceThings, undefined, "Cashmoney", "Sauce says you are TURRIBLE.");
	
	addButton(5, "KeyItems", function():void {
		pc.createKeyItem("F");
		pc.createKeyItem("A");
		pc.createKeyItem("B");
		pc.createKeyItem("G");
		pc.createKeyItem("3");
	});
	
	addButton(6, "Pass Time", thisIsWhyWeCantHaveNiceThings);
}

public function debugMenusTwo():void
{
	clearMenu();
	output("The secondary room of debug. Because we can't have nice things.");
	
	addItemButton(0, new LightningDuster(), function():void {
		output("\n\nLightning Duster.\n");
		
		var foundLootItems:Array = new Array();
		foundLootItems.push(new LightningDuster());
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addItemButton(1, new LactaidMilkTank(), function():void {
		output("\n\10x Milk Tank.\n");
		var ieLMT:LactaidMilkTank = new LactaidMilkTank();
		ieLMT.quantity = 10;
		quickLoot(ieLMT);
	});
	
	addItemButton(2, new LactaidOverdrive(), function():void {
		output("\n\n10x Overdrive.\n");
		var ieLO:LactaidOverdrive = new LactaidOverdrive();
		ieLO.quantity = 10;
		quickLoot(ieLO);
	});
	
	addButton(3, "Goozooka", function(): void {
		output("\n\nGoozooka.\n");
		pc.createKeyItem("Goozooka");
	});
	
	addItemButton(4, new FlashGrenade(), function():void {
		output("\n\nFlashgrenade.\n");
		var sil:FlashGrenade = new FlashGrenade();
		sil.quantity = 5;
		quickLoot(sil);
	});
	
	addItemButton(5, new EMPGrenade, function():void {
		var oa:EMPGrenade = new EMPGrenade();
		oa.quantity = 5;
		
		quickLoot(oa);
	});
	
	addButton(7, "Creds", function():void {
		pc.credits += 100000;
	});
	
	addButton(8, "Exhit", function():void {
		(pc as PlayerCharacter).exhibitionismRaw = 100;
	});
	
	addItemButton(9, new GooArmor(), function():void {
		quickLoot(new GooArmor());
	});
	
	addItemButton(10, new DBGShield(), function():void {
		quickLoot(new DBGShield());
	});
	
	addButton(13, "Test Effect", function():void {
		output("\n\nAdding coloured test effect");
		
		var colors:Array = [ 0xFF0000, 0x00FF00, 0x0000FF, 0x000000, 0xFFFFFF, 0xFFFF00, 0xFF00FF, 0x00FFFF ];
		
		(pc as PlayerCharacter).createStatusEffect("Test Effect " + (rand(1000) + 1), 0, 0, 0, 0, false, "DefenseUp", "A test coloured status effect", false, 600, RandomInCollection(colors));
	});
}

public function debugFuckWithRival():void
{
	rival.short = "Jack/Jill";
}

public function debugMenusThree():void
{
	clearOutput();
	output("Debug combat room.");
	
	addButton(0, "Busts", testBusts);
	addButton(1, "NoBusts", testNoBusts);
	addButton(2, "Others", testOtherBusts);
}

public function testOtherBusts():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters([new KQ2BlackVoidGrunt(), new KQ2BlackVoidGrunt()]);
	CombatManager.victoryScene(function():void { CombatManager.genericVictory(); } );
	CombatManager.lossScene(function():void { CombatManager.genericLoss(); } );
	CombatManager.beginCombat();
}

public function testBusts():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters([new SecurityDroids(), new SecurityDroids()]);
	CombatManager.victoryScene(function():void { CombatManager.genericVictory(); } );
	CombatManager.lossScene(function():void { CombatManager.genericLoss(); } );
	CombatManager.beginCombat();
}

public function testNoBusts():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters([new KQ2SecurityDroid(), new KQ2SecurityDroid()]);
	CombatManager.victoryScene(function():void { CombatManager.genericVictory(); } );
	CombatManager.lossScene(function():void { CombatManager.genericLoss(); } );
	CombatManager.beginCombat();
}

public function testGooT1():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(new CrystalGooT1());
	CombatManager.victoryScene(pcDefeatsCrystalGooToo);
	CombatManager.lossScene(crystalGooPCLoss);
	CombatManager.displayLocation("CRYSTAL GOO");
	
	CombatManager.beginCombat();
}

public function testGooT2():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(new CrystalGooT2());
	CombatManager.victoryScene(pcDefeatsCrystalGooToo);
	CombatManager.lossScene(crystalGooPCLoss);
	CombatManager.displayLocation("CRYSTAL GOO");
	
	CombatManager.beginCombat();
}

public function superTimePassage():void
{
	clearOutput();
	output("Passing 30 days.");
	processTime(60*24*30);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function instaLossTestLust():void
{
	(pc as Creature).lustRaw = pc.lustMax();
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(new ZilFemale());
	CombatManager.victoryScene(pcVsOneEnemyWin);
	CombatManager.lossScene(pcVsOneEnemyLoss);
	CombatManager.displayLocation("INSTANT LOSS LUST");
	
	clearOutput();
	output("INSTANT LOSS LUST");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function pcVsOneEnemy():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters(new SX1GroupPirates());
	CombatManager.victoryScene(pcVsOneEnemyWin);
	CombatManager.lossScene(pcVsOneEnemyLoss);
	CombatManager.displayLocation("1V1 TEST");
	
	clearOutput();
	output("1 vs 1 test fight!");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function pcVsOneEnemyLoss():void
{
	clearOutput();
	output("(1v1) You lost, wakka wakka.");
	CombatManager.genericLoss();
}

public function pcVsOneEnemyWin():void
{
	clearOutput();
	output("(1v1) You won, woo.");
	CombatManager.genericVictory();
}

public function pcVsTwoEnemies():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters(pc);
	CombatManager.setHostileCharacters([new SX1GroupPirates(), new SX1Techguard()]);
	CombatManager.victoryScene(pcVsTwoEnemiesWin);
	CombatManager.lossScene(pcVsTwoEnemiesLoss);
	CombatManager.displayLocation("1V2 TEST");
	
	clearOutput();
	output("1 vs 2 test fight!");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function pcVsTwoEnemiesLoss():void
{
	clearOutput();
	output("(1v2) You lost, wakka wakka.");
	CombatManager.genericLoss();
}

public function pcVsTwoEnemiesWin():void
{
	clearOutput();
	output("(1v2) You won, woo.");
	CombatManager.genericVictory();
}

public function pcPlusAnnoVsOneEnemy():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters([pc, new Anno()]);
	CombatManager.setHostileCharacters(new SX1GroupPirates());
	CombatManager.victoryScene(pcPlusAnnoV1Win);
	CombatManager.lossScene(pcPlusAnnoV1Loss);
	CombatManager.displayLocation("2V1 TEST");
	
	clearOutput();
	output("2 vs 1 test fight!");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function pcPlusAnnoV1Win():void
{
	clearOutput();
	output("(2v1) You won, woo.");
	CombatManager.genericVictory();
}

public function pcPlusAnnoV1Loss():void
{
	clearOutput();
	output("(2v1) You lost, wakka wakka.");
	CombatManager.genericLoss();
}

public function pcPlusAnnoVsTwoEnemies():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters([pc, new Anno()]);
	CombatManager.setHostileCharacters([new SX1GroupPirates(), new SX1Techguard()]);
	CombatManager.victoryScene(pcPlusAnnoV2Win);
	CombatManager.lossScene(pcPlusAnnoV2Loss);
	CombatManager.displayLocation("2V2 TEST");
	
	clearOutput();
	output("2 vs 2 test fight!");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function pcPlusAnnoV2Win():void
{
	clearOutput();
	output("(2v2) You won, woo.");
	CombatManager.genericVictory();
}

public function pcPlusAnnoV2Loss():void
{
	clearOutput();
	output("(2v2) You lost, wakka wakka.");
	CombatManager.genericLoss();
}

public function maximumClusterfuck():void
{
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyCharacters([pc, new Anno(), new Saendra()]);
	CombatManager.setHostileCharacters([new SX1GroupPirates(), new SX1Techguard(), new SX1GroupPirates(), new SX1Shotguard()]);
	CombatManager.victoryScene(fuckfuckfuckWin);
	CombatManager.lossScene(fuckfuckfuckLoss);
	CombatManager.displayLocation("WHARGBL");
	
	clearOutput();
	output("WHARBL");
	clearMenu();
	addButton(0, "Next", CombatManager.beginCombat);
}

public function fuckfuckfuckWin():void
{
	clearOutput();
	output("WHARGBL WIN");
	CombatManager.genericVictory();
}

public function fuckfuckfuckLoss():void
{
	clearOutput();
	output("WHARGBL LOSS");
	CombatManager.genericLoss();
}

public function thisIsWhyWeCantHaveNiceThings():void
{
	clearOutput();
	
	output("This is why we can't have nice things.");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
