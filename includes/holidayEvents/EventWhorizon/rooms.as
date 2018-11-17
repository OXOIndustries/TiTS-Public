public function eventWhorizonInitRooms():void
{
	var planetName:String = "SPATIAL ANOMOLY";
	var systemName:String = "UNKNOWN SPACE";

	rooms["EW-M23"] = new RoomClass(this);
	rooms["EW-M23"].roomName = "LANDING\nZONE";
	rooms["EW-M23"].description = "Your ship has landed here, though you don't remember putting down the landing struts... or even how you got here. It's nestled into a little canyon between massive walls of sandstone, surrounding it on every side but northwards.";
	rooms["EW-M23"].runOnEnter = undefined;
	rooms["EW-M23"].planet = planetName;
	rooms["EW-M23"].system = systemName;
	rooms["EW-M23"].northExit = "EW-M21";
	rooms["EW-M23"].addFlag(GLOBAL.SHIPHANGAR);
	rooms["EW-M23"].addFlag(GLOBAL.DESERT);

	rooms["EW-M21"] = new RoomClass(this);
	rooms["EW-M21"].roomName = "STRANGE\nCORRIDORS";
	rooms["EW-M21"].description = "You're moving through winding, twisting corridors between these sandstone pillars. The closer you look at them, the more the stone looks like someone just piled up rocks from the dusty ground to the gates of heaven high above. It's a veritable forest around you, but the suggestion of the rocks seems to draw you northwards.\n\nAbove you, the creamy pale sky begins to look more and more like... like a vast sheet of cum, smeared across the top of the world. You can almost smell it.";
	rooms["EW-M21"].runOnEnter = undefined;
	rooms["EW-M21"].planet = planetName;
	rooms["EW-M21"].system = systemName;
	rooms["EW-M21"].northExit = "EW-M19";
	rooms["EW-M21"].southExit = "EW-M23";
	rooms["EW-M21"].addFlag(GLOBAL.DESERT);

	rooms["EW-M19"] = new RoomClass(this);
	rooms["EW-M19"].roomName = "VINES &\nFLOWERS";
	rooms["EW-M19"].description = "You saw some of these vines and flowers from the ship, but now you seem to be walking into a veritable garden of them. Thick, meaty green tendrils of plant-flesh hang down from the cracks and crevices of the stones, leaking dark purple fluids onto patches of plump, fleshy pink flowers on long, waist-high stems.";
	rooms["EW-M19"].runOnEnter = undefined;
	rooms["EW-M19"].planet = planetName;
	rooms["EW-M19"].system = systemName;
	rooms["EW-M19"].northExit = "EW-M17";
	rooms["EW-M19"].southExit = "EW-M21";
	rooms["EW-M19"].addFlag(GLOBAL.DESERT);

	rooms["EW-M17"] = new RoomClass(this);
	rooms["EW-M17"].roomName = "TENTACLE\nGARDEN";
	rooms["EW-M17"].description = "";
	rooms["EW-M17"].runOnEnter = eventWhorizonTentacleGarden;
	rooms["EW-M17"].planet = planetName;
	rooms["EW-M17"].system = systemName;
	rooms["EW-M17"].northExit = "EW-M15";
	rooms["EW-M17"].eastExit = "EW-O17"
	rooms["EW-M17"].southExit = "EW-M19";
	rooms["EW-M17"].addFlag(GLOBAL.DESERT);
	rooms["EW-M17"].addFlag(GLOBAL.HAZARD);

	rooms["EW-O17"] = new RoomClass(this);
	rooms["EW-O17"].roomName = "TWISTED\nROCKS";
	rooms["EW-O17"].description = "You're walking through a twisting passage of rock columns and quivering vines. It seems to draw you either north or west, back the way you came from.\n\nNorth of here, you can see the vines have formed into a series of cage-like growths that hang from the heights above. Fuck-flowers quiver underneath the cages, feasting on the dripping juices from the vines and their prisoners.";
	rooms["EW-O17"].runOnEnter = undefined;
	rooms["EW-O17"].planet = planetName;
	rooms["EW-O17"].system = systemName;
	rooms["EW-O17"].westExit = "EW-M17";
	rooms["EW-O17"].northExit = "EW-O15";
	rooms["EW-O17"].addFlag(GLOBAL.DESERT);

	rooms["EW-M15"] = new RoomClass(this);
	rooms["EW-M15"].roomName = "COLLECTION\nPOOL";
	rooms["EW-M15"].description = "There is an actual river of sexual fluids pouring down from the western path. The smell of semen of girl-jizz is unmistakable, and very nearly overwhelming, as it courses down either side of the path. ";
	rooms["EW-M15"].runOnEnter = undefined;
	rooms["EW-M15"].planet = planetName;
	rooms["EW-M15"].system = systemName;
	rooms["EW-M15"].westExit = "EW-K15"
	rooms["EW-M15"].southExit = "EW-M17";
	rooms["EW-M15"].addFlag(GLOBAL.DESERT);

	rooms["EW-K15"] = new RoomClass(this);
	rooms["EW-K15"].roomName = "THE FUCK\nPRISON";
	rooms["EW-K15"].description = "";
	rooms["EW-K15"].runOnEnter = eventWhorizonTheFuckPrison;
	rooms["EW-K15"].planet = planetName;
	rooms["EW-K15"].system = systemName;
	rooms["EW-K15"].eastExit = "EW-M15"
	rooms["EW-K15"].northExit = "EW-K13";
	rooms["EW-K15"].addFlag(GLOBAL.DESERT);
	rooms["EW-K15"].addFlag(GLOBAL.HAZARD);

	rooms["EW-K13"] = new RoomClass(this);
	rooms["EW-K13"].roomName = "PALACE\nSTEPS";
	rooms["EW-K13"].description = "The rocky columns you've gotten used to give way as you head northwards, revealing the first signs of artificial architecture you've seen: sandstone stairs, a massive sweeping set of them, lead up from the rocky ground to a grand, palatial structure. Grand statues of exaggeratedly-buxom hermaphrodites hold up the building's roof on their slender shoulders, while their knee-length cocks spill a musky cream into a wide moat that spreads out into rivers down either side of the path. Each statue is wrapped up in vast leather straps and cuffs, making the effigies look more like bondage slaves than temple goddesses.";
	rooms["EW-K13"].runOnEnter = undefined;
	rooms["EW-K13"].planet = planetName;
	rooms["EW-K13"].system = systemName;
	rooms["EW-K13"].northExit = "EW-K11";
	rooms["EW-K13"].southExit = "EW-K15";
	rooms["EW-K13"].addFlag(GLOBAL.DESERT);

	rooms["EW-K11"] = new RoomClass(this);
	rooms["EW-K11"].roomName = "THE BONDAGE\nPALACE";
	rooms["EW-K11"].description = "";
	rooms["EW-K11"].runOnEnter = eventWhorizonTheBondagePalace;
	rooms["EW-K11"].planet = planetName;
	rooms["EW-K11"].system = systemName;
	rooms["EW-K11"].southExit = "EW-K13";
	rooms["EW-K11"].addFlag(GLOBAL.DESERT);
	rooms["EW-K11"].addFlag(GLOBAL.HAZARD);

	rooms["EW-O15"] = new RoomClass(this);
	rooms["EW-O15"].roomName = "TORMENT\nCAGES";
	rooms["EW-O15"].description = "";
	rooms["EW-O15"].runOnEnter = eventWhorizonTormentCages;
	rooms["EW-O15"].southExit = "EW-O17";
	rooms["EW-O15"].planet = planetName;
	rooms["EW-O15"].system = systemName;
	rooms["EW-O15"].addFlag(GLOBAL.DESERT);
	rooms["EW-O15"].addFlag(GLOBAL.HAZARD);
}

public function eventWhorizonTentacleGarden():Boolean
{
	if (flags["EVENT_WHORIZON_TENTACLE_GARDEN"] == undefined)
	{
		EWTentacleGardenFight();
		return true;
	}
	else
	{
		output("You're standing in the heart of the tentacle garden, surrounded by the wilted remains of the dildo-vines and fuck-flowers that accosted you. There's an obvious path to the east{, from which you can hear moans and cries}, and another that continues north.");
	}

	return false;
}

public function eventWhorizonTormentCages():Boolean
{
	if (flags["EVENT_WHORIZON_TORMENT_CAGES"] == undefined)
	{
		EWTormentCagesFight();
		return true;
	}
	else
	{
		output("The vines hanging down from the rocks have been cultivated into giant cages complete with living bars and built-in ‘punishment’ tentacles. Fuck-flowers squirm hungrily underneath, lapping up all the various sex-juices that spill down from on high.");

		if (flags["EVENT_WHORIZON_TORMENT_CAGES"] == -1)
		{
			addButton(0, "Approach", EWTormentCagesFight, undefined, "Approach", "Approach the hapless rusher stuck in the cages once more.");
		}
	}

	return false;
}

public function eventWhorizonTheFuckPrison():Boolean
{
	if (flags["EVENT_WHORIZON_FUCK_PRISON"] == undefined)
	{
		EWFuckPrison();
		return true;
	}
	else
	{
		output("The walls here are lined with vines, just as in the passages you've passed before, but these are wrapped around the wrists of several humans, ausar, kaithrit, and other Rusher races, suspending the victims in the air. They're far out of reach, though, beyond a moat of mixed fuck-juices that the tentacles are milking out of them. The sheer amount of cum that's pooled around your [pc.feet] seems more appropriate for a kui-tan stag party, and the moat's only filling further as the vines continue to rape their insensate victims.");
	}

	return false;
}

public function eventWhorizonTheBondagePalace():Boolean
{
	if (flags["EVENT_WHORIZON_BONDAGE_PALACE"] == undefined)
	{
		EWBondagePalace();
		return true;
	}
	else
	{
		output("You're standing in the grand throne room that dominates the temple-palace, the beating heart of this tiny pocket plane. Syri is sitting on the throne, still leaking from every orifice and half-covered in leather bondage straps. Behind her is the shrine this plane's inhabitants have build around the teleporter beacon, a bright blue box that's clearly seen a lot of wear and tear. The Akkadi Corporation logo is still (barely) visible on the casing.");
	}

	return false;
}