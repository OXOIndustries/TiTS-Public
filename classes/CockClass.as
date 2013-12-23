package classes
{
	import classes.GLOBAL;
	public class CockClass
	{
		//constructor
		public function CockClass()
		{
		}
		//For cheateyness.
		// include "consts.as"
		//data
		//Cock length
		public var cLength:Number = 5;
		//Cock thickness 
		public var cThickness:Number = 1;
		//Types as defined in consts.as!
		public var cType:Number = 0;
		//Used to determine thickness of knot relative to normal thickness
		public var knotMultiplier:Number = 1;
		public var flaccidMultiplier:Number = .25;
		public var virgin:Boolean = true;
		//Used for flags.
		private var flags:Array = new Array();
		
		
		//Old CoC Piercing Info that I will fire into a star, most likely.
		public var pierced:Number = 0;
		public var pShort:String = "";
		public var pLong:String = "";		
		public var sock:String = "";
		
		//MEMBER FUNCTIONS
		//COCK VOLUME
		public function volume():Number {
			//Abstract size as a cylinder + half sphere for the tip.
			var cylinder:Number = 3.142 * cThickness/2 * cThickness/2 * (cLength - cThickness);
			var tip:Number = (4/3 * 3.142 * cThickness/2 * cThickness/2 * cThickness/2)/2;
			//If blunt, tip is converted to cylinder as well.
			if(hasFlag(GLOBAL.BLUNT)) tip = (3.142 * cThickness/2 * cThickness/2 * cThickness);
			//If flared, tip is multiplied by 1.3.
			if(hasFlag(GLOBAL.FLARED)) tip = tip * 1.3;
			//If tapered, reduce total by a factor of 75%
			if(hasFlag(GLOBAL.TAPERED)) {
				tip = tip * .75;
				cylinder = cylinder * .75;
			}
			return Math.round((tip + cylinder) * 100) / 100;
			//EXAMPLES
			//6x1 = 4.18
			//12x2 = 33.51
			//20x3 = 127.24
		}
		//EFFECTIVE PENETRATION VOLUME - Not true size, counts other bits.
		public function effectiveVolume():Number {
			var temp:Number = volume();
			if(hasFlag(GLOBAL.LUBRICATED)) temp *= .75;
			if(hasFlag(GLOBAL.STICKY)) temp *= 1.25;
			return Math.round(temp * 100) / 100;
		}
		//FLAG CHECKIN!
		public function hasFlag(arg = undefined):Boolean {
			if(arg == undefined) {
				if(flags.length > 0) return true;
				else return false;
			}
			for(var x:int = 0; x < flags.length;x++) {
				if(arg == flags[x]) return true;
			}
			return false;
		}
		public function addFlag(arg):void {
			if(!hasFlag(arg)) flags[flags.length] = arg;
			else trace("Attempted to add flag " + arg + " to cock of type " + cType + ".");
		}
		public function clearFlags():void {
			flags = new Array();
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
					if(cLength > 10 && cType != 1) {
						temp /= 2;
					}
					if(cType == 1 && cLength > 17) temp/=2;
					//Cut again for massively dicked
					if(cType != 1 && cLength > 24) temp/=2;
					if(cType == 1 && cLength > 40) temp/=2;
					//Start adding up bonus cLength
					amountGrown += temp;
					cLength += temp;
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
					if(cLength < 5 && cType != 1) {
						temp /= 2;
					}
					//Cut cLength loss, horses lose slower
					if(cType == 1 && cLength < 10) temp/=3;
					else if(cLength < 10) temp/=2;
					//Cut again for massively dicked
					if(cType == 1 && cLength < 4) temp/=3;
					else if(cLength < 4) temp/=2;
					if(cType == 1 && cLength < 6) temp/=3;
					else if(cLength < 6) temp/=2;
					//MINIMUM cLength OF 1!
					if(cLength == 1) temp = 0;
					//Start adding up bonus cLength
					amountGrown += temp;
					cLength += temp;
					temp = 0;
					increase++;
				}
				//Cut down thickness if disproportional
				if(cThickness > cLength * .33) cThickness = cLength*.33;
			}
			return amountGrown;
		}
		public function thickenCock(increase:Number) {
			var amountGrown:Number = 0;
			var temp:Number = 0;
			if(increase > 0) {
				while(increase > 0) {
					if(increase < 1) temp = increase;
					else temp = 1;
					//Cut thickness growth for huge dicked
					if(cThickness > 1 && cLength < 12) {
						temp /= 4;
					}
					if(cThickness > 1.5 && cLength < 18) temp /= 5;
					if(cThickness > 2 && cLength < 24) temp /= 5;
					if(cThickness > 3 && cLength < 30) temp /= 5;
					//proportional thickness diminishing returns.
					if(cThickness > cLength * .15) temp /= 3;
					if(cThickness > cLength * .20) temp /= 3;
					if(cThickness > cLength * .30) temp /= 5;
					//massive thickness limiters
					if(cThickness > 4) temp /= 2;
					if(cThickness > 5) temp /= 2;
					if(cThickness > 6) temp /= 2;
					if(cThickness > 7) temp /= 2;
					//Start adding up bonus length
					amountGrown += temp;
					cThickness  += temp;
					temp = 0;
					increase--;
				}
				increase = 0;
				return amountGrown;
			}
			if(increase < 0) {
				while(increase < 0) {
					temp = -1;
					//Cut length growth for huge dicked
					if(cThickness <= 1) temp /= 2;
					if(cThickness < 2 && cLength < 10) temp/=2;
					//Cut again for massively dicked
					if(cThickness < 3 && cLength < 18) temp/=2;
					if(cThickness < 4 && cLength < 24) temp/=2;
					//MINIMUM Thickness of OF .5!
					if(cThickness <= .5) temp = 0;
					//Start adding up bonus length
					amountGrown += temp;
					cThickness += temp;
					temp = 0;
					increase++;
				}
			}
			return amountGrown;
		}
	}
}