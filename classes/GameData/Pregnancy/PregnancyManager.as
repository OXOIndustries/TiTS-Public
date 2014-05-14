package classes.GameData.Pregnancy 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PregnancyManager 
	{
		{
			_pregHandlers = new Array();
		}
		
		// Would use a vector, but vectors can't store derived types. WORST VECTOR CLASS EVER.
		private static var _pregHandlers:Array;
		
		// No new plz
		private PregnancyManager() { }
		
		
		// System data functions
		public static function insertNewHandler(pHandler:BasePregnancyHandler):void
		{
			_pregHandlers[pHandler.handlesType] = pHandler;
		}
		
		private static function findHandler(pType:String):BasePregnancyHandler
		{
			if (_pregHandlers[pType] != undefined) return _pregHandlers[pType];
			return null;
		}
		
		// Usage functions
		public static function updatePregnancyStages(creatures:Array, tMinutes:int):void
		{
			for (var i:int = 0; i < creatures.length; i++)
			{
				updateStageForCreature(creatures[i], tMinutes);
			}
		}
		
		private static function updateStageForCreature(tarCreature:Creature, tMinutes:int):void
		{
			if (tarCreature.isPregnant())
			{
				for (var i:int = 0; i < tarCreature.pregnancyIncubations.length; i++)
				{
					if (_pregHandlers[tarCreature.pregnancyIncubations[i]] != null)
					{
						_pregHandlers[tarCreature.pregnancyIncubations[i]].updatePregnancyStage(tarCreature, tMinutes);
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
			BasePregnancyHandler pHandler = PregnancyManager.findHandler(npc.impregnationType);
			
			if (pHandler != null) pHandler.tryKnockUp(father, mother, pregSlot);
		}
		
		public static function tryKnockUpNPCs(father:Creature, mother:Creature, pregSlot:int):Boolean
		{
			throw new Error("Not implemented yet.");
		}
	}

}