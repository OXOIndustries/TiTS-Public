package  classes
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class StringUtil 
	{
		
		public function StringUtil() 
		{
			
		}
		
		/**
		 * Convert the input string into Title Case Format
		 * @param	value
		 * @return
		 */
		public static function toTitleCase(value:String):String
		{
			if (value == null) return "Null String? :(";
			if (value.length == 0) return "Length 0 String? :(";
			
			var conjunctions:Array = ["the", "of", "a", "an", "and", "or", "nor", "but", "yet", "so", "to", "for", "from", "with", "at", "by"];
			var romanNum:Array = [
				"C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM",
				"X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC",
				"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX",
				];
			
			var w:Array = value.split(" ");
			var q:String = "";
			var r:String = "";
			for (var i:int = 0; i < w.length; i++)
			{
				q = w[i].charAt(0);
				if(q == "'" || q == "‘" || q == "“")
				{
					r = q;
					w[i] = w[i].substr(1);
				}
				if (i == 0 || (conjunctions.indexOf(w[i]) == -1 && romanNum.indexOf(w[i]) == -1))
				{
					if(w[i] == w[i].toLowerCase() && romanNum.indexOf(w[i].toUpperCase()) != -1) w[i] = w[i].toUpperCase();
					else if(r.length > 0) w[i] = r + capitalize(w[i], false);
					else w[i] = capitalize(w[i], false);
				}
				r = "";
			}
			
			return w.join(" ");
		}
		
		/**
		 * Convert the input string into a nicely formatted display string- similar to title case, but avoiding capitalization of certain words
		 * @param	value
		 * @return
		 */
		public static function toDisplayCase(value:String):String
		{
			if (value == null) return "Null String? :(";
			if (value.length == 0) return "Length 0 String? :(";
			
			var conjunctions:Array = ["the", "of", "a", "an", "and", "or", "nor", "but", "yet", "so", "to", "for", "from", "with", "at", "by"];
			var romanNum:Array = [
				"C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM",
				"X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC",
				"I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX",
				];
			
			var w:Array = value.split(" ");
			var q:String = "";
			var r:String = "";
			for (var i:int = 0; i < w.length; i++)
			{
				q = w[i].charAt(0);
				if(q == "'" || q == "‘" || q == "“")
				{
					r = q;
					w[i] = w[i].substr(1);
				}
				if (i == 0 || (conjunctions.indexOf(w[i]) == -1 && romanNum.indexOf(w[i]) == -1))
				{
					if(w[i] == w[i].toLowerCase() && romanNum.indexOf(w[i].toUpperCase()) != -1) w[i] = w[i].toUpperCase();
					else if(r.length > 0) w[i] = r + capitalize(w[i], false);
					else w[i] = capitalize(w[i], false);
				}
				r = "";
			}
			
			return w.join(" ");
		}
		
		/**
		 * Capitalize the first letter in the input string
		 * @param	value
		 * @return
		 */
		public static function capitalize(value:String, forceLower:Boolean = true):String
		{
			var nStr:String = "";
			var q:String = "";
			var r:String = "";
			q = nStr.charAt(0);
			if(q == "‘" || q == "“")
			{
				r = q;
				nStr = nStr.substr(1);
			}
			nStr += value.charAt(0).toUpperCase();
			if (forceLower) nStr += value.substr(1).toLowerCase();
			else nStr += value.substr(1);
			if(r.length > 0) nStr = r + nStr;
			return nStr;
		}
		
		public static function upperCase(str:String, forceLower:Boolean = true):String
		{
			var f:String = str.substr(0, 1);
			var rem:String = str.substr(1, str.length);
			
			if (forceLower) rem = rem.toLowerCase();
			
			return f.toUpperCase() + rem;
		}
		
		// Plus/Minus sign printing
		public static function printPlusMinus(aVal:Number = 0):String
		{
			if (aVal > 0) return String("+" + aVal);
			
			return String(aVal);
		}
	}

}
