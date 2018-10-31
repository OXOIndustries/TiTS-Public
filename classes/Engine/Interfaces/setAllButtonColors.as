package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.kGAMECLASS;
	public function setAllButtonColors(asBlue:Boolean = true):void
	{
		for (var i:int = 0; i < 14; i++)
		{
			asBlue ? setButtonBlue(i) : setButtonPurple(i);
		}
	}
}