package classes 
{
	/**
	 * Getting tired of seeing rand() function defs all over the codebase.
	 * HATCHET DAT SHIT
	 * @author Gedan
	 */
	public function rand(maxValue:Number):Number
	{
		return int(Math.random() * maxValue);
	}
}