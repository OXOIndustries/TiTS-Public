package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function possessive(str:String):String 
	{
		var lastChar:String = str.substr(str.length-1,str.length);
		if(lastChar == "s") str += "'";
		else str += "'s";
		return str;
	}

}