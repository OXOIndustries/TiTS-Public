package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	
	
	public function GetGameTimestamp():uint
	{
		import classes.kGAMECLASS;
		return kGAMECLASS.GetGameTimestamp();
	}

}