package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.ItemSlotClass;
	import classes.Items.Miscellaneous.EmptySlot;
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
		public var nippleFlags:Array = new Array();
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
		public function hasFlag(arg:int):Boolean {
			for(var x:int = 0; x < nippleFlags.length;x++) {
				if(arg == nippleFlags[x]) return true;
			}
			return false;
		}
		public function addFlag(arg:int):void {
			if(!hasFlag(arg)) nippleFlags[nippleFlags.length] = arg;
			else trace("Attempted to add flag " + arg + " to nipples of type " + nippleType + ".");
		}
		public function delFlag(arg:int):void
		{
			//Find and destroy it.
			for(var x:int = 0; x < nippleFlags.length;x++) {
				if(arg == nippleFlags[x]) nippleFlags.splice(x,1);
			}
		}
		public function delAreolaShapeFlags():void
		{
			//Find and destroy it.
			for(var x:int = 0; x < nippleFlags.length;x++) {
				if (nippleFlags[x] == GLOBAL.FLAG_HEART_SHAPED) nippleFlags.splice(x, 1);
				if (nippleFlags[x] == GLOBAL.FLAG_STAR_SHAPED) nippleFlags.splice(x, 1);
			}
		}
		public function clearFlags():void {
			nippleFlags = new Array();
		}
	}
}
