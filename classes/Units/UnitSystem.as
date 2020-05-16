package classes.Units
{
	import classes.kGAMECLASS;
	import classes.Engine.Utility.formatFloat;

	public class UnitSystem
	{

		private static const INCH_TO_METER:Number = 0.0254;

		private static const SI_PREFIX_TERA_POWER:int = 12;
		private static const SI_PREFIX_GIGA_POWER:int = 9;
		private static const SI_PREFIX_MEGA_POWER:int = 6;
		private static const SI_PREFIX_KILO_POWER:int = 3;
		private static const SI_PREFIX_NONE_POWER:int = 0;
		private static const SI_PREFIX_CENTI_POWER:int = -2;
		private static const SI_PREFIX_MILLI_POWER:int = -3;
		private static const SI_PREFIX_MICRO_POWER:int = -6;
		private static const SI_PREFIX_NANO_POWER:int = -9;
		private static const SI_PREFIX_PICO_POWER:int = -12;

		private static const SI_PREFIX_CENTI_FACTOR:Number = Math.pow(10, SI_PREFIX_CENTI_POWER);

		public static function isSI():Boolean {
			return kGAMECLASS.gameOptions.siUnits;
		}

		public static function literalInch():String {
			return isSI() ? "centimeter" : "inch";
		}

		public static function literalInches():String {
			return isSI() ? "centimeters" : "inches";
		}

		public static function lengthInInches(inches:Number, sig:int = 1):Number {
			return formatFloat((isSI() ? inches * INCH_TO_METER / SI_PREFIX_CENTI_FACTOR : inches), sig);
		}

		public static function displayHeightInInches(inches:Number):String {
			var sig:uint = isSI() ? 0 : 1;
			var value:Number = lengthInInches(inches, sig);
			var symbol:String = " " + (isSI() ? "centimeter" : "inch");
			if (!(value == 1 || value == 0)) symbol += isSI() ? "s" : "es";

			return value + symbol;
		}

		private static function _lengthInInchesShort(inches:Number, impUnit:String, siUnit:String, impSig:int = 1, siSig:int = 0):String {
			var sig:uint = isSI() ? siSig : impSig;
			var value:Number = lengthInInches(inches, sig);
			var symbol:String = " " + (isSI() ? siUnit : impUnit);

			return value + symbol;
		}

		public static function displayHeightInInchesShort(inches:Number):String {
			return _lengthInInchesShort(inches, "in", "cm");
		}

		public static function displayHeightInInchesShort2(inches:Number):String {
			return _lengthInInchesShort(inches, "\"", "cm");
		}

		public static function displayLengthInInchesShort(inches:Number):String {
			return _lengthInInchesShort(inches, "in", "cm", 1, 1);
		}

		public static function displayLengthInInchesShort2(inches:Number):String {
			return _lengthInInchesShort(inches, "\"", "cm", 1, 1);
		}

		public static function centimeterToInch(centimeters:Number):Number {
			return formatFloat(centimeters / INCH_TO_METER * SI_PREFIX_CENTI_FACTOR, 1);
		}

		public static function inchToCentimeter(inches:Number):Number {
			return formatFloat(inches * INCH_TO_METER / SI_PREFIX_CENTI_FACTOR, 1);
		}
	}
}