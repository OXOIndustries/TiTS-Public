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
			pName = pName.split(" ")[1];
	
		pName = StringUtil.toTitleCase(pName);
		
		return pName;
	}
}