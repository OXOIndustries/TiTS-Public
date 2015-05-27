package classes.Engine.Utility
{
	import classes.kGAMECLASS;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function getPlanetName():String
	{
		var pName:String = kGAMECLASS.rooms[kGAMECLASS.shipLocation].planet;

		if (pName.indexOf(":") != -1)
			pName = pName.split(" ")[1];
	
		pName = StringUtil.toTitleCase(pName);
		
		return pName;
	}
}