package classes.Engine.Utility 
{
	import classes.StringUtil;
	/**
	 * ...
	 * @author ...
	 */
	public function num2Text(number:Number, capitalize:Boolean = false): String 
	{
		var returnVar: String = null;
		var numWords:Array = new Array("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten");
		if (number > 10 || int(number) != number) {
			returnVar = "" + number;
		} else {
			returnVar = numWords[number];
		}
		
		if (capitalize)
		{
			return StringUtil.capitalize(returnVar);
		}
		else
		{
			return returnVar;
		}
		
		
	}

}