package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.ItemSlotClass;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Piercings.*;
	public class BreastRowClass extends UnversionedSaveable
	{
		//constructor
		public function BreastRowClass()
		{
		}
		
		//For cheateyness.
		// include "consts.as";
		
		//VARS AHOOOYYY
		public var breasts:Number = 2;
		
		public var nippleType:Number = 0;
		public var areolaFlags:Array = new Array();
		public var breastRatingRaw:Number = 0;
		public var breastRatingMod:Number = 0;
		public var breastRatingLactationMod:Number = 0;
		public var breastRatingHoneypotMod:Number = 0;

		//New piercing hotness:
		public var piercing:ItemSlotClass = new EmptySlot();
		
		public function breastRating(arg:Number = 0, apply:Boolean = false):Number
		{
			if(isNaN(breastRatingRaw)) breastRatingRaw = 0;
			if(isNaN(breastRatingMod)) breastRatingMod = 0;
			if(isNaN(breastRatingLactationMod)) breastRatingLactationMod = 0;
			if(isNaN(breastRatingHoneypotMod)) breastRatingHoneypotMod = 0;
			
			if (apply)
			{
				breastRatingRaw = arg;
			}
			else if (arg != 0)
			{
				breastRatingRaw += arg;
				if (breastRatingRaw < 0) breastRatingRaw = 0;
			}
			
			var currRating:Number = breastRatingRaw + breastRatingMod + breastRatingLactationMod + breastRatingHoneypotMod;
			
			if (currRating < 0)
			{
				return 0;
			}
			else
			{
				return currRating;
			}
		}
		
		//Fullness used for lactation....if 75 or greater warning bells start going off!
		//If it reaches 100 it reduces lactation multiplier.
		public var fullness:Number = 0;
		public function fuckable():Boolean {
			return (nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE || nippleType == GLOBAL.NIPPLE_TYPE_LIPPLES);
		}
		
		//FLAG CHECKIN!
		public function hasAreolaFlag(arg:int):Boolean {
			for(var x:int = 0; x < areolaFlags.length;x++) {
				if(arg == areolaFlags[x]) return true;
			}
			return false;
		}
		public function addAreolaFlag(arg:int):void {
			if(!hasAreolaFlag(arg)) areolaFlags[areolaFlags.length] = arg;
			else trace("Attempted to add flag " + arg + " to nipples of type " + nippleType + ".");
		}
		public function delAreolaFlag(arg:int):void
		{
			//Find and destroy it.
			var i:int = (areolaFlags.length - 1);
			while (i >= 0)
			{
				if(areolaFlags[i] == arg) areolaFlags.splice(i, 1);
				i--;
			}
		}
		public function delAreolaShapeFlags():void
		{
			//Find and destroy it.
			var i:int = (areolaFlags.length - 1);
			while (i >= 0)
			{
				if(areolaFlags[i] == GLOBAL.FLAG_HEART_SHAPED) areolaFlags.splice(i, 1);
				if(areolaFlags[i] == GLOBAL.FLAG_STAR_SHAPED) areolaFlags.splice(i, 1);
				if(areolaFlags[i] == GLOBAL.FLAG_FLOWER_SHAPED) areolaFlags.splice(i, 1);
				i--;
			}
		}
		public function clearAreolaFlags():void {
			areolaFlags = new Array();
		}
	}
}
