

public function flyToTavros():void
{
	output("You fly to Tavros");
	if(leaveShipOK()) output(" and step out of your ship.");
}
public function puntToShip():Boolean
{
	clearOutput();
	if(currentLocation == "POESPACE" && flags["POE_A_DISABLED"] == undefined)
	{
		landingOnPoeA();
		return true;
	}
	output("You really don't want to step out into the cold void of space. Maybe you should land somewhere?");
	currentLocation = "SHIP INTERIOR";
	generateMap();
	showLocationName();
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	return true;
}

public function liftMove(destination:String):void
{
	clearOutput();
	output("Your stomach drops as the lift kicks into gear. The gentle, steady thrum of powerful machinery fills the metallic tube as you are brought to your destination, slowly decelerating when you arrive.");
	move(destination,false);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function hangarBonus():Boolean 
{
	output("You’re within a stuffy tube of metal and plastic. Steady, mechanical thrums suffuse the air around you. The inside of the cylinder-like lift is lined by a brass-hued railing, used to steady oneself during high speed travel through the kilometers-long station.\n\nThere’s a sturdy mechanical keypad with which to designate your target level. Right now, the only floors of interest are the hangar, merchant and residential levels.");
	
	if (flags["SAENDRA_XPACK1_STATUS"] == 1 || flags["SAENDRA_XPACK1_STATUS"] == 2)
	{
		output("\n\nYou also have the option to take the lift up to Deck 92 to meet up with Saendra");
		if(flags["SAENDRA_XPACK1_STATUS"] == 2) output(". You are sure taking your time about it though");
		output("--whatever she contacted you about, it sounded pretty urgent.");
		addButton(0, "Deck 92", saendraX1LiftGo); 
	}
	
	if(currentLocation == "LIFT: MERCHANT DECK") {
		output("\n\n<b>You are currently on the merchant deck.</b>");
		addButton(7,"Down",liftMove, "TAVROS LIFT");
		addButton(5,"Up",liftMove, "LIFT: RESIDENTIAL DECK");
	}
	else if(currentLocation == "TAVROS LIFT") {
		output("\n\n<b>You are currently on the hangar deck.</b>");
		addButton(5,"Up",liftMove, "LIFT: MERCHANT DECK");
	} 
	else if(currentLocation == "LIFT: RESIDENTIAL DECK") {
		output("\n\n<b>You are currently on the residential deck.</b>");
		addButton(7,"Down",liftMove, "LIFT: MERCHANT DECK");
	}
	return false;
}

public function tavrosHangarStuff():Boolean
{
	if(flags["MET_VAHN"] == undefined) {
		output("\n\nYou spot a blond, half-ausar technician standing next to your ship, looking down at a datapad.");
		addButton(0,"Tech",VahnTheMechanic);
	}
	else
	{
		output("\n\nVahn's around here somewhere, if you want to look for him.");
		addButton(0,"Vahn",VahnTheMechanic);
	}
	//Celise In Tavros
	if(celiseIsFollower() && !celiseIsCrew())
	{
		output("\n\nCelise is lounging here, just as green as ever and chatting amicably with one of the station's mechanics.");
		addButton(1,"Celise",approachNonCrewCelise);
	}
	if (bessAtTavros())
	{
		output("\n\n[bess.name] is here, waiting around and generally staying out of the way as best [bess.heShe] can.");
		addButton(2, bess.short, approachBessAtTavros);
	}
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

public function merchantThoroughfareBonus():void
{
	if(currentLocation == "9018")
	{
		if(pc.hasStatusEffect("Dark Chrysalis Closed")) {
			output("\n\nThe Dark Chrysalis is closed. Even its “Doing a Slut” sign is dark. You suspect its proprietor is sleeping off a heavy hangover. ");
			flags["NAV_DISABLED"] = NAV_EAST_DISABLE;
		}
		else {
			output("\n\nThe Dark Chrysalis, a shop that specializes in targeted, cosmetic transformatives is doing business to the east. ");
			flags["NAV_DISABLED"] = undefined;
		}
		output("\n\nTo the west, you see a brightly-lit shop labeled as “Fur Effect.”");
	}
	else flags["NAV_DISABLED"] = undefined;
}

public function anonsBarAddendums():Boolean {
	if (saendraBarAddendum(3))
	{
		return true;
	}
	anonsBarWaitressAddendum(0);
	alexManHermIntro(1);
	ShellyBlurb(2);
	annoAtAnonsAddendum(4);
	ramisAtAnonsAddendum(5);
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
	
	output("While this public notice board is holographic, it's easy to bring up a digipen and scribble whatever you want on it. There's a section for official notices to deck residents, informing them of maintenance schedules and other important events. The rest is for use by the public; filled with general requests or advertisements.");
	
	output("\n\n");
	if(flags["AINA_NOTICE_1_READ"] == undefined) {
		output("<b>New:</b>");
		flags["AINA_NOTICE_1_READ"] = true;
	}
	else output("<b>Seen Before:</b>");
	output(" It appears someone in the western walkway, room 154, is looking for a 'discreet individual' to help them with an unspecified problem. Pretty ambiguous.");
	
	output("\n\n");
	if(flags["FYN_NOTICE_1_READ"] == undefined) {
		output("<b>New:</b>");
		flags["FYN_NOTICE_1_READ"] = true;
	}
	else output("<b>Seen Before:</b>");
	output(" There's a notice for 'interested individuals' to visit the eastern walkway for 'lessons', room 112. There seems to have been more to the message, but someone else has placed their own holo notice over it.");
	
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