package classes.GameData 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.StorageClass;
	import classes.Engine.Interfaces.*;
	import classes.Characters.*;
	import classes.kGAMECLASS;
	import fl.events.SliderEventClickTarget;
	
	/**
	 * Documentation on things!
	 * 
	 * AUTOMATICALLY HANDLED COOLDOWN EFFECTS.
	 * Include the text "Cooldown" in the name of an effect. 
	 * - The game will automatically tick it down per-round, and be removed when the
	 * tracking value moves below 0 (this means an effect starting at 5 will be unavailable for 5 rounds AFTER it is applied, as it will decrement in the round it is USED).
	 * - V1 is used as the duration remaining
	 * - V2 marks the effect state. If it is anything but zero it will not count down.
	 * 
	 * AUTOMATICALLY HANDLED CONTROL EFFECTS.
	 * Effects named "Grappled", "Stunned", "Tripped" and "Blinded" are automatically handled.
	 * @author Gedan
	 */
	public class CombatContainer 
	{
		private function get pc():PlayerCharacter { return kGAMECLASS.pc; }
		
		/**
		 * Hook function.
		 * Any action that should be taken at the /end/ of a combat round, but before the
		 * next begins, should be done in this function.
		 */
		private function postHostileTurnActions():void
		{
			
		}
		
		/**
		 * Place code in this function for any status effect that impacts the creature
		 * it is on outside of its mere presence (ie DoT ticks, stat changes etc)
		 * @param	target
		 */
		private function updateStatusEffectsFor(target:Creature):void
		{
			if (target.isDefeated()) return;
			
		}
		
		public function showCombatMenu():void
		{
			removeAllButtonHighlights();
			
			if (!doneRoundActions())
			{
				// do anything that only happens once per round here.
			}
			
			if (checkForVictory()) return;
			if (checkForLoss()) return;
			
			clearOutput();
			clearMenu();
			
			showCombatUI();
			
			showCombatDescriptions();
			generateCombatMenu();
			
			_initForRound = _roundCounter;
		}
		
		/**
		 * Generate the actual button elements for the combat menu
		 */
		private function generateCombatMenu():void
		{
			if (pc.hasStatusEffect("Stunned") || pc.hasStatusEffect("Paralyzed"))
			{
				if (pc.hasStatusEffect("Stunned")) output("\n<b>You're still stunned!</b>");
				addButton(0, "Recover", doStunRecover, pc);
				return;
			}
			
			if (pc.hasStatusEffect("Naleen Coiled") || pc.hasStatusEffect("Mimbrane Smother") || pc.hasStatusEffect("Grappled"))
			{
				if (pc.hasStatusEffect("Naleen Coiled"))
				{
					output("\n<b>You are wrapped up in coils!</b>");
				}
				else if (pc.hasStatusEffect("Mimbrane Smother"))
				{
					output("\n\n<b>You are being smothered by a Mimbrane!</b>");
				}
				else
				{
					output("\n<b>You are grappled and unable to fight normally!</b>");
				}
				
				addButton(0, "Struggle", doGrappleStruggle); // 9999 - merge naleen coil struggle && mimbranesmother
				
				if (pc.hasPerk("Static Burst") && (!hasEnemyOfClass(NyreaAlpha) && !hasEnemyOfClass(NyreaBeta)))
				{
					if(pc.shields() <= 0) addDisabledButton(3,"StaticBurst","StaticBurst","You need shields available to overload in order for static burst to function.");
					else if(pc.energy() >= 5) this.addButton(3,"StaticBurst", doStaticBurst);
					else this.addDisabledButton(3,"StaticBurst");
				}
				
				if (hasEnemyOfClass(Kaska))
				{
					addButton(10, "Nip-Pinch", pinchKaskaNipple, undefined, "Nip-Pinch", "Maybe pinching Kaska's nipple will get her to release you.");
				}
				
				addButton(4, "Do Nothing", doWait);
				return;
			}
			
			// attack
			var af:Function = pc.meleeWeapon.attackImplementor == null ? CombatAttacks.MeleeAttack : pc.meleeWeapon.attackImplementor;
			addButton(0, "Attack", selectSimpleAttack, af, "Attack", "Attack a single enemy with a melee strike. Damage is based on physique.");
			
			// shoot
			var sf:Function = pc.rangedWeapon.attackImplementor == null ? CombatAttacks.RangedAttack : pc.rangedWeapon.attackImplementor;
			addButton(1, upperCase(pc.rangedWeapon.attackVerb), selectSimpleAttack, sf, "Ranged Attack", "Attack a single enemy with a ranged weapon. Damage is based on aim.");
			
			//
			// inventory
			addButton(3, "Inventory", kGAMECLASS.inventory, undefined, "Inventory", "Use items in combat.");
			// specials
			addButton(4, "Specials", generateSpecialsMenu, undefined, "Specials", "The special attacks you have available to you are listed in this menu.");
			
			// tease
			addButton(5, "Tease", selectSimpleTarget, generateTeaseMenu, "Tease Menu", "Opens up your menu of available lust targetting attacks. It is recommended that the ‘Sense’ option be used beforehand.");
			// sense
			addButton(6, "Sense", generateSenseMenu, undefined, "Sense", "Attempts to get a feel for a foe's likes and dislikes. Absolutely critical for someone who plans on seducing " + pc.mf("his", "her") + " way out of a fight.");
			// 
			//
			// fantasize
			
			//
			//
			//
			//
			// run
		}
		
		private function generateSpecialsMenu():void
		{
			var attacks:Array = CombatAttacks.GetAttacksFor(pc);
			
			var bOff:int = 0;
			for (var i:int = 0; i < attacks.length; i++)
			{
				var atk:SingleCombatAttack = attacks[i] as SingleCombatAttack;
				if (atk.IsAvailable(pc))
				{
					addButton(bOff, atk.ButtonName, selectAttack, atk, atk.TooltipTitle, atk.TooltipBody);
				}
				else
				{
					addDisabledButton(bOff, atk.ButtonName, atk.TooltipTitle, atk.TooltipBody);
				}
			}
			
			addButton(14, "Back", generateCombatMenu);
		}
		
		private function selectAttack(atk:SingleCombatAttack):void
		{
			if (!atk.RequiresTarget)
			{
				atk.execute(_friendlies, _hostiles, pc, null);
				return;
			}
			
			var t:Creature = null;
			
			if (_hostiles.length == 1)
			{
				t = _hostiles[0];
			}
			else if (enemiesAlive() == 1)
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated())
					{
						t = _hostiles[i];
						break;
					}
				}
			}
			
			if (t == null)
			{
				selectTarget(atk);
			}
			else
			{
				atk.execute(_friendlies, _hostiles, pc, t);
			}
		}
		
		private function selectTarget(atk:SingleCombatAttack):void
		{	
			clearMenu();
			
			var bOff:int = 0;
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated())
				{
					addButton(bOff, _hostiles[i].uniqueName, executeAttack, { attack: atk, tar: _hostiles[i] } );
				}
			}
			
			addButton(14, "Back", generateCombatMenu);
		}
		
		private function executeAttack(opts:Object):void
		{
			clearOutput();
			clearMenu();
			
			opts.attack.execute(_friendlies, _hostiles, pc, opts.tar);
			
			processCombat();
		}
		
		private function selectSimpleAttack(f:Function):void
		{
			var t:Creature = null;
			
			if (_hostiles.length == 1)
			{
				t = _hostiles[0];
			}
			else if (enemiesAlive() == 1)
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated())
					{
						t = _hostiles[i];
						break;
					}
				}
			}
			
			if (t == null)
			{
				selectSimpleTarget(f);
			}
			else
			{
				executeSimpleAttack({func: f, tar: t});
			}
		}
		
		private function selectSimpleTarget(f:Function):void
		{
			clearMenu();
			
			var bOff:int = 0;
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated())
				{
					addButton(bOff, _hostiles[i].uniqueName, executeSimpleAttack, { func:f, tar: _hostiles[i] } );
				}
			}
			
			addButton(14, "Back", generateCombatMenu);
		}
		
		private function executeSimpleAttack(opts:Object):void
		{
			clearOutput();
			clearMenu();
			
			opts.func(pc, opts.tar);
			
			processCombat();
		}
		
		private function generateTeaseMenu(attacker:Creature, target:Creature):void
		{
			if (target is Celise)
			{
				clearOutput();
				output("You put a hand on your hips and lewdly expose your groin, wiggling to and fro in front of the captivated goo-girl.\n");
				processCombat();
				return;
			}
	
			clearOutput();
			output("Which tease will you use?");
			if (flags["TIMES_CHEST_TEASED"] == undefined) flags["TIMES_CHEST_TEASED"] = 0;
			if (flags["TIMES_HIPS_TEASED"] == undefined) flags["TIMES_HIPS_TEASED"] = 0;	
			if (flags["TIMES_BUTT_TEASED"] == undefined) flags["TIMES_BUTT_TEASED"] = 0;
			if (flags["TIMES_CROTCH_TEASED"] == undefined) flags["TIMES_CROTCH_TEASED"] = 0;
			
			var teases:Array = [
				flags["TIMES_BUTT_TEASED"],
				flags["TIMES_CHEST_TEASED"],
				flags["TIMES_CROTCH_TEASED"],
				flags["TIMES_HIPS_TEASED"]
			];
			
			for(var i:int = 0; i < teases.length; i++) 
			{ 
				if(teases[i] > 100) teases[i] = 100;
			}
			
			output("\nAss tease skill: " + teases[0] + "/100");
			output("\nChest tease skill: " + teases[1] + "/100");
			output("\nCrotch tease skill: " + teases[2] + "/100");
			output("\nHips tease skill: " + teases[3] + "/100");
			
			output("\n\nYour ability at a tease can increase both its success rate and total damage.");
		
			clearMenu();
			addButton(0, "Ass", teaseButt, target, "Ass Tease", "Use your [pc.butt] to tease your enemy.");
			
			addButton(1, "Chest", teaseChest, target, "Chest Tease", "Use your [pc.chest] to tease your enemy.");
			
			if (pc.hasCock() || pc.hasVagina()) addButton(2, "Crotch", teaseCrotch, target, "Crotch Tease", "Use your [pc.crotch] to tease your enemy.");
			else addDisabledButton(2, "Crotch");
		
			addButton(3, "Hips", teaseHips, target, "Hips Tease", "Use your [pc.hips] to tease your enemy.");
			
			if (pc.milkType == GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK && pc.isLactating()) addButton(4, "Milk Squirt", teaseSquirt, target, "Milk Squirt", "Spray the enemy with your vanae milk, arousing them.");
			else if (pc.milkType == GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) addDisabledButton(4, "Milk Squirt", "Milk Squirt", "You do not currently have enough milk available to squirt any.");
			addButton(14, "Back", combatMainMenu, undefined, "Back", "Back out. Recommended if you haven't yet used \"Sense\" to determine your foe's likes and dislikes. Remember you can pull up your appearance screen in combat or use the scene buffer buttons in the lower left corner to compare yourself to your foe's preferences!");
		}
		
		private function teaseButt(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
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
			if(pc.tailCount > 0 && (pc.hasTailCock() || pc.hasTailCunt()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILGENITALS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILGENITALS);
			if((pc.isTaur() || pc.isNaga()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE);
			
			clearOutput();
			buttTeaseText(target);
			applyTeaseDamage(attacker, target, teaseCount, "BUTT", likeAdjustments);
			processCombat();
		}
		
		private function teaseChest(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
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
			if(pc.isLactating() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION);
			
			clearOutput();
			chestTeaseText(target);
			applyTeaseDamage(attacker, target, teaseCount, "CHEST", likeAdjustments);
			processCombat();
		}
		
		private function teaseHips(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
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
			hipsTeaseText(target);
			applyTeaseDamage(attacker, target, teaseCount, "HIPS", likeAdjustments);
			processCombat();
		}
		
		private function teaseCrotch(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
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
			if (pc.hasCock() && pc.hasVagina() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HERMAPHRODITE) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HERMAPHRODITE);
			
			clearOutput();
			crotchTeaseText(target);
			applyTeaseDamage(attacker, target, teaseCount, "CROTCH", likeAdjustments);
			processCombat();
		}
		
		private function teaseSquirt(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
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
			if(pc.isLactating() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION);
			
			clearOutput();
			squirtTeaseText(target);
			applyTeaseDamage(attacker, target, teaseCount, "SQUIRT", likeAdjustments);
			processCombat();
		}
		
		private function applyTeaseDamage(attacker:Creature, target:Creature, teaseCount:Number, teaseType:String, likeAdjustments:Array = null):void
		{
			if (target is Celise)
			{
				output("\n");
				processCombat();
				return;
			}
			
			var factor:Number = 1;
			var bonus:int = 0;
			
			if (likeAdjustments && likeAdjustments.length > 0)
			{
				for (var i:int = 0; i < likeAdjustments.length; i++) factor *= likeAdjustments[i];
			}
			
			if (attacker.hasStatusEffect("Sex On a Meteor") || attacker.hasStatusEffect("Tallavarian Tingler")) totalFactor *= 1.5;
			if (target.originalRace == "nyrea" && attacker.hasPerk("Nyrean Royal")) factor *= 1.1;
			
			if (factor > 2) factor = 2;
		
			if (attacker.hasPerk("Pheromone Cloud")) bonus += 1;
			if (teaseType == "SQUIRT") bonus += 2;
			
			var sweatyBonus:int = 0;
			if(pc.hasStatusEffect("Sweaty") && target.hasPerk("Likes_Sweaty")) 
			{
				//-5 per level normally, so add twice that since we flippin it'
				sweatyBonus = pc.statusEffectv1("Sweaty") * 10;
				//Furries dont benefit quite as much.
				if(pc.hasFur()) sweatyBonus = pc.statusEffectv1("Sweaty") * 5;
			}
			
			if (target.isLustImmune || (target.willpower() / 2 + rand(20) + 1 > attacker.level * 2.5 * factor + 10 + teaseCount / 10 + attacker.sexiness() + bonus + sweatyBonus))
			{
				if(target is HandSoBot)
				{
					output("\n\n<i>“An attempt to confuse and overwhelm an enemy with an overt display of sexual dominance,”</i> says So. She sounds genuinely interested. <i>“An unorthodox but effective strategy in many known organic cultures’ approach to war. I was unaware sentients of a human upbringing had any experience of such a thing, however. Perhaps that explains why you are attempting it against a foe that cannot in any way feel desire.”</i>\n");
				}
				else if(target.isLustImmune == true) 
				{
					output("\n<b>" + target.capitalA + target.short + " </b>");
					if(target.plural) output("<b>don't</b>");
					else output("<b>doesn't</b>");
					output("<b> seem to care to care for your erotically-charged display. (0)</b>\n");
				}
				else if(asSquirt) 
				{
					output("\nYour milk goes wide. (0)\n");
					teaseSkillUp(teaseType);
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
			else
			{
				var damage:Number = 10 * (teaseCount / 100 + 1) + attacker.sexiness() / 2 + sweatyBonus / 2;
				if (teaseType == "SQUIRT") damage += 5;
				if (attacker.hasPerk("Pheromone Cloud")) damage += 1 + rand(4);
				damage *= (rand(31) + 85) / 100;
				
				if (damage > 15 + attacker.level * 2) damage = 15 + attacker.level * 2;
				damage *= factor;
				
				damage = (1 - (target.getLustResistances().tease.damageValue / 100)) * damage;
				if (damage > 25 + attacker.level * 2) damage = 25 + attacker.level * 2;
				
				if(target.lust() + damage > target.lustMax()) damage = target.lustMax() - target.lust();
			damage = Math.ceil(damage);
			
				output("\n");
				if(teaseType == "squirt") 
				{
					if(target.plural) output(target.capitalA + target.short + " are splattered with your [pc.milk], unable to get it off. All of a sudden, their faces begin to flush, and they look quite aroused.");
					else output(target.capitalA + target.short + " is splattered with your [pc.milk], unable to get it off. All of a sudden, " + target.mfn("his","her","its") + " " + target.face() + " begins to flush, and " + target.mfn("he","she","it") + " looks quite aroused.");
				}
				else output(teaseReactions(damage,target));
				target.lust(damage);
				output(" ("+ damage + ")\n");
				teaseSkillUp(teaseType);
				if(target is MyrInfectedFemale && damage >= 10)
				{
					output("<b>Your teasing has the poor girl in a shuddering mess as she tries to regain control of her lust addled nerves.</b>\n");
					var stunDur:int = 1 + rand(2);
					target.createStatusEffect("Stunned",stunDur,0,0,0,false,"Stun","Cannot take action!",true,0);
					target.createStatusEffect("Lust Stunned",stunDur,0,0,0,true,"Stun","Cannot take action!",true,0);
				}
			}
		}
		
		private function teaseSkillUp(teaseType:String):void
		{
			if (teaseType == "SQUIRT") teaseType = "CHEST";
			flags["TIMES_" + teaseType + "_TEASED"]++; // the menu display handles wrapping this so w/e
		}
		
		private function generateSenseMenu():void
		{
			
		}
		
		private function checkForLoss():Boolean
		{
			if (playerLossCondition())
			{
				showCombatUI();
				clearMenu();
				addButton(0, "Defeat", _lossFunction);
				return true;
			}
			else if (hasEnemyOfClass(Naleen) || hasEnemyOfClass(NaleenMale))
			{
				if (pc.hasStatusEffect("Naleen Venom") && (pc.physique() == 0 || pc.willpower() == 0))
				{
					showCombatUI();
					clearMenu();
					addButton(0, "Defeat", _lossFunction);
					return true;
				}
			}
			return false;
		}
		
		private function checkForVictory():Boolean
		{
			if (playerVictoryCondition())
			{
				showCombatUI();
				clearMenu();
				addButton(0, "Victory", _victoryFunction);
				return true;
			}
			return false;
		}
		
		public function CombatContainer()
		{ 
			_roundCounter = 0;
			
			genericVictory = function():void {
				clearMenu();
				addButton(0, "Next", mainGameMenu);
			}
			
			genericLoss = function():void {
				clearMenu();
				addButton(0, "Next", mainGameMenu);
			}
		}
		
		private var _initForRound:int = -1;
		public function doneRoundActions():Boolean
		{
			if (_initForRound == _roundCounter) return true;
			return false;
		}
		
		public var genericLoss:Function;
		public var genericVictory:Function;
		
		protected var _roundCounter:int = 0;
		public function get roundCounter():int { return _roundCounter; }
		
		protected var _entryFunction:Function;
		
		public function get entryFunction():Function { return _entryFunction; }
		public function set entryFunction(v:Function):void { _entryFunction = v; }
		
		protected var _victoryFunction:Function;
		protected var _lossFunction:Function;
		public function victoryScene(func:Function):void
		{
			_victoryFunction = func;
		}
		public function lossScene(func:Function):void
		{
			_lossFunction = func;
		}
		
		protected var _friendlies:Array = null;
		protected var _hostiles:Array = null;
		public var noImportProcess:Boolean = false;
		
		public function setPlayerGroup(... args):void
		{
			if (args.length > 1)
			{
				_friends = args;
			}
			else if (args.length == 1)
			{
				if (args[0] is Array)
				{
					_friendlies = args[0];
				}
				else if (args[0] is Creature)
				{
					_friendlies = [args[0]];
				}
			}
		}
		public function setEnemyGroup(... args):void
		{
			if (args.length > 1)
			{
				_hostiles = args;
			}
			else if (args.length == 1)
			{
				if (args[0] is Array)
				{
					_hostiles = args[0];
				}
				else if (args[0] is Creature)
				{
					_friendlies = [args[0]];
				}
			}
			
			var appends:Array = ["A", "B", "C", "D", "E"];
			var appendNum:int = 0;
			
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!(_hostiles[i] is Creature)) throw new Error("Attempted to use a non-creature object in Ground Combat.");
				
				// Append ident chars to creature names
				if ((_hostiles[i] as Creature).isUniqueInFight == false)
				{
					_hostiles[i].short += " " + appends[appendNum];
					_hostiles[i].long += " " + appends[appendNum];
					_hostiles[i].btnTargetText += " " + appends[appendNum];
					appendNum++;
				}
				
				_hostiles[i].arrayIdx = i;
			}
			
			userInterface().initHostilePartyBars();
		}
		
		public var victoryCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var victoryArgument:Number = Number.NaN;
		public var lossCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var lossArgument:Number = Number.NaN;
		
		protected var _combatEffects:Object = { };
		public function addCombatEffect(effect:StorageClass):void
		{
			if (!hasCombatEffect(effect.storageName))
			{
				_combatEffects[effect.storageName] = effect;
			}
			else
			{
				throw new Error("CombatEffect \"" + effect.storageName "\" already exists.");
			}
		}
		public function removeCombatEffect(effectName:String):void
		{
			if (hasCombatEffect(effectName))
			{
				delete _combatEffects[effectName];
			}
		}
		public function hasCombatEffect(effectName:String):Boolean
		{
			if (_combatEffects[effectName] != undefined) return true;
			return false;
		}
		
		public function doCombatCleanup():void
		{
			doCleanup(_friendlies);
		}
		
		private function doCleanup(group:Array):void
		{
			for (var i:int = 0; i < group.length; i++)
			{
				doCleanupFor(group[i]);
			}
		}
		
		private function doCleanupFor(target:Creature):void
		{
			// Remove all combat effects
			target.clearCombatStatuses();
			target.alreadyDefeated = false;
		}
		
		public function beginCombat():void
		{
			validateContainer();
			showCombatDescriptions();
			showCombatUI();
			showCombatMenu();
		}
		
		private function validateContainer():void
		{
			if (_victoryFunction == null) throw new Error("No victory function has been specified.");
			if (_lossFunction == null) throw new Error("No loss function has been specified.");
		}
		
		public function showCombatUI():void
		{
			userInterface().showPlayerParty();
			userInterface().setPlayerPartyData(_friendlies);
			userInterface().showEnemyParty();
			userInterface().setEnemyPartyData(_hostiles);
		}
		
		private function showCombatDescriptions():void
		{
			output("You're fighting " + num2Text(enemiesAlive()) + " hostiles.");
			
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				displayHostileStatus(_hostiles[i]);
			}
		}
		
		private function displayHostileStatus(target:Creature):void
		{
			if (target.HP() <= 0)
			{
				output("\n\n<b>You've knocked the resistance out of " + target.a + target.short + ".</b>");
			}
			else if (target.lust() >= target.lustMax())
			{
				output("\n\n<b>" + target.capitalA + target.short + ((target.plural == true) ? " are" : " is") + " too turned on to fight.</b>");
			}
			else
			{
				var pHealth:Number = target.HP() / target.HPMax();
				var pShield:Number = target.shieldsRaw / target.shieldsMax();
				
				pHealth *= 100;
				pShield *= 100;
				
				var dHealth:int = Math.round(pHealth);
				var dShield:int = Math.round(pShield);
								
				output("\n\n" + target.long + " (<b>S: " + dShield + "% / H: " + dHealth + "%</b>)");
			}
		}
		
		public function processCombat():void
		{
			processFriendlyGroupActions();
		}
		
		private function processFriendlyGroupActions():void
		{
			applyFriendlyActions();
			updateStatusEffects(_friendlies);
			updateCooldowns(_friendlies);
			
			// Mark anything that the players group has beaten as done so now, so that it
			// cannot act during the next hostile group update
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i].isDefeated() && _hostiles[i].alreadyDefeated == false)
				{
					_hostiles[i].alreadyDefeated = true;
					output("\n\n" + _hostiles[i].capitalA + _hostiles[i].short + " falls to the ground,");
					if (_hostiles[i].HP() <= 0) output(" defeated.");
					else output(" stricken with lust.");
				}
				else if (_hostiles[i].isDefeated() && _hostiles[i].alreadyDefeated == true)
				{
					output("\n\n" + _hostiles[i].capitalA + _hostiles[i].short + " lies on the ground, defeated.");
				}
			}
			
			// Add an early-out to avoid a hostile-round-display where no actions can be
			// done
			if (checkForVictory()) return;
			
			// Force a combatUI update
			showCombatUI();
			
			// If the player is not alone, scene-break
			if (_friendlies.length > 1)
			{
				clearMenu();
				addButton(0, "Next", processHostileGroupActions);
			}
			// Otherwise, tag the hostile actions on straight after
			else
			{
				processHostileGroupActions();
			}
		}
		
		private function applyFriendlyActions():void
		{
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				if (_friendlies[i].isDefeated())
				{
					continue;
				}
				
				if (_friendlies[i].hasStatusEffect("Grappled"))
				{
					doStruggleRecover(_friendlies[i]);
					continue;
				}
				
				if (_friendlies[i].hasStatusEffect("Stunned"))
				{
					doStunRecover(_friendlies[i]);
					continue;
				}
				
				_friendlies[i].CombatAI(_friendlies, _hostiles);
			}
		}
		
		private function processHostileGroupActions():void
		{
			if (_friendlies.length > 1)
			{
				clearOutput();
				output("<b>Hostile party actions:</b>");
			}
			
			applyHostileActions();
			updateStatusEffects(_hostiles);
			updateCooldowns(_hostiles);
			
			// Early-out in case a DOT tick defeated enemies
			if (checkForVictory()) return;
			
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				if ((_friendlies[i] as Creature).isDefeated() && _friendlies[i].alreadyDefeated == false)
				{
					_friendlies[i].alreadyDefeated = true;
					if (_friendlies[i] is PlayerCharacter) output("\n\nYou fall to the ground,");
					else output("\n\n" + _friendlies[i].capitalA + _friendlies[i].short + " falls to the ground,");
					if (_friendlies[i].HP() <= 0) output(" defeated.");
					else output(" stricken with lust.");
				}
			}
			
			postHostileTurnActions();
			showCombatUI();
			
			// Early-out if the players group lost
			if (checkForVictory()) return;
			if (checkForLoss()) return;
			
			_roundCounter++;
			
			// Same as post-friendly actions- player solo -> straight to menu
			if (_friendlies.length > 1)
			{
				removeAllButtonHighlights();
				clearMenu();
				addButton(0, "Next", showCombatMenu);
			}
			else
			{
				showCombatMenu();
			}
		}
		
		private function applyHostileActions():void
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				var target:Creature = _hostiles[i];
				
				if (target.isDefeated()) continue;
				
				if (target.hasStatusEffect("Grappled"))
				{
					doStruggleRecover(target);
					continue;
				}
				
				if (target.hasStatusEffect("Stunned"))
				{
					doStunRecover(target);
					continue;
				}
				
				if (target.hasStatusEffect("Tripped"))
				{
					doTripRecover(target);
					continue;
				}
				
				target.CombatAI(_hostiles, _friendlies);
			}
		}
		
		private function updateCooldowns(group:Array):void
		{
			for (var i:int = 0; i < group.length; i++)
			{
				updateCooldownsFor(group[i]);
			}
		}
		
		private function updateCooldownsFor(target:Creature):void
		{
			var remove:Array = [];
			
			for (var i:int = 0; i < target.statusEffects.length; i++)
			{
				var se:StorageClass = target.statusEffects[i];
				
				if (se.storageName.indexOf("Cooldown") != -1)
				{
					if (se.value2 == 0) // V2 != 0 == till-end-of-combat cooldown
					{
						se.value1--; // Only decrement cooldowns we actually want here.
						
						if (se.value1 < 0)
						{
							remove.push(se.storageName);
						}
					}
				}
			}
			
			for (i = 0; i < remove.length; i++)
			{
				target.removeStatusEffect(remove[i]);
			}
		}
		
		private function playerVictoryCondition():Boolean
		{
			if (victoryCondition == CombatManager.ENTIRE_PARTY_DEFEATED)
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated()) return false;
				}
				return true;
			}
			else if (victoryCondition == CombatManager.SURVIVE_WAVES)
			{
				if (isNaN(victoryArgument) || victoryArgument <= 0) throw new Error("Wave survival declared as a win condition, with no target waves defined.");
				if (_roundCounter >= victoryArgument) return true;
				return false;
			}
			else if (victoryCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
			{
				if (isNaN(victoryArgument)) throw new Error("Unique target for victory declared as a win condition, with no target defined.");
				if (_hostiles[victoryArgument].isDefeated()) return true;
				return false;
			}
			
			return false;
		}
		
		private function playerLossCondition():Boolean
		{
			if (lossCondition == CombatManager.ENTIRE_PARTY_DEFEATED)
			{
				for (var i:int = 0; i < _friendlies.length; i++)
				{
					if (!_friendlies[i].isDefeated()) return false;
				}
				return true;
			}
			else if (lossCondition == CombatManager.SURVIVE_WAVES)
			{
				if (isNaN(lossArgument) || lossArgument <= 0) throw new Error("Wave limit declared as a loss condition, with no target defined.");
				if (_roundCounter >= lossArgument) return true;
				return false;
			}
			else if (lossCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
			{
				if (isNaN(lossArgument)) throw new Error("Unique target for loss as a win condition, with no target defined.");
				if (_friendlies[lossArgument].isDefeated()) return true;
				return false;
			}
			
			return false;
		}
		
		public function doCombatCleanup():void
		{
			doCleanup(_friendlies);
		}
		
		private function doCleanup(group:Array):void
		{
			for (var i:int = 0; i < group.length; i++)
			{
				var target:Creature = group[i];
				target.clearCombatStatuses();
				target.alreadyDefeated = false;
			}
		}
		
		public function enemiesAlive():int
		{
			var num:int = 0;
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated()) num++;
			}
			return num;
		}
		
		public function hasEnemyOfClass(classT:Class):Boolean
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles is classT) return true;
			}
			return false;
		}
	}

}