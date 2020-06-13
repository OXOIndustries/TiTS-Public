package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.kGAMECLASS;
	import classes.ItemSlotClass;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Piercings.*;
	public class VaginaClass extends UnversionedSaveable
	{
		//constructor
		public function VaginaClass(vag:Boolean = true)
		{
			if(!vag) 
			{
				clits = 0;
				wetnessRaw = 0;
				hymen = false;
			}
		}
		
		//For cheateyness.
		//include "consts.as";
		//data
		//Type
		//As per type constants in consts.as
		public var type:int = 0;
		//This should be obvious!
		public var hymen:Boolean = true;
		//I'm going to regret this, I'm sure of it.
		public var clits:int = 1;
		public var vaginaColor:String = "pink";
		//Vag wetness - Runs 1 = normal. Scales up infinitely or down to 0 for no lubricational value.
		public var wetnessRaw:Number = 1;
		public var wetnessMod:Number = 0;
		public function wetness(arg:Number = 0, apply:Boolean = false):Number
		{
			if (apply)
			{
				wetnessRaw = arg;
			}
			else if (arg != 0)
			{
				wetnessRaw += arg;
				if(wetnessRaw > 5) wetnessRaw = 5;
				if(wetnessRaw < 0) wetnessRaw = 0;
			}
			
			var currWet:Number = wetnessRaw + wetnessMod;
			
			if(hasFlag(GLOBAL.FLAG_LUBRICATED)) currWet += 2;
			if(piercing is OpalRingPiercing) currWet += 1;
			if(clitPiercing is OpalRingPiercing) currWet += 1;
			
			if (currWet < 0)
			{
				return 0;
			}
			else
			{
				return currWet;
			}
		}
		
		//Starts at one and scales up to 5 or so.
		public var loosenessRaw:Number = 1;
		public var loosenessMod:Number = 0;
		public function looseness(arg:Number = 0, apply:Boolean = false):Number
		{
			if (apply)
			{
				loosenessRaw = arg;
			}
			else if (arg != 0)
			{
				loosenessRaw += arg;
			}
			
			var currLoose:Number = loosenessRaw + loosenessMod;
			
			if (currLoose < 0.5)
			{
				return 0.5;
			}
			else if (currLoose > 5) // or so :V
			{
				return 5;
			}
			else
			{
				return currLoose;
			}
		}
		
		//Looseness naturally lowers over time, but will not go below minimum looseness. You can become "ruined".
		public var minLooseness:Number = 1;
		//Self evident - bonus volume of dick that can be accomodated. Measured in cubic inches.
		public var bonusCapacity:Number = 0;
		//Shrink counter - counts up to see if its time to recover from some stretching.
		public var shrinkCounter:int = 0;
		
		//Used for storage of the flags from consts.as
		public var vagooFlags:Array = new Array();
		
		//Used during sex to determine how full it currently is.  For multi-dick sex.
		private var fullness:Number = 0;
		
		//Temporary CoC-style piercings which will likely be discarded into the void of space.
		public var labiaPierced:Number = 0;
		public var labiaPShort:String = "";
		public var labiaPLong:String = "";
		public var clitPierced:Number = 0;
		public var clitPShort:String = "";
		public var clitPLong:String = "";

		//New piercing hotness:
		public var piercing:ItemSlotClass = new EmptySlot();
		//New piercing hotness:
		public var clitPiercing:ItemSlotClass = new EmptySlot();
		
		//FLAG CHECKIN!
		public function hasFlag(arg:int):Boolean {
			for(var x:int = 0; x < vagooFlags.length;x++) {
				if(arg == vagooFlags[x]) return true;
			}
			return false;
		}
		public function addFlag(arg:int):void {
			if(!hasFlag(arg)) vagooFlags[vagooFlags.length] = arg;
			else trace("Attempted to add flag " + arg + " to vagina of type " + type + ".");
		}
		public function delFlag(arg:int):void
		{
			//Find and destroy it.
			var i:int = (vagooFlags.length - 1);
			while (i >= 0)
			{
				if(vagooFlags[i] == arg) vagooFlags.splice(i, 1);
				i--;
			}
		}
		public function clearFlags():void {
			vagooFlags = new Array();
		}
	}
}