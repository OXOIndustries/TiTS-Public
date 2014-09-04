import classes.Characters.PlayerCharacter;
import classes.Items.Apparel.AtmaArmor;
import classes.Items.Apparel.NaleenArmor;
import classes.Items.Apparel.TSTArmorMkII;
import classes.Items.Apparel.UGCUniform;
import classes.Items.Guns.EagleHandgun;
import classes.Items.Guns.Goovolver;
import classes.Items.Guns.HoldOutPistol;
import classes.Items.Guns.LaserPistol;
import classes.Items.Guns.ScopedPistol;
import classes.Items.Guns.ZKRifle;
import classes.Items.Miscellaneous.EmptySlot;
import classes.Items.Miscellaneous.PHAccess;
import classes.Items.Miscellaneous.TestGrenade;
import classes.Items.Miscellaneous.TestHPBooster;
import classes.Items.Miscellaneous.UthraSap;
import classes.Items.Protection.DBGShield;
import classes.Items.Protection.DecentShield;
import classes.Items.Apparel.TSTArmor;
import classes.Items.Accessories.JungleLure;
import classes.Items.Accessories.JungleRepel;
import classes.Util.RandomInCollection;

function mhengaShipHangarFunc():Boolean
{
	if (annoIsCrew() && !syriIsCrew() && flags["ANNOxSYRI_EVENT"] == undefined)
	{
		annoFollowerFirstTimeOnMhenga();
		return true;
	}
	return false;
}

function xenogenOutsideBlurb():Boolean
{
	variableRoomUpdateCheck();
	if(hours < 6 || hours >= 17)
	{
		output("\n\n<b>The doorway to the north is currently marked \"Closed.\"</b> A notice declares that it will be open again at 6:00 standard terran time.");		
	}
	else
	{
		output("\n\n<b>Xenogen Biotech is currently open!</b> Office hours are 6:00 to 17:00 standard terran time.");
	}
	return false;
}

function hangarBonus():Boolean 
{
	trace("this", this);
	// trace("this.titsClassPtr.move,", this.titsClassPtr.move);
	// trace("this.titsClassPtr.userInterface", this.titsClassPtr.userInterface);
	if(currentLocation == "LIFT: MERCHANT DECK") {
		addButton(5,"ToHangar",liftMove, "TAVROS LIFT");
	}
	else if(currentLocation == "TAVROS LIFT") {
		addButton(5,"ToMerchant",liftMove, "LIFT: MERCHANT DECK");
	}
	return false;
}

public function tavrosHangarStuff():Boolean
{
	if (flags["FALL OF THE PHOENIX STATUS"] == 1)
	{
		output("\n\n<i>The Phoenix</i> is nearby, only a stones-throw away from your own ship, docked in a much smaller neighbouring hangar.");
		
		if (flags["SAENDRA TALK PHOENIX STATUS"] != undefined)
			addButton(0, "The Phoenix", move, "PHOENIX RECROOM");
	}
	
	return false;
}

function liftMove(destination:String):void {
	move(destination,false);
	clearOutput();
	output("Your stomach drops as the lift kicks into gear. The gentle, steady thrum of powerful machinery fills the metallic tube as you are brought to your destination, slowly decelerating when you arrive.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

function debugMenus():void
{
	clearMenu();
	output("The room of debug. Where am I? How did I get here? What do you want?!");
	
	// Need the buttons back to test other stuff.
	// NO END OF FUCKING COMPLAINTS I AM FUCKING CALLING IT NOW.
	
	//addButton(0, "Lights Out", startLightsOut, testVictoryFunc);
	
	addItemButton(0, new AtmaArmor(), function():void {
		output("\n\nAtmaArmor get.\n");
		
		var foundLootItems:Array = new Array();
		foundLootItems.push(new AtmaArmor());
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addItemButton(1, new NaleenArmor(), function():void {
		output("\n\nNaleenscale Armor get.\n");
		
		var foundLootItems:Array = [new NaleenArmor];
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addItemButton(2, new TSTArmorMkII(), function():void {
		output("\n\nNaleenscale Armor get.\n");
		
		var foundLootItems:Array = [new TSTArmorMkII];
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addButton(3, "Preggers Test", function():void {
		processTime(800);
		processTime(800);
		
		mainGameMenu();
	});
	
	addButton(7, "Test Nades", function():void {
		
		var tNades:TestGrenade = new TestGrenade();
		tNades.quantity = 10;
		
		quickLoot(tNades);
		
	}, undefined, "Test Grenades", "Get some testing grenades for combat stuff.");
	
	addButton(8, "Test HP.B", function():void {
		
		var tBooster:TestHPBooster = new TestHPBooster();
		tBooster.quantity = 10;
		
		quickLoot(tBooster);
		
	}, undefined, "Test Booster", "Get some test HP boosters.");
	
	addButton(4, "Cashmoney", function():void {
		pc.credits += 100000;
	}, undefined, "Cashmoney", "Sauce says you are TURRIBLE.");
	
	addButton(5, "XP", function():void {
		(pc as PlayerCharacter).XPRaw = (pc as PlayerCharacter).XPMax();
	});
}

function quickLoot(... args):void
{
	itemScreen = mainGameMenu;
	lootScreen = mainGameMenu;
	useItemFunction = mainGameMenu;
	
	itemCollect(args);
}

function bountyBoardExtra():Boolean
{
	output("\n\nA large bulletin board has been erected against the wall of the building to the north.");
	var openQuests:int = 0;
	if(flags["SEEN_JULIANS_AD"] == undefined) openQuests++;
	if(openQuests > 0) output(" <b>There are new notices there.</b>");
	addButton(0,"Bulletins",checkOutBountyBoard);
	return false;
}
function checkOutBountyBoard():void
{
	clearOutput();
	output("The bounty board is covered in simple leaflets, papers, all manner of other detritus. Most appear to be for mundane tasks like trading construction equipment, advertising repair services, or business advertisements. Still, there's at least one that stands out.");
	output("\n\n");
	if(flags["SEEN_JULIANS_AD"] == undefined) {
		output("<b>New: </b>");
		flags["SEEN_JULIANS_AD"] = 1;
	}
	else {
		if(flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] == 1) output("<b>Completed: </b>");
		else if(flags["ACCEPTED_JULIANS_ZIL_CAPTURE_MISSION"] == 1) output("<b>Accepted: </b>");
		else output("<b>Seen Before: </b>");
	}
	output(" Dr. Julian of the Xenogen Biotech labs on the south end of town is looking for 'a strapping, adventurous type' to brave the jungles in search of something he can use for his research.");
	if(flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] == 1) output(" You know from experience that it's quite lucrative.");
	else output(" It seems like it could be quite lucrative.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
function barBackRoomBonus():Boolean
{
	if(flags["KELLY_MET"] == 1 && (hours >= 17 || hours < 6)) kellyAtTheBar();
	return false;
}


/*
Fern, Lichens, and Ironwoods:
Man/FemZil, Cuntsnake

Dense Orange, Dark, Narrow Path
Naleen, Cuntsnake, Venus Pitchers

Deep Jungle Biome:
Naleen, Venus Pitchers, Elder Venus Pitchers, Zil
*/
function jungleEncounterChances():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else {
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	
	// APPARANTLY I AM NOT ALLOWED DEBUG FUNCTIONS. FML
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(4) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(4) == 0)) {
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters
		choices[choices.length] = femzilEncounter;
		choices[choices.length] = maleZilEncounter;
		choices[choices.length] = encounterCuntSnakeOnJungleLand;
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

function jungleMiddleEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else {
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(3) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(3) == 0)) {
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters
		if((hours < 3 || hours > 20) && totalNaleenSexCount() >= 5)
		{
			choices[choices.length] = naleenNightCuddles;
			choices[choices.length] = naleenNightCuddles;
		}
		else {
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = encounterNaleen;
		}
		choices[choices.length] = encounterCuntSnakeOnJungleLand;
		choices[choices.length] = encounterCuntSnakeOnJungleLand;
		choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

function findOxoniumOnMhenga():Boolean {
	if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] == undefined) {
		output("\n\nThere is a vertical striation running up through the rock wall of a different mineral, something pitch black that seems to draw in the light. You could probably scan it with your codex and radio it in to your Dad's company for a quick prospector's fee.");
	}
	else {
		output("\n\nThere's a deposit of Oxonium here, but you've already called in the claim to your Dad's company. They'll probably be out to mine it once the frontier settles down a little bit.");
	}
	//Overridden by Jungle deep encounters
	if(jungleDeepEncounters()) return true;
	//Option to loot it!
	else if(flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] == undefined) {
		addButton(0,"Scan Rock",claimMhengaOxonium);
	}
	return false;
}

function claimMhengaOxonium():void {
	clearOutput();
	output("Utilizing your codex's sensors, you identify the material as Oxonium, a rare mineral used in holographic displays. There amount here is decent, easily worth at least 3,000 credits. You record your location and compose a short message, sending it off a few minutes later. Before you've had a chance to do anything else, the codex beeps.\n\n<b>Your bank account just got a 5,000 credit deposit.</b> Either you're not a great geologist, or Dad's company has orders to give you top dollar. Regardless, the profit is yours.");
	
	flags["TAGGED_MHENGA_OXONIUM_DEPOSIT"] = 1;
	if(flags["OXONIUM_FOUND"] == undefined) flags["OXONIUM_FOUND"] = 0;
	flags["OXONIUM_FOUND"]++;
	pc.credits += 5000;
	processTime(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

function jungleDeepEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else {
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	//Venus pitchers require you to have met a younger pitcher.
	if(flags["TIMES_MET_VENUS_PITCHER"] != undefined)
	{
		//in this room and da chick awake.
		if(currentLocation == "OVERGROWN ROCK 12" && flags["ROOM_80_VENUS_PITCHER_ASLEEP"] == undefined) {
			elderVenusPitcherEncounter();
			flags["JUNGLE_STEP"] = 0;
			flags["ROOM_80_VENUS_PITCHER_ASLEEP"] = 1;
			return true;
		}
		//in this room and da chick awake.
		if(currentLocation == "VINED JUNGLE 3" && flags["ROOM_65_VENUS_PITCHER_ASLEEP"] == undefined) {
			elderVenusPitcherEncounter();
			flags["JUNGLE_STEP"] = 0;
			flags["ROOM_65_VENUS_PITCHER_ASLEEP"] = 1;
			return true;
		}
		//in this room and da chick awake.
		if(currentLocation == "DEEP JUNGLE 2" && flags["ROOM_61_VENUS_PITCHER_ASLEEP"] == undefined) {
			elderVenusPitcherEncounter();
			flags["JUNGLE_STEP"] = 0;
			flags["ROOM_61_VENUS_PITCHER_ASLEEP"] = 1;
			return true;
		}
	}

	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(2) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(2) == 0)) {
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters
		if((hours < 3 || hours > 20) && totalNaleenSexCount() >= 5)
		{
			choices[choices.length] = naleenNightCuddles;
			choices[choices.length] = naleenNightCuddles;
		}
		else {
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = encounterNaleen;
			choices[choices.length] = naleenMaleEncounter;
			choices[choices.length] = naleenMaleEncounter;
			choices[choices.length] = naleenMaleEncounter;
		}
		choices[choices.length] = encounterMimbrane;
		choices[choices.length] = encounterMimbrane;
		//choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

//Raskvel + Lapinara
function rustPlainsEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		if(!pc.hasStatusEffect("Lapinara Prophylactic")) choices[choices.length] = encounterALapinara;
		if(!pc.hasStatusEffect("Lapinara Prophylactic")) choices[choices.length] = encounterALapinara;
		choices[choices.length] = encounterALapinara;
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = encounterHostileRaskvelFemale;
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = encounterHostileRaskvelFemale;
		choices[choices.length] = encounterHostileRaskvelFemale;

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

//Goo, Sydian
function rustCoastEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		choices[choices.length] = encounterMaleSydian;
		
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;
	
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

//Raskvel + Saxbots + Sydians
function rustRidgesEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		if(!pc.hasStatusEffect("Sydian Prophylactic")) choices[choices.length] = encounterMaleSydian;
		choices[choices.length] = encounterMaleSydian;
		
		if(!pc.hasStatusEffect("Raskvel Prophylactic")) choices[choices.length] = encounterHostileRaskvelFemale;
		choices[choices.length] = encounterHostileRaskvelFemale;
		//choices[choices.length] = encounterHostileRaskvelFemale;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined || rand(2) == 0) choices[choices.length] = encounterASexBot;

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}
//Goos and Saxbots
function rustScytheGladeEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined) choices[choices.length] = encounterASexBot;
		if(flags["SEXBOT_FACTORY_DISABLED"] == undefined || rand(2) == 0) choices[choices.length] = encounterASexBot;
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;
		choices[choices.length] = encounterDasGooGray;

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

function mhengaVanaeCombatZone():Boolean
{
	if (flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if (flags["JUNGLE_STEP"] == undefined) flags["JUNGLE_STEP"] = 1;
	else
	{
		if(pc.accessory is JungleLure) flags["JUNGLE_STEP"]++;
		flags["JUNGLE_STEP"]++;
	}
	
	var opts:Array = [];
	
	if ((pc.accessory is JungleRepel && flags["JUNGLE_STEP"] >= 10 && rand(2) == 0) || (!(pc.accessory is JungleRepel) && flags["JUNGLE_STEP"] >= 5 && rand(2) == 0)) 
	{
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		//Build possible encounters	
		var MAIDEN:int = 0;
		var HUNTRESS:int = 1;
		var MIMBRANE:int = 3;
		
		var selected:int = RandomInCollection(MAIDEN, MAIDEN, HUNTRESS, HUNTRESS, HUNTRESS, HUNTRESS, HUNTRESS, MIMBRANE);
		
		if (selected == MAIDEN)
		{
			encounterVanae(false);
		}
		else if (selected == HUNTRESS)
		{
			encounterVanae(true);
		}
		else
		{
			encounterMimbrane();
		}
		return true;
	}
	
	return false;
}

function mhengaThickMist2RoomFunc():Boolean
{
	clearOutput();
	
	output("The mist here is so thick you're having trouble seeing where you're going. If it wasn't for the blinking, multi-colored lichen lining the forest trees, you'd probably be lost. Moisture clings to your");
	if (!pc.isNude()) output (" [pc.armor]");
	else output(" [pc.skinFurScales]");
	output(" as you trudge forth, utterly surrounded by a blanket of white.");

	output("\n\nYou can feel something blocking your way east and it feels too tall to climb. Every other direction seems okay. Maybe. It's hard to tell.");
	
	return mhengaVanaeCombatZone();
}

function mhengaUthraBirch():Boolean
{
	if (flags["UTHRA HARVEST DAY"] == undefined || flags["UTHRA HARVEST DAY"] + 2 <= days)
	{
		output("\n\nEven worse, a obsidian sap is seeping gruesomely from wound-like gaps in the tree surface. Not a single glimmer of light reflects off the eerily black substance, contrasting violently with your misty white surroundings.");
		
		addButton(0, "Harvest", mhengaHarvestUthra, undefined, "Harvest Tree", "Harvest sap from the Uthra Tree");
	}
	else
	{
		output("\n\nYou have harvested the obsidian colored sap from the ugly tree and no more flows from its surface. You'll have to give it time to produce some more.");
		
		addDisabledButton(0, "Harvest", "You have recently harvested sap from the Uthra Tree and must allow it to regenerate.");
	}
	
	output("\n\nThe roots of the deformed tree are large and pervasive, blocking passage in almost every direction. The only path left open to you is back down into the river lined gorge.");
	
	return false;
}

function mhengaHarvestUthra():void
{
	clearOutput();
	flags["UTHRA HARVEST DAY"] = days;
	
	output("You gather what little of the sap leaking from the tree you can find into a small collection tube - a standard part of any rushers exploration kit - ensuring that you don't accidently get any on yourself in the process.");
	if (flags["CONSUMED_UTHRA_SAP"] == undefined) output(" No telling what this stuff could do to you without some kind of analysis.");
	else output(" Even safe in the knowledge that the substance isn't particularly dangerous, it'd be best not to accidently spread any around without intending to.");
	
	quickLoot(new UthraSap());
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function mhengaVanaeFernDamage():Boolean
{
	if (rand(3) == 0 || pc.armor is EmptySlot)
	{
		var damage:int = rand(8);
		if (pc.armor is EmptySlot) damage = 8;
		else damage -= pc.armor.defense;
		
		if (damage < 0)
		{
			output("\n\nThe spiked ferns look pretty damn painful, but your thick armor is doing a fantastic job of keeping the jagged spikes from doing any damage.");
		}
		else if (damage < 2)
		{
			output("\n\nThe spiked ferns look pretty damn painful, but thankfully your armor is managing to deflect the worst of it and only allows the odd prick or slash to your [pc.legs] as you hike through the area. <b>(" + damage + ")</b>");
			pc.HP( -damage);
		}
		else if (damage < 4)
		{
			output("\n\nThe spiked ferns look pretty damn painful, your armor not exactly achieving much when it comes to providing protection to your lower extremeties. The sharp points of the ferns are doing a real number on your [pc.legs]. <b>(" + damage + ")</b>");
			pc.HP( -damage);
		}
		else if (damage < 8)
		{
			output("\n\nThe spiked ferns look pretty damn painful, and your armor is nigh-useless when it comes to providing any semblance of protection from the spiked menace infesting the undergrowth in these parts of the lowlands. <b>(" + damage + ")</b>");
			pc.HP( -damage);
		}
		else
		{
			output("\n\nYou're starting to wish you were wearing armor - hell, even some flimsy dress pants would go a long way to providing some measure of protection against the spiked menance infesting the undergrowth in these parts of the lowlands. With nothing to protect your [pc.legs] from repeated jabs and slashes, moving through the area is quickly taking a toll on your stamina, and your health. <b>(" + damage + ")</b>");
			pc.HP( -damage);
			pc.energy( -damage);
		}
	}
	
	return mhengaVanaeCombatZone();
}

function mhengaVanaeAbandonedCamp():Boolean
{
	addButton(0, "Salvage", mhengaSalvageFromCamp);
	return false;
}

function mhengaSalvageFromCamp():void
{
	clearOutput();
	
	if (flags["SALVAGED VANAE CAMP"] == undefined)
	{
		output("You find something of interest stashed in one of the many storage containers scattered around the camp. Gingerly lifting the lid of a heavily damaged container, you discover a set of some kind of augmented armor. "); // I have no idea what this item is supposed to look like.
		quickLoot(new AtmaArmor());
		flags["SALVAGED VANAE CAMP"] = 1;
		return;
	}
	else
	{
		output("You spend a couple of minutes scouting around the defunct camp, but find nothing further of interest. Seems like you've salvaged everything of use.");
		clearMenu();
		addButton(0, "Next", mainGameMenu); 
	}
}

function mhengaThickMistRoom1():Boolean
{
	output("The mist is incredibly thick here, obscuring almost everything around you. Every noise seems sharper and more imposing as you crunch blindly about, occasionally knocking into a tree or branch. Your");
	if (!pc.armor is EmptySlot) output(" [pc.armor]");
	else output(" [pc.skinFurScales]");
	output(" are damp from all the moisture in the air. Things are getting quite chilly.\n\nYou can hear a river to the west, which means you probably can't proceed that way. Everywhere else seems fine, you think...");
	
	return mhengaVanaeCombatZone();
}

function anonsBarAddendums():Boolean {
	
	if (saendraBarAddendum())
	{
		return true;
	}
	
	anonsBarWaitressAddendum();
	alexManHermIntro();
	ShellyBlurb();
	annoAtAnonsAddendum();
	
	return false;
}

function firstTimeOnTarkusBonus():Boolean
{
	if(flags["BEEN_ON_TARKUS"] == undefined)
	{
		flags["BEEN_ON_TARKUS"] = 1;
		clearOutput();
		output("You step down out of your ship and into a crowd of tiny, scaly folk: only a few feet tall, they're all sporting lithe frames and ridiculously long ears that nearly drag around on the ground behind them, most bearing a variety of piercings and tattoos. As you leave your ship behind, you're quickly swarmed by several of these curious creatures, which your Codex helpfully identifies as the raskvel, the planet's native species (or one of them, anyway). They shower you with questions about name, sex, species, et cetera as one or two in very scruffy uniforms try to hand you some paperwork. You hurriedly scribble down your signature before pushing off some of the more outgoing raskvel climbing up your [pc.leg]. Eventually, another starship lands, leaving you in peace for a moment as they scurry off to see the next new and interesting thing.");
		CodexManager.unlockEntry("Raskvel");
		output("\n\n<b>You are on the starship Nova, now known as the raskvel's city, Novahome.</b>");
	}
	return returnToShipAfterRecruitingAnno();
}

function BonusFunction210():Boolean
{
	if(flags["TARKUS_DESTROYED"] == undefined) output(" Shafts of outside light cut into the artificial brilliance of the tunnel's lamps to the west, indicating a way outside.");
	return false;
}

function bonusFunction213():Boolean
{
	if(flags["TARKUS_DESTROYED"] == undefined) output(" An enclosed bulkhead to the south houses a narrow entryway of some kind. Black marks around the perimeter of the door indicate at least one explosion has gone off on the other side.");
	else output(" A solid metal plate has been welded over a charred doorway to the south and a bright red \'X\' spraypainted across it.");
	return false;
}

function novaShipHangarElevator():Boolean
{
	if (flags["DECK13_COMPLETE"] == undefined)
	{
		output("\n\nYou step up to the elevator and press the call button. Immediately, the doors slide open, but no car comes.");
	}
	else
	{
		addButton(0, "Elevator", novaElevatorControlPanel);
	}
	return false;
}

function novaMainDeckElevator():Boolean
{
	if (flags["DECK13_COMPLETE"] == undefined)
	{
		output("\n\nYou step up to the elevator and press the call button. Immediately, the doors slide open, but no car comes.");
	}
	else
	{
		addButton(0, "Elevator", novaElevatorControlPanel);
	}
	
	return false;
}

function novaElevatorControlPanel():void
{
	clearOutput();
	author("Gedan");
	showName("NOVA\nELEVATOR");
	
	output("You step into the cavernous elevator and take a look around. There's a heavily damaged control panel attached to a console beside the elevators doors. Through the grime and rust you can just barely make out a set buttons, a number of which are lit up.");
	
	clearMenu();
	if (currentLocation != "NOVA SHIP DECK ELEVATOR") addButton(0, "Hangar Deck", move, "NOVA SHIP DECK ELEVATOR");
	else addDisabledButton(0, "Hangar Deck");
	
	if (currentLocation != "NOVA MAIN DECK ELEVATOR") addButton(1, "Main Deck", move, "NOVA MAIN DECK ELEVATOR");
	else addDisabledButton(1, "Main Deck");
	
	if (currentLocation != "DECK 13 ELEVATOR SHAFT") addButton(2, "Deck 13", move, "DECK 13 ELEVATOR SHAFT");
	else addDisabledButton(2, "Deck 13");
	
	addButton(14, "Back", mainGameMenu);
}

function newTexasRoadFirstTime():Boolean
{
	//First time:
	if(flags["SEEN_TEXAS_SURFACE"] == undefined)
	{
		output("So this is New Texas, the pastoral paradise, huh? With the seemingly endless blue sky, rustic-looking structures, and rolling fields of grass and grain, you can see where it got its name. Presently you've stepped out onto a bumpy dirt road; it's fortunate the locals rely on hover-based transit over primitive wheel systems, or they'd need to invest a little more heavily into their infrastructure. A huge barn looms over you to the south. Just inside the doors, you know there's a customs checkpoint and more ships than you bother to count. To the north sits a ranch house, the kind with a big, elevated porch that would normally house a farmer and his extended family. This one is dressed up with a bit of extra flair. Signs declare it to be the official visitor's center.");
		flags["SEEN_TEXAS_SURFACE"] = 1;
	}
	//Repeat
	else
	{
		output("You recognize this spot on the dusty country road. It's where you got your first real look at New Texas' so-called pastoral paradise. The whole place is built up in the style of old terran farms. The hangar is designed to resemble a gigantic barn, despite its contents being made of gleaming metal instead of flesh. Off to the northeast is a fancy ranch house, replete with a fenced-in porch, rocking chairs, and a dazzlingly white coat of paint. In other directions are fenced off fields.");
	}
	return false;
}

function manMilkerRoomBonusFunc():Boolean
{
	addButton(0,"Use Milker",useDaMilkar,undefined,"Use Milker","Use the male milker. It looks to function based off of prostate stimulation.");
	return false;
}
function NTGiftShopBonusFunc():Boolean
{
	//First Time Entering the Shop
	if(flags["SEEN_ELLIES_SHOP"] == undefined)
	{
		flags["SEEN_ELLIES_SHOP"] = 1;
		output("You step into the gift shop, pushing the glass door open ahead of you. You all but recoil when the door slides open, and an almost overpowering aroma assails your senses. It feels like you've just been hit by a brick, right in the chest; catching your breath is almost impossible for a long moment. Your mind swims as the potent musk in the shop washes over you, and you suddenly manage to identify the odor: sex. Raw, untamed sexuality and need. Your skin flushes as the musky odor clings to you, feeling like a haze around you as you force yourself to walk, not run, into the gift shop.\n\n");
		pc.lustDamage(10);
	}
	else pc.lustDamage(5);
	output("The gift shop looks like every other gift shop in the 'verse, with racks of memorabilia ranging from ten-gallon hats to holographic greeting cards. There's a pretty good line leading up to the cashiers, and the most popular item going out seems to be a small white medipen labeled \"The Treatment.\" ");
	if(flags["MET_ELLIE"] != undefined) output("Ellie");
	else output("A tauric woman with black scales on her lower body and a massive GG-cup rack, only barely restrained by a semi-translucent bra that's stained with milky moisture");
	output(" is overseeing the automated shopping terminals, occasionally distracted by a customer's query or a particularly flirty bull wandering through.");
	//Next, to room description. Add [Shopkeeper] button
	ellieApproachButtonSetup();
	return false;
}

function NTBarbequeBonusFunc():Boolean
{
	output("The restaurant attached to the ranch house is a smoky, meaty-smelling BBQ joint, advertising authentic terran steaks, ribs, and roast beef sandwiches. An open grill dominates the far northern wall of the restaurant, with several tourists and cow-folk lined up to order some delicious barbeque. ");
	if(flags["MET_HERMAN"] != undefined) output("Herman the chef");
	else output("The chef");
	output(" is busily trying to fill the orders as they come in, clearly swamped with customers.");
	return false;
}