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
			for (var i:int = 0; i < w.length; i++)
			{
				if (i == 0 || (w[i] != "the" && w[i] != "of"))
				{
					w[i] = capitalize(w[i]);
				}
			}
			
			return w.join(" ");
		}
		
		/**
		 * Capitalize the first letter in the input string
		 * @param	value
		 * @return
		 */
		public static function capitalize(value:String):String
		{
			var nStr:String = "";
			nStr += value.charAt(0).toUpperCase();
			nStr += value.substr(1).toLowerCase();
			return nStr;
		}
	}

}