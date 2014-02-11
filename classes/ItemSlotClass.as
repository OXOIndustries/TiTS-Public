package classes
{
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.DataManager.Serialization.ItemSaveable;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	
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
		//Bonus damage
		public var damage:Number;
		public var damageType:int;
		public var defense:Number;
		public var shieldDefense:Number;
		public var shields:Number;
		public var sexiness:Number;
		public var critBonus:Number;
		public var evasion:Number;
		public var fortification:Number;
		public var bonusResistances:Array;
		
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
			this.damage = 0;
			this.damageType = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
		
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
		
		public function useFunction(targetCreature:Creature):Boolean
		{
			throw new Error("useFunction must be overriden in a child class!");
		}
		
		/**
		 * Compare this item's stats against another item object.
		 * @param	item	Item to compare against
		 * @return			Resultant HTML formatted string of the diff
		 */
		public function compareTo(oldItem:ItemSlotClass):String
		{
			var compareString:String = "";
			var statString:String = "";
			
			// "this." is the *new* item, "item." is the *old* item that "this." will replace
			
			compareString = mergeString(compareString, this.statDiff("attack", 			"Attack", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("critBonus", 		"Crit Bonus", 		this, oldItem));
			compareString = mergeString(compareString, this.statDiff("damage", 			"Damage", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("defense", 		"Defense", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("evasion", 		"Evasion", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("fortification", 	"Fortification", 	this, oldItem));
			compareString = mergeString(compareString, this.statDiff("sexiness",		"Sexiness",			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("shieldDefense",	"Shield Defense", 	this, oldItem));
			compareString = mergeString(compareString, this.statDiff("shields", 		"Shields", 			this, oldItem));
			
			// Damage Type & Bonus Resistances will be a pain in the cunt
			
			// Default DamageType value is 0. GLOBAL.KINETIC is ALSO 0. Fuck.
			// I guess as a workaround we can just check what the _types_ of the items involved are, and only shit out the damageType if we're looking at weapons?
			if (this.type == GLOBAL.MELEE_WEAPON || this.type == GLOBAL.RANGED_WEAPON)
			{
				if (compareString.length > 0) compareString += "\n";
				
				var dType:String = "Damage Type: " + GLOBAL.DamageTypeStrings[this.damageType];
				
				//if (this.damageType != oldItem.damageType)
				//{
					//dType += " (" + GLOBAL.DamageTypeStrings[oldItem.damageType] + ")"
				//}
				
				compareString = mergeString(compareString, dType);
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
		private function statDiff(propertyName:String, displayAs:String, newItem:ItemSlotClass, oldItem:ItemSlotClass):String
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
			
			// Any stat with a difference, or A value
			if (statDiff != 0 || newItemStat != 0)
			{
				resultString += displayAs + ": <b>" + newItemStat + "</b> ";
				
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
				
				resultString += statDiff + ")</b></span>";
			}
			
			return resultString;
		}
		
		/**
		 * Figure out the differences, if any, between the bonusResistance arrays between two items and generate formatted HTML to display the difference.
		 * @param	newItem		The "replacement" item
		 * @param	oldItem		The item the replacement would displace
		 * @return				Formatted HTML string
		 */
		private function resistancesDiff(newItem:ItemSlotClass, oldItem:ItemSlotClass):String
		{
			var resistDifferences:String = "";
			var resistDiffString:String = "";
			var foundResistDiff:Boolean = false;
			
			for (var resistIndex:int = 0; resistIndex < newItem.bonusResistances.length; resistIndex++)
			{
				if (newItem.bonusResistances[resistIndex] != 0 && (newItem.bonusResistances[resistIndex] != oldItem.bonusResistances[resistIndex]))
				{
					foundResistDiff = true;
					
					var diffVal:Number = newItem.bonusResistances[resistIndex] - oldItem.bonusResistances[resistIndex];
					
					if (diffVal < 0)
					{
						resistDiffString += "<span class='bad'>"
					}
					else
					{
						resistDiffString += "<span class='good'>";
					}
					
					resistDiffString += "(" + GLOBAL.DamageTypeShortStrings[resistIndex] + ":" + diffVal + ")</span>  ";
				}
			}
			
			if (foundResistDiff)
			{
				resistDifferences += "Bonus Resistances: " + resistDiffString;
			}
			
			return resistDiffString;
		}
	}
}