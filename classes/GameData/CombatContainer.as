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
			// sense
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