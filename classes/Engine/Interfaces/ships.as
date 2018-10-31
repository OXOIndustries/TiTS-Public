package classes.Engine.Interfaces 
{
	import classes.GameData.ShipManager;
	import classes.kGAMECLASS;
	/**
	 * ...
	 * @author Gedan
	 */
	public function ships():ShipManager
	{
		return kGAMECLASS.shipDb;
	}

}