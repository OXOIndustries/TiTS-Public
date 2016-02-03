package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class MathUtil 
	{
		public static function LinearInterpolate(p1:Number, p2:Number, value:Number):Number
		{
			return p1 + f * (p2 - p1);
		}
		
		public static function Clamp(min:Number, max:Number, value:Number):Number
		{
			if (value < min) return min;
			if (value > max) return max;
			return value;
		}
	}

}