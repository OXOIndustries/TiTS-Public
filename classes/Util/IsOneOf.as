package classes.Util 
{
	/**
	 * Take an instance of an object and a list of many class type definitions to determine if the class object is one of the types listed.
	 * @author Gedan
	 */
	public function IsOneOf(queryObj:*, ... args):Boolean
	{
		var qList:Array;
		if (args.length > 0 && args[0] is Array) qList = args[0];
		else qList = args;
		
		for (var i:int = 0; i < qList.length; i++)
		{
			if (queryObj is (qList[i] as Class)) return true;
		}
		
		return false;
	}

}