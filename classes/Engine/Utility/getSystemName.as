package classes.Engine.Utility
{
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Map.InShipInterior;
	
	/**
	 * ...
	 * @author Fenoxo, blatantly stolen from Gedan
	 */
	public function getSystemName(sID:String = "", stylize:Boolean = false):String
	{
		var pName:String = "NONE";
		if (sID != "") pName = kGAMECLASS.rooms[sID].system;
		else pName = kGAMECLASS.rooms[(InShipInterior() ? kGAMECLASS.shipLocation : kGAMECLASS.currentLocation)].system;
		
		if (pName.indexOf(":") != -1) pName = pName.split(": ")[1];
		
		switch(pName)
		{
			case "DEEP SPACE":
				pName = "";
				if(stylize) pName += "<i>";
				pName += "Deep Space";
				if(stylize) pName += "</i>";
				return pName;
				break;
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
