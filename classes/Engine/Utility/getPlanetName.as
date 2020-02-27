package classes.Engine.Utility
{
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Map.InShipInterior;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function getPlanetName(sID:String = "", stylize:Boolean = false):String
	{
		var pName:String = "NONE";
		if (sID == "") sID = (InShipInterior() ? kGAMECLASS.shipLocation : kGAMECLASS.currentLocation);
		if(kGAMECLASS.rooms[sID].planet.length) pName = kGAMECLASS.rooms[sID].planet;
		
		if (pName.indexOf(":") != -1) pName = pName.split(": ")[1];
		
		// Special cases since case conversion can't cover all names
		switch(pName)
		{
			case "POE A": return "Poe A"; break;
			case "UVETO VII": return "Uveto VII"; break;
			case "REDACTED":
			case "UNKNOWN":
			case "N/A":
			case "NONE":
				pName = "";
				if(stylize) pName += "<i>";
				pName += "Unknown";
				if(stylize) pName += "</i>";
				return pName;
				break;
		}
		
		pName = StringUtil.toTitleCase(pName.toLowerCase());
		
		return pName;
	}
}
