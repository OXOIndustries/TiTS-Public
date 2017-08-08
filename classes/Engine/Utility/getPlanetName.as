package classes.Engine.Utility
{
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Map.InShipInterior;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function getPlanetName():String
	{
		var pName:String = kGAMECLASS.rooms[(InShipInterior() ? kGAMECLASS.shipLocation : kGAMECLASS.currentLocation)].planet;
		
		if (pName.indexOf(":") != -1) pName = pName.split(": ")[1];
		
		// Special cases since case conversion can't cover all names
		switch(pName)
		{
			case "POE A": return "Poe A"; break;
			case "UVETO VII": return "Uveto VII"; break;
			case "NONE": return "<i>Unknown</i>"; break;
		}
		
		pName = StringUtil.toTitleCase(pName.toLowerCase());
		
		return pName;
	}
}
