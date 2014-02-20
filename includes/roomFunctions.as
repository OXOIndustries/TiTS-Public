import classes.Characters.PlayerCharacter;
import classes.Items.Apparel.UGCUniform;
import classes.Items.Guns.EagleHandgun;
import classes.Items.Guns.HoldOutPistol;
import classes.Items.Guns.LaserPistol;
import classes.Items.Guns.ScopedPistol;
import classes.Items.Guns.ZKRifle;
import classes.Items.Miscellaneous.PHAccess;
import classes.Items.Protection.DBGShield;
import classes.Items.Protection.DecentShield;
import classes.Items.Apparel.TSTArmor;

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

	addItemButton(0, new DBGShield(), function():void {
		output("\n\nDebug shield get.");
		
		var foundLootItems:Array = new Array();
		foundLootItems.push(new DBGShield());
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addItemButton(1, new TSTArmor(), function():void {
		output("\n\nTest armor get.");
		
		var foundLootItems:Array = new Array();
		foundLootItems.push(new TSTArmor());
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addItemButton(2, new PHAccess(), function():void {
		output("\n\nPlaceholder accessory get.");
		
		var foundLootItems:Array = new Array();
		foundLootItems.push(new PHAccess());
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addItemButton(3, new ZKRifle(), function():void {
		output("\n\nAnd I thought my test items were OP!");
		
		var foundLootItems:Array = new Array();
		foundLootItems.push(new ZKRifle());
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
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
	else flags["JUNGLE_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["JUNGLE_STEP"] >= 6 && rand(4) == 0) {
		//Reset step counter
		flags["JUNGLE_STEP"] = 0;
		
		if(debug) {
			maleZilEncounter();
			return true;
		}
		
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
	else flags["JUNGLE_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["JUNGLE_STEP"] >= 5 && rand(3) == 0) {
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
	else flags["JUNGLE_STEP"]++;
	
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

	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["JUNGLE_STEP"] >= 5 && rand(2) == 0) {
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
		choices[choices.length] = femzilEncounter;
		choices[choices.length] = maleZilEncounter;
		choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

function anonsBarAddendums():void {
	anonsBarWaitressAddendum();
	alexManHermIntro();
}