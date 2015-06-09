package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.TiTS;
	import classes.kGAMECLASS;
	public function output(msg:String, markdown:Boolean = false, parse:Boolean = true):void
	{
		kGAMECLASS.output(msg, markdown, parse);
	}

}