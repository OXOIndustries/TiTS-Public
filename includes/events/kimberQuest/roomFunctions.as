public function kimberCaveBonus():Boolean
{
	addButton(0, "Leave", function ():void
	{
		moveTo("268");
		mainGameMenu();
	});
	return false;
}

public function kimberQuestBonus():Boolean
{
	var worms:Array = new Array();
	if (rand(4) == 0) worms.push(new ZilMale());
	if (rand(5) == 0) worms.push(new ZilMale());
	if (rand(6) == 0) worms.push(new ZilMale());
	if (worms.length > 0 && flags["KIMBER_QUEST"]%4 != 2)
	{
		clearMenu();
		showBust("WORMLING");
		showName((worms.length == 1 ? "WORMLING!" : "WORMLINGS!"));
		if (worms.length == 1) output("\n\nA daer wormling skitters into the tunnel, drawn by the sound of your approach. It rears up on its back legs, waving half a dozen claws into the air, and snaps its jaws at you. It's clearly not letting you go unchallenged – you'll have to fight!");
		else output("\n\nA small group of daer wormlings skitter into the tunnel, drawn by the sound of your approach. They rear up on their hind legs, waving their curving claws into the air, and snap their jaws at you. They're clearly not letting you go unchallenged – you'll have to fight!");
		CombatManager.newGroundCombat();
		CombatManager.setFriendlyActors(pc);
		CombatManager.setHostileActors(worms);
		CombatManager.displayLocation((worms.length == 1 ? "WORMLING" : "WORMLINGS"));
		CombatManager.victoryScene(kimberQuestPlaceholder);
		CombatManager.lossScene(kimberQuestWormLoss);
		addButton(0, "Fight!", CombatManager.beginCombat);
		return true;
	}
	return false;
}

public function kimberPoolBonus():Boolean
{
	addButton(0, "Drink Water", function ():void
	{
		clearMenu();
		clearOutput();
		output("You cup your hands and dip them in the pool, then bring the water to your [pc.lipsChaste] and drink. There's a heavy mineral taste, and it's very cold going down, enough to make you shiver. Despite that, it's oddly refreshing.");
		pc.energy(pc.energyMax());
		addButton(0, "Next", mainGameMenu);
	});
	return false;
}

public function kimberWormBonus():Boolean
{
	if (flags["KIMBER_QUEST"] == 0)
	{
		if (flags["KIMBER_WORM_BEING_FOUGHT"] == undefined)
		{
			clearMenu();
			showBust("DAERWORM");
			showName("THE\nDAER WORM!");
			output("\n\nAn enormous serpentine creature lies curled up against the crack in the stone, and it stirs as you enter the room. The thing's body is easily three feet across, and covered in overlapping plates of brown and black chitin. The head looks like something out of a nightmare: wide and heavily plated, with a tremendous underbite and yellowed teeth jutting up from a jaw that looks strong enough to crush bone with a single bite. Dozens of legs unfold from the creature's body as it rises, each one tipped with a claw sharp enough to dig through stone.\n\nFour glassy black eyes fix on you as the creature turns to face you, and its jaw cracks open wide. This is the daer worm, and it's not happy to see you.");
			CombatManager.newGroundCombat();
			CombatManager.setFriendlyActors(pc);
			CombatManager.setHostileActors(new ZilMale());
			CombatManager.displayLocation("DAER WORM");
			CombatManager.victoryScene(kimberQuestDeadWorm);
			CombatManager.lossScene(kimberQuestDaerWormLoss);
			flags["KIMBER_WORM_BEING_FOUGHT"] = 1;
			addButton(0, "Fight!", CombatManager.beginCombat);
			return true;
		}
		//Flee the worm!
		else
		{
			moveTo("KIMBER12");
			mainGameMenu();
			flags["KIMBER_WORM_BEING_FOUGHT"] = undefined;
			return false;
		}
	}
	flags["KIMBER_WORM_BEING_FOUGHT"] = undefined;
	output("\n\nThe body of the daer worm lies where you left it, curled up on itself against one wall. The room is otherwise empty, though small scratches on the smooth stone around the corpse and on the corpse itself suggest that some of the thing's young have been checking to see if they can eat it.");
	return false;
}

public function kimberPantiesBonus():Boolean
{
	if (flags["KIMBER_QUEST"] < 4) addButton(0, "Search", function ():void
	{
		clearMenu();
		clearOutput();
		flags["KIMBER_QUEST"] += 4;
		output("You hold your breath and search through the rotting bodies. Most of what you find is broken armor and torn clothing, a few battered weapons, and a broken Xenogen sample container, but nothing of real value. Then, when you flip over one of the gabilani bodies, you find a battered metal box about the size of your Codex.");
		output("\n\nThe box looks like the daer worm chewed on it, but it's still closed and locked. The lock is small enough that a quick hit from your [pc.meleeWeapon] breaks it, and you pop open the box.");
		output("\n\nInside, you find a handful of credit chits totaling forty-two hundred credits and a small package wrapped in colorful paper. You unwrap the package, and find it contains a single pair of panties made out of some kind of stretchy material, which grows more sheer the farther you stretch it. Judging by how wide gabilani hips can get, it seems like the panties were made for one of them.\n\n");
		pc.credits += 4200;
		quickLoot(new GabilaniPanties());
	}, undefined, "Search", "Might as well see if there's anything in here worth taking.");
	return false;
}