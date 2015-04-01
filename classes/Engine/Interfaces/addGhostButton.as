package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.kGAMECLASS;
	public function addGhostButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
	{
		kGAMECLASS.addGhostButton(slot, cap, func, arg, ttHeader, ttBody);
	}

}