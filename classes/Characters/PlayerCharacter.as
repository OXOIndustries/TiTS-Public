package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Interfaces.GetGameTimestamp;
	import classes.GameData.Pregnancy.PregnancyManager;
	import classes.Items.Accessories.LeithaCharm;
	import classes.Items.Armor.GooArmor;
	import classes.Items.Transformatives.OmegaOil;
	import classes.Items.Transformatives.SheepTF;
	import classes.Items.Melee.Rock;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.RoomClass;
	import classes.StorageClass;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	import classes.ItemSlotClass;
	import classes.Engine.Utility.num2Text;
	import classes.Util.InCollection;
	import classes.Util.RandomInCollection;
	import classes.Engine.Interfaces.*;
	
	/**
	 * Yeah this is kinda bullshit, but it also means we can version the PC data structure like NPCs.
	 * Might be useful, but its mainly here to do some proper error checking.
	 * @author Gedan
	 */
	public class PlayerCharacter extends Creature
	{
		public function PlayerCharacter() 
		{
			this._latestVersion = 5;
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
			return 10;
		}
		
		override public function nameDisplay():String
		{
			return short;
		}
		
		override public function lustDef():Number
		{
			var bonus:Number = 0;
			bonus += statusEffectv1("Beta's Satisfaction")
			return willpower()/5 + bonus;
		}
		
		override public function loadInCunt(cumFrom:Creature = null, vagIndex:int = -1):Boolean
		{
			var cumQ:Number = (cumFrom != null ? cumFrom.cumQ() : 0);
			
			kGAMECLASS.mimbraneFeed("vagina");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO && !cumflationEnabled())
			{
				if(cumFrom != null) addBiomass(cumQ);
				else addBiomass(10);
			}
			if(hasPerk("Cum Highs"))
			{
				kGAMECLASS.cumHighUpdate(this, cumQ);
			}
			if(hasPerk("Lusty Afterglow"))
			{
				kGAMECLASS.lustyAfterglowUpdate(this, cumQ);
			}
			if (cumFrom != null)
			{
				if(cumFrom is Ardia) kGAMECLASS.drinkArdiasCum();
				if(!cumFrom.hasStatusEffect("Ovilium Effect") && hasStatusEffect("Ovilium"))
				{
					kGAMECLASS.oviliumEggBump(cumFrom, vagIndex);
				}
				if(cumflationEnabled() && cumFrom.cumType != GLOBAL.FLUID_TYPE_CUNDARIAN_SEED) cumflationHappens(cumFrom,vagIndex);
				sstdChecks(cumFrom,"vagina");
				//PLUGGING TIME!
				if(cumFrom.cumType == GLOBAL.FLUID_TYPE_CUNDARIAN_SEED)
				{
					if(vagIndex >= 0 && vagIndex < totalVaginas())
					{
						if(!vaginas[vagIndex].hasFlag(GLOBAL.FLAG_PLUGGED)) vaginas[vagIndex].addFlag(GLOBAL.FLAG_PLUGGED);
						if(!hasStatusEffect("Pussy Plugged")) createStatusEffect("Pussy Plugged",vagIndex,0,0,0,false,"Icon_Blocked","A plug is currently obstructing your pussy, the constant pressure on your tender areas constantly arousing your libido.\n\n<b>+100% Libido.</b>",false,0,0xB793C4);
					}
				}
				return this.tryKnockUp(cumFrom, vagIndex);
			}
			return false;
		}
		override public function loadInAss(cumFrom:Creature = null):Boolean
		{
			var cumQ:Number = (cumFrom != null ? cumFrom.cumQ() : 0);
			
			kGAMECLASS.mimbraneFeed("ass");
			// Butt bug load
			kGAMECLASS.loadInButtBug(this, cumFrom);
			
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO && !cumflationEnabled())
			{
				if(cumFrom != null) addBiomass(cumQ);
				else addBiomass(10);
			}
			// Buttslut heal
			if(hasPerk("Buttslut"))
			{
				HP(level);
				if(cumFrom != null) HP(Math.round(cumQ/1000));
			}
			// Anal Heat dampen
			if(hasStatusEffect("Strangely Warm") || hasStatusEffect("Flushed") || hasStatusEffect("Fuck Fever"))
			{
				OmegaOil.reduceOmegaEffect(this);
			}
			if(hasPerk("Cum Highs"))
			{
				kGAMECLASS.cumHighUpdate(this, cumQ);
			}
			if(hasPerk("Lusty Afterglow"))
			{
				kGAMECLASS.lustyAfterglowUpdate(this, cumQ);
			}
			// Cumflation
			if (cumFrom != null)
			{
				if(cumFrom is Ardia) kGAMECLASS.drinkArdiasCum();
				if(cumFrom is Kally) imbibeAlcohol(100);
				sstdChecks(cumFrom,"ass");
				if(cumflationEnabled() && cumFrom.cumType != GLOBAL.FLUID_TYPE_CUNDARIAN_SEED) cumflationHappens(cumFrom,3);
				//PLUGGING TIME!
				if(cumFrom.cumType == GLOBAL.FLUID_TYPE_CUNDARIAN_SEED)
				{
					if(!ass.hasFlag(GLOBAL.FLAG_PLUGGED)) ass.addFlag(GLOBAL.FLAG_PLUGGED);
				}
				return this.tryKnockUp(cumFrom, 3);
			}
			return false;
		}
		
		override public function milkInMouth(milkFrom:Creature = null):Boolean
		{
			var lactationQ:Number = (milkFrom != null ? milkFrom.lactationQ() : 0);
			
			if(milkFrom != null) fluidInMouthEffects(milkFrom, milkFrom.milkType, lactationQ, "milk");
			
			kGAMECLASS.mimbraneFeed("face");
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(milkFrom != null) addBiomass(lactationQ);
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(milkFrom != null)
				{
					if(lactationQ >= 500) kGAMECLASS.honeyPotBump(true);
					if(lactationQ >= 1000) kGAMECLASS.honeyPotBump(true);
					if(lactationQ >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			if(milkFrom != null) sstdChecks(milkFrom,"mouth");
			return false;
		}
		
		override public function girlCumInMouth(cumFrom:Creature = null):Boolean
		{
			var girlCumQ:Number = (cumFrom != null ? cumFrom.girlCumQ() : 0);
			
			if(cumFrom != null) fluidInMouthEffects(cumFrom, cumFrom.girlCumType, girlCumQ, "girl-cum");
			
			kGAMECLASS.mimbraneFeed("face");
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(girlCumQ);
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(cumFrom != null)
				{
					if(girlCumQ >= 500) kGAMECLASS.honeyPotBump(true);
					if(girlCumQ >= 1000) kGAMECLASS.honeyPotBump(true);
					if(girlCumQ >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			if(cumFrom != null) sstdChecks(cumFrom,"mouth");
			return false;
		}
		
		override public function loadInMouth(cumFrom:Creature = null):Boolean
		{
			var cumQ:Number = (cumFrom != null ? cumFrom.cumQ() : 0);
			
			if(cumFrom != null) fluidInMouthEffects(cumFrom, cumFrom.cumType, cumQ, "cum");
			
			kGAMECLASS.mimbraneFeed("face");
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO && !cumflationEnabled())
			{
				if(cumFrom != null) addBiomass(cumQ);
				else addBiomass(10);
			}
			if(hasPerk("Honeypot"))
			{
				kGAMECLASS.honeyPotBump(true);
				if(cumFrom != null)
				{
					if(cumQ >= 500) kGAMECLASS.honeyPotBump(true);
					if(cumQ >= 1000) kGAMECLASS.honeyPotBump(true);
					if(cumQ >= 2000) kGAMECLASS.honeyPotBump(true);
				}
			}
			if(hasPerk("Cum Highs"))
			{
				kGAMECLASS.cumHighUpdate(this, cumQ);
			}
			if(hasPerk("Lusty Afterglow"))
			{
				kGAMECLASS.lustyAfterglowUpdate(this, cumQ);
			}
			if(hasPerk("Dumb4Cum"))
			{
				kGAMECLASS.dumb4CumReset();
			}
			if(cumFrom != null && cumflationEnabled()) cumflationHappens(cumFrom,4);
			if(cumFrom != null) sstdChecks(cumFrom,"mouth");
			return false;
		}
		// *shrug*
		override public function loadInNipples(cumFrom:Creature = null):Boolean
		{
			var cumQ:Number = (cumFrom != null ? cumFrom.cumQ() : 0);
			
			//Goo TFed? GATHER BIOMASS
			if(hairType == GLOBAL.HAIR_TYPE_GOO)
			{
				if(cumFrom != null) addBiomass(cumQ);
				else addBiomass(10);
			}
			if(hasPerk("Cum Highs"))
			{
				kGAMECLASS.cumHighUpdate(this, cumQ);
			}
			if(hasPerk("Lusty Afterglow"))
			{
				kGAMECLASS.lustyAfterglowUpdate(this, cumQ);
			}
			kGAMECLASS.mimbraneFeed("boobs");
			if(cumFrom != null) sstdChecks(cumFrom,"nipple");
			return false;
		}
		
		override public function loadInCuntTail(cumFrom:Creature = null):Boolean
		{
			var cumQ:Number = (cumFrom != null ? cumFrom.cumQ() : 0);
			
			if (this.hasTailCunt()) kGAMECLASS.feedCuntSnake(cumFrom);
			if(hasPerk("Cum Highs"))
			{
				kGAMECLASS.cumHighUpdate(this, cumQ);
			}
			if(hasPerk("Lusty Afterglow"))
			{
				kGAMECLASS.lustyAfterglowUpdate(this, cumQ);
			}
			if (cumFrom != null)
			{
				sstdChecks(cumFrom,"tail cunt");
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
					if(fluidFrom is Kally) imbibeAlcohol(100);
					if(fluidFrom is Ardia) kGAMECLASS.drinkArdiasCum();
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
				case GLOBAL.FLUID_TYPE_SUGAR:
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
		public var LocationStorageInventory:Array = [];
		/*
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
		*/
		public function numberOfItemInStorageByClass(ref:Class):int
		{
			if (ref == null || ShipStorageInventory.length == 0) return 0;
			
			var amt:int = 0;
			
			for (var i:uint = 0; i < ShipStorageInventory.length; i++)
			{
				if (ShipStorageInventory[i] is ref) amt += ShipStorageInventory[i].quantity;
			}
			return amt;
		}
		public function hasItemInStorageByClass(ref:Class, amount:int = 1):Boolean
		{
			if (ref == null || ShipStorageInventory.length == 0) return false;
			
			var amt:int = numberOfItemInStorageByClass(ref);
			
			if (amt >= amount) return true;
			return false;
		}
		public function destroyItemInStorageByClass(ref:Class, amount:int = 1):void
		{
			if (ref == null || ShipStorageInventory.length == 0 || amount == 0) return;
			
			var i:int = (ShipStorageInventory.length - 1);
			
			// Remove all!
			if (amount < 0)
			{
				while (i >= 0)
				{
					if (ShipStorageInventory[i] is ref)
					{
						ShipStorageInventory[i].quantity = 0;
						ShipStorageInventory.splice(i, 1);
					}
					i--;
				}
			}
			// Normal
			else
			{
				while (amount > 0 && i >= 0)
				{
					//Item in the slot?
					if (ShipStorageInventory[i] is ref)
					{
						var nFromSlot:int = Math.min(amount, ShipStorageInventory[i].quantity);
						amount -= nFromSlot;
						ShipStorageInventory[i].quantity -= nFromSlot;
						if (ShipStorageInventory[i].quantity == 0)
						{
							ShipStorageInventory.splice(i, 1);
						}
					}
					i--;
				}
				if(amount > 0) output("<b>ERROR - Ship inventory item quantity needed: " + amount + "!</b>");
			}
		}
		
		// Hidden storage
		public var hiddenMeleeWeapon:ItemSlotClass = new EmptySlot();
		public var hiddenRangedWeapon:ItemSlotClass = new EmptySlot();
		public var hiddenArmor:ItemSlotClass = new EmptySlot();
		public var hiddenUpperUndergarment:ItemSlotClass = new EmptySlot();
		public var hiddenLowerUndergarment:ItemSlotClass = new EmptySlot();
		public var hiddenAccessory:ItemSlotClass = new EmptySlot();
		public var hiddenShield:ItemSlotClass = new EmptySlot();
		public var hiddenInventory:Array = [];
		
		// Take item, Put in storage
		public function takeMeleeWeapon():void
		{
			if((meleeWeapon is EmptySlot) || (meleeWeapon is Rock)) return;
			
			var item:ItemSlotClass = meleeWeapon;
			
			if(!(hiddenMeleeWeapon is EmptySlot))
			{ var prev:ItemSlotClass = hiddenMeleeWeapon; hiddenInventory.push(prev); }
			
			hiddenMeleeWeapon = item;
			meleeWeapon.onRemove(this);
			meleeWeapon = new Rock();
		}
		public function takeRangedWeapon():void
		{
			if((rangedWeapon is EmptySlot) || (rangedWeapon is Rock)) return;
			
			var item:ItemSlotClass = rangedWeapon;
			
			if(!(hiddenRangedWeapon is EmptySlot))
			{ var prev:ItemSlotClass = hiddenRangedWeapon; hiddenInventory.push(prev); }
			
			hiddenRangedWeapon = item;
			rangedWeapon.onRemove(this);
			rangedWeapon = new Rock();
		}
		public function takeArmor():void
		{
			if(armor is EmptySlot) return;
			
			var item:ItemSlotClass = armor;
			
			if(!(hiddenArmor is EmptySlot))
			{ var prev:ItemSlotClass = hiddenArmor; hiddenInventory.push(prev); }
			
			hiddenArmor = item;
			armor.onRemove(this);
			armor = new EmptySlot();
		}
		public function takeUpperUndergarment():void
		{
			if(upperUndergarment is EmptySlot) return;
			
			var item:ItemSlotClass = upperUndergarment;
			
			if(!(hiddenUpperUndergarment is EmptySlot))
			{ var prev:ItemSlotClass = hiddenUpperUndergarment; hiddenInventory.push(prev); }
			
			hiddenUpperUndergarment = item;
			upperUndergarment.onRemove(this);
			upperUndergarment = new EmptySlot();
		}
		public function takeLowerUndergarment():void
		{
			if(lowerUndergarment is EmptySlot) return;
			
			var item:ItemSlotClass = lowerUndergarment;
			
			if(!(hiddenLowerUndergarment is EmptySlot))
			{ var prev:ItemSlotClass = hiddenLowerUndergarment; hiddenInventory.push(prev); }
			
			hiddenLowerUndergarment = item;
			lowerUndergarment.onRemove(this);
			lowerUndergarment = new EmptySlot();
		}
		public function takeAccessory():void
		{
			if(accessory is EmptySlot) return;
			
			var item:ItemSlotClass = accessory;
			
			if(!(hiddenAccessory is EmptySlot))
			{ var prev:ItemSlotClass = hiddenAccessory; hiddenInventory.push(prev); }
			
			hiddenAccessory = item;
			accessory.onRemove(this);
			accessory = new EmptySlot();
		}
		public function takeShield():void
		{
			if(shield is EmptySlot) return;
			
			var item:ItemSlotClass = shield;
			
			if(!(hiddenShield is EmptySlot))
			{ var prev:ItemSlotClass = hiddenShield; hiddenInventory.push(prev); }
			
			hiddenShield = item;
			shield.onRemove(this);
			shield = new EmptySlot();
		}
		// Take all inventory items
		public function takeInventory():void
		{
			for(var i:int = 0; i < inventory.length; i++)
			{
				var item:ItemSlotClass = inventory[i];
				hiddenInventory.push(item);
			}
			inventory.length = 0;
		}
		
		// Return item, Reset storage
		// If slot already filled, place in hidden inventory for collecting.
		public function giveMeleeWeapon():void
		{
			if(hiddenMeleeWeapon is EmptySlot) return;
			
			var item:ItemSlotClass = hiddenMeleeWeapon;
			
			if(!(meleeWeapon is EmptySlot) && !(meleeWeapon is Rock))
			{ hiddenInventory.push(item); return; }
			
			meleeWeapon = item;
			meleeWeapon.onEquip(this);
			hiddenMeleeWeapon = new EmptySlot();
		}
		public function giveRangedWeapon():void
		{
			if(hiddenRangedWeapon is EmptySlot) return;
			
			var item:ItemSlotClass = hiddenRangedWeapon;
			
			if(!(rangedWeapon is EmptySlot) && !(rangedWeapon is Rock))
			{ hiddenInventory.push(item); return; }
			
			rangedWeapon = item;
			rangedWeapon.onEquip(this);
			hiddenRangedWeapon = new EmptySlot();
		}
		public function giveArmor():void
		{
			if(hiddenArmor is EmptySlot) return;
			
			var item:ItemSlotClass = hiddenArmor;
			
			if(!(armor is EmptySlot))
			{ hiddenInventory.push(item); return; }
			
			armor = item;
			armor.onEquip(this);
			hiddenArmor = new EmptySlot();
		}
		public function giveUpperUndergarment():void
		{
			if(hiddenUpperUndergarment is EmptySlot) return;
			
			var item:ItemSlotClass = hiddenUpperUndergarment;
			
			if(!(upperUndergarment is EmptySlot))
			{ hiddenInventory.push(item); return; }
			
			upperUndergarment = item;
			upperUndergarment.onEquip(this);
			hiddenUpperUndergarment = new EmptySlot();
		}
		public function giveLowerUndergarment():void
		{
			if(hiddenLowerUndergarment is EmptySlot) return;
			
			var item:ItemSlotClass = hiddenLowerUndergarment;
			
			if(!(lowerUndergarment is EmptySlot))
			{ hiddenInventory.push(item); return; }
			
			lowerUndergarment = item;
			lowerUndergarment.onEquip(this);
			hiddenLowerUndergarment = new EmptySlot();
		}
		public function giveAccessory():void
		{
			if(hiddenAccessory is EmptySlot) return;
			
			var item:ItemSlotClass = hiddenAccessory;
			
			if(!(accessory is EmptySlot))
			{ hiddenInventory.push(item); return; }
			
			accessory = item;
			accessory.onEquip(this);
			hiddenAccessory = new EmptySlot();
		}
		public function giveShield():void
		{
			if(hiddenShield is EmptySlot) return;
			
			var item:ItemSlotClass = hiddenShield;
			
			if(!(shield is EmptySlot))
			{ hiddenInventory.push(item); return; }
			
			shield = item;
			shield.onEquip(this);
			hiddenShield = new EmptySlot();
		}
		// Return all inventory items
		public function giveInventory():void
		{
			for(var i:int = 0; i < hiddenInventory.length; i++)
			{
				var item:ItemSlotClass = hiddenInventory[i];
				inventory.push(item);
			}
			hiddenInventory.length = 0;
		}
		
		// Dump all hidden slots to inventory, if any
		public function moveSlotsToInventory():void
		{
			var item:ItemSlotClass
			if(!(hiddenMeleeWeapon is EmptySlot)) { item = hiddenMeleeWeapon; hiddenInventory.push(item); hiddenMeleeWeapon = new EmptySlot(); }
			if(!(hiddenRangedWeapon is EmptySlot)) { item = hiddenRangedWeapon; hiddenInventory.push(item); hiddenRangedWeapon = new EmptySlot(); }
			if(!(hiddenArmor is EmptySlot)) { item = hiddenArmor; hiddenInventory.push(item); hiddenArmor = new EmptySlot(); }
			if(!(hiddenUpperUndergarment is EmptySlot)) { item = hiddenUpperUndergarment; hiddenInventory.push(item); hiddenUpperUndergarment = new EmptySlot(); }
			if(!(hiddenLowerUndergarment is EmptySlot)) { item = hiddenLowerUndergarment; hiddenInventory.push(item); hiddenLowerUndergarment = new EmptySlot(); }
			if(!(hiddenAccessory is EmptySlot)) { item = hiddenAccessory; hiddenInventory.push(item); hiddenAccessory = new EmptySlot(); }
			if(!(hiddenShield is EmptySlot)) { item = hiddenShield; hiddenInventory.push(item); hiddenShield = new EmptySlot(); }
		}
		// Returns array of all stored inventory items, if any.
		// Resets storage.
		public function returnInventoryItems():Array
		{
			var itemList:Array = [];
			
			for(var i:int = 0; i < hiddenInventory.length; i++)
			{
				var item:ItemSlotClass = hiddenInventory[i];
				itemList.push(item);
			}
			hiddenInventory.length = 0;
			
			return itemList;
		}
		
		override public function HPMax():Number
		{
			return (kGAMECLASS.debug ? super.HPMax() + 2500 : super.HPMax());
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
		public function UpgradeVersion2(d:Object):void
		{
			var i:uint = 0;
			if (d.perks)
			{
				for (i = 0; i < d.perks.length; i++)
				{
					if (d.perks[i] && d.perks[i].storageName)
					{
						switch(d.perks[i].storageName)
						{
							case "Fertility":
								d.fertilityRaw -= 0.15;
								d.perks[i].value1 = 1.15;
								break;
							case "Virile":
								d.perks[i].value1 = 1.15;
								break;
						}
						d.perks[i].tooltip = ParseQuotes(d.perks[i].tooltip);
					}
				}
			}
			if (d.keyItems)
			{
				for (i = 0; i < d.keyItems.length; i++)
				{
					if (d.keyItems[i] && d.keyItems[i].storageName)
					{
						switch(d.keyItems[i].storageName)
						{
							case "Holodisk: Horsecock Hell 2":
								d.keyItems[i].tooltip = "A pair of holodisks labeled ‘<b>Horsecock Hell 2: A Tail of Two Twats</b>’. The cover makes a big deal out of the star of the show: ‘Nivas Oxonef’.";
								break;
							default:
								d.keyItems[i].tooltip = ParseQuotes(d.keyItems[i].tooltip);
								break;
						}
					}
				}
			}
			if (d.statusEffects)
			{
				for (i = 0; i < d.statusEffects.length; i++)
				{
					if (d.statusEffects[i] && d.statusEffects[i].storageName)
					{
						d.statusEffects[i].tooltip = ParseQuotes(d.statusEffects[i].tooltip);
					}
				}
			}
		}
		public function UpgradeVersion3(d:Object):void
		{
			var i:uint = 0;
			var willIdx:int = -1;
			var hasMind:Boolean = false;
			if (d.perks)
			{
				for (i = 0; i < d.perks.length; i++)
				{
					if (d.perks[i] && d.perks[i].storageName)
					{
						switch(d.perks[i].storageName)
						{
							case "Weak Willed": willIdx = i; break;
							case "Weak Mind": hasMind = true; break;
						}
					}
				}
				if(willIdx >= 0)
				{
					// Already has perk, remove dupe.
					if(hasMind) d.perks.splice(willIdx, 1);
					// Otherwise, replace old perk.
					else
					{
						d.perks[willIdx].storageName = "Weak Mind";
						d.perks[willIdx].tooltip = "Intelligence and willpower losses doubled.";
					}
				}
			}
		}
		public function UpgradeVersion4(d:Object):void
		{
			var i:uint = 0;
			if (d.perks)
			{
				for (i = 0; i < d.perks.length; i++)
				{
					if (d.perks[i] && d.perks[i].storageName)
					{
						switch(d.perks[i].storageName)
						{
							case "Concussive Shot": d.perks[i].tooltip = "[altTooltip ConcussiveShot]"; break;
						}
					}
				}
			}
		}
		
		override public function get bustDisplay():String
		{
			var sBust:String = "PC";
			
			if(isNude()) sBust += "_NUDE";
			
			return sBust;
		}
		
		override public function getCombatName():String
		{
			return "you";
		}
		override public function processTime(deltaT:uint, doOut:Boolean):void
		{	
			var totalHours:int = ((kGAMECLASS.minutes + deltaT) / 60);
			var totalDays:int = ((GetGameTimestamp() + deltaT) / 1440) - kGAMECLASS.days;
			
			// Genital checks
			if(!hasCock())
			{
				removePerk("Firing Blanks");
				removeStatusEffect("Blue Balls");
				removeStatusEffect("Priapism");
			}
			if(!hasVagina())
			{
				removePerk("Sterile");
				removeStatusEffect("Vaginally-Filled");
				removeStatusEffect("Pussy Pumped");
			}
			
			// Daily changes
			if (totalDays >= 1)
			{
				if (hasCuntTail())
				{
					if (flags["DAYS_SINCE_FED_CUNT_TAIL"] == undefined)
					{
						flags["DAYS_SINCE_FED_CUNT_TAIL"] = totalDays;
					}
					else
					{
						flags["DAYS_SINCE_FED_CUNT_TAIL"] += totalDays;
					}
				}
				
				var aaf:StorageClass = getPerkEffect("Auto-Autofellatio");
				if (aaf && aaf.value2 >= 1)
				{
					aaf.value2 -= 1 * totalDays;
					if (aaf.value2 < 0) aaf.value2 = 0;
				}
				
				if (hasPerk("Mane"))
				{
					maneHairGrow(totalDays);
				}
				
				if (hasPerk("Wooly"))
				{
					woolyFurGrow(totalDays);
				}
				
				if (hasPerk("Hips Don't Lie"))
				{
					hipsDontLieHipGrowth(totalDays);
				}
				
				if (hasPerk("Buttslut"))
				{
					buttslutBootyGrowth(totalDays);
				}
				
				if (hasPerk("Fecund Figure"))
				{
					fecundFigure(totalDays);
				}
				
				if(hasPerk("Implant-tastic"))
				{
					implantasticSiliconeConversion(totalDays);
				}
				if(hasPerk("True Doll"))
				{
					trueDollPerkElasticityUpdate(totalDays);
				}
				
				if (hasStatusEffect("Nyrea Eggs") && fertility() > 0 && hasOvipositor())
				{
					nyreaEggStuff(totalDays);
				}
				
				updateExhibitionism(totalDays);
				myrVenomUpdate(totalDays);
				processOmegaFever(totalDays);
				//updateHeatPerk(totalDays);
				//updateRutPerk(totalDays);
			}
			// Hourly changes
			if(totalHours >= 1)
			{
				updateFemininity(deltaT, doOut);
				updateGooState(deltaT, doOut);
			}
			// Minutely changes
			updateVaginaStretch(deltaT, doOut);
			updateButtStretch(deltaT, doOut);
			novaCumSlurpUpdates(deltaT, doOut);
			
			super.processTime(deltaT, doOut);
			
			racialPerkUpdateCheck(deltaT, doOut);
		}
		
		private function updateExhibitionism(totalDays:uint):void
		{
			var exhibitionismPoints:Number = exposureLevel(true);
			var currExhib:Number = exhibitionism();

			//All covered up? Reduce over time!
			if(exhibitionismPoints <= 0)
			{
				//Exhibitionism locked at 100 and does not fall with time, even if fully clothed.
				if(hasPerk("Ultra-Exhibitionist")) { /* Nada! */ }
				//Skipping out on underwear will keep it from dropping, but won't raise it.
				else if(upperUndergarment is EmptySlot || lowerUndergarment is EmptySlot) { /* Nada! */ }
				//High exhibitionism or sex-driven personality leads to being comfortable in kinky undies! Otherwise, degrade a little bit.
				else if(isAssExposedByLowerUndergarment() || isCrotchExposedByLowerUndergarment() || isChestExposedByUpperUndergarment())
				{
					if((currExhib >= 50 || isBimbo() || isBro())) { /* Nada! */ }
					else exhibitionism(-0.25 * totalDays);
				}
				//Otherwise, exhibitionism degrades.
				else exhibitionism(-0.5 * totalDays);
			}
			else if(exhibitionismPoints >= 4 && currExhib < 50) exhibitionism(2);
			else if(exhibitionismPoints >= 3 && currExhib < 40) exhibitionism(1);
			else if(exhibitionismPoints >= 2 && currExhib < 33) exhibitionism(1);
			else if(currExhib < 20) exhibitionism(1);
			
			if(hasPerk("Ultra-Exhibitionist")) kGAMECLASS.processExhibitionismStrip(totalDays);
		}
		
		private function myrVenomUpdate(totalDays:uint):void
		{
			if(kGAMECLASS.flags["VENOM_ADDICTION"] != undefined)
			{
				//Not yet uber-addict:
				if(!hasPerk("Venom Slut"))
				{
					if(hasStatusEffect("Myr Venom Withdrawal")) kGAMECLASS.myrAddiction(-2 * totalDays);
				}
			}
			//Non addicts not under the effects of venom lose progress to addiction
			else if(flags["VENOM_ADDICTION"] == undefined && !hasStatusEffect("Red Myr Venom"))
			{
				kGAMECLASS.venomProgress(-2 * totalDays);
			}
		}
		
		public function novaCumSlurpUpdates(deltaT:uint, doOut:Boolean):void
		{
			if(!(armor is GooArmor)) return;
			
			var fluidLevels:Number = 0;
			var fluidType:int = -1;
			var amountVented:Number = 0;
			
			if(flags["GOO_ARMOR_AUTOSUCK"] == 1)
			{	
				// Can't get through blocked holes
				var cuntStatus:StorageClass = ((hasVagina() && blockedVaginas() < vaginaTotal()) ? getStatusEffect("Vaginally-Filled") : null);
				var buttStatus:StorageClass = (!isBlocked(-1) ? getStatusEffect("Anally-Filled") : null);
				var suckHole:String = "none";
				
				if(cuntStatus != null || buttStatus != null)
				{
					amountVented = 0;
					fluidType = -1;
					
					if(cuntStatus != null) {
						if(buttStatus == null) { fluidType = cuntStatus.value3; suckHole = "cunt"; }
						else suckHole = "both";
						amountVented += cuntStatus.value1;
					}
					if(buttStatus != null) {
						if(cuntStatus == null) { fluidType = buttStatus.value3; suckHole = "butt"; }
						else suckHole = "both";
						amountVented += buttStatus.value1;
					}
					
					AddLogEvent(kGAMECLASS.gooArmorAutoSuckBlurb(suckHole, amountVented, fluidType), "passive", deltaT);
					removeStatusEffect("Vaginally-Filled");
					removeStatusEffect("Anally-Filled");
				}
			}
			if(flags["GOO_ARMOR_AUTOCLEAN"] == 1)
			{
				var cumStatus:StorageClass = getStatusEffect("Cum Soaked");
				var girlcumStatus:StorageClass = getStatusEffect("Pussy Drenched");
				var milkStatus:StorageClass = getStatusEffect("Milk Bathed");
				
				if(cumStatus != null || girlcumStatus != null || milkStatus != null)
				{
					fluidLevels = 0;
					fluidType = -1;
					
					if(cumStatus != null) {
						if(girlcumStatus == null && milkStatus == null) fluidType = GLOBAL.FLUID_TYPE_CUM;
						fluidLevels += cumStatus.value1;
					}
					if(girlcumStatus != null) {
						if(cumStatus == null && milkStatus == null) fluidType = GLOBAL.FLUID_TYPE_GIRLCUM;
						fluidLevels += girlcumStatus.value1;
					}
					if(milkStatus != null) {
						if(cumStatus == null && girlcumStatus == null) fluidType = GLOBAL.FLUID_TYPE_MILK;
						fluidLevels += milkStatus.value1;
					}
					
					amountVented = (500 * fluidLevels);
					
					AddLogEvent(kGAMECLASS.gooArmorAutoCleanBlurb("skin", amountVented, fluidType), "passive", deltaT);
					removeStatusEffect("Cum Soaked");
					removeStatusEffect("Pussy Drenched");
					removeStatusEffect("Milk Bathed");
				}
			}
		}
		
		private function updateGooState(deltaT:uint, doOut:Boolean):void
		{
			if (!hasStatusEffect("Goo Crotch")) return;
			
			var m:String = "";
			
			var unflaggedGenital:Array = [];
			for (var i:int = 0; i < cocks.length; i++)
			{
				if (!hasCockFlag(GLOBAL.FLAG_GOOEY, i)) unflaggedGenital.push(i);
			}
			
			if (unflaggedGenital.length > 0)
			{
				if (unflaggedGenital.length == cocks.length)
				{
					if (cocks.length == 1) AddLogEvent("The " + cockColor() + " skin of your " + simpleCockNoun(0) + " is vanishing into a slowly creeping wave " + kGAMECLASS.gooColor() + " goo, losing cohesion in exchange for infinitely morphic possibilities. <b>Your penis is now gelatinous.</b>", "passive", deltaT);
					//Multischlongs
					else AddLogEvent("The skin of your " + cocksDescript() + " tingles like mad as waves of translucent goo slowly replaces their skin, transforming them from fleshy wieners into semi-solid, shape-shifting pricks. <b>Your penises are now gelatinous.</b>", "passive", deltaT);
				}
				else
				{
					m = "Your gooey, ever-slick crotch spreads down the length";
					if(unflaggedGenital.length > 1) m += "s of your rogue, solid dicks, transforming them into drippy, inexplicably jellied boners.";
					else 
					{
						m += " of your rock, solidified dick, transforming it to be just as drippy and jelly-like as";
						if(cockTotal() == 2) m += " its brother.";
						else m += " its brothers.";
					}
					m += " <b>All of your penises are now gelatinous.</b>";
					
					AddLogEvent(m, "passive", deltaT);
				}
				
				for (i = 0; i < unflaggedGenital.length; i++)
				{
					cocks[unflaggedGenital[i]].addFlag(GLOBAL.FLAG_GOOEY);
					cocks[unflaggedGenital[i]].cockColor = kGAMECLASS.gooColor();
				}
			}
			
			var unflaggedVagNum:int = 0;
			for (i = 0; i < vaginas.length; i++)
			{
				if (!vaginas[i].hasFlag(GLOBAL.FLAG_GOOEY))
				{
					unflaggedVagNum++;
					vaginas[i].addFlag(GLOBAL.FLAG_GOOEY);
					vaginas[i].vaginaColor = kGAMECLASS.gooColor();
				}
			}
			
			if (unflaggedVagNum > 0)
			{
				if (unflaggedVagNum == vaginas.length)
				{
					m = "You’re getting incredibly wet";
					if(legCount > 1) m += ParseText(" between the [pc.legs]");
					else m += "... down there";
					m += ". Moisture seems to be dripping everywhere, transforming your puss";
					if(totalVaginas() == 1) m += "y into a slipperier, gooier version of itself. <b>Your entire vagina has become semi-solid, like the rest of your crotch.</b>";
					else m += "ies into slipperier, gooier versions of themselves. <b>All of your vaginas are now semi-solid, goo-cunts, just like the rest of your crotch.</b>";
					
					AddLogEvent(m, "passive", deltaT);
				}
				else
				{
					AddLogEvent("Unsurprisingly, the slime that surrounds your multiple mounds trickles in, remaking the more solid flesh into an even wetter, slicker parody of itself. <b>All of your vaginas are made of goo.</b>", "passive", deltaT);
				}
			}
		}
		
		private function updateFemininity(deltaT:uint, doOut:Boolean):void
		{
			if(canFixFemininity())
			{
				var msg:String = fixFemininity();
				if(msg != "") AddLogEvent(msg, "passive", deltaT);
			}
		}
		
		private function nyreaEggStuff(totalDays:uint):void
		{
			var effect:StorageClass = getStatusEffect("Nyrea Eggs");
			
			effect.value1 += Math.round(10 * effect.value2 * fertility()) * totalDays;
			if (hasPerk("Fertility"))
			{
				for (var i:int = 0; i < totalDays; i++)
				{
					effect.value1 += 10 + rand(11);
				}
			}
			
			if (effect.value1 > 1000 && rand(2) == 0)
			{
				AddLogEvent("You feel completely bloated with your production of nyrean eggs... Perhaps you should make some time to expel them?", "passive", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
			}
		}
		
		private function fecundFigure(totalDays:uint):void
		{
			var numPreg:int = totalPregnancies();
			if(isPregnant(3)) numPreg--; // No buttpregs
			
			// Cap the total days that this can be applied based on the current longest potential pregnancy
			totalDays = Math.min(Math.round(PregnancyManager.getLongestRemainingDuration(this) / 1440), totalDays);
			
			// Longevity of growth based on number of current pregnant wombs.
			if (numPreg > 0) addPerkValue("Fecund Figure", 4, numPreg * totalDays);
			
			if(perkv4("Fecund Figure") > 0)
			{
				// 20 days for 1 hips/butt size gain
				addPerkValue("Fecund Figure", 1, (0.05 * totalDays)); // Hips
				addPerkValue("Fecund Figure", 2, (0.05 * totalDays)); // Butt
				addPerkValue("Fecund Figure", 4, -(totalDays)); // Gains
				
				var msg:String = "";
				if(numPreg > 0 && bellyRating() >= 10) msg += "You nestle your belly with your hand and feel your hips and ass ripen in blissful contentment.";
				if(msg != "") AddLogEvent(msg, "passive", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
			}
			
			if(perkv4("Fecund Figure") < 0) setPerkValue("Fecund Figure", 4, 0);
		}
		
		private function buttslutBootyGrowth(totalDays:int):void
		{
			var bootyMin:Number = 18;
			
			// If butt is max size or is currently filled, no need to grow.
			if (buttRatingRaw >= bootyMin || statusEffectv1("Anally-Filled") > 0) return;
			
			var baseDShift:uint = 1440 - (GetGameTimestamp() % 1440);
			
			for (var i:int = 0; i < totalDays; i++)
			{
				//var oldBooty:Number = buttRatingRaw;
				var addBooty:Number = 1 + rand(9);
				if (buttRatingRaw + addBooty > bootyMin) addBooty = bootyMin - buttRatingRaw;
				if (addBooty < 0) return;
				
				var m:String = "You notice some extra weight and jiggle when you go to move or stand. Looking behind you, you find that your ass has gained"
				
				if (addBooty > 5) m += " an epic amount of cheek";
				else if (addBooty > 4) m += " a massive surge in size";
				else if (addBooty > 3) m += " a much larger circumference";
				else if (addBooty > 2) m += " a few sizes";
				else if (addBooty > 1) m += " a another size or two";
				else m += " some mass";
				m += ParseText("... It seems your bubbly booty is desperate for attention, begging for something to fill it" + (buttRatingRaw < 10 ? "." : "--not that you’d complain!") + " <b>Your [pc.butts] have grown bigger!</b>");
				
				buttRatingRaw += addBooty;
				
				if(hairType == GLOBAL.HAIR_TYPE_GOO && addBooty > 0)
				{
					var gooCost:Number = (20 * addBooty);
					if(gooCost > 0 && kGAMECLASS.gooBiomass() >= gooCost)
					{
						m += " Although, the growth took up some of your gooey biomass in the process...";
						kGAMECLASS.gooBiomass(-1 * gooCost);
					}
				}
				
				AddLogEvent(m, "passive", baseDShift + (i * 1440));
			}
		}
		
		private function hipsDontLieHipGrowth(totalDays:int):void
		{
			var hipsMin:Number = 18;
			
			// If hips is max size or is currently filled, no need to grow.
			if (hipRatingRaw >= hipsMin) return;
			
			var baseDShift:uint = 1440 - (GetGameTimestamp() % 1440);
			
			for (var i:int = 0; i < totalDays; i++)
			{
				//var oldHips:Number = hipRatingRaw;
				var addHips:Number = 1 + rand(9);
				if (hipRatingRaw + addHips > hipsMin) addHips = hipsMin - hipRatingRaw;
				if (addHips < 0) return;
				
				var m:String = "You suddenly wobble as your stride changes, surprising you where you stand. Putting your hands to your sides and moving downward, you find that your hips have gained"
				
				if (addHips > 5) m += " a monstrous amount of girth";
				else if (addHips > 4) m += " a massive surge in width";
				else if (addHips > 3) m += " a much wider measurement";
				else if (addHips > 2) m += " a few sizes horizontally";
				else if (addHips > 1) m += " a couple sizes in width";
				else m += " some width";
				m += ParseText("... It seems your body is not happy with you looking as thin as a rail, so it is adding a few pounds of fecund weight where it counts most" + (hipRatingRaw < 10 ? "." : "--much to your pleasure!") + " <b>Your [pc.hips] have grown wider!</b>");
				
				hipRatingRaw += addHips;
				
				if(hairType == GLOBAL.HAIR_TYPE_GOO && addHips > 0)
				{
					var gooCost:Number = (20 * addHips);
					if(gooCost > 0 && kGAMECLASS.gooBiomass() >= gooCost)
					{
						m += " Although, the growth took up some of your gooey biomass in the process...";
						kGAMECLASS.gooBiomass(-1 * gooCost);
					}
				}
				
				AddLogEvent(m, "passive", baseDShift + (i * 1440));
			}
		}
		
		private function implantasticSiliconeConversion(totalDays:int):void
		{
			var msg:String = kGAMECLASS.implantasticSiliconeConversion(this);
			if(msg != "") AddLogEvent(msg, "passive", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
		}
		
		private function trueDollPerkElasticityUpdate(totalDays:int):void
		{
			var msg:String = kGAMECLASS.trueDollPerkElasticityUpdate(this);
			if(msg != "") AddLogEvent(msg, "passive", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
		}
		
		private function maneHairGrow(totalDays:uint):void
		{
			var lengthMin:Number = 3;
	
			if (hairLength >= lengthMin) return;
			
			var deltaShift:uint = 1440 - (GetGameTimestamp() % 1440);
	
			for (var i:int = 0; i < totalDays; i++)
			{
				var m:String = "Your scalp tingles and you";
				if (hairLength <= 0)
				{
					m += ParseText(" reach up to scratch it. Instead of [pc.skinFurScalesNoun], your fingers run across");
					if(hairType == GLOBAL.HAIR_TYPE_REGULAR)
					{
						m += " patches of growing hair.";
						hairLength = 0.125;
					}
					else
					{
						m += ParseText(" a growing patch of tiny [pc.hairsNoun].");
						hairLength = 0.5;
					}
					m += ParseText(" <b>You now have [pc.hair]!</b>");
				}
				else
				{
					var hairGain:Number = 1 + rand(2);
					if (hairLength <= 2)
					{
						m += ParseText(" reach up to touch your short [pc.hairNoun]. <b>It seems longer than it did before, growing out about " + num2Text(hairGain) + " more inch");
						if(hairGain != 1) m += "es";
						m += ".</b>";
					}
					else
					{
						m += ParseText(" see your [pc.hairNoun] grow out, right in front of your eyes. <b>Your hair has lengthened by " + num2Text(hairGain) + " inch");
						if(hairGain != 1) m += "es";
						m += "!</b>";
					}
					hairLength = Math.round(hairLength + hairGain);
				}
				if(!InCollection(hairStyle, ["null", "tentacle"]))
				{
					m += " It seems the growth has messed up your hairdo in the process... You might have to get it restyled later.";
					hairStyle = "null";
				}
				
				AddLogEvent(m, "passive", deltaShift + (i * 1440));
			}
		}
		private function woolyFurGrow(totalDays:uint):void
		{
			// Tick days to regrow wooly fur if it has been cut.
			if(perkv1("Wooly") < 0)
			{
				addPerkValue("Wooly", 1, totalDays);
				if(perkv1("Wooly") > 0) setPerkValue("Wooly", 1, 0);
			}
		}
		
		public function createHeatPerk(dayCycle:int = 7):void
		{
			return; // 9999 Pending writing before enabling.
			createPerk("Heat Cycle", 0, 0, 0, 0, "");
			setPerkValue("Heat Cycle", 2, dayCycle);
			setPerkTooltip("Heat Cycle", "Your body will periodically cycle through the stages of heat every" + (dayCycle == 1 ? "day" : (" " + dayCycle + " days")) + ".");
		}
		private function updateHeatPerk(totalDays:uint):void
		{
			// Ignore if already pregnant or infertile
			if(!hasVagina() || isFullyWombPregnant() || fertility() <= 0) return;
			
			var heatCycle:StorageClass = getPerkEffect("Heat Cycle");
			
			if(heatCycle == null) return;
			
			// v1: Cooldown days
			// v2: Max days
			// Add value for cooldown
			heatCycle.value1 += totalDays;
			// If days desired is reached enable cycle
			if(heatCycle.value1 < heatCycle.value2) return;
			// Reset counter
			heatCycle.value1 = 0;
			
			var msg:String = "";
			var numWombs:int = totalVaginas() - totalWombPregnancies();
			
			// Heat
			if(!inHeat())
			{
				msg += "9999";
				msg += " <b>You are now in heat.</b>";
				
				// Heat effects
				// v1 - fertility boon
				// v2 - minimum lust boost
				// v3 - libido boost
				// v4 - tease bonus!
				createStatusEffect("Heat", 5, 25, 10, 3, false, "LustUp", "Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+500% Fertility\n+25 Minimum Lust\n+10 Libido\n+3 Tease Damage", false, 28800, 0xB793C4);
			}
			// Deep Heat
			else if(!inDeepHeat())
			{
				msg += "9999";
				msg += " <b>You are in a deep heat.</b>";
				
				// Yay, heat!
				// v1 - fertility boon
				// v2 - minimum lust boost
				// v3 - libido boost
				// v4 - tease bonus!
				setStatusValue("Heat", 1, 10);
				setStatusValue("Heat", 2, 35);
				setStatusValue("Heat", 3, 25);
				setStatusValue("Heat", 4, 5);
				setStatusTooltip("Heat", "<b>You are in a deep heat!</b> Your body is begging for impregnation, increasing your libido and fertility but also your ability to tease.\n\n+" + statusEffectv1("Heat") * 100 + "% Fertility\n+" + statusEffectv2("Heat") + " Minimum Lust\n+" + statusEffectv3("Heat") + " Libido\n+" + statusEffectv4("Heat") + " Tease Damage");
				extendHeat(7 * 24 * 60);
			}
			// Already in Deep Heat
			else if(heatMinutes() < 22 * 24 * 60)
			{
				msg += "9999";
				msg += " <b>Your heat has been extended.</b>";
				extendHeat(7 * 24 * 60);
			}
			
			if(msg.length > 0) AddLogEvent(msg, "passive", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
		}
		
		public function createRutPerk(dayCycle:int = 7):void
		{
			return; // 9999 Pending writing before enabling.
			createPerk("Rut Cycle", 0, 0, 0, 0, "");
			setPerkValue("Rut Cycle", 2, dayCycle);
			setPerkTooltip("Rut Cycle", "Your body will periodically cycle through the stages of rut every" + (dayCycle == 1 ? "day" : (" " + dayCycle + " days")) + ".");
		}
		private function updateRutPerk(totalDays:uint):void
		{
			// Ignore if can't fertilize or sterile
			if(!hasCock() || virility() <= 0) return;
			
			var rutCycle:StorageClass = getPerkEffect("Rut Cycle");
			
			if(rutCycle == null) return;
			
			// v1: Cooldown days
			// v2: Max days
			// Add value for cooldown
			rutCycle.value1 += totalDays;
			// If days desired is reached enable cycle
			if(rutCycle.value1 < rutCycle.value2) return;
			// Reset counter
			rutCycle.value1 = 0;
			
			var msg:String = "";
			var numCocks:int = totalCocks();
			
			// Rut
			if(!inRut())
			{
				msg += "9999";
				msg += " <b>You are now in rut.</b>";
				
				// Rut effects
				// v1 - libido increase.
				// v2 - min lust
				// v3 - minimum cum increase.
				// v4 - virility increase
				createStatusEffect("Rut", 5, 25, 1000, 4, false, "LustUp", "Your body is driven for aggressive breeding, increasing your libido and virility, as well as boosting your minimum cum output.\n\n+5 Libido\n+25 Minimum Lust\n+1000mLs Minimum Cum\n+400% Virility",false,28800,0xB793C4);
			}
			// Already in Rut
			else if(rutMinutes() < 22 * 24 * 60)
			{
				msg += "9999";
				msg += " <b>Your rut has been extended.</b>";
				extendRut(7 * 24 * 60);
			}
			
			if(msg.length > 0) AddLogEvent(msg, "passive", ((1440 - (GetGameTimestamp() % 1440)) + ((totalDays - 1) * 1440)));
		}
		private function processOmegaFever(totalDays:uint):void
		{
			if (hasPerk("Omega Fever"))
			{
				OmegaOil.checkOmegaFever(this);
			}
		}

		private function racialPerkUpdateCheck(deltaT:uint, doOut:Boolean):void
		{
			if(!hasPerk("True Doll") && hasPerk("Black Latex") && hasPerk("Implant-tastic"))
			{
				if(skinType == GLOBAL.SKIN_TYPE_LATEX && siliconeRating() >= 10) kGAMECLASS.gainTrueDollPerk(this, deltaT);
			}
			if(hasPerk("'Nuki Nuts"))
			{
				if(balls <= 0 && perkv1("'Nuki Nuts") != 0)
				{
					// Empty reserves!
					ballSizeMod -= perkv1("'Nuki Nuts");
					setPerkValue("'Nuki Nuts", 1, 0);
				}
				if(perkv2("'Nuki Nuts") != 1 && nukiScore() < 3)
				{
					if(balls > 0)
					{
						//Nuts inflated:
						if(perkv1("'Nuki Nuts") > 0)
						{
							AddLogEvent(ParseText("The extra size in your [pc.balls] bleeds off, making it easier to walk. You have a hunch that without all your"), "passive", deltaT);
							if(originalRace.indexOf("kui-tan") != -1) ExtendLogEvent(" natural kui-tan genes");
							else ExtendLogEvent(" kui-tan body-mods");
							ExtendLogEvent(ParseText(", you won’t be swelling up with excess [pc.cumNoun] any more."));
						}
						//Nuts not inflated:
						else
						{
							AddLogEvent(ParseText("A tingle spreads through your [pc.balls]. Once it fades, you realize that your [pc.sack] is noticeably less elastic. Perhaps you’ve replaced too much kui-tan DNA to reap the full benefits."), "passive", deltaT);
						}
						ExtendLogEvent("\n\n(<b>Perk Lost: ‘Nuki Nuts</b>)");
						ballSizeMod -= perkv1("'Nuki Nuts");
						removePerk("'Nuki Nuts");
						kGAMECLASS.nutStatusCleanup();
					}
					else
					{
						AddLogEvent("(<b>Perk Lost: ‘Nuki Nuts</b> - You no longer meet the requirements. You’ve lost too many kui-tan transformations.)", "passive", deltaT);
						removePerk("'Nuki Nuts");
					}
				}
				else if(/*perkv2("'Nuki Nuts") == 1 && */balls <= 0)
				{
					AddLogEvent("A strange sensation hits your nethers that forces you to wobble a little... Checking your status on your codex, it seems that removing your ballsack has also made the signature testicle-expanding tanuki mod vanish as well!\n\n(<b>Perk Lost: ‘Nuki Nuts</b> - You have no nuts to expand!)", "passive", deltaT);
					removePerk("'Nuki Nuts");
				}
			}
			if(hasPerk("Cum Cascade") && !hasPerk("'Nuki Nuts"))
			{
				AddLogEvent("(<b>Perk Lost: Cum Cascade</b> - You have lost the extra semen producing side effect of ‘Nuki Nuts.)");
				removePerk("Cum Cascade");
			}
			if(hasPerk("Fecund Figure"))
			{
				if(!hasVagina())
				{
					AddLogEvent("No longer possessing a vagina, your body tingles", "passive", deltaT);
					if((perkv1("Fecund Figure") + perkv2("Fecund Figure") + perkv3("Fecund Figure")) > 0) ExtendLogEvent(", rapidly changing as you lose your fertility goddess-like build");
					ExtendLogEvent(".\n\n(<b>Perk Lost: Fecund Figure</b>)");
					removePerk("Fecund Figure");
				}
			}
			if(hasStatusEffect("Special Scrotum"))
			{
				if(balls <= 0)
				{
					AddLogEvent("A tingling sensations hits your crotch as you feel something fading away... Your codex beeps, informing you that, due to the lack of testicles, the unique covering for your non-existent scrotum has finally dissolved from your system.", "passive", deltaT);
					removeStatusEffect("Special Scrotum");
				}
			}
			if(statusEffectv4("Vanae Markings") > 0)
			{
				if(balls <= 0)
				{
					AddLogEvent("A tingling sensations hits your crotch as you feel something fading away... Your codex beeps, informing you that the last remnants of your " + skinAccent + " testicular tattoos have left your body, leaving the area bare.", "passive", deltaT);
					setStatusValue("Vanae Markings", 4, 0);
				}
			}
			if(hasStatusEffect("Nyrea Eggs"))
			{
				if(!hasPerk("Nyrea Eggs") && statusEffectv4("Nyrea Eggs") != 0) setStatusValue("Nyrea Eggs", 4, 0);
				if((statusEffectv4("Nyrea Eggs") != 1 && nyreaScore() < 3) || !hasOvipositor())
				{
					AddLogEvent("You are interrupted by a shifting in your insides as a bubbling sensation fills your loins, and then... nothing.", "passive", deltaT);
					if(statusEffectv1("Nyrea Eggs") > 0)
					{
						ExtendLogEvent(" Strangely, you feel");
						if(statusEffectv1("Nyrea Eggs") <= 5) ExtendLogEvent(" as if something is missing.");
						else if(statusEffectv1("Nyrea Eggs") <= 10) ExtendLogEvent(" a bit lighter now.");
						else if(statusEffectv1("Nyrea Eggs") <= 50) ExtendLogEvent(" like you have lost some pounds.");
						else if(statusEffectv1("Nyrea Eggs") <= 100) ExtendLogEvent(" much lighter now.");
						else ExtendLogEvent(" like a huge weight has been lifted from you.");
					}
					ExtendLogEvent(" Double-checking your codex, you find that");
					if(statusEffectv1("Nyrea Eggs") > 0) ExtendLogEvent(ParseText(" the nyrean eggs you’ve been carrying in your [pc.cumNoun] have dissolved and absorbed into your body"));
					else ExtendLogEvent(ParseText(" your [pc.cumNoun] is no longer capable of producing eggs anymore"));
					ExtendLogEvent(". It must be due to " + (hasOvipositor() ? "the lack of nyrean genes in your system" : "your lack of an ovipositor") + "....");
					removeStatusEffect("Nyrea Eggs");
				}
			}
			else if(hasPerk("Nyrea Eggs") && hasOvipositor())
			{
				// Regain permanent effect if has perk.
				AddLogEvent(ParseText("You feel a familiar bloating in your body and discover that your [pc.cumNoun] has started producing nyrean eggs again!"), "passive", deltaT);
				createStatusEffect("Nyrea Eggs", 80 + rand(21), 1, 0, 1, true, "", "", false, 0);
			}
			if(hasPerk("Slut Stamp"))
			{
				if(!hasGenitals())
				{
					AddLogEvent(ParseText("A sudden burning sensation hits your lower back, right above your [pc.ass]. You quickly"), "passive", deltaT);
					if(isCrotchGarbed()) ExtendLogEvent(ParseText(" struggle through your [pc.lowerGarments],"));
					ExtendLogEvent(" turn back and wince hard when the area is instantly struck by a refreshing coolness - as if being splashed on with cold water after being branded. When your hazed vision returns to normal, you see the slutty tattoo that resides there gradually dissolve and vanish before your eyes. It looks like your lack of genitalia makes it easier for you to cope with your libido now.\n\n(<b>Perk Lost: Slut Stamp</b>)");
					removePerk("Slut Stamp");
				}
			}
			if (hasPerk("Androgyny") && perkv1("Androgyny") > 0 && !hasFaceFlag(GLOBAL.FLAG_MUZZLED))
			{ // removal of Androgyny perk with the loss of muzzle.
				AddLogEvent("With your face becoming more human, your appearance is now no longer androgynous.\n\n(<b>Perk Lost: Androgyny</b> - You’ve lost your muzzle.)", "passive", deltaT);
				removePerk("Androgyny");
			}
			if (hasPerk("Icy Veins") && perkv1("Icy Veins") > 0 && (!hasSkinFlag(GLOBAL.FLAG_FLUFFY) || !InCollection(skinType, GLOBAL.SKIN_TYPE_FUR, GLOBAL.SKIN_TYPE_FEATHERS)))
			{ // removal of Icy Veins perk with he loss of fluffy fur (fork on still having fur but not fluffy flag?).
				AddLogEvent("Without all that thick, fluffy coat of fur you suddenly feel rather cold...\n\n(<b>Perk Lost: Icy Veins</b> - You’ve lost your insulating coat of fur, and as a result you are now weaker against cold.)", "passive", deltaT);
				removePerk("Icy Veins");
			}
			if(flags["GALOMAX_DOSES"] != undefined)
			{
				if(hasHair() && hairType != GLOBAL.HAIR_TYPE_GOO && !hasStatusEffect("Hair Regoo"))
				{
					AddLogEvent(ParseText("There is a slight tingling sensation at the roots of your [pc.hair].... Hm, strange...."), "passive", deltaT);
					createStatusEffect("Hair Regoo", 0, 0, 0, 0, true, "", "", false, 720);
				}
			}
			if(hasPerk("Black Latex"))
			{
				if(skinType != GLOBAL.SKIN_TYPE_LATEX && !hasStatusEffect("Latex Regrow"))
				{
					AddLogEvent("Somehow, losing your natural latex skin makes you feel naked and insecure... You hope this feeling doesn’t last for too long...", "passive", deltaT);
					createStatusEffect("Latex Regrow", 0, 0, 0, 0, true, "", "", false, 720);
				}
			}
			if(armType == GLOBAL.TYPE_FLOWER && hasVagina())
			{
				if(!hasStatusEffect("Arm Flower") && totalWombPregnancies() < vaginas.length)
				{
					// Choose Flower Color
					var flowerColor:String = RandomInCollection(["red", "yellow", "blue", "purple", "pink", "white"]);
					
					AddLogEvent(ParseText("A summery feeling spreads down your arm ivy, like tiny veins of lustful energy. You intimately feel each of the small " + flowerColor + " flowers that pop and blossom into being on the delicate vines, like little skips of the heart.\n\nWhy have you flowered like this? The rational part of your brain doesn’t have an answer... but the clear, green part of you knows. Your empty womb and [pc.eachVagina] know. You are ripe and ready for seeding, and your body is brightly signaling that fact to anyone that looks at you the best way it knows how."), "passive", deltaT);
					
					createStatusEffect("Arm Flower", 0, 0, 0, 0, true, "", flowerColor, false);
					// +Lust, slow Libido increase of 5
					slowStatGain("libido", 5);
					lust(50);
				}
				else if(hasStatusEffect("Arm Flower") && totalWombPregnancies() >= vaginas.length)
				{
					AddLogEvent(ParseText("Your " + getStatusTooltip("Arm Flower") + " arm flowers droop and, over the course of the next hour, de-petal. Evidently they feel their work is done... which can only mean one thing. You stroke your [pc.belly]."), "passive", deltaT);
					
					//Libido decrease of 3
					libido(-3);
					removeStatusEffect("Arm Flower");
				}
			}
			else if(armType != GLOBAL.TYPE_FLOWER && hasStatusEffect("Arm Flower"))
			{
				removeStatusEffect("Arm Flower");
			}
			if(hasPerk("Resin"))
			{
				if(skinType != GLOBAL.SKIN_TYPE_BARK)
				{
					AddLogEvent("The surface of your body tingles and your nose briefly catches a whiff of a familiar amber aroma--which then completely dissipates into the air. Curious, you check your codex and, sure enough, due to the lack of your once bark skin, you’ve lost the ability to create a resin cast to protect yourself. Well, at least you feel a bit more nimble now...\n\n(<b>Perk Lost: Resin</b>)", "passive", deltaT);
					
					removePerk("Resin");
				}
			}
			if(hasPerk("Flower Power"))
			{
				var numFlowers:int = 0;
				if(hasStatusEffect("Hair Flower"))
				{
					if(statusEffectv1("Hair Flower") > 1) numFlowers += statusEffectv1("Hair Flower");
					else numFlowers++;
				}
				if(hasStatusEffect("Arm Flower")) numFlowers += 2;
				if(hasVaginaType(GLOBAL.TYPE_FLOWER)) numFlowers += totalVaginas(GLOBAL.TYPE_FLOWER);
				if(tailGenitalArg == GLOBAL.TYPE_FLOWER && hasTailCunt()) numFlowers += tailCount;
				
				if (perkv1("Flower Power") <= 0 && numFlowers > 0)
				{
					AddLogEvent("The flower" + (numFlowers == 1 ? "" : "s") + " located on your body blossom" + (numFlowers == 1 ? "s" : "") + ", ready to unleash " + (numFlowers == 1 ? "its" : "their") + " lust-inducing spores--this also adds to your sexual appetite... not that that’s a bad thing, after all!", "passive", deltaT);
				}
				else if (perkv1("Flower Power") > 0 && numFlowers <= 0)
				{
					AddLogEvent("Without any flowers located on your body, you feel the need to produce spores fade. While this relaxes your body’s sexual urges, you know that producing any new flowers will have you ready for pollination again.", "passive", deltaT);
				}
				
				setPerkValue("Flower Power", 1, numFlowers);
			}
			if(hasStatusEffect("Remove Energizing Libido"))
			{
				AddLogEvent("You feel less horny and energetic than usual--and you just had an orgasm too! Perhaps due to a low libido, your body has given up on the ability to replenish energy when you engage in sexual activity?", "passive", deltaT);
				if(hasPerk("Snu-Snu Queen"))
				{
					ExtendLogEvent("\n\n(<b>Perk Lost: Snu-Snu Queen</b>)");
					removePerk("Snu-Snu Queen");
				}
				if(hasPerk("Energizing Libido"))
				{
					ExtendLogEvent("\n\n(<b>Perk Lost: Energizing Libido</b>)");
					removePerk("Energizing Libido");
				}
				removeStatusEffect("Remove Energizing Libido");
			}
			if(hasPerk("Wooly"))
			{
				// If sheered or changed skin type recently, regrow fur after 7 days!
				if(perkv1("Wooly") >= 1 && !hasFur())
				{
					setPerkValue("Wooly", 1, -7);
				}
				// Regrow wool when timer hits 0.
				else if(perkv1("Wooly") == 0)
				{
					AddLogEvent(ParseText("A familiar tingle spreads across your [pc.skin], and before you can scratch the itch, " + (hasFur() ? "the fur on your chest and back grows and thickens into curls" : "thick, curly fur starts to push out from your chest and back") + ", making you appear like quite the sheep. <b>You have regrown your coat of wool!</b>"), "passive", deltaT);
					SheepTF.growWool(this);
				}
			}
			if(hasStatusEffect("Wool Removal"))
			{
				AddLogEvent("An itching sensation hits you, and you feel the need to scratch it.", "passive", deltaT);
				// Remove Wooly Perk.
				if(hasPerk("Wooly"))
				{
					if(hasFur() && perkv1("Wooly") >= 1) ExtendLogEvent(ParseText(" As you claw at your [pc.skinNoun], thick patches of curly wool fall off the surface like loose yarn, " + (hasFur() ? "leaving behind relatively short fur" : "leaving you with your [pc.skinFurScales]") + ". Checking your codex, you confirm that your body has lost the ability to maintain its wooly coat."));
					else ExtendLogEvent(ParseText(" You claw at your [pc.skinNoun] until the irritation subsides. Relaxed, you check your codex, only to find that your body has lost the ability to regrow and maintain its wooly coat."));
					ExtendLogEvent("\n\n(<b>Perk Lost: Wooly</b>)");
					removePerk("Wooly");
				}
				removeStatusEffect("Wool Removal");
			}
			if(hasPerk("Myr Venom"))
			{
				if(!hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
				{
					AddLogEvent(ParseText("Your natural venom drips into your mouth so much that your [pc.tongue] may as well be stained with it. Certain people might react to the diluted dose..."), "passive", deltaT);
					addTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED);
				}
			}
			if(hasStatusEffect("Hyena Fur") && (skinType != GLOBAL.SKIN_TYPE_FUR || furColor != "black")) removeStatusEffect("Hyena Fur");
		}
		
		// Mimbrane jazz.
		public function mimbranePartDescript(mimType: String = ""): String
		{
			var mimbrane:StorageClass = getStatusEffect(mimType);
			
			if(mimbrane == null) return ("<b>ERROR: mimbranePartDescript() called for unknown mimbrane “" + mimType + "”</b>");
			
			//Mimbrane additions in relation to face.
			var desc: String = "";
			
			//Player character check--not sure if NPCs can get the Mims since the flags are probably global...
			// 50% trust and hunger-related description
			if(rand(2) == 0) {
				if(mimbrane.value1 <= 0) desc += "mutinous";
				else if(mimbrane.value1 <= 1) desc += "shifty";
				else if(mimbrane.value1 <= 2) desc += "questionable";
				else if(mimbrane.value1 <= 3) desc += "befriended";
				else if(mimbrane.value1 <= 4) desc += "loyal";
				else desc += "devoted";
				desc += " and ";
				if(mimbrane.value2 <= 0) desc += "satiated";
				else if(mimbrane.value2 <= 1) desc += "well-fed";
				else if(mimbrane.value2 <= 2) desc += "fed";
				else if(mimbrane.value2 <= 3) desc += "slightly hungry";
				else if(mimbrane.value2 <= 4) desc += "hungry";
				else if(mimbrane.value2 <= 5) desc += "very hungry";
				else if(mimbrane.value2 <= 6) desc += "starving";
				else desc += "irritable";
			}
			// 50% sweatiness and combat-ready description
			if (rand(2) == 0) {
				if(flags["PLAYER_MIMBRANE_SWEAT_ENABLED"] == 1 && mimbrane.value1 >= 3) {
					if (desc != "") desc += ", ";
					desc += RandomInCollection(["glistening", "moist", "slippery", "self-lathering", "perspiring", "mucid", "sudoriferous", "clammy", "diaphoretic", "sweating"]);
				}
				if (flags["PLAYER_MIMBRANE_SPIT_ENABLED"] == 1 && mimbrane.value1 >= 4) {
					if (desc != "") desc += " and ";
					desc += RandomInCollection(["lust-inducing", "lust-spraying", "lust-projecting", "lust-spitting"]);
				}
			}
			if (desc != "") desc += " ";
			// Mimbrane descriptor
			if (rand(10) > 4) desc += "Mimbrane";
			else desc += RandomInCollection(["parasite", "epidel", "graft", "second skin", "cum leech"]);
			
			return desc;
		}
		public function mimbranePuffiness(mimType: String = ""):Number
		{
			var mimbrane:StorageClass = getStatusEffect(mimType);
			
			if(mimbrane == null) return 0;
			
			var toggle:String = "";
			switch(mimType)
			{
				case "Mimbrane Cock": toggle = "COCK"; break;
				case "Mimbrane Pussy": toggle = "CUNT"; break;
				case "Mimbrane Ass": toggle = "BUTT"; break;
				case "Mimbrane Balls": toggle = "SACK"; break;
				case "Mimbrane Boobs": toggle = "TITS"; break;
				case "Mimbrane Hand Left":
				case "Mimbrane Hand Right": toggle = "HAND"; break;
				case "Mimbrane Foot Left":
				case "Mimbrane Foot Right": toggle = "FOOT"; break;
				case "Mimbrane Face": toggle = "FACE"; break;
			}
			if(toggle != "" && flags["MIMBRANE_NOSWELL_" + toggle]) return 0;
			
			var puffScore:Number = 0;
			
			if(mimbrane.value3 >= 3) puffScore += 1;
			if(mimbrane.value3 >= 8) puffScore += 1;
			if(mimbrane.value3 >= 13) puffScore += 1;
			
			return puffScore;
		}
	}
}
