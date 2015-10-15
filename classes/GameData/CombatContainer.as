package classes.GameData 
{
	import classes.Creature;
	import classes.StorageClass;
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
		private var _selectedTarget:Creature = null;
		private var _selectedAttack:*;
		
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
			
			generateCombatMenu();
			showCombatDescriptions();
			
			_initForRound = _roundCounter;
		}
		
		/**
		 * Generate the actual button elements for the combat menu
		 */
		private function generateCombatMenu():void
		{
			
		}
		
		private function targetSelectionMenu():void
		{
			clearMenu();
			// btn1 - show selected attack?
			
			removeAllButtonHighlights();
			
			var btnOffset:int = 0;
			
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated())
				{
					addButton(btnOffset, _hostiles[i].btnTargetText, selectTarget, _hostiles[i]);
					btnOffset++;
				}
			}
		}
		
		private function selectTarget(target:Creature):void
		{
			_selectedTarget = target;
			
			clearMenu();
			showCombatMenu();
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
	}

}