package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function logTimeStamp(logColor:String = "words", modTimestamp:uint = 0):String
	{
		import classes.kGAMECLASS;
		return kGAMECLASS.logTimeStamp(logColor, modTimestamp);
	}

}