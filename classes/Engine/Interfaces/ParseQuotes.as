package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author ...
	 */
	import classes.kGAMECLASS;
	
	public function ParseQuotes(msg:String):String
	{
		return kGAMECLASS.parser.makeQuotesPrettah(msg);
	}
}