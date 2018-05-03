

public function flyToTavros():void
{
	if (annoIsCrew() && flags["ANNO_MAID_OUTFIT"] == undefined) flags["ANNO_MAID_OUTFIT"] = 1;
	
	output("You fly to Tavros");
	if(leaveShipOK()) output(" and step out of your ship.");
	showBust("TAVROS");
	showName("\nTAVROS");
}
public function puntToShip():Boolean
{
	clearOutput();
	if(currentLocation == "POESPACE" && flags["POE_A_DISABLED"] == undefined)
	{
		landingOnPoeA();
		return true;
	}
	output("You really don’t want to step out into the cold void of space. Maybe you should land somewhere?");
	moveTo("SHIP INTERIOR");
	showLocationName();
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	return true;
}
public function exitToShipLocation():Boolean
{
	rooms[currentLocation].planet = rooms[shipLocation].planet;
	rooms[currentLocation].system = rooms[shipLocation].system;
	if (currentLocation != shipLocation)
	{
		addButton(7, "Exit", move, (rooms[shipLocation].hasFlag(GLOBAL.NUDITY_ILLEGAL) ? "SHIP INTERIOR" : shipLocation));
	}
	return false;
}

public function liftMove(destination:String):void
{
	clearOutput();
	output("Your stomach drops as the lift kicks into gear. The gentle, steady thrum of powerful machinery fills the metallic tube as you are brought to your destination, slowly decelerating when you arrive.");
	move(destination,false);
	showLocationName();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function hangarFloors(bonus:Boolean = false):Array 
{
	var floors:Array = [];
	floors.push(["Hangar", liftMove, "TAVROS LIFT", "Hangar Deck", "the hangar deck"]);
	floors.push(["Merchant", liftMove, "LIFT: MERCHANT DECK", "Merchant Deck", "the merchant deck"]);
	floors.push(["Res. Deck", liftMove, "LIFT: RESIDENTIAL DECK", "Residential Deck", "the residential deck"]);
	floors.push(["Nursery", liftMove, "NURSERYELEVATOR", "Nursery Deck", "the nursery deck"]);
	if(bonus)
	{
		if(flags["SAENDRA_XPACK1_STATUS"] == 1 || flags["SAENDRA_XPACK1_STATUS"] == 2)
			floors.push(["Deck 92", saendraX1LiftGo, undefined, "Deck 92", "Deck 92"]);
	}
	
	return floors;
}
public function hangarBonus():Boolean 
{
	output("You’re within a stuffy tube of metal and plastic. Steady, mechanical thrums suffuse the air around you. The inside of the cylinder-like lift is lined by a brass-hued railing, used to steady oneself during high speed travel through the kilometers-long station.\n\nThere’s a sturdy mechanical keypad with which to designate your target level. Right now, the only floors of interest are the hangar, merchant, residential, and nursery levels.");
	
	var btnSlot:int = 0;
	
	addButton(btnSlot++, "Floors", hangarButtonMenu, undefined, "Control Panel", "Ride the elevator to a specific floor.");
	
	// Special floors (add when needed)
	if (flags["SAENDRA_XPACK1_STATUS"] == 1 || flags["SAENDRA_XPACK1_STATUS"] == 2)
	{
		output("\n\nYou also have the option to take the lift up to Deck 92 to meet up with Saendra");
		if(flags["SAENDRA_XPACK1_STATUS"] == 2) output(". You are sure taking your time about it though");
		output("--whatever she contacted you about, it sounded pretty urgent.");
		addButton(btnSlot++, "Deck 92", saendraX1LiftGo, undefined, "Deck 92", "Go to Deck 92.");
	}
	
	// Normal floors
	var floors:Array = hangarFloors();
	for(var i:int = 0; i < floors.length; i++)
	{
		if(floors[i][2] == currentLocation)
		{
			output("\n\n<b>You are currently on " + floors[i][4] + ".</b>");
			if(floors[i - 1] != null)
			{
				addButton(7, "Down", floors[i - 1][1], floors[i - 1][2], floors[i - 1][3], ("Go to " + floors[i - 1][4] + "."));
			}
			if(floors[i + 1] != null)
			{
				addButton(5, "Up", floors[i + 1][1], floors[i + 1][2], floors[i + 1][3], ("Go to " + floors[i + 1][4] + "."));
			}
		}
	}
	if(days >= 8 && flags["AZRA_RECRUITED"] == undefined && flags["AZRA_DISABLED"] == undefined) 
	{
		if(azraBonusProc(btnSlot++)) return true;
	}
	
	return false;
}
public function hangarButtonMenu():void 
{
	clearMenu();
	
	var floors:Array = hangarFloors(true);
	var floorIndex:int = 0;
	var btnSlot:int = 0;
	var i:int = 0;
	
	for(i = 0; i < floors.length; i++)
	{
		if(floors[i][2] == currentLocation) floorIndex = i;
	}
	for(i = 0; i < floors.length; i++)
	{
		if(i == floorIndex)
		{
			addDisabledButton(btnSlot++, floors[i][0], floors[i][3], "You are already on this floor.");
		}
		else if(floors[i][1] != liftMove)
		{
			addButton(btnSlot++, floors[i][0], floors[i][1], floors[i][2], floors[i][3], ("Go to " + floors[i][4] + "."));
		}
		else
		{
			addButton(btnSlot++, floors[i][0], hangarMoveTo, [floors[i][2], (Math.abs(floorIndex - i) - 1)], floors[i][3], ("Go to " + floors[i][4] + "."));
		}
	}
	addButton(14, "Back", mainGameMenu);
}
public function hangarMoveTo(arg:Array):void 
{
	var destination:String = arg[0];
	var minExtra:int = arg[1];
	
	if(minExtra > 0) processTime(minExtra);
	
	liftMove(destination);
}

public function tavrosHangarStuff():Boolean
{
	// NPCs
	var btnSlot:int = 0;
	vahnTavrosBonus(btnSlot++);
	if(celiseIsFollower() && !celiseIsCrew()) celiseTavrosBonus(btnSlot++);
	if(bessAtTavros()) bessTavrosBonus(btnSlot++);
	if(flags["AZRA_DISABLED"] == 0) azraBonusProc(btnSlot++);
	//Mitzi
	if(mitziOutsideShip())
	{
		if(flags["MET_MITZI"] == undefined)
		{
			if(!pc.hasStatusEffect("SeenMitzi"))
			{
				pc.createStatusEffect("SeenMitzi");
				pc.setStatusMinutes("SeenMitzi",120);
			}
			output("\n\n<b>A buxon gabilani leans against the side of your ship, vacantly chewing bubblegum and twirling a lock of purple-dyed hair.</b> She doesn’t seem the least bit concerned about anything else.");
			addButton(btnSlot++,"Gabilani",mitziFirstShipApproach);
		}
		//Mitzi has been kicked off or is lurking around.
		else
		{
			output("\n\nMitzi the gabilani bimbo is lounging around, casting ‘fuck-me’ eyes at everything with two legs... or three... or more.");
			addButton(btnSlot++,"Mitzi",mitziLurkingApproach);
		}
	}
	
	// Ships
	if (flags["FALL OF THE PHOENIX STATUS"] == 1)
	{
		output("\n\n<i>The Phoenix</i> is nearby, only a stones-throw away from your own ship, docked in a much smaller neighboring hangar.");
		
		if (flags["SAENDRA PHOENIX AVAILABLE"] != undefined)
			addButton(7, "The Phoenix", move, "PHOENIX RECROOM");
		else
			addDisabledButton(7, "The Phoenix", "The Phoenix", "This ship is locked and cannot be entered.");
	}
	
	return false;
}

public function merchantThoroughfareBonus():Boolean
{
	if(currentLocation == "9015")
	{
		vendingMachineButton(0, "J'ejune");
	}
	if(currentLocation == "9017")
	{
		repeatGilBonus();
	}
	if(currentLocation == "9018")
	{
		darkChrysalisStorefront();
		output("\n\nTo the west, you see a brightly-lit shop labeled as “Fur Effect.”");
		if(gilPupperProccer()) return true;
	}
	else flags["NAV_DISABLED"] = undefined;
	return false;
}

public function redlightNEBonus():void
{
	// Sentient Acquisitions
	// SUGGESTED: North eastern bend of red light district.
	output("\n\n");
	if(flags["ENTERED_ACQUISITIONS"] == undefined) output("To the east is a rather stark, backlit white shop front, strikingly severe amongst the pulsing purples and reds which are the norm in this lurid end of Tavros. “Sentient Acquisitions” is written in a modish black font above the door.");
	else if(!sentientAcquisitionsIsOpen())
	{
		output("To the east is Sentient Acquisitions. Its white windows are dull, a prim black ‘Closed’ sign displayed above the door. Presumably its proprietors are elsewhere.");
		flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
	}
	else output("To the east is the unmistakable white glare of Sentient Acquisitions.");
}
public function redlightSEBonus():void
{
	vendingMachineButton(0, "XXX");
}

public function anonsBarAddendums():Boolean {
	anonsBarWaitressAddendum(0);
	alexManHermIntro(1);
	ShellyBlurb(2);
	if (saendraBarAddendum(3)) return true;
	annoAtAnonsAddendum(4);
	
	var NPCs:Array = [];
	if (ramisAtAnons()) NPCs.push(ramisAtAnonsAddendum);
	if (fisiAtAnons()) NPCs.push(fisiAtAnonsAddendum);
	if (NPCs.length > 0) NPCs[rand(NPCs.length)](5);
	
	roamingBarEncounter(7);
	return false;
}

public function anonsBoardBonus():Boolean
{
	//If PC has done Fools Rush In: Part 2 (ie, helping Saendra rescue her friend), add [Call Girl] to Anon's Bar.
	zilCallGirlAddendum(0);
	return false;
}

//adds a Button for the Notice Board on the residential deck on Tavros
public function tavrosRDActiveNotice():Boolean
{
	var openNotice:int = 0;
	
	if(flags["AINA_NOTICE_1_READ"] == undefined) openNotice++;
	if(flags["FYN_NOTICE_1_READ"] == undefined) openNotice++;
	
	if(openNotice > 0) return true;
	return false;
}
public function tavrosResidentialDeckNoticeBoard():void
{
	output("\n\nA holographic board floats here, littered with community notices for deck residents. It seems anyone can put a message here, and quite a few people have taken advantage of it.");
	addButton(0,"NoticeBoard",displayNoticeBoardRD);
}
public function displayNoticeBoardRD():void {
	clearOutput();
	
	output("While this public notice board is holographic, it’s easy to bring up a digipen and scribble whatever you want on it. There’s a section for official notices to deck residents, informing them of maintenance schedules and other important events. The rest is for use by the public; filled with general requests or advertisements.");
	
	output("\n\n");
	if(flags["AINA_NOTICE_1_READ"] == undefined) {
		output("<b>New:</b>");
		flags["AINA_NOTICE_1_READ"] = true;
	}
	else output("<b>Seen Before:</b>");
	output(" It appears someone in the western walkway, room 154, is looking for a ‘discreet individual’ to help them with an unspecified problem. Pretty ambiguous.");
	
	output("\n\n");
	if(flags["FYN_NOTICE_1_READ"] == undefined) {
		output("<b>New:</b>");
		flags["FYN_NOTICE_1_READ"] = true;
	}
	else output("<b>Seen Before:</b>");
	output(" There’s a notice for ‘interested individuals’ to visit the eastern walkway for ‘lessons’, room 112. There seems to have been more to the message, but someone else has placed their own holo notice over it.");
	
	output("\n\n");
	if(flags["SEMITH_NOTICE_1_READ"] == undefined) {
		output("<b>New:</b>");
		flags["SEMITH_NOTICE_1_READ"] = true;
	}
	else output("<b>Seen Before:</b>");
	output(" “Itching for a game of 4D chess?” reads one note, in tall, loopy cursive. “The north-west plaza has tables. Always around in the afternoons.”");
	
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function northEastPlazaBonus():void
{
	fisiAtResDeckAddendum(0);
}

public function northWalkwayBonus():void
{
	fisiannaApartmentHandler(0);
	kaseApartmentHandler(1);
}