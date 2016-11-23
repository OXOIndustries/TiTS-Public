package classes.GameData.Pregnancy.Containers 
{
	import classes.Engine.Utility.weightedRand;
	/**
	 * ...
	 * @author Gedan
	 */
	public class Genders 
	{
		public function Genders(o:Genders = null)
		{
			if (o != null)
			{
				Male = o.Male;
				Female = o.Female;
				Intersex = o.Intersex;
				Neuter = o.Neuter;
			}
			else
			{
				Male = 0;
				Female = 0;
				Intersex = 0;
				Neuter = 0;
			}
		}
		
		public function add(o:Genders):void
		{
			Male += o.Male;
			Female += o.Female;
			Intersex += o.Intersex;
			Neuter += o.Neuter;
		}
		
		public function any():Boolean
		{
			return Male > 0 || Female > 0 || Intersex > 0 || Neuter > 0;
		}
		
		public function get total():int
		{
			return Male + Female + Intersex + Neuter;
		}
		
		public function mf(m:String, f:String):String
		{
			if (Male + Neuter > 0 && Female + Intersex == 0) return m;
			if (Female + Intersex > 0 && Male + Neuter == 0) return f;
			
			var o:Array = [ { w: (Female + Intersex), v: f }, { w: (Male + Neuter), v: m } ];
			return weightedRand(o);
		}
		
		public var Male:int;
		public var Female:int;
		public var Intersex:int;
		public var Neuter:int;
	}

}