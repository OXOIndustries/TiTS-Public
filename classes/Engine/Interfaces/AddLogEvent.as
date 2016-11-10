package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.GameData.EventContainer;
	import classes.kGAMECLASS;
	
	public function AddLogEvent(eventMessage:String, logColor:String = "words", modTimestamp:uint = 0):void
	{
		var tEvent:EventContainer = new EventContainer();
		
		tEvent.msg = eventMessage;
		tEvent.style = logColor;
		tEvent.timestamp = modTimestamp;
		
		kGAMECLASS.timestampedEventBuffer.push(tEvent);
	}

}