package classes.GameData 
{
	import classes.Creature;
	import fl.events.InteractionInputType;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CombatManager 
	{
		private static var combatContainer:CombatContainer = null;
		
		public static function get inCombat():Boolean
		{
			if (combatContainer == null) return false;
			return true;
		}
		
		public static function newGroundCombat():void
		{
			combatContainer = new CombatContainer();
		}
		
		private static var _friendlyCharacters:Array;
		public static function setFriendlyCharacters(... args):void
		{
			if (args.length == 0) throw new Error("Invalid arguments");
			combatContainer.setPlayerGroup(args);
			_friendlyCharacters = args;
		}
		
		private static var _hostileCharacters:Array;
		public static function setHostileCharacters(... args):void
		{
			if (args.length == 0) throw new Error("Invalid arguments");
			combatContainer.setEnemyGroup(args);
			_hostileCharacters = args;
		}
		
		public static const SPECIFIC_TARGET_DEFEATED:String = "target_defeat";
		public static const ENTIRE_PARTY_DEFEATED:String = "all_defeated";
		public static const SURVIVE_WAVES:String = "survival";
		public static const ESCAPE:String = "escape";
		
		public static function victoryCondition(condition:String, arg:Number = Number.NaN):void
		{
			combatContainer.victoryCondition = condition;
			combatContainer.victoryArgument = arg;
		}
		
		public static function victoryScene(func:Function):void
		{
			combatContainer.victoryScene = func;
		}
		
		public static function lossCondition(condition:String, arg:Number = Number.NaN):void
		{
			combatContainer.lossCondition = condition;
			combatContainer.lossArgument = arg;
		}
		
		public static function lossScene(func:Function):void
		{
			combatContainer.lossScene = func;
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
		
		public static function get genericVictory():Function
		{
			return combatContainer.genericVictory;
		}
		public static function get genericLoss():Function
		{
			return combatContainer.genericLoss;
		}
		public static function abortCombat():void
		{
			combatContainer();
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
	}

}