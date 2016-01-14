package classes.Engine.Utility
{
	import classes.kGAMECLASS;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fenoxo, blatantly stolen from Gedan
	 */
	public function getSystemName():String
	{
		var pName:String = kGAMECLASS.rooms[kGAMECLASS.shipLocation].system;

		if (pName.indexOf(":") != -1)
			pName = pName.split(": ")[1];
	
		if (pName == "REDACTED") pName = "<i>Unknown</i>";
		else pName = StringUtil.toTitleCase(pName.toLowerCase());
		
		return pName;
	}
}
