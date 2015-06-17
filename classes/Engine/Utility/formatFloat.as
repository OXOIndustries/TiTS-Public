package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function formatFloat(value:Number, sig:int = 3):Number
	{
		sig = Math.pow(10, sig);
		return Math.round(value * sig) / sig;
	}

}