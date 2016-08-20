package classes.GameData 
{
	import classes.Creature;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.Engine.Interfaces.*;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CombatManager 
	{
		/**
		 * Dump combat state entirely, but don't run any of the clean up mechanics- intended to reset state during new-game/load-game spool up.
		 */
		public static function TerminateCombat():void
		{
			combatContainer = null;
		}
		private static var combatContainer:CombatContainer = null;
		
		public static function get inCombat():Boolean
		{
			if (combatContainer == null) return false;
			return true;
		}
		
		public static function newGroundCombat():void
		{
			combatContainer = new CombatContainer();
			victoryCondition(ENTIRE_PARTY_DEFEATED);
			lossCondition(SPECIFIC_TARGET_DEFEATED, kGAMECLASS.pc);
		}
		
		public static function displayLocation(r:String, p:String = null, s:String = null):void
		{
			combatContainer.roomString = r;
			combatContainer.planetString = p;
			combatContainer.systemString = s;
		}
		
		public static function encounterText(tText:String):void
		{
			combatContainer.encounterText = tText;
		}
		
		private static var _friendlyCharacters:Array;
		public static function setFriendlyCharacters(... args):void
		{
			if (args.length == 0) throw new Error("Invalid arguments");
			var param:Array;
			
			if (args[0] is Array) param = args[0];
			else param = args;
			
			combatContainer.setPlayerGroup(param);
			_friendlyCharacters = param;
		}
		public static function getFriendlyCharacters():Array
		{
			return _friendlyCharacters;
		}
		public static function addFriendlyCreature(newC:Creature):void
		{
			combatContainer.addFriendlyCreature(newC);
		}
		
		private static var _hostileCharacters:Array;
		public static function setHostileCharacters(... args):void
		{
			if (args.length == 0) throw new Error("Invalid arguments");
			
			var param:Array;
			if (args[0] is Array) param = args[0];
			else param = args;
			
			combatContainer.setEnemyGroup(param);
			_hostileCharacters = param;
		}
		public static function getHostileCharacters():Array
		{
			return _hostileCharacters;
		}
		public static function addHostileCreature(newC:Creature):void
		{
			combatContainer.addHostileCreature(newC);
		}
		
		public static const SPECIFIC_TARGET_DEFEATED:String = "target_defeat";
		public static const ENTIRE_PARTY_DEFEATED:String = "all_defeated";
		public static const SURVIVE_WAVES:String = "survival";
		public static const ESCAPE:String = "escape";
		
		public static function victoryCondition(condition:String, arg:* = undefined):void
		{
			combatContainer.victoryCondition = condition;
			combatContainer.victoryArgument = arg;
		}
		
		public static function victoryScene(func:Function):void
		{
			combatContainer.victoryScene(func);
		}
		
		public static function lossCondition(condition:String, arg:* = undefined):void
		{
			combatContainer.lossCondition = condition;
			combatContainer.lossArgument = arg;
		}
		
		public static function lossScene(func:Function):void
		{
			combatContainer.lossScene(func);
		}
		
		public static function entryScene(func:Function):void
		{
			combatContainer.entryFunction = func;
		}
		
		public static function beginCombat():void
		{
			combatContainer.beginCombat();
		}
	
		public static function resetCombat():void
		{
			clearOutput();
			var exec:Function = combatContainer.entryFunction;
			combatContainer.doCombatCleanup();
			combatContainer = null;
			
			// better solution would be to serialize characters when set using setFriendlyChars() and keep them- would reset all details (f.ex non-combat status durations etc)
			for (var i:int = 0; i < _friendlyCharacters.length; i++)
			{
				var char:Creature = _friendlyCharacters[i];
				char.HP(char.HPMax());
				char.shieldsRaw = char.shieldsMax();
				char.clearCombatStatuses();
			}
			
			exec();
		}
		
		public static function genericVictory():void
		{
			combatContainer.genericVictory();
			postCombat();
		}
		public static function genericLoss():void
		{
			combatContainer.genericLoss();
			postCombat();
		}
		public static function postCombat():void
		{
			combatContainer.doCombatCleanup();
			combatContainer = null;
		}
		public static function abortCombat():void
		{
			if (combatContainer)
			{
				combatContainer.doCombatCleanup();
				combatContainer = null;
			}
			clearMenu();
			addButton(0, "Next", function():void {
				userInterface().mainButtonsReset();
				userInterface().hideNPCStats();
				userInterface().leftBarDefaults();
				kGAMECLASS.mainGameMenu();
			});
		}
		public static function showCombatMenu():void
		{
			if (combatContainer) combatContainer.showCombatMenu();
		}
		public static function showCombatUI():void
		{
			if (combatContainer) combatContainer.showCombatUI();
		}
		public static function processCombat():void
		{
			if (combatContainer) combatContainer.processCombat();
		}
		public static function getRoundCount():int
		{
			if (combatContainer) return combatContainer.roundCounter;
			return -1;
		}
		public static function getCreaturesGroup(c:Creature):Array
		{
			if (_hostileCharacters.indexOf(c) == -1) return _friendlyCharacters;
			return _hostileCharacters;
		}
		public static function getCreaturesOpposition(c:Creature):Array
		{
			if (_hostileCharacters.indexOf(c) != -1) return _friendlyCharacters;
			return _hostileCharacters;
		}
		public static function continueCombat():void
		{
			if (combatContainer) combatContainer.endCombatRound();
		}
		public static function multipleEnemies():Boolean
		{
			if (_hostileCharacters.length > 1) return true;
			if ((_hostileCharacters[0] as Creature).isPlural) return true;
			return false;
		}
		public static function hasEnemyOfClass(t:Class):Boolean
		{
			if (combatContainer) return combatContainer.hasEnemyOfClass(t);
			return false;
		}
		public static function hasFriendlyOfClass(t:Class):Boolean
		{
			if (combatContainer) return combatContainer.hasFriendlyOfClass(t);
			return false;
		}
		public static function enemiesAlive():int
		{
			if (combatContainer) return combatContainer.enemiesAlive();
			return -1;
		}
		
		public static function addCombatEffect(effect:StorageClass):void
		{
			if (combatContainer) combatContainer.addCombatEffect(effect);
		}
		public static function removeCombatEffect(effectName:String):void
		{
			if (combatContainer) combatContainer.removeCombatEffect(effectName);
		}
		public static function hasCombatEffect(effectName:String):void
		{
			if (combatContainer) combatContainer.hasCombatEffect(effectName);
		}
		public static function getCombatEffect(effectName:String):StorageClass
		{
			if (combatContainer) return combatContainer.getCombatEffect(effectName);
			return null;
		}
	}

}