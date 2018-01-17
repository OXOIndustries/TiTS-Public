package classes.Engine.Utility
{
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Engine.Map.InShipInterior;
	
	/**
	 * ...
	 * @author Fenoxo, blatantly stolen from Gedan
	 */
	public function getSystemName(sID:String = ""):String
	{
		var pName:String = "NONE";
		if (sID != "") pName = kGAMECLASS.rooms[sID].system;
		else pName = kGAMECLASS.rooms[(InShipInterior() ? kGAMECLASS.shipLocation : kGAMECLASS.currentLocation)].system;
		
		if (pName.indexOf(":") != -1) pName = pName.split(": ")[1];
		
		switch(pName)
		{
			case "REDACTED":
			case "UNKNOWN":
			case "NONE": return "<i>Unknown</i>"; break;
		}
		
		pName = StringUtil.toTitleCase(pName.toLowerCase());
		
		return pName;
	}
}
