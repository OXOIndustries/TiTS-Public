package classes.Engine.ShipCombat.DamageTypes 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DamageFlagTrigger 
	{
		public function DamageFlagTrigger(o:uint, v:Number, op:uint, autoapply:Boolean = true)
		{
			On = o;
			Value = v;
			Operation = op;
		}
		
		public var On:uint;
		public var Value:Number;
		public var Operation:uint;
		public var AutoApply:Boolean; // Stops the trigger from being executed as normal resolution. Allows us to use triggers to convey values in more complex scenarios.
		
		public function MakeCopy():DamageFlagTrigger
		{
			return new DamageFlagTrigger(On, Value, Operation, AutoApply);
		}
	}

}