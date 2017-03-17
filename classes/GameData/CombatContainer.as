package classes.GameData 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Items.Accessories.SiegwulfeItem; 
	import classes.Items.Apparel.Harness;
	import classes.Items.Armor.GooArmor;
	import classes.ItemSlotClass;
	import classes.Ships.SpaceShip;
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
		public function CombatContainer()
		{ 
		
		}	
		
		public static const NO_GROUP:String = "no_group";
		public static const FRIENDLY_GROUP:String = "friendly_group";
		public static const HOSTILE_GROUP:String = "hostile_group";
		
		protected function get pc():PlayerCharacter { return kGAMECLASS.pc; }
		protected function get pcShip():SpaceShip { return kGAMECLASS.ships.activePlayerShip; }
		protected function get flags():Dictionary { return kGAMECLASS.flags; }

		public var victoryCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var victoryArgument:* = null;
		protected var _victoryFunction:Function;
		public var genericVictory:Function;
		
		public var lossCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var lossArgument:* = null;
		protected var _lossFunction:Function;
		public var genericLoss:Function;
		
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
	
		//{ region Interface
		
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
		
		public function setPlayerGroup(... args):void
		{
			throw new Error("setPlayerGroup has not been overriden.");
		}
		
		public function addFriendlyActor(newActor:*):void
		{
			throw new Error("addFriendlyActor has not been overriden.");
		}
		
		public function setEnemyGroup(... args):void
		{
			throw new Error("setEnemyGroup has not been overriden.");
		}
		
		public function addHostileActor(newActor:*):void
		{
			throw new Error("addHostileActor has not been overriden.");
		}
		
		public function removeHostileActor(actorReference:*):void
		{
			throw new Error("removeHostileActor has not been overriden.");
		}
		
		public function doCombatCleanup():void
		{
			throw new Error("doCombatCleanup has not been overriden.");
		}
		
		public function showCombatUI(setAsInit:Boolean = false):void
		{
			throw new Error("showCombatUI has not been overriden.");
		}
		
		//} endregion

		//{ region Combat state tracking
		
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
		
		//} endregion
		
		//{ region Involved creature states
		
		public function enemiesAlive():int
		{
			throw new Error("enemiesAlive has not been overriden.");
		}
		
		public function hasEnemyOfClass(classT:Class):Boolean
		{
			throw new Error("hasEnemyOfClass has not been overriden.");
		}
		
		public function getEnemyOfClass(classT:Class):*
		{
			throw new Error("getEnemyOfClass has not been overriden.");
		}
		
		public function hasFriendlyOfClass(classT:Class):Boolean
		{
			throw new Error("hasFriendlyOfClass has not been overriden.");
		}
		
		//} endregion
		
	}
}
