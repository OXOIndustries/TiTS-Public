package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	
	/**
	 * Yeah this is kinda bullshit, but it also means we can version the PC data structure like NPCs.
	 * Might be useful, but its mainly here to do some proper error checking.
	 * @author Gedan
	 */
	public class PlayerCharacter extends Creature
	{
		public function PlayerCharacter() 
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			this._isLoading = false;
			
			isUniqueInFight = true;
		}
		
		// Level up stuff
		public var unspentStatPoints:int = 0;
		public var unclaimedClassPerks:int = 0;
		public var unclaimedGenericPerks:int = 0;
		
		public function levelUpAvailable():Boolean
		{
			if (unspentStatPoints > 0) return true;
			if (unclaimedClassPerks > 0) return true;
			//if (unclaimedGenericPerks > 0) return true; // Placeholder for possible future usage.
			return false;
		}
		
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			kGAMECLASS.mimbraneFeed("vagina");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			if(!cumFrom.hasStatusEffect("Ovilium Effect") && hasStatusEffect("Ovilium"))
			{
				kGAMECLASS.oviliumEggBump(cumFrom, vagIndex);
			}
			if (cumFrom != null)
			{
				return this.tryKnockUp(cumFrom, vagIndex);
			}
			
			return false;
		}
		
		override public function loadInAss(cumFrom:Creature = null):Boolean
		{
			kGAMECLASS.mimbraneFeed("ass");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			if (cumFrom != null)
			{
				return this.tryKnockUp(cumFrom, 3);
			}
			
			return false;
		}
		
		override public function milkInMouth(milkFrom:Creature = null):Boolean
		{
			kGAMECLASS.mimbraneFeed("face");
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(milkFrom != null) addBiomass(milkFrom.lactationQ());
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(milkFrom != null)
				{
					if(milkFrom.lactationQ() >= 500) kGAMECLASS.honeyPotBump(true);
					if(milkFrom.lactationQ() >= 1000) kGAMECLASS.honeyPotBump(true);
					if(milkFrom.lactationQ() >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			return false;
		}
		
		override public function girlCumInMouth(cumFrom:Creature = null):Boolean
		{
			kGAMECLASS.mimbraneFeed("face");
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.girlCumQ());
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(cumFrom != null)
				{
					if(cumFrom.girlCumQ() >= 500) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.girlCumQ() >= 1000) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.girlCumQ() >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			return false;
		}
		
		override public function loadInMouth(cumFrom:Creature = null):Boolean
		{
			kGAMECLASS.mimbraneFeed("face");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(cumFrom != null)
				{
					if(cumFrom.cumQ() >= 500) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.cumQ() >= 1000) kGAMECLASS.honeyPotBump(true);
					if(cumFrom.cumQ() >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			return false;
		}
		// *shrug*
		override public function loadInNipples(cumFrom:Creature = null):Boolean
		{
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumFrom.cumQ());
				else addBiomass(10);
			}
			kGAMECLASS.mimbraneFeed("boobs");
			return false;
		}
		
		override public function loadInCuntTail(cumFrom:Creature = null):Boolean
		{
			if (this.hasTailCunt()) kGAMECLASS.feedCuntSnake();
			
			if (cumFrom != null)
			{
				return this.tryKnockUp(cumFrom, 4);
			}
			
			return false;
		}
		
		public var ShipStorageInventory:Array = [];
		
		public function UpgradeVersion1(d:Object):void
		{
			var res:Array = d.resistances;
			var bRes:Array = d.bonusResistances;
			
			// Convert resistance perks.
			var toughLevel:uint = 0;
			
			if (d.perks)
			{
				for (var i:uint = 0; i < d.perks.length; i++)
				{
					if (d.perks[i] && d.perks[i].storageName)
					{
						if (d.perks[i].storageName == "Tough" && toughLevel == 0) toughLevel = 1;
						if (d.perks[i].storageName == "Tough 2" && toughLevel <= 1) toughLevel = 2;
					}
				}
			}
			
			var toughVal:Number = 0;
			if (toughLevel == 1) toughVal = 10;
			if (toughLevel == 2) toughVal = 15;
			
			var nBaseHP:TypeCollection = new TypeCollection();
			nBaseHP.kinetic.resistanceValue = toughVal;
			
			var nBaseShield:TypeCollection = new TypeCollection();
			nBaseShield.kinetic.resistanceValue = toughVal;
			
			d.baseHPResistances = nBaseHP.getSaveObject();
			d.baseShieldResistances = nBaseShield.getSaveObject();			
			
			delete d.lustVuln;
			delete d.resistances;
			delete d.bonusResistances;
			delete d.bonusLustVuln;
		}
	}
}
