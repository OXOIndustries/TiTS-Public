import classes.Characters.PlayerCharacter;
import classes.Items.Apparel.UGCUniform;
import classes.Items.Guns.EagleHandgun;
import classes.Items.Guns.Goovolver;
import classes.Items.Guns.HoldOutPistol;
import classes.Items.Guns.LaserPistol;
import classes.Items.Guns.ScopedPistol;
import classes.Items.Guns.ZKRifle;
import classes.Items.Miscellaneous.PHAccess;
import classes.Items.Protection.DBGShield;
import classes.Items.Protection.DecentShield;
import classes.Items.Apparel.TSTArmor;
import classes.Items.Accessories.JungleLure;
import classes.Items.Accessories.JungleRepel;

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
	output("\n\nTesting intentionally fucking up bold tags.");
	output("<b>Open tag <b>Double open tag");
	output("More text");
	
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
	
	addItemButton(3, new Goovolver(), function():void {
		output("\n\nAnd I thought my test items were OP!");
		
		var foundLootItems:Array = new Array();
		foundLootItems.push(new Goovolver());
		
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		
		itemCollect(foundLootItems);
	});
	
	addButton(7, "Milodan Pair", function():void {
		userInterface.showBust("MILODANMALE", "MILODANFEM");
		userInterface.bringLastBustToTop();
		output("\n\nTesting bust images yo!");
	});
	
	addButton(8, "Milodan Fem", function():void {
		userInterface.showBust("MILODANFEM");
		output("\n\nTesting fem bust image yo!");
	});
	
	addButton(9, "Milodan Male", function():void {
		userInterface.showBust("MILODANMALE");
		output("\n\nTesting male bust image yo!");
	});
	
	addButton(4, "Cashmoney", function():void {
		pc.credits += 100000;
	}, undefined, "Cashmoney", "Sauce says you are TURRIBLE.");
	
	addButton(5, "XP", function():void {
		(pc as PlayerCharacter).XPRaw = (pc as PlayerCharacter).XPMax();
	});
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
	
	if (debug)
	{
		if (flags["JUNGLE_STEP"] >= 3)
		{
			flags["JUNGLE_STEP"] = 0;
			encounterMimbrane();
			return true;
		}
		return false;
	}
	
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
		choices[choices.length] = femzilEncounter;
		choices[choices.length] = maleZilEncounter;
		//choices[choices.length] = encounterRegularTentaclePitcherYouGay;
		
		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}

function rustPlainsEncounters():Boolean {
	if(flags["ENCOUNTERS_DISABLED"] != undefined) return false;
	if(flags["RUST_STEP"] == undefined) flags["RUST_STEP"] = 1;
	else flags["RUST_STEP"]++;
	
	var choices:Array = new Array();
	//If walked far enough w/o an encounter
	if(flags["RUST_STEP"] >= 5 && rand(3) == 0) {
		//Reset step counter
		flags["RUST_STEP"] = 0;
		
		choices[choices.length] = encounterALapinara;
		choices[choices.length] = encounterALapinara;
		choices[choices.length] = encounterALapinara;
		if(!debug)
		{
			choices[choices.length] = encounterHostileRaskvelFemale;
			choices[choices.length] = encounterHostileRaskvelFemale;
			choices[choices.length] = encounterHostileRaskvelFemale;
			choices[choices.length] = encounterASexBot;
			choices[choices.length] = encounterASexBot;
			choices[choices.length] = encounterASexBot;
			choices[choices.length] = encounterDasGooGray;
			choices[choices.length] = encounterDasGooGray;
			choices[choices.length] = encounterDasGooGray;
		}

		//Run the event
		choices[rand(choices.length)]();
		return true;
	}
	return false;
}


function anonsBarAddendums():void {
	anonsBarWaitressAddendum();
	alexManHermIntro();
	ShellyBlurb();
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