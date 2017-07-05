package classes.Ships.Modules 
{
	import classes.Ships.IOwner;
	/**
	 * ...
	 * @author Gedan
	 */
	public class EngineModule extends ShipModule
	{
		public function EngineModule(owner:IOwner) 
		{
			super(owner);
			
			_agilityBonus = 0.0;
			_agilityMultiplier = 0.0;
			
			_thrustBonus = 0.0;
			_thrustMultiplier = 0.0;
		}
		
		protected var _agilityBonus:Number;
		protected var _agilityMultiplier:Number;
		
		protected var _thrustBonus:Number;
		protected var _thrustMultiplier:Number;
		
		public function get AgilityBonus():Number { return _agilityBonus; }
		public function get AgilityMultiplier():Number { return _agilityMultiplier; }
		
		public function get ThrustBonus():Number { return _thrustBonus; }
		public function get ThrustMultiplier():Number { return _thrustMultiplier; }
	}

}