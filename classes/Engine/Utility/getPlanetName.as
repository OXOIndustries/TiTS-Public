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
			pName = pName.split(": ")[1];
		
		// Special cases since case conversion can't cover all names
		if(pName == "POE A") return "Poe A";
		
		pName = StringUtil.toTitleCase(pName.toLowerCase());
		
		return pName;
	}
}
