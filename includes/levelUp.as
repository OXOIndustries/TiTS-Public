function levelUp():void {
	tryAddLevel();
	levelUpScreen();
}

function tryAddLevel():void
{
	if (pc.XPRaw >= pc.XPMax() && pc.level < 5)
	{
		pc.level++;
		pc.XPRaw = 0;
		pc.maxOutHP();
		//Give level up points!
		if(flags["LEVEL_UP_POINTS"] == undefined) flags["LEVEL_UP_POINTS"] = 0;
		flags["LEVEL_UP_POINTS"] += 13;
		flags["GAINED_LEVEL"] = 1;
	}
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

		clearMenu();
		//Buttons for raising!
		if(pc.physique() + flags["LEVELING_PHYSIQUE_BONUS"] < pc.physiqueMax()) addButton(0,"Physique+",levelPhysique);
		else addDisabledButton(0,"Physique+");
		if(pc.reflexes() + flags["LEVELING_REFLEXES_BONUS"] < pc.reflexesMax()) addButton(1,"Reflex+",levelReflexes);
		else addDisabledButton(1,"Reflex+");
		if(pc.aim() + flags["LEVELING_AIM_BONUS"] < pc.aimMax()) addButton(2,"Aim+",levelAim);
		else addDisabledButton(2,"Aim+");
		if(pc.intelligence() + flags["LEVELING_INTELLIGENCE_BONUS"] < pc.intelligenceMax()) addButton(3,"Intel.+",levelIntelligence);
		else addDisabledButton(3,"Intel.+");
		if(pc.willpower() + flags["LEVELING_WILLPOWER_BONUS"] < pc.willpowerMax()) addButton(4,"Willpower+",levelWillpower);
		else addDisabledButton(4,"Willpower+");
	}
	else {
		output("\n\nYou have spent all your bonus points.");
		//Display current level changes
		levelingStatChangeDisplay();
		clearMenu();
	}
	//Buttons to lower!
	if(flags["LEVELING_PHYSIQUE_BONUS"] > 0) addButton(5,"Physique-",levelPhysique,true);
	else addDisabledButton(5,"Physique-");
	if(flags["LEVELING_REFLEXES_BONUS"] > 0) addButton(6,"Reflex-",levelReflexes,true);
	else addDisabledButton(6,"Reflex-");
	if(flags["LEVELING_AIM_BONUS"] > 0) addButton(7,"Aim-",levelAim,true);
	else addDisabledButton(7,"Aim-");
	if(flags["LEVELING_INTELLIGENCE_BONUS"] > 0) addButton(8,"Intel.-",levelIntelligence,true);
	else addDisabledButton(8,"Intel.-");
	if(flags["LEVELING_WILLPOWER_BONUS"] > 0) addButton(9,"Willpower-",levelWillpower,true);
	else addDisabledButton(9,"Willpower-");
	addButton(14,"Confirm",confirmLevelPointAllocation);
	//If yet to be applied bonuses exist, have option to reset.
	if(flags["LEVELING_PHYSIQUE_BONUS"] + flags["LEVELING_REFLEXES_BONUS"] + flags["LEVELING_AIM_BONUS"] + flags["LEVELING_WILLPOWER_BONUS"] + flags["LEVELING_INTELLIGENCE_BONUS"] > 0)
	{
		addButton(13,"Reset",resetLevelBonuses);
	}
	else addDisabledButton(13,"Reset");
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
	
	if (flags["LEVEL_UP_POINTS"] != undefined && flags["LEVEL_UP_POINTS"] > 0)
	{
		flags["SKIP_ALLOCATION"] = 1;
	}
	
	if (flags["GAINED_LEVEL"] == undefined)
	{
		sleep();
		return;
	}
	else
	{
		flags["GAINED_LEVEL"] = undefined;
	}

	/*
	(4A) (20 Energy) Take Cover: Become nearly invulnerable to ranged attacks for three turns.
	(4B) (20) Riposte: Increase your evasion on any round in which you melee attack.
	(5A) Carpet Grenades: A group of scattering mini-grenades that harm everything on the battlefield. Extra damage against multiple foes.
	(5B) DetCharge: A single high-damage thermal attack against one foe.*/
	if(pc.characterClass == GLOBAL.MERCENARY)
	{
		if(pc.level == 2 && pc.hasPerk("Critical Blows") == false) {
			output("<b>You have gained the 'Critical Blows' perk, granting you a 10% chance of doing double damage on normal melee and ranged attacks.</b>");
			pc.createPerk("Critical Blows",0,0,0,0,"Your strikes and shots have a 10% chance of doing double damage.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Bloodthirsty -</b> Melee attacks will restore a few points of energy.");
			output("\n<b>* Armor Piercing -</b> Ranged attacks will ignore the first few points of enemy defense.");
			clearMenu();
			addButton(0,"Bloodthirsty",mercenaryPerk,"Bloodthirsty");
			addButton(1,"ArmrPiercing",mercenaryPerk,"Armor Piercing");
		}
		else if(pc.level == 3 && pc.hasPerk("Tough") == false) {
			output("<b>You have gained the 'Tough' perk, reducing vulnerability to piercing, slashing, and kinetic damage by 10%.</b>");
			pc.createPerk("Tough",0,0,0,0,"Vulnerability to piercing, slashing, and kinetic damage taken reduced by 10%.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Power Strike -</b> this ability allows you to make a single melee attack at 200% damage.");
			output("\n<b>* Rapid Fire -</b> this ability allows you to make an ranged attack with two extra, low-accuracy shots.");
			clearMenu();
			addButton(0,"Power Strike",mercenaryPerk,"Power Strike");
			addButton(1,"Rapid Fire",mercenaryPerk,"Rapid Fire");
		}
		else if(pc.level == 4 && pc.hasPerk("Juggernaut") == false) {
			output("<b>You have gained the 'Armor Tweaks' perk, granting you a 20% bonus to the defense provided by your armor.</b>");
			pc.createPerk("Juggernaut",0,0,0,0,"You have a 25% chance to overcome any paralysis or stun every round.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Riposte -</b> this ability increases your evasion on any round you melee attack.");
			output("\n<b>* Take Cover -</b> this ability allows you to avoid nearly all incoming ranged attacks for three turns.");
			clearMenu();
			addButton(0,"Riposte",mercenaryPerk,"Riposte");
			addButton(1,"Take Cover",mercenaryPerk,"Take Cover");
		}
		else if(pc.level == 5 && pc.hasStatusEffect("Carpet Grenades") == false && pc.hasStatusEffect("Det. Charge") == false) {
			output("<b>You have unlocked the 'Second Wind' ability, allowing you to recover half your HP and Energy once per combat.</b>");
			//pc.createPerk("Second Wind",0,0,0,0,"You can gain back half your max HP and energy once per combat.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Carpet Grenades -</b> this ability allows you to toss out a handful of micro-grenades, damaging everything in a large area. Deals extra damage to 'plural' type foes and hits all enemies.");
			output("\n<b>* Det. Charge -</b> this ability allows you to lob a detonation charge at a single enemy for very high thermal damage.");
			clearMenu();
			addButton(0,"C. Grenades",mercenaryPerk,"Carpet Grenades");
			addButton(1,"Det. Charge",mercenaryPerk,"Det. Charge");
		}
		else sleep();
	}
	else if(pc.characterClass == GLOBAL.ENGINEER) {
		if(pc.level == 2 && pc.hasPerk("Shield Tweaks") == false) {
			output("<b>You have gained the 'Shield Tweaks' perk, granting you 2 points of bonus shielding per level!</b>");
			pc.createPerk("Shield Tweaks",0,0,0,0,"Your shield generator grants an additional 2 points of shielding per level.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Attack Drone -</b> this ability gives you an attack drone that will automatically fire on your enemies every turn as long as your shields are up. The drone will also supplant your shields with its own, raising your shields by one point per level.");
			output("\n<b>* Shield Booster -</b> this ability further increases your shielding by an additional four points per level.");
			clearMenu();
			addButton(0,"Atk.Drone",engineerPerk,"Attack Drone");
			addButton(1,"Shield B.",engineerPerk,"Shield Booster");
		}
		else if(pc.level == 3 && pc.hasPerk("Enhanced Dampeners") == false) {
			output("<b>You have gained the 'Enhanced Dampeners' perk, reducing any vulnerabilities your shields have to damage by 50%.</b>");
			pc.createPerk("Enhanced Dampeners",0,0,0,0,"Shield vulnerabilities reduced by 50%.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Overcharge -</b> this ability allows you to make a single ranged attack at 150% normal damage. It even has a chance of stunning your target if its shields are down! Requires an energy weapon.");
			output("\n<b>* Volley -</b> this ability allows you to make an extra ranged attack with lowered accuracy but a chance of causing blindness regardless. Requires an energy weapon.");
			clearMenu();
			addButton(0,"Overcharge",engineerPerk,"Overcharge");
			addButton(1,"Volley",engineerPerk,"Volley");
		}
		else if(pc.level == 4 && pc.hasPerk("Armor Tweaks") == false) {
			output("<b>You have gained the 'Armor Tweaks' perk, granting you a 20% bonus to the defense provided by your armor.</b>");
			pc.createPerk("Armor Tweaks",0,0,0,0,"Armor defense is increased by 20%!");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Power Surge -</b> this ability allows you to restore a moderate amount of shielding by spending 33 energy.");
			output("\n<b>* Deflector Regeneration -</b> this ability allows you to restore a moderate amount of shielding over four turns in exchange for 20 energy.");
			clearMenu();
			addButton(0,"P. Surge",engineerPerk,"Power Surge");
			addButton(1,"D. Regen.",engineerPerk,"Deflector Regeneration");
		}
		else if(pc.level == 5 && pc.hasStatusEffect("Static Burst Known") == false) {
			output("<b>You have unlocked the 'Static Burst' ability, allowing you to spend to energy to escape most grapples.</b>");
			pc.createStatusEffect("Static Burst Known");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Gravidic Disruptor -</b> this ability constructs a new key item that can be used to deal gravidic damage to your foes. There shouldn't be anything out there that's resistant to gravidic damage!");
			output("\n<b>* Thermal Disruptor -</b> this ability constructs a new key item that can be used to deal thermal damage to your foes. Against enemies who aren't resistant to it, it will hit harder than a Gravidic Disruptor.");
			clearMenu();
			addButton(0,"G. Disrupt.",engineerPerk,"Gravidic Disruptor");
			addButton(1,"T. Disrupt.",engineerPerk,"Thermal Disruptor");
		}
		else sleep();
	}
	else if(pc.characterClass == GLOBAL.SMUGGLER) {
		if(pc.level == 2 && pc.hasPerk("Lucky Breaks") == false) {
			output("<b>You have gained the 'Lucky Breaks' perk, granting you an extra 10% evasion chance.</b>");
			pc.createPerk("Lucky Breaks",0,0,0,0,"You have an additional 10% chance to avoid incoming attacks.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Shoot First -</b> When shooting in the first round of combat, get an additional attack.");
			output("\n<b>* Low Blow -</b> A melee strike with a high chance of stunning your opponent.");
			clearMenu();
			addButton(0,"Shoot First",smugglerPerk,"Shoot First");
			addButton(1,"Low Blow",smugglerPerk,"Low Blow");
		}
		else if(pc.level == 3 && pc.hasPerk("Escape Artist") == false) {
			output("<b>You have gained the 'Escape Artist' perk, allowing you to use reflexes instead of physique to escape from grapples and granting a slight bonus.</b>");
			pc.createPerk("Escape Artist",0,0,0,0,"Use reflexes to escape grapples with a slight bonus.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Sneak Attack -</b> this ability increases melee damage done against stunned or blinded targets greatly. Additional negative statuses may further increase the damage.");
			output("\n<b>* Aimed Shot -</b> this ability increases ranged damage done against stunned or blinded targets greatly. Additional negative statuses may further increase the damage.");
			clearMenu();
			addButton(0,"Sneak Attack",smugglerPerk,"Sneak Attack");
			addButton(1,"Aimed Shot",smugglerPerk,"Aimed Shot");
		}
		else if(pc.level == 4 && pc.hasPerk("Agility") == false) {
			output("<b>You have gained the 'Agility' perk, increasing evasion granted from items by 20% or 2%, whichever is higher.</b>");
			pc.createPerk("Agility",0,0,0,0,"Evasion gained from items increased by 20% or a flat 2% dodge chance, whichever is better!");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Stealth Field Generator -</b> this ability gives you a massive boost to evasion for two turns.");
			output("\n<b>* Disarming Shot -</b> this ability prevents your target from using a weapon for four turns.");
			clearMenu();
			addButton(0,"S.F.Generator",smugglerPerk,"Stealth Field Generator");
			addButton(1,"Disarming S.",smugglerPerk,"Disarming Shot");
		}
		else if(pc.level == 5 && pc.hasPerk("Sharp Eyes") == false) {
			output("<b>You have unlocked the 'Sharp Eyes' ability, allowing you to recover from blindness one turn sooner.</b>");
			pc.createPerk("Sharp Eyes",0,0,0,0,"You recover from blindness one turn sooner.");
			output("\n\nYou may also choose one of the following abilities. You will only get to pick one of these two options, so make a wise decision:");
			output("\n<b>* Gas Grenade -</b> this ability constructs a new key item that can be used to deal lust damage to your foes!");
			output("\n<b>* Grenade -</b> this ability constructs a new key item that can be used to deal thermal damage to your foes!");
			clearMenu();
			addButton(0,"Gas Grenade",smugglerPerk,"Gas Grenade");
			addButton(1,"Grenade",smugglerPerk,"Grenade");
		}
		else sleep();
	}
	else sleep();
}

function mercenaryPerk(arg:String):void {
	clearOutput();
	switch(arg)
	{
		case "Armor Piercing":
			pc.createPerk("Armor Piercing",0,0,0,0,"Your shots ignore the first few points of enemy armor.");
			output("'" + arg + "' perk gained!");
			break;
		case "Bloodthirsty":
			pc.createPerk("Bloodthirsty",0,0,0,0,"You regain a small amount of energy from your melee attacks.");
			output("'" + arg + "' perk gained!");
			break;
		case "Power Strike":
			pc.createStatusEffect("Power Strike Known");
			output("'" + arg + "' ability gained!");
			break;
		case "Rapid Fire":
			pc.createStatusEffect("Rapid Fire Known");
			output("'" + arg + "' ability gained!");
			break;
		case "Riposte":
			pc.createPerk("Riposte",0,0,0,0,"Your melee attacks grant you bonus evasion for the rest of the round.");
			output("'" + arg + "' perk gained!");
			break;
		case "Take Cover":
			pc.createStatusEffect("Take Cover Known",0,0,0,0);
			output("'" + arg + "' ability gained!");
			break;
		case "Carpet Grenades":
			pc.createStatusEffect("Carpet Grenades Known",0,0,0,0);
			output("'" + arg + "' ability gained!");
			break;
		case "Det. Charge":
			pc.createStatusEffect("Det. Charge Known",0,0,0,0);
			output("'" + arg + "' ability gained!");
			break;
		default:
			output("\n\n<b>MASSIVE ERROR. INVALID LEVEL UP GAIN: " + arg + "</b>");
			break;
	}
	clearMenu();
	addButton(0,"Next",sleep);
}
function smugglerPerk(arg:String):void {
	clearOutput();
	switch(arg) 
	{
		case "Low Blow":
			pc.createStatusEffect("Low Blow Known");
			output("'" + arg + "' ability gained!");
			break;
		case "Shoot First":
			pc.createPerk("Shoot First",0,0,0,0,"When making ranged attacks in the first round of combat, gain a bonus attack.")
			output("'" + arg + "' perk gained!");
			break;
		case "Sneak Attack":
			pc.createPerk("Sneak Attack",0,0,0,0,"When making melee attacks against stunned or blinded enemies, deal extra damage.")
			output("'" + arg + "' perk gained!");
			break;
		case "Aimed Shot":
			pc.createPerk("Aimed Shot",0,0,0,0,"When making ranged attacks against stunned or blinded enemies, deal extra damage.")
			output("'" + arg + "' perk gained!");
			break;
		case "Stealth Field Generator":
			pc.createStatusEffect("Stealth Field Generator Known");
			output("'" + arg + "' ability gained!");
			break;
		case "Disarming Shot":
			pc.createStatusEffect("Disarming Shot Known");
			output("'" + arg + "' ability gained!");
			break;
		case "Gas Grenade":
			pc.createStatusEffect("Gas Grenade Known");
			output("'" + arg + "' ability gained");
			break;
		case "Grenade":
			pc.createStatusEffect("Grenade Known");
			output("'" + arg + "' ability gained");
			break;
		default:
			output("Yo an error happened.");
	}
	clearMenu();
	addButton(0,"Next",sleep);
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
	clearMenu();
	addButton(0,"Next",sleep);
}

