package classes
{
	import classes.DataManager.Serialization.UnversionedSaveable;
	import classes.ItemSlotClass;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Piercings.*;
	import classes.GLOBAL;
	public class CockClass extends UnversionedSaveable
	{
		//constructor
		public function CockClass()
		{
		}
		//For cheateyness.
		// include "consts.as"
		//data
		//Cock length
		public var cLengthRaw:Number = 5;
		public var cLengthMod:Number = 0;
		
		public function cLength(arg:Number = 0, apply:Boolean = false):Number
		{
			if (apply)
			{
				cLengthRaw = arg;
			}
			else if (arg != 0)
			{
				cLengthRaw += arg;
			}
			
			var currLength:Number = cLengthRaw + cLengthMod;
			
			if (currLength < 0)
			{
				return 0;
			}
			else
			{
				return currLength;
			}
		}
		
		//Cock length - flaccid
		public function cLengthFlaccid():Number
		{
			return cLength() * flaccidMultiplier;
		}
		
		//Cock thickness 
		public var cThicknessRatioRaw:Number = 1;
		public var cThicknessRatioMod:Number = 0;
		
		public function cThicknessRatio(arg:Number = 0, apply:Boolean = false):Number
		{
			if (apply)
			{
				cThicknessRatioRaw = arg;
			}
			else if (arg != 0)
			{
				cThicknessRatioRaw += arg;
			}
			
			var currThickness:Number = cThicknessRatioRaw + cThicknessRatioMod;
			
			if (currThickness < 0)
			{
				return 0; // This might fuck some shit up. Errr.
			}
			else 
			{
				return currThickness;
			}
		}
		
		//Types as defined in consts.as!
		public var cType:Number = 0;
		public var cockColor:String = "pink";
		//Used to determine thickness of knot relative to normal thickness
		public var knotMultiplier:Number = 1;
		public var flaccidMultiplier:Number = .25;
		public var virgin:Boolean = true;
		//Used for flags.
		public var cockFlags:Array = new Array();
		
		//Old CoC Piercing Info that I will fire into a star, most likely.
		public var pierced:Number = 0;
		public var pShort:String = "";
		public var pLong:String = "";
		public var sock:String = "";
		//New piercing hotness:
		public var piercing:ItemSlotClass = new EmptySlot();
		// Cocksock:
		public var cocksock:ItemSlotClass = new EmptySlot();


		//MEMBER FUNCTIONS
		//COCK VOLUME
		public function volume():Number {
			var r:Number = thickness()/2;
			//Abstract size as a cylinder + half sphere for the tip.
			var cylinder:Number = Math.PI * Math.pow(r, 2) * (cLength() - r);

			var tip:Number = (4/3 * Math.PI * Math.pow(r, 3))/2;
			//If blunt, tip is converted to cylinder as well.
			if(hasFlag(GLOBAL.FLAG_BLUNT)) tip = (Math.PI * Math.pow(r, 3));
			//If flared, tip is multiplied by 1.3.
			if(hasFlag(GLOBAL.FLAG_FLARED)) tip = tip * 1.3;
			//If tapered, reduce total by a factor of 75%
			if(hasFlag(GLOBAL.FLAG_TAPERED)) {
				tip = tip * .75;
				cylinder = cylinder * .75;
			}
			//OLD: If double headed, the tip is approximately two half-diameter hemispheres plus a cylinder of full diameter and half height.
			//New PR insanity: If double headed, the tip is approximately two hemispheres on two sides of a isosceles right-angled triangle based prism and this junction's volume what's rounded by a hemishere's surface.
			if(hasFlag(GLOBAL.FLAG_DOUBLE_HEADED))
			{
				//OLD: tip = 2 * (2/3 * Math.PI * thickness()/4 * thickness()/4 * thickness()/4) + (Math.PI * thickness()/2 * thickness()/2 * thickness()/4);
				//new PR insanity: cylinder = Math.PI * Math.pow(r, 2) * (cLength() - Math.SQRT2 * r/2 - r/2);
				tip = 2 * (2/3 * Math.PI * Math.pow(Math.SQRT2 * r/2, 3)) + (0.512 * Math.PI * Math.pow(r, 3));
			}
			return Math.round((tip + cylinder) * 100) / 100;
			//EXAMPLES
			//6x1 = 4.18
			//12x2 = 33.51
			//20x3 = 127.24
		}
		public function thickness():Number {
			return cLength() / 6 * cThicknessRatio();
		}
		public function girth():Number {
			return (thickness() * Math.PI);
		}
		public function fitsSmallCocksock():Boolean
		{
			//These values are meant to be placeholders
			return cLength() < 6 && volume() < 150;
		}
		//EFFECTIVE PENETRATION VOLUME - Not true size, counts other bits.
		public function effectiveVolume():Number {
			var temp:Number = volume();
			if(hasFlag(GLOBAL.FLAG_LUBRICATED) || hasFlag(GLOBAL.FLAG_GOOEY)) temp *= .75;
			if(hasFlag(GLOBAL.FLAG_STICKY)) temp *= 1.25;
			return Math.round(temp * 100) / 100;
		}
		//FLAG CHECKIN!
		public function hasFlag(arg:int):Boolean {
			for(var x:int = 0; x < cockFlags.length;x++) {
				if(arg == cockFlags[x]) return true;
			}
			return false;
		}
		public function addFlag(arg:int):void {
			if(!hasFlag(arg)) cockFlags[cockFlags.length] = arg;
			else trace("Attempted to add flag " + arg + " to cock of type " + cType + ".");
		}
		public function delFlag(arg:int):void
		{
			//Find and destroy it.
			var i:int = (cockFlags.length - 1);
			while (i >= 0)
			{
				if(cockFlags[i] == arg) cockFlags.splice(i, 1);
				i--;
			}
		}
		public function clearFlags():void {
			cockFlags = new Array();
		}
		//LEGACY CoC-GROWTH FUNCTIONS
		public function growCock(increase:Number):Number {
			var amountGrown:Number = 0;
			var temp:Number = 0;
			if(increase > 0) {
				trace("growcock increasing..");
				while(increase > 0) {
					temp = 1;
					//Cut length growth for huge dicked
					if(cLength() > 10 && cType != GLOBAL.TYPE_EQUINE) {
						temp /= 2;
					}
					if(cType == GLOBAL.TYPE_EQUINE && cLength() > 17) temp/=2;
					//Cut again for massively dicked
					if(cType != GLOBAL.TYPE_EQUINE && cLength() > 24) temp/=2;
					if(cType == GLOBAL.TYPE_EQUINE && cLength() > 40) temp/=2;
					//Start adding up bonus cLength
					amountGrown += temp;
					cLength(temp);
					temp = 0;
					increase--;
				}
				increase = 0;
			}
			//Decrease
			if(increase < 0) {
				trace("growcock decreasing..");
				while(increase < 0) {
					temp = -1;
					//Cut cLength growth for huge dicked
					if(cLength() < 5 && cType != 1) {
						temp /= 2;
					}
					//Cut cLength loss, horses lose slower
					if(cType == GLOBAL.TYPE_EQUINE && cLength() < 10) temp/=3;
					else if(cLength() < 10) temp/=2;
					//Cut again for massively dicked
					if(cType == GLOBAL.TYPE_EQUINE && cLength() < 4) temp/=3;
					else if(cLength() < 4) temp/=2;
					if(cType == GLOBAL.TYPE_EQUINE && cLength() < 6) temp/=3;
					else if(cLength() < 6) temp/=2;
					//MINIMUM cLength OF 1!
					if(cLength() == 1) temp = 0;
					//Start adding up bonus cLength
					amountGrown += temp;
					cLength(temp);
					temp = 0;
					increase++;
				}
			}
			return amountGrown;
		}
		public function isCocksockValid(isNoSockValid:Boolean = true):Boolean
		{
			if (cocksock is EmptySlot) return isNoSockValid;
			if (cocksock.hasFlag(GLOBAL.ITEM_FLAG_SMALL_DICK_ONLY) && !fitsSmallCocksock()) return false;
			return true;
		}
	}
}
