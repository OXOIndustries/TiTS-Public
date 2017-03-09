package classes.Engine.ShipCombat.DamageTypes 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DamageFlagTrigger 
	{
		public function DamageFlagTrigger(o:uint, v:Number, op:uint)
		{
			On = o;
			Value = v;
			Operation = op;
		}
		
		public var On:uint;
		public var Value:Number;
		public var Operation:uint;
		
		public function MakeCopy():DamageFlagTrigger
		{
			return new DamageFlagTrigger(On, Value, Operation);
		}
	}

}