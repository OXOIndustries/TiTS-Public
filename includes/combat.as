public function combatMainMenu():void 
{
	if(flags["COMBAT MENU SEEN"] == undefined)
	{
		//Encounter with a shitty cover mechanic.
		if(foes[0] is CaptainKhorganMech)
		{
			coverUpdateDisplay();
		}
		updateCombatStatuses();
	}

	else 
	{
		//Combat menu

		if(foes[0] is classes.Characters.Varmint && pc.hasKeyItem("Lasso")) addButton(0,"Lasso",lassoAVarmint,undefined,"Lasso","Use the lasso you've been provided with to properly down this varmint.");
		//Bonus shit for stuff!
		if (foes[0] is CaptainKhorganMech) khorganMechBonusMenu();
		if (foes[0] is QueenOfTheDeep) queenOfTheDeepCombatMenuAddition();
		if (foes[0] is Queensguard || foes[0] is Taivra) 
		{
			if(flags["FREED_DANE_FROM_TAIVRA"] == undefined)
			{
				if(pc.statusEffectv1("Cage Distance") != 0) addButton(10,"Cage",moveToCage,undefined,"Cage","Attempt to move closer to Dane and [rival.name]'s cage.");
				else addButton(10,"BreakCage",breakOutDane,undefined,"Break Cage","Try and break Dane out - that big, burly ausar might just level the playing field!");
			}
		}
	}
	flags["COMBAT MENU SEEN"] = 1;
}

public function specialsMenu():void {
	clearMenu();
	addButton(14,"Back",combatMainMenu,undefined,"Go back to the main combat screen.");
	var offset:int = 0;
	
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
	if(pc.hasStatusEffect("Bloodthirsted")) pc.removeStatusEffect("Bloodthirsted");
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
	//Does v1 lust damage every turn. V2 is turn counter (negative = infinite)!
	if(pc.hasStatusEffect("Aphro"))
	{
		pc.addStatusValue("Aphro",2,-1);
		if(pc.statusEffectv2("Aphro") == 0)
		{
			output("<b>The aphrodisiac in your bloodstream has faded!</b>");
			pc.removeStatusEffect("Aphro");
		}
		else
		{
			output("<b>The aphrodisiac in your bloodstream continues to excite your body!</b>");
			applyDamage(new TypeCollection( { drug: pc.statusEffectv1("Aphro") } ), foes[0], pc);
		}
		output("\n");
	}
	//Does v1 lust damage every turn. V2 is turn counter (negative = infinite)!
	if(pc.hasStatusEffect("Aphro Gas"))
	{
		pc.addStatusValue("Aphro Gas",2,-1);
		if(pc.statusEffectv2("Aphro Gas") == 0)
		{
			output("<b>The aphrodisiac cloud has dispersed!</b>");
			pc.removeStatusEffect("Aphro Gas");
		}
		else
		{
			output("<b>The cloud of aphrodisiac continues to excite your body!</b>");
			applyDamage(new TypeCollection( { drug: pc.statusEffectv1("Aphro Gas") } ), foes[0], pc);
		}
		output("\n");
	}
	if(pc.hasStatusEffect("Burn"))
	{
		//2% of HP per tic.
		output("<b>The flames slowly lick at you,</b>");
		if(pc.statusEffectv1("Burn") > 1) 
		{
			pc.addStatusValue("Burn",1,-1);
			output("<b> resisting any attempt to put them out.</b>");
		}
		else 
		{
			pc.removeStatusEffect("Burn");
			output("<b> refusing to go out until they've done their foul work.</b>");
		}		
		applyDamage(new TypeCollection( { burning: 3 + rand(4) } ), foes[0], pc);
		output("\n");
	}
	if (pc.hasStatusEffect("Bleeding"))
	{
		output("<b>Your wounds continue to take their toll on your body;</b>");
		if (pc.statusEffectv2("Bleeding") >= 1)
		{
			pc.addStatusValue("Bleeding", 2, -1);
			output("<b> your microsugeons working overtime to stem the ongoing damage.</b>");
		}
		else
		{
			pc.removeStatusEffect("Bleeding");
			output("<b> your microsurgeons have triaged the worst of it, but you'll need proper rest to heal.</b>");
		}
		applyDamage(damageRand(new TypeCollection( { kinetic: pc.statusEffectv1("Bleeding") * pc.statusEffectv3("Bleeding") } ), 15), foes[0], pc);
		output("\n");
	}
	if (pc.hasStatusEffect("Staggered"))
	{
		if (pc.statusEffectv1("Staggered"))
		{
			pc.addStatusValue("Staggered", 1, -1);
			output("<b>You're still reeling from the force of the blows to which you've been subjected.</b>");
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
	if (pc.hasStatusEffect("Smoke Grenade")) {
		pc.addStatusValue("Smoke Grenade", 1, -1);
		if (pc.statusEffectv1("Smoke Grenade") <= 0) {
			pc.removeStatusEffect("Smoke Grenade");
			output("<b>The cloud of smoke finally dissipates!</b>\n");
		}
		else if(pc.hasPerk("Smoke Grenade") && pc.statusEffectv1("Blind") <= 1) {
			pc.removeStatusEffect("Smoke Grenade");
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
			output("<b>You recover " + temp + " points of shielding.</b>\n");
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
			output("<b>The flames slowly lick at " + foes[x].a + foes[x].short + ",</b>");
			if(foes[x].statusEffectv1("Burn") > 1) 
			{
				foes[x].addStatusValue("Burn",1,-1);
				output("<b> resisting any attempt to put them out.</b>");
			}
			else 
			{
				foes[x].removeStatusEffect("Burn");
				output("<b> refusing to go out until they've done their foul work.</b>");
			}		
			applyDamage(new TypeCollection( { burning: 3 + rand(4) } ), null, foes[x]);
			output("\n");
		}
		if(foes[x].hasStatusEffect("Evasion Boost"))
		{
			foes[x].addStatusMinutes("Evasion Boost",-1);
			if(foes[x].getStatusMinutes("Evasion Boost") <= 0)
			{
				if(foes[x].plural) output("<b>" + foes[x].capitalA + foes[x].short + " no longer have boosted evasion!</b>");
				else output("<b>" + foes[x].cappitalA + foes[x].short + " no longer has boosted evasion!</b>");
				foes[x].removeStatusEffect("Evasion Boost");
				output("\n");
			}
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
			else if(foes[x].plural) output("<b>" + foes[x].capitalA + foes[x].short + " are stunned and unable to act!</b>\n");
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
			else if (foes[0] is Goocubator) 
			{
				output("You manage to tear yourself out of the goo’s grasp, wrenching your limbs free one by one. She squeals as you pop yourself out of her, eyes crossing as her whole body quakes with the aftershocks.");
				output("\n\n<i>“Aww, why do you have to be that way?”</i> she pouts, wiggling away from you.");
			}
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
	else if (aggressor is QueenOfTheDeep) queenOfTheDeepAI();
	else if (aggressor is MyrGoldFemaleDeserter) myrDeserterAI(true);
	else if (aggressor is MyrRedFemaleDeserter) myrDeserterAI(false);
	else if (aggressor is NyreanPraetorians) praetorianAI();
	else if (aggressor is Goocubator) gooCubatorAI();
	else if (aggressor is SX1GroupPirates) sx1PirateGroupAI();
	else if (aggressor is SX1Shotguard) sx1ShotguardAI();
	else if (aggressor is SX1Techguard) sx1TechguardAI();
	else if (aggressor is Queensguard) queensguardAI();
	else if (aggressor is Taivra) taivraAI();
	else if (aggressor is Princess) princessAI();
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
	else if (foes[0] is QueenOfTheDeep)
	{
		queenOfTheDeepPCVictory();
	}
	else if (foes[0] is MyrRedFemaleDeserter || foes[0] is MyrGoldFemaleDeserter)
	{
		winVsAntGrillDeserts();
	}
	else if(foes[0] is NyreanPraetorians) spankDaShitOuttaPraetorians();
	else if(foes[0] is Goocubator) pcBeatsGoo();
	else if (foes[0] is SX1GroupPirates) sx1PirateGroupPCVictory();
	else if (foes[0] is SX1Shotguard) sx1ShotguardPCVictory();
	else if (foes[0] is SX1Techguard) sx1TechguardPCVictory();
	else if (foes[0] is Queensguard) spankedQueensguardsAss();
	else if (foes[0] is Taivra) whupTaivrasAss();
	else if (foes[0] is Princess) beatUpPrincessYeSlut();
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
	else if (foes[0] is QueenOfTheDeep)
	{
		queenOfTheDeepPCLoss();
	}
	else if (foes[0] is MyrRedFemaleDeserter || foes[0] is MyrGoldFemaleDeserter)
	{
		loseToAntGrillDeserts();
	}
	else if(foes[0] is NyreanPraetorians) loseToPraetorianNyreaGangbangu();
	else if(foes[0] is Goocubator) loseToRoyalIncuGoo();
	else if (foes[0] is SX1GroupPirates) sx1PirateGroupPCLoss();
	else if (foes[0] is SX1Shotguard) sx1ShotguardPCLoss();
	else if (foes[0] is SX1Techguard) sx1TechguardPCLoss();
	else if (foes[0] is Queensguard) loseToQueensTaivra();
	else if (foes[0] is Taivra) loseToQueensTaivra();
	else if (foes[0] is Princess) loseToPrincessYeGit();
	else {
		output("You lost!  You rouse yourself after an hour and a half, quite bloodied.");
		processTime(90);
		genericLoss();
	}
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
		case "QueenOfTheDeep":
			chars["QUEENOFTHEDEEP"].prepForCombat();
			break;
		case "Gold Deserter":
			chars["GOLD_DESERTER"].prepForCombat();
			break;
		case "Red Deserter":
			chars["RED_DESERTER"].prepForCombat();
			break;
		case "Nyrean Praetorians":
			chars["NYREAN_PRAETORIANS"].prepForCombat();
			break;
		case "Goocubator":
			chars["GOOCUBATOR"].prepForCombat();
			break;
		case "SX1GROUPPIRATES":
			chars["SX1GROUPPIRATES"].prepForCombat();
			break;
		case "SX1SHOTGUARD":
			chars["SX1SHOTGUARD"].prepForCombat();
			break;
		case "SX1TECHGUARD":
			chars["SX1TECHGUARD"].prepForCombat();
			break;
		case "Queensguard":
			chars["QUEENSGUARD"].prepForCombat();
			pc.createStatusEffect("Cage Distance",2,0,0,0,false,"Icon_RadioSignal","You're a good ways away from Dane and your cousin's cage. It'll take a lot of work to reposition yourself to break them out.",true,0);
			break;
		case "Taivra":
			if(flags["FREED_DANE_FROM_TAIVRA"] == 1) pc.removeStatusEffect("Cage Distance");
			chars["TAIVRA"].prepForCombat();
			break;
		case "princess":
			chars["PRINCESS"].prepForCombat();
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

public function leaveCombat():void
{
	pc.removeStatusEffect("Round");
	pc.clearCombatStatuses();
	userInterface.hideNPCStats();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
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

public function pcGooClone(target:Creature):void
{
	clearOutput();
	output("<i>“Go get 'em, [goo.name]!”</i> you shout. She cheers and leaps off of you, half her gooey mass plopping down beside you and reforming into a miniature, big-tittied dancing goo-girl. The mini-goo bounces around, showing off her tits or bending over, flashing her ass and crotch at " + target.a + target.short + ".");
	
	target.lust(3 + rand(3));
	
	pc.createStatusEffect("Reduced Goo", 0, 0, 0, 0, false, "Icon_DefDown", chars["GOO"].short + " has split from your frame and is busy teasing your foes - but it's reduced your defense!", true, 0);
	pc.armor.defense -= 5;
	target.createStatusEffect("Gray Goo Clone", 0, 0, 0, 0, false, "Icon_LustUp", chars["GOO"].short + " is busy distracting your foes!", true, 0);
	processCombat();
}

public function pcRecallGoo():void
{
	clearOutput();
	//Set target as PC incase something gets fucked up with the enemy. That way it doesn't crash when attempting to remove the status from the target.
	var target:Creature = pc;
	
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
	pc.armor.defense += 5;
	target.removeStatusEffect("Gray Goo Clone");
	processCombat();
}