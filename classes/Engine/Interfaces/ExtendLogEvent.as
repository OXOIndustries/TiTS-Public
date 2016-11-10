package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.GameData.EventContainer;
	import classes.kGAMECLASS;
	
	public function ExtendLogEvent(msg:String):void
	{
		if (kGAMECLASS.timestampedEventBuffer.length > 0)
		{
			(kGAMECLASS.timestampedEventBuffer[kGAMECLASS.timestampedEventBuffer.length - 1] as EventContainer).msg += msg;
		}
	}

}