import classes.Characters.Cockvine;
import classes.Characters.GigaGoo;
import classes.Characters.GrayGoo;
import classes.Characters.GrayPrime;
import classes.Characters.HuntressVanae;
import classes.Characters.MaidenVanae;
import classes.Characters.Mimbrane;
import classes.Characters.NyreaAlpha;
import classes.Characters.NyreaBeta;
import classes.Characters.PhoenixPirates;
import classes.Characters.PlayerCharacter;
import classes.Characters.SecurityDroids;
import classes.Characters.WetraHound;
import classes.Characters.WetraxxelBrawler;
import classes.Characters.Varmint;
import classes.Characters.gooArmor;
import classes.Creature;
import classes.Engine.Combat.DamageTypes.DamageResult;
import classes.Engine.Combat.DamageTypes.TypeCollection;
import classes.Items.Accessories.TamWolfDamaged;
import classes.Items.Armor.GooArmor;
import classes.Items.Guns.Goovolver;
import classes.Items.Miscellaneous.GrayMicrobots;
import classes.Engine.Combat.applyDamage;
import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;

//Tracks what NPC in combat we are on. 0 = PC, 1 = first NPC, 2 = second NPC, 3 = fourth NPC... totalNPCs + 1 = status tic


public function inCombat():Boolean 
{
	return (pc.hasStatusEffect("Round"));
}

public function combatMainMenu():void 
{
	userInterface.showPrimaryOutput();
	if(flags["COMBAT MENU SEEN"] == undefined)
	{
		//Track round, expires on combat exit.
		if(!pc.hasStatusEffect("Round")) pc.createStatusEffect("Round",1,0,0,0,true,"","",true,0);
		else pc.addStatusValue("Round",1,1);

		//If a round has passed since the last concentrated fire proc, clear the values as if a miss occurred.
		if(pc.statusEffectv2("Concentrated Fire") + 1 < pc.statusEffectv1("Round")) concentratedFire(false);
	}
	
	//Show what you're up against.
	// This only happening during the first initial display of the combatMainMenu should be irrelevent - it should be okay
	// to regenerate/display it without having to cache the text/convert Tease menu to output2
	if(foes[0] == celise) this.userInterface.showBust("CELISE");
	for(var x:int = 0; x < foes.length; x++) 
	{
		if(x > 0) output("\n\n");
		displayMonsterStatus(foes[x]);
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
		//Encounter with a shitty cover mechanic.
		if(foes[0] is CaptainKhorganMech)
		{
			coverUpdateDisplay();
		}
		updateCombatStatuses();
	}
	
	// Grayprime Gooclones
	if (foes[0].hasStatusEffect("Gooclones"))
	{
		var numClones:int = foes[0].statusEffectv1("Gooclones");
		output("\nThere " + ((numClones == 1) ? "is" : "are") + " Lust Clone" + ((numClones == 1) ? "" : "s") + " remaining, teasing you with " + ((numClones == 1) ? "her":"their") +" bountiful gray " + ((numClones == 1) ? "body" : "bodies") + ", all but inviting you to just drop everything and submit to pleasures of the flesh!");
	}
	
	//Stunned Menu
	if (pc.hasStatusEffect("Stunned") || pc.hasStatusEffect("Paralyzed"))
	{
		if(pc.hasStatusEffect("Stunned")) output("\n<b>You're still stunned!</b>");
		clearMenu();
		this.addButton(0,"Recover",stunRecover,pc);
	}
	//Bound Menu
	else if (pc.hasStatusEffect("Naleen Coiled"))
	{
		clearMenu();
		output("\n<b>You are wrapped up in coils!</b>");
		addButton(0,"Struggle",naleenStruggle);
		if(pc.hasPerk("Static Burst")) {
			if(pc.shields() <= 0) addDisabledButton(3,"StaticBurst","StaticBurst","You need shields available to overload in order for static burst to function.");
			else if(pc.energy() >= 5) this.addButton(3,"StaticBurst",staticBurst);
			else this.addDisabledButton(3,"StaticBurst");
		}
		this.addButton(4,"Do Nothing",wait);
	}
	//Grapple Menu
	else if (pc.hasStatusEffect("Grappled"))
	{
		clearMenu();
		output("\n<b>You are grappled and unable to fight normally!</b>");
		addButton(0,"Struggle",grappleStruggle);
		if (pc.hasPerk("Static Burst") && !(foes[0] is NyreaAlpha) && !(foes[0] is NyreaBeta)) 
		{
			if(pc.shields() <= 0) addDisabledButton(3,"StaticBurst","StaticBurst","You need shields available to overload in order for static burst to function.");
			else if(pc.energy() >= 5) this.addButton(3,"StaticBurst",staticBurst);
			else this.addDisabledButton(3,"StaticBurst");
		}
		if(foes[0] is Kaska) addButton(10,"Nip-Pinch",pinchKaskaNipple,undefined,"Nip-Pinch","Maybe pinching Kaska's nipple will get her to release you.");
		this.addButton(4,"Do Nothing",wait);
	}
	// Mimbrane Smother
	else if (pc.hasStatusEffect("Mimbrane Smother"))
	{
		clearMenu();
		output("\n\n<b>You are being smothered by a Mimbrane!</b>");
		addButton(0, "Struggle", mimbraneStruggle);
		if (pc.hasPerk("Static Burst"))
		{
			if (pc.shields() <= 0) addDisabledButton(3,"StaticBurst","StaticBurst","You need shields available to overload in order for static burst to function.");
			else if (pc.energy() >= 5) this.addButton(3, "Static Burst", staticBurst);
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
		if (foes[0].hasStatusEffect("Gooclones"))
		{
			addButton(2, "Attack Clone", grayPrimeAttackLustClone, undefined, "Attack Goo Clone", "Attack one of the Gray Primes gooclones.");
		}
		this.addButton(3, "Inventory", inventory, undefined, "Inventory", "Use items in combat.");
		this.addButton(4,"Specials",specialsMenu,undefined,"Specials","The special attacks you have available to you are listed in this menu.");
		this.addButton(5,"Tease",attackRouter,teaseMenu,"Tease Menu","Opens up your menu of available lust targetting attacks. It is recommended that the \"Sense\" option be used beforehand.");
		this.addButton(6,"Sense",attackRouter,sense,"Sense","Attempts to get a feel for a foe's likes and dislikes. Absolutely critical for someone who plans on seducing " + pc.mf("his","her") + " way out of a fight.");
		if(pc.hasStatusEffect("Trip")) this.addButton(8,"Stand Up",standUp,undefined,"Stand Up","Stand up, getting rid of the \"Trip\" status effect. This will consume your offensive action for this turn.");
		this.addButton(9,"Fantasize",fantasize,undefined,"Fantasize","Fantasize about your foe until you're helpless and on your [pc.knees] before them.");
		
		if (pc.hasStatusEffect("Cockvine Grip") && pc.statusEffectv1("Cockvine Grip") > 0)
		{
			if (pc.hasPerk("Static Burst"))
			{
				if (pc.shields() <= 0) addDisabledButton(3,"StaticBurst","StaticBurst","You need shields available to overload in order for static burst to function.");
				else if (pc.energy() >= 5) this.addButton(3, "Static Burst", staticBurst);
				else this.addDisabledButton(3, "Static Burst");
			}
			
			this.addButton(14, "Struggle", adultCockvineStruggleOverride, undefined, "Struggle", "Struggle free of the Cockvines crushing grip.");
		}
		else
		{
			this.addButton(14, "Run", runAway, undefined, "Run", "Attempt to run away from your enemy. Success is greatly dependant on reflexes. Immobilizing your enemy before attempting to run will increase the odds of success.");
		}
		
		if(foes[0] is classes.Characters.Varmint && pc.hasKeyItem("Lasso")) addButton(0,"Lasso",lassoAVarmint,undefined,"Lasso","Use the lasso you've been provided with to properly down this varmint.");
		//Bonus shit for stuff!
		if(foes[0] is CaptainKhorganMech) khorganMechBonusMenu();
	}
	flags["COMBAT MENU SEEN"] = 1;
}

public function specialsMenu():void {
	clearMenu();
	addButton(14,"Back",combatMainMenu,undefined,"Go back to the main combat screen.");
	addButton(13,"Wait",wait,undefined,"Wait","There's no real reason to this unless you're just dragging out combat to see what your enemy will do.");
	var offset:int = 0;
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY)
	{
		//EVERYONE HAS
		if(pc.energy() >= 25) addButton(offset,"Headbutt",attackRouter,headbutt,"Headbutt","A physique-based attack that does not factor in weapon damage but has a chance of stunning your target.\n\nConsumes 25 energy.");
		else addDisabledButton(offset, "Headbutt");
		offset++;
		
		//EITHER OR!
		if(pc.hasPerk("Rapid Fire"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Rapid Fire","Rapid Fire","You cannot use rapid fire while disarmed.");
			else if(pc.energy() >= 20) addButton(offset,"Rapid Fire",attackRouter,rapidFire,"Rapid Fire","Perform a long range attack with two additional, low accuracy shots following it.\n\nConsumes 20 energy.");
			else addDisabledButton(offset, "Rapid Fire");
			offset++;
		}
		
		if(pc.hasPerk("Power Strike"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Power Strike","Power Strike","You cannot use power strike while disarmed.");
			else if(pc.energy() >= 20) addButton(offset,"Power Strike",attackRouter,powerStrike,"Power Strike","Strike once with a melee weapon for double damage.\n\nConsumes 20 energy.");
			else addDisabledButton(offset, "Power Strike");
			offset++;
		}
		
		if(pc.hasPerk("Take Cover")) 
		{
			
			if(pc.energy() >= 20) addButton(offset,"Take Cover",takeCover,undefined,"Take Cover","Provides you a 90% chance of avoiding a ranged attack for 3 turns.\n\nConsumes 20 energy.");
			else addDisabledButton(offset,"Take Cover");
			offset++;
		}
		
		if (pc.hasPerk("Carpet Grenades"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Carpet Grenades","Carpet Grenades","You cannot use carpet grenades while disarmed.");
			else if(pc.energy() >= 25) addButton(offset,"Carpet Grenades",carpetGrenades,undefined,"Carpet Grenades","An attack that is extra effective against multiple foes. It deals thermal damage and is not tied into a particular stat.\n\nConsumes 25 energy.");
			else addDisabledButton(offset,"Carpet Grenades");
			offset++;
		}
		
		if(pc.hasPerk("Detonation Charge"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Det. Charge","Det. Charge","You cannot use det. charges while disarmed.");
			else if(pc.energy() >= 25) addButton(offset,"Det. Charge",attackRouter,detCharge,"Detonation Charge","Deals a moderate amount of thermal damage against a single foe.\n\nConsumes 25 energy.");
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
	else if (pc.characterClass == GLOBAL.CLASS_ENGINEER) 
	{
		if(pc.energy() >= 25) addButton(offset,"P.Shock",attackRouter,paralyzingShock,"Paralyzing Shock","An attack that allows you to paralyze a single foe. Characters with higher intelligence will have greater success using this skill.\n\nConsumes 25 energy.");
		else addDisabledButton(offset, "P.Shock");
		offset++;
		
		if(pc.hasPerk("Volley")) 
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Volley","Volley","You cannot use volley while disarmed.");
			else if (pc.energy() >= 20) addButton(offset, "Volley", attackRouter, volley, "Volley", "An attack that allows you to fire your gun one additional time at lowered accuracy. Players with higher aim will notice the attack has a higher chance of blinding the target.\n\nConsumes 20 energy.");
			else addDisabledButton(offset, "Volley");
			offset++;
		}
		
		if(pc.hasPerk("Overcharge"))
		{
			if (!(pc as PlayerCharacter).hasRangedEnergyWeapon())
			{
				addDisabledButton(offset,"Overcharge","Overcharge","Only energy weapons may be overcharged.");
			}
			else
			{
				if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Overcharge","Overcharge","You cannot use overcharge while disarmed.");
				else if(pc.energy() >= 20) addButton(offset,"Overcharge",attackRouter,overcharge,"Overcharge","A powerful ranged attack, Overcharge deals 150% damage and has a chance of stunning. Higher aim increases the chance of successfully stunning your foe.\n\nConsumes 20 energy.");
				else addDisabledButton(offset, "Overcharge", "Overcharge", "You do not have enough energy to use Overcharge.");
			}
			offset++;
		}
		
		if(pc.hasPerk("Deflector Regeneration"))
		{
			if(pc.energy() >= 20) addButton(offset,"D. Regen.",deflectorRegeneration,pc,"Deflector Regeneration","Restores a portion of your shields every turn. Higher intelligence characters will regain even more shields per turn.\n\nConsumes 20 energy.");
			else addDisabledButton(offset, "D. Regen.");
			offset++;
		}
		
		if(pc.hasPerk("Power Surge"))
		{
			if(pc.energy() >= 33) addButton(offset,"P. Surge",powerSurge,pc,"Power Surge","Restores a moderate amount of shields based on intelligence.\n\nConsumes 33 energy.");
			else addDisabledButton(offset, "P. Surge");
			offset++;
		}
		
		if(pc.hasPerk("Thermal Disruptor"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Thermal Strike","Thermal Strike","You cannot use thermal disruptors while disarmed.");
			else if(pc.energy() >= 25) addButton(offset,"T. Disrupt.",attackRouter,thermalDisruptor,"Thermal Disruptor","Deals a large amount of intelligence-based thermal damage to a single target.\n\nConsumes 25 energy.");
			else addDisabledButton(offset, "T. Disrupt.");
			offset++;
		}
		
		if(pc.hasPerk("Gravidic Disruptor"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"G. Disrupt.","G. Disrupt.","You cannot use disruptors while disarmed.");
			else if(pc.energy() >= 25) addButton(offset, "G. Disrupt.",attackRouter,gravidicDisruptor,"Gravitic Disruptor","Deals a moderate amount of intelligence-based, Unresistable damage to a single target.\n\nConsumes 25 energy.");
			else addDisabledButton(offset, "G. Disrupt.");
			offset++;
		}
		if(pc.hasPerk("Shield Hack"))
		{
			if(pc.energy() >= 25) addButton(offset,"S. Hack",attackRouter,shieldHack,"Shield Hack","Attempts to deal high damage to a target's shields.\n\nConsumes 25 energy.");
			else addDisabledButton(offset,"S. Hack","Shield Hack","You do not have enough energy to use this attack.\n\nConsumes 25 energy.");
			offset++;
		}
		if(pc.hasPerk("Weapon Hack"))
		{
			if(pc.energy() >= 25) addButton(offset,"W. Hack",attackRouter,weaponHack,"Weapon Hack","Attempt to neutralize a foe's energy weapon.\n\nConsumes 20 energy.");
			else addDisabledButton(offset,"W. Hack","Weapon Hack","You do not have enough energy to use this attack.\n\nConsumes 20 energy.");
			offset++;
		}
	}
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		if(silly)
		{
			if(pc.energy() >= 10) addButton(offset,"P.Sand",attackRouter,flashGrenade,"Pocket Sand","Produce some sand from your level and use it to blind your enemies! Better aim will help you land the attack.\n\nConsumes 10 energy.");
			else addDisabledButton(offset, "P.Sand");
			offset++;
		}
		else
		{
			if(pc.energy() >= 10) addButton(offset,"F.Grenade",attackRouter,flashGrenade,"Flash Grenade","Produce a rechargible flash grenade and use it to blind your enemy. Better aim will increase the chance of success.\n\nConsumes 10 energy.");
			else addDisabledButton(offset, "F.Grenade");	
			offset++;
		}
		
		if(pc.hasPerk("Low Blow"))
		{
			if(pc.energy() >= 15) addButton(offset,"Low Blow",attackRouter,lowBlow,"Low Blow","A melee strike with an aim-based chance of stunning your target.\n\nConsumes 15 energy.");
			else addDisabledButton(offset, "Low Blow");	
			offset++;
		}
		
		if (pc.hasPerk("Disarming Shot")) 
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Disarm Shot","Disarm Shot","You cannot use disarming shot while disarmed.");
			else if(pc.energy() >= 20) addButton(offset, "Disarm Shot",attackRouter,disarmingShot,"Disarming Shot","Disarms your foe, preventing them from making use of melee or ranged weapons for turn.\n\nConsumes 15 energy.");
			else addDisabledButton(offset, "Disarm Shot");	
			offset++;
		}
		
		if (pc.hasPerk("Stealth Field Generator")) 
		{
			if(pc.energy() >= 20 && !pc.hasStatusEffect("Stealth Field Generator")) addButton(offset,"Stealth Field",stealthFieldActivation,undefined,"Stealth Field","Creates a stealth field that greatly increases your evasion for a few turns.");
			else addDisabledButton(offset, "Stealth Field");
			offset++;
		}
		
		if(pc.hasPerk("Grenade"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Grenade","Grenade","You cannot use grenades while disarmed.");
			else if(pc.energy() >= 25) addButton(offset,"Grenade",attackRouter,grenade,"Grenade","Does a moderate amount of thermal damage to a single opponent.\n\nConsumes 25 energy.");
			else addDisabledButton(offset, "Grenade");	
			offset++;
		}
		
		if(pc.hasPerk("Gas Grenade"))
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Gas Grenade","Gas Grenade","You cannot use grenades while disarmed.");
			else if(pc.energy() >= 25) addButton(offset,"Gas Grenade",attackRouter,gasGrenade,"Gas Grenade","An unavoidable attack that deals a fair amount of lust damage.\n\nConsumes 25 energy.");
			else addDisabledButton(offset, "Gas Grenade");	
			offset++;
		}
		if(pc.hasPerk("Smuggled Stimulant"))
		{
			if(pc.hasStatusEffect("Used Smuggled Stimulant")) addDisabledButton(offset,"S.Stimulant","Smuggled Stimulant","You've already used your smuggled stimulant for this encounter.");
			else addButton(offset,"S.Stimulant",struggledStimulant,undefined,"Smuggled Stimulant","Inject yourself with a smuggled stimulant, causing you to recover 25 energy a turn for three turns.");
			offset++;
		}
		if(pc.hasPerk("Burst of Energy"))
		{
			if(pc.hasStatusEffect("Used Burst of Energy")) addDisabledButton(offset,"B.O. Energy","Burst of Energy","You've already used a burst of energy this encounter.");
			else addButton(offset,"B.O. Energy",burstOfEnergy,undefined,"Burst of Energy","Get a burst of energy, recovering 60 energy.\n\nYou may only do this once per encounter.");
			offset++;
		}
	}
	
	// Shared Specials!
	if (pc.hasKeyItem("Goozooka"))
	{
		if (!pc.hasItem(new GrayMicrobots()))
		{
			addDisabledButton(offset, "Goozooka", "Fire Goozooka", "You don't have any Gray Goo samples to use as ammunition for the Goozooka.");
		}
		else
		{
			if(pc.hasStatusEffect("Disarmed")) addDisabledButton(offset,"Goozooka","Goozooka","You cannot use a goozooka while disarmed.");
			else addButton(offset, "Goozooka", attackRouter, goozookaCannon, "Fire Goozooka", "Fire a Gray Goo at your enemy for the princely sum of a single sample of Gray Microbots.");
		}
		offset++;
	}
	
	if (pc.armor is GooArmor)
	{
		if (!pc.hasStatusEffect("Reduced Goo"))
		{
			addButton(offset, "Goo Clone", attackRouter, pcGooClone, "Goo Clone", "Have [goo.name] hop off and start teasing your enemy. Reduces your armor value, but inflicts lust over time.");
		}
		else
		{
			addButton(offset, "Recall Goo", pcRecallGoo, undefined, "Recall Goo", "Call [goo.name] back to you, restoring your gooey armor.");
		}
		offset++;
	}
	
	if (pc.hasPerk("Concussive Shot"))
	{
		if (!pc.hasBowWeaponEquipped())
		{
			addDisabledButton(offset, "Concussive Shot", "Concussive Shot", "Concussive Shot requires a bow-like weapon.");
		}
		else if (pc.hasStatusEffect("Disarmed"))
		{
			addDisabledButton(offset, "Concussive Shot", "Concussive Shot", "You cannot use Concussive Shot whilst disarmed.");
		}
		else if (pc.energy() < 25)
		{
			addDisabledButton(offset++, "Concussive Shot", "Concussive Shot", "Concussive shot requires 25 energy.");
		}
		else
		{
			addButton(offset, "Concussive Shot", attackRouter, pcConcShot, "Concussive Shot", "Fire an explosive arrow at your target, potentially stunning them for 2-4 rounds.");
		}
		offset++;
	}
}

public function updateCombatStatuses():void {
	var temp:Number = 0;
	//PC STATUSES!
	if(pc.hasPerk("Shield Regen") && pc.shields() <= 0 && pc.shieldsMax() > 0 && !pc.hasStatusEffect("Used Shield Regen"))
	{
		output("<b>Your shields power back up at one quarter power. Now's your chance to turn this around!</b>\n");
		pc.shields(Math.round(pc.shieldsMax()/4));
		pc.createStatusEffect("Used Shield Regen",0,0,0,0,true,"","",true,0);
	}
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
			applyDamage(new TypeCollection( { burning: 4 + foes[0].level } ), foes[0], pc);
			output("\n");
		}
	}
	if(pc.hasStatusEffect("Poison"))
	{
		//2% of HP per tic.
		output("<b>The poison continues to take its toll on your body; you need to end this fight as soon as possible!</b>");
		applyDamage(new TypeCollection( { poison: Math.round(pc.HPMax() * 0.02) } ), foes[0], pc);
		output("\n");
	}
	if(pc.hasStatusEffect("Burn"))
	{
		//2% of HP per tic.
		output("<b>The flames slowly lick at you,");
		if(pc.statusEffectv1("Burn") > 1) 
		{
			pc.addStatusValue("Burn",1,-1);
			output(" resisting any attempt to put them out.</b>");
		}
		else 
		{
			pc.removeStatusEffect("Burn");
			output(" refusing to go out until they've done their foul work.</b>");
		}		
		applyDamage(new TypeCollection( { burning: 3 + rand(4) } ), foes[0], pc);
		output("\n");
	}
	if (pc.hasStatusEffect("Bleeding"))
	{
		output("<b>Your wounds continue to take their toll on your body;");
		if (pc.statusEffectv2("Bleeding") >= 1)
		{
			pc.addStatusValue("Bleeding", 2, -1);
			output(" your microsugeons working overtime to stem the ongoing damage.</b>");
		}
		else
		{
			pc.removeStatusEffect("Bleeding");
			output(" your microsurgeons have triaged the worst of it, but you'll need proper rest to heal.</b>");
		}
		applyDamage(damageRand(new TypeCollection( { kinetic: pc.statusEffectv1("Bleeding") * pc.statusEffectv3("Bleeding") } ), 15), foes[0], pc);
		output("\n");
	}
	if (pc.hasStatusEffect("Staggered"))
	{
		if (pc.statusEffectv1("Staggered"))
		{
			pc.addStatusValue("Staggered", 1, -1);
			output("<b>You're still reeling from the force of the blows to which you've been subject.</b>");
		}
		else
		{
			pc.removeStatusEffect("Staggered");
			output("<b>You finally shake away the stars from your vision, your [pc.feet] planted on the floor firmly once again.</b>");
		}
	}
	if(!pc.hasStatusEffect("Blind") && pc.hasStatusEffect("Quivering Quasar"))
	{
		if(rand(10) == 0) 
		{
			output("<b>You abruptly go blind, perhaps an effect of the Quivering Quasar you drank.</b>\n")
			pc.createStatusEffect("Blind",2,0,0,0,false,"Blind","You're blinded and cannot see! Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
		}
	}
	if(pc.hasStatusEffect("Trip"))
	{
		if(pc.hasPerk("Leap Up"))
		{
			output("<b>You roll up onto your [pc.feet] immediately thanks to your quick reflexes.</b>\n");
			pc.removeStatusEffect("Trip");
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
			output("<b>You are practically invisible thanks to your stealth field generator.</b>\n");
		}
	}
	if(pc.hasStatusEffect("Taking Cover"))
	{
		pc.addStatusValue("Taking Cover",1,-1);
		if(pc.statusEffectv1("Taking Cover") <= 0)
		{
			pc.removeStatusEffect("Taking Cover");
			output("<b>You are no longer taking cover!</b>\n");
		}
		else {
			output("<b>Your enemies will have a hard time hitting you behind your cover!</b>\n");
		}
	}
	if(pc.hasStatusEffect("Deflector Regeneration"))
	{
		pc.addStatusValue("Deflector Regeneration",1,-1);
		temp = pc.statusEffectv2("Deflector Regeneration");
		if(temp + pc.shields() > pc.shieldsMax()) temp = pc.shieldsMax() - pc.shields();
		if(temp > 0) 
		{
			output("<b>You recover " + temp + " points of shielding.\n");
			pc.shields(temp);
		}
		if(pc.statusEffectv1("Deflector Regeneration") <= 0)
		{
			output("<b>Your shields are no longer regenerating!</b>\n");
			pc.removeStatusEffect("Deflector Regeneration");
		}
	}
	if(pc.statusEffectv1("Used Smuggled Stimulant") > 0)
	{
		pc.addStatusValue("Used Smuggled Stimulant",1,-1);
		pc.energy(25);
		output("<b>A rush of energy fills you as the smuggled stimulant affects you.</b>\n");
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
			output("<b>The parasite’s noxious perspiration has faded away.</b>\n");
		}
		else
		{
			if (mimbraneDebug) trace("Lust cloud remains.");
			pc.lust(5 + rand(10));
			output("<b>The parasite's venom is coursing through your veins. Your sexual desire is rising at an alarming rate.</b>\n");
		}
	}
	if(pc.hasStatusEffect("Disarmed") && !(foes[0] is Varmint))
	{
		pc.addStatusValue("Disarmed",1,-1);
		if(pc.statusEffectv1("Disarmed") <= 0)
		{
			pc.removeStatusEffect("Disarmed");
			output("<b>You are no longer disarmed!</b>\n");
		}
		else 
		{
			output("<b>You are disarmed and cannot use weapon based attacks.</b>\n");
		}
	}
	if (pc.hasStatusEffect("Combat Drone Disabled"))
	{
		pc.addStatusValue("Combat Drone Disabled", 1, -1);
		if (pc.statusEffectv1("Combat Drone Disabled") <= 0)
		{
			pc.removeStatusEffect("Combat Drone Disabled");
			if (pc.hasCombatDrone())
			{
				output("<b>There’s a familiar and welcome sound of whirring servos above you. Your righted drone moves back down to your side to aid you.</b>\n");
			}
		}
	}
	
	// Annoquest stuffs
	
	if (pc.hasStatusEffect("Sensor Link"))
	{
		pc.addStatusValue("Sensor Link", 1, -1);
		if (pc.statusEffectv1("Sensor Link") <= 0)
		{
			pc.removeStatusEffect("Sensor Link");
			pc.aimMod -= 5;
			output("<b>Your equipments connection to Anno's wanes as combat draws on, your improved accuracy diminishing.</b>\n");
		}
	}
	
	if (pc.hasStatusEffect("HP Boost CD"))
	{
		pc.addStatusValue("HP Boost CD", 1, -1);
		if (pc.statusEffectv1("HP Boost CD") <= 0)
		{
			pc.removeStatusEffect("HP Boost CD");
		}
	}
	
	//ENEMY STATUSES!
	for(var x:int = 0; x < foes.length; x++)
	{
		if(foes[x].hasStatusEffect("Burn"))
		{
			//2% of HP per tic.
			output("<b>The flames slowly lick at " + foes[x].a + foes[x].short + ",");
			if(foes[x].statusEffectv1("Burn") > 1) 
			{
				foes[x].addStatusValue("Burn",1,-1);
				output(" resisting any attempt to put them out.</b>");
			}
			else 
			{
				foes[x].removeStatusEffect("Burn");
				output(" refusing to go out until they've done their foul work.</b>");
			}		
			applyDamage(new TypeCollection( { burning: 3 + rand(4) } ), null, foes[x]);
			output("\n");
		}
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
		if (foes[x].hasStatusEffect("Resolve"))
		{
			foes[x].addStatusValue("Resolve",1,-1);
			if(foes[x].statusEffectv1("Resolve") <= 0)
			{
				foes[x].removeStatusEffect("Resolve");
				output("<b>" + foes[x].capitalA + foes[x].short + " is no longer resolved!</b>\n");
				foes[x].baseHPResistances.tease.resistanceValue -= 100;
				foes[x].baseHPResistances.drug.resistanceValue -= 50;
				foes[x].baseHPResistances.pheromone.resistanceValue -= 50;

			}
			else
			{
				output("<b>" + foes[x].capitalA + foes[x].short + " has a resolved, steely look in " + foes[x].mfn("his","her","its") + " eyes!</b>\n");
			}
		}
		if (foes[x].hasStatusEffect("Lust Stunned"))
		{
			foes[x].addStatusValue("Lust Stunned",1,-1);
			if(foes[x].statusEffectv1("Lust Stunned") <= 0)
			{
				foes[x].removeStatusEffect("Lust Stunned");
			}
		}
		if (foes[x].hasStatusEffect("Stunned"))
		{
			if(foes[x].hasStatusEffect("Lust Stunned")) output("<b>Your teasing has the poor girl in a shuddering mess as she tries to regain control of her lust addled nerves.</b>\n");
			else output("<b>" + foes[x].capitalA + foes[x].short + " is stunned and unable to act!</b>\n");
		}
		if (foes[x].hasStatusEffect("Stealth Field Generator"))
		{
			foes[x].addStatusValue("Stealth Field Generator", 1, -1);
			if (foes[x].statusEffectv1("Stealth Field Generator") <= 0) foes[x].removeStatusEffect("Stealth Field Generator");
		}
		if (foes[x].hasStatusEffect("Gray Goo Clone"))
		{
			var lFailed:Boolean = false;
			
			if ((foes[x] as Creature).isLustImmune == true) lFailed = true;
			if ((foes[x] as Creature).getLustResistances().tease.resistanceValue >= 100.0) lFailed = true;
			
			if (!lFailed)
			{
				var lDamage:TypeCollection = new TypeCollection( { tease: 5 + rand(3) } );
				var dResult:DamageResult = applyDamage(lDamage, pc, foes[x], "suppress");
			}
			
			output("[goo.name] dances around, flashing plenty of tits and ass for " + foes[x].a + foes[x].short + ".");
			if (lFailed || (dResult && (dResult.lustDamage <= 0 || dResult.lustResisted)))
			{
				output(" " + foes[x].capitalA + foes[x].short + " looks on, clearly unimpressed.\n");
			}
			else
			{
				output(" " + foes[x].capitalA + foes[x].short + " stares mesmerized at [goo.name]'s dance, flushing with lust.\n");
			}
			
			if (!lFailed)
			{
				outputDamage(dResult);
			}
		}
	}
	userInterface.playerStatusEffects = this.chars["PC"].statusEffects;	
}
public function stunRecover(target:Creature):void 
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

public function standUp():void
{
	clearOutput();
	//RASK DUDEPILE BE SPECUAL
	if(foes[0] is RaskvelMale)
	{
		//Get back up
		if(!pc.hasStatusEffect("Raskvel Pile"))
		{
			output("Quickly you heave yourself back on your [pc.feet], dusting yourself down with a scowl.\n");
			pc.removeStatusEffect("Trip");
			pc.removeStatusEffect("Raskvel Pile");
		}
		//Get back up under pile on:
		if(pc.physique() + pc.statusEffectv1("Raskvel Pile") >= 30)
		{
			output("You tense yourself up and with a sudden upward heave send the raskvel flying off you. You scramble back on your [pc.feet], feeling intense relief from escaping that suffocating helplessness.\n");
			pc.removeStatusEffect("Trip");
			pc.removeStatusEffect("Raskvel Pile");
		}
		//Fail to get back up under pile on:
		else
		{
			output("You try and elbow your way back up and duly collapse straight back into the dirt again. These little bastards are heavy!\n");
			pc.addStatusValue("Raskvel Pile",1,10);
		}
	}
	//GENERIC
	else
	{
		output("You climb up onto your [pc.feet].\n");
		pc.removeStatusEffect("Trip");
	}
	processCombat();
}

public function celiseMenu():void 
{
	this.clearMenu();
	if(pc.statusEffectv1("Round") == 1) 
		this.addButton(0,"Attack",attackRouter,playerAttack);
	else if(pc.statusEffectv1("Round") == 2) 
		this.addButton(1,upperCase(pc.rangedWeapon.attackVerb), attackRouter, playerRangedAttack);
	else 
		this.addButton(5,"Tease",attackRouter,tease);
}

public function processCombat():void 
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
	
	if (pc.hasStatusEffect("Annoquest Helper AI") && combatStage == 1)
	{
		annoBonusCombatAttackShit();
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
	if(combatStage == foes.length+1 && (pc.hasPerk("Attack Drone") || pc.accessory is TamWolfDamaged) && flags["DRONE_TARGET"] != undefined)
	{
		if(pc.shields() > 0) {
			output("\n\n");
			//Clear drone down if got shields healed.
			if (pc.hasStatusEffect("Drone Down")) {
				// Hide the message of the drone is not available right now... something something
				if (pc.hasCombatDrone()) output("Your drone shudders to life, lifting back into the air and circling your target helpfully. ");
				pc.removeStatusEffect("Drone Down");
				//Reboot clears hack!
				if(pc.hasStatusEffect("Porno Hacked Drone")) pc.removeStatusEffect("Porno Hacked Drone");
			}
			//ATTACK!
			droneAttack(foes[flags["DRONE_TARGET"]]);
			return;
		}
		//No shields and drone not down yet? Give notification!
		else if(!pc.hasStatusEffect("Drone Down")) {
			if(!(pc.accessory is TamWolfDamaged || pc.accessory is TamWolf)) 
			{
				if (pc.hasCombatDrone()) output("\n\nYour drone collapses along with your shields. It sputters weakly as it shuts down.<b> It won't be doing any more damage until you bring your shields back up!</b>");
				pc.createStatusEffect("Drone Down",0,0,0,0,true,"","",true,0);
			}
			else 
			{
				//Hacked drone no attack.
				if(pc.hasStatusEffect("Porno Hacked Drone")) {}
				//No hack? Attack!
				else
				{
					output("\n\n");
					droneAttack(foes[flags["DRONE_TARGET"]]);
				}
			}
		}
	}
	//Clear lasso status from varmints.
	if(foes[0] is Varmint) foes[0].removeStatusEffect("Lassoed");
	combatStage = 0;
	this.clearMenu();
	this.addButton(0,"Next",combatMainMenu);
}

public function grappleStruggle():void {
	clearOutput();
	
	if (foes[0] is Cockvine)
	{
		adultCockvineStruggleOverride();
		return;
	}
	//Escape artist! Use reflexes instead of physique if advantageous.
	if(pc.hasPerk("Escape Artist") && pc.reflexes() >= pc.physique())
	{
		if(pc.reflexes() + rand(20) + 7 + pc.statusEffectv1("Grappled") * 5 > pc.statusEffectv2("Grappled")) {
			if (foes[0] is SexBot) output("You almost dislocate an arm doing it, but, ferret-like, you manage to wriggle out of the sexbot’s coils. Once your hands are free, the droid does not seem to know how to respond, and you are able to grapple the rest of your way out easily, ripping away from its molesting grip. The sexbot clicks and stutters a few times before going back to staring at you blankly, swinging its fibrous limbs over its head.");
			if (foes[0] is MaidenVanae || foes[0] is HuntressVanae) vanaeEscapeGrapple("Escape Artist");
			else output("You display a remarkable amount of flexibility as you twist and writhe to freedom.");
			pc.removeStatusEffect("Grappled");
		}
	}
	else 
	{
		if(pc.physique() + rand(20) + 6 + pc.statusEffectv1("Grappled") * 5 > pc.statusEffectv2("Grappled"))
		{
			if (foes[0] is SexBot) output("You almost tear a muscle doing it, but, you manage to heave apart the sexbot’s coils. Once your hands are free, the droid does not seem to know how to respond, and you are able to grapple the rest of your way out easily, ripping away from its molesting grip. The sexbot clicks and stutters a few times before going back to staring at you blankly, swinging its fibrous limbs over its head.");
			else if (foes[0] is MaidenVanae || foes[0] is HuntressVanae) vanaeEscapeGrapple();
			else if (foes[0] is GrayPrime) grayPrimeEscapeGrapple();
			else if (foes[0] is NyreaAlpha || foes[0] is NyreaBeta) output("You pull and heave at the thick, knotted ropes of the nyrea's net, finally managing to pry a gap large enough for you to squeeze your frame through!");
			//else if (foes[0] is GoblinGadgeteer) output("You manage to untangle your body from the net, and prepare to fight the goblin again.");
			else output("With a mighty heave, you tear your way out of the grapple and onto your [pc.feet].");
			pc.removeStatusEffect("Grappled");
		}
	}
	//Fail to escape: 
	if(pc.hasStatusEffect("Grappled"))
	{
		if(foes[0] is SexBot) output("You struggle as hard as you can against the sexbot’s coils but the synthetic fiber is utterly unyielding.");
		else if (foes[0] is Kaska) failToStruggleKaskaBoobs();
		else if (foes[0] is MaidenVanae || foes[0] is HuntressVanae) output("You wriggle in futility, helpless as she lubes you up with her sensuous strokes. This is serious!");
		else if (foes[0] is GrayPrime) grayPrimeFailEscape();
		else if (foes[0] is NyreaAlpha || foes[0] is NyreaBeta) output("Try as you might, struggling against the heavy ropes of the nyrea huntresses net, you just can't find a way out of the net that has you restrained.");
		//else if (foes[0] is GoblinGadgeteer) output("You manage to untangle your body from the net, and prepare to fight the goblin again.");
		else output("You struggle madly to escape from the pin but ultimately fail. The pin does feel a little looser as a result, however.");
		pc.addStatusValue("Grappled",1,1);
	}
	output("\n");
	processCombat();
}

public function staticBurst():void {
	clearOutput();
	/*if(foes[0] is GoblinGadgeteer)
	{
		output("You shock the net to little avail. It turns out electricity doesn't do much to nets.\n");
		processCombat();
		return;
	}*/
	pc.energy(-5);
	output("You release a discharge of electricity, momentarily weakening your ");
	if(foes[0].plural) output("foes'");
	else output("foe's");
	output(" grip on you!");
	if(pc.hasStatusEffect("Naleen Coiled")) {
		pc.removeStatusEffect("Naleen Coiled");
		output("\nThe naleen's tail spasms as you easily slip out of its coils.");
	}
	if(pc.hasStatusEffect("Grappled"))
	{
		pc.removeStatusEffect("Grappled");
		output("\nYou slip free of the grapple.");
	}
	if (pc.hasStatusEffect("Cockvine Grip"))
	{
		pc.addStatusValue("Cockvine Grip", 1, -2);
		if (pc.statusEffectv1("Cockvine Grip") < 0) pc.setStatusValue("Cockvine Grip", 1, 0);
	}
	output("\n");
	processCombat();
}

public function allFoesDefeated():Boolean 
{
	for(var x:int = 0; x < foes.length; x++) {
		//If a foe is up, fail.
		if(foes[x].HP() > 0 && foes[x].lust() < 100) return false;
	}
	//If we get through them all, check! All foes down.
	return true;
}

public function combatMiss(attacker:Creature, target:Creature, overrideAttack:Number = -1, missModifier:Number = 1):Boolean 
{
	if (overrideAttack == -1) overrideAttack = attacker.meleeWeapon.attack;
	
	if(rand(100) + attacker.physique()/5 + overrideAttack - target.reflexes()/5 < 10 * missModifier && !target.isImmobilized()) 
	{
		return true;
	}
	//Evasion chances
	if(target.evasion() >= rand(100) + 1) {
		trace("EVASION WORKED!: " + target.evasion());
		return true;
	}
	//10% miss chance for lucky breaks!
	if (target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;
	if(target.hasPerk("Melee Immune")) return true;
	return false;
}
public function rangedCombatMiss(attacker:Creature, target:Creature, overrideAttack:Number = -1, missModifier:Number = 1):Boolean 
{
	if (overrideAttack == -1) overrideAttack = attacker.rangedWeapon.attack;
	
	//Immune!
	if (target.hasPerk("Ranged Immune")) return true;
	
	//Standard miss chance
	if(rand(100) + attacker.aim()/5 + overrideAttack - target.reflexes()/3 < 10 * missModifier && !target.isImmobilized()) 
	{
		return true;
	}
	//Evasion chances
	if(target.evasion() >= rand(100) + 1) 
	{
		trace("RANGED EVASION SUCCESS: " + target.evasion() + "%");
		return true;
	}
	//Take cover chance
	if(target.hasStatusEffect("Taking Cover") && rand(100) + 1 < 90) return true;
	//10% miss chance for lucky breaks!
	if(target.hasPerk("Lucky Breaks") && rand(100) <= 9) return true;
	
	return false;
}

public function attackRouter(destinationFunc:Function):void 
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

public function enemyAttack(attacker:Creature):void 
{
	attack(attacker, pc);
}

public function playerAttack(target:Creature):void 
{
	attack(pc, target, true);
	mimbraneHandBonusAttack(target);
	playerMimbraneCloudAttack();
	//Cleave only triggers off the last swing before round completion.
	if(pc.hasPerk("Cleave") && (target.plural || foes.length > 1)) 
	{
		output("<b>Cleave!</b>\n");
		attack(pc, target, true, 1);
	}
	processCombat();
}

public function concentratedFire(hit:Boolean = true):void
{
	if(pc.hasPerk("Concentrate Fire"))
	{
		//Reset bonus damage if miss
		if(!hit) 
		{
			pc.removeStatusEffect("Concentrated Fire");
		}
		//If a hit, add bonus damage
		else 
		{
			//Create Concentrated Fire Status if not yet active.
			if(!pc.hasStatusEffect("Concentrated Fire")) pc.createStatusEffect("Concentrated Fire",0,0,0,0,false,"OffenseUp","",true);
			//Add up the new bonus.
			var bonus:int = Math.round(pc.level/2) + pc.statusEffectv1("Concentrated Fire");
			if(bonus > pc.level) bonus = pc.level;
			trace("CONCENTRATED FIRE BONUS: " + bonus);
			//Set updated bonus damage.
			pc.setStatusValue("Concentrated Fire",1,bonus);
			//Set status = to round counter - used to track if a round is skipped.
			pc.setStatusValue("Concentrated Fire",2,pc.statusEffectv1("Round"));
			//Update tooltip
			pc.setStatusTooltip("Concentrated Fire","Shooting on target repeatedly is boosting your damage. Current ranged damage bonus: " + bonus);
		}
	}
}

public function playerRangedAttack(target:Creature):void 
{
	rangedAttack(pc, target);
	playerMimbraneCloudAttack();
}

public function attack(attacker:Creature, target:Creature, noProcess:Boolean = false, special:int = 0):void {
	//Set drone target
	setDroneTarget(target);
	if (foes[0].short == "female zil") flags["HIT_A_ZILGIRL"] = 1;
	if (attacker == pc)
	{
		if (!attacker.hasStatusEffect("Multiple Attacks") && !attacker.hasStatusEffect("Mimbrane Bonus Attack") && special == 0)
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
		
		applyDamage(attacker.meleeDamage(), attacker, target, "melee");
	}
	//Do multiple attacks if more are queued (does not stack with special!)
	if(attacker.hasStatusEffect("Multiple Attacks") && special == 0) {
		output("\n");
		attack(attacker,target, noProcess);
		return;
	}
	if(attacker == chars["PC"]) output("\n");
	if(!noProcess) {
		processCombat();
	}
}

//Special 1: Flurry attack - high miss chance.
//Special 2: Flurry attack with no new screen display.
public function rangedAttack(attacker:Creature, target:Creature, noProcess:Boolean = false, special:int = 0):void 
{
	//Set drone target
	setDroneTarget(target);
	if(!attacker.hasStatusEffect("Multiple Shots") && attacker == pc && special != 2) clearOutput();
	trace("Has multiple shots? " + String(!attacker.hasStatusEffect("Multiple Shots")) + " Attacker = PC? " + String(attacker == pc) + " special? " + special);
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
			if (attacker == pc) 
			{
				output("You " + pc.rangedWeapon.attackVerb + " at " + target.a + target.short + " with your " + pc.rangedWeapon.longName + ", but just can't connect.");
				concentratedFire(false);
			}
			else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackVerb + ".");
		}
		else output(target.customDodge)
	}
	//Extra miss for blind
	else if(attacker.hasStatusEffect("Blind") && rand(10) > 0) {
		if(attacker == pc) 
		{
			output("None of your blind-fired shots manage to connect.");
			concentratedFire(false);
		}
		else output(attacker.capitalA + possessive(attacker.short) + " blinded shots fail to connect!");
	}
	//Additional Miss chances for if target isn't stunned and this is a special flurry attack (special == 1)
	else if((special == 1 || special == 2) && rand(100) <= 45 && !target.isImmobilized()) {
		if(target.customDodge == "") {
			if(attacker == pc) 
			{
				output("You " + pc.rangedWeapon.attackVerb + " at " + target.a + target.short + " with your " + pc.rangedWeapon.longName + ", but just can't connect.");
				concentratedFire(false);
			}
			else output("You manage to avoid " + attacker.a + possessive(attacker.short) + " " + attacker.rangedWeapon.attackVerb + ".");
		}
		else output(target.customDodge);
	}
	//Celise autoblocks
	else if(target.short == "Celise") {
		output("Celise takes the hit, the wound instantly closing in with fresh, green goop. Her surface remains perfectly smooth and unmarred afterwards.");
	}
	//Attack connected!
	else {
		if(attacker == pc) output("You land a hit on " + target.a + target.short + " with your " + pc.rangedWeapon.longName + "!");
		else if(attacker.plural) output(attacker.capitalA + attacker.short + " connect with their " + attacker.rangedWeapon.longName + "!");
		else output(attacker.capitalA + attacker.short + " connects with " + attacker.mfn("his", "her", "its") + " " + attacker.rangedWeapon.longName + "!");
		
		if (attacker.rangedWeapon is Goovolver)
		{
			applyDamage(attacker.rangedDamage(), attacker, target, "goovolver");
		}
		else
		{
			applyDamage(attacker.rangedDamage(), attacker, target, "ranged");
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

public function droneAttack(target:Creature):void {
	if (!pc.hasCombatDrone()) return;
	
	if(pc.accessory is TamWolf) 
	{
		//In Combat:
		// Tam-wolf has the same stats as a normal Attack Drone in terms of damage -- maybe a little higher. Though he doesn't boost your shields, he can operate even after yours collapse. Handy!
		//Attack!
		output("<i>\"Enemy detected, " + pc.mf("master","mistress") + " [pc.name]! I will defend you!\"</i> Tam-wolf announces, leaping into the fray. He hits, biting " + target.a + target.short + ".");
		applyDamage(droneDamage(), pc, target, "minimal");
		output(" Good boy!");
	}
	else if(pc.accessory is TamWolfDamaged) 
	{
		//In Combat:
		//Tam-wolf has a 30% chance of doing nothing on his turn. Otherwise, he makes a light Piercing attack.
		//Do Nothing:
		if(rand(10) <= 2) output("Tam-wolf leaps forward at " + target.a + target.short + "... but his bum leg catches, and he goes tumbling into the ground. Dammit, Tam-wolf!");
		//Attack!
		else
		{
			output("<i>\"ENEMY DETECTED, MISTRESS TAM! I WILL DEFEND YOU,\"</i> Tam-wolf loudly announces as he lunges at " + target.a + target.short + ". He hits!");
			applyDamage(droneDamage(), pc, target, "minimal");
			output(" Good boy!");
		}
	}
	else 
	{
		output("Your drone repeatedly zaps " + target.a + target.short + ".");
		applyDamage(droneDamage(), pc, target, "minimal");
	}
	processCombat();
}
//Broke this out so all can be adjusted at once as buffed/nerfed.
public function droneDamage():TypeCollection
{
	var d:Number = 1 + pc.level + rand(2 + pc.level/2)
	if (pc.accessory is TamWolfDamaged) d -= 1;
	return new TypeCollection( { kinetic: d } );
}

public function teaseMenu(target:Creature):void 
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
		if(pc.milkType == GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK && pc.isLactating()) addButton(4,"Milk Squirt",teaseSquirt,target,"Milk Squirt","Spray the enemy with your vanae milk, arousing them.");
		else if(pc.milkType == GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) addDisabledButton(4,"Milk Squirt","Milk Squirt","You do not currently have enough milk available to squirt any.");
		addButton(14,"Back",combatMainMenu,undefined,"Back","Back out. Recommended if you haven't yet used \"Sense\" to determine your foe's likes and dislikes. Remember you can pull up your appearance screen in combat or use the scene buffer buttons in the lower left corner to compare yourself to your foe's preferences!");
	}
}
public function teaseChest(target:Creature):void {
	tease(target, "chest");
}
public function teaseHips(target:Creature):void {
	tease(target, "hips");
}
public function teaseButt(target:Creature):void {
	tease(target, "butt");
}
public function teaseCrotch(target:Creature):void {
	tease(target,"crotch");
}
public function teaseSquirt(target:Creature):void {
	tease(target,"squirt");	
}

//Name, long descript, lust descript, and '"
// NO SIDEEFFECTS TO GAME DATA YO
public function displayMonsterStatus(targetFoe:Creature):void 
{
	clearOutput();
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
			if (targetFoe is ZilFemale) author("Savin");
			if (targetFoe is Cockvine)
			{
				author("Nonesuch");			
				adultCockvineCombatDescriptionExtension();
			}
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

public function showMonsterArousalFlavor(targetFoe:Creature):void 
{
	if(targetFoe.lust() < 50 || targetFoe.isLustImmune == true) { 
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

public function enemyAI(aggressor:Creature):void 
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
	if(aggressor is Celise) celiseAI();
	else if(aggressor is ZilPack) zilpackAI();
	else if(aggressor is ZilMale) zilMaleAI();
	else if(aggressor is ZilFemale) zilGirlAI();
	else if(aggressor is CuntSnake) cuntSnakeAI();
	else if(aggressor is Naleen) naleenAI();
	else if(aggressor is NaleenMale) naleenMaleAI();
	else if(aggressor is CarlsRobot) machinaAI();
	else if(aggressor is Dane) daneAI();
	else if(aggressor is Mimbrane) mimbraneAI();
	else if(aggressor is RaskvelFemale) raskvelChickAI();
	else if(aggressor is RaskvelMale) raskGangAI();
	else if(aggressor is SexBot) sexbotAI();
	else if(aggressor is GrayGoo) grayGooAI();
	else if(aggressor is LapinaraFemale) lapinaraAI();
	else if(aggressor is SydianMale) sydianMaleAI();
	else if(aggressor is HandSoBot) firewallAI();
	else if(aggressor is PhoenixPirates) phoenixPiratesAI();
	else if(aggressor is GunTurrets) tamtamtamtamtamtamAI();
	else if(aggressor is RocketTurrets) rocketPodAI();
	else if(aggressor is CaptainKhorganMech) khorganSuitAI();
	else if(aggressor is CaptainKhorgan) actualKhorganAI();
	else if(aggressor is Kaska) kaskaFightAI();
	else if (aggressor is MaidenVanae || aggressor is HuntressVanae) vanaeAI();
	else if (aggressor is SecurityDroids) securityDroidAI();
	else if (aggressor is GrayPrime) grayPrimeAI();
	else if (aggressor is GigaGoo) gigaGooAI();
	else if (aggressor is Varmint) varmintAI();
	else if (aggressor is Shade) shadeAI();
	else if (aggressor is Kara) karaAI();
	else if (aggressor is Cockvine) adultCockvineAI();
	else if (aggressor is NyreaAlpha) alphaNyreaAI();
	else if (aggressor is NyreaBeta) betaNyreaAI();
	else if (aggressor is FrogGirl) frogGirlAI();
	else if (aggressor is WetraHound) wetraHoundAI();
	else if (aggressor is WetraxxelBrawler) wetraxxelBrawlerAI();
	else if (aggressor is MyrInfectedFemale) infectedMyrAI();
	else if (aggressor is DoctorLash) docLashAI();
	else enemyAttack(aggressor);
}
public function victoryRouting():void 
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
	else if(foes[0] is RaskvelMale)
	{
		victoryVsRaskGang();
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
	else if (foes[0] is GunTurrets)
	{
		tamtamGetsPunkedByPCs();
	}
	else if (foes[0] is RocketTurrets)
	{
		pcBeatsRocketPods();
	}
	else if(foes[0] is CaptainKhorganMech)
	{
		victoriousVsCaptainOrcButt();
	}
	else if(foes[0] is CaptainKhorgan)
	{
		youBeatUpAnOrcWaytoGo();
	}
	else if(foes[0] is Kaska)
	{
		defeatKaska();
	}
	else if (foes[0] is MaidenVanae || foes[0] is HuntressVanae)
	{
		vanaePCVictory();
	}
	else if (foes[0] is SecurityDroids)
	{
		victoryOverSecurityDroid();
	}
	else if (foes[0] is GrayPrime)
	{
		victoryOverGrayPrime();
	}
	else if (foes[0] is GigaGoo)
	{
		victoryOverGigaGoo();
	}
	else if (foes[0] is Varmint)
	{
		pcVictoryVsVarmints();
	}
	else if(foes[0] is Shade)
	{
		// PC + Kara defeat Shade
		pcAndKaraBeatShade();
	}
	else if(foes[0] is Kara)
	{
		//PC + Shade defeat Kara
		pcAndShadeBeatKara();
	}
	else if (foes[0] is Cockvine)
	{
		adultCockvinePCVictory();
	}
	else if (foes[0] is NyreaAlpha || foes[0] is NyreaBeta)
	{
		pcVictoryOverNyrea();
	}
	else if(foes[0] is FrogGirl)
	{
		victoryAgainstTheFrogs();
	}
	else if (foes[0] is WetraHound)
	{
		wetraHoundPCVictory();
	}
	else if (foes[0] is WetraxxelBrawler)
	{
		wetraxxelBrawlerPCVictory();
	}
	else if (foes[0] is MyrInfectedFemale)
	{
		winVsInfectedMyr();
	}
	else if(foes[0] is DoctorLash)
	{
		winVsDoctorLash();
	}
	else genericVictory();
}

public function defeatRouting():void 
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
	else if(foes[0] is RaskvelMale)
	{
		lossVsRaskGang();
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
	else if (foes[0] is GunTurrets)
	{
		tamtamBadEndPetPooch();
	}
	else if (foes[0] is RocketTurrets)
	{
		pcLosesToRocketPods();
	}
	else if(foes[0] is CaptainKhorganMech)
	{
		loseToCaptainKhorganBadEnd();
	}
	else if(foes[0] is CaptainKhorgan)
	{
		loseToCaptainKhorganBadEnd();
	}
	else if(foes[0] is Kaska)
	{
		defeatedByKaska();
	}
	else if (foes[0] is MaidenVanae)
	{
		vanaeMaidenPCDefeat();
	}
	else if (foes[0] is HuntressVanae)
	{
		vanaeHuntressPCDefeat();
	}
	else if (foes[0] is SecurityDroids)
	{
		lossToSecurityDroid();
	}
	else if (foes[0] is GrayPrime)
	{
		lossToGrayPrime();
	}
	else if (foes[0] is GigaGoo)
	{
		loseToGigaGoo();
	}
	else if (foes[0] is Varmint)
	{
		pcLosesToVarmint();
	}
	else if(foes[0] is Shade)
	{
		//PC + Kara Defeated
		loseWithKaraYouSlut()
	}
	else if(foes[0] is Kara)
	{
		//PC + Shade Defeated
		pcAndShadeDefeated();
	}
	else if (foes[0] is Cockvine)
	{
		if (pc.hasCock() || pc.hasVagina())
			adultCockvinePCLoses();
		else
			adultCockvineHahaFuckYouGenderless(true);
	}
	else if (foes[0] is NyreaAlpha || foes[0] is NyreaBeta)
	{
		pcLossToNyrea();
	}
	else if (foes[0] is FrogGirl) loseAgainstTheFrogs();
	else if (foes[0] is WetraHound) wetraHoundPCLoss();
	else if (foes[0] is WetraxxelBrawler) wetraxxelBrawlerPCLoss();
	else if (foes[0] is MyrInfectedFemale)
	{
		loseToInfectedMyrYouSubbieSloot();
	}
	else if(foes[0] is DoctorLash)
	{
		loseToDoctorLash();
	}
	else {
		output("You lost!  You rouse yourself after an hour and a half, quite bloodied.");
		processTime(90);
		genericLoss();
	}
}

public function genericLoss():void {
	StatTracking.track("combat/losses");
	pc.removeStatusEffect("Round");
	trace("GENERIC LOSS");
	pc.clearCombatStatuses();
	resetNPCBarStates();
	trace("LOSS DONE");
	this.clearMenu();
	if (StatTracking.getStat("combat/wins") == 0 && StatTracking.getStat("combat/losses") == 3)
	{
		this.addButton(0,"Next",helpBadPCsOut);
	}
	else if (StatTracking.getStat("combat/wins") == 0 && StatTracking.getStat("combat/losses") == 5)
	{
		this.addButton(0,"Next",helpReallyBadPCsOut);
	}
	else if (pc.level == 1 && (foes[0] is NaleenMale || foes[0] is Naleen || foes[0] is HuntressVanae || foes[0] is MaidenVanae)) addButton(0,"Next",helpDumbPCsOut);
	else this.addButton(0,"Next",mainGameMenu);
}

public function helpReallyBadPCsOut():void
{
	clearOutput();
	showName("T.I.T.S.\nHELP")
	output("(Are you having difficulty winning fights? If so, select yes for a minor statistical boost to your combat prowess.)");
	clearMenu();
	addButton(0,"Boost Me",boostMeCaptain);
	addButton(1,"No",mainGameMenu);
}
public function boostMeCaptain():void
{
	pc.physique(1);
	pc.reflexes(1);
	pc.aim(1);
	pc.intelligence(1);
	pc.willpower(1);
	pc.HP(pc.HPMax());
	pc.energy(pc.energyMax());
	mainGameMenu();
}

public function helpBadPCsOut():void
{
	clearOutput();
	showName("T.I.T.S.\nHELP")
	output("(If you're struggling with combat difficulty, consider accessing <b>easy mode</b>. Easy mode reduces all damage (both normal and lust) by 50%. You can turn it on at any time by bringing up the menu and entering the options submenu.\n\nThe menu button is located in the bottom left of the interface - the three horizontal lines. It has been highlighted for convenience.");
	userInterface.mainMenuButton.Glow();
	output("\n\nAdditionally, remember that you should have at least one class ability to use as well as tease attacks. Several melee weapons are also available in Esbeth can be purchased for a reasonable amount of money - if you'd like a little extra punch.)");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function helpDumbPCsOut():void
{
	clearOutput();
	showName("T.I.T.S.\nHELP")
	output("(That foe was unsuitable for a character of your level. Consider taking the northern path out of Esbeth until after you have reached level two or three.)");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function genericVictory():void 
{
	StatTracking.track("combat/wins");
	pc.clearCombatStatuses();
	resetNPCBarStates();
	getCombatPrizes();
}

public function stealthCombatEnd():void
{
	// Mimbranes could hook here to convert from the Combat version of their Venom attack to their Non-combat version?
	// I think this is overall too complicated though, and just ignore the whole combat/noncombat distinction.
	pc.removeStatusEffect("Round");
	pc.clearCombatStatuses();
}

public function combatOver():void 
{
	pc.removeStatusEffect("Round");
	pc.clearCombatStatuses();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}


public function getCombatPrizes(newScreen:Boolean = false):void 
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
			addToList(foundLootItems[x].description + " (x" + foundLootItems[x].quantity + ")");
		}
		output(formatList() + "\n\n");
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

public function startCombatLight():void
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
	else if(foes[0] is FrogGirl) showFrogGirl();
}

public function startCombat(encounter:String):void 
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
		case "RaskvelMale":
			chars["RASKVEL_MALE"].prepForCombat();
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
		case "auto-turrets":
			chars["AUTOTURRETS"].prepForCombat();
			break;
		case "rocket pods":
			chars["ROCKETPODS"].prepForCombat();
			break;
		case "khorgan mechfight":
			chars["CAPTAINKHORGANMECH"].prepForCombat();
			break;
		case "khorgan":
			chars["CAPTAINKHORGAN"].prepForCombat();
			break;
		case "Kaska":
			chars["KASKA"].prepForCombat();
			break;
		case "HUNTRESS_VANAE":
			chars["HUNTRESS_VANAE"].prepForCombat();
			break;
		case "MAIDEN_VANAE":
			chars["MAIDEN_VANAE"].prepForCombat();
			break;
		case "securitydroids":
			chars["SECURITYDROIDS"].prepForCombat();
			break;
		case "grayprime":
			chars["GRAYPRIME"].prepForCombat();
			break;
		case "gigagoo":
			chars["GIGAGOO"].prepForCombat();
			break;
		case "varmint":
			chars["VARMINT"].prepForCombat();
			break;
		case "Kara":
			chars["KARA"].prepForCombat();
			buildShadeAndKaraFight(false);
			break;
		case "Shade":
			chars["SHADE"].prepForCombat();
			buildShadeAndKaraFight(true);
			break;
		case "Cockvine":
			chars["COCKVINE"].prepForCombat();
			break;
		case "Nyrea Alpha":
			chars["NYREA ALPHA"].prepForCombat();
			break;
		case "Nyrea Beta":
			chars["NYREA BETA"].prepForCombat();
			break;
		case "wetrahound":
			chars["WETRA HOUND"].prepForCombat();
			break;
		case "wetraxxelbrawler":
			chars["WETRAXXEL BRAWLER"].prepForCombat();
			break;
		case "infected myr":
			chars["INFECTED MYR FEMALE"].prepForCombat();
			break;
		case "Dr. Lash":
			chars["DRLASH"].prepForCombat();
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

public function runAway():void {
	clearOutput();
	output("You attempt to flee from your opponent");
	if(foes[0].plural || foes.length > 1) output("s");
	output("! ")
	//Autofail conditions first!
	if(pc.isImmobilized()) {
		output("You cannot run while you are immobilized!\n");
		processCombat();
	}
	else if(pc.hasStatusEffect("Flee Disabled") || foes[0].hasStatusEffect("Flee Disabled")) {
		output("<b>You cannot escape from this fight!</b>\n");
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
		//Raise difficulty for having awkwardly huge genitalia/boobs sometime! TODO!
		if(pc.ballDiameter() >= 9) difficulty++;
		if(pc.ballDiameter() >= 18) difficulty++;

		//Cap it
		if(difficulty > 5) difficulty = 5;

		//Lower difficulty for flight if enemy cant!
		if(pc.canFly() && (!foes[0].canFly() || foes[0].isImmobilized())) difficulty--;
		//Lower difficulty for immobilized foe
		if(foes[0].isImmobilized()) difficulty--;
		//Easy mode is magic!
		if(easy)
		{
			if(difficulty > 0) difficulty--;
			if(difficulty > 0) difficulty--;
			if(difficulty > 0) difficulty--;
		}		

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
		if (rand(100) + 1 <= difficulty) {
			if (foes[0] is Cockvine)
			{
				adultCockvinePCEscapes();
				leaveCombat();
				return;
			}
			if (pc.canFly()) 
			{
				if (pc.legCount == 1) output("Your [pc.foot] leaves");
				else output("Your [pc.feet] leave");
				output(" the ground as you fly away, leaving the fight behind.");
			}
			else output("You manage to leave the fight behind you.")
			processTime(8);
			leaveCombat();
		}
		else {
			output(" It doesn't work!\n");
			processCombat();
		}

	}
}

public function leaveCombat():void
{
	pc.removeStatusEffect("Round");
	pc.clearCombatStatuses();
	userInterface.hideNPCStats();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function fantasize():void {
	clearOutput();
	output("You decide you'd rather fantasize than fight back at this point. Why bother when your enem");
	if(foes[0].plural || foes.length > 1) output("ies are");
	else output("y is");
	output(" so alluring?\n");
	pc.lust(20+rand(20));
	processCombat();
}
public function wait():void {
	clearOutput();
	output("You choose not to act.\n");
	if (pc.hasStatusEffect("Grappled"))
	{
		if (foes[0] is Kaska) doNothingWhileTittyGrappled();
		else if (foes[0] is GrayPrime) grayPrimeFailEscape();
		else if (foes[0] is MaidenVanae || foes[0] is HuntressVanae) vanaeWaitWhilstGrappled();
	}
	processCombat();
}


//creature.sexualPreferences.getPref(SEXPREF_flag) will give you the direct set value; 2, 1, -1 or -2. Or 0 if the preference isn't set.
//creature.sexualPreferences.getAveragePrefScore(SEXPREF_flag1, SEXPREF_flag2, ..., SEXPREF_flagn) will give you the *average* score of the provided flags.
public function tease(target:Creature, part:String = "chest"):void {
	var damage:Number = 0;
	var teaseCount:Number = 0;
	var randomizer:Number = (rand(31)+ 85)/100;
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
	else if(part == "squirt")
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
		squirtTeaseText(target);
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
		if(pc.hasVagina() && pc.driestVaginalWetness() <= 1 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS) > 0) 
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS);
		if (!pc.hasCock() && !pc.hasVagina() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NEUTER) > 0)
			likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NEUTER);
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
	if(pc.hasStatusEffect("Sex On a Meteor") || pc.hasStatusEffect("Tallavarian Tingler")) totalFactor *= 1.5;
	//Celise ignores ALL THIS SHIT!
	if(!(target is Celise)) 
	{
		//Misc Bonuses
		var bonus:int = 0;
		if(pc.hasPerk("Pheromone Cloud")) bonus = 1;
		if(part == "squirt") bonus += 2;

		var sweatyBonus:int = 0;
		if(pc.hasStatusEffect("Sweaty") && target.hasPerk("Likes_Sweaty")) 
		{
			//-5 per level normally, so add twice that since we flippin it'
			sweatyBonus = pc.statusEffectv1("Sweaty") * 10;
			//Furries dont benefit quite as much.
			if(pc.hasFur()) sweatyBonus = pc.statusEffectv1("Sweaty") * 5;
		}

		//Does the enemy resist?
		if(target.willpower()/2 + rand(20) + 1 > pc.level * 2.5 * totalFactor + 10 + teaseCount/10 + pc.sexiness() + bonus + sweatyBonus || target.isLustImmune == true)
		{
			if(target is HandSoBot)
			{
				output("\n\n<i>“An attempt to confuse and overwhelm an enemy with an overt display of sexual dominance,”</i> says So. She sounds genuinely interested. <i>“An unorthodox but effective strategy in many known organic cultures’ approach to war. I was unaware sentients of a human upbringing had any experience of such a thing, however. Perhaps that explains why you are attempting it against a foe that cannot in any way feel desire.”</i>\n");
			}
			else if(target.isLustImmune == true) 
			{
				output("\n<b>" + target.capitalA + target.short + " ");
				if(target.plural) output("don't");
				else output("doesn't");
				output(" seem to care to care for your eroticly-charged display. (0)</b>\n");
			}
			else if(part == "squirt") 
			{
				output("\nYour milk goes wide. (0)\n");
				teaseSkillUp(part);
			}
			else if (target is HuntressVanae || target is MaidenVanae)
			{
				output("\n");
				output(teaseReactions(0, target));
				output(" (0)\n");
				teaseSkillUp(part);
			}
			else if (target is WetraHound)
			{
				output("\n");
				wetraHoundAnimalIntellect();
				output(" (0)\n");
				teaseSkillUp(part);
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
			damage += 10 * (teaseCount/100 + 1) + pc.sexiness()/2 + sweatyBonus/2;
			if(part == "squirt") damage += 5;
			//Any perks or shit go below here.
			if(pc.hasPerk("Pheromone Cloud")) damage += 1+rand(4);
			//Apply randomization
			damage *= randomizer;
			//Base cap dependant on level:
			if(damage > 15 + pc.level*2) damage = 15 + pc.level*2;

			//Apply like adjustments
			damage *= totalFactor;
			
			// Resistances
			damage = (1 - (target.getLustResistances().tease.damageValue / 100)) * damage;
			
			//Cap possible damage.
			if(damage > 25 + pc.level*2) damage = 25 + pc.level*2;
			
			//Prevent lust from being over total damage.
			if(target.lust() + damage > target.lustMax()) damage = target.lustMax() - target.lust();
			damage = Math.ceil(damage);

			output("\n");
			if(part == "squirt") 
			{
				if(target.plural) output(target.capitalA + target.short + " are splattered with your [pc.milk], unable to get it off. All of a sudden, their faces begin to flush, and they look quite aroused.");
				else output(target.capitalA + target.short + " is splattered with your [pc.milk], unable to get it off. All of a sudden, " + target.mfn("his","her","its") + " " + target.face() + " begins to flush, and " + target.mfn("he","she","it") + " looks quite aroused.");
			}
			else output(teaseReactions(damage,target));
			target.lust(damage);
			output(" ("+ damage + ")\n");
			teaseSkillUp(part);
			if(foes[0] is MyrInfectedFemale && damage >= 10)
			{
				output("<b>Your teasing has the poor girl in a shuddering mess as she tries to regain control of her lust addled nerves.</b>\n");
				var stunDur:int = 1 + rand(2);
				foes[0].createStatusEffect("Stunned",stunDur,0,0,0,false,"Stun","Cannot take action!",true,0);
				foes[0].createStatusEffect("Lust Stunned",stunDur,0,0,0,true,"Stun","Cannot take action!",true,0);
			}
		}
	}
	else output("\n");
	
	playerMimbraneSpitAttack();
	processCombat();
}

public function teaseSkillUp(part:String):void {
	if(part == "crotch") flags["TIMES_CROTCH_TEASED"]++;
	else if(part == "butt") flags["TIMES_BUTT_TEASED"]++;
	else if(part == "hips") flags["TIMES_HIPS_TEASED"]++;
	else if(part == "chest") flags["TIMES_CHEST_TEASED"]++;
	else if(part == "squirt") flags["TIMES_CHEST_TEASED"]++;
}

public function teaseReactions(damage:Number,target:Creature):String {
	var buffer:String = "";
	var textRands:Array = [];
	if (target is HuntressVanae)
	{
		if (damage == 0)
		{
			textRands = [
				"The blind huntress snorts at your display and makes a quick jab at you with her spear. You leap out of the way just in time. <i>“All you're doing is leaving yourself open, " + ((pc.zilScore() >= 4 || pc.naleenScore() >= 5) ? "[pc.race]" : "outsider") + "!”</i> she exclaims.",
				"You utterly fail to entice the huntress. You barely dodge an attack that causes you to cease your efforts. You're going to have to do better, or try something else...",
				"The alien huntress seems to be getting into it, moving towards you... only to swipe her spear at your head. You barely duck in time. Seems she didn't go for it at all!"
			];
			
			buffer = textRands[rand(textRands.length)];
		}
		else if (damage < 4) buffer = "The busty huntress moans and begins cupping one of her [monster.breasts], clearly titillated by your performance.";
		else if (damage < 10) buffer = "Your stacked opponent huskily moans and slips a webbed hand between her thighs, lewdly stroking her slit. She snaps out of it a few seconds later, biting her lip.";
		else if (damage < 20) buffer = "The alien huntress clenches her thighs together as she watches you, rubbing them together as she desperately tries to hide her arousal. Clearly you're having an effect on her!"
		else buffer = "The busty amazon parts her thighs and begins to stroke her twin clits to your lewd display, unable to stop herself. A few seconds later she jerks her webbed hand back, flushing wildly.";
	}
	else if (target is MaidenVanae)
	{
		if (damage == 0)
		{
			textRands = [
				"The young alien huntress jabs at you with her spear, forcing you to leap out of the way. <i>“Hey, this may be my first time, but I'm not </i>that<i> easy!”</i> she exclaims.",
				"The virgin huntress quirks her head, clearly baffled by your actions. It seems you utterly failed to entice her....",
				"The alien huntress fans her face with a webbed hand and moves closer to you. <i>“Oooh, I think I'm getting the vapors... </i>psyche<i>!”</i>",
			];
			
			buffer = textRands[rand(textRands.length)];
		}
		else if (damage < 4) buffer = "The virgin huntress blushes and begins eagerly touching one of her [vanaeMaiden.nipples]. She's clearly aroused by your performance.";
		else if (damage < 10) buffer = "The virgin huntress lets out a little moan and slips one of her webbed hands between her thighs. She awkwardly teases her glistening slit, getting all worked up.";
		else if (damage < 20) buffer = "The young alien huntress places a hand over her loins and rubs her thighs together. She's desperately trying to hide her rather obvious arousal. The sweet scent of her arousal fills the air.";
		else buffer = "The wispy amazon parts her thighs and begins to stroke her twin clits to your lewd display, unable to stop herself. A few seconds later she jerks her webbed back, flushing wildly.";
	}
	else if (target.plural) {
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

public function squirtTeaseText(target:Creature):void {
	output("You grab the sides of your [pc.breasts]. With a single squeeze, you squirt a stream of [pc.milk] at your opponent!");
	pc.milked(25);
}

public function crotchTeaseText(target:Creature):void {
	var temp:int = 0;
	var choices:Array = new Array();
	if(pc.hasCock()) {
		if(pc.isTaur() && pc.cockTotal(GLOBAL.TYPE_EQUINE) > 0) choices[choices.length] = 4;
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
	//Reqs: PC has a vagina with maximum wetness
	if(pc.hasVagina() && pc.wettestVaginalWetness() >= 5) choices.push(6);
	//Reqs: PC has a cock with a knot
	if(pc.hasAKnot()) choices.push(7);
	//Reqs: PC has a cock with foreskin
	if(pc.hasACockFlag(GLOBAL.FLAG_FORESKINNED)) choices.push(8);
	//Reqs: PC has a cock with a flare
	if(pc.hasACockFlag(GLOBAL.FLAG_FLARED)) choices.push(9);
	//Reqs: PC has a cock with a medial ring
	if(pc.hasCock(GLOBAL.TYPE_EQUINE)) choices.push(10);
	//Reqs: PC has a dick, PC has extremely high cum volume
	if(pc.hasCock() && pc.cumQ() >= 1000) choices.push(11);
	//Reqs: Crotch skill 50+
	if(flags["TIMES_CROTCH_TEASED"] >= 50 && pc.hasCock() || pc.hasVagina()) choices.push(12);
	//Reqs: PC is in combat with a zil male, zil female, or the dual zil when meeting Penny, PC has a zil vagina
	if((foes[0] is ZilFemale || foes[0] is ZilMale || foes[0] is ZilPack) && pc.hasVagina(GLOBAL.TYPE_BEE)) choices.push(13);
	//Reqs: PC has at least 3 vaginal wetness
	if(pc.hasVagina() && pc.wettestVaginalWetness() >= 3) choices.push(14);

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
		else output("You coyly gesture to your groin");
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
		else output("  You smile and pull apart your lower lips to expose your [pc.clits], giving the perfect view.");
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
	//Reqs: PC has at least 3 vaginal wetness
	else if(select == 14)
	{
		//PC has clothes or a lower undergarment on: 
		if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] to reveal");
		else output("You direct your foe’s attention to");
		output(" [pc.oneVagina], already dripping wet. A brush of your fingers across your folds leaves them glistening with [pc.girlCumVisc] fluid, and you give your target a grin before popping your fingers into your mouth, working your [pc.tongue] around the intruding digits to lick up every last [pc.girlCumFlavor] drop.");
		if ((pc.armor.shortName == "" && pc.lowerUndergarment.shortName != "") || (pc.armor.shortName != "" && pc.lowerUndergarment.shortName == ""))
		{
			output(" You close back up your [pc.lowerGarments], a drip of [pc.girlCum] leaving a dark stain");
			if (pc.legCount > 1) output(" between your legs.");
			else output(" on your crotch.");
		}
		//PC has both undergarments and clothes:
		else if (pc.isCrotchGarbed()) output(" You close back up your [pc.lowerGarments], flushing slightly at the sensation of the fluid trapped within your [pc.lowerGarment].");
		//PC is nude or only has a bra:
		else 
		{
			output(" You return your attention to your foe, stray [pc.girlCumNoun]");
			if(pc.legCount > 1) 
			{
				output(" dripping to the ground between your [pc.legs]");
				//PC has wetness 5:
				if(pc.wettestVaginalWetness() >= 5) output(" in a steady stream of droplets");
			}
			//PC has one leg such as a naga tail:
			else 
			{
				output(" winding a");
				if(pc.wettestVaginalWetness() >= 3) output(" trail");
				else if(pc.wettestVaginalWetness() >= 4) output(" stream");
				else output(" river");
				output(" down your [pc.legOrLegs]");
			}
			output(".");
		}
	}
	//Reqs: PC has a vagina with maximum wetness
	else if(select == 6)
	{
		if(pc.isCrotchGarbed()) output("You slip off your [pc.lowerGarments]");
		else output("You only need to face your [pc.crotch] towards your enemy");
		output(" and cock your hips to one side, letting the [pc.girlCum] gushing from between your thighs speak for itself. You casually drop a hand to between your [pc.thighs] and sample a bit of the river, popping your fingers into your mouth to savor the [pc.girlCumFlavor] treat.");
		//Skill 50+:
		if(flags["TIMES_CROTCH_TEASED"] > 50) output(" You dip your fingers into the [pc.girlCumNoun] again, this time holding out your fingers towards your foe invitingly before again licking yourself clean.  <i>“Imagine what it’s like when I’m actually cumming.”</i>");
		output(" You give your foe a heady grin as you ");
		if(pc.isCrotchGarbed()) output("pull your [pc.lowerGarments] back up, producing a wet sound as your endless flow is plugged back up - for now.");
		else output("return your attention to the fight, [pc.girlCumColor] still streaming freely down your [pc.legOrLegs].");
	}
	//Reqs: PC has a cock with a knot
	else if(select == 7)
	{
		//Clothed: 
		if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments]");
		else
		{
			if(!pc.isTaur()) output("You stand with your");
			else output("You pose with your");
			if(pc.legCount > 1) output(" [pc.legs] apart");
			else output(" crotch out");
		}
		output(" and let your [pc.cocks]");
		if (!pc.hasStatusEffect("Genital Slit")) output(" hang out");
		else output(" slide out");
		
		var knottedSheath:Boolean = false;
		for(var sheathCounter: int = 0; sheathCounter < pc.totalCocks(); sheathCounter++)
		{
			if(pc.hasSheath(sheathCounter) && pc.hasKnot(sheathCounter)) knottedSheath = true;
		}
		if(knottedSheath) 
		{
			output(", slipping out of ");
			if(pc.hasSheaths()) output("their sheaths");
			else output("its sheath");
		}
		//PC has a genital slit:
		else if(pc.hasStatusEffect("Genital Slit")) 
		{
			output(", standing proudly from the slit ");
			if(pc.cockTotal() == 1) output("it");
			else output("they");
			output(" normally hide within");
		}
		output(". You wrap a hand around your knot and give it a squeeze, showing off its size. <i>“Think that [enemy.vagOrAss] of yours can take the whole thing?”</i>");
	}
	//Reqs: PC has a cock with foreskin
	//FLAG_FORESKINNED
	else if(select == 8)
	{
		temp = -1;
		for(var foreskinCounter:int = 0; foreskinCounter < pc.totalCocks(); foreskinCounter++)
		{
			if(temp == -1 && pc.cocks[foreskinCounter].hasFlag(GLOBAL.FLAG_FORESKINNED)) temp = foreskinCounter;
		}
		if(temp == -1)
		{
			output("FORESKIN ERROR: 8===D");
		}
		//Clothed:
		if(pc.isCrotchGarbed())
		{
			output("You free your [pc.cocks] from ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" confinement");
		}
		else
		{
			output("You draw your foe’s attention to your [pc.cocks]");
		}
		output(", taking hold of your foreskin between two fingers and lightly tugging on it to show off its stretchy length.");
		if(flags["TIMES_CROTCH_TEASED"] > 25)
		{
			output(" You angle your tugs a little to one side, making a slow circle that reveals the silhouette of your [pc.cockHead " + temp + "] trapped within.");
		}
		if(flags["TIMES_CROTCH_TEASED"] > 50) output(" Getting a little creative, you slip one of your fingers inside your exotic covering to stroke the [pc.cockHead " + temp + "] within and draw out a little of [pc.cumVisc] preseed before you pinch the base of your foreskin and draw your fingers upward, causing a little bit of [pc.cumColor] fluid to bubble from the opening of your shroud.");
		output(" After a few moments, ");
		if(pc.isCrotchGarbed()) output("you close up your [pc.lowerGarments]");
		else output("you let go of yourself");
		output(" and return your eyes to the fight.");
	}
	//Reqs: PC has a cock with a flare
	else if(select == 9)
	{
		temp = -1;
		for(var flareCounter:int = 0; flareCounter < pc.totalCocks(); flareCounter++)
		{
			if(temp == -1 && pc.cocks[flareCounter].hasFlag(GLOBAL.FLAG_FLARED)) temp = flareCounter;
		}
		if(temp == -1)
		{
			output("FLARE ERROR: 8===D");
		}
		//Clothed:
		if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] and");
		else output("You");
		output(" draw attention to [pc.oneCock], your flare already getting nice and wide. Your finger traces around the edge and underside of the thick ring, before coming up and over to brush the [pc.cockHead " + temp + "] above it. A bit of [pc.cum] comes away with your fingertip, showing off just how ready your flare is to be plunged inside the nearest willing hole... if they can take it.  The thought of it makes you smirk as you ");
		if(pc.isCrotchGarbed()) output("cover up");
		else output("return to attention");
		output(", ready to continue.");
	}
	//Reqs: PC has a cock with a medial ring
	//if(pc.hasCock(GLOBAL.TYPE_EQUINE))
	else if(select == 10)
	{
		temp = -1;
		for(var ringCounter:int = 0; ringCounter < pc.totalCocks(); ringCounter++)
		{
			if(temp == -1 && pc.cocks[ringCounter].cType == GLOBAL.TYPE_EQUINE) temp = ringCounter;
		}
		if(temp == -1)
		{
			output("MEDIAL RING ERROR: 8===D");
		}
		//Clothed:
		if(pc.isCrotchGarbed()) output("As your [pc.lowerGarments] come away from");
		else output("As you draw your foe’s attention to");
		output(" your [pc.cocks], you opt to focus on a different part of your shaft from the usual.  Your hand goes up to your [pc.cockHead " + temp + "], but soon slides halfway down your shaft to the masculine ring wrapped around the center of your dick.  Your finger traces around its edge, pressing inward just enough to showcase the slightly spongy texture of your all-natural ribbing.  You pull your hand away");
		if(pc.isCrotchGarbed()) output(" and cover up.");
		else output(" and let your cock relax.");
	}
	//Reqs: PC has a dick, PC has extremely high cum volume
	else if(select == 11)
	{
		//Clothed:
		if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments]");
		else output("You direct your foe’s attention to between your thighs");
		if(pc.hasSheath(0)) output(" and let [pc.oneCock] out of its sheath");
		else if(pc.hasStatusEffect("Genital Slit")) output(" and let [pc.oneCock] slip out of your genital slit");
		output(", a little bit of pre-cum already bubbling from your [pc.cockHead]. You give yourself a light handjob, enough to make your [pc.cumVisc] fluid squirt with volume comparable to a normal human’s full orgasm. <i>“My [pc.balls] can barely keep all this [pc.cumNoun] in.... Think your [enemy.vagOrAss] can do any better?”</i> You let go of your cum-packed cock");
		if(pc.isCrotchGarbed()) output(" and cover up");
		output(", ready to resume the fight.");
	}
	//Reqs: Crotch skill 50+
	else if(select == 12)
	{
		//Clothed: 
		if(pc.isCrotchGarbed()) output("You slip off your [pc.lowerGarments]");
		else output("You take a moment to relish being uncovered");
		output(" and let your hands descend to your [pc.crotch]. ");
		if(pc.hasCock()) output("One of your hands takes [pc.oneCock] near the tip, thumb circling the [pc.cockHead]. ");
		if(pc.hasVagina() && !pc.hasCock())
		{
			output("One of your hands");
		}
		else if(pc.hasVagina()) output("Your other hand");
		if(pc.hasVagina()) output(" opens [pc.oneVagina], giving your foe a good view of the glorious [pc.vaginaColor] interior. ");
		output("After a bit, ");
		if(pc.hasCock()) output("[pc.cum] begins to bubble from your dick");
		if(pc.hasVagina() && pc.hasCock()) output(" while");
		if(pc.hasVagina()) output(" [pc.girlCum] gleams fresh in your cunt");
		output(", and you sample your ");
		if(!(pc.hasCock() && pc.hasVagina())) output("fluid");
		else output("fluids");
		output(" to take a taste.");

		output("\n\n<i>“");
		if(pc.hasCock() && pc.hasVagina()) output("[pc.CumFlavor] and [pc.girlCumFlavor], two great tastes that go great together. Herm " + pc.mf("boys","girls") + " really do get the best of everything.");
		//Male: 
		else if(pc.hasCock()) output("Sure you don’t want some of this [pc.cumNoun] for yourself? It’s nice and [pc.cumFlavor], " + pc.mf("a real man’s spunk","perfect for a “girl” like me") + ".");
		else if(pc.hasVagina()) 
		{
			output("Mmm, can’t get enough of that all-natural [pc.girlCumFlavor] taste. Come get some");
			if(pc.wettestVaginalWetness() >= 3) output(". I’ve got plenty to go around");
			output(".");
		}
		output("”</i>");

		output("\n\nYou don’t give your foe much longer to watch your self-serve taste test before you ");
		if(pc.isCrotchGarbed()) output(" cover back up");
		else 
		{
			output(" return your attention to the fight");
			if(pc.hasCock())
			{
				if(pc.hasSheath() || pc.hasStatusEffect("Genital Slit")) output(", your [pc.cock] returning to its container");
			}
		}
		output(", but they can still see vestiges of ");
		if(pc.hasCock()) output("[pc.cumColor]");
		if(pc.hasVagina() && pc.hasCock()) output(" and ");
		if(pc.hasVagina()) output("[pc.girlCumColor]");
		output(" on your lips.");
	}
	//Reqs: PC is in combat with a zil male, zil female, or the dual zil when meeting Penny, PC has a zil vagina
	else if(select == 13)
	{
		//PC is relevantly clothed: 
		if(pc.isCrotchGarbed()) output("You slip your [pc.lowerGarments] down just enough to reveal");
		else output("You adjust your thighs to highlight");
		output(" where your [pc.skinFurScalesColor] starts to give way to the dusky shade of [pc.oneVagina], drawing your target’s gaze.");
		output("\n\n<i>“Surprised? When I saw ");
		if(foes[0] is ZilFemale) output("you girls");
		else output("your zil girls");
		output(" with those exotic pussies, I just had to try it for myself.”</i>");
		//clothed:
		if(pc.isCrotchGarbed()) output(" Your [pc.lowerGarment] comes down the rest of the way");
		else output(" You move your thighs away");
		output(", allowing you to spread yourself to reveal your [pc.vaginaColor] interior.");
		//[pc.vaginaColor == gold]
		if(pc.vaginas[0].vaginaColor == "gold") 
		{
			output(" <i>“See? Just like ");
			if(foes[0] is ZilFemale)  output("yours");
			else output("the ones you’re used to");
			output(".”</i>");
		}
		else output(" <i>“But I thought another color on the inside would look even nicer.”</i>");
		//[pc.girlCum == honey]
		if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) 
		{
			output("\n\n<i>“I even cum honey now");
			if(pc.vaginas[0].wetness() >= 3) output(", a lot more than most zil even");
			output(".”</i>");
		}
		else 
		{
			output("\n\n<i>“The taste is totally different, though.  So, [pc.girlCumFlavor] compared to what you’re used to, though I bet you’d love it if you tried it.");
			if(pc.vaginas[0].wetness() >= 3) output(" There's a lot, so you’d have to make sure to drink up every drop.");
			output("”</i>");
		}
		output("\n\nYou allow your fingers to rub up and down across your folds, showcasing it for your foe.  <i>“I’ve gotta say, I’m really loving having a honeypot like this... maybe I’ll give you a taste, if you’re a good " + foes[0].mf("boy","girl","...thing") + ".”</i>");
		//Clothed:
		if(pc.isCrotchGarbed()) output(" You close up your [pc.lowerGarments]");
		else output(" You adjust your thighs back to their normal stance");
		output(" as you say this, taking a moment to suck your fingers clean with a wink.");
	}
}

public function buttTeaseText():void {
	var choices:Array = new Array();
	choices.push(3);
	if(flags["TIMES_BUTT_TEASED"] > 75) choices.push(0);
	if(flags["TIMES_BUTT_TEASED"] > 75 && pc.armor.shortName != "") choices.push(1);
	if(pc.analCapacity() >= 450) choices.push(2);
	if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) choices.push(4);
	if(pc.hasCuntTail()) choices.push(5);
	if(pc.hasCuntTail() && flags["TIMES_BUTT_TEASED"] > 25) choices.push(6);
	if(pc.hasCockTail()) choices.push(7);
	//Reqs: PC is clothed, PC has a cock and either a trap-pouch, internal gonads or no balls, PC has no vagina, PC is feminine-looking
	if(pc.isCrotchGarbed() && pc.hasCock() && (pc.balls == 0 || pc.hasStatusEffect("Uniball")) && !pc.hasVagina() && pc.femininity >= 60) choices.push(8);
	if(pc.hasVagina() && pc.wettestVaginalWetness() >= 3) choices.push(9);

	//pick our winner!
	var select:int = choices[rand(choices.length)];

	//75+
	if(select == 0)
	{
		output("Turning away at an opportune moment, you slip down your clothes and reach back, slapping your [pc.butt] into a bounce before shaking it for " + foes[0].a + foes[0].short + ". Your technique has grown impeccable, and you bounce your [pc.butt] masterfully, even reaching back and spreading your cheeks, giving " + foes[0].a + foes[0].short + " an excellent view of your [pc.asshole]");
		if(pc.hasVagina() && pc.balls > 0) output(" and [pc.vaginas] and [pc.balls]");
		else if(pc.hasVagina()) output(" and [pc.vaginas]");
		else if(pc.balls > 0) output(" and [pc.balls]");
		output(".");
	}
	//50+
	else if(select == 1)
	{
		output("Swirling away, you find yourself facing away from your enemy. A cunning smile slaps itself across your [pc.face] as you hook your fingers into your " + pc.armor.longName + " and pull down your bottoms to expose your ");
    if(pc.lowerUndergarment.shortName != "") output(pc.lowerUndergarment.longName + " and ");
    output("[pc.butt].");
    if(pc.legCount > 1) output(" Spreading your [pc.legs], y");
    else output(" Y");
    output("ou begin to shake your [pc.butt], bouncing ");
		if(pc.lowerUndergarment.shortName != "") output("in your [pc.lowerUndergarment] ");
		output("and tempting " + foes[0].a + foes[0].short + " with your ");
		if(pc.lowerUndergarment.shortName != "") output("unseen ");
		output("goods. Your ass shaking has gotten faster and more tasteful with all of that practice, and you rock your [pc.butt] as best as you can to show that off.");
	}
	else if(select == 2) output("You quickly strip out of your [pc.armor] and turn around, giving your [pc.butt] a hard slap and showing your enemy the real prize: your [pc.asshole].  With a smirk, you easily plunge your hand inside, burying yourself up to the wrist inside your anus.  You give yourself a quick fisting, watching the enemy over your shoulder while you moan lustily, being sure to give them a good show.  You withdraw your hand and give your ass another sexy spank before readying for combat again.");
	//Reqs: PC has at least one tail with the Fluffy tag
	else if(select == 4)
	{
		output("You turn around and bend over, then raise your [pc.tails], shaking ");
		if(pc.tailCount == 1) output("it");
		else output("them");
		output(" enticingly. <i>“These things are made for touching, you know. So nice and soft...”</i>");
	}
	//Reqs: PC has a cunt-tail
	else if(select == 5)
	{
		output("You");
		if(pc.legCount > 1) output(" reach your hand between your [pc.legs] and");
		output(" grab your [pc.tailgina] then pull it under your waist and up to your stomach, you flick your [pc.tails] to let a bit of fluid drip from it. Giving your opponent a sly look you curl your tail up and take a lick, letting your [pc.tongue] probe the folds of your tail-mounted snatch for a few seconds.");
		if(flags["TIMES_BUTT_TEASED"] > 75 && pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You work your tail itself around a little bit, just enough to show off where it’s bulging around your deep-diving tongue.");
		output(" A thin string of [pc.girlCumVisc] fluid connects your mouth and [pc.oneTailgina] as you pull it away, flashing the moist opening towards your foe for a moment.");
	}
	//Reqs: PC has a cunt-tail, skill >25
	else if(select == 6)
	{
		output("You raise your [pc.tailgina] and point it towards your foe, taking hold of the exotic appendage with both of your hands. Your fingers brush across the opening at its tip, pulling the lips apart");
		if(flags["TIMES_BUTT_TEASED"] < 50) 
		{
			output(" to reveal the slick entrance. A bit of fluid drips from the tip of your [pc.tailgina], wet and ready for mating.");
		}
		else output(" just enough to reveal a bit of the interior.  You take it slow on opening your tailcunt the rest of the way, until you can use two fingers to hold the dripping entrance open, leaving your other hand free to run its fingers over the exotic folds, pressing in just enough to show your foe how slippery soft your tailpussy really is.");
	}
	//Reqs: PC has a cock-tail
	else if(select == 7)
	{
		output("You curl your [pc.cockTail] around to flex it back and forth a bit in front of your foe, showing off the alien endowment you’ve picked up.  You arrange your tail into a spiral shape and then piston it sharply like a coiled spring, making a loud snapping sound from the force of it striking the air.");
	}
	//Reqs: PC is clothed, PC has a cock and either a trap-pouch, internal gonads or no balls, PC has no vagina, PC is feminine-looking
	else if(select == 8)
	{
		output("You pull down your [pc.lowerGarments] as you turn around");
		if(pc.hasStatusEffect("Genital Slit")) output(", carefully tucking your [pc.cocks] inside your genital slit");
		else if(pc.legCount > 1) output(", carefully tucking your [pc.cocks] between your legs");
		output(".");
		//PC has a trap-pouch:
		if(pc.hasStatusEffect("Uniball")) output(" You carefully arrange your [pc.sack] to look like a feminine crease");
		else if(pc.balls == 0) output(" You feel a rush of pleasure");
		output(" as you shake your ass, letting out a girly giggle. You don’t give your foe time to tell what");
		if(pc.legCount > 1) output("’s really between your [pc.legs]");
		else output(" gender you really are");
		output(" before you pull your [pc.lowerGarments] back up and turn back around, giving a sly smile.");
	}
	//Reqs: PC has a vagina with 3+ wetness
	else if(select == 9)
	{
		//Clothed:
		if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] as you");
		else output("You");
		output(" turn and bend over to show off your [pc.butt]");
		if(pc.hasCock()) output(", [pc.cocks],");
		output(" and [pc.vaginas]");
		output(", though your attention goes to the last. You’re practically dripping by this point, as you slowly rub your index finger across the cleft of ");
		if(pc.totalVaginas() > 1) output("one cunny");
		else output("your cunny");
		output(" and stick your thumb inside your [pc.asshole], beginning to lightly finger your backdoor. You pull your fingers away");
		if(pc.isCrotchGarbed()) output(" and slide your [pc.lowerGarments] back into place");
		output(", looking over your shoulder at your foe seductively.");
	}
	else if(select == 3) {
		output("You turn away");
		if(pc.isCrotchGarbed()) output(", slide down your clothing,");
		output(" and bounce your [pc.butt] up and down hypnotically");
		//Big butts = extra text + higher success
		if(pc.buttRating() >= 10) {
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

public function chestTeaseText():void {
	if(pc.biggestTitSize() < 1) {
		if(rand(3) != 0 && pc.tone >= 70)
		{
			//Clothed:
			if(pc.isChestGarbed()) output("Shedding your [pc.upperGarments], you");
			else output("You");
			output(" flex your arms, showing off the bulging biceps.  After a bit of posing");
			output(" you slap your chest with one hand, producing a loud crack of muscle on muscle as your palm meets your iron-hard pectoral.");
			output(" After a good few seconds of showing off,");
			if(pc.isChestGarbed()) output(" you close your [pc.upperGarments] and");
			else output(" you cease your posing");
			output(" return your gaze to the fight.");
		}
		else if(pc.isChestGarbed()) output("You peel open your [pc.upperGarments] to expose your [pc.chest] and [pc.nipples], running a hand up your [pc.skinFurScales] to one as you lock eyes with your target. You make sure that every bit of your musculature is open and on display before you bother to cover back up.");
		else output("Naked as you are, there's nothing you need to do to expose your [pc.chest] and [pc.nipples], and running a hand up your [pc.skinFurScales] only enhances the delicious exposure. You make sure that every bit of your musculature is open and on display before you adopt a less sensual pose.")
	}
	//Titties!
	else {
		var choices:Array = new Array();
		if(pc.milkFullness > 50 && pc.isChestGarbed()) 
		{
			choices.push(0);
			choices.push(0);
			choices.push(0);
		}
		choices.push(1);
		//Reqs: PC is wearing clothes but no bra, PC’s biggest breast row is at least a D-cup
		if(pc.isChestGarbed() && !pc.hasUpperGarment() && pc.biggestTitSize() >= 4) choices.push(2);
		//Reqs: PC is wearing something covering their top, has at least as many prehensile tails as nips
		if(pc.isChestGarbed() && pc.tailCount >= pc.totalNipples()) choices.push(3);
		//Reqs: PC has very high tone
		if(pc.tone >= 70) choices.push(4);

		//pick our winner!
		var select:int = choices[rand(choices.length)];


		//User submitted milkiness! 75%!
		if(select == 0)
		{
			//If Breasts Tease >=75 Lactating.
			if(pc.milkFullness >= 75)
			{
				output("Drawing your hands sensuously up your [pc.belly], you cup your milky tits, giving one a firm squeeze as you let out a low, lusty moan. With " + foes[0].a + foes[0].short + "’s gaze firmly captured, you pull away your [pc.upperGarments], releasing your [pc.fullChest] to the world, the fresh air blowing across your [pc.nipples]. You aren’t done teasing yet; a delicious idea slips into your devious mind.");
				output("\n\nGrabbing both of your exposed melons, you jiggle them, causing a hypnotizing earthquake of mammary delight while taking care to pinch your nipples. The stimulation is just enough to get you started. Your [pc.milk] flows out as you begin to rub it into your [pc.skinFurScales], the [pc.milkColor] liquid soaking into your [pc.chest]. It takes you a tremendous effort to stop yourself and cover your jugs up again. Licking your fingers clean with an <i>Mmmmm...</i> for show, you ready yourself, noting that you’ll have to clean up a little later.");
			}
			//If Breast tease <75 Lactating.
			else
			{
				output("Fumbling with your [pc.upperGarments] you release your [pc.chest], letting your bounty free with an enticing jiggle. You can feel " + foes[0].a + foes[0].short + "s eyes on you, running over your [pc.chest], and you take advantage of that, swaying your shoulders to set off all kinds of pleasant jiggles. It’s not until you feel your [pc.milk] start to dribble out of your [pc.nipples] that you realize just what you’ve done. Reaching up, you grab the swells of your [pc.chest] to put them away, but you only succeed in coating yourself in your [pc.milk]. You can’t help but feel a little embarrassed and maybe a little aroused as you tuck your [pc.fullChest] away.");
			}
		}
		else if(select == 1)
		{
			//HYPER TIIIIITS
			if(pc.biggestTitSize() >= 15) {
				if(pc.isChestGarbed()) output("With a slow pivot and sultry look, you reach up to your [pc.upperGarments] and peel away the offending coverings with deliberate slowness. With each inch of breast-flesh you expose, your smile grows wider. You pause above your [pc.nipples] before letting them out with a flourish, digging your hands in to your soft, incredibly well-endowed chest in a display of mammary superiority. You cover up after a moment with a knowing smile.");
				else output("Your [pc.fullChest] is already completely uncovered, but that doesn't stop you from bringing your hands up to the more-than-ample cleavage and enhancing it by pressing down from each side. Your fingers sink deeply into your busty bosom as you look up at your chosen target, then, with a smile, you gentle shake them, making your titanic mammaries wobble oh-so-enticingly.")
				if(pc.biggestTitSize() >= 25) output(" There's just so much breastflesh there; it feels good to use it.");
			}
			//Big TiTS!
			else if(pc.biggestTitSize() >= 4) {
				if(pc.isChestGarbed()) output("You peel away your [pc.upperGarments] with careful, slow tugs to expose your [pc.fullChest]. Only after you've put yourself on display do you look back at your target and truly begin to tease, starting with a knowing wink. Then, you grab hold of your [pc.chest] and cup them to enhance your cleavage, lifting one then the other in a slow, sensuous display. Covering them up is something you do a little a regretfully.");
				else output("You delicately trace a finger up your [pc.belly] to your exposed cleavage, slowing as it nestles in place. Your motion causes your breasts to gently sway as you explore yourself, and you pause to look at your target. With one hand, you squeeze your left tit, crushing your other hand's finger into it while you grope yourself. With your erotic display complete, you release yourself and stretch, glad to be uncovered.");
			}
			//Petite ones!
			else {
				if(pc.isChestGarbed()) output("You remove your [pc.upperGarments] with ease to free the perfectly rounded, perky breasts. You run your hands across the [pc.skinFurScales] to thumb at your nipples and grace your target with a lascivious look before putting the girls away a little regretfully.");
				else output("With your [pc.fullChest] on complete display, you arch your back to present yourself as pleasingly as possible. Your hands wind their way up to your [pc.nipples] and give them a little tweak, sliding down the supple curve of your underbust. You give your target a smile before you stop, but even now, your bared [pc.skinFurScales] will taunt " + foes[0].mfn("him","her","it") + ".");
			}
		}
		//Reqs: PC is wearing clothes but no bra, PC’s biggest breast row is at least a D-cup
		else if(select == 2)
		{
			output("<i>“Want to see just how perky these are?”</i> You give your target a sly smile while opening up your [pc.upperGarments], bouncing lightly on your [pc.feet] to make your [pc.fullChest] jiggle. Once the jiggle subsides a bit you pass a hand across the space under your [pc.biggestBreastDescript], showing off how they return to sitting good and high on your chest once they stop bouncing. <i>“Isn’t modern medicine great? No need for a bra with these big girls.”</i> You flash a coy wink as you cover back up.");
		}
		//Reqs: PC is wearing something covering their top, has at least as many prehensile tails as nips
		else if(select == 3)
		{
			output("You start to strip off your [pc.upperGarments], but curl your [pc.tails] around as you do. Just as your [pc.fullChest] is coming into view you cover up each of your nipples with one of your tails, winking and sticking your tongue out.");
			output("\n\n<i>“Ooh, sorry, were you wanting to see these?”</i> You make small circles with your tailtips, allowing your target glimpses of [pc.nippleColor] peeking out around the edges but nothing more. <i>“You could give up and maybe I’ll reward you with a real show.”</i> You pull your tails away just as your [pc.upperGarments] close back over your chest, giving another wink as you cover up.");
		}
		//Reqs: PC has very high tone
		else if(select == 4)
		{
			//Clothed:
			if(pc.isChestGarbed()) output("Shedding your [pc.upperGarments], you");
			else output("You");
			output(" flex your arms, showing off the bulging biceps.  After a bit of posing");
			if(pc.biggestTitSize() < 1) output(" you slap your chest with one hand, producing a loud crack of muscle on muscle as your palm meets your iron-hard pectoral.");
			else if(pc.biggestTitSize() <= 3) output(" you stretch to show off your sleek chest, turning your upper body so they can see the way your breasts fit the form of your highly-toned physique.");
			else output(" you give one of your breasts a grope, showing off how you’re every bit as curvy as a girl without your incredible musculature.");
			output(" After a good few seconds of showing off,");
			if(pc.isChestGarbed()) output(" you close your [pc.upperGarments] and");
			else output(" you cease your posing");
			output(" return your gaze to the fight.");
		}
	}
}

public function hipsTeaseText():void {
	var choices:Array = new Array();

	if(pc.hipRating() < 4) choices.push(0);
	else if(pc.hipRating() >= 10) choices.push(1);
	else choices.push(2);
	//Reqs:  PC has a naga tail
	if(pc.isNaga()) choices.push(3);
	//Reqs: PC is in combat with a naleen, PC has a naga tail
	if(foes[0] is Naleen && pc.isNaga()) choices.push(4);
	//Reqs: Hips skill 75+
	if(flags["TIMES_HIPS_TEASED"] >= 75) choices.push(5);

	var select:int = choices[rand(choices.length)];

	//Small hips!
	if(select == 0) {
		output("Putting a hand on your [pc.hips], you stretch, sliding your palms up and down them for emphasis, really showing off how narrow they are.");
	}
	//Big hips!
	else if(select == 1) {
		output("With a sinuous undulation, you rock your [pc.hips] out to the right side, then the left. You gracefully strut around, swaying to a rhythm only you can hear and doing your best to keep curviness on full display throughout.");
	}
	//Generic hips!
	else if(select == 2) {
		output("Watching your target, you place a hand upon your [pc.hips] and sway them in the other direction then back again like a pendulum. You let the hypnotic undulations go on as long as you dare and smile triumphantly as you stop.");
	}
	//Reqs: PC has a naga tail
	else if(select == 3)
	{
		output("You run a hand down your [pc.hips] and across the surface of your tail, making a slow circle as you do to show off every last foot of its thick, winding length.");
	}
	//Reqs: PC is in combat with a naleen, PC has a naga tail
	else if(select == 4)
	{
		output("You slither towards the ");
		if(pc.race() == "naleen") output("other ");
		output("naleen, idly swaying your [pc.hips] to show off your tail.");
		//PC’s original race is not some sort of naga that may be introduced in the future:
		output(" <i>“I used to have spindly little legs, you know.”</i>");
		//PC’s original race is some sort of naga: <i>“Plenty of other races out there have spindly little legs they have to move around on.”</i>
		output(" You offer a smirk of superiority as you slither in a circle around your foe, your tail leaving a trail in the brush where it passes. <i>“This is </i>much<i> better, don’t you agree?");
		if(pc.race() != "naleen") output(" I may not be a naleen, but I can still appreciate a strong, </i>thick<i> snake tail like mine... or yours.");
		else output(" Becoming a naleen’s given me an appreciation for big, long tails like this one... or like yours.");
		output("”</i> You let your tailtip brush over some of your foe’s length before you pull away, allowing them a brief view of your backside and your tail curling up to support you as you resume the fight.");
	}
	//Reqs: Hips skill 75+
	//flags["TIMES_HIPS_TEASED"]
	else if(select == 5)
	{
		//Clothed:
		if(pc.armor.shortName != "")
		{
			output("You shed your [pc.armor] to leave yourself");
			if(pc.upperUndergarment.shortName != "" && pc.lowerUndergarment.shortName != "") output(" in your [pc.upperGarment] and [pc.lowerGarment]");
			//if bra only: 
			else if(pc.upperUndergarment.shortName != "") output(" in just your [pc.upperGarment]");
			else if(pc.lowerUndergarment.shortName != "") output(" in just your [pc.lowerGarment]");
			else output(" nude");
		}
		//Nude:
		else output("You take a moment to ready yourself");
		output(" before drawing your hands up over your head.  You start in on rocking your [pc.hips], treating your foe to a dance");
		if(pc.tone < 30 && pc.thickness >= 60) output(" that gets your [pc.belly] jiggling");
		else output(" that shows off your [pc.belly], the light glinting off your [pc.skinFurScales] as it moves");
		output(". Your hands slowly descend and move outwards to your sides, remaining largely steady while the bulk of your motion remains in your hips and belly, though there’s just enough motion in your [pc.legOrLegs] to show those off as well");
		if(pc.biggestTitSize() >= 4) output(", and the motion is plenty to set your [pc.chest] quaking in time with your dance");
		if(pc.hasHair() && pc.hairLength >= 8) output(" while your [pc.hair] sways in concert with your hips");
		output(".");
		output("\n\nFinally you stop and take a moment to wipe the sweat off your brow");
		if(pc.armor.shortName != "") output(" before putting your [pc.armor] back on");
		output(".");
	}
}

public function sense(target:Creature):void {
	clearOutput();
	
	if (target is Cockvine)
	{
		adultCockvineSenseOverride();
		processCombat();
		return;
	}
	
	output("You try to get a feel for " + possessive(target.a + target.short) + " likes and dislikes!\n");
	if(target.isLustImmune) output("You don't think sexuality can win this fight!\n");
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

public function paralyzingShock(target:Creature):void {
	clearOutput();
	if(target.hasStatusEffect("Paralyzed")) {
		if(target.plural) output(target.capitalA + target.short + " are already paralyzed!");
		else output(target.capitalA + target.short + " is already paralyzed!");
		clearMenu();
		addButton(0,"Next",combatMainMenu);
		return;
	}
	//Attempt it!
	output("You launch a paralyzing shock at " + target.a + target.short + "!");
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

public function volley(target:Creature):void {
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

public function setDroneTarget(target:Creature):void
{
	//Set drone target
	if(pc.hasPerk("Attack Drone") || pc.accessory is TamWolf || pc.accessory is TamWolfDamaged)
	{
		//Figure out where in the foes array the target is and set drone target to the index.
		//Clunky as all fuck but it works.
		for(var i:int = 0; i < foes.length; i++) {
			if(foes[i] == target) flags["DRONE_TARGET"] = i;
		}
	}
}

public function overcharge(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	setDroneTarget(target);
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
		var damage:TypeCollection = pc.damage(false);
		damage.add(pc.aim() / 2);
		damage.multiply(1.5);
		damageRand(damage, 15);
		applyDamage(damage, pc, target, "overcharge");
	}
	output("\n");
	if(pc.aim()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune")) {
		if(target.plural) output("<b>" + target.capitalA + target.short + " are stunned.</b>\n");
		else output("<b>" + target.capitalA + target.short + " is stunned.</b>\n");
		target.createStatusEffect("Stunned",1,0,0,0,false,"Stun","Cannot act for a turn.",true,0);
	}
	processCombat();
}

public function NPCOvercharge():void {
	foes[0].energy(-20);
	output(foes[0].capitalA + foes[0].short + " smiles as a high-pitched hum emanates from " + foes[0].mfn("his","her","its") + " " + foes[0].rangedWeapon.longName + "! ");
	//Attack missed!
	//Blind prevents normal dodginess & makes your attacks miss 90% of the time.
	if(rangedCombatMiss(foes[0],pc)) output("You manage to avoid " + foes[0].a + possessive(foes[0].short) + " overcharged " + foes[0].rangedWeapon.attackVerb + ".");
	//Extra miss for blind
	else if(pc.hasStatusEffect("Blind") && rand(10) > 0) output(foes[0].capitalA + possessive(foes[0].short) + " blinded, <b>overcharged</b> shot fails to connect!");
	//Attack connected!
	else {
		output(foes[0].capitalA + foes[0].short + " connects with " + foes[0].mfn("his","her","its") + " <b>overcharged</b> " + foes[0].rangedWeapon.attackVerb + "!");
		//Damage bonuses:
		var damage:TypeCollection = foes[0].damage(false);
		damage.add(foes[0].aim() / 2);
		damage.multiply(1.75);
		damageRand(damage, 15);
		applyDamage(damage, foes[0], pc, "overcharge");
		if(foes[0].aim()/2 + rand(20) + 1 > pc.physique()/2 + 10 && !pc.hasStatusEffect("Stunned")) {
			output(" <b>You are stunned!</b>");
			pc.createStatusEffect("Stunned",1,0,0,0,false,"Stun","You cannot act for one turn!",true,0);
		}
	}
	processCombat();
}

public function gravidicDisruptor(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Raising the disruptor, you unleash a targetted gravitic disruption on " + target.a + target.short + "! ");
	applyDamage(new TypeCollection( { unresistablehp: Math.round(10 + pc.intelligence() / 2 + rand(10)) } ), pc, target, "grav_disruptor");
	output("\n");
	processCombat();
}
public function thermalDisruptor(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Raising the disruptor, you unleash a wave of burning fire on " + target.a + target.short + "! ");
	applyDamage(new TypeCollection( { burning: Math.round(25 + pc.intelligence() / 2 + rand(10)) } ), pc, target, "therm_disruptor");
	output("\n");
	processCombat();
}

public function powerSurge(target:Creature):void {
	clearOutput();
	output("You channel a surge of power into your shield generator, instantly restoring a portion of their lost energy.");
	var amount:int = 8+pc.intelligence()/3 + rand(6);
	if(amount + pc.shields() > pc.shieldsMax()) amount = pc.shieldsMax() - pc.shields();
	pc.shields(amount);
	pc.energy(-33);
	output(" (" + amount + ")\n");
	processCombat();
}

public function deflectorRegeneration(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	output("You fiddle with your shield, tuning it to regenerate over the next few turns.\n");
	pc.createStatusEffect("Deflector Regeneration",4,Math.round((pc.intelligence()/3 + 8 + rand(6))/4),0,0,false,"DefenseUp","You are recovering some of your shields every round",true,0);
	processCombat();
}

public function flashGrenade(target:Creature):void {
	pc.energy(-10);
	clearOutput();
	if(silly) output("With a cry of <i>\"Pocket sand!\"</i> you produce a handful of sand and throw it at " + target.a + target.short + ".");
	else output("You produce one of your rechargeable flash grenades and huck it in the direction of " + target.a + target.short + ".");
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

public function NPCFlashGrenade():void {
	pc.energy(-10);
	output(monster.capitalA + monster.short + " produces a flash grenade and hucks it in your direction!\n");
	//Chance of bliiiiiiiind
	if(foes[0].aim()/2 + rand(20) + 6 > pc.reflexes()/2 + 10 && !pc.hasStatusEffect("Blind")) {
		output("\n<b>You're blinded by </b>");
		pc.createStatusEffect("Blind",3,0,0,0,false,"Blind","Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
		output("<b>the luminous flashes.</b>");
	}
	else output("You manage to keep away from the blinding projectile!");
	processCombat();
}

public function headbutt(target:Creature):void {
	properHeadbutt(pc,target);
}

public function properHeadbutt(attacker:Creature,target:Creature):void {
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
			output(attacker.mfn("He","She","It") + " he misses.");
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
		else output(attacker.mfn("He", "She", "It") + " connects with you.");
		
		applyDamage(damageRand(new TypeCollection( { kinetic: attacker.physique() / 2 + attacker.level } ), 15), attacker, target, "headbutt");

		if(attacker.physique()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune")) {
			if(target == pc)
			{
				output("\n<b>You are stunned.</b>");
			}
			else
			{
				if(target.plural) output("\n<b>" + target.capitalA + target.short + " are stunned.</b>");
				else output("\n<b>" + target.capitalA + target.short + " is stunned.</b>");
			}
			target.createStatusEffect("Stunned",2,0,0,0,false,"Stun","Cannot act for a turn.",true,0);
		}
		else {
			if(attacker == pc) output("\nIt doesn't look to have stunned your foe!");
			else output("\nIt didn't manage to stun you.");
		}
	}
	if(attacker == pc) output("\n");
	processCombat();
}

public function lowBlow(target:Creature):void {
	clearOutput();

	pc.energy(-15);
	//Set drone target
	setDroneTarget(target);
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

		applyDamage(damageRand(new TypeCollection( { kinetic: pc.damage() + pc.physique() / 2 } ), 15), pc, target, "lowblow");

		if((pc.aim()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Stunned")) && !target.hasStatusEffect("Stun Immune") || target is Kaska) {
			if(target is Kaska) output("\nKaska's eyes cross from the overwhelming pain. She sways back and forth like a drunken sailor before hitting the floor with all the grace of a felled tree. A high pitched squeak of pain rolls out of her plump lips. <b>She's very, very stunned.</b>");
			else if(target.plural) output("\n<b>" + target.capitalA + target.short + " are stunned.</b>");
			else output("\n<b>" + target.capitalA + target.short + " is stunned.</b>");
			if(target is Kaska) target.createStatusEffect("Stunned",3,0,0,0,false,"Stun","Cannot act for a turn.",true,0);
			else target.createStatusEffect("Stunned",2,0,0,0,false,"Stun","Cannot act for a turn.",true,0);
		}
		else {
			output("\nIt doesn't look like you accomplished much more than hitting your target.");
		}
	}
	output("\n");
	processCombat();
}

public function stealthFieldActivation():void {
	clearOutput();
	pc.energy(-20);
	output("You activate your stealth field generator, fading into nigh-invisibility.\n");
	pc.createStatusEffect("Stealth Field Generator",2,0,0,0,false,"Stealth Field","Provides a massive bonus to evasion chances!",true,0);
	processCombat();
}

public function NPCstealthFieldActivation(user:Creature):void {
	user.energy(-20);
	output(user.capitalA + user.short + " activates a stealth field generator, fading into nigh-invisibility.");
	user.createStatusEffect("Stealth Field Generator",2,0,0,0,false,"Stealth Field","Provides a massive bonus to evasion chances!",true,0);
	processCombat();
}

public function disarmingShot(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	if(target.hasStatusEffect("Disarm Immune")) output("You try to disarm " + target.a + target.short + " but can't. <b>It's physically impossible!</b>\n");
	else if(target.hasStatusEffect("Disarmed")) output("You try to disarm " + target.a + target.short + " but can't. <b>You already did!</b>\n");
	else if(rangedCombatMiss(pc,target)) output("You try to disarm " + target.a + target.short + " but miss.\n");
	else {
		output("You land a crack shot on " + possessive(target.a + target.short) + ", disarming them.\n");
		target.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","Cannot use normal melee or ranged attacks!",true,0);
	}
	processCombat();
}
public function NPCDisarmingShot(user:Creature):void
{
	user.energy(-20);
	if(pc.hasStatusEffect("Disarm Immune")) output(user.capitalA + user.short + " tries to shoot your weapons out of your hands but can't. <b>It's physically impossible!</b>\n");
	else if(pc.hasStatusEffect("Disarmed")) output(user.capitalA + user.short + " tries to shoot your weapons out of your hands but can't. <b>You're already disarmed!</b>");
	else if(rangedCombatMiss(user,pc)) output(user.capitalA + user.short + " misses when trying hit you with disarming shots!");
	else {
		output(user.capitalA + user.short + " shoots your weapons away with well-placed shots!");
		pc.createStatusEffect("Disarmed",4,0,0,0,false,"Blocked","Cannot use normal melee or ranged attacks!",true,0);
	}
	processCombat();
}

public function grenade(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Tossing an explosive in the general direction of your target, you unleash an explosive blast of heat on " + target.a + target.short + "! ");
	
	var damage:TypeCollection = damageRand(new TypeCollection( { kinetic: 20, burning: 20 } ), 15);
	
	if (foes[0] is Cockvine)
	{
		adultCockvineGrenadesInEnclosedSpaces(damage, false, false, false);
	}
	
	applyDamage(damage, pc, target);
	
	output("\n");
	processCombat();
}

public function gasGrenade(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("Tossing a hissing grenade in the general direction of your target, you watch the stuff do its trick.");
	
	var damage:TypeCollection = damageRand(new TypeCollection( { drug: 14 + pc.level*2 } ), 10);

	if (foes[0] is Cockvine)
	{
		adultCockvineGrenadesInEnclosedSpaces(damage, false, false, true);
	}
	
	var damageResult:DamageResult = applyDamage(damage, pc, target, "suppress");
	output("\n");
	output(teaseReactions(damageResult.lustDamage, target));
	outputDamage(damageResult);
	processCombat();
}

public function goozookaCannon(target:Creature):void
{
	clearOutput();
	pc.destroyItem(new GrayMicrobots(), 1);
	
	output("You pull the goo launcher from over your shoulder and slam a vial of Gray Goo into the back. You brace yourself, sighting in on your target and flipping the ON switch. The launcher beeps, and you pull the trigger, sending a great big blob of gray goop hurtling toward your opponent!");
	
	if (rangedCombatMiss(pc, target, 0))
	{
		// Missed
		output("\n\nHowever the goo sample goes wide, splattering on the ground a little ways away. A moment later, a miniature gray googirl congeals from the mess, looks around, and starts hauling ass away from the fight. Whoops.");
	}
	else
	{
		var damage:TypeCollection;
		var damageResult:DamageResult
		
		// Hit
		if (target is GrayGoo)
		{
			output("\n\nAlthough you probably should have thought this plan through a little better before actioning it; firing Gray Goo samples <i>at a Gray Goo</i> might not have been the smartest choice. All you seem to have achieved is bolstering the strength of your foe!\n");
			
			var heal:Number = target.HPMax() * 0.2;
			if (target.HP() + heal > target.HPMax()) heal = target.HPMax() - target.HP();
			
			damage = new TypeCollection( { tease: 5 } );
			damageResult = applyDamage(damage, pc, target, "suppress");
			
			output("The Gray Goo absorbs her smaller twin on contact.");
			output(" (Heals " + heal + ")");
			
			target.HP(heal);
		}
		else
		{
			output("\n\nThe gray goo splatters across " + target.a + target.short + ", quickly congealing into a miniature googirl who quickly goes to work, attacking your enemy's most sensitive spots with gusto. ");
		
			damage = new TypeCollection( { tease: 33 } );
			damageResult = applyDamage(damage, pc, target, "suppress");
			output("\n");
			output(teaseReactions(damageResult.lustDamage, target));
		}
		
		outputDamage(damageResult);
	}
	
	processCombat();
}

public function pcConcShot(target:Creature):void
{
	clearOutput();
	pc.energy( -25);
	
	output("You nock one of your concussive arrows and draw your bowstring back, taking careful aim at the space just ahead of " + target.a + target.short + ".");
	
	if (rangedCombatMiss(pc, target, 0))
	{
		output(" You let fly, but the arrow sails clean past your intended target.");
	}
	else
	{
		output(" You let fly, and a moment later, the arrow explodes in a shockwave of force");
		
		if (rand(3) == 0)
		{
			output(" though " + target.a + target.short + " seems to resist the blast. Your stun-shot failed!");
		}
		else
		{
			output(", stunning your enemy!");
			
			var rounds:int = 2 + rand(3);
			target.createStatusEffect("Stunned",rounds,0,0,0,false,"Stun","Cannot act for "+ rounds +" turns.",true,0);
		}
		
		// Add some burning damage for the explosion
		var damage:TypeCollection = pc.rangedDamage();
		damage.add(new TypeCollection( { burning: 10 } ));
		applyDamage(damage, pc, target, "ranged");
	}
	
	processCombat();
}

public function pcGooClone(target:Creature):void
{
	clearOutput();
	output("<i>“Go get 'em, [goo.name]!”</i> you shout. She cheers and leaps off of you, half her gooey mass plopping down beside you and reforming into a miniature, big-tittied dancing goo-girl. The mini-goo bounces around, showing off her tits or bending over, flashing her ass and crotch at " + target.a + target.short + ".");
	
	target.lust(3 + rand(3));
	
	pc.createStatusEffect("Reduced Goo", 0, 0, 0, 0, false, "Icon_DefDown", chars["GOO"].short + " has split from your frame and is busy teasing your foes - but it's reduced your defense!", true, 0);
	pc.armor.defense = 1;
	target.createStatusEffect("Gray Goo Clone", 0, 0, 0, 0, false, "Icon_LustUp", chars["GOO"].short + " is busy distracting your foes!", true, 0);
	processCombat();
}

public function pcRecallGoo():void
{
	clearOutput();
	
	var target:Creature;
	
	for (var i:uint = 0; i < foes.length; i++)
	{
		if (foes[i].hasStatusEffect("Gray Goo Clone"))
		{
			target = foes[i];
			break;
		}
	}
	
	output("<i>“Come on back, [goo.name]!”</i> you shout. In the blink of an eye, your body is wrapped in a thick covering of gray goo, cool and wet and comforting.");
	pc.removeStatusEffect("Reduced Goo");
	pc.armor.defense = 8;
	target.removeStatusEffect("Gray Goo Clone");
	processCombat();
}

public function secondWind():void
{
	clearOutput();
	pc.energy(Math.round(pc.energyMax()/2));
	pc.HP(Math.round(pc.HPMax()/2));
	pc.createStatusEffect("Used Second Wind",0,0,0,0,true,"","",true,0);
	output("You draw on your innermost reserves of strength, taking a second wind!\n");
	processCombat();
}

public function burstOfEnergy():void
{
	clearOutput();
	
	pc.energy(60);
	pc.createStatusEffect("Used Burst of Energy",0,0,0,0,true,"","",true,0);
	output("You dig deep and find a reserve of energy from deep within yourself!\n");
	processCombat();
}

public function struggledStimulant():void
{
	clearOutput();
	pc.createStatusEffect("Used Smuggled Stimulant",3,0,0,0,true,"","",true,0);
	output("You inject yourself with a smuggled stimulant!\n");
	processCombat();
}

public function rapidFire(target:Creature):void {
	pc.energy(-20);
	//Do normal attacks
	rangedAttack(pc,target,true);
	//Do the bonus flurry shots!
	rangedAttack(pc,target,true,2);
	rangedAttack(pc,target,true,2);
	processCombat();
}

public function powerStrike(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	//Set drone target
	setDroneTarget(target);
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
		var damage:TypeCollection = pc.damage();
		damage.add(pc.physique() / 2);
		damage.multiply(2);
		damageRand(damage, 15);
		applyDamage(damage, pc, target, "powerstrike");
	}
	output("\n");
	processCombat();
}

public function takeCover():void {
	clearOutput();
	pc.energy(-20);
	output("You seek cover against ranged attacks.\n");
	pc.createStatusEffect("Taking Cover",3,0,0,0,false,"DefenseUp","You are taking cover! Ranged attacks will almost always miss!",true);
	processCombat();
}

public function carpetGrenades():void 
{
	clearOutput();
	pc.energy(-25);
	output("You sling an array of microgrenades at everything in the area! ");
	
	var damage:TypeCollection = damageRand(new TypeCollection( { burning: 30 } ), 15);
	
	if (foes[0] is Cockvine)
	{
		adultCockvineGrenadesInEnclosedSpaces(damage, true, false, false);
	}

	for(var x:int = 0; x < foes.length; x++)
	{
		var tDamage:TypeCollection = damage.makeCopy();
		
		//Double damage against plural enemies
		if (foes[x].plural)
		{
			tDamage.multiply(2);
		}
		applyDamage(tDamage, pc, foes[x], "carpetgrenade");
	}
	
	aoeAttack(damage);
	
	output("\n");
	processCombat();
}
public function detCharge(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	output("You toss a bundle of explosives in the direction of " + target.a + target.short + "! ");
	
	var damage:TypeCollection = damageRand(new TypeCollection( { burning: 50 } ), 15);
	
	if (foes[0] is Cockvine)
	{
		adultCockvineGrenadesInEnclosedSpaces(damage, false, false, false);
	}
	
	applyDamage(damage, pc, target, "detcharge");

	output("\n");
	processCombat();
}

public function shieldHack(target:Creature):void 
{
	clearOutput();
	pc.energy(-25);
	if(target.shields() <= 0)
	{
		output("You attempt to hack the nonexistent shield protecting " + target.a + target.short + "! It doesn't work - <b>there's no shield there.</b>\n");
		processCombat();
		return;
	}
	output("You attempt to wirelessly hack the shield protecting " + target.a + target.short + "! ");
	
	var damage:TypeCollection = damageRand(new TypeCollection( { electric: 25 + pc.level * 5 } ), 15);
	damage.addFlag(DamageFlag.ONLY_SHIELD);
	
	var damageResult:DamageResult = calculateDamage(damage, pc, target, "suppress");
	
	if(target.shields() > 0)
	{
		if(target.plural) output(" " + target.a + possessive(target.short) + " shields crackle but hold.");
		else output(" " + target.a + possessive(target.short) + " shield crackles but holds.");
	}
	else
	{
		if(!target.plural) output(" There is a concussive boom and tingling aftershock of energy as " + target.a + possessive(target.short) + " shield is breached.");
		else output(" There is a concussive boom and tingling aftershock of energy as " + target.a + possessive(target.short) + " shields are breached.");
	}
	
	outputDamage(damageResult);
	
	output("\n");
	processCombat();
}

public function weaponHack(target:Creature):void {
	clearOutput();
	pc.energy(-20);
	if(target.hasStatusEffect("Disarm Immune")) output("You try to hack " + target.a + target.short + " but can't. <b>It's physically impossible!</b>\n");
	else if(target.hasStatusEffect("Disarmed")) output("You try to hack " + target.a + target.short + " but can't. <b>You already did!</b>\n");
	else if(!target.hasEnergyWeapon()) output("You try to hack " + target.a + target.short + " but there are no energy weapons to shut down!");
	else {
		output("You hack " + possessive(target.a + target.short) + " weapon, disarming them.\n");
		target.createStatusEffect("Disarmed",4+rand(2),0,0,0,false,"Blocked","Cannot use normal melee or ranged attacks!",true,0);
	}
	processCombat();
}

public function aoeAttack(damage:TypeCollection):void
{
	// Add function to anything that does AOE damage so we can cheese shit
	if (damage.getTotal() > 0)
	{
		if (foes[0].hasStatusEffect("Gooclones")) foes[0].removeStatusEffect("Gooclones");
	}
}