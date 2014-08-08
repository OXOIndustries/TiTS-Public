package classes.Util 
{
	import classes.rand;
	
	/**
	 * Return a random element from an array of many elements
	 * @author Gedan
	 */
	public function RandomInCollection(... args):*
	{
		var tar:Array;
		
		if (args.length == 1 && args[0] is Array) tar = args[0];
		else if (args.length > 1) tar = args;
		else throw new Error("RandomInCollection could not determine usage pattern.");
		
		return tar[rand(tar.length)];
	}

}