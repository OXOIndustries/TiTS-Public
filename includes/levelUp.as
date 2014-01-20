function levelUp():void {
	pc.level++;
	pc.XPRaw = 0;
	pc.maxOutHP();
	//Give level up points!
	if(flags["LEVEL_UP_POINTS"] == undefined) flags["LEVEL_UP_POINTS"] = 0;
	flags["LEVEL_UP_POINTS"] += 13;
	levelUpScreen();
}

function levelUpScreen():void {
	//Initialize shit!
	if(flags["LEVELING_PHYSIQUE_BONUS"] == undefined) flags["LEVELING_PHYSIQUE_BONUS"] = 0;
	if(flags["LEVELING_REFLEXES_BONUS"] == undefined) flags["LEVELING_REFLEXES_BONUS"] = 0;
	if(flags["LEVELING_AIM_BONUS"] == undefined) flags["LEVELING_AIM_BONUS"] = 0;
	if(flags["LEVELING_WILLPOWER_BONUS"] == undefined) flags["LEVELING_WILLPOWER_BONUS"] = 0;
	if(flags["LEVELING_INTELLIGENCE_BONUS"] == undefined) flags["LEVELING_INTELLIGENCE_BONUS"] = 0;
	clearOutput();
	output("<b><u>You are now level " + num2Text(pc.level) + "!</u><b>");
	if(flags["LEVEL_UP_POINTS"] > 0) {
		output("\n\nYou have " + flags["LEVEL_UP_POINTS"] + " point");
		if(flags["LEVEL_UP_POINTS"] > 1) output("s");
		output(" to use to increase your statistics.");

		//Display current level changes
		levelingStatChangeDisplay();

		userInterface.clearMenu();
		//Buttons for raising!
		if(pc.physique() + flags["LEVELING_PHYSIQUE_BONUS"] < pc.physiqueMax()) userInterface.addButton(0,"Physique+",levelPhysique);
		else userInterface.addDisabledButton(0,"Physique+");
		if(pc.reflexes() + flags["LEVELING_REFLEXES_BONUS"] < pc.reflexesMax()) userInterface.addButton(1,"Reflex+",levelReflexes);
		else userInterface.addDisabledButton(1,"Reflex+");
		if(pc.aim() + flags["LEVELING_AIM_BONUS"] < pc.aimMax()) userInterface.addButton(2,"Aim+",levelAim);
		else userInterface.addDisabledButton(2,"Aim+");
		if(pc.intelligence() + flags["LEVELING_INTELLIGENCE_BONUS"] < pc.intelligenceMax()) userInterface.addButton(3,"Intel.+",levelIntelligence);
		else userInterface.addDisabledButton(3,"Intel.+");
		if(pc.willpower() + flags["LEVELING_WILLPOWER_BONUS"] < pc.willpowerMax()) userInterface.addButton(4,"Willpower+",levelWillpower);
		else userInterface.addDisabledButton(4,"Willpower+");
	}
	else {
		output("\n\nYou have spent all your bonus points.");
		//Display current level changes
		levelingStatChangeDisplay();
		userInterface.clearMenu();
	}
	//Buttons to lower!
	if(flags["LEVELING_PHYSIQUE_BONUS"] > 0) userInterface.addButton(5,"Physique-",levelPhysique,true);
	else userInterface.addDisabledButton(5,"Physique-");
	if(flags["LEVELING_REFLEXES_BONUS"] > 0) userInterface.addButton(6,"Reflex-",levelReflexes,true);
	else userInterface.addDisabledButton(6,"Reflex-");
	if(flags["LEVELING_AIM_BONUS"] > 0) userInterface.addButton(7,"Aim-",levelAim,true);
	else userInterface.addDisabledButton(7,"Aim-");
	if(flags["LEVELING_INTELLIGENCE_BONUS"] > 0) userInterface.addButton(8,"Intel.-",levelIntelligence,true);
	else userInterface.addDisabledButton(8,"Intel.-");
	if(flags["LEVELING_WILLPOWER_BONUS"] > 0) userInterface.addButton(9,"Willpower-",levelWillpower,true);
	else userInterface.addDisabledButton(9,"Willpower-");
	userInterface.addButton(14,"Confirm",confirmLevelPointAllocation);
	//If yet to be applied bonuses exist, have option to reset.
	if(flags["LEVELING_PHYSIQUE_BONUS"] + flags["LEVELING_REFLEXES_BONUS"] + flags["LEVELING_AIM_BONUS"] + flags["LEVELING_WILLPOWER_BONUS"] + flags["LEVELING_INTELLIGENCE_BONUS"] > 0)
	{
		userInterface.addButton(13,"Reset",resetLevelBonuses);
	}
	else userInterface.addDisabledButton(13,"Reset");
}

function levelingStatChangeDisplay():void {
	output("\n\n");
	output("<b>Physique: </b>" + pc.physique() + " + " + flags["LEVELING_PHYSIQUE_BONUS"] + " -> " + (pc.physique() + flags["LEVELING_PHYSIQUE_BONUS"]));
	output("\n<b>Reflexes: </b>" + pc.reflexes() + " + " + flags["LEVELING_REFLEXES_BONUS"] + " -> " + (pc.reflexes() + flags["LEVELING_REFLEXES_BONUS"]));
	output("\n<b>Aim: </b>" + pc.aim() + " + " + flags["LEVELING_AIM_BONUS"] + " -> " + (pc.aim() + flags["LEVELING_AIM_BONUS"]));
	output("\n<b>Intelligence: </b>" + pc.intelligence() + " + " + flags["LEVELING_INTELLIGENCE_BONUS"] + " -> " + (pc.intelligence() + flags["LEVELING_INTELLIGENCE_BONUS"]));
	output("\n<b>Willpower: </b>" + pc.willpower() + " + " + flags["LEVELING_WILLPOWER_BONUS"] + " -> " + (pc.willpower() + flags["LEVELING_WILLPOWER_BONUS"]));	
}

function levelPhysique(reduce:Boolean = false):void 
{
	if(reduce) 
	{
		flags["LEVELING_PHYSIQUE_BONUS"]--;
		flags["LEVEL_UP_POINTS"]++;
	}
	else 
	{
		flags["LEVELING_PHYSIQUE_BONUS"]++;
		flags["LEVEL_UP_POINTS"]--;
	}
	levelUpScreen();
}

function levelReflexes(reduce:Boolean = false):void 
{
	if(reduce) 
	{
		flags["LEVELING_REFLEXES_BONUS"]--;
		flags["LEVEL_UP_POINTS"]++;
	}
	else 
	{
		flags["LEVELING_REFLEXES_BONUS"]++;
		flags["LEVEL_UP_POINTS"]--;
	}
	levelUpScreen();
}
function levelAim(reduce:Boolean = false):void 
{
	if(reduce) 
	{
		flags["LEVELING_AIM_BONUS"]--;
		flags["LEVEL_UP_POINTS"]++;
	}
	else 
	{
		flags["LEVELING_AIM_BONUS"]++;
		flags["LEVEL_UP_POINTS"]--
	}
	levelUpScreen();
}
function levelWillpower(reduce:Boolean = false):void 
{
	if(reduce) {
		flags["LEVELING_WILLPOWER_BONUS"]--;
		flags["LEVEL_UP_POINTS"]++;
	}
	else 
	{
		flags["LEVELING_WILLPOWER_BONUS"]++;
		flags["LEVEL_UP_POINTS"]--;
	}
	levelUpScreen();
}
function levelIntelligence(reduce:Boolean = false):void 
{
	if(reduce) {
		flags["LEVELING_INTELLIGENCE_BONUS"]--;
		flags["LEVEL_UP_POINTS"]++;
	}
	else {
		flags["LEVELING_INTELLIGENCE_BONUS"]++;
		flags["LEVEL_UP_POINTS"]--;
	}
	levelUpScreen();
}
function resetLevelBonuses(refund:Boolean = true):void
{
	//Refund ze points!
	if(refund) flags["LEVEL_UP_POINTS"] += flags["LEVELING_PHYSIQUE_BONUS"] + flags["LEVELING_REFLEXES_BONUS"] + flags["LEVELING_AIM_BONUS"] + flags["LEVELING_INTELLIGENCE_BONUS"] + flags["LEVELING_WILLPOWER_BONUS"];
	//Reset the vars!
	flags["LEVELING_PHYSIQUE_BONUS"] = 0;
	flags["LEVELING_REFLEXES_BONUS"] = 0;
	flags["LEVELING_AIM_BONUS"] = 0;
	flags["LEVELING_INTELLIGENCE_BONUS"] = 0;
	flags["LEVELING_WILLPOWER_BONUS"] = 0;
	if(refund) levelUpScreen();
}


/*Tech Specialist Rewards
(Level 1 Special everybody has): Paralyzing Shock (25 energy), chance of paralyzing foes for 1-2 rounds.
(Level 2A): Attack Drone - Construct an attack drone that will shield you from attacks (effectively raising your shield cap) and deal damage so long as your shields are up.
(Level 2B): Shield Booster - Construct a heavy duty shield booster that will increase your shields by 15 per level.
(Level 3A): Overcharge - 1 ranged shot from an energy firearm for 150% damage with a chance of stunning your enemy.
(Level 3B): Volley - Make an extra ranged attack from an energy firearm with a high miss chance but chance of blinding.
(Level 4A): Power Surge - Heal a moderate amount of shielding for 33 energy.
(Level 4B): Deflector Regeneration - Heal a moderate amount of shielding over four turns for 20 energy.
(Level 5A): Gravidic Disruptor - Build a gravidic disrupter. Damage isn't great, but almost nothing is resistant to it.
(Level 5B): Thermal Disruptor - Allows you to make a high damage thermal attack*/

function confirmLevelPointAllocation():void 
{
	clearOutput();
	pc.physique(flags["LEVELING_PHYSIQUE_BONUS"]);
	pc.reflexes(flags["LEVELING_REFLEXES_BONUS"]);
	pc.aim(flags["LEVELING_AIM_BONUS"]);
	pc.intelligence(flags["LEVELING_INTELLIGENCE_BONUS"]);
	pc.willpower(flags["LEVELING_WILLPOWER_BONUS"]);
	resetLevelBonuses(false);
	if(pc.characterClass == GLOBAL.ENGINEER) {
		if(pc.level == 2) {
			output("<b>You have gained the 'Shield Tweaks' perk, granting you 2 points of bonus shielding per level!</b>");
			pc.createPerk("Shield Tweaks",0,0,0,0,"Your shield generator grants an additional 2 points of shielding per level.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Attack Drone -</b> this ability gives you an attack drone that will automatically fire on your enemies every turn as long as your shields are up. THe drone will also supplant your shields with its own, raising your shields by one point per level.");
			output("\n<b>* Shield Booster -</b> this ability further increases your shielding by an additional four points per level.");
			userInterface.clearMenu();
			userInterface.addButton(0,"Atk.Drone",engineerPerk,"Attack Drone");
			userInterface.addButton(1,"Shield B.",engineerPerk,"Shield Booster");
		}
		if(pc.level == 3) {
			output("<b>You have gained the 'Enhanced Dampeners' perk, reducing any vulnerabilities your shields have to damage by 50%.</b>");
			pc.createPerk("Enhanced Dampeners",0,0,0,0,"Shield vulnerabilities reduced by 50%.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Overcharge -</b> this ability allows you to make a single ranged attack at 150% normal damage. It even has a chance of stunning your target if its shields are down! Requires an energy weapon.");
			output("\n<b>* Volley -</b> this ability allows you to make an extra ranged attack with lowered accuracy but a chance of causing blindness regardless. Requires an energy weapon.");
			userInterface.clearMenu();
			userInterface.addButton(0,"Overcharge",engineerPerk,"Overcharge");
			userInterface.addButton(1,"Volley",engineerPerk,"Volley");
		}
		if(pc.level == 4) {
			output("<b>You have gained the 'Armor Tweaks' perk, granting you a 20% bonus to the defense provided by your armor.</b>");
			pc.createPerk("Armor Tweaks",0,0,0,0,"Armor defense is increased by 20%!");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Power Surge -</b> this ability allows you to restore a moderate amount of shielding by spending 33 energy.");
			output("\n<b>* Deflector Regeneration -</b> this ability allows you to restore a moderate amount of shielding over four turns in exchange for 20 energy.");
			userInterface.clearMenu();
			userInterface.addButton(0,"P. Surge",engineerPerk,"Power Surge");
			userInterface.addButton(1,"D. Regen.",engineerPerk,"Deflector Regeneration");
		}
		if(pc.level == 5) {
			output("<b>You have unlocked the 'Static Burst' ability, allowing you to spend to energy to escape most grapples.</b>");
			pc.createStatusEffect("Static Burst Known");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Gravidic Disruptor -</b> this ability constructs a new key item that can be used to deal gravidic damage to your foes. There shouldn't be anything out there that's resistant to gravidic damage!");
			output("\n<b>* Thermal Disruptor -</b> this ability constructs a new key item that can be used to deal thermal damage to your foes. Against enemies who aren't resistant to it, it will hit harder than a Gravidic Disruptor.");
			userInterface.clearMenu();
			userInterface.addButton(0,"G. Disrupt.",engineerPerk,"Gravidic Disruptor");
			userInterface.addButton(1,"T. Disrupt.",engineerPerk,"Thermal Disruptor");
		}
	}
	else sleep();
}

function engineerPerk(arg:String):void {
	clearOutput();
	if(arg == "Attack Drone") {
		pc.createPerk("Attack Drone",0,0,0,0,"Gives you a drone that automatically deals additional damage to enemies and slightly boosts your shields.")
		output("'Attack Drone' perk gained!");
	}
	if(arg == "Shield Booster") {
		pc.createPerk(arg,0,0,0,0,"Increases your shielding by four points per level.")
		output("'" + arg + "' perk gained!");	
	}
	if(arg == "Overcharge") 
	{
		pc.createStatusEffect("Overcharge Known");
		output("'" + arg + "' ability gained!");	
	}
	if(arg == "Volley")
	{
		pc.createStatusEffect("Volley Known");
		output("'" + arg + "' ability gained!");	
	}
	if(arg == "Power Surge")
	{
		pc.createStatusEffect("Power Surge Known");
		output("'" + arg + "' ability gained!");	
	}
	if(arg == "Deflector Regeneration")
	{
		pc.createStatusEffect("Deflector Regeneration Known");
		output("'" + arg + "' ability gained!");	
	}
	if(arg == "Gravidic Disruptor") 
	{
		pc.createKeyItem("Gravidic Disruptor",0,0,0,0);
		output("'" + arg + "' ability gained!");
	}
	if(arg == "Thermal Disruptor") 
	{
		pc.createKeyItem("Thermal Disruptor",0,0,0,0);
		output("'" + arg + "' ability gained!");
	}
	userInterface.clearMenu();
	userInterface.addButton(0,"Next",sleep);
}

