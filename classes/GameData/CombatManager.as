package classes.GameData 
{
	import classes.Creature;
	import classes.Ships.SpaceShip;
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
			combatContainer = new GroundCombatContainer();
			victoryCondition(ENTIRE_PARTY_DEFEATED);
			lossCondition(SPECIFIC_TARGET_DEFEATED, kGAMECLASS.pc);
		}
		
		public static function newSpaceCombat():void
		{
			combatContainer = new SpaceCombatContainer();
			victoryCondition(ENTIRE_PARTY_DEFEATED);
			lossCondition(SPECIFIC_TARGET_DEFEATED, kGAMECLASS.shipDb.ActivePlayerShip);
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
		public static function encounterTextGenerator(tFunc:Function):void
		{
			combatContainer.encounterTextGenerator = tFunc;
		}
		
		private static var _friendlyActors:Array;
		public static function setFriendlyActors(... args):void
		{
			if (args.length == 0) throw new Error("Invalid arguments");
			var param:Array;
			
			if (args[0] is Array) param = args[0];
			else param = args;
			
			combatContainer.setPlayerGroup(param);
			_friendlyActors = param;
		}
		
		public static function getFriendlyActors():Array
		{
			return _friendlyActors;
		}
		
		public static function addFriendlyActor(newC:*):void
		{
			combatContainer.addFriendlyActor(newC);
		}
		public static function removeFriendlyActor(remC:*):void
		{
			combatContainer.removeFriendlyActor(remC);
		}
		
		private static var _hostileActors:Array;
		public static function setHostileActors(... args):void
		{
			if (args.length == 0) throw new Error("Invalid arguments");
			
			var param:Array;
			if (args[0] is Array) param = args[0];
			else param = args;
			
			combatContainer.setEnemyGroup(param);
			_hostileActors = param;
		}
		public static function getHostileActors():Array
		{
			return _hostileActors;
		}
		
		public static function addHostileActor(newC:*):void
		{
			combatContainer.addHostileActor(newC);
		}
		
		public static function removeHostileActor(remC:*):void
		{
			combatContainer.removeHostileActor(remC);
		}
		
		public static const SPECIFIC_TARGET_DEFEATED:String = "target_defeat";
		public static const ENTIRE_PARTY_DEFEATED:String = "all_defeated";
		public static const SURVIVE_WAVES:String = "survival";
		public static const ESCAPE:String = "escape";
		public static const ANY_TARGET_DEFEATED:String = "single_target_defeat";
		
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
		
		public static function beginCombat():void
		{
			combatContainer.beginCombat();
		}
			
		public static function genericVictory(func:Function = null):void
		{
			combatContainer.genericVictory(func);
			postCombat();
		}
		public static function genericLoss(func:Function = null):void
		{
			combatContainer.genericLoss(func);
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
			addButton(0, "Next", postAbortCombat);
		}
		public static function abortCombatDeferred(nextScene:Function):void
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
				nextScene();
			});
		}
		public static function postAbortCombat():void
		{
			userInterface().mainButtonsReset();
			userInterface().hideNPCStats();
			userInterface().leftBarDefaults();
			kGAMECLASS.mainGameMenu();
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
		public static function getActorsGroup(c:*):Array
		{
			if (!(c is Creature) && !(c is SpaceShip)) throw new Error("getActorsGroup called with an invalid object.");
			
			if (_hostileActors.indexOf(c) == -1) return _friendlyActors;
			return _hostileActors;
		}
		public static function getActorsOpposition(c:*):Array
		{
			if (!(c is Creature) && !(c is SpaceShip)) throw new Error("getActorsOpposition called with an invalid object.");
			
			if (_hostileActors.indexOf(c) != -1) return _friendlyActors;
			return _hostileActors;
		}
		public static function continueCombat():void
		{
			if (combatContainer) combatContainer.endCombatRound();
		}
		public static function multipleEnemies():Boolean
		{
			if (_hostileActors.length > 1) return true;
			if (combatContainer is GroundCombatContainer && (_hostileActors[0] as Creature).isPlural) return true;
			return false;
		}
		public static function hasEnemyOfClass(t:Class):Boolean
		{
			if (combatContainer) return combatContainer.hasEnemyOfClass(t);
			return false;
		}
		public static function getEnemyOfClass(t:Class):*
		{
			if (combatContainer) return combatContainer.getEnemyOfClass(t);
			return null;
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
		public static function hasCombatEffect(effectName:String):Boolean
		{
			if (combatContainer) return combatContainer.hasCombatEffect(effectName);
			return false;
		}
		public static function getCombatEffect(effectName:String):StorageClass
		{
			if (combatContainer) return combatContainer.getCombatEffect(effectName);
			return null;
		}
		public static function getCombatRange():uint
		{
			if (!(combatContainer is SpaceCombatContainer)) throw new Error("Range is only applicable to space combat scenarios.");
			return (combatContainer as SpaceCombatContainer).CurrentCombatRange;
		}
	}

}