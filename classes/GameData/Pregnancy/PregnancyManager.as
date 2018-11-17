package classes.GameData.Pregnancy 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.Handlers.BothriocPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.BreedwellRahnPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.ButtBugPregnancy;
	import classes.GameData.Pregnancy.Handlers.ButtBugPregnancy0;
	import classes.GameData.Pregnancy.Handlers.ButtBugPregnancy1;
	import classes.GameData.Pregnancy.Handlers.ButtBugPregnancy2;
	import classes.GameData.Pregnancy.Handlers.CockvinePregnancy;
	import classes.GameData.Pregnancy.Handlers.EggTrainerCarryTraining;
	import classes.GameData.Pregnancy.Handlers.EggTrainerFauxPreg;
	import classes.GameData.Pregnancy.Handlers.FrostwyrmPregnancy;
	import classes.GameData.Pregnancy.Handlers.KorgonnePregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.LahPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.LapinaraPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.MilodanPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.NyreaHuntressPregnancy;
	import classes.GameData.Pregnancy.Handlers.OvalastingEggPregnancy;
	import classes.GameData.Pregnancy.Handlers.OviliumEggPregnancy;
	import classes.GameData.Pregnancy.Handlers.PsychicTentacles;
	import classes.GameData.Pregnancy.Handlers.QueenOfTheDeepPregnancy;
	import classes.GameData.Pregnancy.Handlers.RaskvelPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.RenvraEggPregnancy;
	import classes.GameData.Pregnancy.Handlers.RenvraFullPregnancy;
	import classes.GameData.Pregnancy.Handlers.RiyaPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.RoyalEggPregnancy;
	import classes.GameData.Pregnancy.Handlers.ShekkaPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.SydianPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.SeraSpawnPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.VenusPitcherFertilizedSeedCarrierHandler;
	import classes.GameData.Pregnancy.Handlers.VenusPitcherSeedCarrierPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.ZaaltPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.ZephyrPregnancyHandler;
	import classes.GameData.Pregnancy.Handlers.ZilPregnancyHandler;
	import classes.Items.Transformatives.AmberSeed;
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
			PregnancyManager.insertNewHandler(new LapinaraPregnancyHandler());
			PregnancyManager.insertNewHandler(new KorgonnePregnancyHandler());
			PregnancyManager.insertNewHandler(new MilodanPregnancyHandler());
			PregnancyManager.insertNewHandler(new NyreaHuntressPregnancy());
			PregnancyManager.insertNewHandler(new QueenOfTheDeepPregnancy());
			PregnancyManager.insertNewHandler(new RoyalEggPregnancy());
			PregnancyManager.insertNewHandler(new OvalastingEggPregnancy());
			PregnancyManager.insertNewHandler(new OviliumEggPregnancy());
			PregnancyManager.insertNewHandler(new EggTrainerCarryTraining());
			PregnancyManager.insertNewHandler(new EggTrainerFauxPreg());
			PregnancyManager.insertNewHandler(new PsychicTentacles());
			PregnancyManager.insertNewHandler(new SydianPregnancyHandler());
			PregnancyManager.insertNewHandler(new SeraSpawnPregnancyHandler());
			PregnancyManager.insertNewHandler(new BothriocPregnancyHandler());
			PregnancyManager.insertNewHandler(new BreedwellRahnPregnancyHandler());
			PregnancyManager.insertNewHandler(new RiyaPregnancyHandler());
			PregnancyManager.insertNewHandler(new ZaaltPregnancyHandler());
			PregnancyManager.insertNewHandler(new ZilPregnancyHandler());
			PregnancyManager.insertNewHandler(new ShekkaPregnancyHandler());
			PregnancyManager.insertNewHandler(new RaskvelPregnancyHandler());
			PregnancyManager.insertNewHandler(new FrostwyrmPregnancy());
			PregnancyManager.insertNewHandler(new LahPregnancyHandler());
			PregnancyManager.insertNewHandler(new ZephyrPregnancyHandler());
			PregnancyManager.insertNewHandler(new ButtBugPregnancy());
			PregnancyManager.insertNewHandler(new ButtBugPregnancy0());
			PregnancyManager.insertNewHandler(new ButtBugPregnancy1());
			PregnancyManager.insertNewHandler(new ButtBugPregnancy2());
		}
		
		// Would use a vector, but vectors can't store derived types. WORST VECTOR CLASS EVER.
		private static var _pregHandlers:Array;
		private static var _debugTrace:Boolean = false;
		
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
			AmberSeed.ovipositionUpdate(tarCreature, tMinutes);
			
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
			if (!(father is PlayerCharacter) && !(mother is PlayerCharacter)) return tryKnockUpNPCs(father, mother, pregSlot);
			
			// Determine which of the Creatures involved declares the pregHandler we need to use
			var npc:Creature = ((father is PlayerCharacter) ? mother : father);
			
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
			// 9999 Not implemented yet.
			return false;
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
		
		public static function hasPregnancyOfChildType(tarCreature:Creature, childType:uint):Boolean
		{
			if (!tarCreature.isPregnant()) return false;
			
			for (var i:uint = 0; i < tarCreature.pregnancyData.length; i++)
			{
				if (_pregHandlers[tarCreature.pregnancyData[i].pregnancyType] != null)
				{
					if ((_pregHandlers[tarCreature.pregnancyData[i].pregnancyType] as BasePregnancyHandler).pregnancyChildType == childType) return true;
				}
			}
			
			return false;
		}
		
		public static function getPregnancyChildType(tarCreature:Creature, pregSlot:int):int
		{
			if (!tarCreature.isPregnant(pregSlot)) return -1;
			
			return (_pregHandlers[tarCreature.pregnancyData[pregSlot].pregnancyType] as BasePregnancyHandler).pregnancyChildType;
		}
		
		public static function getLongestRemainingDuration(tarCreature:Creature):int
		{
			if (!tarCreature.isPregnant()) return -1;
			
			var longestDuration:int = -1;
			
			for (var i:uint = 0; i < tarCreature.pregnancyData.length; i++)
			{
				if (_pregHandlers[tarCreature.pregnancyData[i].pregnancyType] != null)
				{
					var cd:int = (_pregHandlers[tarCreature.pregnancyData[i].pregnancyType] as BasePregnancyHandler).getRemainingDuration(tarCreature, i);
					if (cd > longestDuration) longestDuration = cd;
				}
			}
			
			return longestDuration;
		}
		
		// We can get the actual duration once we know the slot
		public static function getNextEndingSlot(tarCreature:Creature, ignoreType:String = null):int
		{
			if (!tarCreature.isPregnant()) return -1;
			
			var shortestDuration:int = int.MAX_VALUE;
			var shortestSlot:int = -1;
			
			for (var i:uint = 0; i < tarCreature.pregnancyData.length; i++)
			{
				if (_pregHandlers[tarCreature.pregnancyData[i].pregnancyType] != null && (ignoreType == null || tarCreature.pregnancyData[i].pregnancyType != ignoreType))
				{
					var cd:int = (_pregHandlers[tarCreature.pregnancyData[i].pregnancyType] as BasePregnancyHandler).getRemainingDuration(tarCreature, i);
					if (cd < shortestDuration)
					{
						shortestDuration = cd;
						shortestSlot = i;
					}
				}
			}
			
			return shortestSlot;
		}
		
		public static function getRemainingDurationForSlot(tarCreature:Creature, pregSlot:int):int
		{
			if (!tarCreature.isPregnant() || pregSlot == -1) return -1;
			
			if (_pregHandlers[tarCreature.pregnancyData[pregSlot].pregnancyType] != null)
			{
				return (_pregHandlers[tarCreature.pregnancyData[pregSlot].pregnancyType] as BasePregnancyHandler).getRemainingDuration(tarCreature, pregSlot);
			}
			
			return -1;
		}
		
		public static function nurseryEndPregnancy(tarCreature:Creature, pregSlot:int, useTimestamp:uint):Child
		{
			return (_pregHandlers[tarCreature.pregnancyData[pregSlot].pregnancyType] as BasePregnancyHandler).nurseryEndPregnancy(tarCreature, pregSlot, useTimestamp);
		}
	}

}