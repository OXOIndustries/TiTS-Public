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
			var w:Array = value.split(" ");
			for (var i:int = 0; i < w.length; i++)
			{
				w[i] = capitalize(w[i]);
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
			return value.charAt(0).toUpperCase() + value.substr(1);
		}
		
	}

}