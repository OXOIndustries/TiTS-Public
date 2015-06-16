package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.kGAMECLASS;
	public function addButton(slot:int, cap:String = "", func:Function = undefined, arg:* = undefined, ttHeader:String = null, ttBody:String = null):void
	{
		kGAMECLASS.addButton(slot, cap, func, arg, ttHeader, ttBody);
	}

}