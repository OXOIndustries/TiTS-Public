package classes.Engine.Interfaces 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.GameData.EventContainer;
	import classes.kGAMECLASS;
	
	public function AddLogEvent(eventMessage:String, logColor:String = "words", modTimestamp:int = 0):void
	{
		var tEvent:EventContainer = new EventContainer();
		
		tEvent.msg = eventMessage;
		tEvent.style = logColor;
		// When modTimestamp is less than 0 and there are events before this one, place this in chronological order from the previous.
		if (modTimestamp < 0 && kGAMECLASS.timestampedEventBuffer.length > 0)
		{
			kGAMECLASS.timestampedEventBuffer.sortOn("timestamp", Array.NUMERIC);
			var prevEvent:EventContainer = kGAMECLASS.timestampedEventBuffer[kGAMECLASS.timestampedEventBuffer.length - 1];
			tEvent.timestamp = prevEvent.timestamp;
		}
		// Otherwise, place this in the proper time.
		else
		{
			if (modTimestamp < 0) modTimestamp = 0;
			tEvent.timestamp = GetGameTimestamp() + modTimestamp;
		}
		
		kGAMECLASS.timestampedEventBuffer.push(tEvent);
	}

}