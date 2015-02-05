package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author ...
	 */
	public function num2Text(number: Number): String 
	{
		var returnVar: String = null;
		var numWords:Array = new Array("zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten");
		if (number > 10 || int(number) != number) {
			returnVar = "" + number;
		} else {
			returnVar = numWords[number];
		}
		return (returnVar);
	}

}