package
{
	public class breastRowClass
	{
		//constructor
		public function breastRowClass()
		{
		}
		//For cheateyness.
		include "consts.as";
		
		//VARS AHOOOYYY
		public var breasts:Number = 2;
		public var nippleLength:Number = .25;
		public var nippleWidth:Number = .75;
		
		public var nippleType:Number = 0;
		public var breastRating:Number = 0;
		//Fullness used for lactation....if 75 or greater warning bells start going off!
		//If it reaches 100 it reduces lactation multiplier.
		public var fullness:Number = 0;
		public function fuckable():Boolean {
			return (nippleType == FUCKABLE || nippleType == LIPPLES);
		}
	}
}