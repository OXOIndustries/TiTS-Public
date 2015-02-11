package classes.GameData.Pregnancy 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.GameData.Pregnancy.Handlers.CockvinePregnancy;
	import classes.GameData.Pregnancy.Handlers.NyreaHuntressPregnancy;
	import classes.GameData.Pregnancy.Handlers.RenvraEggPregnancy;
	import classes.GameData.Pregnancy.Handlers.RenvraFullPregnancy;
	import classes.GameData.Pregnancy.Handlers.VenusPitcherFertilizedSeedCarrierHandler;
	import classes.GameData.Pregnancy.Handlers.VenusPitcherSeedCarrierPregnancyHandler;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PregnancyManager 
	{
		{
			_pregHandlers = new Array();
			
			PregnancyManager.insertNewHandler(new VenusPitcherFertilizedSeedCarrierHandler());
			PregnancyManager.insertNewHandler(new VenusPitcherSeedCarrierPregnancyHandler());
			PregnancyManager.insertNewHandler(new RenvraEggPregnancy());
			PregnancyManager.insertNewHandler(new RenvraFullPregnancy());
			PregnancyManager.insertNewHandler(new CockvinePregnancy());
			PregnancyManager.insertNewHandler(new NyreaHuntressPregnancy());
		}
		
		// Would use a vector, but vectors can't store derived types. WORST VECTOR CLASS EVER.
		private static var _pregHandlers:Array;
		private static var _debugTrace:Boolean = true;
		
		// System data functions
		public static function insertNewHandler(pHandler:BasePregnancyHandler):void
		{
			_pregHandlers[pHandler.handlesType] = pHandler;
		}
		
		public static function findHandler(pType:String):BasePregnancyHandler
		{
			if (_pregHandlers[pType] != undefined) return _pregHandlers[pType];
			return null;
		}
		
		// Usage functions
		public static function updatePregnancyStages(creatures:Object, tMinutes:int):void
		{
			for each (var creature:Creature in creatures)
			{
				updateStageForCreature(creature, tMinutes);
			}
		}
		
		private static function updateStageForCreature(tarCreature:Creature, tMinutes:int):void
		{
			if (tarCreature.isPregnant())
			{
				if (_debugTrace) trace("Updating pregnancy stages for " + tarCreature.short);
				
				for (var i:int = 0; i < tarCreature.pregnancyData.length; i++)
				{
					if (_pregHandlers[tarCreature.pregnancyData[i].pregnancyType] != null)
					{
						if (_debugTrace) trace("Found a valid pregnancy handler for type " + tarCreature.pregnancyData[i].pregnancyType);
						_pregHandlers[tarCreature.pregnancyData[i].pregnancyType].updatePregnancyStage(tarCreature, tMinutes, i);
					}
				}
			}
		}
		
		public static function tryKnockUp(father:Creature, mother:Creature, pregSlot:int):Boolean
		{
			// Split off to a special handler for pregnancy mechanics when the player ISN'T involved... to come. (dohoh)
			if (!father is PlayerCharacter && !mother is PlayerCharacter) return tryKnockUpNPCs(father, mother, pregSlot);
			
			// Determine which of the Creatures involved declares the pregHandler we need to use
			var npc:Creature = (father is PlayerCharacter) ? mother : father;
			
			// Grab the pregtype from the NPC and find the handler we need to process it
			var pHandler:BasePregnancyHandler = PregnancyManager.findHandler(npc.impregnationType);
			
			if (pHandler != null) 
			{
				return pHandler.tryKnockUp(father, mother, pregSlot);
			}
			else
			{
				return false;
			}
		}
		
		public static function tryKnockUpNPCs(father:Creature, mother:Creature, pregSlot:int):Boolean
		{
			throw new Error("Not implemented yet.");
		}
		
		// Fragments are large blocks of descriptive text that COULD be glued together.
		public static function getPregBellyFragment(target:Creature, slot:int):String
		{
			var pHandler:BasePregnancyHandler;
			if (target.pregnancyData[slot].pregnancyType != "")
			{
				pHandler = _pregHandlers[target.pregnancyData[slot].pregnancyType];
			}
			
			if (pHandler != null)
			{
				return pHandler.pregBellyFragment(target, slot);
			}
			
			return "ERROR: No handler found for the pregnancy. Some shit is fucked yo.";
		}
	}

}