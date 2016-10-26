package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Containers.TimeOutputOptions;
	import classes.Items.Accessories.LeithaCharm;
	import classes.RoomClass;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.ItemSlotClass;
	
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
		
		// Level Cap
		override public function levelMax():int
		{
			return 8;
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
			if (cumFrom != null)
			{
				if(!cumFrom.hasStatusEffect("Ovilium Effect") && hasStatusEffect("Ovilium"))
				{
					kGAMECLASS.oviliumEggBump(cumFrom, vagIndex);
				}
				if(cumflationEnabled()) cumflationHappens(cumFrom,vagIndex);
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
			if(hasPerk("Buttslut"))
			{
				HP(level);
				if(cumFrom != null) HP(Math.round(cumFrom.cumQ()/1000));
			}
			if (cumFrom != null)
			{
				if(cumflationEnabled()) cumflationHappens(cumFrom,3);
				return this.tryKnockUp(cumFrom, 3);
			}
			
			return false;
		}
		
		override public function milkInMouth(milkFrom:Creature = null):Boolean
		{
			if(milkFrom != null) fluidInMouthEffects(milkFrom, milkFrom.milkType, milkFrom.lactationQ(), "milk");
			
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
			if(cumFrom != null) fluidInMouthEffects(cumFrom, cumFrom.girlCumType, cumFrom.girlCumQ(), "girl-cum");
			
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
			if(cumFrom != null) fluidInMouthEffects(cumFrom, cumFrom.cumType, cumFrom.cumQ(), "cum");
			
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
			if(hasPerk("Dumb4Cum"))
			{
				kGAMECLASS.dumb4CumReset();
			}
			if(cumFrom != null && cumflationEnabled()) cumflationHappens(cumFrom,4);
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
			if (this.hasTailCunt()) 
			{
				if(cumFrom is Flahne) kGAMECLASS.feedCuntSnake(false);
				else kGAMECLASS.feedCuntSnake();
			}
			if (cumFrom != null)
			{
				return this.tryKnockUp(cumFrom, 4);
			}
			
			return false;
		}
		
		// For swallowing liquids!
		private function fluidInMouthEffects(fluidFrom:Creature = null, fluidType:int = -1, fluidQ:Number = 0, fluidSource:String = "none"):void
		{
			if(fluidQ <= 0) return;
			
			var fxMult:int = 1;
			// Increase effect magnitude by every liter consumed
			if(fluidQ > 1000) fxMult += Math.round((fluidQ - 1000) / 1000);
			
			// Natural source bonuses
			switch(fluidSource)
			{
				case "milk":
					energy(10 * fxMult);
					if(fluidFrom.hasPerk("Treated Milk")) energy(10 * fxMult);
					if(!(fluidFrom is PlayerCharacter))
					{
						if(fluidType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK) modThickness((1 * fxMult), false);
					}
					break;
				case "cum":
					if(fluidFrom is Kally) imbibeAlcohol(20);
					if(hasPerk("Autofellatio Queen") && fluidFrom is PlayerCharacter) energy(35 * fxMult);
					break;
				case "girl-cum":
					/* Nothing yet! */
					break;
			}
			
			// Energy effects
			switch(fluidType)
			{
				case GLOBAL.FLUID_TYPE_MILK:
				case GLOBAL.FLUID_TYPE_EGGNOG:
					energy(10 * fxMult);
					break;
				case GLOBAL.FLUID_TYPE_CHOCOLATE_MILK:
				case GLOBAL.FLUID_TYPE_STRAWBERRY_MILK:
				case GLOBAL.FLUID_TYPE_VANILLA:
				case GLOBAL.FLUID_TYPE_CHOCOLATE_CUM:
				case GLOBAL.FLUID_TYPE_BLUEBERRY_YOGURT:
				case GLOBAL.FLUID_TYPE_FRUIT_CUM:
				case GLOBAL.FLUID_TYPE_FRUIT_GIRLCUM:
				case GLOBAL.FLUID_TYPE_PEPPERMINT:
					energy(15 * fxMult);
					break;
				case GLOBAL.FLUID_TYPE_HONEY:
				case GLOBAL.FLUID_TYPE_NECTAR:
				case GLOBAL.FLUID_TYPE_MILKSAP:
				case GLOBAL.FLUID_TYPE_CUMSAP:
					energy(20 * fxMult);
					break;
			}
			
			// Alcoholic content
			switch(fluidType)
			{
				case GLOBAL.FLUID_TYPE_LEITHAN_MILK:
					imbibeAlcohol(10 * fxMult);
					break;
				case GLOBAL.FLUID_TYPE_EGGNOG:
					imbibeAlcohol(5 * fxMult);
					break;
			}
		}
		
		public var ShipStorageInventory:Array = [];
		public function hasItemInStorage(arg:ItemSlotClass,amount:int = 1):Boolean
		{
			if(ShipStorageInventory.length == 0) return false;
			var foundAmount:int = 0;
			for(var x:int = 0; x < ShipStorageInventory.length; x++)
			{
				if(ShipStorageInventory[x].shortName == arg.shortName) foundAmount += ShipStorageInventory[x].quantity;
			}
			if(foundAmount >= amount) return true;
			return false;
		}
		public function destroyItemInStorage(arg:ItemSlotClass,amount:int = 1):void
		{
			if(ShipStorageInventory.length == 0) return;
			var foundAmount:int = 0;
			for(var x:int = 0; x < ShipStorageInventory.length; x++)
			{
				//Item in the slot?
				if(ShipStorageInventory[x].shortName == arg.shortName) 
				{
					//If we still need to eat some, eat em up!
					while(amount > 0 && ShipStorageInventory[x].quantity > 0) 
					{
						ShipStorageInventory[x].quantity--;
						amount--;
						if(ShipStorageInventory[x].quantity <= 0) ShipStorageInventory.splice(x,1);
					}
				}
			}
			return;
		}
		
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
		
		override public function getCombatName():String
		{
			return "you";
		}
		
		override public function processTime(deltaT:uint, doOut:Boolean):void
		{	
			if (!hasCock() && balls == 0 && hasStatusEffect("Blue Balls"))
			{
				removeStatusEffect("Blue Balls");
			}
			
			super.processTime(deltaT, doOut);
		}
	}
}
