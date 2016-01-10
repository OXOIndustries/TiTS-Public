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
			
			var w:Array = value.split(" ");
			var q:String = "";
			var r:String = "";
			for (var i:int = 0; i < w.length; i++)
			{
				q = w[i].charAt(0);
				if(q == "‘" || q == "“")
				{
					r = q;
					w[i] = w[i].splice(0, 1);
				}
				if (i == 0 || (w[i] != "the" && w[i] != "of"))
				{
					if(r.length > 0) w[i] = r + capitalize(w[i], false);
					else w[i] = capitalize(w[i], false);
				}
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
			
			var w:Array = value.split(" ");
			var q:String = "";
			var r:String = "";
			for (var i:int = 0; i < w.length; i++)
			{
				q = w[i].charAt(0);
				if(q == "‘" || q == "“")
				{
					r = q;
					w[i] = w[i].splice(0, 1);
				}
				if (i == 0 || (w[i] != "the" && w[i] != "of" && w[i] != "a" && w[i] != "an" && w[i] != "and" && w[i] != "or" && w[i] != "nor" && w[i] != "but" && w[i] != "yet" && w[i] != "so" && w[i] != "to" && w[i] != "for" && w[i] != "from" && w[i] != "with" && w[i] != "at" && w[i] != "by"))
				{
					if(r.length > 0) w[i] = r + capitalize(w[i], false);
					else w[i] = capitalize(w[i], false);
				}
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
			nStr += value.charAt(0).toUpperCase();
			if (forceLower) nStr += value.substr(1).toLowerCase();
			else nStr += value.substr(1);
			return nStr;
		}
		
		public static function upperCase(str:String, forceLower:Boolean = true):String
		{
			var f:String = str.substr(0, 1);
			var rem:String = str.substr(1, str.length);
			
			if (forceLower) rem = rem.toLowerCase();
			
			return f.toUpperCase() + rem;
		}
	}

}
