package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Ascent
	 */
	public function randInRange(minVal:Number, maxVal:Number):int
	{
		return rand(maxVal - minVal) + minVal;
	}
}