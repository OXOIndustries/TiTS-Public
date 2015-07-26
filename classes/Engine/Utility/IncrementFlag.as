package classes.Engine.Utility 
{
	/**
	 * Try and determine if a flag is set.
	 * If it is unset, initialize it.
	 * If it IS set, increment it.
	 * @author Gedan
	 */
	import classes.kGAMECLASS;
	public function IncrementFlag(flagName:String, autoIncrement:Boolean = true):*
	{
		if (kGAMECLASS.flags[flagName] == undefined) kGAMECLASS.flags[flagName] = 0;
		
		if (autoIncrement && kGAMECLASS.flags[flagName] is Number)
		{
			kGAMECLASS.flags[flagName]++;
		}
		
		return kGAMECLASS.flags[flagName];
	}

}