import classes.RoomClass;
public function kiInitRooms():void
{
	var planetName:String = "SHIP: KASHIMA";
	var systemName:String = "SYSTEM: SINDATHU";

	// Cargo Deck -> ShuttleLZ
	rooms["KI-E29"] = new RoomClass(this);
	rooms["KI-E29"].roomName = "SHUTTLE\nHANGAR";
	rooms["KI-E29"].description = "";
	rooms["KI-E29"].runOnEnter = kiEnterShuttleLZ;
	rooms["KI-E29"].planet = planetName;
	rooms["KI-E29"].system = systemName;
	rooms["KI-E29"].northExit = "KI-E27";
	rooms["KI-E29"].addFlag(GLOBAL.INDOOR);
	rooms["KI-E29"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["KI-E27"] = new RoomClass(this);
	rooms["KI-E27"].roomName = "HANGAR\nDECK";
	rooms["KI-E27"].description = "The <i>Kashima</i>’s hangar deck is huge and wide open, meant for heavy cargo haulers to be coming and going from it day in and day out, ferrying its minerals out into the galaxy. Aside from the shuttle you came in on, though, the deck is completely devoid of ships. Not even the vessel’s emergency lander is here. What the hell happened to everything?";
	rooms["KI-E27"].runOnEnter = kiApproachingEscapeShuttle;
	rooms["KI-E27"].planet = planetName;
	rooms["KI-E27"].system = systemName;
	rooms["KI-E27"].northExit = "KI-E25";
	rooms["KI-E27"].southExit = "KI-E29";
	rooms["KI-E27"].addFlag(GLOBAL.INDOOR);

	rooms["KI-E25"] = new RoomClass(this);
	rooms["KI-E25"].roomName = "ELEVATOR\nTERMINAL";
	rooms["KI-E25"].description = "";
	rooms["KI-E25"].runOnEnter = kiElevatorTerminal;
	rooms["KI-E25"].planet = planetName;
	rooms["KI-E25"].system = systemName;
	rooms["KI-E25"].southExit = "KI-E27";
	rooms["KI-E25"].northExit = "KI-E23";
	rooms["KI-E25"].eastExit = "KI-PersonalElevators";
	rooms["KI-E25"].addFlag(GLOBAL.INDOOR);
	
	rooms["KI-PersonalElevators"] = new RoomClass(this);
	rooms["KI-PersonalElevators"].roomName = "PERSONNEL\nELEVATORS";
	rooms["KI-PersonalElevators"].planet = planetName;
	rooms["KI-PersonalElevators"].system = systemName;
	rooms["KI-PersonalElevators"].westExit = "KI-E25";
	rooms["KI-PersonalElevators"].addFlag(GLOBAL.INDOOR);
	rooms["KI-PersonalElevators"].addFlag(GLOBAL.LIFTDOWN);

	rooms["KI-E23"] = new RoomClass(this);
	rooms["KI-E23"].roomName = "CARGO\nLIFT";
	rooms["KI-E23"].description = "A heavy duty cargo elevator, fit for shuttling massive structural loads around the interior of the ship without breaking a sweat. The exposed, unfinished polysteel looks battered and worn from a long life serving its purpose, but you have no doubt this thing could get you where you need to go.";
	rooms["KI-E23"].runOnEnter = kiCargoLiftRoomFunction;
	rooms["KI-E23"].planet = planetName;
	rooms["KI-E23"].system = systemName;
	rooms["KI-E23"].southExit = "KI-E25";
	rooms["KI-E23"].addFlag(GLOBAL.INDOOR);
	rooms["KI-E23"].addFlag(GLOBAL.LIFTDOWN);

	// Command Deck -> Medbay
	rooms["KI-H16"] = new RoomClass(this);
	rooms["KI-H16"].roomName = "\nMEDBAY";
	rooms["KI-H16"].description = "The <i>Kashima</i>’s medical bay is about what you’d expect for a large-crew, long-mission ship: spacious, high-tech, and well-equipped. It’s been ransacked by the creatures that now call the vessel home, with equipment toppled and chemicals spilled every which way. A single viewport gives you a marvelous overlook of the rocky ball the <i>Kashima</i>’s attached to: lifeless, gray and rocky. The med-bay reeks of sex, like you just missed an orgy in here.\n\nThe place looks secure enough for you to take a load off and rest up.";
	rooms["KI-H16"].runOnEnter = kiEnterMedbay;
	rooms["KI-H16"].planet = planetName;
	rooms["KI-H16"].system = systemName;
	rooms["KI-H16"].southExit = "KI-H18";
	rooms["KI-H16"].addFlag(GLOBAL.INDOOR);
	rooms["KI-H16"].addFlag(GLOBAL.BED);
	rooms["KI-H16"].addFlag(GLOBAL.MEDICAL);

	rooms["KI-H18"] = new RoomClass(this);
	rooms["KI-H18"].roomName = "COMMAND\nDECK";
	rooms["KI-H18"].description = "A single long corridor runs from the <i>Kashima</i>’s bridge to the rear of the ship’s body. The corridor is dark, barely illuminated by damaged, flickering red emergency lights. Smooth bulkheads are marred by evidence of monstrous debauchery, splattered with the cum of a dozen races, intermingled into an overwhelmingly sexual aroma.\n\nThere’s a semi-transparent window to the north with the words ‘MEDBAY’ stenciled in white across it, overtop the galactic med-corp symbol. ";
	rooms["KI-H18"].runOnEnter = kiH18RoomFunction;
	rooms["KI-H18"].planet = planetName;
	rooms["KI-H18"].system = systemName;
	rooms["KI-H18"].northExit = "KI-H16";
	rooms["KI-H18"].eastExit = "KI-J18";
	rooms["KI-H18"].addFlag(GLOBAL.INDOOR);
	rooms["KI-H18"].addFlag(GLOBAL.HAZARD);

	rooms["KI-J18"] = new RoomClass(this);
	rooms["KI-J18"].roomName = "COMMAND\nDECK";
	rooms["KI-J18"].description = "A single long corridor runs from the <i>Kashima</i>’s bridge to the rear of the ship’s body. The corridor is dark, barely illuminated by damaged, flickering red emergency lights. Smooth bulkheads are marred by evidence of monstrous debauchery, splattered with the cum of a dozen races, intermingled into an overwhelmingly sexual aroma.\n\nThere’s a restroom on either side of the corridor here. From the sounds coming from inside them both, you figure entering will only get you into another fight with the mutant crewmen.";
	rooms["KI-J18"].runOnEnter = commandDeckRandomEncounter;
	rooms["KI-J18"].planet = planetName;
	rooms["KI-J18"].system = systemName;
	rooms["KI-J18"].westExit = "KI-H18";
	rooms["KI-J18"].eastExit = "KI-L18";
	rooms["KI-J18"].addFlag(GLOBAL.INDOOR);
	rooms["KI-J18"].addFlag(GLOBAL.HAZARD);

	rooms["KI-L18"] = new RoomClass(this);
	rooms["KI-L18"].roomName = "COMMAND\nDECK";
	rooms["KI-L18"].description = "A single long corridor runs from the <i>Kashima</i>’s bridge to the rear of the ship’s body. The corridor is dark, barely illuminated by damaged, flickering red emergency lights. Smooth bulkheads are marred by evidence of monstrous debauchery, splattered with the cum of a dozen races, intermingled into an overwhelmingly sexual aroma.\n\nTo the south is a bank of elevators. One set for crew, another meant for handling heavy cargo. Both sets of elevators have been disabled... you don’t think you could stand up to another ambush like that again.";
	rooms["KI-L18"].runOnEnter = kiL18RoomFunction;
	rooms["KI-L18"].planet = planetName;
	rooms["KI-L18"].system = systemName;
	rooms["KI-L18"].westExit = "KI-J18";
	rooms["KI-L18"].eastExit = "KI-N18";
	rooms["KI-L18"].southExit = "KI-L20";
	rooms["KI-L18"].addFlag(GLOBAL.INDOOR);
	rooms["KI-L18"].addFlag(GLOBAL.HAZARD);

	rooms["KI-L20"] = new RoomClass(this);
	rooms["KI-L20"].roomName = "ELEVATOR\nBANK";
	rooms["KI-L20"].description = "You’re standing in the elevator terminal that connects the handful of decks on the long, slender vessel. Bright purple and pink letters on the bulkhead read ‘COMMAND DECK’. The cargo shaft reeks of cum and other sex-fluids, and the other elevators are sealed under emergency lockdown. Looks like you’re not going anywhere here!";
	rooms["KI-L20"].runOnEnter = function():Boolean
	{
		flags["NAV_DISABLED"] = NAV_SOUTH_DISABLE;
		return false;
	};
	rooms["KI-L20"].planet = planetName;
	rooms["KI-L20"].system = systemName;
	rooms["KI-L20"].northExit = "KI-L18";
	rooms["KI-L20"].southExit = "KI-L22";
	rooms["KI-L20"].addFlag(GLOBAL.INDOOR);
	rooms["KI-L20"].addFlag(GLOBAL.HAZARD);

	rooms["KI-L22"] = new RoomClass(this);
	rooms["KI-L22"].roomName = "";
	rooms["KI-L22"].description = "";
	rooms["KI-L22"].runOnEnter = commandDeckRandomEncounter;
	rooms["KI-L22"].planet = planetName;
	rooms["KI-L22"].system = systemName;
	rooms["KI-L22"].northExit = "KI-L20";
	rooms["KI-L22"].addFlag(GLOBAL.INDOOR);
	rooms["KI-L22"].addFlag(GLOBAL.HAZARD);

	rooms["KI-N18"] = new RoomClass(this);
	rooms["KI-N18"].roomName = "COMMAND\nDECK";
	rooms["KI-N18"].description = "A single long corridor runs from the <i>Kashima</i>’s bridge to the rear of the ship’s body. The corridor is dark, barely illuminated by damaged, flickering red emergency lights. Smooth bulkheads are marred by evidence of monstrous debauchery, splattered with the cum of a dozen races, intermingled into an overwhelmingly sexual aroma.\n\nAn airlock door sits on the north bulkhead, though the control panel has been ripped out. The wires inside are slathered in spooge, making sure nobody’s operating it without a serious deep cleaning.";
	rooms["KI-N18"].runOnEnter = commandDeckRandomEncounter;
	rooms["KI-N18"].planet = planetName;
	rooms["KI-N18"].system = systemName;
	rooms["KI-N18"].westExit = "KI-L18";
	rooms["KI-N18"].eastExit = "KI-P18";
	rooms["KI-N18"].addFlag(GLOBAL.INDOOR);
	rooms["KI-N18"].addFlag(GLOBAL.HAZARD);

	rooms["KI-R18"] = new RoomClass(this);
	rooms["KI-R18"].roomName = "KASHIMA’S\nBRIDGE";
	rooms["KI-R18"].description = "The bridge of the <i>Kashima</i> is a sweeping, curved affair with banks of holo-consoles along the rear bulkheads and the helm and conn positions near a towering forward viewscreen. A captain’s chair sits in the center of the room, high above the other stations and all but radiating authority. Flickering lights from the still-active computer banks illuminate an otherwise dark chamber, suffering from critical battle damage. Wires and shards of metal hang from the ceiling and break from shattered bulkhead panels. Cum oozes from above, and slathers the deck pretty much everywhere.\n\nThe fallen Captain Holmes is slumped against his chair, right where you left him.";
	rooms["KI-R18"].runOnEnter = kiEnterTheBridge;
	rooms["KI-R18"].planet = planetName;
	rooms["KI-R18"].system = systemName;
	rooms["KI-R18"].westExit = "KI-P18";
	rooms["KI-R18"].addFlag(GLOBAL.INDOOR);
	rooms["KI-R18"].addFlag(GLOBAL.HAZARD);

	rooms["KI-P18"] = new RoomClass(this);
	rooms["KI-P18"].roomName = "COMMAND\nDECK";
	rooms["KI-P18"].description = "A single long corridor runs from the <i>Kashima</i>’s bridge to the rear of the ship’s body. The corridor is dark, barely illuminated by damaged, flickering red emergency lights. Smooth bulkheads are marred by evidence of monstrous debauchery, splattered with the cum of a dozen races, intermingled into an overwhelmingly sexual aroma.";
	rooms["KI-P18"].runOnEnter = kiP18CommandDeck;
	rooms["KI-P18"].planet = planetName;
	rooms["KI-P18"].system = systemName;
	rooms["KI-P18"].eastExit = "KI-R18";
	rooms["KI-P18"].westExit = "KI-N18";
	rooms["KI-P18"].northExit = "KI-P16";
	rooms["KI-P18"].addFlag(GLOBAL.INDOOR);
	rooms["KI-P18"].addFlag(GLOBAL.HAZARD);

	rooms["KI-P16"] = new RoomClass(this);
	rooms["KI-P16"].roomName = "CAPTAIN’S\nREADY ROOM";
	rooms["KI-P16"].description = "The captain of the <i>Kashima</i> has his ready room in good array, with a bookshelf along one bulkhead and a huge holoscreen on the other. His desk has a terminal, several dataslates marked from the ship’s departments, and a plate with a half-eaten sandwich and a glass of stale orange juice on it. Looks like he got interrupted during lunch.";
	rooms["KI-P16"].runOnEnter = kiP16CaptainsReadyRoom;
	rooms["KI-P16"].planet = planetName;
	rooms["KI-P16"].system = systemName;
	rooms["KI-P16"].southExit = "KI-P18";
	rooms["KI-P16"].addFlag(GLOBAL.INDOOR);

	// Officers Quarters
	
	rooms["KI-OfficersAccessRoom"] = new RoomClass(this);
	rooms["KI-OfficersAccessRoom"].roomName = "ACCESS\nROOM";
	rooms["KI-OfficersAccessRoom"].description = "Due to the sheer size and scale of the ship, there are countless passageways and maintenance shafts criss-crossing the interior of the hull. Luckily for you, the ventilation system is one such important facet of the ship that routes through these access points, giving you a pretty quiet and inconspicious place to gather yourself after a crushingly claustrophic trip.\n\nThe ventilation shaft access is here, hanging open for you.";
	rooms["KI-OfficersAccessRoom"].runOnEnter = function():void {
		addButton(0, "Vents", kiE9EnterVents, undefined, "Enter Vents", "Crawl into the vents and move around the ship.");
	};
	rooms["KI-OfficersAccessRoom"].planet = planetName;
	rooms["KI-OfficersAccessRoom"].system = systemName;
	rooms["KI-OfficersAccessRoom"].eastExit = "KI-E9";
	rooms["KI-OfficersAccessRoom"].addFlag(GLOBAL.INDOOR);
	rooms["KI-OfficersAccessRoom"].addFlag(GLOBAL.OBJECTIVE);
	
	rooms["KI-E9"] = new RoomClass(this);
	rooms["KI-E9"].roomName = "OFFICER’S\nQUARTERS";
	rooms["KI-E9"].description = "One of the big draws of working for Steele Tech’s always been the lush accommodations, and the <i>Kashima</i>’s no exception to the rule. The officer’s quarters are arrayed along a winding corridor that’s got lush, thick carpeting and padded bulkheads alight with holoscreens displaying company adverts.\n\nThe access room, and the vent that brought you to this deck, is just off to the west, offering at least some semblance of a place you could consider safe enough to catch a breather.";
	rooms["KI-E9"].runOnEnter = officersDeckRandomEncounter;
	rooms["KI-E9"].planet = planetName;
	rooms["KI-E9"].system = systemName;
	rooms["KI-E9"].eastExit = "KI-G9";
	rooms["KI-E9"].westExit = "KI-OfficersAccessRoom";
	rooms["KI-E9"].addFlag(GLOBAL.INDOOR);
	rooms["KI-E9"].addFlag(GLOBAL.HAZARD);

	rooms["KI-G9"] = new RoomClass(this);
	rooms["KI-G9"].roomName = "OFFICER’S\nQUARTERS";
	rooms["KI-G9"].description = "One of the big draws of working for Steele Tech’s always been the lush accommodations, and the <i>Kashima</i>’s no exception to the rule. The officer’s quarters are arrayed along a winding corridor that’s got lush, thick carpeting and padded bulkheads alight with holoscreens displaying company adverts.\n\nThe corridor twists north to west here, with an access in the corner leading to a public restroom.";
	rooms["KI-G9"].runOnEnter = officersDeckRandomEncounter;
	rooms["KI-G9"].planet = planetName;
	rooms["KI-G9"].system = systemName;
	rooms["KI-G9"].westExit = "KI-E9";
	rooms["KI-G9"].northExit = "KI-G7";
	rooms["KI-G9"].addFlag(GLOBAL.INDOOR);
	rooms["KI-G9"].addFlag(GLOBAL.HAZARD);

	rooms["KI-G7"] = new RoomClass(this);
	rooms["KI-G7"].roomName = "OFFICER’S\nQUARTERS";
	rooms["KI-G7"].description = "One of the big draws of working for Steele Tech’s always been the lush accommodations, and the <i>Kashima</i>’s no exception to the rule. The officer’s quarters are arrayed along a winding corridor that’s got lush, thick carpeting and padded bulkheads alight with holoscreens displaying company adverts.\n\nA matter replicator displaying Steele-brand synth-coffee sits in the wall. Not surprisingly at this point, it’s been blasted with spooge. Cum drips out of the spigot, even. How’d that even happen?";
	rooms["KI-G7"].runOnEnter = officersDeckRandomEncounter;
	rooms["KI-G7"].planet = planetName;
	rooms["KI-G7"].system = systemName;
	rooms["KI-G7"].southExit = "KI-G9";
	rooms["KI-G7"].northExit = "KI-G5";
	rooms["KI-G7"].addFlag(GLOBAL.INDOOR);
	rooms["KI-G7"].addFlag(GLOBAL.HAZARD);

	rooms["KI-G5"] = new RoomClass(this);
	rooms["KI-G5"].roomName = "OFFICER’S\nQUARTERS";
	rooms["KI-G5"].description = "One of the big draws of working for Steele Tech’s always been the lush accommodations, and the <i>Kashima</i>’s no exception to the rule. The officer’s quarters are arrayed along a winding corridor that’s got lush, thick carpeting and padded bulkheads alight with holoscreens displaying company adverts.\n\nTo the west is the Chief Engineer’s quarters. North is the Executive Officer’s quarters. Eastward are more rooms.";
	rooms["KI-G5"].runOnEnter = officersDeckRandomEncounter;
	rooms["KI-G5"].planet = planetName;
	rooms["KI-G5"].system = systemName;
	rooms["KI-G5"].northExit = "KI-G3";
	rooms["KI-G5"].eastExit = "KI-I5";
	rooms["KI-G5"].southExit = "KI-G7";
	rooms["KI-G5"].westExit = "KI-E5";
	rooms["KI-G5"].addFlag(GLOBAL.INDOOR);
	rooms["KI-G5"].addFlag(GLOBAL.HAZARD);

	rooms["KI-E5"] = new RoomClass(this);
	rooms["KI-E5"].roomName = "CHIEF ENG.\nQUARTERS";
	rooms["KI-E5"].description = "The chief engineer’s abode is fairly cramped compared to the luxury outside -- though that may be largely due to the huge computer bank against the far wall, and the crates of computer and robotics parts scattered about. The room’s a mess, though it doesn’t show any sign of struggle. Looks like whoever lived here was just a slob. Half a robot’s been disassembled on the desk, a male-form chassis with its electronic guts exposed. The exterior reminds you of synth-skin, a little too advanced for a work drone. Looks more like a sexbot to you.";
	rooms["KI-E5"].runOnEnter = kiE5EngineersQuarters;
	rooms["KI-E5"].planet = planetName;
	rooms["KI-E5"].system = systemName;
	rooms["KI-E5"].eastExit = "KI-G5";
	rooms["KI-E5"].addFlag(GLOBAL.INDOOR);

	rooms["KI-G3"] = new RoomClass(this);
	rooms["KI-G3"].roomName = "EXECUTIVE\nQUARTERS";
	rooms["KI-G3"].description = "This room belonged to the <i>Kashima</i>’s XO, and it’s been all but completely destroyed. Wall panels are torn out, furniture tossed aside, and what looks like streaks of cum both white and pink are all over the walls. The only thing left mostly intact is the disarrayed, stained bed. The room reeks of sex, almost making you gag.";
	rooms["KI-G3"].runOnEnter = kiG3Exec;
	rooms["KI-G3"].planet = planetName;
	rooms["KI-G3"].system = systemName;
	rooms["KI-G3"].southExit = "KI-G5";
	rooms["KI-G3"].addFlag(GLOBAL.INDOOR);

	rooms["KI-I5"] = new RoomClass(this);
	rooms["KI-I5"].roomName = "OFFICER’S\nQUARTERS";
	rooms["KI-I5"].description = "One of the big draws of working for Steele Tech’s always been the lush accommodations, and the <i>Kashima</i>’s no exception to the rule. The officer’s quarters are arrayed along a winding corridor that’s got lush, thick carpeting and padded bulkheads alight with holoscreens displaying company adverts.\n\nNorth is the Chief Science Officer’s quarters. East is the doctor’s quarters, marked with the name ‘C.M.O. Elenora Vanderbilt, M.D.’\n\nA passage leading south to a communal kitchen has been crushed in by some sort of explosion, completely blocking your access. Several of the mutant crewmen can be seen beyond the wreckage, vigorously fucking.";
	rooms["KI-I5"].runOnEnter = officersDeckRandomEncounter;
	rooms["KI-I5"].planet = planetName;
	rooms["KI-I5"].system = systemName;
	rooms["KI-I5"].eastExit = "KI-K5";
	rooms["KI-I5"].westExit = "KI-G5";
	rooms["KI-I5"].northExit = "KI-I3";
	rooms["KI-I5"].addFlag(GLOBAL.INDOOR);
	rooms["KI-I5"].addFlag(GLOBAL.HAZARD);

	rooms["KI-K5"] = new RoomClass(this);
	rooms["KI-K5"].roomName = "C.M.O’s\nQUARTERS";
	rooms["KI-K5"].description = "Elenora’s quarters are surprisingly tidy, given the state of the rest of the ship. A medical kit is on the wall, hanging open, and a holo-terminal is on the desk below it, still active and showing a flickering image of an extranet dating service with a half-filled profile. A dresser full of clothes stands against one wall, and several degrees and honors are hanging above it.";
	rooms["KI-K5"].runOnEnter = kiK5CMOQuarters;
	rooms["KI-K5"].planet = planetName;
	rooms["KI-K5"].system = systemName;
	rooms["KI-K5"].westExit = "KI-I5";
	rooms["KI-K5"].addFlag(GLOBAL.INDOOR);

	rooms["KI-I3"] = new RoomClass(this);
	rooms["KI-I3"].roomName = "SCIENCE\nQUARTERS";
	rooms["KI-I3"].description = "The chief science officer appears to have been a well-respected mineralogist, if the host of degrees and scientific awards on the walls are any indication. The one photograph on the wall shows a very large ausar family: two men, three women, and about a dozen kids. Several samples of minerals and metals are neatly cataloged in shelves on the wall, thankfully spared from any harm during the crisis.";
	rooms["KI-I3"].runOnEnter = kiI3Science;
	rooms["KI-I3"].planet = planetName;
	rooms["KI-I3"].system = systemName;
	rooms["KI-I3"].southExit = "KI-I5";
	rooms["KI-I3"].addFlag(GLOBAL.INDOOR);

	rooms["KI-Engineering"] = new RoomClass(this);
	rooms["KI-Engineering"].roomName = "\nENGINEERING";
	rooms["KI-Engineering"].description = "";
	rooms["KI-Engineering"].runOnEnter = kiEngineeringFight;
	rooms["KI-Engineering"].westExit = "KI-EngineeringVent";
	rooms["KI-Engineering"].planet = planetName;
	rooms["KI-Engineering"].system = systemName;
	rooms["KI-Engineering"].addFlag(GLOBAL.INDOOR);
	rooms["KI-Engineering"].addFlag(GLOBAL.HAZARD);
	
	rooms["KI-EngineeringVent"] = new RoomClass(this);
	rooms["KI-EngineeringVent"].roomName = "ACCESS\nROOM";
	rooms["KI-EngineeringVent"].description = "A near-claustrophobic room full of random odds and ends, obviously used as a makeshift place for storage rather than its clearly intended purpose as a means of accessing an array of maintenance shafts around the ship.";
	rooms["KI-EngineeringVent"].eastExit = "KI-Engineering";
	rooms["KI-EngineeringVent"].runOnEnter = kiEngineeringAccessRoom;
	rooms["KI-EngineeringVent"].planet = planetName;
	rooms["KI-EngineeringVent"].system = systemName;
	rooms["KI-EngineeringVent"].addFlag(GLOBAL.INDOOR);
	rooms["KI-EngineeringVent"].addFlag(GLOBAL.OBJECTIVE);
}
