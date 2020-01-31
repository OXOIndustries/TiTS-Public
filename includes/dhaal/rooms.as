public function dhaalCoordinatesUnlocked():Boolean
{
	return (flags["SHOCK_HOPPER_DEFEATED"] != undefined || flags["CHEAT_UNLOCK_DHAAL"] != undefined);
}
public function dhaalGyreEncounters():Boolean
{
	IncrementFlag("DHAAL_GYRE_STEP");
	var encounters:Array = [];
	//First 3 times are gimmes, then increasing odds till step 15 or so.
	if(flags["DHAAL_GYRE_STEP"] -4 > rand(20))
	{
		flags["DHAAL_GYRE_STEP"] = 0;
			
		encounters.push(encounterMilkThief);
	}
	if(encounters.length > 0) 
	{
		return encounters[rand(encounters.length)]();
	}
	return false;
}
public function initDhaalRooms():void
{
	/*
	rooms[""] = new RoomClass(this);
	rooms[""].roomName = "";
	rooms[""].description = "";
	rooms[""].planet = "PLANET: UVETO VII";
	rooms[""].system = "SYSTEM: SIRETTA";
	rooms[""].northExit = ;
	rooms[""].eastExit = ;
	rooms[""].southExit = ;
	rooms[""].westExit = ;
	rooms[""].moveMinutes = 1;
	*/

	/** UVETO STATION --------------------------------------------------------------- */
	/** ----------------------------------------------------------------------------- */
	
	/* Ship Docking */
	rooms["DHAAL J3"] = new RoomClass(this);
	rooms["DHAAL J3"].roomName = "SPACEPORT\nTARMAC";
	rooms["DHAAL J3"].description = "The crude asphalt of this tarmac is one sign of many that these landing pads were thrown together in a hurry. It’s already been cracked and patched in dozens of places, though you have to look carefully under the ever-present neon glow to see it. Flickering holographic displays bid you journey south on an escalator-turned stairwell to venture into the city proper. Much small advisories in black print advise you of danger, but they hardly seem important next to retina-scorching adverts for safe, natural Brightwater.";
	rooms["DHAAL J3"].planet = "PLANET: DHAAL";
	rooms["DHAAL J3"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J3"].northExit = "";
	rooms["DHAAL J3"].eastExit = "";
	rooms["DHAAL J3"].southExit = "DHAAL J5";
	rooms["DHAAL J3"].westExit = "";
	rooms["DHAAL J3"].moveMinutes = 5;
	rooms["DHAAL J3"].runOnEnter = dhaalSpaceportBonus;
	rooms["DHAAL J3"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL J3"].addFlag(GLOBAL.SHIPHANGAR);

	rooms["DHAAL J5"] = new RoomClass(this);
	rooms["DHAAL J5"].roomName = "MEAN\nSTREETS";
	rooms["DHAAL J5"].description = "With a twilight sky and stratospheric buildings on every side, you can see why Dhaal is considered every bit as much an urban jungle as Terra herself. Lit by a looping advertisement for the new line of “Salivation” branded nutrient broths, this shadowy road has enough dark alleys and nooks to hide two or three gangs worth of miscreants. Best get to your destination in a hurry.\n\nThe landing pads lie north, the rest of the city south.";
	rooms["DHAAL J5"].planet = "PLANET: DHAAL";
	rooms["DHAAL J5"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J5"].northExit = "DHAAL J3";
	rooms["DHAAL J5"].eastExit = "";
	rooms["DHAAL J5"].southExit = "DHAAL J7";
	rooms["DHAAL J5"].westExit = "";
	rooms["DHAAL J5"].moveMinutes = 5;
	rooms["DHAAL J5"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL J5"].addFlag(GLOBAL.HAZARD);
	rooms["DHAAL J5"].addFlag(GLOBAL.OUTDOOR);

	rooms["DHAAL J7"] = new RoomClass(this);
	rooms["DHAAL J7"].roomName = "MEAN\nSTREETS";
	rooms["DHAAL J7"].description = "Suspended roughly twelve feet above a street intersection is a gigantic holographic advertisement for a “Utopian Skies Virtual Vacation.” It consists mostly of buxom alien babes wearing little more than patches on string and a mesh tail-covering. Positively scandalous, compared to local norms. When it flickers and loops back to the start, you catch a glimpse of the dingy, pollution-stained city beyond.\n\nStreets lead east, south, and west from here.";
	rooms["DHAAL J7"].planet = "PLANET: DHAAL";
	rooms["DHAAL J7"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J7"].northExit = "DHAAL J5";
	rooms["DHAAL J7"].eastExit = "";
	rooms["DHAAL J7"].southExit = "DHAAL J9";
	rooms["DHAAL J7"].westExit = "DHAAL H7";
	rooms["DHAAL J7"].moveMinutes = 5;
	rooms["DHAAL J7"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL J7"].addFlag(GLOBAL.HAZARD);
	rooms["DHAAL J7"].addFlag(GLOBAL.OUTDOOR);

	rooms["DHAAL J9"] = new RoomClass(this);
	rooms["DHAAL J9"].roomName = "MEAN\nSTREETS";
	rooms["DHAAL J9"].description = "Gouts of steam vent out of grates in the pavement with alarming regularity, forcing you to dodge around them or sputter through them. Locals, you notice, don’t even bother to react when catching a face full of concentrated humidity, fully used to the idiosyncrasies of their city’s heat exchange systems. The glossy look it leaves on their skin doesn’t hurt.\n\nThis road bends north and east around a Paragon Inc-affiliated noodle stand. You keep walking when you realize the noodles are moving on their own.";
	rooms["DHAAL J9"].planet = "PLANET: DHAAL";
	rooms["DHAAL J9"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J9"].northExit = "DHAAL J7";
	rooms["DHAAL J9"].eastExit = "DHAAL L9";
	rooms["DHAAL J9"].southExit = "";
	rooms["DHAAL J9"].westExit = "";
	rooms["DHAAL J9"].moveMinutes = 5;
	rooms["DHAAL J9"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL J9"].addFlag(GLOBAL.HAZARD);
	rooms["DHAAL J9"].addFlag(GLOBAL.OUTDOOR);

	//Noodle Stand?
	rooms["DHAAL L9"] = new RoomClass(this);
	rooms["DHAAL L9"].roomName = "NAME\nME";
	rooms["DHAAL L9"].description = "DESC ME";
	rooms["DHAAL L9"].planet = "PLANET: DHAAL";
	rooms["DHAAL L9"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L9"].northExit = "";
	rooms["DHAAL L9"].eastExit = "";
	rooms["DHAAL L9"].southExit = "DHAAL L11";
	rooms["DHAAL L9"].westExit = "DHAAL J9";
	rooms["DHAAL L9"].moveMinutes = 5;
	rooms["DHAAL L9"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL L9"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL L9"].addFlag(GLOBAL.HAZARD);

	//Urchin Holodice
	rooms["DHAAL L11"] = new RoomClass(this);
	rooms["DHAAL L11"].roomName = "NAME\nME";
	rooms["DHAAL L11"].description = "DESC ME";
	rooms["DHAAL L11"].planet = "PLANET: DHAAL";
	rooms["DHAAL L11"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L11"].northExit = "DHAAL L9";
	rooms["DHAAL L11"].eastExit = "";
	rooms["DHAAL L11"].southExit = "DHAAL L13";
	rooms["DHAAL L11"].westExit = "";
	rooms["DHAAL L11"].moveMinutes = 5;
	rooms["DHAAL L11"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL L11"].addFlag(GLOBAL.HAZARD);
	rooms["DHAAL L11"].addFlag(GLOBAL.OUTDOOR);

	//Abandoned looted car
	rooms["DHAAL L13"] = new RoomClass(this);
	rooms["DHAAL L13"].roomName = "NAME\nME";
	rooms["DHAAL L13"].description = "DESC ME";
	rooms["DHAAL L13"].planet = "PLANET: DHAAL";
	rooms["DHAAL L13"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L13"].northExit = "DHAAL L11";
	rooms["DHAAL L13"].eastExit = "";
	rooms["DHAAL L13"].southExit = "DHAAL L15";
	rooms["DHAAL L13"].westExit = "";
	rooms["DHAAL L13"].moveMinutes = 5;
	rooms["DHAAL L13"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL L13"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL L13"].addFlag(GLOBAL.HAZARD);

	//holo-ad of beckoning women
	rooms["DHAAL L15"] = new RoomClass(this);
	rooms["DHAAL L15"].roomName = "NAME\nME";
	rooms["DHAAL L15"].description = "DESC ME";
	rooms["DHAAL L15"].planet = "PLANET: DHAAL";
	rooms["DHAAL L15"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L15"].northExit = "DHAAL L13";
	rooms["DHAAL L15"].eastExit = "";
	rooms["DHAAL L15"].southExit = "DHAAL L17";
	rooms["DHAAL L15"].westExit = "";
	rooms["DHAAL L15"].moveMinutes = 5;
	rooms["DHAAL L15"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL L15"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL L15"].addFlag(GLOBAL.HAZARD);

	//Dingy postal-turned-foodcart blocking sidestreet
	rooms["DHAAL L17"] = new RoomClass(this);
	rooms["DHAAL L17"].roomName = "NAME\nME";
	rooms["DHAAL L17"].description = "DESC ME";
	rooms["DHAAL L17"].planet = "PLANET: DHAAL";
	rooms["DHAAL L17"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L17"].northExit = "DHAAL L15";
	rooms["DHAAL L17"].eastExit = "";
	rooms["DHAAL L17"].southExit = "";
	rooms["DHAAL L17"].westExit = "DHAAL J17";
	rooms["DHAAL L17"].moveMinutes = 5;
	rooms["DHAAL L17"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL L17"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL L17"].addFlag(GLOBAL.HAZARD);

	//Old timers bitching about cyborgs
	rooms["DHAAL J17"] = new RoomClass(this);
	rooms["DHAAL J17"].roomName = "NAME\nME";
	rooms["DHAAL J17"].description = "DESC ME";
	rooms["DHAAL J17"].planet = "PLANET: DHAAL";
	rooms["DHAAL J17"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J17"].northExit = "DHAAL J15";
	rooms["DHAAL J17"].eastExit = "DHAAL L17";
	rooms["DHAAL J17"].southExit = "DHAAL J19";
	rooms["DHAAL J17"].westExit = "";
	rooms["DHAAL J17"].moveMinutes = 5;
	rooms["DHAAL J17"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL J17"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL J17"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL J15"] = new RoomClass(this);
	rooms["DHAAL J15"].roomName = "NAME\nME";
	rooms["DHAAL J15"].description = "DESC ME";
	rooms["DHAAL J15"].planet = "PLANET: DHAAL";
	rooms["DHAAL J15"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J15"].northExit = "DHAAL MILKBAR";
	rooms["DHAAL J15"].eastExit = "";
	rooms["DHAAL J15"].southExit = "DHAAL J17";
	rooms["DHAAL J15"].westExit = "DHAAL H15";
	rooms["DHAAL J15"].moveMinutes = 5;
	rooms["DHAAL J15"].runOnEnter = outsideMilkBarBonusText;
	rooms["DHAAL J15"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL J15"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL H15"] = new RoomClass(this);
	rooms["DHAAL H15"].roomName = "NAME\nME";
	rooms["DHAAL H15"].description = "DESC ME";
	rooms["DHAAL H15"].planet = "PLANET: DHAAL";
	rooms["DHAAL H15"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL H15"].northExit = "DHAAL H13";
	rooms["DHAAL H15"].eastExit = "DHAAL J15";
	rooms["DHAAL H15"].southExit = "";
	rooms["DHAAL H15"].westExit = "";
	rooms["DHAAL H15"].moveMinutes = 5;
	rooms["DHAAL H15"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL H15"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL H15"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL H13"] = new RoomClass(this);
	rooms["DHAAL H13"].roomName = "NAME\nME";
	rooms["DHAAL H13"].description = "DESC ME";
	rooms["DHAAL H13"].planet = "PLANET: DHAAL";
	rooms["DHAAL H13"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL H13"].northExit = "DHAAL H11";
	rooms["DHAAL H13"].eastExit = "";
	rooms["DHAAL H13"].southExit = "DHAAL H15";
	rooms["DHAAL H13"].westExit = "";
	rooms["DHAAL H13"].moveMinutes = 5;
	rooms["DHAAL H13"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL H13"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL H13"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL H11"] = new RoomClass(this);
	rooms["DHAAL H11"].roomName = "NAME\nME";
	rooms["DHAAL H11"].description = "DESC ME";
	rooms["DHAAL H11"].planet = "PLANET: DHAAL";
	rooms["DHAAL H11"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL H11"].northExit = "DHAAL H9";
	rooms["DHAAL H11"].eastExit = "";
	rooms["DHAAL H11"].southExit = "DHAAL H13";
	rooms["DHAAL H11"].westExit = "";
	rooms["DHAAL H11"].moveMinutes = 5;
	rooms["DHAAL H11"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL H11"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL H11"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL H9"] = new RoomClass(this);
	rooms["DHAAL H9"].roomName = "NAME\nME";
	rooms["DHAAL H9"].description = "DESC ME";
	rooms["DHAAL H9"].planet = "PLANET: DHAAL";
	rooms["DHAAL H9"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL H9"].northExit = "DHAAL H7";
	rooms["DHAAL H9"].eastExit = "";
	rooms["DHAAL H9"].southExit = "DHAAL H11";
	rooms["DHAAL H9"].westExit = "";
	rooms["DHAAL H9"].moveMinutes = 5;
	rooms["DHAAL H9"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL H9"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL H9"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL H7"] = new RoomClass(this);
	rooms["DHAAL H7"].roomName = "NAME\nME";
	rooms["DHAAL H7"].description = "DESC ME";
	rooms["DHAAL H7"].planet = "PLANET: DHAAL";
	rooms["DHAAL H7"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL H7"].northExit = "";
	rooms["DHAAL H7"].eastExit = "DHAAL J7";
	rooms["DHAAL H7"].southExit = "DHAAL H9";
	rooms["DHAAL H7"].westExit = "";
	rooms["DHAAL H7"].moveMinutes = 5;
	rooms["DHAAL H7"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL H7"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL H7"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL J19"] = new RoomClass(this);
	rooms["DHAAL J19"].roomName = "NAME\nME";
	rooms["DHAAL J19"].description = "DESC ME";
	rooms["DHAAL J19"].planet = "PLANET: DHAAL";
	rooms["DHAAL J19"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J19"].northExit = "DHAAL J17";
	rooms["DHAAL J19"].eastExit = "";
	rooms["DHAAL J19"].southExit = "";
	rooms["DHAAL J19"].westExit = "DHAAL H19";
	rooms["DHAAL J19"].moveMinutes = 5;
	rooms["DHAAL J19"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL J19"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL J19"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL H19"] = new RoomClass(this);
	rooms["DHAAL H19"].roomName = "NAME\nME";
	rooms["DHAAL H19"].description = "DESC ME";
	rooms["DHAAL H19"].planet = "PLANET: DHAAL";
	rooms["DHAAL H19"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL H19"].northExit = "";
	rooms["DHAAL H19"].eastExit = "DHAAL J19";
	rooms["DHAAL H19"].southExit = "DHAAL H21";
	rooms["DHAAL H19"].westExit = "";
	rooms["DHAAL H19"].moveMinutes = 5;
	rooms["DHAAL H19"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL H19"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL H19"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL H21"] = new RoomClass(this);
	rooms["DHAAL H21"].roomName = "NAME\nME";
	rooms["DHAAL H21"].description = "DESC ME";
	rooms["DHAAL H21"].planet = "PLANET: DHAAL";
	rooms["DHAAL H21"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL H21"].northExit = "DHAAL H19";
	rooms["DHAAL H21"].eastExit = "DHAAL J21";
	rooms["DHAAL H21"].southExit = "";
	rooms["DHAAL H21"].westExit = "";
	rooms["DHAAL H21"].moveMinutes = 5;
	rooms["DHAAL H21"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL H21"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL H21"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL J21"] = new RoomClass(this);
	rooms["DHAAL J21"].roomName = "NAME\nME";
	rooms["DHAAL J21"].description = "DESC ME";
	rooms["DHAAL J21"].planet = "PLANET: DHAAL";
	rooms["DHAAL J21"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J21"].northExit = "";
	rooms["DHAAL J21"].eastExit = "DHAAL L21";
	rooms["DHAAL J21"].southExit = "DHAAL J23";
	rooms["DHAAL J21"].westExit = "DHAAL H21";
	rooms["DHAAL J21"].moveMinutes = 5;
	rooms["DHAAL J21"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL J21"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL J21"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL L21"] = new RoomClass(this);
	rooms["DHAAL L21"].roomName = "\nTAXI";
	rooms["DHAAL L21"].description = "DESC ME";
	rooms["DHAAL L21"].planet = "PLANET: DHAAL";
	rooms["DHAAL L21"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L21"].northExit = "";
	rooms["DHAAL L21"].eastExit = "";
	rooms["DHAAL L21"].southExit = "";
	rooms["DHAAL L21"].westExit = "DHAAL J21";
	rooms["DHAAL L21"].moveMinutes = 5;
	rooms["DHAAL L21"].runOnEnter = L21DhaalTaxiStandBonus;
	rooms["DHAAL L21"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL L21"].addFlag(GLOBAL.PUBLIC);
	rooms["DHAAL L21"].addFlag(GLOBAL.TAXI);

	rooms["DHAAL J23"] = new RoomClass(this);
	rooms["DHAAL J23"].roomName = "NAME\nME";
	rooms["DHAAL J23"].description = "DESC ME";
	rooms["DHAAL J23"].planet = "PLANET: DHAAL";
	rooms["DHAAL J23"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL J23"].northExit = "DHAAL J21";
	rooms["DHAAL J23"].eastExit = "DHAAL L23";
	rooms["DHAAL J23"].southExit = "";
	rooms["DHAAL J23"].westExit = "";
	rooms["DHAAL J23"].moveMinutes = 5;
	rooms["DHAAL J23"].runOnEnter = undefined;
	rooms["DHAAL J23"].addFlag(GLOBAL.OUTDOOR);
	//rooms["DHAAL J23"].addFlag(GLOBAL.HAZARD);	

	rooms["DHAAL L23"] = new RoomClass(this);
	rooms["DHAAL L23"].roomName = "NAME\nME";
	rooms["DHAAL L23"].description = "";
	rooms["DHAAL L23"].planet = "PLANET: DHAAL";
	rooms["DHAAL L23"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L23"].northExit = "";
	rooms["DHAAL L23"].eastExit = "";
	rooms["DHAAL L23"].southExit = "DHAAL L25";
	rooms["DHAAL L23"].westExit = "DHAAL J23";
	rooms["DHAAL L23"].moveMinutes = 5;
	rooms["DHAAL L23"].runOnEnter = capsuleHotelExteriorBonus;
	rooms["DHAAL L23"].addFlag(GLOBAL.OUTDOOR);
	//rooms["DHAAL L23"].addFlag(GLOBAL.HAZARD);

	rooms["DHAAL L25"] = new RoomClass(this);
	rooms["DHAAL L25"].roomName = "CAPSULE\nHOTEL";
	rooms["DHAAL L25"].description = "";
	rooms["DHAAL L25"].planet = "PLANET: DHAAL";
	rooms["DHAAL L25"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL L25"].northExit = "DHAAL L23";
	rooms["DHAAL L25"].eastExit = "";
	rooms["DHAAL L25"].southExit = "";
	rooms["DHAAL L25"].westExit = "";
	rooms["DHAAL L25"].moveMinutes = 5;
	rooms["DHAAL L25"].runOnEnter = capsuleHotelInteriorBonus;
	//rooms["DHAAL L25"].addFlag(GLOBAL.BED);
	rooms["DHAAL L25"].addFlag(GLOBAL.INDOOR);
	rooms["DHAAL L25"].addFlag(GLOBAL.COMMERCE);

	rooms["DHAAL MILKBAR"] = new RoomClass(this);
	rooms["DHAAL MILKBAR"].roomName = "MILK\nBAR";
	rooms["DHAAL MILKBAR"].description = "The comforting ambience of Arovok, the famed milk bar surrounds you. Incredibly busty cowgirls strut from table to table offering milk from their glasses or their barely-concealed tits, administering a half-drugged crowd of colorful natives and spacers alike. Presently, you sit near the bar, considering your next move.";
	rooms["DHAAL MILKBAR"].planet = "PLANET: DHAAL";
	rooms["DHAAL MILKBAR"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL MILKBAR"].northExit = "";
	rooms["DHAAL MILKBAR"].eastExit = "";
	rooms["DHAAL MILKBAR"].southExit = "DHAAL J15";
	rooms["DHAAL MILKBAR"].westExit = "";
	rooms["DHAAL MILKBAR"].moveMinutes = 5;
	rooms["DHAAL MILKBAR"].runOnEnter = enterTheMilkbar;
	//rooms["DHAAL MILKBAR"].addFlag(GLOBAL.BED);
	rooms["DHAAL MILKBAR"].addFlag(GLOBAL.INDOOR);
	rooms["DHAAL MILKBAR"].addFlag(GLOBAL.COMMERCE);

	rooms["DHAAL TEMP"] = new RoomClass(this);
	rooms["DHAAL TEMP"].roomName = "NAME\nME";
	rooms["DHAAL TEMP"].description = "DESC ME";
	rooms["DHAAL TEMP"].planet = "PLANET: DHAAL";
	rooms["DHAAL TEMP"].system = "SYSTEM: UOND EPHINE";
	rooms["DHAAL TEMP"].northExit = "";
	rooms["DHAAL TEMP"].eastExit = "";
	rooms["DHAAL TEMP"].southExit = "";
	rooms["DHAAL TEMP"].westExit = "";
	rooms["DHAAL TEMP"].moveMinutes = 5;
	rooms["DHAAL TEMP"].runOnEnter = dhaalGyreEncounters;
	rooms["DHAAL TEMP"].addFlag(GLOBAL.OUTDOOR);
	rooms["DHAAL TEMP"].addFlag(GLOBAL.HAZARD);
}
