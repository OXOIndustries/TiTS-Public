package classes.Util 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import flash.external.ExternalInterface;
	
	public function log(o:Object):void
	{
		if (ExternalInterface.available)
		{
			ExternalInterface.call('console.log', o);
		}
		else
		{
			trace(o);
		}
	}

}