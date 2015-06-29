package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DateContainer 
	{
		public var days:uint;
		public var hours:uint;
		public var minutes:uint;
		
		public function DateContainer(timestamp:uint)
		{
			FromTimestamp(timestamp);
		}
		
		public function FromTimestamp(timestamp:uint):void
		{
			days = uint(timestamp / 1440);
			hours = uint((timestamp - (days * 1440)) / 60);
			minutes = uint((timestamp - (days * 1440) - (hours * 60)));
		}
		
		public function toString():String
		{
			var hstr:String = (hours < 10 ? String("0" + hours.toString()) : hours.toString());
			var mstr:String = (minutes < 10 ? String("0" + minutes.toString()) : minutes.toString());
			return String("Day " + days + " @ " + hstr + ":" + mstr);
		}
	}

}