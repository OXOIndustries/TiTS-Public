package classes 
{
	/**
	 * ...
	 * @author Fake-Name
	 */
	public class TiTS_Settings
	{


		public static var debugBuild:Boolean = true;
		
		// Horrible static abuse FTW
		public static var haltOnErrors:Boolean = false;
		public static var buttonEvents:Array = new Array();
		private static const bufferSize:int = 50;
		
		public static function appendButtonEvent(inString:String):void
		{
			
			TiTS_Settings.buttonEvents.unshift(inString);  // Push the new item onto the head of the array

			if (TiTS_Settings.buttonEvents.length > TiTS_Settings.bufferSize)  // if the array has become too long, pop the last item
			{
				TiTS_Settings.buttonEvents.pop();
			}
		}
		public static function getButtonEvents():String
		{
			var retStr:String = ""
			for (var x:String in TiTS_Settings.buttonEvents)
			{
				retStr += TiTS_Settings.buttonEvents[x] + "\n";
				trace("x = ", x, "Array Val = ", TiTS_Settings.buttonEvents[x]);
			}
			return retStr;
		}
		
		public function TiTS_Settings()
		{

		}
		
	}

}