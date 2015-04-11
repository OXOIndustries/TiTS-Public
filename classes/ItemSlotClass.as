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
			
			// We don't really need to keep two sets of properties around for additional resists/damage on items -- just repurpose the same thing!
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
			compareString = mergeString(compareString, this.statDiff("defense", 		"Defense", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("evasion", 		"Evasion", 			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("fortification", 	"Fortification", 	this, oldItem));
			compareString = mergeString(compareString, this.statDiff("sexiness",		"Sexiness",			this, oldItem));
			compareString = mergeString(compareString, this.statDiff("shieldDefense",	"Shield Defense", 	this, oldItem));
			compareString = mergeString(compareString, this.statDiff("shields", 		"Shields", 			this, oldItem));
			
			// Damage Type & Bonus Resistances will be a pain in the cunt
			var damageString:String = damageDiff(this, oldItem);
			if (damageString.length > 0)
			{
				if (compareString.length > 0) compareString += "\n\n";
				compareString += damageString;
			}
			
			// I think the only place that bonusResistances are used atm is on shields. Going to check shields + armor + accessory? as a catchall
			if (this.type == GLOBAL.ARMOR || this.type == GLOBAL.SHIELD || this.type == GLOBAL.ACCESSORY || this.type == GLOBAL.LOWER_UNDERGARMENT || this.type == GLOBAL.UPPER_UNDERGARMENT)
			{
				var resistString:String = resistancesDiff(this, oldItem);
				if (resistString.length > 0)
				{
					if (compareString.length > 0) compareString += "\n\n";
					compareString += resistString;
				}
			}
			
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
				
				//APRIL FOOLS! var valueString:String = "Price: " + price + " Dogecoins";
				var valueString:String = "Price: " + price + " Credits";
				
				compareString = mergeString(compareString, valueString);
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
		 * @param	newItem		The "replacement" item
		 * @param	oldItem		The item the replacement would displace
		 * @return				Formatted HTML string
		 */
		private function resistancesDiff(newItem:ItemSlotClass, oldItem:ItemSlotClass):String		
		{
			var pRes:String = getResistComparison("Damage Resistances", DamageType.HPDamageTypes, newItem, oldItem);
			var lRes:String = getResistComparison("Lust Resistances", DamageType.LustDamageTypes, newItem, oldItem);
			
			if (pRes.length > 0 && lRes.length > 0) pRes += "\n\n" + lRes;
			
			// Flagshit
			var flagStr:String = getResistanceFlags("Protective Flags", newItem, oldItem);
			if (pRes.length > 0 && flagStr.length > 0) pRes += "\n\n";
			pRes += flagStr;
			
			return pRes;
		}
		
		private function damageDiff(newItem:ItemSlotClass, oldItem:ItemSlotClass):String
		{
			var pH:String;
			var lH:String;
			
			if (this.type != GLOBAL.MELEE_WEAPON && this.type != GLOBAL.RANGED_WEAPON)
			{
				pH = "Bonus Physical Damage";
				lH = "Bonus Lust Damage";
			}
			else
			{
				pH = "Physical Damage";
				lH = "Lust Damage";
			}
			
			var pDam:String = getDamageComparison(pH, DamageType.HPDamageTypes, newItem, oldItem);
			var lDam:String = getDamageComparison(lH, DamageType.LustDamageTypes, newItem, oldItem);
			
			if (pDam.length > 0 && lDam.length > 0) pDam += "\n\n" + lDam;
			
			// Flagshit
			var flagStr:String = getDamageFlags("Damage Flags", newItem, oldItem);
			if (pDam.length > 0 && flagStr.length > 0) pDam += "\n\n";
			pDam += flagStr;
			
			return pDam;
		}
		
		private function getDamageComparison(header:String, typesList:Array, newItem:ItemSlotClass, oldItem:ItemSlotClass):String
		{
			var damageString:String = "";
			var damAppend:String = "";
			var newDamage:Number = 0;
			var oldDamage:Number = 0;
			var flipFlop:Boolean = false;
			
			for (var i:uint = 0; i < typesList.length; i++)
			{
				var damIndex:uint = typesList[i];
				
				// Skip if both are default
				if (newItem.baseDamage.getType(damIndex).damageValue == 0 && oldItem.baseDamage.getType(damIndex).damageValue == 0) continue;
				newDamage += newItem.baseDamage.getType(damIndex).damageValue;
				oldDamage += oldItem.baseDamage.getType(damIndex).damageValue;
				
				if (damageString.length == 0)
				{
					damAppend += header + ": ";
					damageString += "<textformat tabstops='79,103,150,233'>";
				}
				else
				{
					if (flipFlop)
					{
						if (i != typesList.length - 1)
						{
							damageString += "\n";
						}
					}
					else
					{
						damageString += "\t";
					}
				
					flipFlop = !flipFlop;
				}
				
				// Print the values
				damageString += newItem.baseDamage.getType(damIndex).longName + ":\t ";
				damageString += "<b>" + String(newItem.baseDamage.getType(damIndex).damageValue) + "</b>";
				
				// Print the comparison value
				var newDam:Number = newItem.baseDamage.getType(damIndex).damageValue;
				var oldDam:Number = oldItem.baseDamage.getType(damIndex).damageValue;
				
				if (newDam > oldDam)
				{
					damageString += " <span class='good'><b>(+";
					damageString += String(newDam - oldDam);
				}
				else if (newDam < oldDam)
				{
					damageString += " <span class='bad'><b>(-";
					damageString += String(oldDam - newDam);
				}
				else
				{
					damageString += " <span class='words'><b>(0";
				}
				
				damageString += ")</b></span> ";
			}
			
			if (damageString.length > 0)
			{
				damageString += "</textformat>";
			}
			
			// Total damage difference
			if (newDamage != 0 || oldDamage != 0)
			{
				damAppend += "<b>" + String(newDamage) + "</b>";
				
				if (newDamage > oldDamage)
				{
					damAppend += " <span class='good'><b>(+";
					damAppend += String(newDamage - oldDamage);
				}
				else if (newDamage < oldDamage)
				{
					damAppend += " <span class='bad'><b>(-";
					damAppend += String(oldDamage - newDamage);
				}
				else
				{
					damAppend += " <span class='words'><b>(0";
				}
				
				damAppend += ")</b></span>\n";
			}
			
			damageString = damAppend + damageString;
			
			return damageString;
		}
		
		private function getDamageFlags(headerString:String, newItem:ItemSlotClass, oldItem:ItemSlotClass):String
		{
			var nFlags:Vector.<DamageFlag> = newItem.baseDamage.getFlags();
			var oFlags:Vector.<DamageFlag> = oldItem.baseDamage.getFlags();
			var hasFlags:Array = [];
			
			var flags:String = "Damage Flags:\n";
			var fNew:String = "";
			var fDupe:String = "";
			var fLost:String = "";
			
			for (var i:uint = 0; i < nFlags.length; i++)
			{
				hasFlags.push(nFlags[i].flag);
				
				if (!oldItem.baseDamage.hasFlag(nFlags[i].flag))
				{
					// New flag
					if (fNew.length > 0) fNew += ", ";
					fNew += nFlags[i].short;
				}
				else
				{
					// Dupe flag
					if (fDupe.length > 0) fDupe += ", ";
					fDupe += nFlags[i].short;
				}
			}
			
			for (i = 0; i < oFlags.length; i++)
			{
				if (hasFlags.indexOf(oFlags[i].flag) == -1)
				{
					// Lost flag
					if (fLost.length > 0) fLost += ", ";
					fLost += oFlags[i].short;
				}
			}
			
			// Merge shit together
			if (fNew.length > 0) flags += "<span class='good'><b>" + fNew + "</b></span>";
			if (fDupe.length > 0)
			{
				if (fNew.length > 0) flags += "<span class='words'><b>, </b></span>";
				flags += "<span class='words'><b>" + fDupe + "</b></span>";
			}
			if (fLost.length > 0)
			{
				if (fDupe.length > 0 || fNew.length > 0) flags += "<span class='bad'><b>, </b></span>";
				flags += "<span class='bad'><b>" + fLost + "</b></span>";
			}
			
			if (fNew.length > 0 || fDupe.length > 0 || fLost.length > 0)
			{
				return flags;
			}
			return "";
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
					resistancesDiffString += headerString + ":\n";
					resistancesDiffString += "<textformat tabstops='74,107,152,228,257'>";
				}
				else
				{
					if (flipFlop)
					{
						if (i != typesList.length - 1) resistancesDiffString += "\n";
					}
					else
					{
						resistancesDiffString += "\t";
					}
					
					flipFlop = !flipFlop;
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
					
				resistancesDiffString += ")</b></span> ";
			}
			
			if (resistancesDiffString.length > 0)
			{
				resistancesDiffString += "</textformat>";
			}
			
			return resistancesDiffString;
		}
		
		private function getResistanceFlags(header:String, newItem:ItemSlotClass, oldItem:ItemSlotClass):String
		{
			var nFlags:Vector.<DamageFlag> = newItem.resistances.getFlags();
			var oFlags:Vector.<DamageFlag> = oldItem.resistances.getFlags();
			var hasFlags:Array = [];
			
			var flags:String = header + ":\n";
			var fNew:String = "";
			var fDupe:String = "";
			var fLost:String = "";
			
			for (var i:uint = 0; i < nFlags.length; i++)
			{
				hasFlags.push(nFlags[i].flag);
				
				if (!oldItem.resistances.hasFlag(nFlags[i].flag))
				{
					// New flag
					if (fNew.length > 0) fNew += ", ";
					fNew += nFlags[i].short;
				}
				else
				{
					// Dupe flag
					if (fDupe.length > 0) fDupe += ", ";
					fDupe += nFlags[i].short;
				}
			}
			
			for (i = 0; i < oFlags.length; i++)
			{
				if (hasFlags.indexOf(oFlags[i].flag) == -1)
				{
					// Lost flag
					if (fLost.length > 0) fLost += ", ";
					fLost += oFlags[i].short;
				}
			}
			
			// Merge shit together
			if (fNew.length > 0) flags += "<span class='good'>" + fNew + "</span>";
			if (fDupe.length > 0) flags += "<span class='words'>" + fDupe + "</span>";
			if (fLost.length > 0) flags += "<span class='bad'>" + fLost + "</span>";
			
			if (fNew.length > 0 || fDupe.length > 0 || fLost.length > 0)
			{
				return flags;
			}
			return "";
		}
	}
}