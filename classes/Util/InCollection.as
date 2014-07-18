package classes.Util 
{
	/**
	 * Utility function to search for a specific value within a target array or collection of values.
	 * Collection can be supplied either as an existing array or as varargs:
	 * ex: 	InCollection(myValue, myArray)
	 * 		InCollection(myValue, myPossibleValue1, myPossibleValue2, myPossibleValue3)
	 * @param	tar			Target value to search for
	 * @param	... args	Collection to look in
	 * @return				Boolean true/false if found/not found.
	 */
	public function InCollection(tar:*, ... args):Boolean
	{
		if (args.length == 0) return false;
		
		var collection:*;
		
		for (var ii:int = 0; ii < args.length; ii++)
		{
			collection = args[ii];
			
			if (!(collection is Array))
			{
				if (tar == collection) return true;
			}
			else
			{
				for (var i:int = 0; i < collection.length; i++)
				{
					if (tar == collection[i]) return true;
				}
			}
		}
		
		return false;
	}
}