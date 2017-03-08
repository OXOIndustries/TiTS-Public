package classes.GameData 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Items.Accessories.SiegwulfeItem; 
	import classes.Items.Apparel.Harness;
	import classes.Items.Armor.GooArmor;
	import classes.ItemSlotClass;
	import classes.StorageClass;
	import classes.Engine.Interfaces.*;
	import classes.Characters.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	import classes.Engine.Utility.plural;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.applyDamage;
	import classes.GLOBAL;
	import flash.utils.Dictionary;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.outputDamage;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.*;
	import classes.Engine.Utility.num2Text;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.Util.InCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class CombatContainer 
	{
		public static const NO_GROUP:String = "no_group";
		public static const FRIENDLY_GROUP:String = "friendly_group";
		public static const HOSTILE_GROUP:String = "hostile_group";
		
		protected function get pc():PlayerCharacter { return kGAMECLASS.pc; }
		protected function get flags():Dictionary { return kGAMECLASS.flags; }
		
		public var genericVictory:Function;
		public var genericLoss:Function;

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
		
		public var encounterText:String = null;
		public var encounterTextGenerator:Function = null;
		
		public var roomString:String = null;
		public var planetString:String = null;
		public var systemString:String = null;
			
		public function displayFightLocation():void
		{
			throw new Error("displayFightLocation has not be overriden.");
		}
		
		public function get roundCounter():int
		{ 
			throw new Error("roundCounter() hasn't been overriden."); 
			return 0; 
		}
		
		public function beginCombat():void
		{
			throw new Error("beginCombat has not been overriden.");
		}
		
		public function showCombatMenu():void
		{
			throw new Error("showCombatMenu has not been overriden.");
		}
		
		public function processCombat():void
		{
			throw new Error("processCombat has not been overriden.");
		}
		
		public function endCombatRound():void
		{
			throw new Error("endCombatRound has not been overriden.");
		}
		
		public function doneRoundActions():Boolean
		{
			throw new Error("doneRoundActions has not been overriden.");
		}
		
		public function getCombatPrizes():void
		{
			throw new Error("getCombatPrizes has not been overriden.");
		}

		public function CombatContainer()
		{ 
		
		}
		

		

		public var noImportProcess:Boolean = false;
		
		private function prepFriendlyForCombat(target:Creature):void
		{
			target.droneTarget = null;
			target.alreadyDefeated = false;
			if (!(target is PlayerCharacter))
			{
				// TODO: Realistically, characters that join the player in combat should be subject to the same passage of time rules... but that's another story
				target.HPRaw = target.HPMax();
				target.shieldsRaw = target.shieldsMax();
				target.lustRaw = 0;
			}
		}
		
		private function prepHostileForCombat(target:Creature):void
		{
			target.droneTarget = null;
		}
		
		public function setPlayerGroup(... args):void
		{
			if (args.length > 1)
			{
				_friendlies = args;
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
			
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				prepFriendlyForCombat(_friendlies[i]);
				makeCharacterUnique(_friendlies[i], FRIENDLY_GROUP);
			}
		}
		public function addFriendlyCreature(newC:Creature):void
		{
			prepFriendlyForCombat(newC);
			_friendlies.push(newC);
			makeCharacterUnique(newC, FRIENDLY_GROUP);
			showCombatUI();
		}
		
		// Store the next for name-append in the class, so we can use it
		// later if we need it.		
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
					_hostiles = [args[0]];
				}
			}
			
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				prepHostileForCombat(_hostiles[i]);
				makeCharacterUnique(_hostiles[i], HOSTILE_GROUP);
			}
		}
		public function addHostileCreature(newC:Creature):void
		{
			prepHostileForCombat(newC);
			_hostiles.push(newC);
			makeCharacterUnique(newC, HOSTILE_GROUP);
			showCombatUI(); // force an update
		}
		
		public function removeHostileCreature(remC:Creature):void
		{
			_hostiles.splice(_hostiles.indexOf(remC), 1);
			showCombatUI();
		}
		
		private function makeCharacterUnique(target:Creature, asGroup:String):void
		{
			var appends:Array = ["A", "B", "C", "D", "E"];
			
			var thisIndex:int = 0;
			var hasSameType:Boolean = false;
			var tType:Class = Class(getDefinitionByName(getQualifiedClassName(target)));
			var collection:Array = (asGroup == HOSTILE_GROUP ? _hostiles : _friendlies);
			
			var currIndex:int = 0;
			
			// Loop over all the current creatures
			for (var i:int = 0; i < collection.length; i++)
			{
				var currTarget:Creature = collection[i] as Creature;
				
				// Looking for creatures of the same type as the one we're adding
				if (currTarget is tType && currTarget != target)
				{
					// Fuck it, just force set these every time through :V
					/*
					// Check if it has a unique character appended
					var lastChar:String = currTarget.uniqueName.charAt(currTarget.uniqueName.length - 1);
					
					// If it doesn't, append the one relative to the currentTargets position in the array
					if (!InCollection(lastChar, appends))
					{
					*/
						currTarget.uniqueName = currTarget.short + " " + appends[currIndex];
						currTarget.buttonText = currTarget.btnTargetText + " " + appends[currIndex];
					/*
					}
					*/
					hasSameType = true;
					currIndex++;
				}
			}
			
			// We ain't fiddled the one we're adding, so it'll be unique so just treat it as such
			if (!hasSameType)
			{
				target.uniqueName = target.short;
				target.buttonText = target.btnTargetText;
			}
			else
			{
				target.uniqueName = target.short + " " + appends[currIndex];
				target.buttonText = target.btnTargetText + " " + appends[currIndex];
			}
		}
		
		public var victoryCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var victoryArgument:* = null;
		public var lossCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var lossArgument:* = null;
		
		protected var _combatEffects:Object = { };
		public function addCombatEffect(effect:StorageClass):void
		{
			if (!hasCombatEffect(effect.storageName))
			{
				_combatEffects[effect.storageName] = effect;
			}
			else
			{
				throw new Error("CombatEffect \"" + effect.storageName + "\" already exists.");
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
		public function getCombatEffect(effectName:String):StorageClass
		{
			if (_combatEffects[effectName] != undefined) return _combatEffects[effectName];
			return null;
		}
		
		public function doCombatCleanup():void
		{
			kGAMECLASS.setEnemy(null);
			kGAMECLASS.setAttacker(null);
			kGAMECLASS.setTarget(null);
			
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
		

		

		
		public function showCombatUI(setAsInit:Boolean = false):void
		{
			if (setAsInit)
			{
				userInterface().resetNPCStats();
				if (_friendlies.length > 1) userInterface().resetPCStats();
			}
			
			userInterface().showPlayerParty(_friendlies, false);
			userInterface().showHostileParty(_hostiles, false);
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
				if (_hostiles[i] is classT) return true;
			}
			return false;
		}
		
		public function getEnemyOfClass(classT:Class):Creature
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i] is classT) return _hostiles[i];
			}
			return null;
		}

		public function hasDickedEnemy():Boolean
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i].hasCock()) return true;
			}
			return false;
		}

		public function hasFriendlyOfClass(classT:Class):Boolean
		{
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				if (_friendlies[i] is classT) return true;
			}
			return false;
		}
		

	}
}
