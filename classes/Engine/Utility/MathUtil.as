package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class MathUtil 
	{
		public static function LinearInterpolate(p1:Number, p2:Number, f:Number):Number
		{
			return p1 + f * (p2 - p1);
		}
		
		public static function Clamp(min:Number, max:Number, f:Number):Number
		{
			if (f < min) return min;
			if (f > max) return max;
			return f;
		}
	}

}