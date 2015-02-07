package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.kGAMECLASS;
	public function ParseText(msg:String):String
	{
		return kGAMECLASS.parser.recursiveParser(msg, false);
	}

}