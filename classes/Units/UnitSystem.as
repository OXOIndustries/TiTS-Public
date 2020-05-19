package classes.Units
{
	import classes.kGAMECLASS;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.num2Text;

	public class UnitSystem
	{

		private static const INCH_TO_METER:Number = 0.0254;
		private static const FOOT_TO_METER:Number = 0.3048;

		private static const INCHES_IN_A_FOOT:int = 12;

		private static const FOOT_TO_METER_APROX:Number = formatFloat(FOOT_TO_METER, 1);

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

		public static function aFoot():String {
			return isSI() ? "30 centimeters" : "a foot";
		}

		public static function halfAFoot():String {
			return isSI() ? "15 centimeters" : "half a foot";
		}

		public static function lengthInInches(inches:Number, sig:int = 1):Number {
			return formatFloat((isSI() ? inches * INCH_TO_METER / SI_PREFIX_CENTI_FACTOR : inches), sig);
		}

		public static function lengthInFeet(feet:Number, sig:int = 1):Number {
			return formatFloat((isSI() ? feet * FOOT_TO_METER / SI_PREFIX_CENTI_FACTOR : feet), sig);
		}


		private static function _displayInches(inches:Number, impSig:int = 1, siSig:int = 1, useNum2Text:Boolean = false):String {
			var sig:uint = isSI() ? siSig : impSig;
			var value:Number = lengthInInches(inches, sig);
			var symbol:String = " " + (isSI() ? "centimeter" : "inch");
			if (!(value == 1 || value == 0)) symbol += isSI() ? "s" : "es";

			return (useNum2Text ? num2Text(value) : value) + symbol;
		}

		public static function displayHeightInInches(inches:Number):String {
			return _displayInches(inches, 1, 0);
		}

		public static function displayHeight(inches:Number, impStrSep:String = ""):String {
			var value:Number = lengthInInches(inches, 0);
			var result:String;
			if (isSI()) {
				if (value < 1 / SI_PREFIX_CENTI_FACTOR) {
					result = value + " centimeter" + (value > 1 ? "s" : "");
				} else {
					var meter:Number = value / (1/SI_PREFIX_CENTI_FACTOR);
					result = meter + " meter" + (meter > 1 ? "s" : "");
				}
			} else {
				var inch:int = value % INCHES_IN_A_FOOT;
				var feet:int = (value - inch) / INCHES_IN_A_FOOT;

				result = (feet == 0 && inch > 0 ? "" : feet + " f" + (feet > 1 ? "ee" : "oo") + "t") + (inch > 0 ? " " + (impStrSep.length > 0 ? impStrSep + " " : "") + inch + " inch" + (inch > 1 ? "es" : "") : "");
			}
			return result;
		}

		public static function displayInches(inches:Number):String {
			return _displayInches(inches);
		}

		public static function displayInchesTextually(inches:Number, sig:uint = 1):String {
			return _displayInches(inches, sig, sig, true);
		}

		public static function inchesEstimate(inches:Number):String {
			return _displayInches(inches, 0, 0);
		}

		public static function inchesEstimateTextual(inches:Number):String {
			return _displayInches(inches, 0, 0, true);
		}


		private static function _displayInchesShort(inches:Number, impUnit:String, siUnit:String, impSig:int = 1, siSig:int = 0):String {
			var sig:uint = isSI() ? siSig : impSig;
			var value:Number = lengthInInches(inches, sig);
			var symbol:String = " " + (isSI() ? siUnit : impUnit);

			return value + symbol;
		}

		public static function displayHeightInInchesShort(inches:Number):String {
			return _displayInchesShort(inches, "in", "cm");
		}

		public static function displayHeightInInchesShort2(inches:Number):String {
			return _displayInchesShort(inches, "\"", "cm");
		}

		public static function displayInchesShort(inches:Number):String {
			return _displayInchesShort(inches, "in", "cm", 1, 1);
		}

		public static function displayInchesShort2(inches:Number):String {
			return _displayInchesShort(inches, "\"", "cm", 1, 1);
		}


		public static function centimeterToInch(centimeters:Number):Number {
			return formatFloat(centimeters / INCH_TO_METER * SI_PREFIX_CENTI_FACTOR, 1);
		}

		public static function inchToCentimeter(inches:Number):Number {
			return formatFloat(inches * INCH_TO_METER / SI_PREFIX_CENTI_FACTOR, 1);
		}


		private static function _displayInchWithHyphen(inches:Number, symbol:String, useNum2Text:Boolean = false, sig:int = 1):String {
			var value:Number = lengthInInches(inches, sig);
			return (useNum2Text ? num2Text(value) : value) + "-" + symbol;
		}

		// Occurence of "-inch"(~280 times) and "-inches"(~13 times) were both found in the codes, but it isn't clear which one should be preferable used.
		// For now this difference is implemented with this two sets of methods.
		public static function displayInchWithHyphen(inches:Number, useNum2Text:Boolean = false, sig:int = 1):String {
			return _displayInchWithHyphen(inches, literalInch(), useNum2Text, sig);
		}

		public static function displayInchWithHyphenTextually(inches:Number, sig:int = 1):String {
			return displayInchWithHyphen(inches, true, sig);
		}

		public static function displayInchesWithHyphen(inches:Number, useNum2Text:Boolean = false, sig:int = 1):String {
			return _displayInchWithHyphen(inches, literalInches(), useNum2Text, sig);
		}

		public static function displayInchesWithHyphenTextually(inches:Number, sig:int = 1):String {
			return displayInchesWithHyphen(inches, true, sig);
		}


		private static function _feetToCentimeterAproximation(feet:Number, sig:int = 1):Number {
			return formatFloat((isSI() ? feet * FOOT_TO_METER_APROX / SI_PREFIX_CENTI_FACTOR : feet), sig);
			}

		private static function _feetEstimate(feet:Number, impSig:int = 1, siSig:int = 1, useNum2Text:Boolean = false):String {
			var sig:uint = isSI() ? siSig : impSig;
			var value:Number = _feetToCentimeterAproximation(feet, sig);
			var symbol:String = " ";
			if (isSI()) {
				// If the value is inferior to 100, display it in centimeters
				if (value <  1 / SI_PREFIX_CENTI_FACTOR) {
					 symbol += "centi";
					} else value = formatFloat(value * SI_PREFIX_CENTI_FACTOR, siSig);
					symbol += "meter" + (!(value == 1 || value == 0) ? "s" : "");
			} else symbol += "f" + (!(value == 1 || value == 0) ? "ee" : "oo") + "t";

			return (useNum2Text ? num2Text(value) : value) + symbol;
		}

		public static function feetEstimate(feet:Number):String {
			return _feetEstimate(feet);
		}

		public static function feetEstimateTextual(feet:Number, sig:uint = 1):String {
			return _feetEstimate(feet, sig, sig, true);
		}
	}
}