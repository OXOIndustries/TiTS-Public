package classes.Units
{
	import classes.kGAMECLASS;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.num2Text;

	/**
	 * Display automatically values in the correct unit system; Imperial or International (SI).
	 * @author Phillip Daisy Seventh
	 */
	public class UnitSystem
	{

		private static const INCH_TO_METER:Number = 0.0254;
		private static const FOOT_TO_METER:Number = 0.3048;

		private static const POUND_TO_GRAM:Number = 453.59237;

		private static const INCHES_IN_A_FOOT:int = 12;

		private static const FOOT_TO_METER_APROX:Number = formatFloat(FOOT_TO_METER, 1);

		private static const SI_PREFIX_TERA_POWER:int = 12;
		private static const SI_PREFIX_GIGA_POWER:int = 9;
		private static const SI_PREFIX_MEGA_POWER:int = 6;
		private static const SI_PREFIX_KILO_POWER:int = 3;
		private static const SI_PREFIX_HECTO_POWER:int = 2;
		private static const SI_PREFIX_DECA_POWER:int = 1;
		private static const SI_PREFIX_NONE_POWER:int = 0;
		private static const SI_PREFIX_DECI_POWER:int = -1;
		private static const SI_PREFIX_CENTI_POWER:int = -2;
		private static const SI_PREFIX_MILLI_POWER:int = -3;
		private static const SI_PREFIX_MICRO_POWER:int = -6;
		private static const SI_PREFIX_NANO_POWER:int = -9;
		private static const SI_PREFIX_PICO_POWER:int = -12;

		private static const SI_MAX_PREFIX_POWER:int = SI_PREFIX_TERA_POWER;
		private static const SI_MIN_PREFIX_POWER:int = SI_PREFIX_PICO_POWER;

		private static const SI_PREFIX_FACTOR:int = 1000;
		private static const SI_PREFIX_POWER_STEP:int = 3;

		private static const SI_PREFIX_CENTI_FACTOR:Number = Math.pow(10, SI_PREFIX_CENTI_POWER);

		private static const SI_POWER_TO_PREFIX:Object = {}
		SI_POWER_TO_PREFIX[SI_PREFIX_TERA_POWER.toString()] = { name: "tera", symbol: "T" };
		SI_POWER_TO_PREFIX[SI_PREFIX_GIGA_POWER.toString()] = { name: "giga", symbol: "G" };
		SI_POWER_TO_PREFIX[SI_PREFIX_MEGA_POWER.toString()] = { name: "mega", symbol: "M" };
		SI_POWER_TO_PREFIX[SI_PREFIX_KILO_POWER.toString()] = { name: "kilo", symbol: "k" };
		SI_POWER_TO_PREFIX[SI_PREFIX_HECTO_POWER.toString()] = { name: "hecto", symbol: "h" };
		SI_POWER_TO_PREFIX[SI_PREFIX_DECA_POWER.toString()] = { name: "deca", symbol: "da" };
		SI_POWER_TO_PREFIX[SI_PREFIX_NONE_POWER.toString()] = { name: "", symbol: "" };
		SI_POWER_TO_PREFIX[SI_PREFIX_DECI_POWER.toString()] = { name: "deci", symbol: "d" };
		SI_POWER_TO_PREFIX[SI_PREFIX_CENTI_POWER.toString()] = { name: "centi", symbol: "c" };
		SI_POWER_TO_PREFIX[SI_PREFIX_MILLI_POWER.toString()] = { name: "milli", symbol: "m" };
		SI_POWER_TO_PREFIX[SI_PREFIX_MICRO_POWER.toString()] = { name: "micro", symbol: "µ" };
		SI_POWER_TO_PREFIX[SI_PREFIX_NANO_POWER.toString()] = { name: "nano", symbol: "n" };
		SI_POWER_TO_PREFIX[SI_PREFIX_PICO_POWER.toString()] = { name: "pico", symbol: "p" };

		private static function _optimizePrefix(value:Number, minPrefixPower:int = SI_MIN_PREFIX_POWER, maxPrefixPower:int = SI_MAX_PREFIX_POWER, factor:int = SI_PREFIX_FACTOR):Object {
			function r(value:Number, power:int):Object {
				if (value == 0) {
					return {value: 0, power: 0};
				} else if (value >= factor && power < maxPrefixPower) {
					return r(value / factor, power + SI_PREFIX_POWER_STEP);
				} else if (value < 1 && power > minPrefixPower) {
					return r(value * factor, power - SI_PREFIX_POWER_STEP);
				} else {
					return {value: value, power: power}
				}
			}
			return r(value, 0);
		}

		public static function isSI():Boolean {
			return kGAMECLASS.gameOptions.siUnits;
		}

		// = LENGTH ===================================================================================

		// - For using units in a text ----------

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

		// - For converting length from a system to another -

		public static function lengthInInches(inches:Number, sig:int = 1):Number {
			return formatFloat((isSI() ? inches * INCH_TO_METER / SI_PREFIX_CENTI_FACTOR : inches), sig);
		}

		public static function lengthInFeet(feet:Number, sig:int = 1):Number {
			return formatFloat((isSI() ? feet * FOOT_TO_METER / SI_PREFIX_CENTI_FACTOR : feet), sig);
		}

		public static function centimeterToInch(centimeters:Number):Number {
			return formatFloat(centimeters / INCH_TO_METER * SI_PREFIX_CENTI_FACTOR, 1);
		}

		public static function inchToCentimeter(inches:Number):Number {
			return formatFloat(inches * INCH_TO_METER / SI_PREFIX_CENTI_FACTOR, 1);
		}

		// - For printing length in inches ----------

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

		public static function displayPreciseLengthShort2(inches:Number):String {
			var value:Number = lengthInInches(inches, 3);
			var result:String;
			if (isSI()) {
				if (value < 1 / SI_PREFIX_CENTI_FACTOR) {
					result = value + " cm";
				} else {
					var meter:Number = formatFloat(value / (1/SI_PREFIX_CENTI_FACTOR), 3);
					result = meter + " m";
				}
			} else {
				// Feet
				var feet:int = Math.floor(value / INCHES_IN_A_FOOT);
				// Inches
				var inch:int = Math.floor(value % INCHES_IN_A_FOOT);
				var num:String = "";
				var den:String = "";
				if(value % INCHES_IN_A_FOOT > 0)
				{
					// Fractional stuff, proper maffs format! (to the nearest 1/16th inch)
					var fraction:Number = formatFloat((value - Math.floor(value)), 4);
					if(fraction >= 0.0125)
					{
						if(fraction <= 0.0625) { num = "1"; den = "16"; }
						else if(fraction <= 0.125) { num = "1"; den = "8"; }
						else if(fraction <= 0.1875) { num = "3"; den = "16"; }
						else if(fraction <= 0.25) { num = "1"; den = "4"; }
						else if(fraction <= 0.3125) { num = "5"; den = "16"; }
						else if(fraction <= 0.375) { num = "3"; den = "8"; }
						else if(fraction <= 0.4375) { num = "7"; den = "16"; }
						else if(fraction <= 0.5) { num = "1"; den = "2"; }
						else if(fraction <= 0.5625) { num = "9"; den = "16"; }
						else if(fraction <= 0.625) { num = "5"; den = "8"; }
						else if(fraction <= 0.6875) { num = "11"; den = "16"; }
						else if(fraction <= 0.75) { num = "3"; den = "4"; }
						else if(fraction <= 0.8125) { num = "13"; den = "16"; }
						else if(fraction <= 0.875) { num = "7"; den = "8"; }
						else if(fraction <= 0.9375) { num = "15"; den = "16"; }
						else {
							inch++;
							if(inch == INCHES_IN_A_FOOT) { feet++; inch = 0; }
						}
					}
				}
				result = (feet == 0 && (inch > 0 || num != "") ? "" : feet + "'")
					+ (inch > 0 ? (feet > 0 ? " " : "") + inch : "")
					+ (num != "" ? (feet > 0 || inch > 0 ? " " : "") + "<sup>" + num + "</sup>/<sub>" + den + "</sub>" : "")
					+ (inch > 0 || num != "" ? "\"" : "");
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

		// - For printing length in inches with the unit written as a symbol -

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

		// - For printing length in inches with a hyphen between the value and the unit -

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

		// - For printing approximation of length in feet -

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

		// = LENGTH - END =============================================================================


		// = WEIGHT ===================================================================================

		private static function _weightInPounds(pounds:Number):Number {
			return isSI() ? pounds * POUND_TO_GRAM : pounds;
		}

		public static function displayWeightShort(pounds:Number):String {
			var value:Number = _weightInPounds(pounds);
			var result:String;
			if (isSI()) {
				// A power two steps higher than the max can be used, because how the prefix goes two steps down from a megagram to a tonne
				var optValue:Object = _optimizePrefix(value, SI_PREFIX_MILLI_POWER, SI_MAX_PREFIX_POWER + SI_PREFIX_POWER_STEP * 2);
				var unit:String = "g";
				// A megagram [Mg] is a tonne [t]
				if (optValue.power > SI_PREFIX_KILO_POWER) { unit = "t"; optValue.power -= SI_PREFIX_POWER_STEP * 2; }
				result = formatFloat(optValue.value, 3) + " " + SI_POWER_TO_PREFIX[optValue.power.toString()].symbol + unit;
			} else result = formatFloat(value, 3) + " lb";
			return result;
		}

		// = WEIGHT - END =============================================================================

		// = VOLUME ===================================================================================

		// - Liquid volumes -------------------------

		public static function displayLitersShort(milliliters:Number):String {
			var optValue:Object = _optimizePrefix(milliliters / SI_PREFIX_FACTOR);
			return formatFloat(optValue.value, 3) + " " + SI_POWER_TO_PREFIX[optValue.power.toString()].symbol + (isSI() ? "l" : "L");
		}

		// - Solid volumes --------------------------

		private static function _volumeInCubicInches(cubicinches:Number, sig:int = 3):Number {
			return isSI() ? cubicinches * Math.pow(INCH_TO_METER, 3) : cubicinches;
		}

		public static function displayVolumeShort(cubicinches:Number):String {
			var value:Number = _volumeInCubicInches(cubicinches);
			var result:String;
			if (isSI()) {
				var optValue:Object = _optimizePrefix(value, SI_PREFIX_MILLI_POWER, SI_PREFIX_KILO_POWER, Math.pow(SI_PREFIX_FACTOR, 3));
				if (optValue.power == SI_PREFIX_MILLI_POWER) {
					const DECI_IN_MILLI:int = 1000000;
					const CENTI_IN_MILLI:int = 1000;
					if (optValue.value >= DECI_IN_MILLI) { optValue.value /= DECI_IN_MILLI; optValue.power = SI_PREFIX_DECI_POWER; }
					else if (optValue.value >= CENTI_IN_MILLI) { optValue.value /= CENTI_IN_MILLI; optValue.power = SI_PREFIX_CENTI_POWER; }
				} else if (optValue.power == SI_PREFIX_NONE_POWER) {
					const HECTO_IN_METER:int = 1000000;
					const DECA_IN_METER:int = 1000;
					if (optValue.value >= HECTO_IN_METER) { optValue.value /= HECTO_IN_METER; optValue.power = SI_PREFIX_HECTO_POWER; }
					else if (optValue.value >= DECA_IN_METER) { optValue.value /= DECA_IN_METER; optValue.power = SI_PREFIX_DECA_POWER; }
				}
				result = formatFloat(optValue.value, 3) + " " + SI_POWER_TO_PREFIX[optValue.power.toString()].symbol + "m³";
			} else {
				result = formatFloat(value, 3) + " " + "in³";
			}
			return result;
		}

		// = VOLUME - END =============================================================================
	}
}