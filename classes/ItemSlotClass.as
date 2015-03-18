package classes
{
	import classes.Characters.PlayerCharacter;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ItemSaveable;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.Engine.Combat.DamageTypes.DamageType;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class ItemSlotClass extends ItemSaveable
	{
		public var stackSize:int;

		// shortName still exists, I've just moved it into ItemSaveable for... reasons.
		
		//Regular name
		public var longName:String;
		//Longass shit, not sure what used for yet.
		public var description:String;
		//Displayed on tooltips during mouseovers
		public var tooltip:String;
		public var attackVerb:String;
		//Information
		public var type:int;
		public var basePrice:Number;
		
		//Flags
		public var itemFlags:Array;
		
		//Equipped properties
		//Bonus tohit
		public var attack:Number;

		public var baseDamage:TypeCollection;
		
		public var defense:Number;
		public var shieldDefense:Number;
		public var shields:Number;
		public var sexiness:Number;
		public var critBonus:Number;
		public var evasion:Number;
		public var fortification:Number;
		public var hardLightEquipped:Boolean;
		
		public var resistances:TypeCollection;
		
		public var isUsable:Boolean;
		public var combatUsable:Boolean;
		public var targetsSelf:Boolean;
		
		//constructor
		public function ItemSlotClass(dataObject:Object = null)
		{
			this._latestVersion = 1;
			// Two-stage constructors. Storage is pre-allocated, 
			// and the variables are merely set on instantiation.

			this.quantity = 0;
			this.stackSize = 5;
			//Used on inventory buttons
			this.shortName = "";
			//Regular name
			this.longName = "";
			//Longass shit, not sure what used for yet.
			this.description = "";
			//Displayed on tooltips during mouseovers
			this.tooltip = "";
			this.attackVerb = "";
			//Information
			this.type = 0;
			this.basePrice = 0;
		
			//itemFlags
			this.itemFlags = new Array();
		
			//Equipped properties
			this.attack = 0;
			
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			baseDamage = new TypeCollection();
			
			this.hardLightEquipped = false;
		
			this.isUsable = true;
			this.combatUsable = false;
			this.targetsSelf = true;
			
			if (dataObject != null)
			{
				this.loadSaveObject(dataObject);
			}
			else
			{
				this.version = 1;
			}
		}
		
		public function addFlag(arg:int):void 
		{
			if(this.hasFlag(arg)) 
				return;
			this.itemFlags[this.itemFlags.length] = arg;
		}
		
		public function hasFlag(arg:int):Boolean 
		{
			for(var x:int = 0; x < itemFlags.length; x++) {
				if(arg == itemFlags[x]) 
					return true;
			}
			return false;
		}
		
		public function deleteFlag(arg:int):void 
		{
			if(!this.hasFlag(arg)) 
				return;
			for(var x:int = 0; x < this.itemFlags.length; x++) 
			{
				if(arg == this.itemFlags[x]) this.itemFlags.splice(x,1);
			}
		}
		
		public function useFunction(targetCreature:Creature, usingCreature:Creature = null):Boolean
		{
			throw new Error("useFunction must be overriden in a child class!");
		}
		
		/**
		 * Compare this item's stats against another item object.
		 * @param	item	Item to compare against
		 * @return			Resultant HTML formatted string of the diff
		 */
		public function compareTo(oldItem:ItemSlotClass, seller:Creature = null, buyer:Creature = null):String
		{
			var compareString:String = "";
			var statString:String = "";
			
			// "this." is the *new* item, "item." is the *old* item that "this." will replace
			
			compareString = mergeString(compareString, this.statDiff("attack", 			"Accuracy",			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("critBonus", 		"Crit Bonus", 		this, oldItem));
			//compareString = mergeString(compareString, this.statDiff("damage", 			"Damage", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("defense", 		"Defense", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("evasion", 		"Evasion", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("fortification", 	"Fortification", 	this, oldItem));
			compareString = mergeString(compareString, this.statDiff("sexiness",		"Sexiness",			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("shieldDefense",	"Shield Defense", 	this, oldItem));
			compareString = mergeString(compareString, this.statDiff("shields", 		"Shields", 			this, oldItem));
			//compareString = mergeString(compareString, this.statDiff("bonusLustVuln",	"Lust Vulnerability",this, oldItem, true, true));
			
			// Damage Type & Bonus Resistances will be a pain in the cunt
			
			// TODO: Display weapon damage
			
			// Item value -- this is going to be a bit of a shit. I can't easily figure out what "mode" a button is at this point, so this code doesn't know if we're buying or selling,
			// so we dunno which modifiers to use to figure out the actual value of an item wrt a specific vendor.
			// Can't lean on the shopKeep stuff, because some vendors in game atm don't use it (Crazy Carl), so we can't just track the "state" we need and pull the data later.
			// I THINK I have a method to do this fairly cleanly, regardless -- but I think it would be better to just show the base price, and have some blurb in the scene text to list the actual
			// prices a given NPC will sell/buy the stuff for.
			if ('basePrice' in this)
			{
				if (compareString.length > 0) compareString += "\n";
				
				var price:Number = this.basePrice;
								
				if (seller != null && buyer != null)
				{
					price = Math.round(price * seller.sellMarkup * buyer.buyMarkdown);
				}
				
				var valueString:String = "Price: " + price + " Credits";
				
				compareString = mergeString(compareString, valueString);
			}
			
			// I think the only place that bonusResistances are used atm is on shields. Going to check shields + armor + accessory? as a catchall
			if (this.type == GLOBAL.ARMOR || this.type == GLOBAL.SHIELD || this.type == GLOBAL.ACCESSORY || this.type == GLOBAL.LOWER_UNDERGARMENT || this.type == GLOBAL.UPPER_UNDERGARMENT)
			{
				var resistString:String = resistancesDiff(this, oldItem);
				
				if (compareString.length > 0 && resistString.length > 0) compareString += "\n" + resistString;
			}
			
			// Considering we don't even have any item flags atm, I'm going to ignore it for the time being.
			
			// For custom items, we need to figure out exactly what kinds of things we could mod into a weapon, and how best to display them, and how that system is going to work. 
			// I've got some ideas that ima forumpoast about so we can figure out exactly what direction we wanna go with that. 
			// It'll be better than just saying "OH HEY CUSTOMISABLE ITEMS" and having no idea what that entails at least.
			
			if (compareString.length > 0) compareString = "<span class='words'><p>" + compareString + "</p></span>";
			return compareString;
		}
		
		/**
		 * Merge a string into a larger string, including tab characters when appropriate
		 * @param	to				String to merge into
		 * @param	withString		String to merge in
		 * @return					Merged string of to + withString
		 */
		private function mergeString(to:String, withString:String):String
		{
			if (withString == null || withString.length == 0) return to;
			
			// This is so we can sort formatting spacing and shit I guess
			if (to.length > 0) to += "\n";
			
			to += withString;
			return to;
		}
		
		/**
		 * Figure out the difference between an item stat property and generate formatted HTML to display the difference.
		 * @param	propertyName		Class property name present in itemSlotClass to compare
		 * @param	displayAs			Displayable name for the property, if a diff is found
		 * @param	newItem				The "replacement" item
		 * @param	oldItem				The item the "replacement" would displace
		 * @return						Formatted HTML string
		 */
		private function statDiff(propertyName:String, displayAs:String, newItem:ItemSlotClass, oldItem:ItemSlotClass, asPercentage:Boolean = false, lowIsGood:Boolean = false):String
		{
			var resultString:String = "";
			var closeFormatting:Boolean = false;
			
			// Grab the actual stat values out of the item objects.
			var newItemStat:* = newItem[propertyName];
			var oldItemStat:* = oldItem[propertyName];
			var statDiff:Number = 0;
			
			// Ensure the properties are some form of numerical type -- I think its safe to assume
			// that both newItem and oldItem will have the same type, because the vars in the class
			// def are typed -- ie there would have been errors elsewhere if they don't match.
			if (newItemStat is Number || newItemStat is int)
			{
				statDiff = newItemStat - oldItemStat;
			}
			
			if (asPercentage)
			{
				statDiff = 100 * statDiff;
				newItemStat = 100 * newItemStat;
			}
			
			// Any stat with a difference, or A value
			if (statDiff != 0 || newItemStat != 0)
			{
				resultString += displayAs + ": <b>";
				resultString += newItemStat;
				if (asPercentage) resultString += "%";
				resultString += "</b> ";
				
				if (!lowIsGood)
				{
					// Figure out formatting shit
					if (statDiff < 0)
					{
						resultString += "<span class='bad'><b>(";
					}
					else if (statDiff > 0)
					{
						resultString += "<span class='good'><b>(+";
					}
					else if (statDiff == 0)
					{
						resultString += "<span class='words'><b>(";
					}
				}
				else
				{
					// Figure out formatting shit
					if (statDiff > 0)
					{
						resultString += "<span class='bad'><b>(+";
					}
					else if (statDiff < 0)
					{
						resultString += "<span class='good'><b>(";
					}
					else if (statDiff == 0)
					{
						resultString += "<span class='words'><b>(";
					}
				}
				
				resultString += statDiff;
				if (asPercentage) resultString += "%";
				resultString += ")</b></span>";
			}
			
			return resultString;
		}
		
		/**
		 * Figure out the differences, if any, between the bonusResistance arrays between two items and generate formatted HTML to display the difference.
		 * TODO: Resistances are inverse -- the values are used as damage multipliers, ie, lower is strictly better.
		 * TODO: Convert the displayed values into percentages?
		 * @param	newItem		The "replacement" item
		 * @param	oldItem		The item the replacement would displace
		 * @return				Formatted HTML string
		 */
		private function resistancesDiff(newItem:ItemSlotClass, oldItem:ItemSlotClass):String		
		{
			var res:String = "";
			
			res += getResistComparison("Damage Resistances", DamageType.HPDamageTypes, newItem, oldItem);
			res += getResistComparison("Lust Resistances", DamageType.LustDamageTypes, newItem, oldItem);
			
			return res;
		}
		
		private function getResistComparison(headerString:String, typesList:Array, newItem:ItemSlotClass, oldItem:ItemSlotClass):String
		{
			var resistancesDiffString:String = "";
			var flipFlop:Boolean = false;
			
			for (var i:uint = 0; i < typesList.length; i++)
			{
				var resistIndex:uint = typesList[i];
				
				// Skip resistances that are default on both items
				if (newItem.resistances.getType(resistIndex).damageValue == 0 && oldItem.resistances.getType(resistIndex).damageValue == 0) continue;
				
				// Prepend the header if this is the first resistance that is actually going to be displayed.
				if (resistancesDiffString.length == 0)
				{
					resistancesDiffString += "\n" + headerString + ": \n";
					resistancesDiffString += "<textformat tabstops='59,96,150,206,246'>";
				}
				
				// Print the new items resistance value as a %
				resistancesDiffString += newItem.resistances.getType(resistIndex).longName + "\t ";
				resistancesDiffString += String(newItem.resistances.getType(resistIndex).damageValue) + "%\t ";
					
				// Display the comparison value
				var newRes:Number = newItem.resistances.getType(resistIndex).damageValue;
				var oldRes:Number = oldItem.resistances.getType(resistIndex).damageValue;
					
				if (newRes > oldRes)
				{
					// Good
					resistancesDiffString += "<span class='good'><b>(+";
					resistancesDiffString += newRes - oldRes;
				}
				else if (newRes < oldRes)
				{
					// Bad
					resistancesDiffString += "<span class='bad'><b>(-";
					resistancesDiffString += oldRes - newRes;
				}
				else
				{
					// No diff
					resistancesDiffString += "<span class='words'><b>(0";
				}
					
				resistancesDiffString += "%)</b></span> ";
				
				if (flipFlop)
				{
					if (i != typesList.length - 1) resistancesDiffString += "\n";
				}
				else
				{
					resistancesDiffString += "\t";
				}
				
				flipFlop != flipFlop;
			}
			
			if (resistancesDiffString.length > 0)
			{
				resistancesDiffString += "</textformat>";
			}
			
			// TODO: Add flags too!
			
			return resistancesDiffString;
		}
	}
}