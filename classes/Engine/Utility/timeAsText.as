package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function timeAsText(hours:Number, minutes:Number):String
	{
		var b:String = "";
		
		if (hours < 10) b += "0";
		b += String(hours) + ":";
		
		if (minutes < 10) b += "0";
		b += String(minutes);
		
		return b;
	}

}