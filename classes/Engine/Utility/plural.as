package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function plural(str:String):String 
	{
		//var lastChar: String = str.substr(str.length - 1, str.length);
		//var nextToLastChar: String = str.substr(str.length - 2, str.length - 1);
		var lastChar: String = str.substr(str.length - 1);
		var nextToLastChar: String = str.substr(str.length - 2, 1); //Someone here confused .substr with .substring!
		//Various weird pluralize shits
		if (lastChar == "s") str += "es";
		else if (nextToLastChar == "s" && lastChar == "h") str += "es";
		else if (nextToLastChar == "c" && lastChar == "h") str += "es";
		else if (nextToLastChar != "z" && lastChar == "z") str += "zes";
		else if (lastChar == "x" || lastChar == "z") str += "es";
		//Ends in y and consonant before, ex: pussy -> pussies
		else if (lastChar == "y" && nextToLastChar != "e" && nextToLastChar != "a" && nextToLastChar != "u" && nextToLastChar != "o" && nextToLastChar != "i") 
		{
			var temp:String = str.substr(0, str.length-1);
			str = temp + "ies";
		}
		//Normal pluralizes
		else str += "s";
		return str;
	}

}