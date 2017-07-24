package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function CompressToList(entries:Array, and:Boolean = true):String
	{
		if (entries.length == 1) return entries[0];
		
		var ret:String = "";
		var i:int = 0;
		
		while (i < entries.length)
		{
			if (i == 0)
			{
				ret += entries[i];
			}
			else if (i < entries.length - 1)
			{
				ret += ", " + entries[i];
			}
			else
			{
				if (!and || entries[i].indexOf(" ") != -1) ret += ",";
				if (and) ret += " and";
				ret += " " + entries[i];
			}
			i++;
		}
		
		return ret;
	}
}