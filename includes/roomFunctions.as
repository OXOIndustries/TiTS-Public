import classes.Characters.PlayerCharacter;
import classes.Items.Apparel.AtmaArmor;
import classes.Items.Apparel.UGCUniform;
import classes.Items.Guns.EagleHandgun;
import classes.Items.Guns.Goovolver;
import classes.Items.Guns.HoldOutPistol;
import classes.Items.Guns.LaserPistol;
import classes.Items.Guns.ScopedPistol;
import classes.Items.Guns.ZKRifle;
import classes.Items.Miscellaneous.PHAccess;
import classes.Items.Miscellaneous.TestGrenade;
import classes.Items.Miscellaneous.TestHPBooster;
import classes.Items.Protection.DBGShield;
import classes.Items.Protection.DecentShield;
import classes.Items.Apparel.TSTArmor;
import classes.Items.Accessories.JungleLure;
import classes.Items.Accessories.JungleRepel;

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
	
	addButton(0, "Lights Out", startLightsOut, testVictoryFunc);
	
	//addItemButton(0, new DBGShield(), function():void {
		//output("\n\nDebug shield get.");
		//
		//var foundLootItems:Array = new Array();
		//foundLootItems.push(new DBGShield());
		//
		//itemScreen = mainGameMenu;
		//lootScreen = mainGameMenu;
		//useItemFunction = mainGameMenu;
		//
		//itemCollect(foundLootItems);
	//});
	
	addButton(1, "Unlock Saen", function():void {
		flags["FALL OF THE PHOENIX STATUS"] = 1;
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
	if(flags["KELLY_MET"] == 1 && (hours > 17 || hours < 6)) kellyAtTheBar();
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
	
	output("<b>SPLICE IN ENCOUNTER SHIT GEDDY. DO IT FGT.</b>");
	
	return false;
}

function mhengaUthraBirch():Boolean
{
	if (flags["UTHRA HARVEST DAY"] == undefined || flags["UTHRA HARVEST DAY"] + 2 <= days)
	{
		output("\n\nEven worse, a obsidian sap is seeping gruesomely from wound-like gaps in the tree surface. Not a single glimmer of light reflects off the eerily black substance, contrasting violently with your misty white surrounds.");
		
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
	
	output("<b>FIND DIS CONTENT SHIT GEDDY.</b>");
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

function mhengaVanaeFernDamage():Boolean
{
	output("\n\ndo damage or some shit");
	
	return false;
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
		output("You find something of interest stashed in one of the many storage containers scattered around the camp. Gingerly lifting the lid of a lightly damaged container, you discover a set of some kind of augmented armor."); // Placeholder gtfo, I have no idea what this item is supposed to look like.
		quickLoot([new AtmaArmor()]);
		flags["SALVAGED VANAE CAMP"] = 1;
		return;
	}
	else
	{
		output("You spend a couple of minutes scouting around the defunct camp, but find nothing further of interest. Seems like you've salvaged everything of use.");
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu); 
}

function anonsBarAddendums():Boolean {
	
	if (saendraBarAddendum())
	{
		return true;
	}
	
	anonsBarWaitressAddendum();
	alexManHermIntro();
	ShellyBlurb();
	
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
	return false;
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