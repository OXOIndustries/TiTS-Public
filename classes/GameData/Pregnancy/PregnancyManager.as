package classes.GameData.Pregnancy 
{
	import classes.Creature;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PregnancyManager 
	{
		// Would use a vector, but vectors can't store derived types. WORST VECTOR CLASS EVER.
		private var _pregHandlers:Array;
		
		public function PregnancyManager() 
		{
			_pregHandlers = new Array();
		}
		
		// System data functions
		public function insertNewHandler(pHandler:BasePregnancyHandler):void
		{
			_pregHandlers[pHandler.handlesType] = pHandler;
		}
		
		private function findHandler(pType:int):BasePregnancyHandler
		{
			if (_pregHandlers[pType] != undefined) return _pregHandlers[pType];
			return null;
		}
		
		// Usage functions
		public function updatePregnancyStages(creatures:Array, tMinutes:int):void
		{
			for (var i:int = 0; i < creatures.length; i++)
			{
				updateStageForCreature(creatures[i], tMinutes);
			}
		}
		
		private function updateStageForCreature(tarCreature:Creature, tMinutes:int):void
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
		
		public function tryImpregnateCreature(tarCreature:Creature, sourceCreature:Creature):Boolean
		{
			
		}
	}

}