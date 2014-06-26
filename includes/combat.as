import classes.Characters.Mimbrane;
import classes.Characters.PhoenixPirates;
import classes.Creature;
import classes.Items.Guns.Goovolver;

//Tracks what NPC in combat we are on. 0 = PC, 1 = first NPC, 2 = second NPC, 3 = fourth NPC... totalNPCs + 1 = status tic


public function inCombat():Boolean 
{
	return (pc.hasStatusEffect("Round"));
}

function combatMainMenu():void 
{
	userInterface.showPrimaryOutput();
	if(flags["COMBAT MENU SEEN"] == undefined)
	{
		clearOutput();
		//Track round, expires on combat exit.
		if(!pc.hasStatusEffect("Round")) pc.createStatusEffect("Round",1,0,0,0,true,"","",true,0);
		else pc.addStatusValue("Round",1,1);
		
		//Show what you're up against.
		if(foes[0] == celise) this.userInterface.showBust("CELISE");
		for(var x:int = 0; x < foes.length; x++) 
		{
			if(x > 0) output("\n\n");
			displayMonsterStatus(foes[x]);
		}
	}
	//Check to see if combat should be over or not.
	//Victory check first, because PC's are OP.
	if(allFoesDefeated()) {
		//new PG for start of victory text, overrides normal menus.
		output("\n");
		//Route to victory menus and GTFO.		
		//clearMenuProxy();
		//addButton(0,"Victory",victoryRouting);
		victoryRouting();
		return;
	}
	else if(pc.HP() <= 0 || pc.lust() >= pc.lustMax() || ((pc.physique() == 0 || pc.willpower() == 0) && pc.hasStatusEffect("Naleen Venom") && (foes[0] is Naleen || foes[0] is NaleenMale))) {
		//YOU LOSE! GOOD DAY SIR!
		trace("DEFEAT LOSS! - IN MAIN MENU");
		output("\n");
		//clearMenuProxy();
		//addButton(0,"Defeat",defeatRouting);
		defeatRouting();
		return;
	}
	//Tutorial menus
	if(foes[0].short == "Celise") {
		celiseMenu();
		return;
	}
	if(flags["COMBAT MENU SEEN"] == undefined)
	{
		updateCombatStatuses();
	}
	//Stunned Menu
	if (pc.hasStatusEffect("Stunned") || pc.hasStatusEffect("Paralyzed"))
	{
		if(pc.hasStatusEffect("Stunned")) output("\n<b>You're still stunned!</b>");
		this.addButton(0,"Recover",stunRecover,pc);
	}
	//Bound Menu
	else if (pc.hasStatusEffect("Naleen Coiled"))
	{
		output("\n<b>You are wrapped up in coils!</b>");
		addButton(0,"Struggle",naleenStruggle);
		if(pc.hasPerk("Static Burst")) {
			if(pc.energy() >= 50) this.addButton(3,"StaticBurst",staticBurst);
			else this.addDisabledButton(3,"StaticBurst");
		}
		this.addButton(4,"Do Nothing",wait);
	}
	//Grapple Menu
	else if (pc.hasStatusEffect("Grappled"))
	{
		output("\n<b>You are grappled and unable to fight normally!</b>");
		addButton(0,"Struggle",grappleStruggle);
		if(pc.hasPerk("Static Burst")) {
			if(pc.energy() >= 50) this.addButton(3,"StaticBurst",staticBurst);
			else this.addDisabledButton(3,"StaticBurst");
		}
		this.addButton(4,"Do Nothing",wait);
	}
	// Mimbrane Smother
	else if (pc.hasStatusEffect("Mimbrane Smother"))
	{
		output("\n\n<b>You are being smothered by a Mimbrane!</b>");
		addButton(0, "Struggle", mimbraneStruggle);
		if (pc.hasPerk("Static Burst"))
		{
			if (pc.energy() >= 50) this.addButton(3, "Static Burst", staticBurst);
			else this.addDisabledButton(3, "Static Burst");
		}
		this.addButton(4, "Do Nothing", wait);
	}
	else 
	{
		//Combat menu
		this.clearMenu();
		this.addButton(0,"Attack",attackRouter,playerAttack,"Attack","Attack a single enemy with a melee strike. Damage is based on physique.");
		this.addButton(1, upperCase(pc.rangedWeapon.attackVerb), attackRouter, playerRangedAttack, "Ranged Attack", "Attack a single enemy with a ranged weapon. Damage is based on aim.");
		this.addButton(3, "Inventory", inventory, undefined, "Inventory", "Use items in combat.");
		this.addButton(4,"Specials",specialsMenu,undefined,"Specials","The special attacks you have available to you are listed in this menu.");
		this.addButton(5,"Tease",attackRouter,teaseMenu,"Tease Menu","Opens up your menu of available lust targetting attacks. It is recommended that the \"Sense\" option be used beforehand.");
		this.addButton(6,"Sense",attackRouter,sense,"Sense","Attempts to get a feel for a foe's likes and dislikes. Absolutely critical for someone who plans on seducing " + pc.mf("his","her") + " way out of a fight.");
		if(pc.hasStatusEffect("Trip")) addButton(8,"Stand Up",standUp,undefined,"Stand Up","Stand up, getting rid of the \"Trip\" status effect. This will consume your offensive action for this turn.");
		this.addButton(9,"Fantasize",fantasize,undefined,"Fantasize","Fantasize about your foe until you're helpless and on your knees before them.");
		this.addButton(14,"Run",runAway,undefined,"Run","Attempt to run away from your enemy. Success is greatly dependant on reflexes. Immobilizing your enemy before attempting to run will increase the odds of success.");
	}
	flags["COMBAT MENU SEEN"] = 1;
}

function specialsMenu():void {
	clearMenu();
	addButton(14,"Back",combatMainMenu,undefined,"Go back to the main combat screen.");
	addButton(13,"Wait",wait,undefined,"Wait","There's no real reason to this unless you're just dragging out combat to see what your enemy will do.");
	var offset:int = 0;
	if(pc.characterClass == GLOBAL.MERCENARY)
	{
		//EVERYONE HAS
		if(pc.energy() >= 25) addButton(0,"Headbutt",attackRouter,headbutt,"Headbutt","A physique-based attack that does not factor in weapon damage but has a chance of stunning your target.\n\nConsumes 25 energy.");
		else addDisabledButton(0,"Headbutt");
		
		//EITHER OR!
		if(pc.hasPerk("Rapid Fire"))
		{
			if(pc.energy() >= 20) addButton(1,"Rapid Fire",attackRouter,rapidFire,"Rapid Fire","Perform a long range attack with two additional, low accuracy shots following it.\n\nConsumes 20 energy.");
			else addDisabledButton(1,"Rapid Fire");
		}
		if(pc.hasPerk("Power Strike"))
		{
			if(pc.energy() >= 20) addButton(1,"Power Strike",attackRouter,powerStrike,"Power Strike","Strike once with a melee weapon for double damage.\n\nConsumes 20 energy.");
			else addDisabledButton(1,"Power Strike");
		}
		offset = 2;
		if(pc.hasPerk("Take Cover")) 
		{
			
			if(pc.energy() >= 20) addButton(offset,"Take Cover",takeCover,undefined,"Take Cover","Provides you a 90% chance of avoiding a ranged attack this turn.\n\nConsumes 20 energy.");
			else addDisabledButton(offset,"Take Cover");
			offset++;
		}
		if (pc.hasPerk("Carpet Grenades"))
		{
			if(pc.energy() >= 25) addButton(offset,"Carpet Grenades",carpetGrenades,undefined,"Carpet Grenades","An attack that is extra effective against multiple foes. It deals thermal damage and is not tied into particular stat.\n\nConsumes 25 energy.");
			else addDisabledButton(offset,"Carpet Grenades");
			offset++;
		}
		if(pc.hasPerk("Detonation Charge"))
		{
			if(pc.energy() >= 25) addButton(offset,"Det. Charge",attackRouter,detCharge,"Detonation Charge","Deals a moderate amount of thermal damage against a single foe.\n\nConsumes 25 energy.");
			else addDisabledButton(offset,"Det. Charge");
			offset++;
		}
		if(pc.level >= 5)
		{
			if(!pc.hasStatusEffect("Used Second Wind")) addButton(offset,"Second Wind",secondWind,undefined,"Second Wind","Regenerate 50% of your maximum HP and energy once per battle! An invaluable ability for the mercenary in the field.");
			else addDisabledButton(offset,"Second Wind");
			offset++;
		}
	}
	else if(pc.characterClass == GLOBAL.ENGINEER) {
		if(pc.energy() >= 25) addButton(0,"P.Shock",attackRouter,paralyzingShock,"Paralyzing Shock","An attack that allows you to paralyze a single foe. Characters with higher intelligence will have greater success using this skill.\n\nConsumes 25 energy.");
		else addDisabledButton(0,"P.Shock");
		if(pc.hasPerk("Volley")) 
		{
			if(pc.energy() >= 20) addButton(1,"Volley",attackRouter,volley,"Volley","An attack that allows you to fire your gun one additional time at lowered accuracy. Players with higher aim will notice the attack has a higher chance of blinding of the target.\n\nConsumes 20 energy.");
			else addDisabledButton(1,"Volley");
		}
		if(pc.hasPerk("Overcharge"))
		{
			if(pc.rangedWeapon.damageType == GLOBAL.KINETIC || pc.rangedWeapon.damageType == GLOBAL.SLASHING || pc.rangedWeapon.damageType == GLOBAL.PIERCING)
			{
				addDisabledButton(1,"Overcharge","Overcharge","Only energy weapons may be overcharged.");
			}
			else
			{
				if(pc.energy() >= 20) addButton(1,"Overcharge",attackRouter,overcharge,"Overcharge","A powerful ranged attack, Overcharge deals 150% damage and has a chance of stunning. Higher aim increases the chance of successfully stunning your foe.\n\nConsumes 25 energy.");
				else addDisabledButton(1,"Overcharge","Overcharge","You do not have enough energy to use Overcharge.");
			}
		}
		if(pc.hasPerk("Deflector Regeneration"))
		{
			if(pc.energy() >= 20) addButton(2,"D. Regen.",deflectorRegeneration,pc,"Deflector Regeneration","Restores a portion of your shields every turn. Higher intelligence characters will regain even more shields per turn.\n\nConsumes 20 energy.");
			else addDisabledButton(2,"D. Regen.");
		}
		if(pc.hasPerk("Power Surge"))
		{
			if(pc.energy() >= 33) addButton(2,"P. Surge",powerSurge,pc,"Power Surge","Restores a moderate amount of shields based on intelligence.\n\nConsumes 33 energy.");
			else addDisabledButton(2,"P. Surge");
		}
		if(pc.hasPerk("Thermal Disruptor"))
		{
			if(pc.energy() >= 25) addButton(3,"T. Disrupt.",attackRouter,thermalDisruptor,"Thermal Disruptor","Deals a large amount of intelligence-based thermal damage to a single target.\n\nConsumes 25 energy.");
			else addDisabledButton(3,"T. Disrupt.");
		}
		if(pc.hasPerk("Gravidic Disruptor"))
		{
			if(pc.energy() >= 25) addButton(3,"G. Disrupt.",attackRouter,gravidicDisruptor,"Gravitic Disruptor","Deals a moderate amount of intelligence-based gravitic damage to a single target.\n\nConsumes 25 energy.");
			else addDisabledButton(3,"G. Disrupt.");
		}
	}
	else if(pc.characterClass == GLOBAL.SMUGGLER)
	{
		if(silly)
		{
			if(pc.energy() >= 10) addButton(0,"P.Sand",attackRouter,flashGrenade,"Pocket Sand","Produce some sand from your level and use it to blind your enemies! Better aim will help you land the attack.\n\nConsumes 10 energy.");
			else addDisabledButton(0,"P.Sand");
		}
		else
		{
			if(pc.energy() >= 10) addButton(0,"F.Grenade",attackRouter,flashGrenade,"Flash Grenade","Produce a rechargible flash grenade and use it to blind your enemy. Better aim will increase the chance of success.\n\nConsumes 10 energy.");
			else addDisabledButton(0,"F.Grenade");	
		}
		if(pc.hasPerk("Low Blow"))
		{
			if(pc.energy() >= 15) addButton(1,"Low Blow",attackRouter,lowBlow,"Low Blow","A melee strike with an aim-based chance of stunning your target.\n\nConsumes 15 energy.");
			else addDisabledButton(1,"Low Blow");	
		}
		if(pc.hasPerk("Disarming Shot")) {
			if(pc.energy() >= 20) addButton(2,"Disarm Shot",attackRouter,disarmingShot,"Disarming Shot","Disarms your foe, preventing them from making use of melee or ranged weapons for turn.\n\nConsumes 15 energy.");
			else addDisabledButton(2,"Disarm Shot");	
		}
		if(pc.hasPerk("Stealth Field Generator")) {
			if(pc.energy() >= 20 && !pc.hasStatusEffect("Stealth Field Generator")) addButton(2,"Stealth Field",stealthFieldActivation,undefined,"Stealth Field","Creates a stealth field that greatly increases your evasion for a few turns.");
			else addDisabledButton(2,"Stealth Field");	
		}
		if(pc.hasPerk("Grenade"))
		{
			if(pc.energy() >= 25) addButton(3,"Grenade",attackRouter,grenade,"Grenade","Does a moderate amount of thermal damage to a single opponent.\n\nConsumes 25 energy.");
			else addDisabledButton(3,"Grenade");	
		}
		if(pc.hasPerk("Gas Grenade"))
		{
			if(pc.energy() >= 25) addButton(3,"Gas Grenade",attackRouter,gasGrenade,"Gas Grenade","An unavoidable attack that deals a fair amount of lust damage.\n\nConsumes 25 energy.");
			else addDisabledButton(3,"Gas Grenade");	
		}
	}
}

function updateCombatStatuses():void {
	var temp:Number = 0;
	//PC STATUSES!
	if(pc.hasStatusEffect("Taking Cover")) pc.removeStatusEffect("Taking Cover");
	if(pc.hasStatusEffect("Riposting")) pc.removeStatusEffect("Riposting");
	if(pc.hasPerk("Juggernaught"))
	{
		if(pc.hasStatusEffect("Stunned") && rand(4) == 0)
		{
			output("<b>You shake off your stun! You're unstoppable!</b>\n");
			pc.removeStatusEffect("Stunned");
		}
		if(pc.hasStatusEffect("Paralyzed") && rand(4) == 0)
		{
			output("<b>You shake off the paralysis! You're unstoppable!</b>\n");
			pc.removeStatusEffect("Paralyzed");
		}
	}
	if(pc.hasStatusEffect("Burning"))
	{
		pc.addStatusValue("Burning",1,-1);
		//Remove status!
		if(pc.statusEffectv1("Burning") <= 0) {
			pc.removeStatusEffect("Burning");
			output("<b>At last you manage to stifle the life out of the fire on your " + pc.armor.longName + ". The smell of pork hangs in your nose. You try not to think about it.</b>\n");
		}
		//Keep status!
		else
		{
			output("<b>You desperately slap at your body, trying to extinguish the flames that have taken to your " + pc.armor.longName + " but it stubbornly clings to you, blackening and bubbling everything it touches. It burns!</b>");
			genericDamageApply(rand(4) + foes[0].level,foes[0],pc,GLOBAL.THERMAL);
			output("\n");
		}
	}
	if(!pc.hasStatusEffect("Blind") && pc.hasStatusEffect("Quivering Quasar"))
	{
		if(rand(10) == 0) 
		{
			output("<b>You abruptly go blind, perhaps an effect of the Quivering Quasar you drank.</b>")
			pc.createStatusEffect("Blind",2,0,0,0,false,"Blind","You're blinded and cannot see! Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
		}
	}
	if(pc.hasStatusEffect("Blind")) {
		pc.addStatusValue("Blind",1,-1);
		if(pc.statusEffectv1("Blind") <= 0) {
			pc.removeStatusEffect("Blind");
			output("<b>You can see again!</b>\n");
		}
		else if(pc.hasPerk("Sharp Eyes") && pc.statusEffectv1("Blind") <= 1) {
			pc.removeStatusEffect("Blind");
			output("<b>You can see again!</b>\n");	
		}
	}
	if(pc.hasStatusEffect("Paralyzed")) {
		pc.addStatusValue("Paralyzed",1,-1);
		if(pc.statusEffectv1("Paralyzed") <= 0) {
			pc.removeStatusEffect("Paralyzed");
			output("<b>The paralytic venom wears off, and you are able to move once more.</b>\n");
		}
		else output("<b>You're paralyzed and unable to move!</b>\n");
	}
	if(pc.hasStatusEffect("Stealth Field Generator"))
	{
		pc.addStatusValue("Stealth Field Generator",1,-1);
		if(pc.statusEffectv1("Stealth Field Generator") <= 0)
		{
			output("<b>Your stealth field generator collapses.</b>\n");
			pc.removeStatusEffect("Stealth Field Generator");
		}
		else {
			output("<b>You are practically invisible thanks to your stealth field generator.</b>");
		}
	}
	if(pc.hasStatusEffect("Deflector Regeneration"))
	{
		pc.addStatusValue("Deflector Regeneration",1,-1);
		temp = pc.statusEffectv2("Deflector Regeneration");
		if(temp + pc.shields() > pc.shieldsMax()) temp = pc.shieldsMax() - pc.shields();
		if(temp > 0) 
		{
			output("<b>Your recover " + temp + " points of shielding.\n");
			pc.shields(temp);
		}
		if(pc.statusEffectv1("Deflector Regeneration") <= 0)
		{
			output("<b>Your shields are no longer regenerating!</b>\n");
			pc.removeStatusEffect("Deflector Regeneration");
		}
	}
	if (pc.hasStatusEffect("Porno Hacked Drone"))
	{
		if(pc.shields() > 0)
		{
			pc.addStatusValue("Porno Hacked Drone",1,-1);
			if(pc.statusEffectv1("Porno Hacked Drone") <= 0)
			{
				output("<b>With a grinding click the porn beaming out of your drone snuffs out, finally getting the better of the sexbot’s hacking routine, and returns to your side.\n</b>");
				pc.removeStatusEffect("Porno Hacked Drone");
			}
			else
			{
				//Combat blurb:
				output("<b>Your hacked drone continues to fly into your line of sight and near your ear no matter how many times you slap it away, inundating your senses with garish, shifting and teasing smut.\n</b>");
				pc.lust(4);
			}
		}
	}
	if (pc.hasStatusEffect("Mimbrane Lust Cloud"))
	{
		if (mimbraneDebug) trace("Player is still afflicted with Mimbrane Lust Cloud");
		pc.addStatusValue("Mimbrane Lust Cloud", 2, -1);
		if (pc.statusEffectv1("Mimbrane Lust Cloud") <= 0)
		{
			if (mimbraneDebug) trace("Removing lust cloud effect from player");
			pc.removeStatusEffect("Mimbrane Lust Cloud");
			output("<b>The parasite’s noxious perspiration has faded away.</b>");
		}
		else
		{
			if (mimbraneDebug) trace("Lust cloud remains.");
			pc.lust(5 + rand(10));
			output("\n<b>The parasite's venom is coursing through your veins. Your sexual desire is rising at an alarming rate.</b>");
		}
	}
	//ENEMY STATUSES!
	for(var x:int = 0; x < foes.length; x++)
	{
		if(foes[x].hasStatusEffect("Blind"))
		{
			foes[x].addStatusValue("Blind",1,-1);
			if(foes[x].statusEffectv1("Blind") <= 0)
			{
				foes[x].removeStatusEffect("Blind");
				if(foes[x].plural) output("<b>" + foes[x].capitalA + foes[x].short + " are no longer blinded!</b>\n");
				else output("<b>" + foes[x].capitalA + foes[x].short + " is no longer blinded!</b>\n");
			}
			else if(foes[x].hasPerk("Sharp Eyes") && foes[x].statusEffectv1("Blind") <= 1) 
			{
				foes[x].removeStatusEffect("Blind");
				if(foes[x].plural) output("<b>" + foes[x].capitalA + foes[x].short + " are no longer blinded!</b>\n");
				else output("<b>" + foes[x].capitalA + foes[x].short + " is no longer blinded!</b>\n");
			}
			else 
			{
				if(foes[x].plural) output("<b>" + foes[x].capitalA + foes[x].short + " are blinded.</b>\n");
				else output("<b>" + foes[x].capitalA + foes[x].short + " is blinded.</b>\n");
			}
		}
		if(foes[x].hasStatusEffect("Disarmed"))
		{
			foes[x].addStatusValue("Disarmed",1,-1);
			if(foes[x].statusEffectv1("Disarmed") <= 0)
			{
				foes[x].removeStatusEffect("Disarmed");
				if(foes[x].plural) output("<b>" + foes[x].capitalA + foes[x].short + " are no longer disarmed!</b>\n");
				else output("<b>" + foes[x].capitalA + foes[x].short + " is no longer disarmed!</b>\n");
			}
			else 
			{
				if(foes[x].plural) output("<b>" + foes[x].capitalA + foes[x].short + " are disarmed.</b>\n");
				else output("<b>" + foes[x].capitalA + foes[x].short + " is disarmed.</b>\n");
			}
		}
		if (foes[x].hasStatusEffect("Mimbrane Lust Cloud"))
		{
			cloudDebuffHandler(foes[x]);
		}
	}
}
function stunRecover(target:Creature):void 
{
	if(target.hasStatusEffect("Stunned")) {
		if(target == pc) clearOutput();
		target.addStatusValue("Stunned",1,-1);
		if (target.statusEffectv1("Stunned") <= 0)
		{
			target.removeStatusEffect("Stunned");
			if(target == pc) output("You manage to recover your wits and adopt a fighting stance!\n");
			else if(!target.plural) output(target.capitalA + target.short + " manages to recover " + target.mfn("his","her","its") + " wits and adopt a fighting stance!");
			else output(target.capitalA + target.short + " manage to recover their wits and adopt a fighting stance!");
		}
		else
		{
			if(target == pc) output("You're still too stunned to act!\n");
			else if(!target.plural) output(target.capitalA + target.short + " is still too stunned to act!");
			else output(target.capitalA + target.short + " are still too stunned to act!");
		}
	}
	if(target.hasStatusEffect("Paralyzed")) {
		if(target == pc) clearOutput();
		if(target.statusEffectv1("Paralyzed") <= 1) output("The venom seems to be weakening, but you can't move yet!\n");
		else output("You try to move, but just can't manage it!\n");
	}
	processCombat();
}

function standUp():void
{
	clearOutput();
	output("You climb up onto your [pc.feet].\n");
	pc.removeStatusEffect("Trip");
	processCombat();
}

function celiseMenu():void 
{
	this.clearMenu();
	if(pc.statusEffectv1("Round") == 1) 
		this.addButton(0,"Attack",attackRouter,playerAttack);
	else if(pc.statusEffectv1("Round") == 2) 
		this.addButton(1,upperCase(pc.rangedWeapon.attackVerb),attackRouter,playerRangedAttack);
	else 
		this.addButton(5,"Tease",attackRouter,tease);
}

function processCombat():void 
{
	flags["COMBAT MENU SEEN"] = undefined;
	combatStage++;
	trace("COMBAT STAGE:" + combatStage);
	//Check to see if combat should be over or not.
	//Victory check first, because PC's are OP.
	if(allFoesDefeated()) {
		//Go back to main menu for victory announcement.
		this.clearMenu();
		this.addButton(0,"Victory",combatMainMenu);
		return;
	}
	if (pc.HP() <= 0 || pc.lust() >= pc.lustMax() || ((pc.physique() <= 0 || pc.willpower() <= 0) && pc.hasStatusEffect("Naleen Venom") && foes[0] is Naleen))
	{
		trace("DEFEAT LOSS!");
		trace("PHYS: " + pc.physique() + " WILLPOWAH:" + pc.willpower());
		if(pc.hasStatusEffect("NALEEN VENOM")) trace("VENOMED");
		if(foes[0] is Naleen) trace("FIGHTIN NALEEN");

		//YOU LOSE! GOOD DAY SIR!
		this.clearMenu();
		this.addButton(0,"Defeat",combatMainMenu);
		return;
	}
	
	// Hooking some stuff up for Fall of the Phoenix
	if (pc.hasStatusEffect("Saendra Fights4Buttes") && combatStage == 1)
	{
		saendraInjuredHelperAI();
	}
	
	//If enemies still remain, do their AI routine.
	if(combatStage-1 < foes.length) {
		output("\n");
		if(foes[combatStage-1].hasStatusEffect("Stunned")) stunRecover(foes[combatStage-1]);
		else enemyAI(foes[combatStage-1]);
		return;
	}
	if(pc.hasPerk("Attack Drone")) trace("HAS DRONE. COMBAT STAGE: " + combatStage + " FOES.LENGTH: " + foes.length);
	if(flags["DRONE_TARGET"] != undefined) trace("DRONE_TARGET: " + flags["DRONE_TARGET"]);
	else trace("DRONE_TARGET: UNDEFINED");
	//DRONE TIME - only attacks targets if they've been marked!
	if(combatStage == foes.length+1 && pc.hasPerk("Attack Drone") && flags["DRONE_TARGET"] != undefined)
	{
		if(pc.shields() > 0) {
			output("\n\n");
			//Clear drone down if got shields healed.
			if(pc.hasStatusEffect("Drone Down")) {
				output("Your drone shudders to life, lifting back into the air and circling your target helpfully. ");
				pc.removeStatusEffect("Drone Down");
			}
			droneAttack(foes[flags["DRONE_TARGET"]]);
			return;
		}
		//No shields and drone not down yet? Give notification!
		else if(!pc.hasStatusEffect("Drone Down")) {
			output("\n\nYour drone collapses along with your shields. It sputters weakly as it shuts down.<b> It won't be doing any more damage until you bring your shields back up!</b>");
			pc.createStatusEffect("Drone Down",0,0,0,0,true,"","",true,0);
		}
	}
	combatStage = 0;
	this.clearMenu();
	this.addButton(0,"Next",combatMainMenu);
}

function grappleStruggle():void {
	clearOutput();
	if(pc.hasPerk("Escape Artist"))
	{
		if(pc.reflexes() + rand(20) + 6 + pc.statusEffectv1("Grappled") * 5 > pc.statusEffectv2("Grappled")) {
			output("You display a remarkable amount of flexibility as you twist and writhe to freedom.");
			pc.removeStatusEffect("Grappled");
		}
	}
	else 
	{
		if(pc.reflexes() + rand(20) + 6 + pc.statusEffectv1("Grappled") * 5 > pc.statusEffectv2("Grappled"))
		{
			if(foes[0] is SexBot) output("You almost dislocate an arm doing it, but, ferret-like, you manage to wriggle out of the sexbot’s coils. Once your hands are free the droid does not seem to know how to respond and you are able to grapple the rest of your way out easily, ripping away from its molesting grip. The sexbot clicks and stutters a few times before going back to staring at you blankly, swinging its fibrous limbs over its head.");
			else output("With a mighty heave, you tear your way out of the grappled and onto your [pc.feet].");
			pc.removeStatusEffect("Grappled");
		}
	}
	//Fail to escape: 
	if(pc.hasStatusEffect("Grappled"))
	{
		if(foes[0] is SexBot) output("You struggle as hard as you can against the sexbot’s coils but the synthetic fibre is utterly unyielding.");
		else output("You struggle madly to escape from the pin but ultimately fail. The pin does feel a little looser as a result, however.");
		pc.addStatusValue("Grappled",1,1);
	}
	output("\n");
	processCombat();
}

function staticBurst():void {
	clearOutput();
	pc.energy(-50);
	output("You release a discharge of electricity, momentarily weakening your ");
	if(foes[0].plural) output("foes'");
	else output("foe's");
	output(" grip on you!");
	if(pc.hasStatusEffect("Naleen Coiled")) {
		pc.removeStatusEffect();
		output("\nThe naleen's tail spasms as you easily slip out of its coils.");
	}
	if(pc.hasStatusEffect("Grappled"))
	{
		pc.removeStatusEffect("Grappled");
		output("\nYou slip free of the grapple.");
	}
	output("\n");
	processCombat();
}

function allFoesDefeated():Boolean 
{
	for(var x:int = 0; x < foes.length; x++) {
		//If a foe is up, fail.
		if(foes[x].HP() > 0 && foes[x].lust() < 100) return false;
	}
	//If we get through them all, check! All foes down.
	return true;
}

function combatMiss(attacker:Creature, target:Creature):Boolean 
{
	if(rand(100) + attacker.physique()/5 + attacker.meleeWeapon.attack - target.reflexes()/5 < 10 && !target.isImmobilized()) 
	{
		return true;
	}
	//Evasion chances
	if(target.evasion() >= rand(100) + 1) {
		trace("EVASION WORKED!: " + target.evasion());
		return true;
	}
	//10% miss chance for lucky breaks!
	if(target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;
	if(target.hasPerk("Melee Immune")) return true;
	return false;
}
function rangedCombatMiss(attacker:Creature, target:Creature):Boolean 
{
	//Immune!
	if(target.hasPerk("Ranged Immune")) return true;
	//Standard miss chance
	if(rand(100) + attacker.aim()/5 + attacker.rangedWeapon.attack - target.reflexes()/3 < 10 && !target.isImmobilized()) 
	{
		return true;
	}
	//Evasion chances
	if(target.evasion() >= rand(100) + 1) return true;
	//Take cover chance
	if(target.hasStatusEffect("Taking Cover") && rand(100) + 1 < 90) return true;
	//10% miss chance for lucky breaks!
	if(target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;
	
	return false;
}

function attackRouter(destinationFunc):void 
{
	// Inject the mimbrane attack shit infront of the regular attacks
	clearOutput();
	
	if (mimbraneCombatInterference())
	{
		processCombat();
		return;
	}
	
	output("Who do you target?\n");
	for(var x:int = 0; x < foes.length; x++) {
		output(foes[x].capitalA + foes[x].short + ": " + foes[x].HP() + " HP, " + foes[x].lust() + " Lust\n");
	}
	var button:int = 0;
	var counter:int = 0;
	if(foes.length == 1) {
		destinationFunc(foes[0]);
		return;
	}
	this.clearMenu();
	while(counter < foes.length) {
		this.addButton(button,foes[0].short,destinationFunc,foes[counter]);
		counter++;
		button++;
	}
	if(button < 14) button = 14;
	this.addButton(button,"Back",combatMainMenu);
}

function enemyAttack(attacker:Creature):void 
{
	attack(attacker, pc);
}

function playerAttack(target:Creature):void 
{
	attack(pc, target, true);
	mimbraneHandBonusAttack(target);
	playerMimbraneCloudAttack();
	processCombat();
}

function playerRangedAttack(target:Creature):void 
{
	rangedAttack(pc, target);
	playerMimbraneCloudAttack();
}

function attack(attacker:Creature, target:Creature, noProcess:Boolean = false, special:int = 0):void {
	//Set drone target
	if(attacker == pc && pc.hasPerk("Attack Drone"))
	{
		//Figure out where in the foes array the target is and set drone target to the index.
		//Clunky as all fuck but it works.
		for(var i:int = 0; i < foes.length; i++) {
			if(foes[i] == target) flags["DRONE_TARGET"] = i;
		}
	}
	if (foes[0].short == "female zil") flags["HIT_A_ZILGIRL"] = 1;
	if (attacker == pc)
	{
		if (!attacker.hasStatusEffect("Multiple Attacks") && !attacker.hasStatusEffect("Mimbrane Bonus Attack"))
		{
			clearOutput();
			if (attacker.hasPerk("Riposte")) attacker.createStatusEffect("Riposting", 0, 0, 0, 0, true, "", "", true, 0);
			
			//Bloodthirsty restores energy on hits. Only works on one hit if multiple attacks.
			if(pc.hasPerk("Bloodthirsty")) pc.energy(2+rand(3));
		}
	}
	//Run with multiple attacks!
	if (attacker.hasPerk("Multiple Attacks")) {
		//Start up
		if (!attacker.hasStatusEffect("Multiple Attacks")) 
		{
			attacker.createStatusEffect("Multiple Attacks",attacker.perkv1("Multiple Attacks"),0,0,0,true,"","",true,0);		
		}
		//Remove if last attack, otherwise decrement.
		else 
		{
			if(attacker.statusEffectv1("Multiple Attacks") <= 0) attacker.removeStatusEffect("Multiple Attacks");
			attacker.addStatusValue("Multiple Attacks",1,-1);
		}
	}
	//Attack prevented by disarm
	if(attacker.hasStatusEffect("Disarmed")) {
		if(attacker == pc) output("You try to attack until you remember you got disarmed!");
		else output(attacker.capitalA + attacker.short + " scrabbles about, trying to find " + attacker.mfn("his","her","its") + " missing weapon.");
	}
	//Attack missed!
	else if(combatMiss(attacker,target)) {
		if(target.customDodge == "") {
			if(attacker == pc) output("You " + pc.meleeWeapon.attackVerb + " at " + target.a + target.short + " with your " + pc.meleeWeapon.longName + ", but just can't connect.");
			else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.meleeWeapon.attackVerb + ".");
		}
		else output(target.customDodge);
	}
	//Extra miss for blind
	else if(attacker.hasStatusEffect("Blind") && rand(2) > 0) {
		if(attacker == pc) output("Your blind strike fails to connect.");
		else output(attacker.capitalA + possessive(attacker.short) + " blind " + attacker.meleeWeapon.attackVerb + " goes wide!");
	}
	//Additional Miss chances for if target isn't stunned and this is a special flurry attack (special == 1)
	else if(special == 1 && rand(100) <= 45 && !target.isImmobilized()) {
		if(target.customDodge == "") {
			if(attacker == pc) output("You " + pc.meleeWeapon.attackVerb + " at " + target.a + target.short + " with your " + pc.meleeWeapon.longName + ", but just can't connect.");
			else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.meleeWeapon.attackVerb + ".");
		}
		else output(target.customDodge);
	}
	//Celise autoblocks
	else if(target.short == "Celise") {
		output(target.customBlock);
	}
	// Bonus evades from mimbrane feeties
	else if (mimbraneFeetBonusEvade(target))
	{
		output("\nYou’re taken by surprise as your [pc.foot] suddenly acts on its own, right as you’re about be attacked. The action is intense enough to slide you right out of the face of danger. Seems your Mimbrane is even more attentive than you are!\n");
	}
	//Attack connected!
	else {
		if(attacker == pc) output("You land a hit on " + target.a + target.short + " with your " + pc.meleeWeapon.longName + "!");
		else if(!attacker.plural) output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his","her","its") + " " + attacker.meleeWeapon.longName + "!");
		else output(attacker.capitalA + attacker.short + " connect with their " + attacker.meleeWeapon.longName + "!");
		//Damage bonuses:
		var damage:int = attacker.meleeWeapon.damage + attacker.physique()/2;
		//Bonus damage for "sneak attack perk!"
		if((target.hasStatusEffect("Stunned") || target.hasStatusEffect("Blind")) && attacker.hasPerk("Sneak Attack")) {
			output("\n<b>Sneak attack!</b>");
			damage += attacker.level * 2;
			if(target.hasStatusEffect("Stunned") && target.hasStatusEffect("Blind")) damage += attacker.level;
		}
		//Randomize +/- 15%
		var randomizer = (rand(31)+ 85)/100;
		damage *= randomizer;
		var sDamage:Array = new Array();
		//Apply damage reductions
		if(target.shieldsRaw > 0) {
			sDamage = shieldDamage(target,damage,attacker.meleeWeapon.damageType);
			//Set damage to leftoverDamage from shieldDamage
			damage = sDamage[1];
			if(attacker == pc) {
				if(target.shieldsRaw > 0) output(" The shield around " + target.a + target.short + " crackles under your assault, but it somehow holds. (<b>" + sDamage[0] + "</b>)");
				else output(" There is a concussive boom and tingling aftershock of energy as you disperse " + target.a + possessive(target.short) + " defenses. (<b>" + sDamage[0] + "</b>)");
			}
			else {
				if(target.shieldsRaw > 0) output(" Your shield crackles but holds. (<b>" + sDamage[0] + "</b>)");
				else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + sDamage[0] + "</b>)");
			}
		}
		if(damage >= 1) {
			damage = HPDamage(target,damage,attacker.meleeWeapon.damageType);
			if(attacker == pc) {
				if(sDamage[0] > 0) output(" Your " + attacker.meleeWeapon.longName + " has enough momentum to carry through and strike your target! (<b>" + damage + "</b>)");
				else output(" (<b>" + damage + "</b>)");			
			}
			else {
				if(sDamage[0] > 0) output(" The hit carries on through to damage you! (<b>" + damage + "</b>)");
				else output(" (<b>" + damage + "</b>)");	
			}
		}
	}
	//Do multiple attacks if more are queued (does not stack with special!)
	if(attacker.hasStatusEffect("Multiple Attacks") && special == 0) {
		output("\n");
		attack(attacker,target);
		return;
	}
	if(attacker == chars["PC"]) output("\n");
	if(!noProcess) {
		processCombat();
	}
}

//Special 1: Flurry attack - high miss chance.
//Special 2: Flurry attack with no new screen display.
function rangedAttack(attacker:Creature, target:Creature, noProcess:Boolean = false, special:int = 0):void 
{
	trace("Ranged shot...");
	//Set drone target
	if(attacker == pc && pc.hasPerk("Attack Drone"))
	{
		//Figure out where in the foes array the target is and set drone target to the index.
		//Clunky as all fuck but it works.
		for(var i:int = 0; i < foes.length; i++) {
			if(foes[i] == target) flags["DRONE_TARGET"] = i;
		}
	}
	if(!attacker.hasStatusEffect("Multiple Shots") && attacker == pc && special != 2) clearOutput();
	trace("Has multiple shots? " + String(!attacker.hasStatusEffect("Multiple Shots")) + "Attacker = PC? " + String(attacker == pc) + " special? " + special);
	//Run with multiple attacks!
	if (((attacker.hasPerk("Multiple Shots")) || (attacker.hasPerk("Shoot First") && attacker.statusEffectv1("Round") <= 1)) && special != 1 && special != 2) {
		//Start up
		if (!attacker.hasStatusEffect("Multiple Shots")) 
		{
			attacker.createStatusEffect("Multiple Shots",attacker.perkv1("Multiple Shots"),0,0,0,true,"","",true,0);		
		}
		//Remove if last attack, otherwise decrement.
		else 
		{
			if(attacker.statusEffectv1("Multiple Shots") <= 0) attacker.removeStatusEffect("Multiple Shots");
			attacker.addStatusValue("Multiple Shots",1,-1);
		}
	}
	//Attack prevented by disarm
	if(attacker.hasStatusEffect("Disarmed")) {
		if(attacker == pc) output("You try to attack until you remember you got disarmed!");
		else output(attacker.capitalA + attacker.short + " scrabbles about, trying to find " + attacker.mfn("his","her","its") + " missing weapon.");
	}
	//Attack prevented by gunlock
	else if(attacker.hasStatusEffect("Gunlock")) {
		if(attacker == pc) output("Your " + attacker.rangedWeapon.longName + " is currently disabled and unable to be used.");
		else output(attacker.capitalA + attacker.short + " fiddles fruitlessly with " + attacker.mfn("his","her","its") + " disabled weapon.");
	}
	//Attack missed!
	//Blind prevents normal dodginess & makes your attacks miss 90% of the time.
	else if(rangedCombatMiss(attacker,target)) {
		if(target.customDodge == "") {
			if (attacker == pc) output("You " + pc.rangedWeapon.attackVerb + " at " + target.a + target.short + " with your " + pc.rangedWeapon.longName + ", but just can't connect.");
			else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackVerb + ".");
		}
		else output(target.customDodge)
	}
	//Extra miss for blind
	else if(attacker.hasStatusEffect("Blind") && rand(10) > 0) {
		if(attacker == pc) output("None of your blind-fired shots manage to connect.");
		else output(attacker.capitalA + possessive(attacker.short) + " blinded shots fail to connect!");
	}
	//Additional Miss chances for if target isn't stunned and this is a special flurry attack (special == 1)
	else if(special == 1 || special == 2 && rand(100) <= 45 && !target.isImmobilized()) {
		if(target.customDodge == "") {
			if(attacker == pc) output("You " + pc.rangedWeapon.attackVerb + " at " + target.a + target.short + " with your " + pc.rangedWeapon.longName + ", but just can't connect.");
			else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackVerb + ".");
		}
		else output(target.customDodge);
	}
	//Celise autoblocks
	else if(target.short == "Celise") {
		output("Celise takes the hit, wound instantly closing in with fresh, green goop. Her surface remains perfectly smooth and unmarred after.");
	}
	//Attack connected!
	else {
		if(attacker == pc) output("You land a hit on " + target.a + target.short + " with your " + pc.rangedWeapon.longName + "!");
		else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his", "her", "its") + " " + attacker.rangedWeapon.longName + "!");
		
		if (!(attacker.rangedWeapon is Goovolver))
		{
			//Damage bonuses:
			var damage:int = attacker.rangedWeapon.damage + attacker.aim()/2;
			//Bonus damage for "sneak attack perk!"
			if((target.hasStatusEffect("Stunned") || target.hasStatusEffect("Blind")) && attacker.hasPerk("Aimed Shot")) {
				output("\n<b>Aimed shot!</b>");
				damage += attacker.level * 2;
				if(target.hasStatusEffect("Stunned") && target.hasStatusEffect("Blind")) damage += attacker.level;
			}
			//Randomize +/- 15%
			var randomizer = (rand(31)+ 85)/100;
			damage *= randomizer;
			var sDamage:Array = new Array();
			//Apply damage reductions
			if(target.shieldsRaw > 0) {
				sDamage = shieldDamage(target,damage,attacker.meleeWeapon.damageType);
				//Set damage to leftoverDamage from shieldDamage
				damage = sDamage[1];
				if(attacker == pc) {
					if(target.shieldsRaw > 0) output(" The shield around " + target.a + target.short + " crackles under your assault, but it somehow holds. (<b>" + sDamage[0] + "</b>)");
					else output(" There is a concussive boom and tingling aftershock of energy as you disperse " + target.a + possessive(target.short) + " defenses. (<b>" + sDamage[0] + "</b>)");
				}
				else {
					if(target.shieldsRaw > 0) output(" Your shield cracles but holds. (<b>" + sDamage[0] + "</b>)");
					else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + sDamage[0] + "</b>)");
				}
			}
			if(damage >= 1) {
				damage = HPDamage(target,damage,attacker.rangedWeapon.damageType,"ranged");
				if(attacker == pc) {
					if(sDamage[0] > 0) output(" Your " + attacker.rangedWeapon.longName + " has enough momentum to carry through and strike your target! (<b>" + damage + "</b>)");
					else output(" (<b>" + damage + "</b>)");			
				}
				else {
					if(sDamage[0] > 0) output(" The hit carries on through to damage you! (<b>" + damage + "</b>)");
					else output(" (<b>" + damage + "</b>)");	
				}
			}
		}
		// Goovolver attack!
		else
		{
			var lustDamage:int = 0;
			var randomiser:Number = (rand(31) + 85) / 100;

			if (target.lustVuln == 0)
			{
				output("\n<b>" + target.capitalA + target.short + " ");
				if (target.plural) output("don’t");
				else output("doesn’t");
				output(" seem the least bit bothered by the miniature goo crawling over them. (0)</b>\n");
			}
			else
			{
				lustDamage += 15;
				lustDamage *= randomiser;
				lustDamage *= target.lustVuln;

				if (target.lust() + lustDamage > target.lustMax()) lustDamage = target.lustMax() - target.lust();
				damage = Math.ceil(lustDamage);

				output(" A tiny " + (attacker.rangedWeapon as Goovolver).randGooColour() + " goo, vaguely female in shape, pops out and starts to crawl over " + target.mf("him", "her") + ", teasing " + target.mf("his", "her") + " most sensitive parts!");
				output(" (" + lustDamage +")");
				target.lust(lustDamage);
			}
		}
		
	}
	//Do multiple attacks if more are queued.
	if(attacker.hasStatusEffect("Multiple Shots") && special == 0) {
		output("\n");
		rangedAttack(attacker,target);
		return;
	}
	if(attacker == chars["PC"]) output("\n");
	if(!noProcess) processCombat();
}

function droneAttack(target:Creature):void {
	output("Your drone repeatedly zaps " + target.a + target.short + ".");
	genericDamageApply(1+pc.level + rand(2 + pc.level/2),pc,target,GLOBAL.ELECTRIC);
	processCombat();
}

public function genericDamageApply(damage:int,attacker:Creature, target:Creature,damTypeOverride:int = -1):void {
	//Randomize +/- 15%
	var randomizer = (rand(31)+ 85)/100;
	damage *= randomizer;
	var sDamage:Array = new Array();
	//Apply damage reductions
	if (target.shieldsRaw > 0) 
	{
		//use melee weapon 
		if(damTypeOverride == -1) sDamage = shieldDamage(target,damage,attacker.meleeWeapon.damageType);
		else sDamage = shieldDamage(target,damage,damTypeOverride);
		//Set damage to leftoverDamage from shieldDamage
		damage = sDamage[1];
		if (target.shieldsRaw > 0)
		{
			if(target == pc) output(" Your shield crackles but holds. (<b>" + sDamage[0] + "</b>)");
			else 
			{
				if(target.plural) output(" " + target.a + possessive(target.short) + " shields crackle but hold. (<b>" + sDamage[0] + "</b>)");
				else output(" " + target.a + possessive(target.short) + " shield crackles but holds. (<b>" + sDamage[0] + "</b>)");
			}
		}
		else 
		{
			if(target == pc) output(" There is a concussive boom and tingling aftershock of energy as your shield is breached. (<b>" + sDamage[0] + "</b>)");
			else 
			{
				if(!target.plural) output(" There is a concussive boom and tingling aftershock of energy as " + target.a + possessive(target.short) + " shield is breached. (<b>" + sDamage[0] + "</b>)");
				else output(" There is a concussive boom and tingling aftershock of energy as " + target.a + possessive(target.short) + " shields are breached. (<b>" + sDamage[0] + "</b>)");
			}
		}
	}
	if(damage >= 1) 
	{
		if(damTypeOverride == -1) damage = HPDamage(target,damage,attacker.meleeWeapon.damageType);
		else damage = HPDamage(target,damage,damTypeOverride);
		if (sDamage[0] > 0) 
		{
			if(target == pc) output(" The attack continues on to connect with you! (<b>" + damage + "</b>)");
			else output(" The attack continues on to connect with " + foes[0].a + foes[0].short + "! (<b>" + damage + "</b>)");
		}
		else 
			output(" (<b>" + damage + "</b>)");
	}
}


function HPDamage(victim:Creature,damage:Number = 0, damageType = GLOBAL.KINETIC,special:String = ""):Number 
{
	var temp:Number = 0;
	//Reduce damage by defense value
	temp = victim.defense();
	if(special == "ranged" && pc.hasPerk("Armor Piercing"))
	{
		if(temp > 0) temp -= (pc.level+rand(3));
		if(temp < 0) temp = 0;
	}
	damage -= temp;
	
	//Apply type reductions!
	damage *= victim.getResistance(damageType);
	//None yet!
	
	damage = Math.round(damage);
	
	//Damage cannot exceed HP amount.
	if(damage > victim.HP()) {
		damage = victim.HP();
	}
	//If we're this far, damage can't be less than one. You did get hit, after all.
	if(damage < 1) damage = 1;
	//Apply the damage
	victim.HP(-1 * damage);
	//Pass back how much was done.
	return damage;
}

function shieldDamage(victim:Creature,damage:Number = 0, damageType = GLOBAL.KINETIC, special:String = ""):Array 
{
	var initialDamage:Number = damage;
	var soakedDamage:Number = 0;
	var leftoverDamage:int = 0;
	var shieldDefense:Number = 0;
	//Reduce damage by shield defense value
	shieldDefense -= victim.shieldDefense();
	if(special == "ranged" && pc.hasPerk("Armor Piercing"))
	{
		if(shieldDefense > 0) shieldDefense -= (pc.level+rand(3));
		if(shieldDefense < 0) shieldDefense = 0;
	}
	damage -= shieldDefense;
	
	//Apply victim resistances vs damage
	damage *= victim.getShieldResistance(damageType);

	//Debug trace statements to help me doublecheck that all this is working right
	//trace("INITIAL DAMAGE: " + initialDamage);
	//trace("SHIELD DEFENSE VALUE: " + victim.shieldDefense());	
	//trace("SHIELD DAMAGE MULTIPLIER: " + victim.getShieldResistance(damageType));
	
	damage = Math.round(damage);
	
	//Damage cannot exceed shield amount.
	if(damage > victim.shieldsRaw) {
		damage = victim.shieldsRaw;
		soakedDamage = (damage - shieldDefense) / victim.getShieldResistance(damageType);
		leftoverDamage = initialDamage - soakedDamage;
		//If shit rounded up, that might put leftover damage in negs.
		//Prevent dat.
		if(leftoverDamage < 0) leftoverDamage = 0;
		
		//Second half of checking shield stuff.
		//trace("Damage soaked up by shields: " + soakedDamage);
		//trace("New leftover damage: " + leftoverDamage);
	}
	//If we're this far, damage can't be less than one. You did get hit, after all.
	if(damage < 1) damage = 1;
	//Apply the damage
	victim.shieldsRaw -= damage;
	//Pass back how much was done and how much is leftover.
	return [damage,leftoverDamage];
}

function teaseMenu(target:Creature):void 
{
	if(target is Celise) {
		clearOutput();
		output("You put a hand on your hips and lewdly expose your groin, wiggling to and fro in front of the captivated goo-girl.\n");
		processCombat();
	}
	else {
		clearOutput();
		output("Which tease will you use?");
		if(flags["TIMES_CHEST_TEASED"] == undefined) flags["TIMES_CHEST_TEASED"] = 0;	
		if(flags["TIMES_HIPS_TEASED"] == undefined) flags["TIMES_HIPS_TEASED"] = 0;	
		if(flags["TIMES_BUTT_TEASED"] == undefined) flags["TIMES_BUTT_TEASED"] = 0;	
		if(flags["TIMES_CROTCH_TEASED"] == undefined) flags["TIMES_CROTCH_TEASED"] = 0;
		var teases:Array = [flags["TIMES_BUTT_TEASED"],flags["TIMES_CHEST_TEASED"],flags["TIMES_CROTCH_TEASED"],flags["TIMES_HIPS_TEASED"]];
		for(var i:int = 0; i < teases.length; i++) 
		{ 
			if(teases[i] > 100) teases[i] = 100;
		}
		output("\nAss tease skill: " + teases[0] + "/100");
		output("\nChest tease skill: " + teases[1] + "/100");
		output("\nCrotch tease skill: " + teases[2] + "/100");
		output("\nHips tease skill: " + teases[3] + "/100");
		output("\n\nYour ability at a tease can increase both its success rate and total damage.")
		clearMenu();
		addButton(0,"Ass",teaseButt,target,"Ass Tease","Use your [pc.butt] to tease your enemy.");
		addButton(1,"Chest",teaseChest,target,"Chest Tease","Use your [pc.chest] to tease your enemy.");
		if(pc.hasCock() || pc.hasVagina()) addButton(2,"Crotch",teaseCrotch,target,"Crotch Tease","Use your [pc.crotch] to tease your enemy.");
		else addDisabledButton(2,"Crotch");
		addButton(3,"Hips",teaseHips,target,"Hips Tease","Use your [pc.hips] to tease your enemy.");
		addButton(14,"Back",combatMainMenu,undefined,"Back","Back out. Recommended if you haven't yet used \"Sense\" to determine your foe's likes and dislikes. Remember you can pull up your appearance screen in combat or use the scene buffer buttons in the lower left corner to compare yourself to your foe's preferences!");
	}
}
function teaseChest(target:Creature):void {
	tease(target, "chest");
}
function teaseHips(target:Creature):void {
	tease(target, "hips");
}
function teaseButt(target:Creature):void {
	tease(target, "butt");
}
function teaseCrotch(target:Creature):void {
	tease(target,"crotch");
}

//Name, long descript, lust descript, and '"
function displayMonsterStatus(targetFoe):void 
{
	if(targetFoe.HP() <= 0) {
		output("<b>You've knocked the resistance out of " + targetFoe.a + targetFoe.short + ".</b>\n");
	}
	else if(targetFoe.lust() >= 100) {
		output("<b>" + targetFoe.capitalA + targetFoe.short + " </b>");
		if(targetFoe.plural) output("<b>are </b>");
		else output("<b>is </b>");
		output("<b>too turned on to fight.</b>\n");
	}
	else if(pc.lust() >= pc.lustMax() || pc.HP() <= 0) {
		if(pc.HP() <= 0) {
			if(foes[0].plural || foes.length > 1) output("<b>Your enemies have knocked you off your " + pc.feet() + "!</b>\n");
			else output("<b>" + targetFoe.capitalA + targetFoe.short + " has knocked you off your " + pc.feet() + "!</b>\n");
		}
		else if(foes.length > 1 || foes[0].plural) output("<b>" + targetFoe.capitalA + targetFoe.short + " have turned you on too much to keep fighting. You give in....</b>\n");
		else output("<b>" + targetFoe.capitalA + targetFoe.short + " has turned you on too much to keep fighting. You give in....</b>\n");
	}
	else {
		if(pc.statusEffectv1("Blind") <= 1) {
			output("<b>You're fighting " + targetFoe.a + targetFoe.short  + ".</b>\n" + targetFoe.long + "\n");
			if(targetFoe is Naleen) author("Savin");
			if(targetFoe is ZilFemale) author("Savin");
			showMonsterArousalFlavor(targetFoe);
			mutinousMimbranesCombat();
			neglectedMimbranesCombat();
		}
		else {
			output("<b>You're too blind to see your foe!</b>\n");
		}
	}
	//Celise intro specials.
	if(targetFoe is Celise) {
		//Round specific dad addons!
		if(pc.statusEffectv1("Round") == 1) output("\nVictor instructs, <i>“<b>Try and strike her, " + pc.short + ". Use a melee attack.</b>”</i>\n");
		else if(pc.statusEffectv1("Round") == 2) output("\n<i>“Some foes are more vulnerable to ranged attacks than melee attacks or vice versa. <b>Why don’t you try using your gun?</b> Don’t worry, it won’t kill her.”</i> Victor suggests.\n");
		else if(pc.statusEffectv1("Round") == 3) output("\n<i>“Didn’t work, did it? Celise’s race does pretty well against kinetic damage. Thermal weapons would work, but you don’t have any of those. You’ve still got one more weapon that galotians can’t handle - sexual allure. They’re something of a sexual predator, but their libidos are so high that teasing them back often turns them on to the point where they masturbate into a puddle of quivering sex.”</i>  Victor chuckles. <i>“<b>Go ahead, try teasing her.</b> Fighting aliens is about using the right types of attacks in the right situations.”</i>\n");
	}
}

function showMonsterArousalFlavor(targetFoe):void 
{
	if(targetFoe.lust() < 50) { 
		return; 
	}
	else if(targetFoe.plural) {
		if(targetFoe.lust() < 60) output(targetFoe.capitalA + possessive(targetFoe.short) + " skins remain flushed with the beginnings of arousal.");
		else if(targetFoe.lust() < 70) output(targetFoe.capitalA + possessive(targetFoe.short) + " eyes constantly dart over your most sexual parts, betraying their lust.");
		else if(targetFoe.lust() < 85) {
			if(targetFoe.hasCock()) output(targetFoe.capitalA + targetFoe.short + " are having trouble moving due to the rigid protrusions in their groins.");
			if(targetFoe.hasVagina()) output(targetFoe.capitalA + targetFoe.short + " are obviously turned on; you can smell their arousal in the air.");
		}
		else {
			if(targetFoe.hasCock()) output(targetFoe.capitalA + targetFoe.short + " are panting and softly whining, each movement seeming to make their bulges more pronounced.  You don't think they can hold out much longer.");
			if(targetFoe.hasVagina()) output(targetFoe.capitalA + possessive(targetFoe.short) + " " + plural(targetFoe.vaginaDescript()) + " are practically soaked with their lustful secretions.");
		}
	}
	else {
		if(targetFoe.lust() < 60) output(targetFoe.capitalA + possessive(targetFoe.short) + " " + targetFoe.skin() + " remains flushed with the beginnings of arousal.");
		else if(targetFoe.lust() < 70) output(targetFoe.capitalA + possessive(targetFoe.short) + " eyes constantly dart over your most sexual parts, betraying " + targetFoe.mfn("his","her","its") + " lust.");
		else if(targetFoe.lust() < 85) {
			if(targetFoe.hasCock()) output(targetFoe.capitalA + targetFoe.short + " is having trouble moving due to the rigid protrusion in " + targetFoe.mfn("his","her","its") + " groin.");
			if(targetFoe.hasVagina()) output(targetFoe.capitalA + targetFoe.short + " is obviously turned on, you can smell " + targetFoe.mfn("his","her","its") + " arousal in the air.");
		}
		else {
			if(targetFoe.hasCock()) output(targetFoe.capitalA + targetFoe.short + " is panting and softly whining, each movement seeming to make " + targetFoe.mfn("his","her","its") + " bulge more pronounced.  You don't think " + targetFoe.mfn("he","she","it") + " can hold out much longer.");
			if(targetFoe.hasVagina()) output(targetFoe.capitalA + possessive(targetFoe.short) + " " + targetFoe.vaginaDescript() + " is practically soaked with " + targetFoe.mfn("his","her","its") + " lustful secretions.  ");
		}
	}
	output("\n");
}

function enemyAI(aggressor:Creature):void 
{	
	trace("AI CALL");
	//Paralyze stops turns! AHHHH!
	if(aggressor.hasStatusEffect("Paralyzed")) {
		if(aggressor.plural) output("<b>" + aggressor.capitalA + aggressor.short + " are still paralyzed.</b>");
		else output("<b>" + aggressor.capitalA + aggressor.short + " is still paralyzed.</b>");
		aggressor.addStatusValue("Paralyzed",1,-1);
		if(aggressor.statusEffectv1("Paralyzed") <= 0) {
			if(aggressor.plural) output(" They shake it off!");
			else output(" " + aggressor.mfn("He","She","It") + " shakes it off!");
			aggressor.removeStatusEffect("Paralyzed");
		}
		processCombat();
		return;
	}
	//Foe specific AIs
	switch(aggressor.short) {
		case "Celise":
			celiseAI();
			break;
		case "two zil":
			zilpackAI();
			break;
		case "zil male":
			zilMaleAI();
			break;
		case "female zil":
			zilGirlAI();
			break;
		case "cunt snake":
			cuntSnakeAI();
			break;
		case "naleen":
			naleenAI();
			break;
		case "naleen male":
			naleenMaleAI();
			break;
		case "machina":
			machinaAI();
			break;
		case "Dane":
			daneAI();
			break;
		case "mimbrane":
			mimbraneAI();
			break;
		case "female raskvel":
			raskvelChickAI();
			break;
		case "sex bot":
			sexbotAI();
			break;
		case "gray goo":
			grayGooAI();
			break;
		case "female lapinara":
			lapinaraAI();
			break;
		case "sydian male":
			sydianMaleAI();
			break;
		case "firewall":
			firewallAI();
			break;
		case "pirate gang":
			phoenixPiratesAI();
			break;
		default:
			enemyAttack(aggressor);
			break;
	}
}

function victoryRouting():void 
{
	hideNPCStats();
	if(foes[0].short == "Celise") {
		defeatCelise();
	}
	else if(foes[0].short == "two zil") {
		defeatZilPair();
	}
	else if(foes[0].short == "female zil") {
		defeatHostileZil();
	}
	else if(foes[0].short == "zil male") {
		winVsZil();
	}
	else if(foes[0].short == "cunt snake") {
		defeatACuntSnake();
	}
	else if(foes[0].short == "naleen") {
		beatDatCatNaga();
	}
	else if(foes[0].short == "naleen male")
	{
		defeatAMaleNaleen();
	}
	else if(foes[0].short == "machina")
	{
		pushButtanOnMagicTedsFireRobot();
	}
	else if(foes[0].short == "Dane")
	{
		defeatDane();
	}
	else if (foes[0] is Mimbrane)
	{
		defeatMimbrane();
	}
	else if(foes[0] is RaskvelFemale)
	{
		victoryVsRaskvel();
	}
	else if(foes[0] is SexBot)
	{
		defeatTheSexBot();
	}
	else if(foes[0] is GrayGoo)
	{
		pcDefeatsGrayGooInTheNameOfLove();
	}
	else if(foes[0] is LapinaraFemale)
	{
		defeatDatLapinara();
	}
	else if(foes[0] is SydianMale)
	{
		beatUpARustMonster();
	}
	else if(foes[0] is HandSoBot)
	{
		pcWinsVsHanSoSosTool();
	}
	else if (foes[0] is PhoenixPirates)
	{
		victoryOverPhoenixPirates();
	}
	else genericVictory();
}

function defeatRouting():void 
{
	hideNPCStats();
	if(foes[0].short == "BONERS") {}
	else if(foes[0].short == "two zil") {
		loseToZilPair();
	}
	else if(foes[0].short == "zil male") {
		zilLossRouter();
	}
	else if(foes[0].short == "female zil") {
		girlZilLossRouter();
	}
	else if(foes[0].short == "cunt snake") {
		loseToCuntSnake();
	}
	else if(foes[0].short == "naleen") {
		pcLosesToNaleenLiekABitch();
	}
	else if(foes[0].short == "naleen male")
	{
		loseToDudeleenRouter();
	}
	else if(foes[0].short == "machina")
	{
		ohShitLoseToRobot();
	}
	else if(foes[0].short == "Dane")
	{
		loseToDane();
	}
	else if (foes[0] is Mimbrane)
	{
		beatUpByAFuckinDishcloth();
	}
	else if(foes[0] is RaskvelFemale)
	{
		defeatRoutingForFemRasks();
	}
	else if(foes[0] is SexBot)
	{
		loseToSexBotRouter();
	}
	else if(foes[0] is GrayGoo)
	{
		loseToGrayGooRouter();
	}
	else if(foes[0] is LapinaraFemale)
	{
		loseToFemaleLapinara();
	}
	else if(foes[0] is SydianMale)
	{
		loseToSydianMaleRouter();
	}
	else if(foes[0] is HandSoBot)
	{
		pcLosesToHanSoSosBot();
	}
	else if (foes[0] is PhoenixPirates)
	{
		loseToPhoenixPirates();
	}
	else {
		output("You lost!  You rouse yourself after an hour and a half, quite bloodied.");
		processTime(90);
		genericLoss();
	}
}

function genericLoss():void {
	pc.removeStatusEffect("Round");
	trace("GENERIC LOSS");
	pc.clearCombatStatuses();
	trace("LOSS DONE");
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

function genericVictory():void 
{
	pc.clearCombatStatuses();
	getCombatPrizes();
}

function stealthCombatEnd():void
{
	// Mimbranes could hook here to convert from the Combat version of their Venom attack to their Non-combat version?
	// I think this is overall too complicated though, and just ignore the whole combat/noncombat distinction.
	pc.removeStatusEffect("Round");
	pc.clearCombatStatuses();
}

function combatOver():void 
{
	pc.removeStatusEffect("Round");
	pc.clearCombatStatuses();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}


function getCombatPrizes(newScreen:Boolean = false):void 
{
	if(newScreen) clearOutput();
	
	// Renamed from lootList so I can distinguish old vs new uses
	var foundLootItems:Array = new Array();

	//Add credits and XP
	var XPBuffer:int = 0;
	var creditBuffer:int = 0;
	for(var x:int = 0; x < foes.length; x++) {
		XPBuffer = foes[x].XP();
		creditBuffer += foes[x].credits;
	}
	//If new XP + old is more than max, change XP to be the difference.
	if(XPBuffer + pc.XP() > pc.XPMax()) XPBuffer = pc.XPMax() - pc.XP();
	pc.XP(XPBuffer);
	pc.credits += creditBuffer;
	
	//Queue up items for looting
	for(x = 0; x < foes.length; x++) 
	{
		for(var y:int = 0; y < foes[x].inventory.length; y++) 
		{
			
			if(foes[x].inventory[y].quantity != 0) {
				foundLootItems[foundLootItems.length] = foes[x].inventory[y]; // NOTE: Might have to come back through here and use copies; depends how shit plays out with combat + persistent characters.
				if(foes[x].inventory[y].useFunction != undefined) {
					trace("NOT UNDEFINED! X: " + x + " Y: " + y);
					if(foundLootItems[foundLootItems.length-1].useFunction == undefined) trace("SAME LOOT LIST: UNDEFINED");
					else trace("SAME LOOT LIST: CONDITION GREEN");
				}
				else trace("UNDEFINED FUNC: " + foes[x].inventory[y].longName);
			}
		}
	}
	
	//Exit combat as far as the game is concerned.
	pc.removeStatusEffect("Round");
	//Talk about who died and what you got.
	output("You defeated ");
	clearList();
	for(x = 0; x < foes.length; x++) {
		addToList(foes[x].a + foes[x].short);
	}
	output(formatList() + "!");
	if(XPBuffer > 0) output(" " + XPBuffer + " XP gained.");
	else {
		output("\n<b>Maximum XP attained! You need to level up to continue to progress.</b>");
		if(pc.level == 1) output("\n<b>Find a bed to sleep on in order to level up (like on your ship).</b>");
	}
	
	//Monies!
	if(creditBuffer > 0) {
		if(foes.length > 1 || foes[0].plural) output("\nThey had ");
		else output(foes[0].mfn("\nHe"," She", " It") + " had ");
		output(num2Text(creditBuffer) + " credit");
		if(creditBuffer > 1) output("s");
		output(" loaded on an anonymous credit chit that you appropriate.");
	}
	this.clearMenu();
	//Fill wallet and GTFO
	if(foundLootItems.length > 0) {
		output("\nYou also find ");
		clearList();
		for(x = 0; x < foundLootItems.length; x++) {
			addToList(foundLootItems[x].description + " (x" + foundLootItems[x].quantity + ")\n\n");
		}
		output(formatList());
		itemScreen = mainGameMenu;
		lootScreen = mainGameMenu;
		useItemFunction = mainGameMenu;
		//Start loot
		itemCollect(foundLootItems);
	}
	//Just leave if no items.
	else {
		this.addButton(0,"Next",mainGameMenu);
	}
}

function startCombatLight():void
{
	flags["DRONE_TARGET"] = undefined;
	combatStage = 0;
	hideMinimap();
	pc.removeStatusEffect("Round");
	combatMainMenu();
	userInterface.resetNPCStats();
	showNPCStats();
	updateNPCStats();
	if(foes[0] is LapinaraFemale) lapinaraBust();
	else if(foes[0] is SexBot) sexBotDisplay();
}

function startCombat(encounter:String):void 
{
	//Reset drone target before a fight!
	flags["DRONE_TARGET"] = undefined;
	combatStage = 0;
	hideMinimap();
	pc.removeStatusEffect("Round");
	foes = new Array();
	
	// Refucktored somewhat, it's a little clearer than it was earlier. Any special stuff that has to
	// happen prior to combat has been shifted into a method inside the specific creature classes.
	
	// This is kind of a midpoint along the road to properly supporting multi-enemy fights, and combat
	// with persistent or semi-persistent characters. It's also cleaned up a lot of code sitting in
	// global namespace where it doesn't really belong.
	
	switch(encounter) 
	{
		case "celise":
			chars["CELISE"].prepForCombat();
			break;
		case "zilpack":
			chars["ZILPACK"].prepForCombat();
			break;
		case "zil male":
			chars["ZIL"].prepForCombat();
			break;
		case "consensual femzil":
		case "female zil":
			chars["ZILFEMALE"].prepForCombat();			
			if (encounter == "consensual femzil") foes[0].setDefaultSexualPreferences(); // This call has to happen after prep, otherwise we'll wipe it out with random prefs.
			break;
		case "cunt snake":
			chars["CUNTSNAKE"].prepForCombat();
			break;
		case "naleen male":
			chars["NALEEN_MALE"].prepForCombat();
			break;
		case "naleen":
			chars["NALEEN"].prepForCombat();
			break;
		case "machina":
			chars["MACHINA"].prepForCombat();
			break;
		case "Dane":
			chars["DANE"].prepForCombat();
			break;
		case "mimbrane":
			chars["MIMBRANE"].prepForCombat();
			break;
		case "RaskvelFemale":
			chars["RASKVEL_FEMALE"].prepForCombat();
			break;
		case "SexBot":
			chars["SEXBOT"].prepForCombat();
			break;
		case "Gray Goo":
			chars["GRAYGOO"].prepForCombat();
			break;
		case "Lapinara Parasitic":
			chars["LAPINARAFEMALE"].prepForCombat();
			break;
		case "Sydian Male":
			chars["SYDIANMALE"].prepForCombat();
			break;
		case "firewall":
			chars["FIREWALL"].prepForCombat();
			break;
		case "phoenixpirates":
			chars["PHOENIXPIRATES"].prepForCombat();
			break;
		default:
			throw new Error("Tried to configure combat encounter for '" + encounter + "' but couldn't find an appropriate setup method!");
			break;
	}
	combatMainMenu();
	userInterface.resetNPCStats();
	showNPCStats();
	updateNPCStats();
}

function runAway():void {
	clearOutput();
	output("You attempt to flee from your opponent");
	if(foes[0].plural || foes.length > 1) output("s");
	output("! ")
	//Autofail conditions first!
	if(pc.isImmobilized()) {
		output("You cannot run while you are immobilized!\n");
		processCombat();
	}
	else if(pc.hasStatusEffect("Flee Disabled")) {
		output("You cannot escape from this fight!\n");
		processCombat();
	}
	else if(debug) {
		output("You escape on wings of debug!\n");
		pc.removeStatusEffect("Round");
		pc.clearCombatStatuses();
		this.userInterface.hideNPCStats();
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
	else {
		var x:int = 0;
		//determine difficulty class based on reflexes vs reflexes comparison, easy, low, medium, hard, or very hard
		var difficulty:int = 0;
		//easy = succeed 75%
		//low = succeed 50%
		//medium = succeed 35%
		//hard = succeed 20;
		//very hard = succeed 10%
		//Easy: PC has twice the reflexes
		if(pc.reflexes() >= foes[0].reflexes() * 2) difficulty = 0;
		//Low: PC has more than +33% more reflexes
		else if(pc.reflexes() >= foes[0].reflexes() * 1.333) difficulty = 1;
		//Medium: PC has more than -33% reflexes
		else if(pc.reflexes() >= foes[0].reflexes() * .6666) difficulty = 2;
		//Hard: PC pretty slow
		else if(pc.reflexes() >= foes[0].reflexes() * .3333) difficulty = 3;
		//Very hard: PC IS FUCKING SLOW
		else difficulty = 4;


		//Multiple NPCs? Raise difficulty class for each one!
		difficulty += foes.length - 1;
		if(difficulty > 5) difficulty = 5;
		//Raise difficulty for having awkwardly huge genitalia/boobs sometime! TODO!

		//Lower difficulty for flight if enemy cant!
		if(pc.canFly() && (!foes[0].canFly() || foes[0].isImmobilized())) difficulty--;
		//Lower difficulty for immobilized foe
		if(foes[0].isImmobilized()) difficulty--;

		//Set threshold value and check!
		if(difficulty < 0) difficulty = 100;
		else if(difficulty == 0) difficulty = 75;
		else if(difficulty == 1) difficulty = 50;
		else if(difficulty == 2) difficulty = 35;
		else if(difficulty == 3) difficulty = 20;
		else if(difficulty == 4) difficulty = 10;
		else difficulty = 5;
		trace("Successful escape chance: " + difficulty + " %")
		//Success!
		if(rand(100) + 1 <= difficulty) {
			if(pc.canFly()) output("Your feet leave the ground as you fly away, leaving the fight behind.")
			else output("You manage to leave the fight behind you.")
			processTime(8);
			pc.removeStatusEffect("Round");
			pc.clearCombatStatuses();
			this.userInterface.hideNPCStats(); // Putting it here is kinda weird, but seeing the enemy HP value drop to 0 also seems a bit weird too
			this.clearMenu();
			this.addButton(0,"Next",mainGameMenu);
		}
		else {
			output(" It doesn't work!\n");
			processCombat();
		}

	}
}
function fantasize():void {
	clearOutput();
	output("You decide you'd rather fantasize than fight back at this point. Why bother when your enem");
	if(foes[0].plural || foes.length > 1) output("ies are");
	else output("y is");
	output(" so alluring?\n");
	pc.lust(20+rand(20));
	processCombat();
}
function wait():void {
	clearOutput();
	output("You choose not to act.\n");
	processCombat();
}


//creature.sexualPreferences.getPref(SEXPREF_flag) will give you the direct set value; 2, 1, -1 or -2. Or 0 if the preference isn't set.
//creature.sexualPreferences.getAveragePrefScore(SEXPREF_flag1, SEXPREF_flag2, ..., SEXPREF_flagn) will give you the *average* score of the provided flags.
function tease(target:Creature, part:String = "chest"):void {
	var damage:Number = 0;
	var teaseCount:Number = 0;
	var randomizer = (rand(31)+ 85)/100;
	var likeAdjustments:Array = new Array();
	var totalFactor:Number = 1;
	var x:int = 0;
	if(part == "chest")
	{
		//Get tease count updated
		if(flags["TIMES_CHEST_TEASED"] == undefined) flags["TIMES_CHEST_TEASED"] = 0;
		teaseCount = flags["TIMES_CHEST_TEASED"];
		if(teaseCount > 100) teaseCount = 100;
		
		if(pc.biggestTitSize() >= 5 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BREASTS) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BREASTS);
		if(pc.biggestTitSize() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BREASTS) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BREASTS);
		if((pc.bRows() > 1 || pc.totalBreasts() / pc.bRows() > 2) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES);
		if(pc.biggestTitSize() >= 25 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER);
		if(pc.hasFuckableNipples() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NIPPLECUNTS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NIPPLECUNTS);
		
		clearOutput();
		chestTeaseText();
	}
	else if(part == "hips")
	{
		//Get tease count updated
		if(flags["TIMES_HIPS_TEASED"] == undefined) flags["TIMES_HIPS_TEASED"] = 0;
		teaseCount = flags["TIMES_HIPS_TEASED"];
		if(teaseCount > 100) teaseCount = 100;
		
		if(pc.hipRating() >= 10 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_WIDE_HIPS) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_WIDE_HIPS);
		if(pc.hipRating() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NARROW_HIPS) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NARROW_HIPS);
		if((pc.isTaur() || pc.isNaga()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE);

		clearOutput();
		hipsTeaseText();
	}
	else if(part == "butt")
	{
		//Get tease count updated
		if(flags["TIMES_BUTT_TEASED"] == undefined) flags["TIMES_BUTT_TEASED"] = 0;
		teaseCount = flags["TIMES_BUTT_TEASED"];
		if(teaseCount > 100) teaseCount = 100;
		
		if(pc.buttRating() >= 10 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BUTTS) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BUTTS);
		if(pc.buttRating() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BUTTS) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BUTTS);
		if(pc.ass.looseness() >= 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE);
		if(pc.tailCount > 0 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILS);
		if(pc.tailCount > 0 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILS);
		if((pc.isTaur() || pc.isNaga()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE);
		clearOutput();
		buttTeaseText();
	}
	else if(part == "crotch")
	{
		//Get tease count updated
		if(flags["TIMES_CROTCH_TEASED"] == undefined) flags["TIMES_CROTCH_TEASED"] = 0;
		teaseCount = flags["TIMES_CROTCH_TEASED"];
		if(teaseCount > 100) teaseCount = 100;
		
		if(pc.hasCock() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_COCKS) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_COCKS);
		if(pc.hasVagina() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_PUSSIES) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_PUSSIES);
		if(pc.balls > 0 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS);
		if(pc.hasCock() && pc.longestCockLength() >= 12 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_MALEBITS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_MALEBITS);
		if(pc.hasCock() && pc.shortestCockLength() < 7 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_MALEBITS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_MALEBITS);
		if((pc.cockTotal() > 1 || pc.vaginaTotal() > 1) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES);
		if((pc.hasCock() || pc.longestCockLength() >= 18) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER);
		if(pc.hasVagina() && pc.gapestVaginaLooseness() >= 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE);

		if(pc.hasVagina() && pc.wettestVaginalWetness() >= 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_WETNESS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_WETNESS);
		if(pc.hasVagina() && pc.driestVaginalWetness() >= 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS);
		clearOutput();
		crotchTeaseText(target);
	}
	//Figure out multiplier
	if(likeAdjustments.length >= 1) {
		for(x = 0; x < likeAdjustments.length; x++) {
			//Apply dat multiplier!
			totalFactor *= likeAdjustments[x];
		}
	}
	trace("TOTAL MULTIPLICATION FACTOR: " + totalFactor);
	//Multiplier gets 50% boost for quivering quasar
	if(pc.hasStatusEffect("Sex On a Meteor")) totalFactor *= 1.5;
	//Celise ignores ALL THIS SHIT!
	if(!(target is Celise)) 
	{
		//Does the enemy resist?
		if(target.willpower()/2 + rand(20) + 1 > pc.level * 2.5 * totalFactor + 10 + teaseCount/10 || target.lustVuln == 0)
		{
			if(target is HandSoBot)
			{
				output("\n\n“<i>An attempt to confuse and overwhelm an enemy with an overt display of sexual dominance,</i>” says So. She sounds genuinely interested. “<i>An unorthodox but effective strategy in many known organic cultures’ approach to war. I was unaware sentients of a human upbringing had any experience of such a thing, however. Perhaps that explains why you are attempting it against a foe that cannot in any way feel desire.</i>”\n");
			}
			else if(target.lustVuln == 0) 
			{
				output("\n<b>" + target.capitalA + target.short + " ");
				if(target.plural) output("don't");
				else output("doesn't");
				output(" seem to care to care for your eroticly-charged display. (0)</b>\n");
			}
			else {
				output("\n" + target.capitalA + target.short + " ");
				if(target.plural) output("resist");
				else output("resists");
				output(" your erotically charged display... this time. (0)\n");

				teaseSkillUp(part);
			}
		}
		//Success!
		else {
			//Calc base damage
			damage += 10 * (teaseCount/100 + 1);
			//Any perks or shit go below here.
			//Apply randomization
			damage *= randomizer;
			//Apply like adjustments
			damage *= totalFactor;
			damage *= target.lustVuln;
			if(target.lust() + damage > target.lustMax()) damage = target.lustMax() - target.lust();
			damage = Math.ceil(damage);
			if(damage <= 5) {

			}

			output("\n");
			output(teaseReactions(damage,target));
			target.lust(damage);
			output(" ("+ damage + ")\n");
			teaseSkillUp(part);
		}
	}
	else output("\n");
	
	playerMimbraneSpitAttack();
	processCombat();
}

function teaseSkillUp(part:String):void {
	if(part == "crotch") flags["TIMES_CROTCH_TEASED"]++;
	else if(part == "butt") flags["TIMES_BUTT_TEASED"]++;
	else if(part == "hips") flags["TIMES_HIPS_TEASED"]++;
	else if(part == "chest") flags["TIMES_CHEST_TEASED"]++;
}

function teaseReactions(damage:Number,target:Creature):String {
	var buffer:String = "";
	if (target.plural) {
		if (damage == 0) buffer = target.capitalA + target.short + " seem unimpressed.";
		else if (damage < 4) buffer = target.capitalA + target.short + " look intrigued by what they see.";
		else if (damage < 10) buffer = target.capitalA + target.short + " definitely seem to be enjoying the show.";
		else if (damage < 15) buffer = target.capitalA + target.short + " openly stroke themselves as they watch you.";
		else if (damage < 20) buffer = target.capitalA + target.short + " flush hotly with desire, their eyes filled with longing.";
		else buffer = target.capitalA + target.short + " lick their lips in anticipation, their hands idly stroking their bodies.";
	}
	else {
		if (damage == 0) buffer = target.capitalA + target.short + " seems unimpressed.";
		else if (damage < 4) buffer = target.capitalA + target.short + " looks a little intrigued by what " + target.mf("he","she") + " sees.";
		else if (damage < 10) buffer = target.capitalA + target.short + " definitely seems to be enjoying the show.";
		else if (damage < 15) buffer = target.capitalA + target.short + " openly touches " + target.mfn("him","her","it") + "self as " + target.mfn("he","she","it") + " watches you.";
		else if (damage < 20) buffer = target.capitalA + target.short + " flushes hotly with desire, " + target.mfn("his","her","its") + " eyes filled with longing.";
		else buffer = target.capitalA + target.short + " licks " + target.mfn("his","her","its") + " lips in anticipation, " + target.mfn("his","her","its") + " hands idly stroking " + target.mfn("his","her","its") + " own body.";
	}
	return buffer;
}

function crotchTeaseText(target:Creature):void {
	var choices:Array = new Array();
	if(pc.hasCock()) {
		if(pc.isTaur() && pc.horseCocks() > 0) choices[choices.length] = 4;
		else 
		{
			if(pc.armor.shortName == "" && pc.lowerUndergarment.shortName != "") choices[choices.length] = 2;
			choices[choices.length] = 1;
		}		
	}
	if(pc.hasVagina()) {
		if(pc.isTaur()) choices[choices.length] = 5;
		else choices[choices.length] = 3;
	}

	var select:int = choices[rand(choices.length)];
	//1 - dick!
	if(select == 1) {
		if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] just enough to let ");
		else output("You shift position while ");
		output("your [pc.cocks]");
		if(pc.balls > 0) output(" and [pc.balls]");
		output(" dangle");
		if(pc.cockTotal() + pc.balls == 1) output("s");
		output(" free. ");
		if(pc.lust() >= 66) output("A shiny rope of pre-cum dangles from your cock, showing that your reproductive system is every bit as ready to pleasure as the rest of you.");
		else output("Your motions are just enough to make your equipment sway back and forth before your target's eyes.")
	}
	//2 - covered dick!
	else if(select == 2) {
		output("You lean back and pump your hips at your target in an incredibly vulgar display. The bulging, barely-contained outline of your package presses hard into your [pc.lowerUndergarment]. This feels so crude, but at the same time, you know it'll likely be effective.");
		output(" You go on like that, humping the air for your target's benefit, trying to entice them with your nearly-exposed meat.");
	}	
	//3 - cunt!
	else if(select == 3) {
		if(pc.isCrotchGarbed()) output("You coyly open your [pc.lowerGarments]");
		else output("You coyloy gesture to your groin");
		if(pc.hasPerk("Ditz Speech")) output(" and giggle, <i>\"Is this, like, what you wanted to see?\"</i>  ");
		else {
			output(" and purr, <i>\"Does the thought of a hot, ");
			if(pc.hasCock() && pc.hasVagina()) output("futanari ");
			else output("sexy ");
			output("body turn you on?\"</i>  ");
		}
		if(target.plural) output(possessive(target.capitalA + target.short) + " gazes are riveted on your groin as you run your fingers up and down your folds seductively.");
		else output(possessive(target.capitalA + target.short)  + "'s gaze is riveted on your groin as you run your fingers up and down your folds seductively.");
		if(pc.clitLength > 3) output("  You smile as [pc.eachClit] swells out from the folds and stands proudly, begging to be touched.");
		else output("  You smile and pull apart your lower-lips to expose your [pc.clits], giving the perfect view.");
		if(pc.cockTotal() > 0) output("  Meanwhile, [pc.eachCock] bobs back and forth with your gyrating hips, adding to the display.");
	}
	//4 Horsecock centaur tease
	else if(select == 4) {
		output("You let out a bestial whinny and stomp your hooves at your enemy.  They prepare for an attack, but instead you kick your front hooves off the ground, revealing the hefty horsecock hanging beneath your belly.  You let it flop around, quickly getting rigid and to its full erect length.  You buck your hips as if you were fucking a mare in heat, letting your opponent know just what's in store for them if they surrender to pleasure...");
	}
	//5 Cunt grind tease
	else if(select == 5) {
		output("You gallop toward your unsuspecting enemy, dodging their defenses and knocking them to the ground.  Before they can recover, you slam your massive centaur ass down upon them, stopping just short of using crushing force to pin them underneath you.  In this position, your opponent's face is buried right in your girthy horsecunt.  You grind your cunt into your target's face for a moment before standing.  When you do, you're gratified to see your enemy covered in your lubricant and smelling powerfully of horsecunt.");
	}
}

function buttTeaseText():void {

	//75+
	if(flags["TIMES_BUTT_TEASED"] > 75 && rand(3) == 0)
	{
		output("Turning away at an opportune moment, you slip down your clothes and reach back, slapping your [pc.butt] into a bounce before shaking it for " + foes[0].a + foes[0].short + ". Your technique has grown impeccable, and you bounce your [pc.butt] masterfully, even reaching back and spreading your cheeks, giving " + foes[0].a + foes[0].short + " an excellent view of your [pc.asshole]");
		if(pc.hasVagina() && pc.balls > 0) output("and [pc.vaginas] and [pc.balls]");
		else if(pc.hasVagina()) output("and [pc.vaginas]");
		else if(pc.balls > 0) output("and[pc.balls]");
		output(".");
	}
	//50+
	else if(flags["TIMES_BUTT_TEASED"] > 75 && rand(3) == 0 && pc.armor.shortName != "")
	{
		output("Swirling away, you find yourself facing away from your enemy. A cunning smile slaps itself across your [pc.face] as you hook your fingers into your " + pc.armor.longName + " and pull down your bottoms to expose your ");
		if(pc.lowerUndergarment.shortName != "") output(pc.lowerUndergarment.longName + " and ");
		output("[pc.butt]. Spreading your [pc.legs], you begin to shake your [pc.butt], bouncing ");
		if(pc.lowerUndergarment.shortName != "") output("in your [pc.lowerUndergarment] ");
		output("and tempting " + foes[0].a + foes[0].short + " with your ");
		if(pc.lowerUndergarment.shortName != "") output("unseen ");
		output("goods. Your ass shaking has gotten faster and more tasteful with all of that practice, and you rock your [pc.butt] as best as you can to show that off.");
	}
	else if(pc.analCapacity() >= 450 && rand(3) == 0) output("You quickly strip out of your [pc.armor] and turn around, giving your [pc.butt] a hard slap and showing your enemy the real prize: your [pc.asshole].  With a smirk, you easily plunge your hand inside, burying yourself up to the wrist inside your anus.  You give yourself a quick fisting, watching the enemy over your shoulder while you moan lustily, sure to give them a good show.  You withdraw your hand and give your ass another sexy spank before readying for combat again.");
	else {
		output("You turn away");
		if(pc.isCrotchGarbed()) output(", slide down your clothing,");
		output(" and bounce your [pc.butt] up and down hypnotically");
		//Big butts = extra text + higher success
		if(pc.buttRating >= 10) {
			output(", making it jiggle delightfully.  Your target even gets a few glimpses of the [pc.asshole] between your cheeks.");
		}
		//Small butts = less damage, still high success
		else {
			output(", letting your target get a good look at your [pc.asshole]");
			if(pc.hasVagina()) output(" and a glimpse of your [pc.vaginas]");
			output(".");
		}
	}
}

function chestTeaseText():void {
	if(pc.biggestTitSize() < 1) {
		if(pc.isChestGarbed()) output("You peel open your [pc.upperGarments] to expose your [pc.chest] and [pc.nipples], running a hand up your [pc.skinFurScales] to one as you lock eyes with your target. You make sure that every bit of your musculature is open and on display before you bother to cover back up.");
		else output("Naked as you are, there's nothing you need to do to expose your [pc.chest] and [pc.nipples], and it running a hand up your [pc.skinFurScales] only enhances the delicious exposure. You make sure that every bit of your musculature is open and on display before you adopt a less sensual pose.")
	}
	//Titties!
	else {
		//User submitted milkiness! 75%!
		if(pc.milkFullness > 50 && pc.isChestGarbed() && rand(4) != 0)
		{
			//If Breasts Tease >=75 Lactating.
			if(pc.milkFullness >= 75)
			{
				output("Drawing your hands sensuously up your [pc.belly], you cup your milky tits, giving one a firm squeeze as you let out a low, lusty moan. With " + foes[0].a + foes[0].short + "’s gaze firmly captured, you pull away your [pc.upperGarments], releasing your [pc.fullChest] to the world, the fresh air blowing across your [pc.nipples]. You aren’t done teasing yet; a delicious idea slips into your devious mind.");
				output("\n\nGrabbing both of your exposed melons, you jiggle them, causing a hypnotizing earthquake of mammary delight while taking care to pinch your nipples. The stimulation is just enough to get you started. Your [pc.milk] flows out as you begin to rub it into your [pc.skinFurScales], the [pc.milkColor] liquid soaking into your [pc.chest]. It takes you a tremendous effort to stop yourself and cover your jugs up again. Licking your fingers clean with an <i>Mmmmm…</i> for show, you ready yourself, noting that you’ll have to clean up a little later.");
			}
			//If Breast tease <75 Lactating.
			else
			{
				output("Fumbling with your [pc.upperGarments] you release your [pc.chest], letting your bounty free with an enticing jiggle. You can feel " + foes[0].a + foes[0].short + "s eyes on you, running over your [pc.chest], and take advantage of that, swaying your shoulders to set off all kinds of pleasant jiggles. It’s not until you feel your [pc.milk] start to dribble out of your [pc.nipples] that you realize just what you’ve done. Reaching up, you grab the swells of your [pc.chest] to put them away, but you only succeed in coating yourself in your [pc.milk]. You can’t help but feel a little embarrassed and maybe a little aroused as you tuck your [pc.fullChest] away.");
			}
		}
		else 
		{
			//HYPER TIIIIITS
			if(pc.biggestTitSize() >= 15) {
				if(pc.isChestGarbed()) output("With a slow pivot and sultry look, you reach up to your [pc.upperGarments] and peel away the offending coverings with deliberate slowness. With each inch of breast-flesh you expose, your smile grows wider. You pause above your [pc.nipples] before letting them out with a flourish, digging your hands in to your soft, incredibly well-endowed chest in a display of mammary superiority. You cover up after a moment with a knowing smile.");
				else output("Your [pc.fullChest] is already completely uncovered, but that doesn't stop you from bringing your hands up to the more-than-ample cleavage and enhancing it by pressing down from each side. Your fingers sink deeply into your busty bosom as you look up at your chosen target, then, with a smile, you gentle shake them, making your titanic mammaries wobble oh-so-enticingly.")
				if(pc.biggestTitSize() >= 25) output(" There's just so much breastflesh there; it feels good to use it.");
			}
			//Big TiTS!
			else if(pc.biggestTitSize() >= 4) {
				if(pc.isChestGarbed()) output("You peel away your [pc.upperGarments] with careful, slow tugs to expose your [pc.fullChest]. Only after you've put yourself on display do you look back at your target and truly begin to tease, starting with a knowing wink. Then, you grab hold of your [pc.chest] and cup them to enhance your cleavage, lifting one than the other in slow, sensuous display. Covering them up is something you do a little a regretfully.");
				else output("You delicately trace a finger up your [pc.belly] to your exposed cleavage, slowing it nestles in place. Your motion causes your breasts to gently sway as you explore yourself, and you pause to look at your target. With one hand, you squeeze your left tit, crushing your other hand's finger in tit while you grope yourself. With your erotic display complete, you release yourself and stretch, glad to be uncovered.");
			}
			//Petite ones!
			else {
				if(pc.isChestGarbed()) output("You remove your [pc.upperGarments] with ease to free the perfectly rounded, perky breasts. You run your hands across the [pc.skinFurScales] to thumb at your nipples and grace your target with a lascivious look before putting the girls away a little regretfully.");
				else output("With your [pc.fullChest] on complete display, you arch your back to present yourself as pleasingly as possible. Your hands wind their way up to your [pc.nipples] and give them a little tweak, sliding down the supple curve of your underbust. You give your target a smile before you stop, but even now, your bared [pc.skinFurScales] will taunt " + foes[0].mfn("him","her","it") + ".");
			}
		}
	}
}

function hipsTeaseText():void {
	//Small hips!
	if(pc.hipRating() < 4) {
		output("Putting a hand on your [pc.hips], you stretch, sliding your palms up and down them for emphasis, really showing off how narrow they are.");
	}
	//Big hips!
	else if(pc.hipRating() >= 10) {
		output("With a sinuous undulation, you rock your [pc.hips] out to the right side, then the left. You gracefully strut around, swaying to a rhythm only you can hear and doing your best to keep curviness on full display throughout.");
	}
	//Generic hips!
	else {
		output("Watching your target, you place a hand upon your [pc.hips] and sway them in the other direction then back again like a pendulum. You let the hypnotic undulations go on as you dare and smile triumphantly as you stop.");
	}
}

function sense(target:Creature):void {
	clearOutput();
	output("You try to get a feel for " + possessive(target.a + target.short) + " likes and dislikes!\n");
	if(target.lustVuln == 0) output("You don't think sexuality can win this fight!\n");
	var buffer:String = "";
	var PCBonus:Number = pc.intelligence()/2 + pc.libido()/20;
	if(pc.hasPerk("Fuck Sense")) PCBonus = pc.libido();
	for(var i:int = 0; i < GLOBAL.MAX_SEXPREF_VALUE; i++) {
		buffer = GLOBAL.SEXPREF_DESCRIPTORS[i];
		//If has a preference set, talk about it!
		if(target.sexualPreferences.getPref(i) != 0) {
			//If succeeds at sense check!
			if(PCBonus + rand(20) + 1 >= target.level * 3 * (150-target.libido())/100) 
			{
				if(target.sexualPreferences.getPref(i) == GLOBAL.REALLY_LIKES_SEXPREF)
				{
					output(buffer + ": Really likes!");
				}
				else if(target.sexualPreferences.getPref(i) == GLOBAL.KINDA_LIKES_SEXPREF)
				{
					output(buffer + ": Kinda likes!");
				}
				else if(target.sexualPreferences.getPref(i) == GLOBAL.KINDA_DISLIKES_SEXPREF)
				{
					output(buffer + ": Dislikes!");
				}
				else if(target.sexualPreferences.getPref(i) == GLOBAL.REALLY_DISLIKES_SEXPREF)
				{
					output(buffer + ": Dislikes a lot!");
				}
				else 
				{
					output(buffer + ": ERROR");
				}
			}
			//if fails!
			else 
			{
				output(buffer + ": You aren't sure.")
			}
			output("\n");
		}
	}
	if(target is HandSoBot) output("\nWhilst your teases have some effect on synthetics designed for sex, you sense there is no point whatsoever trying it on with what amounts to a bipedal forklift truck.\n");
	processCombat();
}

function paralyzingShock(target:Creature):void {
	clearOutput();
	if(target.hasStatusEffect("Paralyzed")) {
		if(target.plural) output(target.capitalA + target.short + " are already paralyzed!");
		else output(target.capitalA + target.short + " is already paralyzed!");
		clearMenu();
		addButton(0,"Next",combatMainMenu);
		return;
	}
	//Attempt it!
	output(" You launch a paralyzing shock at " + target.a + target.short + "!");
	pc.energy(-25);
	//Success!
	if(pc.intelligence()/2 + rand(20) + 1 >= target.physique()/2 + 10) {
		output("\nThe effect is immediate! " + target.capitalA + target.short);
		if(target.plural) output(" shudder and stop, temporarily paralyzed.");
		else output(" shudders and stops, temporarily paralyzed.");
		target.createStatusEffect("Paralyzed",2+rand(2),0,0,0,false,"Paralyze","Cannot move!",true,0);
	}
	else {
		output(" It doesn't manage to paralyze your target!");
	}
	output("\n");
	processCombat();
}

function volley(target:Creature):void {
	pc.energy(-20);
	//Do normal attacks
	rangedAttack(pc,target,true);
	//Do the bonus flurry shot!
	rangedAttack(pc,target,true,2);
	//Chance of bliiiiiiiind
	if(pc.aim()/2 + rand(20) + 1 >= target.reflexes()/2 + 10 && !target.hasStatusEffect("Blind")) {
		if(target.plural) output("<b>" + target.capitalA + target.short + " are blinded by your " + possessive(pc.rangedWeapon.longName) + " flashes.</b>\n");
		else output("<b>" + target.capitalA + target.short + " is blinded by your " + possessive(pc.rangedWeapon.longName) + " flashes.</b>\n");
		target.createStatusEffect("Blind",3,0,0,0,false,"Blind","Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
	}
	processCombat();
}

function overcharge(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	//Set drone target
	if(pc.hasPerk("Attack Drone"))
	{
		//Figure out where in the foes array the target is and set drone target to the index.
		//Clunky as all fuck but it works.
		for(var i:int = 0; i < foes.length; i++) {
			if(foes[i] == target) flags["DRONE_TARGET"] = i;
		}
	}
	//Attack missed!
	//Blind prevents normal dodginess & makes your attacks miss 90% of the time.
	if(rangedCombatMiss(pc,target)) {
		if(target.customDodge == "") {
			output("You <b>overcharge your weapon</b> and " + pc.rangedWeapon.attackVerb + " at " + target.a + target.short + ", but just can't connect.");
			//else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " overcharged " + attacker.rangedWeapon.attackVerb + ".");
		}
		else output(target.customDodge)
	}
	//Extra miss for blind
	else if(pc.hasStatusEffect("Blind") && rand(10) > 0) {
		output("Your blind, <b>overcharged</b> shot missed.");
		//else output(attacker.capitalA + possessive(attacker.short) + " blinded, <b>overcharged</b> shot fails to connect!");
	}
	//Attack connected!
	else {
		output("You <b>overcharge</b> your " + pc.rangedWeapon.longName + " and land a hit on " + target.a + target.short + "!");
		//else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his","her","its") + " <b>overcharged</b>" + attacker.rangedWeapon.longName + "!");
		//Damage bonuses:
		var damage:int = pc.rangedWeapon.damage + pc.aim()/2;
		//OVER CHAAAAAARGE
		damage *= 1.5;
		//Randomize +/- 15%
		var randomizer = (rand(31)+ 85)/100;
		damage *= randomizer;
		var sDamage:Array = new Array();
		genericDamageApply(damage,pc,target,pc.rangedWeapon.damageType);
	}
	output("\n");
	if(pc.aim()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Stunned")) {
		if(target.plural) output("<b>" + target.capitalA + target.short + " are stunned.</b>\n");
		else output("<b>" + target.capitalA + target.short + " is stunned.</b>\n");
		target.createStatusEffect("Stunned",1,0,0,0,false,"Stunned","Cannot act for a turn.",true,0);
	}
	processCombat();
}

function gravidicDisruptor(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Raising the disruptor, you unleash a targetted gravitic disruption on " + target.a + target.short + "! ");
	var damage:Number = Math.round(10 + pc.intelligence()/2 + rand(10));
	genericDamageApply(damage,pc,target,GLOBAL.GRAVITIC);
	output("\n");
	processCombat();
}
function thermalDisruptor(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Raising the disruptor, you unleash a wave of burning fire on " + target.a + target.short + "! ");
	var damage:Number = Math.round(25 + pc.intelligence()/2 + rand(10));
	genericDamageApply(damage,pc,target,GLOBAL.THERMAL);
	output("\n");
	processCombat();
}

function powerSurge(target:Creature):void {
	clearOutput();
	output("You channel a surge of power into your shield generator, instantly restoring a portion of their lost energy.");
	var amount:int = 8+pc.intelligence()/3 + rand(6);
	if(amount + pc.shields() > pc.shieldsMax()) amount = pc.shieldsMax() - pc.shields();
	pc.shields(amount);
	pc.energy(-33);
	output(" (" + amount + ")\n");
	processCombat();
}

function deflectorRegeneration(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	output("You fiddle with your shield, tuning it regenerate over the next few turns.\n");
	pc.createStatusEffect("Deflector Regeneration",4,Math.round((pc.intelligence()/3 + 8 + rand(6))/4),0,0,false,"Regeneration","You are recovering some of your shields every round",true,0);
	processCombat();
}

function flashGrenade(target:Creature):void {
	pc.energy(-10);
	clearOutput();
	if(silly) output("With a cry of <i>\"Pocket sand!\"</i> you produce a handful of sand and throw it at " + target.a + target.short + ".");
	else output("You produce one of your rechargible flash grenades and huck it in the direction of " + target.a + target.short + ".");
	//Chance of bliiiiiiiind
	if(pc.aim()/2 + rand(20) + 6 >= target.reflexes()/2 + 10 && !target.hasStatusEffect("Blind")) {
		if(target.plural) output("\n<b>" + target.capitalA + target.short + " are blinded by </b>");
		else output("\n<b>" + target.capitalA + target.short + " is blinded by </b>");
		target.createStatusEffect("Blind",3,0,0,0,false,"Blind","Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
		if(!silly) output("<b>the luminous flashes.</b>\n");
		else output("<b>the coarse granules.</b>\n");
	}
	else output("\n" + target.capitalA + target.short + " manages to keep away from the blinding projectile.\n")
	processCombat();
}


function headbutt(target:Creature):void {
	properHeadbutt(pc,target);
}
function properHeadbutt(attacker:Creature,target:Creature):void {
	if(attacker == pc) clearOutput();
	attacker.energy(-25);
	if(attacker == pc) output("You lean back before whipping your head forward in a sudden headbutt.\n");
	else output(attacker.capitalA + attacker.short + " leans back before whipping " + attacker.mfn("his","her","its") + " head forward in a sudden headbutt.\n");
	
	if(combatMiss(attacker,target)) {
		if(attacker == pc) 
		{
			if(target.customDodge == "") output("You miss!");
			else output(target.customDodge);
		}
		else
		{
			output(attacker.mfn("He","She","It") + " he misses.")
		}
	}
	//Extra miss for blind
	else if(attacker.hasStatusEffect("Blind") && rand(2) > 0) {
		if(attacker == pc) output("Your blind strike fails to connect.");
		else output(attacker.mfn("He","She","It") + " blind strike fails to connect.");
	}
	//Attack connected!
	else {
		if(attacker == pc) output("You connect with your target!");
		else output(attacker.mfn("He","She","It") + " connects with you.");
		//else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his","her","its") + " <b>overcharged</b>" + attacker.rangedWeapon.longName + "!");
		//Damage bonuses:
		var damage:int = attacker.physique()/2 + attacker.level;
		//Randomize +/- 15%
		var randomizer = (rand(31)+ 85)/100;
		damage *= randomizer;
		var sDamage:Array = new Array();
		genericDamageApply(damage,attacker,target);
		if(attacker.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Stunned")) {
			if(target == pc)
			{
				output("\n<b>You are stunned.</b>");
			}
			else
			{
				if(target.plural) output("\n<b>" + target.capitalA + target.short + " are stunned.</b>");
				else output("\n<b>" + target.capitalA + target.short + " is stunned.</b>");
			}
			target.createStatusEffect("Stunned",2,0,0,0,false,"Stunned","Cannot act for a turn.",true,0);
		}
		else {
			if(attacker == pc) output("\nIt doesn't look to have stunned your foe!");
			else output("\nIt didn't manage to stun you.");
		}
	}
	if(attacker == pc) output("\n");
	processCombat();
}

function lowBlow(target:Creature):void {
	clearOutput();

	pc.energy(-15);
	//Set drone target
	if(pc.hasPerk("Attack Drone"))
	{
		//Figure out where in the foes array the target is and set drone target to the index.
		//Clunky as all fuck but it works.
		for(var i:int = 0; i < foes.length; i++) {
			if(foes[i] == target) flags["DRONE_TARGET"] = i;
		}
	}
	output("You swing low, aiming for a sensitive spot.\n");
	//Attack missed!
	//Blind prevents normal dodginess & makes your attacks miss 90% of the time.
	if(combatMiss(pc,target)) {
		if(target.customDodge == "") output("You miss!");
		else output(target.customDodge)
	}
	//Extra miss for blind
	else if(pc.hasStatusEffect("Blind") && rand(2) > 0) {
		output("Your blind strike fails to connect.");
	}
	//Attack connected!
	else {
		output("You connect with your target!");
		//else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his","her","its") + " <b>overcharged</b>" + attacker.rangedWeapon.longName + "!");
		//Damage bonuses:
		var damage:int = pc.meleeWeapon.damage + pc.physique()/2;
		//Randomize +/- 15%
		var randomizer = (rand(31)+ 85)/100;
		damage *= randomizer;
		var sDamage:Array = new Array();
		genericDamageApply(damage,pc,target);
		if(pc.aim()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Stunned")) {
			if(target.plural) output("\n<b>" + target.capitalA + target.short + " are stunned.</b>");
			else output("\n<b>" + target.capitalA + target.short + " is stunned.</b>");
			target.createStatusEffect("Stunned",2,0,0,0,false,"Stunned","Cannot act for a turn.",true,0);
		}
		else {
			output("\nIt doesn't look like you accomplished much more than hitting your target.");
		}
	}
	output("\n");
	processCombat();
}

function stealthFieldActivation():void {
	clearOutput();
	pc.energy(-20);
	output("You activate your stealth field generator, fading into nigh-invisibility.\n");
	pc.createStatusEffect("Stealth Field Generator",2,0,0,0,false,"Stealth Field","Provides a massive bonus to evasion chances!",true,0);
	processCombat();
}

function disarmingShot(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	if(target.hasStatusEffect("Disarm Immune")) output("You try to disarm " + target.a + target.short + " but can't. <b>It's physically impossible!</b>\n");
	else if(target.hasStatusEffect("Disarmed")) output("You try to disarm " + target.a + target.short + " but can't. <b>You already did!</b>\n");
	else if(rangedCombatMiss(pc,target)) output("You try to disarm " + target.a + target.short + " but miss.\n");
	else {
		output("You land a crack shot on " + possessive(target.a + target.short) + ", disarming them.\n");
		target.createStatusEffect("Disarmed",4,0,0,0,false,"Disarmed","Cannot use normal melee or ranged attacks!",true,0);
	}
	processCombat();
}

function grenade(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Tossing an explosive in the general direction of your target, you unleash an explosive blast of heat on " + target.a + target.short + "! ");
	var damage:Number = Math.round(40 + rand(10));
	genericDamageApply(damage,pc,target,GLOBAL.THERMAL);
	output("\n");
	processCombat();
}

function gasGrenade(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Tossing a hissing grenade in the general direction of your target, you watch the stuff do its trick.");
	
	var damage:Number = 14 + pc.level + rand(10);

	//Any perks or shit go below here.
	damage *= target.lustVuln;
	if(target.lust() + damage > target.lustMax()) damage = target.lustMax() - target.lust();
	damage = Math.ceil(damage);
	output("\n");
	output(teaseReactions(damage,target));
	target.lustDamage(damage);
	output(" ("+ damage + ")\n");
	processCombat();
}

function secondWind():void
{
	clearOutput();
	pc.energy(Math.round(pc.energyMax()/2));
	pc.HP(Math.round(pc.HPMax()/2));
	pc.createStatusEffect("Used Second Wind",0,0,0,0,true,"","",true,0);
	output("You draw on your innermost reserves of strength, taking a second wind!\n");
	processCombat();
}

function rapidFire(target:Creature):void {
	pc.energy(-20);
	//Do normal attacks
	rangedAttack(pc,target,true);
	//Do the bonus flurry shots!
	rangedAttack(pc,target,true,2);
	rangedAttack(pc,target,true,2);
	processCombat();
}

function powerStrike(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	//Set drone target
	if(pc.hasPerk("Attack Drone"))
	{
		//Figure out where in the foes array the target is and set drone target to the index.
		//Clunky as all fuck but it works.
		for(var i:int = 0; i < foes.length; i++) {
			if(foes[i] == target) flags["DRONE_TARGET"] = i;
		}
	}
	//Attack missed!
	//Blind prevents normal dodginess & makes your attacks miss 90% of the time.
	if(combatMiss(pc,target)) {
		if(target.customDodge == "") {
			output("You <b>draw back your weapon</b> and " + pc.meleeWeapon.attackVerb + " at " + target.a + target.short + ", but just can't connect.");
			//else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " overcharged " + attacker.rangedWeapon.attackVerb + ".");
		}
		else output(target.customDodge)
	}
	//Extra miss for blind
	else if(pc.hasStatusEffect("Blind") && rand(10) > 0) {
		output("Your blind, <b>power strike</b> missed.");
		//else output(attacker.capitalA + possessive(attacker.short) + " blinded, <b>overcharged</b> shot fails to connect!");
	}
	//Attack connected!
	else {
		output("You <b>draw back</b> your " + pc.meleeWeapon.longName + " and land a hit on " + target.a + target.short + "!");
		//else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his","her","its") + " <b>overcharged</b>" + attacker.rangedWeapon.longName + "!");
		//Damage bonuses:
		var damage:int = pc.meleeWeapon.damage + pc.physique()/2;
		//OVER CHAAAAAARGE
		damage *= 2;
		//Randomize +/- 15%
		var randomizer = (rand(31)+ 85)/100;
		damage *= randomizer;
		var sDamage:Array = new Array();
		genericDamageApply(damage,pc,target,pc.meleeWeapon.damageType);
	}
	output("\n");
	processCombat();
}

function takeCover():void {
	clearOutput();
	pc.energy(-20);
	output("You seek cover against ranged attacks.\n");
	pc.createStatusEffect("Taking Cover",0,0,0,0,true,"","",true);
	processCombat();
}

function carpetGrenades():void 
{
	clearOutput();
	pc.energy(-25);
	output("You sling an array of microgrenades at everything in the area! ");
	var damage:Number = Math.round(30 + rand(10));
	for(var x:int = 0; x < foes.length; x++)
	{
		damage = Math.round(30 + rand(10));
		//Double damage against plural enemies
		if(foes[x].plural) genericDamageApply(damage*2,pc,foes[x],GLOBAL.THERMAL);
		else genericDamageApply(damage,pc,foes[x],GLOBAL.THERMAL);
	}
	output("\n");
	processCombat();
}
function detCharge(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("You toss a bundle of explosives in the direction of " + target.a + target.short + "! ");
	var damage:Number = Math.round(50 + rand(10));
	genericDamageApply(damage,pc,target,GLOBAL.THERMAL);
	output("\n");
	processCombat();
}