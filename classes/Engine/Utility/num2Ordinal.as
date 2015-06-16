package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function num2Ordinal(number:Number):String
	{
		var tNum:int = Math.abs(Math.round(number));
		
		if (tNum < 0 || tNum > 10)
		{
			return String(tNum + "th");
		}
		
		return words[tNum];
	}
}
	
const words:Array = [
	"zero",
	"first",
	"second",
	"third",
	"fourth",
	"fifth",
	"sixth",
	"seventh",
	"eighth",
	"ninth",
	"tenth"
];