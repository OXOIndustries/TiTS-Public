package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function CompressToList(entries:Array):String
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
				ret += ", and " + entries[i];
			}
		}
		
		return ret;
	}
}