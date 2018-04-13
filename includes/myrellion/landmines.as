import classes.Creature;
import classes.Items.Accessories.Minesweeper;
public function tryEncounterLandmines():Boolean
{
	var hitChance:int = 100;
	if(pc.hasItemByClass(Hoverboard)) hitChance += 200;
	
	if (rand(hitChance) <= 2)
	{
		IncrementFlag("ENCOUNTERED_LANDMINES");

		if ((pc as Creature).accessory is Minesweeper)
		{
			return false;
		}

		if (pc.characterClass == GLOBAL.CLASS_SMUGGLER)
		{
			encounterLandminesAsSmuggler();
		}
		else
		{
			encounterLandmines();
		}
		return true;
	}
	return false;
}

public function encounterLandmines():void
{
	output("As you’re making your way through the caverns connecting the myr front lines, your");
	if(pc.hasItemByClass(Hoverboard)) output(" hoverboard suddenly dips and bumps into");
	else output(" [pc.foot] suddenly hits");
	output(" something heavy and metallic. You only have the span of a heartbeat to think before a shrill whine echoes through the cavern and a little metal ball pops up from the ground, no bigger than your fist.");

	// PC makes a Reflex Saving Throw
	// {If Successful:}
	if ((rand(pc.reflexes() / 3) + pc.reflexes() / 2) >= 20)
	{
		output("\n\nYour quick reflexes kick in before you can even think, and you leap down to the ground before the mine detonates. A deafening explosion rocks the cavern, and debris and shrapnel rain down on you");
		if (pc.shields() > 0) output(", thankfully absorbed by your shields");
		output(". Worse, though, is the cloud of roiling pink gas that begins to suffuse the tunnel, drifting down from the mine’s height. You scramble away before the gas can get to you, however.");

		processTime(15);
	}
	else
	{
		// if Failed: PC takes heavy damage + Lust
		output("\n\nYou have just enough time to scream before the mine detonates. A deafening explosion rocks the cavern, throwing you back against the far wall with concussive force. Shrapnel and debris slam into you, tearing into your");
		if (pc.shields() > 0) output(" shields");
		else if (pc.hasArmor()) output(" [pc.armor]");
		else output(" [pc.skin]");
		output(". Before you can recover, though, a thick cloud of roiling pink gas begins to suffuse the tunnel, drifting down from the mine’s height. You try and hold your breath, but the wind’s been knocked out of you by the mine’s explosive charge, and you soon find yourself breathing the gas in.");

		output("\n\nBy the void, it isn’t deadly, but you quickly find your flesh reddening, sensitivity and desire spreading through your body. What you wouldn’t give for a nice ant-cooch to lick right about now... wait, what?");

		var physDamage:Number = (pc.shields() > 0 ? 20 : 40);
		var lustDamage:Number = 40;
		applyDamage(new TypeCollection( { kinetic: physDamage, pheromone: lustDamage }, DamageFlag.BYPASS_SHIELD, DamageFlag.PENETRATING, DamageFlag.EXPLOSIVE ), null, pc, "minimal");
		pc.shieldsRaw = 0;
		processTime(20);
	}

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function encounterLandminesAsSmuggler():void
{
	output("\n\nAs you’re making your way through the caverns connecting the myr front lines, your keen eyes spot something metallic sticking up from the ground, just a half-inch worth of steel. A pressure sensor?");
	
	output("\n\nYou drop");
	if(pc.isBiped() && pc.hasKnees()) output(" to a [pc.knee]");
	else output(" down");
	output(" and pull out your picks, scraping a little dirt away from the trigger. Sure enough, it’s a land mine. Thank your lucky stars you had a little training in security, or you’d have never spotted it. With expert precision, you quickly disarm the trap and toss it off the path.");

	if (flags["DISARMED_LANDMINES"] == undefined) flags["DISARMED_LANDMINES"] = 0;
	flags["DISARMED_LANDMINES"]++;

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}